unit uUserFrame;
   {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, Menus, ActnList, Grids, DBGridEh, StdCtrls,
  ComCtrls, Buttons, DBCtrls, ToolWin, ExtCtrls, Mask, DBCtrlsEh,
  DBLookupEh, uDm, ADODB, DB, GridsEh, uQMDataModule, uQMAdminTable,
  uQMAdminField, uQMAdminRelation, uDMAdmin, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, System.Actions, DBAxisGridsEh;

type
  TfmUsers = class(TfmBase)
    ToolBar1: TToolBar;
    gUser: TDBGridEh;
    pmMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    dbcbElement: TDBLookupComboboxEh;
    alAdmin: TActionList;
    aCancel: TAction;
    aSave: TAction;
    aNext: TAction;
    aInsert: TAction;
    aDel: TAction;
    aLast: TAction;
    aFirst: TAction;
    aPred: TAction;
    aClose: TAction;
    DBNavigator1: TDBNavigator;
    adotFilter1: TADOTable;
    adotElemUsers: TADOTable;
    adotElemUsersik_Element: TIntegerField;
    adotElemUsersuid: TIntegerField;
    adotElemUsersik_filter1: TIntegerField;
    adotElemUsersik_filter2: TIntegerField;
    adotElemUsersuser: TStringField;
    adotElemUsersfilter1: TStringField;
    adotElemUsersfilter2: TStringField;
    adotElement: TADOTable;
    dsElement: TDataSource;
    dsElemUsers: TDataSource;
    adodsUsers: TADODataSet;
    pcAdmin: TPageControl;
    tsUsers: TTabSheet;
    tsEvents: TTabSheet;
    gEvent: TDBGridEh;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    dbdtEventEnd: TDBDateTimeEditEh;
    Label1: TLabel;
    Label2: TLabel;
    dbdtEventBegin: TDBDateTimeEditEh;
    adotFilter2: TADOQuery;
    DataSource1: TDataSource;
    TabSheet1: TTabSheet;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    dbgeEntity: TDBGridEh;
    dbgeRelations: TDBGridEh;
    dbgeFields: TDBGridEh;
    SpeedButton1: TSpeedButton;
    actAddTable: TAction;
    actDelTable: TAction;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    dsTables: TDataSource;
    dsFields: TDataSource;
    dsRelations: TDataSource;
    ToolButton1: TToolButton;
    actEditTable: TAction;
    ppmEntity: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    actAddField: TAction;
    actEditField: TAction;
    actDelField: TAction;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    ppmFields: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    actAddRelation: TAction;
    actDeleteRelation: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    dbcbAuditObject: TDBLookupComboboxEh;
    dbcbUsers: TDBLookupComboboxEh;
    dbcbOperationType: TDBLookupComboboxEh;
    constructor CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection);override;
    procedure dbcbElementChange(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aNextExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aInsertExecute(Sender: TObject);
    procedure aLastExecute(Sender: TObject);
    procedure aFirstExecute(Sender: TObject);
    procedure aPredExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure adotElemUsersAfterScroll(DataSet: TDataSet);
    procedure adotElemUsersBeforePost(DataSet: TDataSet);
    procedure adotElemUsersfilter1Change(Sender: TField);
    procedure adotElemUsersuserChange(Sender: TField);
    procedure adotElemUsersfilter2Change(Sender: TField);
    procedure pcAdminChange(Sender: TObject);
    procedure dbdtEventEndChange(Sender: TObject);
    procedure dbdtEventBeginChange(Sender: TObject);
    procedure gEventTitleClick(Column: TColumnEh);
    procedure actAddTableExecute(Sender: TObject);
    procedure dbgeRelationsTitleClick(Column: TColumnEh);
    procedure dbgeFieldsTitleClick(Column: TColumnEh);
    procedure dbgeEntityTitleClick(Column: TColumnEh);
    procedure actEditTableExecute(Sender: TObject);
    procedure actDelTableExecute(Sender: TObject);
    procedure actAddFieldExecute(Sender: TObject);
    procedure actEditFieldExecute(Sender: TObject);
    procedure actDelFieldExecute(Sender: TObject);
    procedure actAddRelationExecute(Sender: TObject);
    procedure actDeleteRelationExecute(Sender: TObject);
    procedure dbcbUsersChange(Sender: TObject);
  private
    { Private declarations }
    auditDateBegin: TDateTime;
    auditDateEnd: TDateTime;
    procedure ChangeElement();

  protected
   procedure DoRefreshFrame; override;
    function DoApply: Boolean; override;
    Procedure ChangeModif(fl:boolean);
    procedure SetAuditFilter;

  public
    { Public declarations }

  end;

var
  fmUsers: TfmUsers;

implementation

uses uMain;

procedure TfmUsers.DoRefreshFrame;
begin
  ChangeModif(false);
  //обновляем вкладку пользователи
  ChangeElement;
  dmAdmin.adotEvent.Close;
  dmAdmin.adotEvent.Open;
  {adotElemUsers.Open;
  adotElemUsers.Close;
  adotElemUsersfilter2.LookupDataSet:=adotFilter2;
  adotElemUsersfilter2.LookupKeyFields:='ik_kaf';
  adotElemUsersfilter2.LookupResultField:='cname_kaf';
  dbcbElement.SelectNextValue(true);
  adotElemUsers.Open;
  btnSave.Caption:='';
  btnDel.Caption:='';
  btnCansel.Caption:=''; }
  pcAdmin.ActivePageIndex:=0;
  QMDataModule.adodsQMAdminTables.Open;
  QMDataModule.adodsQMAdminFields.Open;
  QMDataModule.adodsQMAdminRelations.Open;
  DMAdmin.adoqAuditObject.Open;
  DMAdmin.adoqAuditOperationType.Open;
  DMAdmin.adoqUsers.Open;

  AuditDateBegin:= Date()-7;
  AuditDateEnd:= Date();
  {try
    dbdtEventBegin.Value:=AuditDateBegin;
    dbdtEventEnd.Value:=AuditDateEnd;
  except
  end;}

end;

Procedure TfmUsers.ChangeModif(fl:boolean);
begin
   modified:=fl;
   aSave.Enabled:=fl;
   aCancel.Enabled:=fl;
end;

constructor TfmUsers.CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection);
begin
  inherited;
    ChangeModif(false);
  adotElement.Open;
  adotElemUsers.Close;
  adotElemUsersfilter2.LookupDataSet:=adotFilter2;
  adotElemUsersfilter2.LookupKeyFields:='ik_kaf';
  adotElemUsersfilter2.LookupResultField:='cname_kaf';
  dbcbElement.SelectNextValue(true);
  adotElemUsers.Open;
 // btnSave.Caption:='';
  //btnCansel.Caption:='';
  //btnDel.Caption:='';
  pcAdmin.ActivePageIndex:=0;

end;
{$R *.dfm}

