{-----------------------------------------------------------
  ������ HOST_ProjivayushieController:
      THOST_ProjivayushieController - ���������� ����������
      "���������" �����������,�������
  ���� ��������: 30.04.2010
  ���� ���������� ���������:
  �����������: �������� �.�.
-----------------------------------------------------------}
unit HOST_ProjivayushieController;
 {#Author llodigina@ist.ugtu.net}
interface
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, GeneralController, Grids,
  ExcelXP, ComObj, DBGrids, uDMAbiturientRasp, uDMAbiturientNabor,
  DBGridEh, ApplicationController, ExceptionBase, uHOST,uDMStudentSelectionProcs;

type
  PDBGrid = ^TDBGridEh;
  THOST_ProjivayushieController = class (TObject)
  protected
    constructor CreateInstance;
 //AccessInstance ������������� ������ � ���������� �����������
    class function AccessInstance(Request: Integer):
       THOST_ProjivayushieController;

  public
    constructor Create;
  //Instance - ���������� �������� ������� �����������
    class function Instance: THOST_ProjivayushieController;
  //ReleaseInstance - ���������� ����������
    class procedure ReleaseInstance;

    //**********��� ����������****************
     procedure AddRoom(NumHostel,KolMest,NumEtazh,FlatNumber:integer);
     procedure VivodEtazh(NumHostel:integer);
     procedure DeleteFromvVklSpisRoom(ik_address:integer);
     procedure IzmKolMest(ik_address,KolMest:integer);
     procedure Viselit(nCode,PrikazOVis,Ik_pric:integer;DateEnd:tdatetime);
     procedure VivodPerson(Ik_grup:integer);
     procedure VivodAdressPerson(nCode:integer);
     procedure VivodDocPerson(nCode:integer);
     procedure VivodInventPerson(nCode:integer);
     procedure VivodRegistrPerson(nCode:integer);
     procedure VivodRoom(NumEtazh:integer);
     procedure VivodNarushPoObj(NumHostel:integer);
     procedure VivodPersonPoNarush(IDNarushenie:integer);
     function AddNarushenie(DataNurush:tdatetime;IDVidNurush:integer): integer;
     procedure AddNarushiteley(IDNarushenie,nCode:integer);
     procedure DeleteNarushiteley(IDNarushenie:integer);
     procedure UpdateNarushiteley(IDNarushenie:integer;DataNurush:tdatetime;IDVidNurush:integer);
     procedure DeleteFromSpisokNarush(IDNarushenie:integer);
     function AddZayavNaProdlProj(DataPodachi:tdatetime;nCode,NumHostel:integer): integer;
     procedure AddZayavNaZasInRoom(IDZayavlenie,ik_address:integer);
     end;

implementation
var
  FHOST_ProjivayushieControllerInstance: THOST_ProjivayushieController = nil;

constructor THOST_ProjivayushieController.CreateInstance;
begin
  inherited Create;
end;


constructor THOST_ProjivayushieController.Create;
begin
  inherited Create;
  raise EApplicationException.Create('������ � ������ %s ����� �������� ������ ����� ���� Instance!');
end;


class function THOST_ProjivayushieController.AccessInstance(Request: Integer): THOST_ProjivayushieController;
begin
  case Request of
    0 : ;
    1 : if not Assigned(FHOST_ProjivayushieControllerInstance) then
      FHOST_ProjivayushieControllerInstance:= CreateInstance;
    2 : if FHOST_ProjivayushieControllerInstance <> nil then
          begin
            FHOST_ProjivayushieControllerInstance.Free;
            FHOST_ProjivayushieControllerInstance:= nil;
          end;
    else raise EApplicationException.Create('������ � ���������!',Exception.CreateFmt('����������� �������� ��������� %d � ������ AccessInstance ����������� AbitZachislenieController', [Request]));
  end;  Result := FHOST_ProjivayushieControllerInstance;
end;


class function THOST_ProjivayushieController.Instance: THOST_ProjivayushieController;
begin
  Result := AccessInstance(1);
end;

class procedure THOST_ProjivayushieController.ReleaseInstance;
begin
   AccessInstance(2);
end;

 //*********���� �����������**********

procedure THOST_ProjivayushieController.UpdateNarushiteley(IDNarushenie:integer;DataNurush:tdatetime;IDVidNurush:integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('�������������� ���������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_UpdateNarushenie;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@IDNarushenie',ftBCD,pdInput,0,IDNarushenie);
			Parameters.CreateParameter('@DataNurush',ftdatetime,pdInput,0,DataNurush);
 			Parameters.CreateParameter('@IDVidNurush',ftBCD,pdInput,0,IDVidNurush);
      ExecProc;
    end;
  finally
    tempStoredProc.Free;
  end;
end;


function THOST_ProjivayushieController.AddNarushenie(DataNurush:tdatetime;IDVidNurush:integer): integer;
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('���������� ������ ���������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_AddNarushenie;1';
      Active:=false;
      Parameters.Clear;
      Parameters.CreateParameter('@RETURN_VALUE',ftBCD,pdReturnValue,0,0);
			Parameters.CreateParameter('@DataNurush',ftdatetime,pdInput,0,DataNurush);
 			Parameters.CreateParameter('@IDVidNurush',ftBCD,pdInput,0,IDVidNurush);
      ExecProc;
    end;
  result:=tempStoredProc.Parameters.ParamByName('@RETURN_VALUE').Value;
  finally
    tempStoredProc.Free;
  end;
end;

procedure THOST_ProjivayushieController.AddNarushiteley(IDNarushenie,nCode: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('���������� ����� �������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_AddNarushiteley;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@IDNarushenie',ftBCD,pdInput,0,IDNarushenie);
 			Parameters.CreateParameter('@nCode',ftBCD,pdInput,0,nCode);
      ExecProc;
    end;
  finally
    tempStoredProc.Free;
  end;
end;

procedure THOST_ProjivayushieController.AddRoom(NumHostel,KolMest,NumEtazh,FlatNumber:integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('���������� ����� �������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_AddRoom;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@NumHostel',ftBCD,pdInput,0,NumHostel);
 			Parameters.CreateParameter('@KolMest',ftBCD,pdInput,0,KolMest);
 			Parameters.CreateParameter('@NumEtazh',ftBCD,pdInput,0,NumEtazh);
 			Parameters.CreateParameter('@FlatNumber',ftBCD,pdInput,0,FlatNumber);
      ExecProc;
    end;
  finally
    tempStoredProc.Free;
  end;
end;

function THOST_ProjivayushieController.AddZayavNaProdlProj(DataPodachi: tdatetime; nCode, NumHostel: integer): integer;
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('���������� ��������� �� ��������� ����������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_AddZayavNaProdlProj;1';
      Active:=false;
      Parameters.Clear;
      Parameters.CreateParameter('@RETURN_VALUE',ftBCD,pdReturnValue,0,0);
			Parameters.CreateParameter('@DataPodachi',ftdatetime,pdInput,0,DataPodachi);
 			Parameters.CreateParameter('@nCode',ftBCD,pdInput,0,nCode);
 			Parameters.CreateParameter('@NumHostel',ftBCD,pdInput,0,NumHostel);
      ExecProc;
    end;
  result:=tempStoredProc.Parameters.ParamByName('@RETURN_VALUE').Value;
  finally
    tempStoredProc.Free;
  end;
end;

procedure THOST_ProjivayushieController.AddZayavNaZasInRoom(IDZayavlenie,ik_address: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('���������� ����� �������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_AddZayavNaZasInRoom;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@IDZayavlenie',ftBCD,pdInput,0,IDZayavlenie);
 			Parameters.CreateParameter('@ik_address',ftBCD,pdInput,0,ik_address);
      ExecProc;
    end;
  finally
    tempStoredProc.Free;
  end;
end;

procedure THOST_ProjivayushieController.VivodAdressPerson(nCode: integer);
begin
 TApplicationController.GetInstance.AddLogEntry('����� ������ �������.');
    with dmStudentSelectionProcs.aspGetPersonAddress do
    begin
      Close;
      Connection:= dm.DBConnect;
      ProcedureName:= 'GetPersonAddress;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@nCode',ftBCD,pdInput,0,nCode);
      Open;
    end;
end;

procedure THOST_ProjivayushieController.VivodDocPerson(nCode: integer);
begin
 TApplicationController.GetInstance.AddLogEntry('����� ���������� �������.');
    with dmStudentSelectionProcs.aspSelDocuments do
    begin
      Close;
      Connection:= dm.DBConnect;
      ProcedureName:= 'SelDocuments;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@nCode',ftBCD,pdInput,0,nCode);
      Open;
    end;
end;

procedure THOST_ProjivayushieController.VivodEtazh(NumHostel:integer);
begin
 TApplicationController.GetInstance.AddLogEntry('����� ������� ������ � ���������� ���������.');
    with dmHOST.ProcVivodEtazhPoObj do
    begin
      Close;
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_VivodEtazhPoObj;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@NumHost',ftBCD,pdInput,0,NumHostel);
      Open;
    end;
end;

procedure THOST_ProjivayushieController.VivodInventPerson(nCode: integer);
 begin
TApplicationController.GetInstance.AddLogEntry('����� ��������� �������.');
    with dmHOST.ProcVivodInvent do
    begin
      Close;
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_VivodInvent;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@nCode',ftBCD,pdInput,0,nCode);
      Open;
    end;
end;

procedure THOST_ProjivayushieController.VivodNarushPoObj(NumHostel: integer);
begin
TApplicationController.GetInstance.AddLogEntry('����� ��������� �� ���������.');
    with dmHOST.ProcVivodNurushPoOb do
    begin
      Close;
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_VivodNurushPoObj;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@NumHost',ftBCD,pdInput,0,NumHostel);
      Open;
    end;
end;

procedure THOST_ProjivayushieController.DeleteFromSpisokNarush(IDNarushenie: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('�������� ��������� �� ������� ������ ���������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_DelFromVklSpisNarush;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@IDNarushenie',ftBCD,pdInput,0,IDNarushenie);
      ExecProc;
    end;
  finally
    tempStoredProc.Free;
  end;
end;

procedure THOST_ProjivayushieController.DeleteFromvVklSpisRoom(ik_address:integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('�������� �������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_DelFromVklSpisRoom;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@ik_address',ftBCD,pdInput,0,ik_address);
      ExecProc;
    end;
  finally
    tempStoredProc.Free;
  end;
end;

procedure THOST_ProjivayushieController.DeleteNarushiteley(IDNarushenie: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('�������� ����������� �� ���������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_DeleteNarushiteley;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@IDNarushenie',ftBCD,pdInput,0,IDNarushenie);
      ExecProc;
    end;
  finally
    tempStoredProc.Free;
  end;
end;

procedure THOST_ProjivayushieController.IzmKolMest(ik_address,KolMest:integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('�������������� �������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_IzmKolMest;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@ik_address',ftBCD,pdInput,0,ik_address);
			Parameters.CreateParameter('@KolMest',ftBCD,pdInput,0,KolMest);
      ExecProc;
    end;
  finally
    tempStoredProc.Free;
  end;
end;

procedure THOST_ProjivayushieController.Viselit(nCode,PrikazOVis,Ik_pric:integer;DateEnd:tdatetime);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('��������� �������.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_ViselitPersony;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@nCode',ftBCD,pdInput,0,nCode);
			Parameters.CreateParameter('@PrikOVis',ftBCD,pdInput,0,PrikazOVis);
			Parameters.CreateParameter('@IDPrich',ftBCD,pdInput,0,Ik_pric);
			Parameters.CreateParameter('@DateEnd',ftdatetime,pdInput,0,DateEnd);
      ExecProc;
    end;
  finally
    tempStoredProc.Free;
  end;
end;

procedure THOST_ProjivayushieController.VivodPerson(Ik_grup:integer);
begin
 TApplicationController.GetInstance.AddLogEntry('����� ��������� ������������ ������.');
    with dmHOST.ProcVivodPersonFormGroup do
    begin
      Close;
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_VivodPersonFormGroup;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@Ik_grup',ftBCD,pdInput,0,Ik_grup);
      Open;
    end;
end;

procedure THOST_ProjivayushieController.VivodPersonPoNarush(IDNarushenie: integer);
begin
TApplicationController.GetInstance.AddLogEntry('����� ������ �� ���������.');
    with dmHOST.ProcPersonPoNarush do
    begin
      Close;
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_PersonPoNarush;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@IDNarushenie',ftBCD,pdInput,0,IDNarushenie);
      Open;
    end;
end;

procedure THOST_ProjivayushieController.VivodRegistrPerson(nCode: integer);
begin
 TApplicationController.GetInstance.AddLogEntry('����� ����������� �������.');
    with dmHOST.ProcRegistrPers do
    begin
      Close;
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_RegistrPers;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@nCode',ftBCD,pdInput,0,nCode);
      Open;
    end;
end;

procedure THOST_ProjivayushieController.VivodRoom(NumEtazh: integer);
begin
 TApplicationController.GetInstance.AddLogEntry('����� ������ �� �����.');
    with dmHOST.ProcVivodRoomPoEtazh do
    begin
      Close;
      Connection:= dm.DBConnect;
      ProcedureName:= 'HOST_VivodRoomPoEtazh;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@NumEtazh',ftBCD,pdInput,0,NumEtazh);
      Open;
    end;
end;

end.
