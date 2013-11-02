unit AbiturientExamProcs;
{#Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, AbiturientBaseProcs,ADODB, db, ApplicationController, ExceptionBase;

type
  TExamBallsEditException = class(EApplicationException)
  public
    constructor Create;
  end;

  //сохраняем оценки
  TExamBallsEditProc = class (TEditProc)
  public
    procedure EditData(id:integer;cosenka:string;nnvedom:string);
    constructor Create(AOwner: TComponent); override;
  end;
  //выводим данные всех экзаменов
  TExamAnySpisokProc = class (TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //выводим специальности
  TExamSpecProc = class (TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //выводим факультеты
  TExamFacProc = class (TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
implementation


{
****************************** TExamBallsEditProc *******************************
}
constructor TExamBallsEditProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Edit_vstup_ekz_set_osenka';
end;

procedure TExamBallsEditProc.EditData(id:integer;cosenka:string;nnvedom:string);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id',ftBCD,pdInput,0,id);
    Parameters.CreateParameter('@cosenka',ftstring,pdInput,20,cosenka);
    Parameters.CreateParameter('@nnvedom',ftstring,pdInput,20,nnvedom);
    ExecProc;
  except
    raise TExamBallsEditException.Create;
  end;
end;

{
****************************** TExamAnySpisokProc *******************************
}
constructor TExamAnySpisokProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_vstup_ekz_AnySpisok';
end;
{
****************************** TExamSpecProc *******************************
}
constructor TExamSpecProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_spec';
end;
{
****************************** TExamFacProc *******************************
}
constructor TExamFacProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_fac';
end;

{ EListEditException }

constructor TExamBallsEditException.Create;
begin
  inherited Create('Не удалось изменить данные оценок за экзамен');
end;

end.