procedure TfmUsers.dbgeRelationsTitleClick(Column: TColumnEh);
begin
QMDataModule.adodsQMADMINRelations.Sort:='['+Column.Field.FieldName+']';
end;

procedure TfmUsers.dbgeEntityTitleClick(Column: TColumnEh);
begin
QMDataModule.adodsQMADMINTables.Sort:='['+Column.Field.FieldName+']';
end;

procedure TfmUsers.dbgeFieldsTitleClick(Column: TColumnEh);
begin
QMDataModule.adodsQMAdminFields.Sort:='['+Column.Field.FieldName+']';
end;

function TfmUsers.DoApply: Boolean;
begin
  try
   adotElemUsers.UpdateBatch(arAll);
   ChangeModif(false);
   result:=true;
  except
    result:=false;
  end;
end;

procedure TfmUsers.ChangeElement();
begin
  if modified then
   begin
      case (MessageBox(Handle, PWideChar('         Сохранить внесенные изменения?'), 'ИС Деканат', MB_YESNO)) of
         IDYES:
            Apply;   //вызов сохранения
      end;
   end;
   ChangeModif(false);

   if (dbcbElement.KeyValue=null) then dbcbElement.SelectNextValue(true);
   adotElemUsers.Close;
   adotElemUsers.Filtered:=true;
   adotElemUsers.Filter:='ik_Element='+inttostr(dbcbElement.KeyValue);
   case dbcbElement.KeyValue of
      1: //деканат
      begin
         adotFilter1.Close;
         adotFilter1.TableName:='Fac';
         adotElemUsersfilter1.LookupKeyFields:='Ik_fac';
         adotElemUsersfilter1.LookupResultField:='Cname_fac';
         adotElemUsersfilter1.DisplayLabel:='Факультет';
         adotElemUsersfilter1.DisplayWidth:=100;
         adotElemUsersfilter1.ReadOnly:=false;
         adotElemUsersfilter1.Visible:=true;
         adotElemUsersik_filter1.ReadOnly:=false;

         adotFilter2.Close;
         adotFilter2.Filter:='';
         adotFilter2.SQL.Clear;
         adotFilter2.SQL.Add('SELECT ik_spec_fac, ik_fac, Spec_stud.ik_spec, Cname_spec FROM Spec_stud INNER JOIN Relation_spec_fac ON Relation_spec_fac.ik_spec=Spec_stud.ik_spec');
         adotFilter2.Open;
         adotElemUsersfilter2.LookupKeyFields:='ik_spec_fac';
         adotElemUsersfilter2.LookupResultField:='Cname_spec';
         adotElemUsersfilter2.DisplayLabel:='Специальность';
         adotElemUsersfilter2.ReadOnly:=false;
         adotElemUsersfilter2.Visible:=true;
         adotElemUsersik_filter2.ReadOnly:=false;
         adotElemUsersfilter2.DisplayWidth:=100;
         adotElemUsers.Open;
         adotFilter2.Filter:='ik_fac=0';
         adotFilter2.Filtered:=true;
      end;
      2: //нагрузка
      begin
         adotFilter1.Close;
         adotFilter1.TableName:='Fac';
         adotElemUsersfilter1.LookupKeyFields:='Ik_fac';
         adotElemUsersfilter1.LookupResultField:='Cname_fac';
         adotElemUsersfilter1.ReadOnly:=false;
         adotElemUsersfilter1.Visible:=true;
         adotElemUsersik_filter1.ReadOnly:=false;
         adotElemUsersfilter1.DisplayWidth:=100;
         adotFilter2.Close;
         adotFilter2.Filter:='';
         adotFilter2.SQL.Clear;
         adotFilter2.SQL.Add('SELECT * FROM kafedra');
         adotFilter2.Open;
         adotElemUsersfilter2.LookupKeyFields:='ik_kaf';
         adotElemUsersfilter2.LookupResultField:='cname_kaf';
         adotElemUsersfilter2.ReadOnly:=false;
         adotElemUsersfilter2.Visible:=true;
         adotElemUsersik_filter2.ReadOnly:=false;
         adotElemUsersfilter2.DisplayWidth:=100;
         adotElemUsersfilter1.DisplayLabel:='Факультет';
         adotElemUsersfilter2.DisplayLabel:='Кафедра';
         adotElemUsers.Open;
         adotFilter2.Filter:='ik_fac=0';
         adotFilter2.Filtered:=true;
      end;
      3: //абитуриент
      begin
         adotFilter1.Close;
         adotFilter1.TableName:='Fac';
         adotElemUsersfilter1.LookupKeyFields:='Ik_fac';
         adotElemUsersfilter1.LookupResultField:='Cname_fac';
         adotElemUsersfilter1.DisplayLabel:='Факультет';
         adotElemUsersfilter1.DisplayWidth:=100;
         adotElemUsersfilter1.ReadOnly:=false;
         adotElemUsersfilter1.Visible:=true;
         adotElemUsersik_filter1.ReadOnly:=false;

         adotFilter2.Close;
         adotFilter2.Filter:='';
         adotFilter2.SQL.Clear;
         adotFilter2.SQL.Add('SELECT ik_spec_fac, ik_fac, Spec_stud.ik_spec, Cname_spec FROM Spec_stud INNER JOIN Relation_spec_fac ON Relation_spec_fac.ik_spec=Spec_stud.ik_spec');
         adotFilter2.Open;
         adotElemUsersfilter2.LookupKeyFields:='ik_spec_fac';
         adotElemUsersfilter2.LookupResultField:='Cname_spec';
         adotElemUsersfilter2.DisplayLabel:='Специальность';
         adotElemUsersfilter2.ReadOnly:=false;
         adotElemUsersfilter2.Visible:=true;
         adotElemUsersik_filter2.ReadOnly:=false;
         adotElemUsersfilter2.DisplayWidth:=100;
         adotElemUsers.Open;
         adotFilter2.Filter:='ik_fac=0';
         adotFilter2.Filtered:=true;
      end;
      7: //учебно-методическое обечпечение
      begin
         adotFilter1.Close;
         adotFilter1.TableName:='Fac';
         adotElemUsersfilter1.LookupKeyFields:='Ik_fac';
         adotElemUsersfilter1.LookupResultField:='Cname_fac';
         adotElemUsersfilter1.ReadOnly:=false;
         adotElemUsersfilter1.Visible:=true;
         adotElemUsersik_filter1.ReadOnly:=false;
         adotElemUsersfilter1.DisplayWidth:=100;
         adotFilter2.Close;
         adotFilter2.Filter:='';
         adotFilter2.SQL.Clear;
         adotFilter2.SQL.Add('SELECT * FROM kafedra');
         adotFilter2.Open;
         adotElemUsersfilter2.LookupKeyFields:='ik_kaf';
         adotElemUsersfilter2.LookupResultField:='cname_kaf';
         adotElemUsersfilter2.ReadOnly:=false;
         adotElemUsersfilter2.Visible:=true;
         adotElemUsersik_filter2.ReadOnly:=false;
         adotElemUsersfilter2.DisplayWidth:=100;
         adotElemUsersfilter1.DisplayLabel:='Факультет';
         adotElemUsersfilter2.DisplayLabel:='Кафедра';
         adotElemUsers.Open;
         adotFilter2.Filter:='ik_fac=0';
         adotFilter2.Filtered:=true;
      end;
      8: //расписание
      begin
         adotFilter1.Close;
         adotFilter1.TableName:='Fac';
         adotElemUsersfilter1.LookupKeyFields:='Ik_fac';
         adotElemUsersfilter1.LookupResultField:='Cname_fac';
         adotElemUsersfilter1.ReadOnly:=false;
         adotElemUsersfilter1.Visible:=true;
         adotElemUsersik_filter1.ReadOnly:=false;
         adotElemUsersfilter1.DisplayWidth:=100;
         adotFilter2.Close;
         adotFilter2.Filter:='';
         adotFilter2.SQL.Clear;
         adotFilter2.SQL.Add('SELECT * FROM kafedra');
         adotFilter2.Open;
         adotElemUsersfilter2.LookupKeyFields:='ik_kaf';
         adotElemUsersfilter2.LookupResultField:='cname_kaf';
         adotElemUsersfilter2.ReadOnly:=false;
         adotElemUsersfilter2.Visible:=true;
         adotElemUsersik_filter2.ReadOnly:=false;
         adotElemUsersfilter2.DisplayWidth:=100;
         adotElemUsersfilter1.DisplayLabel:='Факультет';
         adotElemUsersfilter2.DisplayLabel:='Кафедра';
         adotElemUsers.Open;
         adotFilter2.Filter:='ik_fac=0';
         adotFilter2.Filtered:=true;
      end;
      11: //общежитие
      begin
         adotFilter1.Close;
         adotFilter1.TableName:='HOST_Hostel';
         adotElemUsersfilter1.LookupKeyFields:='NumHostel';
         adotElemUsersfilter1.LookupResultField:='NameHost';
         adotElemUsersfilter1.ReadOnly:=false;
         adotElemUsersfilter1.Visible:=true;
         adotElemUsersik_filter1.ReadOnly:=false;
         adotElemUsersfilter1.DisplayWidth:=100;
         adotElemUsersfilter1.DisplayLabel:='Номер общежития';
         adotFilter2.Close;
         adotElemUsersfilter2.ReadOnly:=true;
         adotElemUsersfilter2.Visible:=false;
         adotElemUsersik_filter2.ReadOnly:=true;
         adotElemUsers.Open;
      end;
      10: //диплом
      begin
         adotFilter1.Close;
         adotFilter1.TableName:='Fac';
         adotElemUsersfilter1.LookupKeyFields:='Ik_fac';
         adotElemUsersfilter1.LookupResultField:='Cname_fac';
         adotElemUsersfilter1.DisplayLabel:='Факультет';
         adotElemUsersfilter1.DisplayWidth:=80;
         adotElemUsersfilter1.ReadOnly:=false;
         adotElemUsersfilter1.Visible:=true;
         adotElemUsersik_filter1.ReadOnly:=false;

         adotFilter2.Close;
         adotElemUsersfilter2.ReadOnly:=true;
         adotElemUsersfilter2.Visible:=false;
         adotElemUsersik_filter2.ReadOnly:=true;

         adotElemUsers.Open;
      end;
      else //приказы
      begin
         adotFilter1.Close;
         adotElemUsersfilter1.ReadOnly:=true;
         adotElemUsersfilter1.Visible:=false;
         adotElemUsersik_filter1.ReadOnly:=true;
         adotFilter2.Close;
         adotElemUsersfilter2.ReadOnly:=true;
         adotElemUsersfilter2.Visible:=false;
         adotElemUsersik_filter2.ReadOnly:=true;
      end;

   end;
   adotElemUsers.Open;
