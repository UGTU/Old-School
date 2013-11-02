unit uNagruzkaAddPotok;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, Buttons, StdCtrls, ActnList, ExtCtrls, DBGridEh, Contnrs,
  Mask, DBCtrlsEh, DBLookupEh, ComCtrls, DB, ADODB, NagruzkaController, NagruzkaClasses,
  GeneralController, ImgList;

type

  TfrmAddPotok = class(TfrmBaseDialog)
    Label1: TLabel;
    dbcbYear: TDBLookupComboboxEh;
    dbcbFaculty: TDBLookupComboboxEh;
    Label10: TLabel;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    ListBox3: TListBox;
    actFindPotok: TAction;
    CheckBox1: TCheckBox;
    ImageList1: TImageList;
    Panel4: TPanel;
    dbcbNorms: TDBLookupComboboxEh;
    dbcbUchPlan: TDBLookupComboboxEh;
    dbeName: TDBEditEh;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Timer1: TTimer;
    Panel6: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Label2: TLabel;
    ListBox1: TListBox;
    Panel5: TPanel;
    Label3: TLabel;
    sbDelOneSpec: TSpeedButton;
    sbDelManySpec: TSpeedButton;
    sbAddOneSpec: TSpeedButton;
    sbAddManySpec: TSpeedButton;
    Label12: TLabel;
    ListBox2: TListBox;
    Splitter2: TSplitter;
    Panel7: TPanel;
    CheckBox2: TCheckBox;
    Panel8: TPanel;
    Splitter3: TSplitter;
    Panel9: TPanel;
    Label13: TLabel;
    ListBox4: TListBox;
    Panel10: TPanel;
    Label14: TLabel;
    sbDelOneGroup: TSpeedButton;
    sbDelManyGroup: TSpeedButton;
    sbAddOneGroup: TSpeedButton;
    sbAddManyGroup: TSpeedButton;
    Label15: TLabel;
    ListBox5: TListBox;
    Image1: TImage;
    Image9: TImage;
    Label17: TLabel;
    Label16: TLabel;
    addGroupPanel: TPanel;
    procedure dbcbFacultyKeyValueChanged(Sender: TObject);
    procedure dbcbYearKeyValueChanged(Sender: TObject);
    procedure sbAddManySpecClick(Sender: TObject);
    procedure sbDelManySpecClick(Sender: TObject);
    procedure sbAddOneSpecClick(Sender: TObject);
    procedure dbeNameChange(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure actFindPotokExecute(Sender: TObject);
    procedure actFindPotokUpdate(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Splitter2CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure ListBox4Click(Sender: TObject);
    procedure ListBox5Click(Sender: TObject);
    procedure sbAddManyGroupClick(Sender: TObject);
    procedure sbAddOneGroupClick(Sender: TObject);
    procedure sbDelManyGroupClick(Sender: TObject);
    procedure Label17MouseEnter(Sender: TObject);
    procedure Label17MouseLeave(Sender: TObject);
    procedure Label16MouseEnter(Sender: TObject);
    procedure Label16MouseLeave(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure Label17Click(Sender: TObject);
   private
    fFormStartClosing: boolean;
    specIK,yearIK: TStringList;
    fGroupsTrashList, fSpecTrashList: TList;
    fCurYear, fCurSem, fPotokIK: integer;
    fPotokSpec: TSpecNodes;

    procedure AddGroupOfSpec(index: integer; year: string);
    procedure DelGroupOfSpec(index: integer);
    procedure AddGroupOfGroup(index: integer);
    procedure DelGroupOfGroup(index: integer);
   // function RebuildPotokName: string;
    procedure PutGroupsInTrashList(SpecIK: integer);
    procedure PutSpecsInTrashList(SpecIK: integer);
    procedure GetGroupsFromTrashList(SpecIK: integer);
    procedure GetSpecsFromTrashList(SpecIK: integer);
    procedure ReloadPotentialSpec; // загружает специальнссти для выбора
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    destructor Destroy; override;
    property CurYear: integer write fCurYear;
    property CurSem: integer write fCurSem;
    procedure Read;
  end;

var
  frmAddPotok: TfrmAddPotok;

implementation


{$R *.dfm}

{ TfrmAddPotok }

function TfrmAddPotok.DoApply: boolean;
var
  i: integer;
  groupIK: TStringList;
begin
  Result:= false;

  groupIK:= TStringList.Create;
  try
    if CheckBox1.Checked and CheckBox1.Enabled then
     // Result:= TNagruzkaController.Preparation.SavePotok(true, TFoundedPotok(ListBox3.Items.Objects[ListBox3.ItemIndex]).PotokIK, dbeName.Text, IK, dbcbNorms.KeyValue, dbcbYear.KeyValue, dbcbUchPlan.KeyValue, specIK,yearIK, groupIK, fCurYear, fCurSem)
    else
    begin
      if ListBox2.Count > 0 then

      if CheckBox2.Checked then
        if ListBox5.Count > 0 then
          for i:= 0 to ListBox5.Count-1 do
            groupIK.Add(IntToStr((ListBox5.Items.Objects[i] as TSpecNode).GroupIK));
      {if Tag>0 then
            Result:= TNagruzkaController.Preparation.SavePotok(true, fPotokIK, dbeName.Text, IK, dbcbNorms.KeyValue, dbcbYear.KeyValue, dbcbUchPlan.KeyValue, specIK,yearIK, groupIK, fCurYear,fCurSem)
         else Result:= TNagruzkaController.Preparation.SavePotok(false, Tag, dbeName.Text, IK, dbcbNorms.KeyValue, dbcbYear.KeyValue, dbcbUchPlan.KeyValue, specIK,yearIK, groupIK, fCurYear,fCurSem);}
    end;
  finally
    specIK.Free;
  end;
end;

function TfrmAddPotok.DoCancel: boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о событии', MB_YESNOCANCEL)) of
      mrYes: OK;
      mrNo: Result:= true;
      mrCancel: Result:= false;
      else Result:= false;
  end;
end;

procedure TfrmAddPotok.FormResize(Sender: TObject);
begin
  if Tag < 0 then
    Panel2.Height:= ClientHeight - 252
  else Panel2.Height:= ClientHeight - 172;
end;

procedure TfrmAddPotok.GetGroupsFromTrashList(SpecIK: integer);
var
  i: integer;
begin
  i:= 0;
  while i <= fGroupsTrashList.Count-1 do
  begin
    if TSpecNode(fGroupsTrashList[i]).SpecIK = SpecIK then
    begin
      ListBox4.Items.AddObject(TSpecNode(fGroupsTrashList[i]).GroupName, fGroupsTrashList[i]);
      fGroupsTrashList.Delete(i);
    end
    else inc(i);
  end;
end;

procedure TfrmAddPotok.GetSpecsFromTrashList(SpecIK: integer);
var
  i: integer;
  isNeedToGet: boolean;
begin
  isNeedToGet:= true;
  if ListBox5.Items.Count > 0 then
    for I := 0 to ListBox5.Items.Count - 1 do
      if (TSpecNode(ListBox5.Items.Objects[i]).SpecIK = SpecIK) then
      begin
        isNeedToGet:= false;
        break;
      end;
  if isNeedToGet then
  begin
    i:= 0;
    while i <= fSpecTrashList.Count-1 do
    begin
      if TSpecNode(fSpecTrashList[i]).SpecIK = SpecIK then
      begin
        ListBox1.Items.AddObject(TSpecNode(fSpecTrashList[i]).SpecShortName, fSpecTrashList[i]);
        fSpecTrashList.Delete(i);
      end
      else inc(i);
    end;
  end;
end;

procedure TfrmAddPotok.Read;
var
  bFirst: boolean;
  prevFacIK: integer;
  tempDS: TADODataSet;
begin
  fGroupsTrashList:= TList.Create;
  fSpecTrashList:= TList.Create;
  fFormStartClosing:= false;
  specIK:= TStringList.Create;
  yearIK := TStringList.Create;

  fPotokSpec := TSpecNodes.Create;

  TGeneralController.Instance.InitializeLockupCB(@dbcbFaculty, 'ik_fac', 'Cname_fac');
  TGeneralController.Instance.InitializeLockupCB(@dbcbYear, 'ik_year_uch_pl', 'year_value');
  TGeneralController.Instance.InitializeLockupCB(@dbcbUchPlan, 'ik_uch_plan', 'full_name');
  TGeneralController.Instance.InitializeLockupCB(@dbcbNorms, 'ik_norm_of_time', 'cName_norm');
  TNagruzkaController.Preparation.GetFacForDepByUchPlan(@dbcbFaculty.ListSource.DataSet, IK);

  if (Tag >= 0) then
  begin
    Caption:= 'Изменение информации о потоке';
    HelpKeyword:= 'Нагрузка\Edit_Thread.htm';
    CheckBox1.Visible:= false;
    SpeedButton1.Visible:= false;
    ListBox3.Visible:= false;

    try
      DataSet:= TGeneralController.Instance.GetNewADODataSet(false);
      tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
      (DataSet as TADODataSet).CommandText:= 'SELECT ik_fac From Relation_spec_fac Where ik_spec_fac in (SELECT ik_spec_fac FROM Relation_potok_spec rps,dbo.Potok_semestr ps '+
                                             'WHERE rps.ik_potok = ps.id_potok and ps.ik_potok_semestr =' + IntToStr(Tag) + ')';
      DataSet.Open;
      bFirst:= true;
      while (not DataSet.Eof) do
      begin
        if (bFirst) then
        begin
          dbcbFaculty.KeyValue:= DataSet.FieldByName('ik_fac').AsInteger;
          prevFacIK:= DataSet.FieldByName('ik_fac').AsInteger;
          bFirst:= false;
        end
        else
        begin
          if prevFacIK <> DataSet.FieldByName('ik_fac').AsInteger then
          begin
            dbcbFaculty.KeyValue:= NULL;
            break;
          end;
        end;
        DataSet.Next;
      end;
      DataSet.Close;
      if bFirst then
      begin
        (DataSet as TADODataSet).CommandText:= 'SELECT ik_fac From Relation_spec_fac Where ik_spec_fac in (SELECT ik_spec_fac FROM Grup WHERE ik_grup in (SELECT ik_grup FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(Tag) + '))';
        DataSet.Open;
        while (not DataSet.Eof) do
        begin
          if (bFirst) then
          begin
            dbcbFaculty.KeyValue:= DataSet.FieldByName('ik_fac').AsInteger;
            prevFacIK:= DataSet.FieldByName('ik_fac').AsInteger;
            bFirst:= false;
          end
          else
          begin
            if prevFacIK <> DataSet.FieldByName('ik_fac').AsInteger then
            begin
              dbcbFaculty.KeyValue:= NULL;
              break;
            end;
          end;
          DataSet.Next;
        end;
        DataSet.Close;
      end;


      tempDS.CommandText:= 'Select ik_year_enter,ps.ik_norm_of_time,ik_uch_plan,Cname_potok,id_potok From Potok,Potok_semestr ps Where ps.id_potok = Potok.ik_potok and ik_potok_semestr = ' + IntToStr(Tag);
      tempDS.Open;

      dbcbYear.KeyValue:= TNagruzkaController.Directory.GetAllYearsForSpec(@dbcbYear.ListSource.DataSet, dbcbFaculty.KeyValue, false, TGeneralController.Instance.CloseLockupCB(@dbcbYear));

      dbcbNorms.KeyValue:= tempDS.FieldByName('ik_norm_of_time').AsInteger;
      dbcbUchPlan.KeyValue:= tempDS.FieldByName('ik_uch_plan').AsInteger;
      dbeName.Text:= tempDS.FieldByName('Cname_potok').AsString;
      fPotokIK := tempDS.FieldByName('id_potok').AsInteger;
      tempDS.Close;

      (DataSet as TADODataSet).CommandText:= 'SELECT rsf.ik_spec_fac, (Cshort_name_fac + '' - '' +  Sh_spec + '' '' + Cshort_spec + '' '' + cShort_name_direction) as full_name, Cshort_spec,rsf.ik_spec,year_value,rps.ik_year_enter ' +
        'From  Spec_stud INNER JOIN Direction ON Spec_stud.ik_direction = Direction.ik_direction INNER JOIN Relation_spec_fac rsf ON Spec_stud.ik_spec = rsf.ik_spec ' +
        'INNER JOIN Relation_potok_spec rps ON rps.ik_spec_fac=rsf.ik_spec_fac INNER JOIN Potok_semestr ps ON rps.ik_potok = ps.id_potok INNER JOIN Year_uch_pl yup ON rps.ik_year_enter = yup.ik_year_uch_pl INNER JOIN Fac ON rsf.ik_fac = Fac.ik_fac '+
        'Where rsf.ik_spec_fac in (SELECT ik_spec_fac FROM Relation_potok_spec rps, Potok_semestr ps WHERE ps.id_potok=rps.ik_potok and ik_potok_semestr = ' + IntToStr(Tag) + ') and '+
        'ps.ik_potok_semestr =' +IntToStr(Tag)+' ORDER BY Cshort_spec, Cshort_name_fac';
      DataSet.Open;
      DataSet.First;
      while (not DataSet.Eof) do
      begin
        ListBox2.AddItem(DataSet.FieldByName('full_name').AsString + ' ' + DataSet.FieldByName('year_value').AsString,
           TSpecNode.Create(DataSet.FieldByName('ik_spec_fac').AsInteger,DataSet.FieldByName('ik_year_enter').AsInteger, DataSet.FieldByName('Cshort_spec').AsString, DataSet.FieldByName('year_value').AsString{DataSet.FieldByName('full_name').AsString}));
        if (ListBox1.Items.IndexOf(DataSet.FieldByName('full_name').AsString) >= 0) then
          ListBox1.Items.Delete(ListBox1.Items.IndexOf(DataSet.FieldByName('full_name').AsString));
        yearIK.Add(DataSet.FieldByName('ik_year_enter').AsString);
        dbcbYear.KeyValue := DataSet.FieldByName('ik_year_enter').AsInteger;
        specIK.Add(DataSet.FieldByName('ik_spec_fac').AsString);

        fPotokSpec.Add(TSpecNode.Create(DataSet.FieldByName('ik_spec_fac').AsInteger,DataSet.FieldByName('ik_year_enter').AsInteger,
        DataSet.FieldByName('Cshort_spec').AsString, DataSet.FieldByName('year_value').AsString));

        DataSet.Next;
      end;
      DataSet.Close;

      (DataSet as TADODataSet).CommandText:= 'SELECT cName_grup, rsf.ik_spec_fac, Cshort_spec, Grup.ik_grup FROM Grup INNER JOIN Relation_potok_grup rpg ON Grup.ik_grup = rpg.ik_grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac ' +
        ' INNER JOIN Spec_stud ON rsf.ik_spec = Spec_stud.ik_spec WHERE ik_potok = ' + IntToStr(Tag);
      DataSet.Open;
      if DataSet.RecordCount > 0 then CheckBox2.Checked:= true;
      DataSet.First;
      while (not DataSet.Eof) do
      begin
        ListBox5.AddItem(DataSet.FieldByName('cName_grup').AsString, TSpecNode.Create(DataSet.FieldByName('ik_grup').AsInteger, DataSet.FieldByName('ik_spec_fac').AsInteger, DataSet.FieldByName('cName_grup').AsString, DataSet.FieldByName('Cshort_spec').AsString));
        if (ListBox4.Items.IndexOf(DataSet.FieldByName('cName_grup').AsString) >= 0) then
          ListBox4.Items.Delete(ListBox4.Items.IndexOf(DataSet.FieldByName('cName_grup').AsString));
        DataSet.Next;
      end;
      DataSet.Close;
    finally
      if Assigned(tempDS) then tempDS.Free;
      if Assigned(DataSet) then DataSet.Free;
    end;
  end
  else
  begin
    Caption:= 'Добавление нового потока';
    HelpKeyword:= 'Нагрузка\Add_Thread.htm';
    dbcbFacultyKeyValueChanged(dbcbFaculty);
  end;
  CheckBox2Click(CheckBox2);
  ReloadPotentialSpec;
  IsModified:= false;
end;

{function TfrmAddPotok.RebuildPotokName: string;
var
  i: integer;
  tempStr, tSp, tYe: string;
  spec, year: TStringList;
begin

  if (ListBox5.Items.Count = 1) and (ListBox2.Items.Count = 0) and (Assigned(ListBox5.Items.Objects[0])) then
  begin
    Result:= TGroupNode(ListBox5.Items.Objects[0]).GroupName;
    exit;
  end;
  spec:= TStringList.Create;
  year:= TStringList.Create;
  tempStr:= '';
  //выбираем все уникальные специальности и года
  if ListBox2.Items.Count>0 then
    for I := 0 to yearIK.Count - 1 do
    begin
      tSp := TSpecNode(ListBox2.Items.Objects[i]).SpecShortName;
      dbcbYear.ListSource.DataSet.Locate('ik_year_uch_pl',yearIK[i],[]);
      tYe := dbcbYear.ListSource.DataSet.FieldByName('year_value').AsString;
      if spec.IndexOf(tSp)<0 then spec.Add(tSp);
      if year.IndexOf(tYe)<0 then year.Add(tYe);
    end;
  //добавляем в имя специальности
  for I := 0 to spec.Count - 1 do
  begin
    tempStr:= tempStr + spec[i];
    if i <> spec.Count - 1 then
        tempStr:= tempStr + ', ';
  end;
  //добавляем в имя года
  tempStr:= tempStr + ' - ';
  for I := 0 to year.Count - 1 do
  begin
    tempStr:= tempStr + Copy(year[i], 3, 2);
    if i <> year.Count - 1 then
        tempStr:= tempStr + ', ';
  end;

  if ListBox5.Items.Count > 0 then
    for I := 0 to ListBox5.Items.Count - 1 do
    begin
      if Assigned(ListBox5.Items.Objects[i]) then
        if Pos(TGroupNode(ListBox5.Items.Objects[i]).SpecName, tempStr) = 0 then
        begin
          if Length(tempStr) > 0 then tempStr:= tempStr + ', ';
          tempStr:= tempStr + TGroupNode(ListBox5.Items.Objects[i]).SpecName;
        end;
    end;

  if dbcbFaculty.Value = 6 then tempStr := tempStr + 'з';    //если заочники
  Result := tempStr;
  spec.Free;
  year.Free;
end;       }

procedure TfrmAddPotok.ReloadPotentialSpec;
var
  tempDataSet: TADODataSet;
  i, n: integer;
begin
  if fFormStartClosing then exit;
  ListBox1.Items.Clear;
 // ListBox4.Items.Clear;
//  ListBox2.Items.Clear;
  if (dbcbYear.KeyValue <> NULL) then
  begin
    
    tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
    if (dbcbFaculty.KeyValue <> NULL) then
      tempDataSet.CommandText:= 'Select rsf.ik_spec_fac, (Cshort_name_fac + '' - '' + IsNull(Sh_spec,'''') + '' '' + Cshort_spec + '' '' + cShort_name_direction) as full_name, Cshort_spec From Spec_stud INNER JOIN Direction ON Spec_stud.ik_direction = Direction.ik_direction ' +
        'INNER JOIN Relation_spec_fac rsf ON Spec_stud.ik_spec = rsf.ik_spec INNER JOIN Fac ON rsf.ik_fac = Fac.ik_fac Where (rsf.ik_fac = ' + VarToStr(dbcbFaculty.KeyValue) + ') and (ISNULL(YEAR(dDate_spec), ' + dbcbYear.ListSource.DataSet.FieldByName('year_value').AsString + ') <= ' + dbcbYear.ListSource.DataSet.FieldByName('year_value').AsString + ')' +
        ' and rsf.ik_spec_fac in (select ik_spec_fac from ABIT_Diapazon_spec_fac where NNyear = ' +
        dbcbYear.ListSource.DataSet.FieldByName('year_value').AsString + ') ORDER BY Cshort_name_fac, Cshort_spec'
    else
      tempDataSet.CommandText:= 'Select rsf.ik_spec_fac, (Cshort_name_fac + '' - '' + IsNull(Sh_spec,'''') + '' '' + Cshort_spec + '' '' + cShort_name_direction) as full_name, Cshort_spec From Spec_stud INNER JOIN Direction ON Spec_stud.ik_direction = Direction.ik_direction ' +
        'INNER JOIN Relation_spec_fac rsf ON Spec_stud.ik_spec = rsf.ik_spec INNER JOIN Fac ON rsf.ik_fac = Fac.ik_fac Where (ISNULL(YEAR(dDate_spec), ' + dbcbYear.ListSource.DataSet.FieldByName('year_value').AsString + ') <= ' + dbcbYear.ListSource.DataSet.FieldByName('year_value').AsString + ') and rsf.ik_spec_fac in (select ik_spec_fac from ABIT_Diapazon_spec_fac where NNyear = ' +
        dbcbYear.ListSource.DataSet.FieldByName('year_value').AsString + ') ORDER BY Cshort_name_fac, Cshort_spec';
    tempDataSet.Open;
    while (not tempDataSet.Eof) do
    begin
      ListBox1.AddItem(tempDataSet.FieldByName('full_name').AsString, TSpecNode.Create(tempDataSet.FieldByName('ik_spec_fac').AsInteger,dbcbYear.KeyValue, tempDataSet.FieldByName('Cshort_spec').AsString, dbcbYear.Value));
      tempDataSet.Next;
    end;
    tempDataSet.Close;

    i:= 0;
    while i <= ListBox2.Items.Count - 1 do
    begin
      n:= ListBox1.Items.IndexOf((ListBox2.Items.Objects[i] as TSpecNode).SpecShortName);
      if (n >= 0) and (StrToInt(yearIK[i])=dbcbYear.KeyValue) then
      begin
        ListBox1.Items.Delete(n);
      end;
     inc(i);
     // else ListBox2.Items.Delete(i);
    end;

    // подгрузим группы

   { if (dbcbFaculty.KeyValue <> NULL) then
      tempDataSet.CommandText:= 'Select ik_grup, Grup.ik_spec_fac, cName_grup, Cshort_spec From Grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac ' +
        'INNER JOIN Fac ON rsf.ik_fac = Fac.ik_fac INNER JOIN Spec_stud ON rsf.ik_spec = Spec_stud.ik_spec Where (rsf.ik_fac = ' + VarToStr(dbcbFaculty.KeyValue) + ') and (ISNULL(nYear_post, ' + dbcbYear.ListSource.DataSet.FieldByName('year_value').AsString + ') = ' + dbcbYear.ListSource.DataSet.FieldByName('year_value').AsString + ') ORDER BY Cname_grup'
    else
      tempDataSet.CommandText:= 'Select ik_grup, Grup.ik_spec_fac, cName_grup, Cshort_spec From Grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac INNER JOIN Spec_stud ON rsf.ik_spec = Spec_stud.ik_spec Where (ISNULL(nYear_post, ' + dbcbYear.ListSource.DataSet.FieldByName('year_value').AsString + ') = ' + dbcbYear.ListSource.DataSet.FieldByName('year_value').AsString + ') ORDER BY Cname_grup';
    tempDataSet.Open;
    while (not tempDataSet.Eof) do
    begin
      ListBox4.AddItem(tempDataSet.FieldByName('cName_grup').AsString, TGroupNode.Create(tempDataSet.FieldByName('ik_grup').AsInteger, tempDataSet.FieldByName('ik_spec_fac').AsInteger, tempDataSet.FieldByName('cName_grup').AsString, tempDataSet.FieldByName('Cshort_spec').AsString));
      tempDataSet.Next;
    end;
    tempDataSet.Close;

    i:= 0;
    while i <= ListBox5.Items.Count - 1 do
    begin
      n:= ListBox4.Items.IndexOf(ListBox5.Items[i]);
      if n >= 0 then
      begin
        ListBox4.Items.Delete(n);
        inc(i);
      end
      else ListBox5.Items.Delete(i);
    end;

    tempDataSet.Free;   }
  end;
  if Tag = 0 then
  begin
    dbeName.Text:= TNagruzkaController.Preparation.RebuildPotokName(fPotokSpec, dbcbFaculty.KeyValue);
    dbeNameChange(nil);
  end;
end;

procedure TfrmAddPotok.dbcbFacultyKeyValueChanged(Sender: TObject);
var
  YearIK: Variant;
begin
  if fFormStartClosing then exit;
  YearIK:= TNagruzkaController.Directory.GetAllYearsForSpec(@dbcbYear.ListSource.DataSet, dbcbFaculty.KeyValue, false, TGeneralController.Instance.CloseLockupCB(@dbcbYear));
  if dbcbYear.KeyValue <> NULL then
  begin
      if dbcbYear.KeyValue = YearIK then dbcbYearKeyValueChanged(dbcbYear)
      else dbcbYear.KeyValue:= YearIK;
  end
  else dbcbYear.KeyValue:= YearIK;
end;

procedure TfrmAddPotok.dbcbYearKeyValueChanged(Sender: TObject);
begin
  if (dbcbYear.KeyValue <> NULL) then
  begin
    dbcbNorms.KeyValue:= TNagruzkaController.Preparation.GetAllNormsOfTimeForAddPotok(@dbcbNorms.ListSource.DataSet, dbcbYear.KeyValue, false, TGeneralController.Instance.CloseLockupCB(@dbcbNorms));
    if (dbcbNorms.KeyValue = NULL) then
    begin
      if dbcbNorms.ListSource.DataSet.Locate('ik_spec_fac', NULL, [loPartialKey]) then
        dbcbNorms.KeyValue:= dbcbNorms.ListSource.DataSet.FieldByName('ik_norm_of_time').AsInteger;
    end
    else
    begin
      if not dbcbNorms.ListSource.DataSet.Locate('ik_norm_of_time', dbcbNorms.KeyValue, [loPartialKey]) then
        if dbcbNorms.ListSource.DataSet.Locate('ik_spec_fac', NULL, [loPartialKey]) then
          dbcbNorms.KeyValue:= dbcbNorms.ListSource.DataSet.FieldByName('ik_norm_of_time').AsInteger;
    end;

    dbcbUchPlan.KeyValue:= TNagruzkaController.Preparation.GetAllUchPlanForAddPotok(@dbcbUchPlan.ListSource.DataSet, dbcbFaculty.KeyValue, dbcbYear.KeyValue, false, TGeneralController.Instance.CloseLockupCB(@dbcbUchPlan));
   ReloadPotentialSpec;
  end;
end;

procedure TfrmAddPotok.actFindPotokExecute(Sender: TObject);
var
  specList, groupList: TStringList;
  potokList: TList;
  i: integer;
begin
  ListBox3.Items.Clear;
  specList:= TStringList.Create;
  if ListBox2.Items.Count > 0 then
    for I := 0 to ListBox2.Items.Count - 1 do
      specList.Add(IntToStr(TSpecNode(ListBox2.Items.Objects[i]).SpecIK));
  groupList:= TStringList.Create;
  if ListBox5.Items.Count > 0 then
  for I := 0 to ListBox5.Items.Count - 1 do
    groupList.Add(IntToStr(TSpecNode(ListBox5.Items.Objects[i]).GroupIK));
  potokList:= TNagruzkaController.Preparation.GetPotoksWithSameSpecFac(specList, groupList, dbcbYear.KeyValue);
  if Assigned(potokList) then
  begin
    if potokList.Count > 0 then    
      for I := 0 to potokList.Count - 1 do
        ListBox3.AddItem(TFoundedPotok(potokList[i]).PotokName, potokList[i]);
    FreeAndNil(potokList);
  end;
  if ListBox3.Items.Count > 0 then
    ListBox3.Tag:= 1
  else
  begin
    ListBox3.Tag:= 0;
    ListBox3.Items.Add('<не найдено>')
  end;
  SpeedButton1.Font.Color:= clWindowText;
  Timer1.Enabled:= false;
end;

procedure TfrmAddPotok.actFindPotokUpdate(Sender: TObject);
begin
  //actFindPotok.Enabled:= ((ListBox2.Items.Count > 0) or (ListBox5.Items.Count > 0)) and (dbcbYear.KeyValue <> NULL);
  //CheckBox1.Enabled:= (ListBox3.ItemIndex >= 0) and (ListBox3.Tag = 1);
end;

procedure TfrmAddPotok.AddGroupOfGroup(index: integer);
var
  specIK: integer;
  uchPlanIK: Variant;
begin
  if (dbcbUchPlan.KeyValue = NULL) then
  begin
    uchPlanIK:= TNagruzkaController.Preparation.GetUchPlanOfGroup(TSpecNode(ListBox4.Items.Objects[index]).GroupIK);
    if uchPlanIK <> NULL then
      if dbcbUchPlan.ListSource.DataSet.Locate('ik_uch_plan', uchPlanIK, [loPartialKey]) then
        dbcbUchPlan.KeyValue:= uchPlanIK;
  end;       
  ListBox5.AddItem(ListBox4.Items[index], ListBox4.Items.Objects[index]);
  specIK:= TSpecNode(ListBox4.Items.Objects[index]).SpecIK;
  ListBox4.Items.Delete(index);
  PutSpecsInTrashList(specIK);
  if dbcbNorms.ListSource.DataSet.FieldByName('ik_spec_fac').AsInteger <> specIK then
    if dbcbNorms.ListSource.DataSet.Locate('ik_spec_fac', specIK, [loPartialKey]) then
      dbcbNorms.KeyValue:= dbcbNorms.ListSource.DataSet.FieldByName('ik_norm_of_time').AsInteger;
end;

procedure TfrmAddPotok.AddGroupOfSpec(index: integer; year: string);
var
  specIK: integer;
  uchPlanIK: Variant;
begin
  specIK:= TSpecNode(ListBox1.Items.Objects[index]).SpecIK;
  if (dbcbUchPlan.KeyValue = NULL) and (dbcbYear.KeyValue <> NULL) then
  begin
    uchPlanIK:= TNagruzkaController.Preparation.GetUchPlanOfAnyGroupOfSpec(specIK, dbcbYear.KeyValue);
    if uchPlanIK <> NULL then
      if dbcbUchPlan.ListSource.DataSet.Locate('ik_uch_plan', uchPlanIK, [loPartialKey]) then
        dbcbUchPlan.KeyValue:= uchPlanIK;
  end;
  ListBox2.AddItem(ListBox1.Items[index]+' ' + year, ListBox1.Items.Objects[index]);
 // ListBox1.Items.Delete(index);
  PutGroupsInTrashList(specIK);
  if dbcbNorms.ListSource.DataSet.FieldByName('ik_spec_fac').AsInteger <> specIK then
    if dbcbNorms.ListSource.DataSet.Locate('ik_spec_fac', specIK, [loPartialKey]) then
      dbcbNorms.KeyValue:= dbcbNorms.ListSource.DataSet.FieldByName('ik_norm_of_time').AsInteger;
end;

procedure TfrmAddPotok.CheckBox2Click(Sender: TObject);
var
  n: integer;
begin
  if CheckBox2.Checked then
  begin
    Panel6.Height:= Panel2.Height + 171;
    Panel7.Height:= 168;
    Panel8.Visible:= true;
    Panel8.Height:= 146;
    Splitter2.Visible:= true;
    Splitter2.Top:= Panel2.Height + 1;
    CheckBox2.Top:= 3;
    ListBox4.Height:= Panel9.Height - 23;
    ListBox5.Height:= Panel10.Height - 23;
  end
  else
  begin
    Splitter2.Visible:= false;
    n:= Panel7.Height;
    Panel7.Height:= 22;
    Panel6.Height:= Panel6.Height - n + 22;
    Panel8.Visible:= false;
    CheckBox2.Top:= 5;
  end;
  if Tag < 0 then
    ClientHeight:= 235 + Panel6.Height
  else ClientHeight:= 170 + Panel6.Height;
  ListBox1.Height:= Panel3.Height - 23;
  ListBox2.Height:= Panel5.Height - 23;
  Top:= round((Screen.Height - Height)/2);
  Left:= round((Screen.Width - Width)/2);
end;



procedure TfrmAddPotok.DelGroupOfGroup(index: integer);
var
  specIK, i: integer;
begin
  ListBox4.AddItem(ListBox5.Items[index], ListBox5.Items.Objects[index]);
  specIK:= TSpecNode(ListBox5.Items.Objects[index]).SpecIK;
  ListBox5.Items.Delete(index);
  GetSpecsFromTrashList(specIK);
  if dbcbNorms.ListSource.DataSet.FieldByName('ik_spec_fac').AsInteger = specIK then
  begin
    if ListBox5.Items.Count > 0 then
      for I := 0 to ListBox5.Items.Count - 1 do
        if dbcbNorms.ListSource.DataSet.Locate('ik_spec_fac', TSpecNode(ListBox5.Items.Objects[i]).SpecIK, [loPartialKey]) then
        begin
          dbcbNorms.KeyValue:= dbcbNorms.ListSource.DataSet.FieldByName('ik_norm_of_time').AsInteger;
          exit;
        end;
    if dbcbNorms.ListSource.DataSet.Locate('ik_spec_fac', NULL, [loPartialKey]) then
      dbcbNorms.KeyValue:= dbcbNorms.ListSource.DataSet.FieldByName('ik_norm_of_time').AsInteger;
  end;
end;

procedure TfrmAddPotok.DelGroupOfSpec(index: integer);
var
  sp, i: integer;
  spName: string;
begin
  spName:= TSpecNode(ListBox2.Items.Objects[index]).SpecShortName;
 { if (ListBox1.Items.IndexOf(spName)<0)and(dbcbYear.KeyValue = StrToInt(yearIK[index])) then
     ListBox1.AddItem(FFacName + ' ' + spName, ListBox2.Items.Objects[index]);   }
  sp:= TSpecNode(ListBox2.Items.Objects[index]).SpecIK;
  ListBox2.Items.Delete(index);
  GetGroupsFromTrashList(sp);
  if dbcbNorms.ListSource.DataSet.FieldByName('ik_spec_fac').AsInteger = sp then
  begin
    if ListBox2.Items.Count > 0 then
      for I := 0 to ListBox2.Items.Count - 1 do
        if dbcbNorms.ListSource.DataSet.Locate('ik_spec_fac', TSpecNode(ListBox2.Items.Objects[i]).SpecIK, [loPartialKey]) then
        begin
          dbcbNorms.KeyValue:= dbcbNorms.ListSource.DataSet.FieldByName('ik_norm_of_time').AsInteger;
          exit;
        end;
    if dbcbNorms.ListSource.DataSet.Locate('ik_spec_fac', NULL, [loPartialKey]) then
      dbcbNorms.KeyValue:= dbcbNorms.ListSource.DataSet.FieldByName('ik_norm_of_time').AsInteger;
  end;
end;

destructor TfrmAddPotok.Destroy;
var
  i: integer;
begin
  fPotokSpec.Clear;
  fPotokSpec.Free;

  fFormStartClosing:= true;
  if ListBox1.Items.Count > 0 then
    for I := 0 to ListBox1.Items.Count - 1 do
      if Assigned(ListBox1.Items.Objects[i]) then
        ListBox1.Items.Objects[i].Free;
  if ListBox2.Items.Count > 0 then
    for I := 0 to ListBox2.Items.Count - 1 do
      if Assigned(ListBox2.Items.Objects[i]) then
        ListBox2.Items.Objects[i].Free;
  if ListBox4.Items.Count > 0 then
    for I := 0 to ListBox4.Items.Count - 1 do
      if Assigned(ListBox4.Items.Objects[i]) then
        ListBox4.Items.Objects[i].Free;
  if ListBox5.Items.Count > 0 then
    for I := 0 to ListBox5.Items.Count - 1 do
      if Assigned(ListBox5.Items.Objects[i]) then
        ListBox5.Items.Objects[i].Free;
  if Assigned(fGroupsTrashList) then
  begin
    if fGroupsTrashList.Count > 0 then
      for I := 0 to fGroupsTrashList.Count - 1 do
        if Assigned(fGroupsTrashList[i]) then
          TSpecNode(fGroupsTrashList[i]).Free;
    fGroupsTrashList.Free;
  end;
  if Assigned(fSpecTrashList) then
  begin
    if fSpecTrashList.Count > 0 then
      for I := 0 to fSpecTrashList.Count - 1 do
        if Assigned(fSpecTrashList[i]) then
          TSpecNode(fSpecTrashList[i]).Free;
    fSpecTrashList.Free;
  end;
  if (ListBox3.Tag = 1) and (ListBox3.Items.Count > 0) then
    for I := 0 to ListBox3.Items.Count - 1 do
      if Assigned(ListBox3.Items.Objects[i]) then
        ListBox3.Items.Objects[i].Free;
  TGeneralController.Instance.ReleaseLockupCB(@dbcbFaculty);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbUchPlan);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbNorms);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbYear);
  inherited;
