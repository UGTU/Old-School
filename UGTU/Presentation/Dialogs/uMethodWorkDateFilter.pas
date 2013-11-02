unit uMethodWorkDateFilter;
   {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfrmMethodWorkDateFilter = class(TfrmBaseDialog)
    RadioGroup1: TRadioGroup;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    FStr: string;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    property Str: string read FStr write FStr;
  end;

var
  frmMethodWorkDateFilter: TfrmMethodWorkDateFilter;

implementation

{$R *.dfm}

function TfrmMethodWorkDateFilter.DoApply: boolean;
begin
  //if (dbeName.Text = '') or (dbeAdress.Text = '') then
      {begin
        Result:= false;
        Application.MessageBox('Необходимо указать текст и адрес гиперссылки!', 'Добавление гиперссылки', MB_ICONWARNING);
        exit;
      end;}
  case RadioGroup1.ItemIndex of
    0: IK:= 0;
    1: begin
         IK:= 1;
         Str:= DateToStr(DateTimePicker1.DateTime);
       end;
    2: begin
         IK:= 2;
         Str:= DateToStr(DateTimePicker2.DateTime);
       end;
  end;
  Result:= true;
end;

function TfrmMethodWorkDateFilter.DoCancel: boolean;
begin
  {case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о документации', MB_YESNOCANCEL)) of
      mrYes:
        begin
          OK;
          Result:= false;
          bbApply.Tag:= 1;
        end;
      mrNo: Result:= true;
      mrCancel: Result:= false;
      else Result:= false;
  end }
  Result:= true;
end;

procedure TfrmMethodWorkDateFilter.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  //IsModified:= true;
end;

end.