end;


procedure TfmUsers.dbcbElementChange(Sender: TObject);
begin
  ChangeElement;
end;

procedure TfmUsers.dbcbUsersChange(Sender: TObject);
begin
  inherited;
  SetAuditFilter;
end;

procedure TfmUsers.aSaveExecute(Sender: TObject);
begin
  inherited;
   if Modified then Apply;
end;

procedure TfmUsers.aCancelExecute(Sender: TObject);
begin
  inherited;
   adotElemUsers.CancelUpdates;
   //adotElemUsers.
   ChangeModif(false);
end;

procedure TfmUsers.aNextExecute(Sender: TObject);
begin
  inherited;
   adotElemUsers.Next;
end;

procedure TfmUsers.aDelExecute(Sender: TObject);
begin
  inherited;
  if (MessageBox(Handle, '           Удалить запись?','ИС Деканат',
          MB_YESNO) = IDYES) then
  begin
      adotElemUsers.Delete;
      ChangeModif(true);
  end;

end;

procedure TfmUsers.aInsertExecute(Sender: TObject);
begin
  inherited;
   adotElemUsers.Insert;
   ChangeModif(true);
end;

procedure TfmUsers.aLastExecute(Sender: TObject);
begin
  inherited;
   adotElemUsers.Last;
end;

procedure TfmUsers.aFirstExecute(Sender: TObject);
begin
  inherited;
   adotElemUsers.First;
end;

procedure TfmUsers.aPredExecute(Sender: TObject);
begin
  inherited;
   adotElemUsers.Prior;
end;

procedure TfmUsers.aCloseExecute(Sender: TObject);
begin
  inherited;
   if Modified then
   begin
      if (MessageBox(Handle, 'Сохранить внесенные изменения?','ИС Деканат',
          MB_YESNO) = IDYES) then
          Apply;   //вызов сохранения
   end;
   ChangeModif(false);
end;

procedure TfmUsers.actAddFieldExecute(Sender: TObject);
begin
frmQMAdminField:=TfrmQMAdminField.Create(self);
frmQMAdminField.Tag:=-1;
frmQMAdminField.ShowModal;
frmQMAdminField.Free;
QMDataModule.adodsQMAdminFields.close;
QMDataModule.adodsQMAdminFields.Open;
end;

procedure TfmUsers.actAddRelationExecute(Sender: TObject);
begin
frmQMAdminRelation:=TfrmQMAdminRelation.Create(self);
frmQMAdminRelation.Tag:=-1;
frmQMAdminRelation.ShowModal;
frmQMAdminRelation.Free;
QMDataModule.adodsQMAdminRelations.close;
QMDataModule.adodsQMAdminRelations.Open;
end;

procedure TfmUsers.actAddTableExecute(Sender: TObject);
begin
frmQMAdminTable:=TfrmQMAdminTable.Create(self);
frmQMAdminTable.Tag:=-1;
frmQMAdminTable.ShowModal;
frmQMAdminTable.Free;
QMDataModule.adodsQMAdminTables.close;
QMDataModule.adodsQMAdminTables.Open;
end;