end;

procedure TfrmAddPotok.sbAddManyGroupClick(Sender: TObject);
var
  i: integer;
begin
  i:= 0;
  while i <= ListBox4.Items.Count-1 do
  begin
    if ListBox4.Selected[i] then AddGroupOfGroup(i)
    else inc(i);
  end;
  dbeName.Text:= TNagruzkaController.Preparation.RebuildPotokName(fPotokSpec, dbcbFaculty.KeyValue);
  Timer1.Enabled:= true;
  dbeNameChange(nil);
end;

procedure TfrmAddPotok.sbAddManySpecClick(Sender: TObject);
var
  i: integer;
begin
  i:= 0;
  while i <= ListBox1.Items.Count-1 do
  begin
    if ListBox1.Selected[i] then
    begin
      AddGroupOfSpec(i, dbcbYear.Value);
      fPotokSpec.Add(TSpecNode.Create(TSpecNode(ListBox1.Items.Objects[i]).SpecIK, dbcbYear.KeyValue,
      TSpecNode(ListBox1.Items.Objects[i]).SpecShortName, dbcbYear.Text));
      
    end
    else inc(i);
  end;
  dbeName.Text:= TNagruzkaController.Preparation.RebuildPotokName(fPotokSpec, dbcbFaculty.KeyValue);
  Timer1.Enabled:= true;
  dbeNameChange(nil);
