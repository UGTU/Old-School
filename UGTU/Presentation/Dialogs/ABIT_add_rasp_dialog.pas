unit ABIT_add_rasp_dialog;
   {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, Mask, Menus, DBCtrlsEh, ActnList,
  Buttons, ExtCtrls, ComCtrls, DBCtrls, DB, DateUtils, DBGridEh, DBLookupEh;

type
  TfrmDialRasp = class(TfrmBaseDialog)
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    MonCal: TDBDateTimeEditEh;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Timebegin: TDBDateTimeEditEh;
    TimeEnd: TDBDateTimeEditEh;
    Disc: TDBLookupComboboxEh;
    vidsd: TDBLookupComboboxEh;
    Meropr: TDBLookupComboboxEh;
    function AddEditData():boolean;
    procedure MonCalChange(Sender: TObject);
    procedure DiscChange(Sender: TObject);
    procedure actApplyUpdate(Sender: TObject);
  protected
    function ConvertData(Ttime:Tdatetime):string;
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    year:integer;
    id_rasp:integer;
    id_raspOld: integer;
    { Public declarations }
  end;

var
  frmDialRasp: TfrmDialRasp;
  lastDate:TDateTime;
implementation

uses AbiturientBaseProcs, AbiturientFacade, AbiturientRaspisanieProcs,
  AbiturientAbitProcs, ABIT_rasp_frame, uAbitRaspisanieController,
  ApplicationController;

{$R *.dfm}

function TfrmDialRasp.ConvertData(Ttime:Tdatetime):string;
var  res:string;
begin

  res:=TimeToStr(TTime);
  res:=copy(res,1,length(res)-3);
  result:=res;
end;



procedure TfrmDialRasp.actApplyUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (id_rasp<=0)
          and (IsModified);


end;

function TfrmDialRasp.AddEditData():boolean;
begin
	 if id_rasp>0 then   //редактирование
   begin
	    TAbitRaspisanieController.Instance.EditMeropr(MonCal.value,id_rasp,vidsd.value,Disc.value,TimeBegin.Value,TimeEnd.Value,Meropr.value);
   end
	 else
   begin
  //копируем расписание
      if id_raspOld>0 then
        TAbitRaspisanieController.Instance.CopyMeropr(id_raspOld,MonCal.value,vidsd.value,Disc.value,TimeBegin.Value,TimeEnd.Value,Meropr.value)
	   //вызываем процедуру создания новой записи  в таблице raspisanie
      else
      begin
        TApplicationController.GetInstance.AddLogEntry('Добавление мероприятия: '+Disc.Text+', '+vidsd.Text
            +', '+Meropr.Text+', '+MonCal.Text+' с '+TimeBegin.Text+' до '+TimeEnd.Text);
	      TAbitRaspisanieController.Instance.AddNewMeropr(StrToDate(MonCal.Text),vidsd.value,Disc.value,TimeBegin.Value,TimeEnd.Value,Meropr.value);
      end;
   end;
	 result:=true;
end;

procedure TfrmDialRasp.MonCalChange(Sender: TObject);
begin
  if (YearOf(MonCal.Value)<> year) and
      (YearOf(lastDate)= year) then
  begin
     //MessageBox(Handle,'Выбранная дата не соответствует году поступления.','ИС "УГТУ"',MB_OK);
     Moncal.Value:= lastDate;
     Moncal.EditText:= DateToStr(lastDate);
  end;
  lastDate:= Moncal.Value;
  IsModified:= (Timebegin.Value <> NULL) and (TimeEnd.Value <> NULL) and (Meropr.Text <> '') and
    (Moncal.Value <> null) and (Datetimetostr(Moncal.Value) <> '  .  .    ');
end;

procedure TfrmDialRasp.DiscChange(Sender: TObject);
begin
  IsModified:= (Timebegin.Value <> NULL) and (TimeEnd.Value <> NULL) and (Meropr.Text <> '') and
    (Moncal.Value <> null) and (Datetimetostr(Moncal.Value) <> '  .  .    ');

end;

function TfrmDialRasp.DoApply: boolean;
begin
  if (TimeEnd.Value<TimeBegin.Value) then
  begin
    Application.MessageBox('Время окончания меньше времени начала!','Абитуриент [расписание]',MB_OK);
    Result:= false;
    exit;
  end;
  Result:= AddEditData();
end;

function TfrmDialRasp.DoCancel: boolean;
begin
  Result:= true;
end;

end.