procedure TfmUsers.actDeleteRelationExecute(Sender: TObject);
begin
if MessageDlg('Вы действительно хотите удалить связь?',mtConfirmation,mbOkCancel,0)=mrOk
then begin

QMDataModule.adospQMDeleteRelation.Active:=false;

QMDataModule.adospQMDeleteRelation.Parameters.items[1].Value:=
QMDataModule.adodsQMAdminRelations.FieldByName('ik_relation').Value;

try
QMDataModule.adospQMDeleteRelation.ExecProc;
QMDataModule.adodsQMAdminRelations.close;
QMDataModule.adodsQMAdminRelations.Open;
except
showmessage('Выберите связь!');
end;
end;

end;

procedure TfmUsers.actDelFieldExecute(Sender: TObject);
begin

if MessageDlg('Вы действительно хотите удалить поле из таблицы?',mtConfirmation,mbOkCancel,0)=mrOk
then begin

QMDataModule.adospQMDeleteField.Active:=false;

QMDataModule.adospQMDeleteField.Parameters.items[1].Value:=
QMDataModule.adodsQMAdminFields.FieldByName('ik_field').Value;

try
QMDataModule.adospQMDeleteField.ExecProc;
QMDataModule.adodsQMAdminFields.close;
QMDataModule.adodsQMAdminFields.Open;
except
showmessage('Выберите поле!');
end;
end;
end;

procedure TfmUsers.actDelTableExecute(Sender: TObject);
begin

if MessageDlg('Вы действительно хотите удалить таблицу?',mtConfirmation,mbOkCancel,0)=mrOk
then begin

QMDataModule.adospQMDeleteTable.Active:=false;

QMDataModule.adospQMDeleteTable.Parameters.items[1].Value:=
QMDataModule.adodsQMAdminTables.FieldByName('ik_table').Value;

try
QMDataModule.adospQMDeleteTable.ExecProc;
QMDataModule.adodsQMAdminTables.close;
QMDataModule.adodsQMAdminTables.Open;
except
showmessage('Выберите таблицу!');
end;
end;
end;

procedure TfmUsers.actEditFieldExecute(Sender: TObject);
begin
frmQMAdminField:=TfrmQMAdminField.Create(self);
frmQMAdminField.Tag:=QMDataModule.adodsQMAdminFields.FieldByName('ik_field').Value;
frmQMAdminField.Caption:='Изменить поле';
frmQMAdminField.bbOK.Enabled:=true;
frmQMAdminField.bbApply.Enabled:=true;
frmQMAdminField.eName.text:=QMDataModule.adodsQMAdminFields.FieldByName('cfield_name').Value;

if QMDataModule.adodsQMAdminFields.FieldByName('cfield_caption').Value <> null then
  frmQMAdminField.eCaption.text:=QMDataModule.adodsQMAdminFields.FieldByName('cfield_caption').Value
else
  frmQMAdminField.eCaption.text:='';

frmQMAdminField.dbcbeTable.Keyvalue:=QMDataModule.adodsQMAdminFields.FieldByName('ik_table').Value;
frmQMAdminField.cbVisible.checked:=QMDataModule.adodsQMAdminFields.FieldByName('lvisible').value;

frmQMAdminField.ShowModal;
frmQMAdminField.Free;
QMDataModule.adodsQMAdminFields.close;
QMDataModule.adodsQMAdminFields.Open;
end;

procedure TfmUsers.actEditTableExecute(Sender: TObject);
begin
frmQMAdminTable:=TfrmQMAdminTable.Create(self);
frmQMAdminTable.Tag:=QMDataModule.adodsQMAdminTables.FieldByName('ik_table').Value;
frmQMAdminTable.Caption:='Изменить таблицу';
frmQMAdminTable.bbOK.Enabled:=true;
frmQMAdminTable.bbApply.Enabled:=true;
frmQMAdminTable.eName.text:=QMDataModule.adodsQMAdminTables.FieldByName('ctable_name').Value;
frmQMAdminTable.eCaption.text:=QMDataModule.adodsQMAdminTables.FieldByName('ctable_caption').Value;
frmQMAdminTable.ShowModal;
frmQMAdminTable.Free;
QMDataModule.adodsQMAdminTables.close;
QMDataModule.adodsQMAdminTables.Open;
end;

procedure TfmUsers.adotElemUsersAfterScroll(DataSet: TDataSet);
begin
  inherited;
   if not adotFilter2.Active then exit;
   if adotElemUsersik_filter1.IsNull then
      adotFilter2.Filter:=adotFilter1.Fields[0].FieldName+'=0'
   else
      adotFilter2.Filter:=adotFilter1.Fields[0].FieldName+'='+
      adotElemUsersik_filter1.AsString;

end;

procedure TfmUsers.adotElemUsersBeforePost(DataSet: TDataSet);
begin
  inherited;
   adotElemUsersik_Element.AsString:=dbcbElement.Value;
end;

procedure TfmUsers.adotElemUsersfilter1Change(Sender: TField);
var fl: boolean;
begin
   if not adotFilter2.Active then exit;
   if adotElemUsersik_filter1.IsNull then
   begin
      adotFilter2.Filter:=adotFilter1.Fields[0].FieldName+'=0';
      //adotElemUsersik_filter2.Value:=null;
   end
   else
   begin
      fl:=false;
      try
         adotFilter2.Locate(adotFilter2.Fields[0].FieldName,adotElemUsersik_filter2.Value,[]);
         if (adotFilter2.Fields[1].AsInteger<>adotElemUsersik_filter1.AsInteger)
            then fl:=true;
         adotFilter2.Filter:=adotFilter1.Fields[0].FieldName+'='+
         adotElemUsersik_filter1.AsString;
         if (adotFilter2.RecordCount=0) then
         begin
            adotElemUsersik_filter2.Value:=null;
            exit;
         end;
         adotFilter2.Locate(adotFilter2.Fields[0].FieldName,adotElemUsersik_filter2.Value,[]);
         if fl then
         begin
            adotFilter2.First;
            adotElemUsersik_filter2.AsInteger:=adotFilter2.Fields[0].AsInteger;
         end;
      except
      end;
   end;
   ChangeModif(true);
end;

procedure TfmUsers.adotElemUsersuserChange(Sender: TField);
begin
  inherited;
   ChangeModif(true);
end;

procedure TfmUsers.adotElemUsersfilter2Change(Sender: TField);
begin
  inherited;
   ChangeModif(true);
end;

procedure GetDate();
begin
  try

    fmUsers.dbdtEventBegin.Value:=dmAdmin.adotEvent.Fields[3].Value;
    while not dmAdmin.adotEvent.Eof  do
      dmAdmin.adotEvent.Next;
    dmAdmin.adotEvent.Last;
    fmUsers.dbdtEventEnd.Value:=dmAdmin.adotEvent.Fields[3].Value;
  except
  end;
end;