end;

procedure TfrmAddPotok.sbDelManyGroupClick(Sender: TObject);
var
  i: integer;
begin
  i:= 0;
  while i <= ListBox5.Items.Count-1 do
  begin
    if ListBox5.Selected[i] then DelGroupOfGroup(i)
    else inc(i);
  end;
  dbeName.Text:= TNagruzkaController.Preparation.RebuildPotokName(fPotokSpec, dbcbFaculty.KeyValue);
  Timer1.Enabled:= true;
  dbeNameChange(nil);
end;

procedure TfrmAddPotok.sbDelManySpecClick(Sender: TObject);
var
  i: integer;
begin
  i:= 0;
  while i <= ListBox2.Items.Count-1 do
  begin
    if ListBox2.Selected[i] then
    begin
      DelGroupOfSpec(i);
      fPotokSpec.RemoveItem(StrToInt(specIK[i]),StrToInt(yearIK[i]));

      specIK.Delete(i);
      yearIK.Delete(i);
    end
    else inc(i);
  end;
  ReloadPotentialSpec;
  dbeName.Text:= TNagruzkaController.Preparation.RebuildPotokName(fPotokSpec, dbcbFaculty.KeyValue);
  Timer1.Enabled:= true;
  dbeNameChange(nil);
end;

procedure TfrmAddPotok.Splitter2CanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
  Accept:= CheckBox2.Checked;
