unit AbiturientBeforeZachislenieListProcs;
{#Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, AbiturientBaseProcs,ADOdb,db, ApplicationController, ExceptionBase;

type
  TBeforeZachislenieListEditExc = class(EApplicationException)
  public
    constructor Create;
  end;

  TBeforeZachislenieListGetExc = class(EApplicationException)
  public
    constructor Create;
  end;

  //редактируем состояние зачисления
  TBeforeZachislenieListEdit = class (TEditProc)
  public
    procedure EditData(nn_abit,ik_zach:integer;realy_postup:OleVariant);
    constructor Create(AOwner: TComponent); override;
  end;
  //получаем список для проведения зачисления/формирования предварительных списков
  TBeforeZachislenieListGet = class (TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
    procedure GetData(nnyear:integer);
  end;

  //формируем список для word-а
  TBeforeZachislenieListForWordGet = class (TGetProc)
  public
    procedure  GetData(nnyear:integer;ik_spec_fac:integer);
    constructor Create(AOwner: TComponent); override;
  end;

  //состояния зачисления
  TBeforeZachislenieSostGet = class (TGetProc)
  public
    procedure  GetData();
    constructor Create(AOwner: TComponent); override;
  end;

  //специальность-факультет(по потокам)
  TBeforeZachislenieSpecFacGet = class (TGetProc)
  public
    procedure  GetData(nnyear:integer);
    constructor Create(AOwner: TComponent); override;
  end;

  //специальность-факультет отправить в приказ
  TBeforeZachislenieToPrikazGet = class (TGetProc)
  public
    procedure  EditData(nnrecord:integer);
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{
************************** TBeforeZachislenieListEdit **************************
}
constructor TBeforeZachislenieListEdit.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Edit_postup_abit_Zach';
end;

Procedure TBeforeZachislenieListEdit.EditData(nn_abit,ik_zach:integer;realy_postup:OleVariant);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@nn_abit',ftBCD,pdInput,0,nn_abit);
    Parameters.CreateParameter('@ik_zach',ftBCD,pdInput,0,ik_zach);
    Parameters.CreateParameter('@realy_postup',ftBCD,pdInput,0,realy_postup);
    ExecProc;
  except
    raise TBeforeZachislenieListEditExc.Create;
  end;
end;

{
************************** TBeforeZachislenieListGet ***************************
}
constructor TBeforeZachislenieListGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_Abit_ForZachislenie';
end;

procedure TBeforeZachislenieListGet.GetData(nnyear:integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@nnyear',ftBCD,pdInput,0,nnyear);
    ExecProc;
    Active:=true;
  except
    raise TBeforeZachislenieListGetExc.Create;
  end;
end;
{
************************** TBeforeZachislenieListForWordGet ***************************
}
constructor TBeforeZachislenieListForWordGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_postup_predvspiski ';
end;

procedure TBeforeZachislenieListForWordGet.GetData(nnyear:integer;ik_spec_fac:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@nnyear',ftBCD,pdInput,0,nnyear);
    Parameters.CreateParameter('@ik_spec_fac',ftBCD,pdInput,0,ik_spec_fac);
    ExecProc;
    Active:=true;
  except
    raise TBeforeZachislenieListGetExc.Create;
  end;
end;

{
************************** TBeforeZachislenieSostGet ***************************
}
constructor TBeforeZachislenieSostGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_sost_predvspiski ';
end;

procedure TBeforeZachislenieSostGet.GetData();
begin
 try
    Active:=false;
    ExecProc;
    Active:=true;
  except
    raise TBeforeZachislenieListGetExc.Create;
  end;
end;

{
************************** TBeforeZachislenieSpecFacGet ***************************
}
constructor TBeforeZachislenieSpecFacGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_specfacRealy_predvspiski ';
end;

procedure TBeforeZachislenieSpecFacGet.GetData(nnyear:integer);
begin
 try
    Active:=false;
    parameters.Clear;
    Parameters.CreateParameter('@nnyear',ftBCD,pdInput,0,nnyear);
    ExecProc;
    Active:=true;
  except
    raise TBeforeZachislenieListGetExc.Create;
  end;
end;

{
************************** TBeforeZachislenieToPrikazGet  ***************************
}
constructor TBeforeZachislenieToPrikazGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Edit_ToPrikaz_predvspiski';
end;

procedure TBeforeZachislenieToPrikazGet.EditData(nnrecord:integer);
begin
 try
    Active:=false;
    parameters.Clear;
    Parameters.CreateParameter('@nnrecord',ftBCD,pdInput,0,nnrecord);
    ExecProc;
  except
    raise TBeforeZachislenieListGetExc.Create;
  end;
end;


{ TBeforeZachislenieListEditExc }

constructor TBeforeZachislenieListEditExc.Create;
begin
  inherited Create('Не удалось изменить данные зачисления абитуриента');
end;


{ TBeforeZachislenieListGetExc }

constructor TBeforeZachislenieListGetExc.Create;
begin
  inherited Create('Не удалось получить данные зачисления абитуриента');
end;



end.
