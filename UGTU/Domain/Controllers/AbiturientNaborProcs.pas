unit AbiturientNaborProcs;
  {#Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, AbiturientBaseProcs,ADODB, db, ApplicationController, ExceptionBase;

type
  ENaborGetException = class(EApplicationException)
  public
    constructor Create;
  end;

  ENaborAddException = class(EApplicationException)
  public
    constructor Create;
  end;

  ENaborDelException = class(EApplicationException)
  public
    constructor Create;
  end;

  ENaborEditException = class(EApplicationException)
  public
    constructor Create;
  end;

  //выборка данных набора
  TAbitNaborDataProc = class (TGetProc)
  public
    procedure GetData(nnyear:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //выборка годов
  TAbitNaborDataYearsProc = class (TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //добавление набора
  TAbitNaborAddProc = class (TAddProc)
  public
    function AddData(ik_spec_fac,BeginDiapazon,EndDiapazon,NNYear,MestCKP,MestBudjet,MestKontrakt:integer): integer;
    constructor Create(AOwner: TComponent); override;
  end;
  //редактирование набора
  TAbitNaborEditProc = class (TEditProc)
  public
    procedure EditData(ik_spec_fac,BeginDiapazon,EndDiapazon,NNYear,MestCKP,MestBudjet,MestKontrakt:integer;NNrecord:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //удаление набора
  TAbitNaborDelProc = class (TDeleteProc)
  public
    procedure DelData(NNrecord:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //получение последнего nnrecord  ABIT_get_diap
  TAbitNaborgetlastNNrecordProc = class (TGetProc)
  public
    function GetData():integer;
    constructor Create(AOwner: TComponent); override;
  end;
  //для получения графика по динамике подачи заявлений по годам
  TAbitDinamicaProc = class (TGetProc)
  public
    function GetData():integer;
    constructor Create(AOwner: TComponent); override;
  end;
  //для получения графика по динамике пола по годам
  TAbitDinamica_onSexProc = class (TGetProc)
  public
    function GetData():integer;
    constructor Create(AOwner: TComponent); override;
  end;
  //для получения графика по динамике ФДП по годам
  TAbitDinamica_onFDPProc = class (TGetProc)
  public
    function GetData():integer;
    constructor Create(AOwner: TComponent); override;
  end;
  //для получения графика по динамике медалей по годам
  TAbitDinamica_onMedalProc = class (TGetProc)
  public
    function GetData():integer;
    constructor Create(AOwner: TComponent); override;
  end;
  //для получения графика по динамике заявлений по годам
  TAbitDinamica_onZayavlProc = class (TGetProc)
  public
    function GetData():integer;
    constructor Create(AOwner: TComponent); override;
  end;
 //для получения графика по динамике общежитий по годам
  TAbitDinamicaOnLobProc = class (TGetProc)
  public
    function GetData():integer;
    constructor Create(AOwner: TComponent); override;
  end;
 //для получения данных стенда по дням
  TAbitStendDataProc = class (TGetProc)
  public
    function GetData(nnyear:integer;date:tdatetime):integer;
    constructor Create(AOwner: TComponent); override;
  end;

  //для получения общих данных набора по дням
  TAbitYearDataProc = class (TGetProc)
  public
    function GetData(nnyear:integer;date:tdatetime):integer;
    constructor Create(AOwner: TComponent); override;
  end;

  //для получения общих данных набора по дням и по формам отчетов
  TAbitYearDataProcVF = class (TGetProc)
  public
    function GetData(day_begin,day_end:tdatetime;idreport,bit,year:integer):integer;
    constructor Create(AOwner: TComponent); override;
  end;

implementation
{
******************************* TAbitNaborDataProc *******************************
}
constructor TAbitNaborDataProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_nabor_Get';
end;

procedure TAbitNaborDataProc.GetData(nnyear:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@nnyear',ftBCD,pdInput,0,nnyear);
    ExecProc;
    Active:=true;
  except
    raise ENaborGetException.Create;
  end;
end;

{
******************************* TAbitNaborDataYearsProc *******************************
}
constructor TAbitNaborDataYearsProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_nabor_NNYears';
end;

{
******************************* TAbitNaborAddProc *******************************
}
constructor TAbitNaborAddProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Add_Diapazon';
end;

function TAbitNaborAddProc.AddData(ik_spec_fac,BeginDiapazon,EndDiapazon,NNYear,MestCKP,MestBudjet,MestKontrakt:integer): integer;
begin
 try
    Active:=false;
    Parameters.Clear;
    //LockType:=ltBatchOptimistic;
    Parameters.CreateParameter('@ik_spec_fac',ftBCD,pdInput,0,ik_spec_fac);
    Parameters.CreateParameter('@BeginDiapazon',ftBCD,pdInput,0,BeginDiapazon);
    Parameters.CreateParameter('@EndDiapazon',ftBCD,pdInput,0,EndDiapazon);
    Parameters.CreateParameter('@NNYear',ftBCD,pdInput,0,NNYear);
    Parameters.CreateParameter('@MestCKP',ftBCD,pdInput,0,MestCKP);
    Parameters.CreateParameter('@MestBudjet',ftBCD,pdInput,0,MestBudjet);
    Parameters.CreateParameter('@MestKontrakt',ftBCD,pdInput,0,MestKontrakt);
    Parameters.CreateParameter('@NNrecord',ftInteger,pdOutput,0,0);
    ExecProc;
    Result := Parameters.ParamByName('@NNrecord').Value;
  except
    raise ENaborAddException.Create;
  end;
end;

{
******************************* TAbitNaborEditProc *******************************
}
constructor TAbitNaborEditProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Edit_Diapazon';
end;

procedure TAbitNaborEditProc.EditData(ik_spec_fac,BeginDiapazon,EndDiapazon,NNYear,MestCKP,MestBudjet,MestKontrakt:integer;NNrecord:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ik_spec_fac',ftBCD,pdInput,0,ik_spec_fac);
    Parameters.CreateParameter('@BeginDiapazon',ftBCD,pdInput,0,BeginDiapazon);
    Parameters.CreateParameter('@EndDiapazon',ftBCD,pdInput,0,EndDiapazon);
    Parameters.CreateParameter('@NNYear',ftBCD,pdInput,0,NNYear);
    Parameters.CreateParameter('@MestCKP',ftBCD,pdInput,0,MestCKP);
    Parameters.CreateParameter('@MestBudjet',ftBCD,pdInput,0,MestBudjet);
    Parameters.CreateParameter('@MestKontrakt',ftBCD,pdInput,0,MestKontrakt);
    Parameters.CreateParameter('@nnrecord',ftBCD,pdInput,0,nnrecord);
    ExecProc;
  except
    raise ENaborEditException.Create;
  end;
end;

{
******************************* TAbitNaborDelProc *******************************
}
constructor TAbitNaborDelProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Del_Diapazon';
end;

procedure TAbitNaborDelProc.DelData(NNrecord:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@nnrecord',ftBCD,pdInput,0,nnrecord);
    ExecProc;
  except
    raise ENaborDelException.Create;
  end;
end;

{
******************************* TAbitNaborgetlastNNrecordProc *******************************
}
constructor TAbitNaborgetlastNNrecordProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_get_diap';
end;

function TAbitNaborgetlastNNrecordProc.getData():integer;
begin
result:=0;
 try
    Active:=false;
    Parameters.Clear;
    ExecProc;
    Active:=true;
    first;
    while not eof do
     begin
      getData:=fields[0].AsInteger;
      next;
     end;
  except
    raise ENaborDelException.Create;
  end;
end;

{ EListGetException }

constructor ENaborGetException.Create;
begin
  inherited Create('Не удалось извлечь данные для формирования данных набора');
end;

{ EListAddException }

constructor ENaborAddException.Create;
begin
  inherited Create('Не удалось добавить данные для формирования набора');
end;

{ EListDelException }

constructor ENaborDelException.Create;
begin
  inherited Create('Не удалось удалить данные набора');
end;

{ EListEditException }

constructor ENaborEditException.Create;
begin
  inherited Create('Не удалось редактировать данные набора');
end;

{ TAbitDinamicaProc }

constructor TAbitDinamicaProc.Create(AOwner: TComponent);
begin
  inherited;
 procedurename:='ABIT_Get_dinamicaNabor';
end;

function TAbitDinamicaProc.GetData: integer;
begin
result:=0;
  try
    Active:=false;
    ExecProc;
    Active:=true;
  except
    raise ENaborGetException.Create;
  end;
end;

{ TAbitDinamica_onSexProc }

constructor TAbitDinamica_onSexProc.Create(AOwner: TComponent);
begin
  inherited;
  procedurename:='ABIT_get_onsex';
end;

function TAbitDinamica_onSexProc.GetData: integer;
begin
result:=0;
 try
    Active:=false;
    ExecProc;
    Active:=true;
  except
    raise ENaborGetException.Create;
  end;
end;

{ TAbitDinamica_onFDPProc }

constructor TAbitDinamica_onFDPProc.Create(AOwner: TComponent);
begin
  inherited;
  procedurename:='ABIT_get_onFDP';
end;

function TAbitDinamica_onFDPProc.GetData: integer;
begin
result:=0;
 try
    Active:=false;
    ExecProc;
    Active:=true;
  except
    raise ENaborGetException.Create;
  end;
end;

{ TAbitDinamica_onMedalProc }

constructor TAbitDinamica_onMedalProc.Create(AOwner: TComponent);
begin
  inherited;
  procedurename:='ABIT_get_onMedal';
end;

function TAbitDinamica_onMedalProc.GetData: integer;
begin
result:=0;
 try
    Active:=false;
    ExecProc;
    Active:=true;
  except
    raise ENaborGetException.Create;
  end;
end;

{ TAbitDinamica_onZayavlProc }

constructor TAbitDinamica_onZayavlProc.Create(AOwner: TComponent);
begin
  inherited;
   procedurename:='ABIT_get_onZayavl';
end;

function TAbitDinamica_onZayavlProc.GetData: integer;
begin
result:=0;
  try
    Active:=false;
    ExecProc;
    Active:=true;
  except
    raise ENaborGetException.Create;
  end;
end;

{ TAbitDinamicaOnLobProc }

constructor TAbitDinamicaOnLobProc.Create(AOwner: TComponent);
begin
  inherited;
   procedurename:='dbo.ABIT_get_onLob';
end;

function TAbitDinamicaOnLobProc.GetData: integer;
begin
result:=0;
 try
    Active:=false;
    ExecProc;
    Active:=true;
  except
    raise ENaborGetException.Create;
  end;
end;

{ TAbitStendDataProc }

constructor TAbitStendDataProc.Create(AOwner: TComponent);
begin
  inherited;
   procedurename:='ABIT_get_onDate';
end;

function TAbitStendDataProc.GetData(nnyear:integer;date:tdatetime): integer;
begin
result:=0;
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@nnyear',ftBCD,pdInput,0,nnyear);
    Parameters.CreateParameter('@day',ftdatetime,pdInput,0,date);
    ExecProc;
    Active:=true;  
  except
    raise ENaborGetException.Create;
  end;
end;

{ TAbitYearDataProc }

constructor TAbitYearDataProc.Create(AOwner: TComponent);
begin
  inherited;
   procedurename:='ABIT_get_onDate_fast';
end;

function TAbitYearDataProc.GetData(nnyear:integer;date:tdatetime): integer;
begin
result:=0;
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@nnyear',ftBCD,pdInput,0,nnyear);
    Parameters.CreateParameter('@day',ftdatetime,pdInput,0,date);
    ExecProc;
    Active:=true;
  except
    raise ENaborGetException.Create;
  end;
end;

{ TAbitYearDataProcVF }

constructor TAbitYearDataProcVF.Create(AOwner: TComponent);
begin
  inherited;
   procedurename:='ABIT_get_onDate_veryfast2';
end;

function TAbitYearDataProcVF.GetData(day_begin,day_end:tdatetime;idreport,bit,year:integer): integer;
begin
result:=0;                              
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@day_begin',ftdatetime,pdInput,0,day_begin);
    Parameters.CreateParameter('@day_end',ftdatetime,pdInput,0,day_end);
    Parameters.CreateParameter('@idreport',ftBCD,pdInput,0,idreport);
    Parameters.CreateParameter('@bit',ftBCD,pdInput,0,bit);
    Parameters.CreateParameter('@year',ftBCD,pdInput,0,year);
    ExecProc;
    Active:=true;
  except
    raise ENaborGetException.Create;
  end;
end;


end.