end;

procedure TfrmAddPotok.Timer1Timer(Sender: TObject);
begin
  if SpeedButton1.Font.Color = clWindowText then
    SpeedButton1.Font.Color:= $000000D6
  else SpeedButton1.Font.Color:= clWindowText;
end;

procedure TfrmAddPotok.sbAddOneGroupClick(Sender: TObject);
begin
  AddGroupOfGroup(ListBox4.ItemIndex);
  dbeName.Text:= TNagruzkaController.Preparation.RebuildPotokName(fPotokSpec, dbcbFaculty.KeyValue);
  Timer1.Enabled:= true;
  dbeNameChange(nil);
end;

procedure TfrmAddPotok.sbAddOneSpecClick(Sender: TObject);
begin

  specIK.Add(IntToStr((ListBox1.Items.Objects[ListBox1.ItemIndex] as TSpecNode).SpecIK));
  yearIK.Add(IntToStr(dbcbYear.KeyValue));

  //добавить специальность в общую коллекцию потока
  fPotokSpec.Add(TSpecNode.Create((ListBox1.Items.Objects[ListBox1.ItemIndex] as TSpecNode).SpecIK,
  dbcbYear.KeyValue, (ListBox1.Items.Objects[ListBox1.ItemIndex] as TSpecNode).SpecShortName, dbcbYear.Text));

  AddGroupOfSpec(ListBox1.ItemIndex, dbcbYear.Text);
  ReloadPotentialSpec;
  dbeName.Text:= TNagruzkaController.Preparation.RebuildPotokName(fPotokSpec, dbcbFaculty.KeyValue);
  Timer1.Enabled:= true;
  dbeNameChange(nil);
