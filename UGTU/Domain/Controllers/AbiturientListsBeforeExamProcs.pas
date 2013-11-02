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

  //Удаляем абитуриента из списка
  TAbitListDeleteProc = class (TDeleteProc)
  public
    procedure DeleteData(id:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //сохраняем список
  TAbitListEditProc = class (TEditProc)
  public
    procedure EditData(id,id_rasp_kab:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //получаем список абитуриентов
  TAbitListGetProc = class (TGetProc)
  public
    procedure GetData(ik_disc:OleVariant;ik_sdach:OleVariant;id_rasp:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //получаем список специальность-факультет для конкретного списка абитуриентов
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
  inherited Create('Не удалось извлечь данные для формирования списка');
end;

{ EListEditException }

constructor EListEditException.Create;
begin
  inherited Create('Не удалось изменить данные для формирования списка');
end;

{ EListDeleteException }

constructor EListDeleteException.Create;
begin
  inherited Create('Не удалось удалить данные из списка');
end;
end.
