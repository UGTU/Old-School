unit AbiturientOrderProcs;
 {#Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, AbiturientBaseProcs,ADOdb,db, ApplicationController, ExceptionBase;

type
  TOrderGetExc = class(EApplicationException)
  public
    constructor Create;
  end;

  TOrderGetProc = class (TGetProc)
  public
    procedure GetData(nnyear:integer;ik_fac:integer; ik_spec_fac:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  

procedure Register;

implementation

procedure Register;
begin
end;

{
******************************** TOrderGetProc *********************************
}
constructor TOrderGetProc.Create(AOwner: TComponent);
begin
 inherited;
 procedurename:='ABIT_GetPrikaz'
end;

procedure TOrderGetProc.GetData(nnyear: integer;ik_fac:integer; ik_spec_fac:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@nnyear',ftBCD,pdInput,0,nnyear);
    Parameters.CreateParameter('@ik_fac',ftBCD,pdInput,0,ik_fac);
    Parameters.CreateParameter('@ik_spec_fac',ftBCD,pdInput,0,ik_spec_fac);
    ExecProc;
    Active:=true;
  except
    raise TOrderGetExc.Create;
  end;
end;

{ TBeforeZachislenieListGetExc }

constructor TOrderGetExc.Create;
begin
  inherited Create('Не удалось получить данные');
end;
end.
