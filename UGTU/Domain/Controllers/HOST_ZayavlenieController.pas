{-----------------------------------------------------------
  ������ HOST_ZayavlenieController:
      THOST_ZayavlenieController - ���������� ����������
      "���������" ��������� ������
  ���� ��������: 19.04.2010
  ���� ���������� ���������:
  �����������: �������� �.�.
-----------------------------------------------------------}
unit HOST_ZayavlenieController;
 {#Author tanyav@ist.ugtu.net}
interface
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, GeneralController, Grids,
  ExcelXP, ComObj, DBGrids, uDMAbiturientRasp, uDMAbiturientNabor,
  DBGridEh, ApplicationController, ExceptionBase, uHOST;

type
  PDBGrid = ^TDBGridEh;
  THOST_ZayavlenieController = class (TObject)
  protected
    constructor CreateInstance;
 //AccessInstance ������������� ������ � ���������� �����������
    class function AccessInstance(Request: Integer):
       THOST_ZayavlenieController;

  public
    constructor Create;
  //Instance - ���������� �������� ������� �����������
    class function Instance: THOST_ZayavlenieController;
  //ReleaseInstance - ���������� ����������
    class procedure ReleaseInstance;

    //**********��� ����������****************

  procedure AddDateUtv(IDZayavlenie,IDStatusZayav:integer;DataUtv:tdatetime);

     function AddDateVidOrdera(nCode,IDZayavlenie:integer;DataVid,DataUtv:tdatetime;IDStatusZayav:integer): boolean;
      procedure NaznRoom(ik_address:integer;DateBegin:tdatetime;ik_AddressType,nCode:integer);
      procedure VivodRoom(NumHostel:integer);
      procedure VivodProj(ik_address:integer);
      procedure AddPrikOZas(IDZayavlenie,Ik_prikaz:integer);
      procedure ZamenaRoom(ik_address,nCode:integer);
      procedure AddZayavNaZas(DataPodachi:tdatetime;nCode,NumHostel:integer);
     end;

implementation
var
  FHOST_ZayavlenieControllerInstance: THOST_ZayavlenieController = nil;

constructor THOST_ZayavlenieController.CreateInstance;
begin
  inherited Create;
end;


constructor THOST_ZayavlenieController.Create;
begin
  inherited Create;
  raise EApplicationException.Create('������ � ������ %s ����� �������� ������ ����� ���� Instance!');
end;


class function THOST_ZayavlenieController.AccessInstance(Request: Integer): THOST_ZayavlenieController;
begin
  case Request of
    0 : ;
    1 : if not Assigned(FHOST_ZayavlenieControllerInstance) then
      FHOST_ZayavlenieControllerInstance:= CreateInstance;
    2 : if FHOST_ZayavlenieControllerInstance <> nil then
          begin
            FHOST_ZayavlenieControllerInstance.Free;
            FHOST_ZayavlenieControllerInstance:= nil;
          end;
    else raise EApplicationException.Create('������ � ���������!',Exception.CreateFmt('����������� �������� ��������� %d � ������ AccessInstance ����������� AbitZachislenieController', [Request]));
  end;  Result := FHOST_ZayavlenieControllerInstance;
end;


class function THOST_ZayavlenieController.Instance: THOST_ZayavlenieController;
begin
  Result := AccessInstance(1);
end;

class procedure THOST_ZayavlenieController.ReleaseInstance;
begin
   AccessInstance(2);
end;

//*********���� �����������**********

procedure THOST_ZayavlenieController.AddDateUtv(IDZayavlenie,IDStatusZayav:integer;DataUtv:tdatetime);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('���������� ���� ������������ ���������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    //LockType:=ltBatchOptimistic;
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_AddDateUtv;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@IDZayav',ftBCD,pdInput,0,IDZayavlenie); 
			Parameters.CreateParameter('@IDStatusZayav',ftBCD,pdInput,0,IDStatusZayav);
			Parameters.CreateParameter('@Date',ftBCD,pdInput,0,DataUtv);
      ExecProc;
    end;
  finally
    tempStoredProc.Free;
  end;
end;

function THOST_ZayavlenieController.AddDateVidOrdera(nCode,IDZayavlenie:integer;DataVid,DataUtv:tdatetime;IDStatusZayav:integer): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('���������� ���� ������ ������ ��� ����������� ���������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    //LockType:=ltBatchOptimistic;
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_AddDataVidOrdera;1';
      Active:=false;
      Parameters.Clear;
      Parameters.CreateParameter('@RETURN_VALUE',ftBCD,pdReturnValue,0,0);
			Parameters.CreateParameter('@nCode',ftBCD,pdInput,0,nCode);
      Parameters.CreateParameter('@IDZayav',ftBCD,pdInput,0,IDZayavlenie);
			Parameters.CreateParameter('@DataVid',ftdatetime,pdInput,0,DataVid);
			Parameters.CreateParameter('@Date',ftdatetime,pdInput,0,DataUtv);
			Parameters.CreateParameter('@IDStatusZayav',ftBCD,pdInput,0,IDStatusZayav);


      ExecProc;
      result := (Parameters.ParamByName('@RETURN_VALUE').Value>-1);
    end;
  finally
    tempStoredProc.Free;
  end;
end;

procedure THOST_ZayavlenieController.NaznRoom(ik_address:integer;DateBegin:tdatetime;ik_AddressType,nCode:integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('��������� �������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    //LockType:=ltBatchOptimistic;
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_NaznRoom;1';
      Active:=false;
      Parameters.Clear;
      Parameters.CreateParameter('@RETURN_VALUE',ftInteger,pdReturnValue,0,0);
			Parameters.CreateParameter('@ik_address',ftBCD,pdInput,0,ik_address);
			Parameters.CreateParameter('@DateBegin',ftdatetime,pdInput,0,DateBegin);
			Parameters.CreateParameter('@ik_AddressType',ftBCD,pdInput,0,ik_AddressType);
			Parameters.CreateParameter('@nCode',ftBCD,pdInput,0,nCode);
      ExecProc;


      if (tempStoredProc.Parameters.ParamByName('@RETURN_VALUE').Value<0) then
        raise Exception.Create('��������� ������ ��� ��������� � �������.');

    end;
  finally
    tempStoredProc.Free;
  end;
end;

procedure THOST_ZayavlenieController.VivodRoom(NumHostel:integer);

begin
 TApplicationController.GetInstance.AddLogEntry('����� ������� ������ � ���������� ��������� (���-�� ����/����� ���-�� ����).');
    with dmHOST.ProcRoomForZas do
    begin
      Close;
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_RoomForZas;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@NumHost',ftBCD,pdInput,0,NumHostel);
      Open;
    end;
end;

procedure THOST_ZayavlenieController.VivodProj(ik_address:integer);

begin
 TApplicationController.GetInstance.AddLogEntry('����� ����������� � ���������� �������.');
    with dmHOST.ProcProjInRoom do
    begin
      Close;
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_ProjInRoom;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@ik_address',ftBCD,pdInput,0,ik_address);
      Open;
    end;
end;

procedure THOST_ZayavlenieController.AddPrikOZas(IDZayavlenie,Ik_prikaz:integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('���������� ������� ��� ��������� ' +IntToStr(IDZayavlenie));
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_AddPrikOZas;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@IDZayav',ftBCD,pdInput,0,IDZayavlenie);
			Parameters.CreateParameter('@Ik_prikaz',ftBCD,pdInput,0,Ik_prikaz);
      ExecProc;
    end;
  finally
    tempStoredProc.Free;
  end;
end;

procedure THOST_ZayavlenieController.AddZayavNaZas(DataPodachi: tdatetime;
  nCode, NumHostel: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('���������� ��������� �� ���������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_AddZayavNaZas;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@DataPod',ftdatetime,pdInput,0,DataPodachi);
 			Parameters.CreateParameter('@nCode',ftBCD,pdInput,0,nCode);
 			Parameters.CreateParameter('@NumHost',ftBCD,pdInput,0,NumHostel);
      ExecProc;
    end;
  finally
    tempStoredProc.Free;
  end;
end;

procedure THOST_ZayavlenieController.ZamenaRoom(ik_address,nCode:integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('������ ������ ������� ��������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_ZamenaRoom;1';
      Active:=false;
      Parameters.Clear;
      Parameters.CreateParameter('@RETURN_VALUE',ftInteger,pdReturnValue,0,0);
			Parameters.CreateParameter('@ik_address',ftBCD,pdInput,0,ik_address);
 			Parameters.CreateParameter('@nCode',ftBCD,pdInput,0,nCode);
      ExecProc;
       if (tempStoredProc.Parameters.ParamByName('@RETURN_VALUE').Value<0) then
        raise Exception.Create('��������� ������ ��� ��������� � �������.');
    end;
  finally
    tempStoredProc.Free;
  end;
end;

end.
