unit AbiturientRaspisanieProcs;
 {#Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, AbiturientBaseProcs,ADODB, db, ApplicationController, ExceptionBase;

type
  ERaspisanieGetException = class(EApplicationException)
  public
    constructor Create;
  end;

  ERaspisanieEditException = class(EApplicationException)
  public
    constructor Create;
  end;

  ERaspisanieAddException = class(EApplicationException)
  public
    constructor Create;
  end;

  ERaspisanieDelException = class(EApplicationException)
  public
    constructor Create;
  end;

  //подгуражем списки
  //аудитории
  TRaspisanieAuditoriiGet = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //тип меропри€ти€
  TRaspisanieMeropriatieGet = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //ћетодисты
  TRaspisanieMetodistGet = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //ѕреподаватели
  TRaspisaniePrepodavGet = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //основна€ информаци€ дл€ таблицы расписани€
  TRaspisanieGet = class (TGetProc)
  public
    Procedure GetData(date:Tdatetime;flag:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //редактирование информации в таблице raspisanie
  TRaspisanieEdit = class (TEditProc)
  public
    procedure EditData(date:Tdatetime;id_rasp:integer;ik_sdach,ik_disc:OleVariant;TimeBegin,TimeEnd:Tdatetime;ik_typ_mer:OleVariant);
    constructor Create(AOwner: TComponent); override;
  end;
  //”даление информации из таблицы raspisanie
  TRaspisanieDelete = class (TDeleteProc)
  public
    procedure DelData(id_rasp:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //ƒобавление информации в таблицу raspisanie
  TRaspisanieAdd = class (TAddProc)
  public
    function AddData(date:Tdatetime;ik_sdach,ik_disc:OleVariant;TimeBegin,TimeEnd:Tdatetime;ik_typ_mer:OleVariant):integer;
    constructor Create(AOwner: TComponent); override;
  end;
  //получение id_rasp последней добавленной записи
  TRaspisanieID_raspGet = class (TGetProc)
  public
    function GetData():integer;
    constructor Create(AOwner: TComponent); override;
  end;
  //ƒобавление информации в таблицу rasp_kab
  TRaspisanieRasp_KabAdd = class (TAddProc)
  public
    procedure AddData(id_rasp:integer;ik_kab:OleVariant);
    constructor Create(AOwner: TComponent); override;
  end;
  //получение id последней добавленной записи в rasp_kab
  TRaspisanieID_rasp_kabGet = class (TGetProc)
  public
    function GetData():integer;
    constructor Create(AOwner: TComponent); override;
  end;
   //”даление информации из таблицы rasp_kab
  TRaspisanieRasp_KabDelete = class (TDeleteProc)
  public
    procedure DelData(id:integer);
    constructor Create(AOwner: TComponent); override;
  end;
   //–едактирование информации в таблице rasp_kab
  TRaspisanieRasp_KabEdit = class (TEditProc)
  public
    procedure EditData(id_rasp:integer;ik_kab:OleVariant;FIO_Metodist:string;id:integer);
    constructor Create(AOwner: TComponent); override;
  end;
   //получение информации из таблице rasp_kab
  TRaspisanieRasp_KabGet = class (TGetProc)
  public
    procedure GetData(id_rasp:integer);
    constructor Create(AOwner: TComponent); override;
  end;
   //получение информации из таблице ABIT_rasp_prepods
  TRaspisanieABIT_rasp_prepodsGet = class (TGetProc)
  public
    procedure GetData(id_rasp:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //получение незан€тых преподавателей
  TRaspisanieABIT_prepodsGet = class (TGetProc)
  public
    procedure GetData(id_rasp:integer);
    constructor Create(AOwner: TComponent); override;
  end;
   //получение незан€тых аудиторий
  TRaspisanieABIT_rasp_notbusyGet = class (TGetProc)
  public
    procedure GetData(date_of:Tdatetime;TimeBegin,TimeEnd:string;id_rasp:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //добавление преподавателей
  TRaspisanieABITPrepodsAddGet = class (TAddProc)
  public
    procedure AddData(id_rasp,id_prep:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //удаление преподавателей
  TRaspisanieABITPrepodsDelGet = class (TDeleteProc)
  public
    procedure DelData(id_rasp_prep:integer);
    constructor Create(AOwner: TComponent); override;
  end;
implementation

{
******************************** TRaspisanieAuditoriiGet ***********************
}
constructor TRaspisanieAuditoriiGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_kabinet';
end;
{
******************************** TRaspisanieMeropriatieGet *********************
}
constructor TRaspisanieMeropriatieGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_Meropriatie';
end;
{
******************************** TRaspisanieMetodistGet ************************
}
constructor TRaspisanieMetodistGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_Rasp_kab_FIOMetodist';
end;
{
******************************** TRaspisaniePrepodavGet ************************
}
constructor TRaspisaniePrepodavGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_Rasp_FIOPrepodav';
end;
{
******************************** TRaspisanieGet ********************************
}
constructor TRaspisanieGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_Raspisanie_AllInfo';
end;

Procedure TRaspisanieGet.GetData(date:Tdatetime;flag:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@date',ftdatetime,pdInput,0,date);
    Parameters.CreateParameter('@flag',ftBCD,pdInput,0,flag);
    ExecProc;
    Active:=true;
  except
    raise ERaspisanieGetException.Create;
  end;
end;
{
******************************* TRaspisanieEdit ********************************
}
constructor TRaspisanieEdit.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Edit_Raspisanie';
end;

Procedure TRaspisanieEdit.EditData(date:Tdatetime;id_rasp:integer;ik_sdach,ik_disc:OleVariant;TimeBegin,TimeEnd:Tdatetime;ik_typ_mer:OleVariant);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@date',ftdatetime,pdInput,0,date);
    Parameters.CreateParameter('@id_rasp',ftBCD,pdInput,0,id_rasp);
    Parameters.CreateParameter('@ik_sdach',ftBCD,pdInput,0,ik_sdach);
    Parameters.CreateParameter('@ik_disc',ftBCD,pdInput,0,ik_disc);
    Parameters.CreateParameter('@TimeBegin',ftdatetime,pdInput,5,TimeBegin);
    Parameters.CreateParameter('@TimeEnd',ftdatetime,pdInput,5,TimeEnd);
    Parameters.CreateParameter('@ik_typ_mer',ftBCD,pdInput,0,ik_typ_mer);
    ExecProc;
  except
    raise ERaspisanieEditException.Create;
  end;
end;
{
****************************** TRaspisanieDelete *******************************
}
constructor TRaspisanieDelete.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Del_Raspisanie';
end;

Procedure TRaspisanieDelete.DelData(id_rasp:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id_rasp',ftBCD,pdInput,0,id_rasp);
    ExecProc;
  except
    raise ERaspisanieDelException.Create;
  end;
end;

{
******************************** TRaspisanieAdd ********************************
}
constructor TRaspisanieAdd.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Add_Raspisanie';
end;




function TRaspisanieAdd.AddData(date:Tdatetime;ik_sdach,ik_disc:OleVariant;TimeBegin,TimeEnd:Tdatetime;ik_typ_mer:OleVariant):integer;
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@date',ftdatetime,pdInput,0,date);
    Parameters.CreateParameter('@ik_sdach',ftBCD,pdInput,0,ik_sdach);
    Parameters.CreateParameter('@ik_disc',ftBCD,pdInput,0,ik_disc);
    Parameters.CreateParameter('@TimeBegin',ftdatetime,pdInput,5,TimeBegin);
    Parameters.CreateParameter('@TimeEnd',ftdatetime,pdInput,5,TimeEnd);
    Parameters.CreateParameter('@ik_typ_mer',ftBCD,pdInput,0,ik_typ_mer);
    Parameters.CreateParameter('@id_rasp',ftInteger,pdOutput,0,0);
    ExecProc;
    Result := Parameters.ParamByName('@id_rasp').Value;
  except
    raise ERaspisanieAddException.Create;
  end;
end;
{
******************************** TRaspisanieID_raspGet ********************************
}
constructor TRaspisanieID_raspGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_raspisanie_last_id';
end;

function TRaspisanieID_raspGet.GetData():integer;
begin
 try
  Active:=false;
  ExecProc;
  Active:=true;
  result:=0;
   while not Eof do
   begin
    result:= StrToInt(FieldValues['id_rasp']);
    Next;
   end;
 except
  raise ERaspisanieGetException.Create;
 end;
end;
{
******************************** TRaspisanieID_rasp_kabGet ********************************
}
constructor TRaspisanieID_rasp_kabGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_raspisanie_kab_last_id';
end;

function TRaspisanieID_rasp_kabGet.GetData():integer;
begin
 try
  Active:=false;
  ExecProc;
  Active:=true;
  result:=0;
   while not Eof do
   begin
    result:= StrToInt(FieldValues['id']);
    Next;
   end;
 except
  raise ERaspisanieGetException.Create;
 end;
end;
{
******************************* TRaspisanieRasp_KabEdit********************************
}
constructor TRaspisanieRasp_KabEdit.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Edit_rasp_kab';
end;

Procedure TRaspisanieRasp_KabEdit.EditData(id_rasp:integer;ik_kab:OleVariant;FIO_Metodist:string;id:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id_rasp',ftBCD,pdInput,0,id_rasp);
    Parameters.CreateParameter('@ik_kab',ftBCD,pdInput,0,ik_kab);
    Parameters.CreateParameter('@FIO_Metodist',ftstring,pdInput,500,FIO_Metodist);
    Parameters.CreateParameter('@id',ftBCD,pdInput,0,id);
    ExecProc;
  except
    raise ERaspisanieEditException.Create;
  end;
end;
{
****************************** TRaspisanieRasp_KabDelete*******************************
}
constructor TRaspisanieRasp_KabDelete.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Del_rasp_kab';
end;

Procedure TRaspisanieRasp_KabDelete.DelData(id:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id',ftBCD,pdInput,0,id);
    ExecProc;
  except
    raise ERaspisanieDelException.Create;
  end;
end;

{
******************************* TRaspisanieRasp_KabAdd********************************
}
constructor TRaspisanieRasp_KabAdd.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Add_rasp_kab';
end;

Procedure TRaspisanieRasp_KabAdd.AddData(id_rasp:integer;ik_kab:OleVariant);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id_rasp',ftBCD,pdInput,0,id_rasp);
    Parameters.CreateParameter('@ik_kab',ftBCD,pdInput,0,ik_kab);
    ExecProc;
  except
    raise ERaspisanieAddException.Create;
  end;
end;

{
******************************* TRaspisanieRasp_KabGet********************************
}
constructor TRaspisanieRasp_KabGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_get_raspkab';
end;

Procedure TRaspisanieRasp_KabGet.GetData(id_rasp:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id_rasp',ftBCD,pdInput,0,id_rasp);
    ExecProc;
    Active:=true;
  except
    raise ERaspisanieGetException.Create;
  end;
end;

{
******************************* TRaspisanieABIT_rasp_prepodsGet********************************
}
constructor TRaspisanieABIT_rasp_prepodsGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_get_raspprepods';
end;

Procedure TRaspisanieABIT_rasp_prepodsGet.GetData(id_rasp:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id_rasp',ftBCD,pdInput,0,id_rasp);
    ExecProc;
    Active:=true;
  except
    raise ERaspisanieGetException.Create;
  end;
end;

{
******************************* TRaspisanieABIT_prepodsGet********************************
}
constructor TRaspisanieABIT_prepodsGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_get_Prepods';
end;

Procedure TRaspisanieABIT_prepodsGet.GetData(id_rasp:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id_rasp',ftBCD,pdInput,0,id_rasp);
    ExecProc;
    Active:=true;
  except
    raise ERaspisanieGetException.Create;
  end;
end;

{
******************************* TRaspisanieABIT_rasp_notbusyGet********************************
}
constructor TRaspisanieABIT_rasp_notbusyGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_get_kab_isnotbusy';
end;

Procedure TRaspisanieABIT_rasp_notbusyGet.GetData(date_of:Tdatetime;TimeBegin,TimeEnd:string;id_rasp:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@date_of',ftdatetime,pdInput,0,date_of);
    Parameters.CreateParameter('@TimeBegin',ftstring,pdInput,5,TimeBegin);
    Parameters.CreateParameter('@TimeEnd',ftstring,pdInput,5,TimeEnd);
    Parameters.CreateParameter('@id_rasp',ftBCD,pdInput,0,id_rasp);
    ExecProc;
    Active:=true;
  except
    raise ERaspisanieGetException.Create;
  end;
end;

{
******************************* TRaspisanieABITPrepodsAddGet ********************************
}
constructor TRaspisanieABITPrepodsAddGet .Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_add_prepod_rasp';
end;

Procedure TRaspisanieABITPrepodsAddGet.Adddata(id_rasp,id_prep:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id_rasp',ftBCD,pdInput,0,id_rasp);
    Parameters.CreateParameter('@id_prep',ftBCD,pdInput,0,id_prep);
    ExecProc;
  except
    raise ERaspisanieAddException.Create;
  end;
end;

{
******************************* TRaspisanieABITPrepodsDelGet  ********************************
}
constructor TRaspisanieABITPrepodsDelGet  .Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_del_prepod_rasp';
end;

Procedure TRaspisanieABITPrepodsDelGet .Deldata(id_rasp_prep:integer);
begin
 try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id_rasp_prep',ftBCD,pdInput,0,id_rasp_prep);
    ExecProc;
  except
    raise ERaspisanieDelException.Create;
  end;
end;

{ ERaspisanieGetException }

constructor ERaspisanieGetException.Create;
begin
  inherited Create('Ќе удалось извлечь данные расписани€');
end;

{ ERaspisanieEditException }

constructor ERaspisanieEditException.Create;
begin
  inherited Create('Ќе удалось изменить данные расписани€');
end;

{ ERaspisanieAddException }

constructor ERaspisanieAddException.Create;
begin
  inherited Create('Ќе удалось добавить данные расписани€');
end;

{ ERaspisanieDelException }

constructor ERaspisanieDelException.Create;
begin
  inherited Create('Ќе удалось удалить данные расписани€. ¬ќзможно имеетс€ ссылка на запись расписани€. ѕопытайтесь проверить данные списков');
end;
end.
