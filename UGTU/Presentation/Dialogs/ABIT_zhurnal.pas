unit ABIT_zhurnal;
  {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, Mask,
  DBCtrlsEh, System.Actions;

type
  TfrmAbitZhurnal = class(TfrmBaseDialog)
    dbdtmDate: TDBDateTimeEditEh;
    Label1: TLabel;

    procedure FormShow(Sender: TObject);
    procedure dbdtmDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbCancelClick(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure dbdtmDateChange(Sender: TObject);
  private
    FReportName: string;
    { Private declarations }
  public
    { Public declarations }
    year:integer;
    property ReportName:string read FReportName write FReportName;
  end;

var
  frmAbitZhurnal: TfrmAbitZhurnal;
  lastDate: TDateTime;
implementation
uses uMain, DateUtils;

{$R *.dfm}

procedure TfrmAbitZhurnal.FormShow(Sender: TObject);
begin
  {if (YearOf(Date)<>year) and (year>2000) then
  begin
     dbdtmDate.EditText:='31.08.'+IntToStr(year);
     dbdtmDate.Value:= EndOfAMonth(year,8);
  end
  else
    dbdtmDate.Value:=Date;   }
  lastDate:= dbdtmDate.Value;

  Text:= 'Экспорт '+ ReportName;
  Label1.Caption := 'Дата выдачи '+ReportName;
end;

procedure TfrmAbitZhurnal.dbdtmDateChange(Sender: TObject);
begin
  try
    if (length(dbdtmDate.EditText)<10) then
		  exit;
	  if not(dbdtmDate.Value=null) then
	  begin
		if (YearOf(dbdtmDate.Value)<>year) and
		  (YearOf(lastDate)=year) then
		begin
		  dbdtmDate.Value:= lastDate;
		  dbdtmDate.EditText:= DateToStr(lastDate);
		end;
		lastDate:= dbdtmDate.Value;
	  end;
  except

  end;
end;

procedure TfrmAbitZhurnal.dbdtmDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then
    begin
      ModalResult:=mrOk;
      Close;
    end;

end;

procedure TfrmAbitZhurnal.bbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAbitZhurnal.actOKExecute(Sender: TObject);
begin
  inherited;
  ModalResult:=mrOk;
end;


end.                            