procedure TfmUsers.pcAdminChange(Sender: TObject);
begin
  inherited;
  if pcAdmin.ActivePageIndex = 0 then
  begin
    bbSave.Visible:=true;
    bbUndo.Visible:=true;
  end;

  if pcAdmin.ActivePageIndex = 1 then
  begin
    if dbdtEventEnd.Value=NULL then
    begin
      dmAdmin.adotEvent.Open;
      dmAdmin.adotEvent.Filter:='(AuditDateTime>='''+DateToStr(AuditDateBegin)+''') and (AuditDateTime<='''+DateToStr(AuditDateEnd)+''')';
      dmAdmin.adotEvent.Filtered:=true;
      try
        dbdtEventBegin.Value:=AuditDateBegin;
        dbdtEventEnd.Value:=AuditDateEnd;
      except
      end;
    end;
    bbSave.Visible:=false;
    bbUndo.Visible:=false;
    if dmAdmin.adotEvent.Active then
      frmMain.StatusBar1.Panels[2].Text:= 'Количество событий: ' + IntToStr(dmAdmin.adotEvent.RecordCount);
  end;
end;


procedure TfmUsers.SetAuditFilter;
var auditfilter: string;
begin

  if not dmAdmin.adotEvent.Active then
    exit;

  auditfilter:='(AuditDateTime>='''+DateToStr(AuditDateBegin)+''') and (AuditDateTime<='''+DateToStr(AuditDateEnd+1)+''')';

  if (dbcbOperationType.Value>0) then
    auditfilter:= auditfilter+' and (OperationTypeID='+IntToStr(dbcbOperationType.Value)+')';

  if (dbcbOperationType.Value>0) then
    auditfilter:= auditfilter+' and (OperationTypeID='+IntToStr(dbcbOperationType.Value)+')';

  if (dbcbUsers.Value>'') then
    auditfilter:= auditfilter+' and (UserName='''+(dbcbUsers.Value)+''')';

  if (dbcbAuditObject.Value>0) then
    auditfilter:= auditfilter+' and (ObjectID='+IntToStr(dbcbAuditObject.Value)+')';

  dmAdmin.adotEvent.Filter:= auditfilter;
  dmAdmin.adotEvent.Filtered:= true;

  frmMain.StatusBar1.Panels[2].Text:= 'Количество событий: ' + IntToStr(dmAdmin.adotEvent.RecordCount);
end;


function OurDateToStr(date:TDateTime):string;
var s1:string;
begin
result:=DatetoStr(date);
s1:=result;
result[1]:=s1[4];
result[2]:=s1[5];
result[4]:=s1[1];
result[5]:=s1[2];

end;

procedure TfmUsers.dbdtEventEndChange(Sender: TObject);
begin
  inherited;
  if (TDateTime(dbdtEventEnd.Value)>date) or (AuditDateBegin>=dbdtEventEnd.Value) then
  begin
    dbdtEventEnd.Value:= AuditDateEnd;
    dbdtEventEnd.EditText:= DateToStr(AuditDateEnd);
  end;

  AuditDateEnd:= dbdtEventEnd.Value;

  SetAuditFilter;
end;

procedure TfmUsers.dbdtEventBeginChange(Sender: TObject);
begin
  inherited;
  if (TDateTime(dbdtEventBegin.Value)>date) or (dbdtEventBegin.Value>=AuditdateEnd) then
  begin
    dbdtEventBegin.Value:= AuditDateBegin;
    dbdtEventBegin.EditText:= DateToStr(AuditDateBegin);
  end;

  AuditDateBegin:= dbdtEventBegin.Value;

  SetAuditFilter;
end;

procedure TfmUsers.gEventTitleClick(Column: TColumnEh);
begin
  inherited;
  dmAdmin.adotEvent.Sort:=Column.Field.FieldName;
end;

//end.


{
procedure TfrmMain.actPrintMagExecute(Sender: TObject);
var  E:Variant;
  str:string;
begin
  E := CreateOleObject('Excel.Application');
  str := ExtractFilePath(Application.ExeName)+'reports\Zhurnal.XLT';
  E.WorkBooks.Add(str);
  E.Visible := false;
  E.Sheets[1].Select;
  PrintMag(TDBNodeSpecRecObject(DBDekTreeView_TEST1.SelectedObject).ik, E);
  E.Visible := true;
end;

//задает размеры ячеек листа для журнала
//принимает лист Excel
procedure TfrmMain.SetSizes(sh:Variant);
begin
    sh.PageSetup.Orientation:=2; //альбомная ориентация
      sh.Range['A1:AE1'].RowHeight:=22.5;
      sh.Range['A2:AE2'].RowHeight:=19;
      sh.Range['A3:AE3'].RowHeight:=84;
      sh.Range['A4:AE7'].RowHeight:=105;
      sh.Range['A1'].ColumnWidth:=5.14;
      sh.Range['B1'].ColumnWidth:=6;
      sh.Range['C1'].ColumnWidth:=18.43;
      sh.Range['D1'].ColumnWidth:=5.86;
      sh.Range['E1'].ColumnWidth:=3.43;
      sh.Range['F1'].ColumnWidth:=12.29;
      sh.Range['G1'].ColumnWidth:=13.14;
      sh.Range['H1'].ColumnWidth:=11.43;
      sh.Range['I1'].ColumnWidth:=29.86;
      sh.Range['J1'].ColumnWidth:=24.43;
      sh.Range['K1'].ColumnWidth:=5.57;
      sh.Range['L1'].ColumnWidth:=5.43;
      sh.Range['M1'].ColumnWidth:=12.29;
      sh.Range['N1'].ColumnWidth:=8.71;
      sh.Range['O1'].ColumnWidth:=6.57;
      sh.Range['P1:AB1'].ColumnWidth:=3.57;
      sh.Range['R1'].ColumnWidth:=8.57;
      sh.Range['AA1'].ColumnWidth:=5.29;
      sh.Range['AC1'].ColumnWidth:=9.43;
      sh.Range['AD1'].ColumnWidth:=17;
      sh.Range['AE1'].ColumnWidth:=8.43;
end;

procedure TfrmMain.actPrintAllZhurnalExecute(Sender: TObject);
var  E:Variant;
  str:string;
  count:integer;  //кол-во листов в книге
  fl:boolean;  //указывает, следует ли добавлять новый лист
begin
  E := CreateOleObject('Excel.Application');
  str := ExtractFilePath(Application.ExeName)+'reports\Zhurnal.XLT';
  E.WorkBooks.Add(str);
  E.Visible := false;


  E.Sheets[1].Select;
  //определяем коды специальностей, на которые имеется доступ
  //у данного пользователя
  dm.adoqAbitSpecPermisions.Open;
  //начинаем цикл вывода по этим специальностям
  dm.adoqAbitSpecPermisions.First;
  fl:=true; count:=1;
  dm.adoqSpecFac.Open;
  dm.adoqSpecFac.Filter:='';
  while not dm.adoqAbitSpecPermisions.Eof do
  begin
    //копируем лист
    if fl then
    begin
      //задаем размеры ячеек заполненного листа
      if E.Sheets.Count>1 then
        SetSizes(E.Sheets.item[count-1]);
      E.sheets.Add(after:=E.sheets.item[count]);
      inc(count);
      E.Sheets.item[count-1].Range['A1:AE'+inttoStr(3+4)].Copy;
      E.Sheets.item[count].Range['A1:AE'+inttoStr(3+4)].Insert;
      E.Sheets[count-1].Select;
    end;
    if dm.adoqSpecFac.Locate('ik_spec_fac',dm.adoqAbitSpecPermisionsik_spec_fac.Value,[loCaseInsensitive]) then
    begin
      fl:=PrintMag(dm.adoqSpecFacik_spec_fac.Value, E) ;
    end;
    dm.adoqAbitSpecPermisions.Next;
  end;
  //задаем размеры ячеек заполненного листа
  if E.Sheets.Count>1 then
    SetSizes(E.Sheets.item[count-2]);

  //удаляем лишние страницы
  E.DisplayAlerts:=false; E.Sheets[1].Select;
  for count:=(count-1) to E.Sheets.count-1 do
    E.Sheets.item[count].Delete;
  E.Sheets[1].Select;
  E.DisplayAlerts:=true;
  E.Visible := true;
end;


function TfrmMain.PrintMag(ik_spec_fac:integer; E:Variant):boolean;
var i,j,k,balls,exCount, m, count:integer;
      sh:Variant;
      spec:integer;
      str:string;
      FindRange: Variant;
begin

  dm.adospAbitZhurnal.Close;   //общая информация
  dm.adospAbitZhurnal.ProcedureName:='ABIT_get_InfForZhurnal;1';
  dm.adospAbitZhurnal.Parameters.Clear;
  dm.adospAbitZhurnal.Parameters.CreateParameter('@RETURN_VALUE',ftBCD,pdReturnValue,0,0);
  dm.adospAbitZhurnal.Parameters.CreateParameter('@ik_spec_fac',ftBCD,pdInput,0,ik_spec_fac);
  dm.adospAbitZhurnal.Open;
  if dm.adospAbitZhurnal.RecordCount=0 then
  begin
    exit;
  end;
  result:=true;

  dm.adospAbitLangForZhurnal.Close;   //список ин. языков
  dm.adospAbitLangForZhurnal.ProcedureName:='ABIT_get_LangvsForZhurnal;1';
  dm.adospAbitLangForZhurnal.Parameters.Clear;
  dm.adospAbitLangForZhurnal.Parameters.CreateParameter('@RETURN_VALUE',ftBCD,pdReturnValue,0,0);
  dm.adospAbitLangForZhurnal.Parameters.CreateParameter('@ik_spec_fac',ftBCD,pdInput,0,ik_spec_fac);
  dm.adospAbitLangForZhurnal.Open;

  dm.adospAbitDocsForZhurnal.Close;   //список документов
  dm.adospAbitDocsForZhurnal.ProcedureName:='ABIT_get_DocsForZhurnal;1';
  dm.adospAbitDocsForZhurnal.Parameters.Clear;
  dm.adospAbitDocsForZhurnal.Parameters.CreateParameter('@RETURN_VALUE',ftBCD,pdReturnValue,0,0);
  dm.adospAbitDocsForZhurnal.Parameters.CreateParameter('@ik_spec_fac',ftBCD,pdInput,0,ik_spec_fac);
  dm.adospAbitDocsForZhurnal.Open;

  dm.adospAbitExForZhurnal.Close;   //список экзаменов
  dm.adospAbitExForZhurnal.ProcedureName:='ABIT_Get_ekz_Spisok_ForZhurnal;1';
  dm.adospAbitExForZhurnal.Parameters.Clear;
  dm.adospAbitExForZhurnal.Parameters.CreateParameter('@RETURN_VALUE',ftBCD,pdReturnValue,0,0);
  dm.adospAbitExForZhurnal.Parameters.CreateParameter('@ik_spec_fac',ftBCD,pdInput,0,ik_spec_fac);
  dm.adospAbitExForZhurnal.Open;

  dm.adospAbitAddressForZhurnal.Close;   //адреса
  dm.adospAbitAddressForZhurnal.ProcedureName:='ABIT_get_AddrForZhurnal;1';
  dm.adospAbitAddressForZhurnal.Parameters.Clear;
  dm.adospAbitAddressForZhurnal.Parameters.CreateParameter('@RETURN_VALUE',ftBCD,pdReturnValue,0,0);
  dm.adospAbitAddressForZhurnal.Parameters.CreateParameter('@ik_spec_fac',ftBCD,pdInput,0,ik_spec_fac);
  dm.adospAbitAddressForZhurnal.Open;

  m:=4;    //кол-во абитуриентов на одном листе
  //определяем кол-во листов
  count:=(dm.adospAbitZhurnal.RecordCount div m);
  if (dm.adospAbitZhurnal.RecordCount mod m)>0 then
    inc(count);
    //добавляем нужные страницы
  for i:=1 to count-1 do
  begin
     E.Range['A1:AE'+inttoStr(3+m)].Copy;
     E.Range['A'+inttoStr(i*(3+m)+1)+':AE'+inttoStr((i+1)*(3+m))].Insert;
     E.Range['A'+inttoStr(i*(3+m)+1)+':AE'+inttoStr(i*(3+m)+1)].RowHeight:=22.5;
     E.Range['A'+inttoStr(i*(3+m)+2)+':AE'+inttoStr(i*(3+m)+1)].RowHeight:=19;
     E.Range['A'+inttoStr(i*(3+m)+3)+':AE'+inttoStr(i*(3+m)+3)].RowHeight:=84;
     E.Range['A'+inttoStr(i*(3+m)+4)+':AE'+inttoStr((i+1)*(3+m))].RowHeight:=105;
  end;
  //начинаем вывод
  i:=4; //№ строки в Excel
  k:=1; //№ записываемого абитуриента
  while not dm.adospAbitZhurnal.Eof do
  begin
    if (k>1) and (((k-1) mod m)=0) then
      i:=i+3;
    j:=1;
    //вывод общей информации
    E.cells[i,j]:=dm.adospAbitZhurnalRegNomer.AsString; inc(j);
    E.cells[i,j]:=dm.adospAbitZhurnaldd_pod_zayav.AsString;  inc(j);
    E.cells[i,j]:=dm.adospAbitZhurnalStudname.AsString; inc(j);
    E.cells[i,j]:=dm.adospAbitZhurnalDd_birth.AsString;  inc(j);
    if dm.adospAbitZhurnallSex.Value then
       E.cells[i,j]:='М'
    else
       E.cells[i,j]:='Ж';   inc(j);

    //образование
    str:='';
    if dm.adospAbitZhurnalik_kat_zaved.AsString<>'' then
      str:=dm.adospAbitZhurnalcKat_Zaved.AsString;
    str:=str+' '+dm.adospAbitZhurnalcName_zaved.AsString;
    E.cells[i,j]:=str;

    str:='';  //место работы, должность и стаж
     inc(j);
    if dm.adospAbitZhurnalCname_pred.AsString<>'' then
      str:=dm.adospAbitZhurnalCname_pred.AsString;
    if dm.adospAbitZhurnalcDolgnost.AsString<>'' then
      if str<>'' then
        str:=str+', '+dm.adospAbitZhurnalcDolgnost.AsString
      else
        str:=dm.adospAbitZhurnalcDolgnost.AsString;
    if (dm.adospAbitZhurnalStazYear.AsString<>'') then
      if str<>'' then
        str:=str+', '+dm.adospAbitZhurnalStazYear.AsString+' лет'
      else
        str:=dm.adospAbitZhurnalStazYear.AsString+' лет';
    if dm.adospAbitZhurnalStazMonth.AsString<>'' then
      if str<>'' then
        str:=str+', '+dm.adospAbitZhurnalStazMonth.AsString+' месяцев'
      else
        str:=dm.adospAbitZhurnalStazMonth.AsString+' месяцев';

    E.cells[i,j]:=str;   inc(j);

    E.cells[i,j]:=dm.adospAbitZhurnalCname_kat_zach.AsString;
     inc(j);

    //вывод документов
    str:='';
    if dm.adospAbitDocsForZhurnal.Locate('nCode',dm.adospAbitZhurnalnCode.Value,[loCaseInsensitive]) then
    begin
      while (not dm.adospAbitDocsForZhurnal.Eof) and
        (dm.adospAbitDocsForZhurnalnCode.Value=dm.adospAbitZhurnalnCode.Value) do
      begin
        if str='' then
          str:=dm.adospAbitDocsForZhurnalcvid_doc.AsString
        else
          str:=str+'; '+dm.adospAbitDocsForZhurnalcvid_doc.AsString;
        if dm.adospAbitDocsForZhurnalCd_seria.AsString<>'' then
           str:=str+' серия '+dm.adospAbitDocsForZhurnalCd_seria.AsString;
        if dm.adospAbitDocsForZhurnalNp_number.AsString<>'' then
           str:=str+' № '+dm.adospAbitDocsForZhurnalNp_number.AsString;
        if dm.adospAbitDocsForZhurnalDd_vidan.AsString<>'' then
           str:=str+' выдан '+dm.adospAbitDocsForZhurnalDd_vidan.AsString+' г.';
        dm.adospAbitDocsForZhurnal.Next;
      end;
    end;
    E.cells[i,j]:=str;  inc(j);

    //вывод адресов
    str:='';  //фактический
    if dm.adospAbitZhurnalIk_Street_fact.AsString<>'' then
      if dm.adospAbitAddressForZhurnal.Locate('Ik_street',
          dm.adospAbitZhurnalIk_Street_fact.Value,[loCaseInsensitive]) then
      begin
            str:=dm.adospAbitAddressForZhurnalAddress.AsString+', '+
              dm.adospAbitZhurnalAddressf.AsString;
      end;
    //прописка
    if (dm.adospAbitZhurnalIk_Street_prop.AsString<>'') and
        (dm.adospAbitZhurnalIk_Street_prop.Value<>dm.adospAbitZhurnalIk_Street_fact.Value)or
        (dm.adospAbitZhurnalAddressf.Value<>dm.adospAbitZhurnalAddressp.Value) then
      if dm.adospAbitAddressForZhurnal.Locate('Ik_street',
          dm.adospAbitZhurnalIk_Street_prop.Value,[loCaseInsensitive]) then
      begin
        if str<>'' then
            str:=str+'; '+dm.adospAbitAddressForZhurnalAddress.AsString+', '+
              dm.adospAbitZhurnalAddressp.AsString
        else
            str:=dm.adospAbitAddressForZhurnalAddress.AsString+', '+
              dm.adospAbitZhurnalAddressp.AsString;
      end;

    //номера телефонов
    if (dm.adospAbitZhurnalctelefon.AsString<>'') then
      if (str<>'') then
        str := str+'; '+dm.adospAbitZhurnalctelefon.AsString
      else
        str := dm.adospAbitZhurnalctelefon.AsString;
    if (dm.adospAbitZhurnalcSotTel.AsString<>'') then
      if (str<>'') then
        str := str+'; '+dm.adospAbitZhurnalcSotTel.AsString
      else
        str := dm.adospAbitZhurnalcSotTel.AsString;

    E.cells[i,j]:=str;
     inc(j);
    if dm.adospAbitZhurnalLobchegit.Value then
      E.cells[i,j]:='Да'
    else
      E.cells[i,j]:='Нет';   inc(j);

    if dm.adospAbitZhurnalik_medal.Value<>1 then
      E.cells[i,j]:='Да'
    else
      E.cells[i,j]:='Нет';
     j:=j+3;;
    //вывод ин. языков
    str:='';
    if dm.adospAbitLangForZhurnal.Locate('nCode',dm.adospAbitZhurnalnCode.Value,[loCaseInsensitive])
      then
      while (not dm.adospAbitLangForZhurnal.Eof) and
          (dm.adospAbitLangForZhurnalnCode.Value=dm.adospAbitZhurnalnCode.Value) do
      begin
        if str='' then
          str:=dm.adospAbitLangForZhurnalCname_lang.AsString
        else
          str:=str+', '+dm.adospAbitLangForZhurnalCname_lang.AsString;
        dm.adospAbitLangForZhurnal.Next;
      end;
    E.cells[i,j]:=str;  inc(j);

    //вывод экзаменов
    balls:=0;  //общее кол-во баллов
    exCount:=0; //кол-во экзаменов

    if dm.adospAbitExForZhurnal.Locate('NN_abit',dm.adospAbitZhurnalNN_abit.Value,[loCaseInsensitive])
      then
      while (not dm.adospAbitExForZhurnal.Eof) and
        (dm.adospAbitExForZhurnalNN_abit.Value=dm.adospAbitZhurnalNN_abit.Value) do
      begin
        if ((dm.adospAbitExForZhurnalik_disc.Value<>3) and (dm.adospAbitExForZhurnalcosenka.Value>1)) or
            (dm.adospAbitExForZhurnalcosenka.Value>1) then
        begin
          balls:=balls+dm.adospAbitExForZhurnalcosenka.Value;
          inc(exCount);
        end;
        if dm.adospAbitExForZhurnalik_disc.Value <>3 then
        begin
          if dm.adospAbitExForZhurnalcosenka.AsString<>'' then
            str:=dm.adospAbitExForZhurnalcosenka.AsString
          else
            str:='+';
        end;
        case dm.adospAbitExForZhurnalik_disc.Value of
          1:  //математика
              E.cells[i,j]:=str;
          2:  //физика
              E.cells[i,j+1]:=str;
          3:  //русский
            if dm.adospAbitExForZhurnalcosenka.AsString<>'' then
            begin
              if dm.adospAbitExForZhurnalcosenka.Value=0 then
                E.cells[i,j+2]:='незачет';
              if dm.adospAbitExForZhurnalcosenka.Value=1 then
                E.cells[i,j+2]:='зачет';
              if dm.adospAbitExForZhurnalcosenka.Value>1 then
                E.cells[i,j+2]:=dm.adospAbitExForZhurnalcosenka.AsString;
            end
            else
              E.cells[i,j+2]:='+';
          4:  //информатику
            E.cells[i,j+3]:=str;
          5:  //обществознание
            E.cells[i,j+4]:=str;
          8:  //тв. конкурс
            E.cells[i,j+5]:=str;
          7:  //физ. культ.
            E.cells[i,j+6]:=str;
          9:  //черчение
            E.cells[i,j+7]:=str;
          10:  //композиция
            E.cells[i,j+8]:=str;
          11:  //рисунок
            E.cells[i,j+9]:=str;
          12:  //биология
            E.cells[i,j+10]:=str;
        end;
        dm.adospAbitExForZhurnal.Next;
      end;
    j:=j+11;
    if balls>0 then
      E.cells[i,j]:=FloatToStr(balls/exCount);inc(j);
    if balls>0 then
      E.cells[i,j]:=IntToStr(balls);
    dm.adospAbitZhurnal.Next;
    inc(k);
    inc(i);
  end;
  //указываем факультет, специальность и дату
  dm.adoqSpecFac.Open;
  dm.adoqSpecFac.Filter:='';
  if dm.adoqSpecFac.Locate('ik_spec_fac',ik_spec_fac,[loCaseInsensitive]) then
  begin
     str:=dm.adoqSpecFacCname_spec.AsString;
     FindRange := E.Cells.Replace(What := '#Спец#',Replacement:=str);
     str:=dm.adoqSpecFacCshort_name_fac.AsString;
     FindRange := E.Cells.Replace(What := '#Фак#',Replacement:=str);
     E.ActiveSheet.Name:=dm.adoqSpecFacCshort_name_fac.AsString+' '+dm.adoqSpecFacCshort_spec.AsString; 
  end;
  str:=DateToStr(Date);
  FindRange := E.Cells.Replace(What := '#Дата#',Replacement:=str);


end;

procedure TfrmMain.actPrintEgeOtchExecute(Sender: TObject);
var i,j:integer;
      E:Variant;
begin
  E := CreateOleObject('Excel.Application');
  E.WorkBooks.Add;
  E.Visible := false;
  E.Sheets[1].Select;
  dm.adotEgeOtchet.Close;
  dm.adotEgeOtchet.Open;

  //шапка
  i:=1; //бегунокu
  j:=1;
  E.cells[i,j]:='Фамилия';   inc(j);
  E.cells[i,j]:='Имя'; inc(j);
  E.cells[i,j]:='Отчество'; inc(j);
  E.cells[i,j]:='Серия документа'; inc(j);
  E.cells[i,j]:='Номер документа'; inc(j);
  E.cells[i,j]:='Тип документа (в соответствии со справочником)'; inc(j);
  E.cells[i,j]:='Пол (М/Ж)'; inc(j);
  E.cells[i,j]:='Рус'; inc(j);
  E.cells[i,j]:='Мат'; inc(j);
  E.cells[i,j]:='Физ'; inc(j);
  E.cells[i,j]:='Хим'; inc(j);
  E.cells[i,j]:='Био'; inc(j);
  E.cells[i,j]:='Ист'; inc(j);
  E.cells[i,j]:='Инф'; inc(j);
  E.cells[i,j]:='Общ'; inc(j);
  E.cells[i,j]:='Лит'; inc(j);
  E.cells[i,j]:='Дата рождения'; inc(j);
  E.cells[i,j]:='Номер документа об образовании';

  E.Range['A1'].ColumnWidth:=12;
  E.Range['B2'].ColumnWidth:=10;
  E.Range['C3'].ColumnWidth:=13;
  E.Range['D4'].ColumnWidth:=8.6;
  E.Range['E5'].ColumnWidth:=9;
  E.Range['F6'].ColumnWidth:=12.4;
  E.Range['G7'].ColumnWidth:=4.8;
  E.Range['H8:P8'].ColumnWidth:=4;
  E.Range['Q9'].ColumnWidth:=9.5;
  E.Range['R10'].ColumnWidth:=12.5;
  E.Range['O11'].ColumnWidth:=4.5;
  E.Range['A1'].RowHeight:=64;
  E.range['A1:R1'].HorizontalAlignment:=-4108;
  E.range['A1:R1'].VerticalAlignment:=-4108;

  //вывод данных
  dm.adotEgeOtchet.First;
  while not dm.adotEgeOtchet.Eof do
  begin
    j:=1;
    inc(i);
    E.cells[i,j]:=dm.adotEgeOtchetClastname.AsString; inc(j);
    E.cells[i,j]:=dm.adotEgeOtchetCfirstname.AsString; inc(j);
    E.cells[i,j]:=dm.adotEgeOtchetCotch.AsString; inc(j);
    E.cells[i,j]:=dm.adotEgeOtchetCd_seria.AsString; inc(j);
    E.cells[i,j]:=dm.adotEgeOtchetNp_number.AsString; inc(j);
    E.cells[i,j]:=1; inc(j);
    if  dm.adotEgeOtchetlSex.Value then
        E.cells[i,j]:='М'
    else E.cells[i,j]:='Ж';  inc(j);
    E.cells[i,j]:=dm.adotEgeOtchetRuss.AsString; inc(j);
    E.cells[i,j]:=dm.adotEgeOtchetMath.AsString; inc(j);
    E.cells[i,j]:=dm.adotEgeOtchetPhis.AsString; inc(j);
    E.cells[i,j]:=dm.adotEgeOtchetChem.AsString; inc(j);
    E.cells[i,j]:=dm.adotEgeOtchetBiol.AsString; inc(j);
    E.cells[i,j]:=dm.adotEgeOtchetHist.AsString; inc(j);
    E.cells[i,j]:=dm.adotEgeOtchetGeog.AsString; inc(j);
    E.cells[i,j]:=dm.adotEgeOtchetObch.AsString; inc(j);
    E.cells[i,j]:=dm.adotEgeOtchetLitr.AsString; inc(j);
    E.cells[i,j]:=dm.adotEgeOtchetDd_birth.AsString; inc(j);
    E.cells[i,j]:=dm.adotEgeOtchetcAttest.AsString;

    dm.adotEgeOtchet.Next;
  end;
  E.StandardFontSize:=9;
  E.ActiveSheet.PageSetup.Orientation:=2;} //альбомная ориентация
  {E.ActiveSheet.PageSetup.LeftMargin:=10;
  E.ActiveSheet.PageSetup.RightMargin:=10;  }
  {E.range['F2:Q'+IntToStr(i)].HorizontalAlignment:=-4108;
  E.Range['A1:R'+IntToStr(i)].Borders.Weight:=2;
  E.Range['A1:R'+IntToStr(i)].WrapText:=true;
end; }

end.
