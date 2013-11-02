unit AbiturientListsBeforeExamProcs;
{#Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, AbiturientBaseProcs,ADODB, db, ApplicationController, ExceptionBase;

type
  EListGetException = class(EApplicationException)
  public
    constructor Create;
  end;

  EListEditException = class(EApplicationException)
  public
    constructor Create;
  end;

  EListDeleteException = class(EApplicationException)
  public
    constructor Create;
  end;

  //������� ����������� �� ������
  TAbitListDeleteProc = class (TDeleteProc)
  public
    procedure DeleteData(id:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //��������� ������
  TAbitListEditProc = class (TEditProc)
  public
    procedure EditData(id,id_rasp_kab:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //�������� ������ ������������
  TAbitListGetProc = class (TGetProc)
  public
    procedure GetData(ik_disc:OleVariant;ik_sdach:OleVariant;id_rasp:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //�������� ������ �������������-��������� ��� ����������� ������ ������������
  TAbitListGetSpecFacProc = class (TGetProc)
  public
    procedure GetData(ik_disc:OleVariant;ik_sdach:OleVariant;id_rasp_kab:OleVariant);
    constructor Create(AOwner: TComponent); override;
  end;
implementation
{
******************************* TAbitListGetProc *******************************
}
constructor TAbitListGetProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_vstup_ekz_Spisok';
end;

procedure TAbitListGetProc.GetData(ik_disc:OleVariant;ik_sdach:OleVariant;id_rasp:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ik_disc',ftBCD,pdInput,0,ik_disc);
    Parameters.CreateParameter('@ik_sdach',ftBCD,pdInput,0,ik_sdach);
    Parameters.CreateParameter('@id_rasp',ftBCD,pdInput,0,id_rasp);
    ExecProc;
    Active:=true;
  except
    raise EListGetException.Create;
  end;
end;

{
******************************* TAbitListGetSpecFacProc *******************************
}
constructor TAbitListGetSpecFacProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_vstup_ekz_Spisok_SF';
end;

procedure TAbitListGetSpecFacProc.GetData(ik_disc:OleVariant;ik_sdach:OleVariant;id_rasp_kab:OleVariant);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ik_disc',ftBCD,pdInput,0,ik_disc);
    Parameters.CreateParameter('@ik_sdach',ftBCD,pdInput,0,ik_sdach);
    Parameters.CreateParameter('@id_rasp_kab',ftBCD,pdInput,0,id_rasp_kab);
    ExecProc;
    Active:=true;
  except
    raise EListGetException.Create;
  end;
end;

{
***************************** TAbitListDeleteProc ******************************
}
constructor TAbitListDeleteProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Edit_vstup_ekz_id_rasp_kab';
end;

procedure TAbitListDeleteProc.DeleteData(id:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id',ftBCD,pdInput,0,id);
    ExecProc;
  except
    raise EListDeleteException.Create;
  end;
end;

{
****************************** TAbitListEditProc *******************************
}
constructor TAbitListEditProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Edit_vstup_ekz_set_rasp';
end;

procedure TAbitListEditProc.EditData(id,id_rasp_kab:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id',ftBCD,pdInput,0,id);
    Parameters.CreateParameter('@id_rasp_kab',ftBCD,pdInput,0,id_rasp_kab);
    ExecProc;
  except
    raise EListEditException.Create;
  end;
end;

{ EListGetException }

constructor EListGetException.Create;
begin
  inherited Create('�� ������� ������� ������ ��� ������������ ������');
end;

{ EListEditException }

constructor EListEditException.Create;
begin
  inherited Create('�� ������� �������� ������ ��� ������������ ������');
end;

{ EListDeleteException }

constructor EListDeleteException.Create;
begin
  inherited Create('�� ������� ������� ������ �� ������');
end;
end.