end;

procedure TfrmAddPotok.dbeNameChange(Sender: TObject);
begin
  IsModified:= (dbeName.Text <> '') and (dbcbNorms.KeyValue <> NULL) and (dbcbYear.KeyValue <> NULL) and ((ListBox2.Items.Count > 0) or (ListBox5.Items.Count > 0)) and (dbcbUchPlan.KeyValue <> NULL);
end;

procedure TfrmAddPotok.Label16Click(Sender: TObject);
begin
  actSpravExecute(actSprav);
end;

procedure TfrmAddPotok.Label16MouseEnter(Sender: TObject);
begin
  Label16.Font.Style:= Label16.Font.Style + [fsUnderline];
end;

procedure TfrmAddPotok.Label16MouseLeave(Sender: TObject);
begin
  Label16.Font.Style:= Label16.Font.Style - [fsUnderline];
end;

procedure TfrmAddPotok.Label17Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmAddPotok.Label17MouseEnter(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style + [fsUnderline];
end;

procedure TfrmAddPotok.Label17MouseLeave(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style - [fsUnderline];
end;

procedure TfrmAddPotok.ListBox1Click(Sender: TObject);
begin
  sbAddManySpec.Enabled:= ListBox1.SelCount > 1;
  sbAddOneSpec.Enabled:= ListBox1.SelCount = 1;
  sbDelOneSpec.Enabled:= false;
  sbDelManySpec.Enabled:= false;
end;

procedure TfrmAddPotok.ListBox2Click(Sender: TObject);
begin
  sbAddManySpec.Enabled:= false;
  sbAddOneSpec.Enabled:= false;
  sbDelOneSpec.Enabled:= ListBox2.SelCount = 1;
  sbDelManySpec.Enabled:= ListBox2.SelCount > 1;
end;

procedure TfrmAddPotok.ListBox3Click(Sender: TObject);
begin
  if (ListBox3.ItemIndex >= 0) and (ListBox3.Tag = 1) then
  begin
    dbeName.Text:= TFoundedPotok(ListBox3.Items.Objects[ListBox3.ItemIndex]).PotokName;
    if dbcbUchPlan.ListSource.DataSet.Locate('ik_uch_plan', TFoundedPotok(ListBox3.Items.Objects[ListBox3.ItemIndex]).UchPlanIK, [loPartialKey]) then
      dbcbUchPlan.KeyValue:= dbcbUchPlan.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger;
    if dbcbNorms.ListSource.DataSet.Locate('ik_norm_of_time', TFoundedPotok(ListBox3.Items.Objects[ListBox3.ItemIndex]).NormOfTimeIK, [loPartialKey]) then
      dbcbNorms.KeyValue:= dbcbNorms.ListSource.DataSet.FieldByName('ik_norm_of_time').AsInteger;
    dbeNameChange(nil);
  end;
end;

procedure TfrmAddPotok.ListBox4Click(Sender: TObject);
begin
  sbAddManyGroup.Enabled:= ListBox4.SelCount > 1;
  sbAddOneGroup.Enabled:= ListBox4.SelCount = 1;
  sbDelOneGroup.Enabled:= false;
  sbDelManyGroup.Enabled:= false;
end;

procedure TfrmAddPotok.ListBox5Click(Sender: TObject);
begin
  sbAddManyGroup.Enabled:= false;
  sbAddOneGroup.Enabled:= false;
  sbDelOneGroup.Enabled:= ListBox5.SelCount = 1;
  sbDelManyGroup.Enabled:= ListBox5.SelCount > 1;
end;

procedure TfrmAddPotok.PutGroupsInTrashList(SpecIK: integer);
var
  i: integer;
begin
  i:= 0;
  while i <= ListBox4.Items.Count-1 do
  begin
    if TSpecNode(ListBox4.Items.Objects[i]).SpecIK = SpecIK then
    begin
      fGroupsTrashList.Add(ListBox4.Items.Objects[i]);
      ListBox4.Items.Delete(i);
    end
    else inc(i);
  end;
end;

procedure TfrmAddPotok.PutSpecsInTrashList(SpecIK: integer);
var
  i: integer;
begin
  i:= 0;      
  while i <= ListBox1.Items.Count-1 do
  begin
    if TSpecNode(ListBox1.Items.Objects[i]).SpecIK = SpecIK then
    begin
      fSpecTrashList.Add(ListBox1.Items.Objects[i]);
      ListBox1.Items.Delete(i);
    end
    else inc(i);
  end;
end;



end.


