{-----------------------------------------------------------
  ������ uDecanatKontingController:
      uDecanatKontingController - ���������� ����������
      "��������" - ����������
  ���� ��������: 03.05.2008
  ���� ���������� ���������:
  �����������: ������� �.�.
-----------------------------------------------------------}
unit uDiplomOtdelKadrController;

interface                                                    
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, GeneralController, Grids,
  ExcelXP, ComObj, DBGrids, uDMUspevaemost, ComCtrls, DateUtils,
  udmUgtuStructure, DBGridEh, uDiplOKadr;
 type
  PDBGrid = ^TDBGridEh;
  TDecanatKontingController = class (TObject)
  protected
    constructor CreateInstance;
 //AccessInstance ������������� ������ � ���������� �����������
    class function AccessInstance(Request: Integer):
       TDecanatKontingController;

  public
    constructor Create;
  //Instance - ���������� �������� ������� �����������
    class function Instance: TDecanatKontingController;
  //ReleaseInstance - ���������� ����������
    class procedure ReleaseInstance;

//*********��������������� ����������*********************
//CreateDiplom �������� ������� � ������ ������ (���� ������, ������, ���. �����)
function CreateDiplom(SourceDataSet: PDataSet; grid: PDBGrid): boolean;



end;

implementation
 var
//FAbitZachislenieControllerInstance - ��������� �����������
  FTDecanatKontingControllerInstance: TDecanatKontingController = nil;

constructor TDecanatKontingController.CreateInstance;
begin
  inherited Create;
end;

constructor TDecanatKontingController.Create;
begin
  inherited Create;
  raise Exception.CreateFmt('������ � ������ %s ����� �������� ������ ����� ���� Instance!', [ClassName]);
end;


class function TDecanatKontingController.AccessInstance(
  Request: Integer): TDecanatKontingController;
begin
  case Request of
    0 : ;
    1 : if not Assigned(FTDecanatKontingControllerInstance) then
      FTDecanatKontingControllerInstance:= CreateInstance;
    2 : if FTDecanatKontingControllerInstance <> nil then
          begin
            FTDecanatKontingControllerInstance.Free;
            FTDecanatKontingControllerInstance:= nil;
          end;
    else raise Exception.CreateFmt('����������� �������� ��������� %d � ������ AccessInstance ����������� TUspevGroupController', [Request]);
  end;  Result := FTDecanatKontingControllerInstance;
end;

class function TDecanatKontingController.Instance: TDecanatKontingController;
begin
  Result := AccessInstance(1);
end;

class procedure TDecanatKontingController.ReleaseInstance;
begin
   AccessInstance(2);
end;












//*********��������������� ����������*********************
//�������� ������� � ������ ������ (���� ������, ������, ���. �����)
function TDecanatKontingController.CreateDiplom(SourceDataSet: PDataSet; grid: PDBGrid): boolean;

  //dataSet:TADODataSet;
begin

  result:=false;
  if grid.SelectedRows.Count=0 then
      exit;

   //��������, ����� ��� ���������� �������� ��� ��
   //���� ��������� � ���� � ����� �������������
  { for i := 0 to grid.SelectedRows.Count-1 do
   begin
      FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[I]));
      if (FAbitListDataSetInstance.FieldByName('nn_zach').Value<>NULL) then
      begin
        raise Exception.Create('�� ������� �����������, ������� ��� ��� ��������!');
        exit;
      end;
      if i=0 then
         spec:=FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value
      else
      begin
         if spec<>FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value then
         begin
            raise Exception.Create('�� ������� ������������ ������ ��������������! ���������� �� � ���� ������ ����������!');
            exit;
         end;
      end;
   end;   }

  if frmDiplomOKadr=nil then
    frmDiplomOKadr:=TfrmDiplomOKadr.create(nil);
  frmDiplomOKadr.Tag:=SourceDataSet.FieldByName('ik_zach').Value;
  //frmDiplomOKadr.studname:=SourceDataSet.FieldByName('NameStud').AsString;
  frmDiplomOKadr.ShowModal;
  frmDiplomOKadr.Free;

//������� ������ � �������� ��� ��� � �������������
  {frmJoinGroup:=TfrmJoinGroup.create(nil);
  FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[0]));
  frmJoinGroup.domspec:= FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value;
  frmJoinGroup.year:= FAbitListDataSetInstance.FieldByName('NNyear').Value;
  frmJoinGroup.EditMode:= false;
  frmJoinGroup.AbitCount:= grid.SelectedRows.Count;
  frmJoinGroup.ShowModal;
  if  frmJoinGroup.mrOk then
  begin
    nzach:= frmJoinGroup.eNum.Text;
//���������, ����� ���������� ������ ������� ��� �� ����
    if Abit_IsOldZach(nzach) then
    begin
      raise Exception.Create('�� ������ ��� ������������ ����� �������!');
      exit;
    end;

   sort:= TADODataSet(FAbitListDataSetInstance).Sort;
   if grid.SelectedRows.Count>1 then
       //��������� �� ���
      TADODataSet(FAbitListDataSetInstance).Sort:= 'fio';

   group:= frmJoinGroup.DbcbeGroup.KeyValue;
   //order:= frmJoinGroup.dbcbeOrder.KeyValue;
   groupName:= frmJoinGroup.DbcbeGroup.Text;
   try
//�������� ����������
      dm.DBConnect.BeginTrans;
      //��������� � ������ ������
      for i := 0 to grid.SelectedRows.Count-1 do
      begin

//���������, ����� ���������� ������ ������� ��� �� ����
        if Abit_IsOldZach(nzach) then
        begin
          raise Exception.Create('�� ������ ��� ������������ ����� �������!');
          dm.DBConnect.RollbackTrans;
          exit;
        end;

        FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[I]));

      //������� ����� ������� (�����)
        ik_zach:= Abit_CreateRecordBook(FAbitListDataSetInstance.FieldByName('nCode').Value, nzach);

      //��������� �������� � ������
        Abit_CreateStudGrup(FAbitListDataSetInstance.FieldByName('nCode').Value,
            group, ik_zach,
            FAbitListDataSetInstance.FieldByName('ik_kat_zach').Value,
            frmJoinGroup.dbcbeOrder.KeyValue,
            frmJoinGroup.dbcbeCause.KeyValue,
            groupName,'');

        //���������� ����� �� 1 ������
        nZach:= IntToStr(StrToInt(nZach)+1);
      //���������� �� 6 ������ � ������
        while length(nZach)<6 do
          nZach:='0'+nZach;

      end;
//��������� ���������
      dm.DBConnect.CommitTrans;
    except
      raise Exception.Create('�������� ������!');
      dm.DBConnect.RollbackTrans;
    end;
    //���������� ������� ����������
    TADODataSet(FAbitListDataSetInstance).Sort:= sort;
  end;
  frmJoinGroup.Free;
  FAbitListDataSetInstance.Next;   }
end;


end.
