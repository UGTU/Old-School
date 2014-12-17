unit uNagruzkaEditPotokShemes;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, ADODB, Contnrs,
  DB, DBLookupEh, DBCtrlsEh, Mask, Grids, NagruzkaController, NagruzkaClasses, GeneralController,
  DBGrids, GridsEh, ImgList, ComCtrls, ToolWin, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh, System.Actions;

type           

  TfrmNagruzkaEditPotokShemes = class(TfrmBaseDialog)
    dsCalcUnits: TDataSource;
    actDelCalcUnit: TAction;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    dbgCalcUnits: TDBGridEh;
    Label9: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label11: TLabel;
    dbnMax: TDBNumberEditEh;
    dbeName: TDBEditEh;
    dbcbDecomposeType: TDBLookupComboboxEh;
    ImageList1: TImageList;
    Panel9: TPanel;
    actEditCalcUnit: TAction;
    actFillContingent: TAction;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    ToolBar4: TToolBar;
    ToolButton4: TToolButton;
    actCallAddCalcUnit: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolBar5: TToolBar;
    ToolButton5: TToolButton;
    actLoadGroupListAuto: TAction;
    Bevel2: TBevel;
    Label1: TLabel;
    ToolBar6: TToolBar;
    ToolButton6: TToolButton;
    actFillContingentAuto: TAction;
    Panel3: TPanel;
    Bevel3: TBevel;
    cbNoCheckExpectedContingent: TCheckBox;
    Image9: TImage;
    Label17: TLabel;
    procedure dbcbDecomposeTypeKeyValueChanged(Sender: TObject);
    procedure actDelCalcUnitExecute(Sender: TObject);
    procedure dbeUnitNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actFillContingentExecute(Sender: TObject);
    procedure dbgCalcUnitsContentDblClick(Sender: TObject);
    procedure dbgCalcUnitsContentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actFillContingentUpdate(Sender: TObject);
    procedure actEditCalcUnitExecute(Sender: TObject);
    procedure actDelCalcUnitUpdate(Sender: TObject);
    procedure dbeNameKeyPress(Sender: TObject; var Key: Char);
    procedure actCallAddCalcUnitExecute(Sender: TObject);
    procedure actCallAddCalcUnitUpdate(Sender: TObject);
    procedure actLoadGroupListAutoExecute(Sender: TObject);
    procedure dbgCalcUnitsDblClick(Sender: TObject);
    procedure dbgCalcUnitsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actFillContingentAutoExecute(Sender: TObject);
    procedure actLoadGroupListAutoUpdate(Sender: TObject);
    procedure actFillContingentAutoUpdate(Sender: TObject);
    procedure Label17MouseEnter(Sender: TObject);
    procedure Label17MouseLeave(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    minYear: integer;
    fPotokUchPlanIK: integer;
    fCountOfSpecialitiesInPotok: integer;
    fCountOfSeparatedGroupsInPotok: integer;
    curCalcUnitName: string;
    sgContingent: TContingentStringGrid;
    fPotokShemaContingent: TObjectList;
    procedure UpdateModifiedState;
    procedure sgContingentDblClick(Sender: TObject);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    destructor Destroy; override;
    procedure Read;
  end;

var
  frmNagruzkaEditPotokShemes: TfrmNagruzkaEditPotokShemes;

implementation

uses uNagruzkaCalcUnitsContingent, Math, uNagruzkaAddCalcUnit;

{$R *.dfm}

{ TfrmNagruzkaEditPotokShemes }

destructor TfrmNagruzkaEditPotokShemes.Destroy;
begin       
 // TGeneralController.Instance.ReleaseLockupCB(@dbcbGrups);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbDecomposeType);
  if dsCalcUnits.DataSet <> nil then
  begin
    if dsCalcUnits.DataSet.Active then dsCalcUnits.DataSet.Close;
    dsCalcUnits.DataSet.Free;
  end;
  fPotokShemaContingent.Clear;
  fPotokShemaContingent.Free;
  inherited;
end;

function TfrmNagruzkaEditPotokShemes.DoApply: boolean;
begin
  Result:= TNagruzkaController.Preparation.SavePotokSheme(Tag, IK, dbcbDecomposeType.KeyValue, dbeName.Text, fPotokShemaContingent, @dsCalcUnits.DataSet, not cbNoCheckExpectedContingent.Checked);
  if Result then
    IsModified:= false;
end;

function TfrmNagruzkaEditPotokShemes.DoCancel: boolean;
begin
  Result:= false;
  case (Application.MessageBox('Сохранить внесенные изменения?',PChar(Caption), MB_YESNOCANCEL)) of
      mrYes: OK;
      mrNo: Result:= true;
  end;
end;


procedure TfrmNagruzkaEditPotokShemes.FormShow(Sender: TObject);
begin
  dbeName.SetFocus;
end;

procedure TfrmNagruzkaEditPotokShemes.Label17Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmNagruzkaEditPotokShemes.Label17MouseEnter(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaEditPotokShemes.Label17MouseLeave(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaEditPotokShemes.Read;
var
  decType: integer;
  shemaName: string;
begin
  fPotokShemaContingent:= TObjectList.Create;
  fPotokUchPlanIK:= TNagruzkaController.Preparation.GetDefaultUchPlanForPotok(self.IK);
  fCountOfSpecialitiesInPotok:= TNagruzkaController.Preparation.CountOfSpecialitiesInPotok(self.IK);
  fCountOfSeparatedGroupsInPotok:= TNagruzkaController.Preparation.CountOfSeparatedGroupsInPotok(self.IK);
  TGeneralController.Instance.InitializeLockupCB(@dbcbDecomposeType, 'ik_decompose_type', 'cName_decompose');
  TNagruzkaController.Directory.GetAllDecomposeType(@dbcbDecomposeType.ListSource.DataSet, false);

  //  TGeneralController.Instance.InitializeLockupCB(@dbcbGrups, 'ik_grup', 'cName_grup');
//  TNagruzkaController.Instance.GetAllGroupsFromPotok(@dbcbGrups.ListSource.DataSet, self.IK, true);

  sgContingent:= TContingentStringGrid.Create(Panel3);
  sgContingent.OnDblClick:= sgContingentDblClick;
  dsCalcUnits.DataSet:= TGeneralController.Instance.GetNewADODataSet(true); 
  if Tag >= 0 then
  begin
    if TNagruzkaController.Preparation.GetPotokShemaInfo(Tag, decType, shemaName) then
    begin
      dbcbDecomposeType.KeyValue:= decType;
      dbcbDecomposeType.Enabled:= false;
      dbeName.Text:= shemaName;
    end
    else Tag:= -1;
    HelpKeyword:= 'Нагрузка\Edit_ThreadSchema.htm';
  end
  else HelpKeyword:= 'Нагрузка\Add_ThreadSchema_GroupDiv.htm';
end;

procedure TfrmNagruzkaEditPotokShemes.sgContingentDblClick(Sender: TObject);
begin
  actFillContingentUpdate(actFillContingent);
  if actFillContingent.Enabled then
    actFillContingentExecute(actFillContingent);
end;

procedure TfrmNagruzkaEditPotokShemes.dbcbDecomposeTypeKeyValueChanged(
  Sender: TObject);
var
  tempDataSet: TDataSet;
  secTempDS: TADODataSet;
  specContingent, sepGroupContingent: TADODataSet;
  i, maxYear, calcUnitCount, budget, contract: integer;
  isContingentUpdate, isContingentOfSepGroupsNotFound: boolean;
begin
  dbeName.Text:= '';
  if dsCalcUnits.DataSet <> nil then
    if dsCalcUnits.DataSet.Active then dsCalcUnits.DataSet.Close;
  sgContingent.RowCount:= 1;
  fPotokShemaContingent.Clear;
  Label1.Caption:= '0 расч. ед.';
  Panel6.Visible:= false;
  Panel9.Visible:= false;
  cbNoCheckExpectedContingent.Checked:= false;
  isContingentOfSepGroupsNotFound:= false;
  if dbcbDecomposeType.KeyValue <> NULL then
  begin
    Bevel3.Visible:= dbcbDecomposeType.KeyValue <> 1;
    cbNoCheckExpectedContingent.Visible:= dbcbDecomposeType.KeyValue <> 1;
    case dbcbDecomposeType.KeyValue of
    1: actFillContingent.Hint:= 'Редактировать контингент потока...';
    2: actFillContingent.Hint:= 'Редактировать контингент групп...';
    3: actFillContingent.Hint:= 'Редактировать контингент подгрупп...';
    end;
    tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
    (tempDataSet as TADODataSet).CommandText:= 'SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = (SELECT ik_year_enter FROM Potok WHERE ik_potok = ' + IntToStr(IK) + ')';
    tempDataSet.Open;
    minYear:= tempDataSet.FieldByName('year_value').AsInteger;
    tempDataSet.Close;
    if fCountOfSeparatedGroupsInPotok = 0 then
      (tempDataSet as TADODataSet).CommandText:= 'SELECT min(YearObuch) as year_value FROM Relation_spec_fac WHERE ik_spec_fac in (SELECT ik_spec_fac FROM Relation_potok_spec WHERE ik_potok = ' + IntToStr(IK) + ')'
    else (tempDataSet as TADODataSet).CommandText:= 'SELECT min(YearObuch) as year_value FROM Relation_spec_fac WHERE (ik_spec_fac in (SELECT ik_spec_fac FROM Relation_potok_spec WHERE ik_potok = ' + IntToStr(IK) + ')) or (ik_spec_fac in (SELECT ik_spec_fac FROM Grup WHERE ik_grup in (SELECT ik_grup FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(IK) + ')))';
    tempDataSet.Open;
    maxYear:= minYear + tempDataSet.FieldByName('year_value').AsInteger-1;
    tempDataSet.Close;
    secTempDS:= TGeneralController.Instance.GetNewADODataSet(false);
    try
      fPotokShemaContingent.Clear;
      if fCountOfSpecialitiesInPotok = 0 then
      begin
        (tempDataSet as TADODataSet).CommandText:= 'Select ik_year, year_value, (Convert(nvarchar,year_value) + '' - '' + Convert(nvarchar,year_value+1)) as big_year_value, subgroup_count FROM Year_uch_pl INNER JOIN ' +
          '(SELECT ik_year, count(ik_grup) as grup_count, sum(subgroup_count) as subgroup_count FROM Plan_contingent_of_sep_groups WHERE ik_grup in ' +
          '(SELECT ik_grup FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(IK) + ') GROUP BY ik_year HAVING count (ik_grup) = (SELECT count(ik_grup) FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(IK) + ')) cnt ON Year_uch_pl.ik_year_uch_pl = cnt.ik_year';
        tempDataSet.Open;
        while not tempDataSet.Eof do
        begin
          fPotokShemaContingent.Add(TPotokShemaYearContingent.Create(tempDataSet.FieldByName('ik_year').AsInteger, tempDataSet.FieldByName('year_value').AsInteger, tempDataSet.FieldByName('big_year_value').AsString));
          sgContingent.RowCount:= sgContingent.RowCount + 1;
          sgContingent.Cells[0, sgContingent.RowCount-1]:= tempDataSet.FieldByName('big_year_value').AsString;
          sgContingent.Cells[1, sgContingent.RowCount-1]:= IntToStr(fCountOfSeparatedGroupsInPotok);
          sgContingent.Cells[2, sgContingent.RowCount-1]:= tempDataSet.FieldByName('subgroup_count').AsString;
          sgContingent.Cells[3, sgContingent.RowCount-1]:= '0';
          sgContingent.Cells[4, sgContingent.RowCount-1]:= '0';
          tempDataSet.Next;
        end;
      end
      else
      begin
        (tempDataSet as TADODataSet).CommandText:= 'Select ik_year_uch_pl, year_value, (Convert(nvarchar,year_value) + '' - '' + Convert(nvarchar,year_value+1)) as big_year_value, all_group, all_subgroup From Year_uch_pl ' +
          'INNER JOIN (SELECT ik_year, course_number, sum(group_count) as all_group, sum(subgroup_count) as all_subgroup, count(ik_spec_fac) as cnt FROM Plan_contingent WHERE ik_spec_fac in (SELECT ik_spec_fac FROM Relation_potok_spec WHERE ik_potok = ' + IntToStr(IK) + ') ' +
          'GROUP BY ik_year, course_number HAVING count(ik_spec_fac) = (SELECT count(ik_spec_fac) FROM Relation_potok_spec WHERE ik_potok = ' + IntToStr(IK) + ')) cnt ON Year_uch_pl.ik_year_uch_pl = cnt.ik_year WHERE (year_value between ' + IntToStr(minYear) + ' and ' + IntToStr(maxYear) + ') and ' +
          '(cnt.course_number = year_value - ' + IntToStr(minYear) + ' + 1)';
        tempDataSet.Open;
        secTempDS.CommandText:= 'SELECT ik_year, sum(subgroup_count) as all_subgroup_count FROM Plan_contingent_of_sep_groups WHERE ik_grup in (SELECT ik_grup FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(IK) + ') GROUP BY ik_year';
        secTempDS.Open;
        while not tempDataSet.Eof do
        begin
          fPotokShemaContingent.Add(TPotokShemaYearContingent.Create(tempDataSet.FieldByName('ik_year_uch_pl').AsInteger, tempDataSet.FieldByName('year_value').AsInteger, tempDataSet.FieldByName('big_year_value').AsString));
          sgContingent.RowCount:= sgContingent.RowCount + 1;
          sgContingent.Cells[0, sgContingent.RowCount-1]:= tempDataSet.FieldByName('big_year_value').AsString;
          sgContingent.Cells[1, sgContingent.RowCount-1]:= IntToStr(tempDataSet.FieldByName('all_group').AsInteger + fCountOfSeparatedGroupsInPotok);
          if fCountOfSeparatedGroupsInPotok > 0 then
          begin
            if secTempDS.Locate('ik_year', tempDataSet.FieldByName('ik_year_uch_pl').AsInteger, [loPartialKey]) then
              sgContingent.Cells[2, sgContingent.RowCount-1]:= IntToStr(tempDataSet.FieldByName('all_subgroup').AsInteger + secTempDS.FieldByName('all_subgroup_count').AsInteger)
            else
            begin
              sgContingent.Cells[2, sgContingent.RowCount-1]:= tempDataSet.FieldByName('all_subgroup').AsString + '+?';
              isContingentOfSepGroupsNotFound:= true;
            end;
          end
          else sgContingent.Cells[2, sgContingent.RowCount-1]:= tempDataSet.FieldByName('all_subgroup').AsString;
          sgContingent.Cells[3, sgContingent.RowCount-1]:= '0';
          sgContingent.Cells[4, sgContingent.RowCount-1]:= '0';
          tempDataSet.Next;
        end;
      end;
    finally
      if tempDataSet.Active then tempDataSet.Close;      
      tempDataSet.Free;
    end;    

//    if isContingentOfSepGroupsNotFound then
//      Application.MessageBox('Не заполнен ожидаемый контингент отдельных групп, включенных в поток', PChar(Caption), MB_ICONWARNING);

    (dsCalcUnits.DataSet as TADODataSet).CommandText:= 'Select rcug.ik_grup, ik_spec_fac, Calc_unit.*, cName_calc_unit as old_cName_calc_unit ' +
      'From Calc_unit LEFT JOIN Relation_calc_unit_grup rcug ON Calc_unit.ik_calc_unit = rcug.ik_calc_unit LEFT JOIN Grup ON rcug.ik_grup = Grup.ik_grup Where ik_shema_of_potok =' + IntToStr(Tag);
    (dsCalcUnits.DataSet as TADODataSet).Open;

    if (Tag = -1) then  // если мы находимся в режиме добавления схемы
    begin
      dbeName.Text:= dbcbDecomposeType.Text;
      case dbcbDecomposeType.KeyValue of
      1:
        begin
          try
            tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
           (tempDataSet as TADODataSet).CommandText:= 'SELECT cName_potok FROM Potok WHERE ik_potok = ' + IntToStr(IK);
            tempDataSet.Open;
            dsCalcUnits.DataSet.Insert;
            dsCalcUnits.DataSet.FieldByName('cName_calc_unit').AsString:= tempDataSet.FieldByName('cName_potok').AsString;
            dsCalcUnits.DataSet.FieldByName('ik_uch_plan').AsInteger:= fPotokUchPlanIK;
            dsCalcUnits.DataSet.Post;
            tempDataSet.Close;
            for I := 0 to fPotokShemaContingent.Count - 1 do
            begin
              budget:= 0;
              contract:= 0;
              if fCountOfSpecialitiesInPotok <> 0 then
              begin
                (tempDataSet as TADODataSet).CommandText:= 'SELECT sum(ISNULL(budget_count, 0)) as budget, sum(ISNULL(contract_count, 0)) as contract FROM Plan_contingent WHERE (ik_year = ' + IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[i]).YearIK) + ') and (ik_spec_fac in (SELECT ik_spec_fac FROM Relation_potok_spec WHERE ik_potok = ' + IntToStr(IK) + ')) and (course_number = ' + IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[i]).YearValue - minYear + 1) + ')';
                tempDataSet.Open;
                tempDataSet.First;
                budget:= tempDataSet.FieldByName('budget').AsInteger;
                contract:= tempDataSet.FieldByName('contract').AsInteger;
                tempDataSet.Close;
              end;
              if fCountOfSeparatedGroupsInPotok <> 0 then
              begin
                (tempDataSet as TADODataSet).CommandText:= 'SELECT sum(ISNULL(budget_count, 0)) as budget, sum(ISNULL(contract_count, 0)) as contract FROM Plan_contingent_of_sep_groups WHERE (ik_year = ' + IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[i]).YearIK) + ') and (ik_grup in (SELECT ik_grup FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(IK) + '))';
                tempDataSet.Open;
                tempDataSet.First;
                budget:= budget + tempDataSet.FieldByName('budget').AsInteger;
                contract:= contract + tempDataSet.FieldByName('contract').AsInteger;
                tempDataSet.Close;
              end;
              TPotokShemaYearContingent(fPotokShemaContingent[i]).AddCalcUnitContingent(TCalcUnitContingent.Create(dsCalcUnits.DataSet.FieldByName('cName_calc_unit').AsString, dsCalcUnits.DataSet.FieldByName('ik_spec_fac').Value, NULL, budget, contract));
              sgContingent.Cells[3, i+1]:= IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[i]).AllCalcUnitBudget);
              sgContingent.Cells[4, i+1]:= IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[i]).AllCalcUnitContract);
            end;
          finally
            tempDataSet.Free;
          end;
      //    Panel9.Visible:= (fCountOfSeparatedGroupsInPotok > 0) and isContingentOfSepGroupsNotFound;
          IsModified:= true;
        end;
       2, 3:
        begin
          Panel6.Visible:= true;
          Panel9.Visible:= true;
        end;
      end;
    end
    else    // если мы в режиме редактирования схемы
    begin
      try
        tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
        isContingentUpdate:= false;
        for I := 0 to fPotokShemaContingent.Count - 1 do
        begin
          (tempDataSet as TADODataSet).CommandText:= 'SELECT Calc_unit_contingent.*, Calc_unit.cName_calc_unit FROM Calc_unit_contingent INNER JOIN Calc_unit ON Calc_unit_contingent.ik_calc_unit = Calc_unit.ik_calc_unit WHERE (ik_year = ' + IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[i]).YearIK) + ') and (ik_shema_of_potok =' + IntToStr(Tag) + ')';
          tempDataSet.Open;
          if tempDataSet.RecordCount = 0 then
          begin
            tempDataSet.Close;
            if (dbcbDecomposeType.KeyValue = 1) then
            begin
              budget:= 0;
              contract:= 0;
              if fCountOfSpecialitiesInPotok <> 0 then
              begin
                (tempDataSet as TADODataSet).CommandText:= 'SELECT sum(ISNULL(budget_count, 0)) as budget, sum(ISNULL(contract_count, 0)) as contract FROM Plan_contingent WHERE (ik_year = ' + IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[i]).YearIK) + ') and (ik_spec_fac in (SELECT ik_spec_fac FROM Relation_potok_spec WHERE ik_potok = ' + IntToStr(IK) + ')) and (course_number = ' + IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[i]).YearValue - minYear + 1) + ')';
                tempDataSet.Open;
                tempDataSet.First;
                budget:= tempDataSet.FieldByName('budget').AsInteger;
                contract:= tempDataSet.FieldByName('contract').AsInteger;
                tempDataSet.Close;
              end;
              if fCountOfSeparatedGroupsInPotok <> 0 then
              begin
                (tempDataSet as TADODataSet).CommandText:= 'SELECT sum(ISNULL(budget_count, 0)) as budget, sum(ISNULL(contract_count, 0)) as contract FROM Plan_contingent_of_sep_groups WHERE (ik_year = ' + IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[i]).YearIK) + ') and (ik_grup in (SELECT ik_grup FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(IK) + '))';
                tempDataSet.Open;
                tempDataSet.First;
                budget:= budget + tempDataSet.FieldByName('budget').AsInteger;
                contract:= contract + tempDataSet.FieldByName('contract').AsInteger;
                tempDataSet.Close;
              end;
              TPotokShemaYearContingent(fPotokShemaContingent[i]).AddCalcUnitContingent(TCalcUnitContingent.Create(dsCalcUnits.DataSet.FieldByName('cName_calc_unit').AsString, dsCalcUnits.DataSet.FieldByName('ik_spec_fac').Value, NULL, budget, contract));
              isContingentUpdate:= true;
            end
            else
            begin
              dsCalcUnits.DataSet.First;
              while not dsCalcUnits.DataSet.Eof do
              begin
                TPotokShemaYearContingent(fPotokShemaContingent[i]).AddCalcUnitContingent(TCalcUnitContingent.Create(dsCalcUnits.DataSet.FieldByName('cName_calc_unit').AsString, dsCalcUnits.DataSet.FieldByName('ik_spec_fac').Value, dsCalcUnits.DataSet.FieldByName('ik_grup').Value, 0, 0));
                dsCalcUnits.DataSet.Next;
              end;
            end;
          end
          else
          begin
            dsCalcUnits.DataSet.First;
            while not dsCalcUnits.DataSet.Eof do
            begin
              if tempDataSet.Locate('cName_calc_unit', dsCalcUnits.DataSet.FieldByName('cName_calc_unit').AsString, [loPartialKey]) then
                TPotokShemaYearContingent(fPotokShemaContingent[i]).AddCalcUnitContingent(TCalcUnitContingent.Create(dsCalcUnits.DataSet.FieldByName('cName_calc_unit').AsString, dsCalcUnits.DataSet.FieldByName('ik_spec_fac').Value, dsCalcUnits.DataSet.FieldByName('ik_grup').Value, tempDataSet.FieldByName('budget_count').AsInteger, tempDataSet.FieldByName('contract_count').AsInteger));
              dsCalcUnits.DataSet.Next;
            end;
            tempDataSet.Close;
          end;
          sgContingent.Cells[3, i+1]:= IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[i]).AllCalcUnitBudget);
          sgContingent.Cells[4, i+1]:= IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[i]).AllCalcUnitContract);

          // Проверим необходимость включения флага "Не проверять контингент"
          if ((dbcbDecomposeType.KeyValue = 2) or (dbcbDecomposeType.KeyValue = 3)) and
            ((StrToInt(sgContingent.Cells[3, i+1]) <> 0) or (StrToInt(sgContingent.Cells[4, i+1]) <> 0)) then
          begin
            specContingent:= TGeneralController.Instance.GetNewADODataSet(false);
            sepGroupContingent:= TGeneralController.Instance.GetNewADODataSet(false);
            calcUnitCount:= 0;
            budget:= 0;
            contract:= 0;
            try
              if (TNagruzkaController.Preparation.GetSpecContingentFromPotok(@specContingent, IK, TPotokShemaYearContingent(fPotokShemaContingent[i]).YearIK, false)) and
                (TNagruzkaController.Preparation.GetSepGroupContingentFromPotok(@sepGroupContingent, IK, TPotokShemaYearContingent(fPotokShemaContingent[i]).YearIK, false)) then
              begin
                specContingent.First;
                while not specContingent.Eof do
                begin
                  inc(budget, specContingent.FieldByName('budget_count').AsInteger);
                  inc(contract, specContingent.FieldByName('contract_count').AsInteger);
                  case dbcbDecomposeType.KeyValue of
                  2: inc(calcUnitCount, specContingent.FieldByName('group_count').AsInteger);
                  3: inc(calcUnitCount, specContingent.FieldByName('subgroup_count').AsInteger);
                  end;
                  specContingent.Next;
                end;
                sepGroupContingent.First;
                while not sepGroupContingent.Eof do
                begin
                  inc(budget, sepGroupContingent.FieldByName('budget_count').AsInteger);
                  inc(contract, sepGroupContingent.FieldByName('contract_count').AsInteger);
                  case dbcbDecomposeType.KeyValue of
                  2: inc(calcUnitCount, 1);
                  3: inc(calcUnitCount, sepGroupContingent.FieldByName('subgroup_count').AsInteger);
                  end;
                  sepGroupContingent.Next;
                end;
                if (budget <> StrToInt(sgContingent.Cells[3, i+1])) or (contract <> StrToInt(sgContingent.Cells[4, i+1]))
                  or (calcUnitCount <> dsCalcUnits.DataSet.RecordCount) then
                  cbNoCheckExpectedContingent.Checked:= true;
              end;
            finally
              if specContingent.Active then specContingent.Close;
              FreeAndNil(specContingent);
              if sepGroupContingent.Active then sepGroupContingent.Close;
              FreeAndNil(sepGroupContingent);
            end;
          end;
        end;
      finally
        tempDataSet.Free;
      end;
      if (dbcbDecomposeType.KeyValue = 2) or (dbcbDecomposeType.KeyValue = 3) then
      begin
        Panel6.Visible:= true;
        Panel9.Visible:= true;
      end;
     // else Panel9.Visible:= fCountOfSeparatedGroupsInPotok > 0;
      if isContingentUpdate then
      begin
        Application.MessageBox('Контингент потока обновился! Сохраните изменения в данной схеме деления.', 'Плановый контингент расчетных единиц', MB_ICONINFORMATION);
        IsModified:= true;
      end;
    end;
    Label1.Caption:= IntToStr(dbgCalcUnits.DataSource.DataSet.RecordCount) + ' расч. ед.';
  end;
  sgContingent.Invalidate;
  Label11.Left:= Panel5.Left + Panel3.Left;
end;

procedure TfrmNagruzkaEditPotokShemes.dbeNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  UpdateModifiedState;
end;

procedure TfrmNagruzkaEditPotokShemes.dbeUnitNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if actCallAddCalcUnit.Enabled then
      actCallAddCalcUnitExecute(actCallAddCalcUnit);
end;

procedure TfrmNagruzkaEditPotokShemes.dbgCalcUnitsContentDblClick(
  Sender: TObject);
begin
  if actFillContingent.Enabled then
    actFillContingentExecute(actFillContingent);
end;

procedure TfrmNagruzkaEditPotokShemes.dbgCalcUnitsContentKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    dbgCalcUnitsContentDblClick(Sender);
end;

procedure TfrmNagruzkaEditPotokShemes.dbgCalcUnitsDblClick(Sender: TObject);
begin
  actDelCalcUnitUpdate(actEditCalcUnit);
  if actEditCalcUnit.Enabled then
    actEditCalcUnitExecute(actEditCalcUnit);
end;

procedure TfrmNagruzkaEditPotokShemes.dbgCalcUnitsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    dbgCalcUnitsDblClick(Sender);
end;

procedure TfrmNagruzkaEditPotokShemes.actDelCalcUnitExecute(
  Sender: TObject);
var
  i, j: integer;
begin
  for i := 0 to fPotokShemaContingent.Count - 1 do
  begin  
    for j:= 0 to TPotokShemaYearContingent(fPotokShemaContingent[i]).CalcUnitCount - 1 do
      if TPotokShemaYearContingent(fPotokShemaContingent[i]).CalcUnitContingent[j].CalcUnitName = dsCalcUnits.DataSet.FieldByName('cName_calc_unit').AsString then
      begin
        TPotokShemaYearContingent(fPotokShemaContingent[i]).DeleteCalcUnitContingent(j);
        break;
      end;
    sgContingent.Cells[3, i+1]:= IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[i]).AllCalcUnitBudget);
    sgContingent.Cells[4, i+1]:= IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[i]).AllCalcUnitContract);
  end;
  dsCalcUnits.DataSet.Delete;
  UpdateModifiedState;
  Label1.Caption:= IntToStr(dbgCalcUnits.DataSource.DataSet.RecordCount) + ' расч. ед.';
end;

procedure TfrmNagruzkaEditPotokShemes.actDelCalcUnitUpdate(Sender: TObject);
begin
  if dsCalcUnits.DataSet <> nil then
  begin
    if dsCalcUnits.DataSet.Active then
      (Sender as TAction).Enabled:= (dsCalcUnits.DataSet.RecordCount > 0) and (dbcbDecomposeType.KeyValue <> NULL)
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfrmNagruzkaEditPotokShemes.actEditCalcUnitExecute(Sender: TObject);
var
  temp: TfrmNagruzkaAddCalcUnit;
  i, j: integer;
begin
  temp:= TfrmNagruzkaAddCalcUnit.CreateDialog(nil, Connection, nil);
  try
    temp.IK:= self.IK;
    temp.Tag:= 1;
    temp.Read;
    curCalcUnitName:= dsCalcUnits.DataSet.FieldByName('cName_calc_unit').AsString;
    temp.dbcbGrups.KeyValue:= dsCalcUnits.DataSet.FieldByName('ik_grup').Value;
    temp.dbeUnitName.Text:= curCalcUnitName;
    temp.dbcbUchPlan.KeyValue:= dbgCalcUnits.DataSource.DataSet.FieldByName('ik_uch_plan').Value;
    temp.IsModified:= false;
    if (temp.ShowModal() = mrOk) or (temp.bbApply.Tag = 1) then
    begin
      if temp.dbeUnitName.Text <> curCalcUnitName then
        if dbgCalcUnits.DataSource.DataSet.Locate('cName_calc_unit', temp.dbeUnitName.Text,[loPartialKey]) then
        begin
          Application.MessageBox('Расчетная единица с таким названием уже существует', PChar(Caption), MB_ICONWARNING);
          exit;
        end;
      dbgCalcUnits.DataSource.DataSet.Locate('cName_calc_unit', curCalcUnitName,[loPartialKey]);
      dbgCalcUnits.DataSource.DataSet.Edit;
      dbgCalcUnits.DataSource.DataSet.FieldByName('cName_calc_unit').Value:= temp.dbeUnitName.Text;
      dbgCalcUnits.DataSource.DataSet.FieldByName('ik_grup').Value:= temp.dbcbGrups.KeyValue;
      if temp.dbcbGrups.KeyValue <> NULL then
        dbgCalcUnits.DataSource.DataSet.FieldByName('ik_spec_fac').AsInteger:= temp.dbcbGrups.ListSource.DataSet.FieldByName('ik_spec_fac').AsInteger;
      dbgCalcUnits.DataSource.DataSet.FieldByName('ik_uch_plan').Value:= temp.dbcbUchPlan.KeyValue;
      dbgCalcUnits.DataSource.DataSet.Post;

      for j := 0 to fPotokShemaContingent.Count - 1 do
        for I := 0 to TPotokShemaYearContingent(fPotokShemaContingent[j]).CalcUnitCount - 1 do
          if TPotokShemaYearContingent(fPotokShemaContingent[j]).CalcUnitContingent[i].CalcUnitName = curCalcUnitName then
          begin
            TPotokShemaYearContingent(fPotokShemaContingent[j]).CalcUnitContingent[i].CalcUnitName:= temp.dbeUnitName.Text;
            if temp.dbcbGrups.KeyValue <> NULL then
              TPotokShemaYearContingent(fPotokShemaContingent[j]).CalcUnitContingent[i].SpecIK:= temp.dbcbGrups.ListSource.DataSet.FieldByName('ik_spec_fac').AsInteger;
            break;
          end;
      UpdateModifiedState;
    end;
  finally
    temp.Free;
  end;


{  if not Panel7.Visible then
    ToolButton4.Down:= true;
  if ToolButton4.Down then
  begin
    Panel7.Top:= 69;
    Panel7.Visible:= true;
    Panel7.Tag:= 1;
    curCalcUnitName:= dsCalcUnits.DataSet.FieldByName('cName_calc_unit').AsString;
    dbcbGrups.KeyValue:= dsCalcUnits.DataSet.FieldByName('ik_grup').Value;
    dbeUnitName.Text:= curCalcUnitName;
    dbeUnitName.SetFocus;
  end
  else Panel7.Visible:= false;    }
end;

procedure TfrmNagruzkaEditPotokShemes.actFillContingentAutoExecute(
  Sender: TObject);
var
  needCountSatisfied: boolean;
begin
  needCountSatisfied:= false;
  if cbNoCheckExpectedContingent.Checked then needCountSatisfied:= true
  else
    case dbcbDecomposeType.KeyValue of
      2: needCountSatisfied:= StrToInt(sgContingent.Cells[1, sgContingent.Row]) = dsCalcUnits.DataSet.RecordCount;
      3:
        if Pos('+?', sgContingent.Cells[2, sgContingent.Row]) <> 0 then
        begin
          Application.MessageBox('Не заполнен ожидаемый контингент отдельных групп, включенных в поток! Автоматическое распределение контингента между расчетными единицами не возможно.', PChar(Caption), MB_ICONWARNING);
          exit;
        end
        else needCountSatisfied:= StrToInt(sgContingent.Cells[2, sgContingent.Row]) = dsCalcUnits.DataSet.RecordCount;
//          needCountSatisfied:= StrToInt(Copy(sgContingent.Cells[1, sgContingent.Row], 1, Length(sgContingent.Cells[1, sgContingent.Row])-2)) < dsCalcUnits.DataSet.RecordCount //количество созданных подгрупп должно быть как минимум больше чем количество подгрупп в специальностях входящих в поток
 //       else needCountSatisfied:= StrToInt(sgContingent.Cells[2, sgContingent.Row]) = dsCalcUnits.DataSet.RecordCount;
    end;
  if needCountSatisfied then
  begin
    TNagruzkaController.Preparation.AutoDistributeContingentBetweenCalcUnits(IK, dbcbDecomposeType.KeyValue, TPotokShemaYearContingent(fPotokShemaContingent[sgContingent.Row-1]));
    sgContingent.Cells[3, sgContingent.Row]:= IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[sgContingent.Row-1]).AllCalcUnitBudget);
    sgContingent.Cells[4, sgContingent.Row]:= IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[sgContingent.Row-1]).AllCalcUnitContract);
    UpdateModifiedState;
  end
  else Application.MessageBox('Количество созданных вами расчетных единиц не соответствует ожидаемому количеству расчетнных единиц в выбранном учебном году!',
      PChar(Caption), MB_ICONWARNING);
end;

procedure TfrmNagruzkaEditPotokShemes.actFillContingentAutoUpdate(
  Sender: TObject);
begin
  if dbcbDecomposeType.KeyValue <> NULL then
    (Sender as TAction).Enabled:= (Panel9.Visible) and (sgContingent.Row > 0) and (not cbNoCheckExpectedContingent.Checked)
  else (Sender as TAction).Enabled:= false;
end;

procedure TfrmNagruzkaEditPotokShemes.actFillContingentExecute(Sender: TObject);
var
  tempPSYC: TPotokShemaYearContingent;
  specContingent, factGroupContingent, sepGroupContingent: TADODataSet;
  curUnitCount: integer;
  ifContingentWasFill: boolean;
  temp: TfrmNagruzkaCalcUnitsContingent;
begin
  if (not cbNoCheckExpectedContingent.Checked) and (dbcbDecomposeType.KeyValue = 3) then
    if Pos('+?', sgContingent.Cells[2, sgContingent.Row]) <> 0 then
    begin
      Application.MessageBox('Не заполнен ожидаемый контингент отдельных групп, включенных в поток! Распределение контингента между расчетными единицами не возможно.', PChar(Caption), MB_ICONWARNING);
      exit;
    end;
  specContingent:= TGeneralController.Instance.GetNewADODataSet(true);
  factGroupContingent:= TGeneralController.Instance.GetNewADODataSet(true);
  sepGroupContingent:= TGeneralController.Instance.GetNewADODataSet(true);
try
  tempPSYC:= TPotokShemaYearContingent(fPotokShemaContingent[sgContingent.Row-1]);
  if (not TNagruzkaController.Preparation.GetSpecContingentFromPotok(@specContingent, IK, tempPSYC.YearIK, false)) or
    (not TNagruzkaController.Preparation.GetCurrentGroupContingentFromPotok(@factGroupContingent, IK, tempPSYC.YearValue, false)) or
    (not TNagruzkaController.Preparation.GetSepGroupContingentFromPotok(@sepGroupContingent, IK, tempPSYC.YearIK, false)) then
  begin
    Application.MessageBox('При загрузке контингента специальностей и групп для данного потока произошла ошибка', PChar(Caption), MB_ICONWARNING);
    exit;
  end;
  if (not cbNoCheckExpectedContingent.Checked) and (dbcbDecomposeType.KeyValue <> 1) then
  begin
    // сначала проверим общее количество групп или подгрупп
    specContingent.First;
    curUnitCount:= 0;
    while not specContingent.Eof do
    begin
      case dbcbDecomposeType.KeyValue of
        2: curUnitCount:= curUnitCount + specContingent.FieldByName('group_count').AsInteger;
        3: curUnitCount:= curUnitCount + specContingent.FieldByName('subgroup_count').AsInteger;
      end;
      specContingent.Next;
    end;
    if fCountOfSeparatedGroupsInPotok <> 0 then
    case dbcbDecomposeType.KeyValue of
      2: curUnitCount:= curUnitCount + fCountOfSeparatedGroupsInPotok;
      3:
        begin
          sepGroupContingent.First;
          while not sepGroupContingent.Eof do
          begin
            curUnitCount:= curUnitCount + sepGroupContingent.FieldByName('subgroup_count').AsInteger;
            sepGroupContingent.Next;
          end;
        end;
    end;

    if dsCalcUnits.DataSet.RecordCount <> curUnitCount then
    begin
      Application.MessageBox('Количество созданных вами расчетных единиц не соответствует ожидаемому количеству расчетнных единиц в выбранном учебном году!',
          PChar(Caption), MB_ICONWARNING);
      exit;
    end;

    // затем проверим корректность распределения созданных расч. между специальностями потока

    if fCountOfSpecialitiesInPotok <> 0 then
    begin
      specContingent.First;
      while not specContingent.Eof do
      begin
        curUnitCount:= 0;
        dsCalcUnits.DataSet.First;
        while not dsCalcUnits.DataSet.Eof do
        begin
          if dsCalcUnits.DataSet.FieldByName('ik_spec_fac').Value <> NULL then
            if dsCalcUnits.DataSet.FieldByName('ik_spec_fac').AsInteger = specContingent.FieldByName('ik_spec_fac').AsInteger then
              inc(curUnitCount);
          dsCalcUnits.DataSet.Next;
        end;
        if curUnitCount > 0 then
        begin
          if ((dbcbDecomposeType.KeyValue = 2) and (curUnitCount <> specContingent.FieldByName('group_count').AsInteger)) or
            ((dbcbDecomposeType.KeyValue = 3) and (curUnitCount <> specContingent.FieldByName('subgroup_count').AsInteger)) then
          begin
            Application.MessageBox(PChar('Расчетные единицы распределены некорректно для специальности "' + specContingent.FieldByName('full_name').AsString + '"'),
              PChar(Caption), MB_ICONWARNING);
            exit;
          end
          else
          begin
            specContingent.Edit;
            specContingent.FieldByName('Tag').AsInteger:= 1;  //т.е. состав данной специальности корректный
            specContingent.Post;
          end;
        end
        else
        begin
          specContingent.Edit;
          specContingent.FieldByName('Tag').AsInteger:= 2;  //т.е. состав данной специальности еще не распределен между группами
          specContingent.Post;
        end;
        specContingent.Next;
      end;
    end;
  end;

  // затем проверим корректность распределения расчетных единиц между сепаративными группами
  if fCountOfSeparatedGroupsInPotok <> 0 then
  begin
    sepGroupContingent.First;
    while not sepGroupContingent.Eof do
    begin
      curUnitCount:= 0;
      dsCalcUnits.DataSet.First;
      while not dsCalcUnits.DataSet.Eof do
      begin
        if dsCalcUnits.DataSet.FieldByName('ik_grup').Value <> NULL then
          if dsCalcUnits.DataSet.FieldByName('ik_grup').AsInteger = sepGroupContingent.FieldByName('ik_grup').AsInteger then
            inc(curUnitCount);
        dsCalcUnits.DataSet.Next;
      end;
      if curUnitCount > 0 then
      begin
        if ((dbcbDecomposeType.KeyValue = 2) and (curUnitCount <> 1)) or
            ((dbcbDecomposeType.KeyValue = 3) and (curUnitCount <> sepGroupContingent.FieldByName('subgroup_count').AsInteger)) then
        begin
          Application.MessageBox(PChar('Расчетные единицы распределены некорректно для группы "' + sepGroupContingent.FieldByName('cName_grup').AsString + '"'),
              PChar(Caption), MB_ICONWARNING);
          exit;
        end
        else
        begin
          sepGroupContingent.Edit;
          sepGroupContingent.FieldByName('Tag').AsInteger:= 1;  //т.е. состав данной группы корректный
          sepGroupContingent.Post;
        end;
      end
      else
      begin
        sepGroupContingent.Edit;
        sepGroupContingent.FieldByName('Tag').AsInteger:= 2;  //т.е. состав данной группы еще не распределен
        sepGroupContingent.Post;
      end;
      sepGroupContingent.Next;
    end;
  end;

  specContingent.First;
  sepGroupContingent.First;
  ifContingentWasFill:= false;

  if (dbcbDecomposeType.KeyValue <> 1) and (tempPSYC.AllCalcUnitBudget = 0) and (tempPSYC.AllCalcUnitContract = 0) then
    if Application.MessageBox(PChar('Ожидаемый контингент на выбранный учебный год еще не распределен между расчетными единицами.' + #10#13 +
      'Распределить контингент автоматически?'), PChar(Caption), MB_YESNO) = mrYes then
    begin
      TNagruzkaController.Preparation.AutoDistributeContingentBetweenCalcUnits(IK, dbcbDecomposeType.KeyValue, tempPSYC);
      sgContingent.Cells[3, sgContingent.Row]:= IntToStr(tempPSYC.AllCalcUnitBudget);
      sgContingent.Cells[4, sgContingent.Row]:= IntToStr(tempPSYC.AllCalcUnitContract);
      UpdateModifiedState;
      ifContingentWasFill:= true;
 //     if fCountOfSeparatedGroupsInPotok > 0 then
 //       Application.MessageBox('В поток включены отдельные группы. Ожидаемый контингент потока не был распределен для расчетных единиц имеющих отношение к этим группам.', PChar(Caption), MB_ICONINFORMATION);
    end;

  temp:= TfrmNagruzkaCalcUnitsContingent.CreateDialog(Application, Connection, nil);
  temp.Tag:= sgContingent.Row-1;
  temp.Read(Tag, IK, dbcbDecomposeType.KeyValue, cbNoCheckExpectedContingent.Checked, tempPSYC, specContingent, factGroupContingent, sepGroupContingent);
  temp.IsModified:= ifContingentWasFill;
  if (temp.ShowModal = mrOk) or (temp.bbApply.Tag = 1) then
  begin
    sgContingent.Cells[3, temp.Tag+1]:= IntToStr(tempPSYC.AllCalcUnitBudget);
    sgContingent.Cells[4, temp.Tag+1]:= IntToStr(tempPSYC.AllCalcUnitContract);
    UpdateModifiedState;
  end;                                  
finally
  if temp <> nil then temp.Free;
  if specContingent <> nil then
  begin
    if specContingent.Active then specContingent.Close;
    specContingent.Free;
  end;
  if factGroupContingent <> nil then
  begin
    if factGroupContingent.Active then factGroupContingent.Close;
    factGroupContingent.Free;
  end;
  if sepGroupContingent <> nil then
  begin
    if sepGroupContingent.Active then sepGroupContingent.Close;
    sepGroupContingent.Free;
  end;
end;
end;

procedure TfrmNagruzkaEditPotokShemes.actFillContingentUpdate(Sender: TObject);
begin
 if dbcbDecomposeType.KeyValue <> NULL then
    (Sender as TAction).Enabled:= Panel9.Visible and (sgContingent.Row > 0)
  else
    (Sender as TAction).Enabled:= false;
end;

procedure TfrmNagruzkaEditPotokShemes.actLoadGroupListAutoExecute(
  Sender: TObject);
var
  i, j, k, g, basicCount, lastCount, needYearIK: integer;
  needCount: TStringList;
  tempStr, secTempStr, insertedName: string;      // количество групп и/или подгрупп
  tempDS, groupsDS: TADODataSet;
  isNotConnectedWtihRealGroup: boolean;
begin
  if fPotokShemaContingent.Count = 0 then
  begin
    Application.MessageBox('Не заполнен ожидаемый контингент специальностей и групп, входящих в поток. В этом случае автоматическое создание расчетных единиц не возможно.', 'Автоматическое создание расчетных единиц', MB_ICONWARNING);
    exit;
  end;

  isNotConnectedWtihRealGroup:= false;
  needCount:= TStringList.Create;
  // определим все возможные количества расчетных единиц
  case dbcbDecomposeType.KeyValue of
  2:
    begin
      for j := 0 to fPotokShemaContingent.Count - 1 do
        if needCount.IndexOf(sgContingent.Cells[1, j + 1]) < 0 then
          needCount.Add(sgContingent.Cells[1, j + 1]);

      if (needCount.Count <> 1) then //если не определено конкретное кол-во групп, либо их нет вообще, то спрашиваем
      begin
        if not InputQuery('Автоматическое создание групп', 'Укажите количество групп, которые вы хотите создать:', tempStr) then
        begin
          needCount.Free;
          exit
        end
        else
        begin
          if needCount.Count > 0 then
            if needCount.IndexOf(tempStr) < 0 then
            begin
              Application.MessageBox('Вы указали количество групп, которое не соответствует ожидаемому контингенту!', 'Автоматическое создание групп', MB_ICONERROR);
              needCount.Free;
              exit;
            end;
        end;
      end
      else tempStr:= needCount[0];

      // очистим ожидаемый контингент для тех годов, которые не соответсвуют указанному числу
      for j := 0 to fPotokShemaContingent.Count - 1 do
        TPotokShemaYearContingent(fPotokShemaContingent[j]).ClearList;

      dsCalcUnits.DataSet.First;
      while not dsCalcUnits.DataSet.Eof do dsCalcUnits.DataSet.Delete;

      groupsDS:= TGeneralController.Instance.GetNewADODataSet(false);
      TNagruzkaController.Preparation.GetAllGroupsFromPotok(@groupsDS, self.IK, false);

      if groupsDS.RecordCount <> StrToInt(tempStr) then
      begin
        isNotConnectedWtihRealGroup:= true;
        needYearIK:= -1;
        for j := 0 to fPotokShemaContingent.Count - 1 do
          if sgContingent.Cells[1, j + 1] = tempStr then
          begin
            needYearIK:= TPotokShemaYearContingent(fPotokShemaContingent[j]).YearIK;
            break;
          end;
        if needYearIK = -1 then
          raise Exception.Create('Не удалось определить учебный год, для которого формируются расчетные единицы!');

        tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
        try
          tempDS.CommandText:= 'SELECT rsp.ik_spec_fac, Cshort_spec, py.year_value, group_count FROM Relation_potok_spec rsp INNER JOIN Potok ON rsp.ik_potok = Potok.ik_potok ' +
            'INNER JOIN Year_uch_pl py ON Potok.ik_year_enter = py.ik_year_uch_pl INNER JOIN Plan_contingent ON rsp.ik_spec_fac = Plan_contingent.ik_spec_fac ' +
            'INNER JOIN Year_uch_pl cy ON Plan_contingent.ik_year = cy.ik_year_uch_pl INNER JOIN Relation_spec_fac rsf ON rsp.ik_spec_fac = rsf.ik_spec_fac INNER JOIN Spec_stud ON rsf.ik_spec = Spec_stud.ik_spec ' +
            'WHERE (course_number = (cy.year_value - py.year_value + 1)) and (cy.ik_year_uch_pl = ' + IntToStr(needYearIK) + ') and (Potok.ik_potok = ' + IntToStr(IK) + ') ORDER BY Cshort_spec';
          tempDS.Open;
          while not tempDS.Eof do
          begin
            for i:= 1 to tempDS.FieldByName('group_count').AsInteger do
            begin
              dbgCalcUnits.DataSource.DataSet.Insert;
              if tempDS.FieldByName('group_count').AsInteger > 1 then
                 insertedName:= tempDS.FieldByName('Cshort_spec').AsString + '-' + IntToStr(i) + '-' + Copy(tempDS.FieldByName('year_value').AsString, 3, 2)
              else insertedName:= tempDS.FieldByName('Cshort_spec').AsString + '-' + Copy(tempDS.FieldByName('year_value').AsString, 3, 2);
              dbgCalcUnits.DataSource.DataSet.FieldByName('cName_calc_unit').Value:= insertedName;
              dbgCalcUnits.DataSource.DataSet.FieldByName('ik_grup').Value:= NULL;
              dbgCalcUnits.DataSource.DataSet.FieldByName('ik_spec_fac').Value:= tempDS.FieldByName('ik_spec_fac').Value;
              dbgCalcUnits.DataSource.DataSet.FieldByName('ik_uch_plan').AsInteger:= fPotokUchPlanIK;
              dbgCalcUnits.DataSource.DataSet.Post;
              for j:= 0 to fPotokShemaContingent.Count - 1 do
                if sgContingent.Cells[1, j + 1] = tempStr then
                  TPotokShemaYearContingent(fPotokShemaContingent[j]).AddCalcUnitContingent(TCalcUnitContingent.Create(insertedName, tempDS.FieldByName('ik_spec_fac').AsInteger, NULL, 0, 0));
            end;
            tempDS.Next;
          end;
          tempDS.Close;
          tempDS.CommandText:= 'SELECT Grup.ik_grup, Grup.ik_spec_fac, cName_grup, ik_uch_plan FROM Grup WHERE ik_grup in (SELECT ik_grup FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(IK) + ')';
          tempDS.Open;
          while not tempDS.Eof do
          begin
            dbgCalcUnits.DataSource.DataSet.Insert;
            dbgCalcUnits.DataSource.DataSet.FieldByName('cName_calc_unit').Value:= tempDS.FieldByName('cName_grup').Value;
            dbgCalcUnits.DataSource.DataSet.FieldByName('ik_grup').Value:= tempDS.FieldByName('ik_grup').Value;
            dbgCalcUnits.DataSource.DataSet.FieldByName('ik_spec_fac').Value:= tempDS.FieldByName('ik_spec_fac').Value;
            if tempDS.FieldByName('ik_uch_plan').Value = NULL then
              dbgCalcUnits.DataSource.DataSet.FieldByName('ik_uch_plan').AsInteger:= fPotokUchPlanIK
            else dbgCalcUnits.DataSource.DataSet.FieldByName('ik_uch_plan').Value:= tempDS.FieldByName('ik_uch_plan').Value;
            dbgCalcUnits.DataSource.DataSet.Post;
            for j:= 0 to fPotokShemaContingent.Count - 1 do
              if sgContingent.Cells[1, j + 1] = tempStr then
                TPotokShemaYearContingent(fPotokShemaContingent[j]).AddCalcUnitContingent(TCalcUnitContingent.Create(tempDS.FieldByName('cName_grup').AsString, tempDS.FieldByName('ik_spec_fac').Value, tempDS.FieldByName('ik_grup').Value, 0, 0));
            tempDS.Next;
          end;
        finally
          if tempDS.Active then tempDS.Close;
          tempDS.Free;
        end;
      end
      else       // если количество реальных групп равно указанному числу, то мы может их связать
      begin
        groupsDS.First;
        while not groupsDS.Eof do
        begin
          dbgCalcUnits.DataSource.DataSet.Insert;
          dbgCalcUnits.DataSource.DataSet.FieldByName('cName_calc_unit').Value:= groupsDS.FieldByName('cName_grup').Value;
          dbgCalcUnits.DataSource.DataSet.FieldByName('ik_grup').Value:= groupsDS.FieldByName('ik_grup').Value;
          dbgCalcUnits.DataSource.DataSet.FieldByName('ik_spec_fac').Value:= groupsDS.FieldByName('ik_spec_fac').Value;
          if (groupsDS.FieldByName('ik_grup').Value <> NULL) and (groupsDS.FieldByName('ik_uch_plan').Value <> NULL) then
            dbgCalcUnits.DataSource.DataSet.FieldByName('ik_uch_plan').Value:= groupsDS.FieldByName('ik_uch_plan').Value
          else dbgCalcUnits.DataSource.DataSet.FieldByName('ik_uch_plan').AsInteger:= fPotokUchPlanIK;
          dbgCalcUnits.DataSource.DataSet.Post;
          for j := 0 to fPotokShemaContingent.Count - 1 do
            if sgContingent.Cells[1, j + 1] = tempStr then
              TPotokShemaYearContingent(fPotokShemaContingent[j]).AddCalcUnitContingent(TCalcUnitContingent.Create(groupsDS.FieldByName('cName_grup').AsString, groupsDS.FieldByName('ik_spec_fac').Value, groupsDS.FieldByName('ik_grup').Value, 0, 0));
          groupsDS.Next;
        end;
      end;
      if groupsDS.Active then groupsDS.Close;
      groupsDS.Free;
    end;
  3:
    begin
      for j := 0 to fPotokShemaContingent.Count - 1 do
        if needCount.IndexOf(sgContingent.Cells[2, j + 1]) < 0 then
          needCount.Add(sgContingent.Cells[2, j + 1]);

      needYearIK:= -1;
      if (needCount.Count <> 1) then //если не определено конкретное кол-во подгрупп, либо их нет вообще, то спрашиваем
      begin
        if not InputQuery('Автоматическое создание подгрупп', 'Укажите количество подгрупп, которые вы хотите создать:', tempStr) then
        begin
          needCount.Free;
          exit;
        end
        else
        begin
          if needCount.Count > 0 then
            if needCount.IndexOf(tempStr) < 0 then
            begin
              Application.MessageBox('Вы указали количество подгрупп, которое не соответствует ожидаемому контингенту!', 'Автоматическое создание подгрупп', MB_ICONERROR);
              needCount.Free;
              exit;
            end;
          if needCount.Count = 0 then // если вообще нет записей по контингенту, то спросим сколько групп
          begin
            if not InputQuery('Автоматическое создание подгрупп', 'Укажите количество групп, между которыми будут распределены подгруппы:', secTempStr) then
            begin
              needCount.Free;
              exit;
            end;
          end
          else //иначе найдем в таблице уч. годов нужное значение
          begin
            for j := 0 to fPotokShemaContingent.Count - 1 do
              if sgContingent.Cells[2, j + 1] = tempStr then
              begin
                secTempStr:= sgContingent.Cells[1, j + 1];
                needYearIK:= TPotokShemaYearContingent(fPotokShemaContingent[j]).YearIK;
                break;
              end;
          end;
        end;
      end
      else
      begin
        tempStr:= needCount[0];
        secTempStr:= sgContingent.Cells[1, 1]; // в качестве количества групп возъмем первое попавшееся число
        needYearIK:= TPotokShemaYearContingent(fPotokShemaContingent[0]).YearIK;
      end;

      if needYearIK = -1 then
          raise Exception.Create('Не удалось определить учебный год, для которого формируются расчетные единицы!');

      for j := 0 to fPotokShemaContingent.Count - 1 do
        TPotokShemaYearContingent(fPotokShemaContingent[j]).ClearList;

      dsCalcUnits.DataSet.First;
      while not dsCalcUnits.DataSet.Eof do dsCalcUnits.DataSet.Delete;

      groupsDS:= TGeneralController.Instance.GetNewADODataSet(false);
      TNagruzkaController.Preparation.GetAllGroupsFromPotok(@groupsDS, self.IK, false);

      tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
      try
        tempDS.CommandText:= 'SELECT rsp.ik_spec_fac, Cshort_spec, py.year_value, group_count, subgroup_count FROM Relation_potok_spec rsp INNER JOIN Potok ON rsp.ik_potok = Potok.ik_potok ' +
            'INNER JOIN Year_uch_pl py ON Potok.ik_year_enter = py.ik_year_uch_pl INNER JOIN Plan_contingent ON rsp.ik_spec_fac = Plan_contingent.ik_spec_fac ' +
            'INNER JOIN Year_uch_pl cy ON Plan_contingent.ik_year = cy.ik_year_uch_pl INNER JOIN Relation_spec_fac rsf ON rsp.ik_spec_fac = rsf.ik_spec_fac INNER JOIN Spec_stud ON rsf.ik_spec = Spec_stud.ik_spec ' +
            'WHERE (course_number = (cy.year_value - py.year_value + 1)) and (cy.ik_year_uch_pl = ' + IntToStr(needYearIK) + ') and (Potok.ik_potok = ' + IntToStr(IK) + ') ORDER BY Cshort_spec';
        tempDS.Open;
        if groupsDS.RecordCount <> StrToInt(secTempStr) then //если количество групп равно тому, что мы подгрузили в реальные группы
        begin
          isNotConnectedWtihRealGroup:= true;
          while not tempDS.Eof do
          begin
            basicCount:= Round(tempDS.FieldByName('subgroup_count').AsInteger/tempDS.FieldByName('group_count').AsInteger);
            lastCount:= tempDS.FieldByName('subgroup_count').AsInteger - basicCount*(tempDS.FieldByName('group_count').AsInteger - 1);

            for i:= 1 to tempDS.FieldByName('group_count').AsInteger do
            begin
              if (i = tempDS.FieldByName('group_count').AsInteger) then k:= lastCount
              else k:= basicCount;
              for g := 1 to k do
              begin
                dbgCalcUnits.DataSource.DataSet.Insert;
                if tempDS.FieldByName('group_count').AsInteger > 1 then
                begin
                  if k = 1 then
                    insertedName:= tempDS.FieldByName('Cshort_spec').AsString + '-' + IntToStr(i) + '-' + Copy(tempDS.FieldByName('year_value').AsString, 3, 2)
                  else insertedName:= tempDS.FieldByName('Cshort_spec').AsString + '-' + IntToStr(i) + '-' + Copy(tempDS.FieldByName('year_value').AsString, 3, 2) + ' - ' + IntToStr(g);
                end
                else
                begin
                  if k = 1 then
                    insertedName:= tempDS.FieldByName('Cshort_spec').AsString + '-' + Copy(tempDS.FieldByName('year_value').AsString, 3, 2)
                  else insertedName:= tempDS.FieldByName('Cshort_spec').AsString + '-' + Copy(tempDS.FieldByName('year_value').AsString, 3, 2) + ' - ' + IntToStr(g);
                end;
                dbgCalcUnits.DataSource.DataSet.FieldByName('cName_calc_unit').Value:= insertedName;
                dbgCalcUnits.DataSource.DataSet.FieldByName('ik_grup').Value:= NULL;
                dbgCalcUnits.DataSource.DataSet.FieldByName('ik_spec_fac').Value:= tempDS.FieldByName('ik_spec_fac').Value;
                dbgCalcUnits.DataSource.DataSet.FieldByName('ik_uch_plan').AsInteger:= fPotokUchPlanIK;
                dbgCalcUnits.DataSource.DataSet.Post;
                for j:= 0 to fPotokShemaContingent.Count - 1 do
                  if sgContingent.Cells[2, j + 1] = tempStr then
                    TPotokShemaYearContingent(fPotokShemaContingent[j]).AddCalcUnitContingent(TCalcUnitContingent.Create(insertedName, tempDS.FieldByName('ik_spec_fac').AsInteger, NULL, 0, 0));
              end;
            end;
            tempDS.Next;
          end;
        end
        else
        begin
          while not tempDS.Eof do
          begin
            basicCount:= Round(tempDS.FieldByName('subgroup_count').AsInteger/tempDS.FieldByName('group_count').AsInteger);
            lastCount:= tempDS.FieldByName('subgroup_count').AsInteger - basicCount*(tempDS.FieldByName('group_count').AsInteger - 1);

            groupsDS.First;
            i:= 1;
            while not groupsDS.Eof do
            begin
              if groupsDS.FieldByName('ik_spec_fac').AsInteger = tempDS.FieldByName('ik_spec_fac').AsInteger then
              begin     
                if i = tempDS.FieldByName('group_count').AsInteger then k:= lastCount
                else k:= basicCount;
                for g := 1 to k do
                begin
                  dbgCalcUnits.DataSource.DataSet.Insert;
                  if k = 1 then
                    insertedName:= groupsDS.FieldByName('cName_grup').AsString
                  else insertedName:= groupsDS.FieldByName('cName_grup').AsString + ' - ' + IntToStr(g);
                  dbgCalcUnits.DataSource.DataSet.FieldByName('cName_calc_unit').Value:= insertedName;
                  dbgCalcUnits.DataSource.DataSet.FieldByName('ik_grup').Value:= groupsDS.FieldByName('ik_grup').Value;
                  dbgCalcUnits.DataSource.DataSet.FieldByName('ik_spec_fac').Value:= groupsDS.FieldByName('ik_spec_fac').Value;
                  if (groupsDS.FieldByName('ik_grup').Value <> NULL) and (groupsDS.FieldByName('ik_uch_plan').Value <> NULL) then
                    dbgCalcUnits.DataSource.DataSet.FieldByName('ik_uch_plan').Value:= groupsDS.FieldByName('ik_uch_plan').Value
                  else dbgCalcUnits.DataSource.DataSet.FieldByName('ik_uch_plan').AsInteger:= fPotokUchPlanIK;
                  dbgCalcUnits.DataSource.DataSet.Post;
                  for j := 0 to fPotokShemaContingent.Count - 1 do
                    if sgContingent.Cells[2, j + 1] = tempStr then
                      TPotokShemaYearContingent(fPotokShemaContingent[j]).AddCalcUnitContingent(TCalcUnitContingent.Create(insertedName, groupsDS.FieldByName('ik_spec_fac').Value, groupsDS.FieldByName('ik_grup').Value, 0, 0));
                end;
                inc(i);
              end;
              if i > tempDS.FieldByName('group_count').AsInteger then break;
              groupsDS.Next;
            end;
            tempDS.Next;
          end; 
        end;
        tempDS.Close;
        groupsDS.Close;

        // далее создаем подгруппы для сепаративных групп
        tempDS.CommandText:= 'SELECT pcsg.ik_grup, cName_grup, ik_spec_fac, ik_uch_plan, subgroup_count FROM Plan_contingent_of_sep_groups pcsg INNER JOIN Grup ON pcsg.ik_grup = Grup.ik_grup WHERE (ik_year = ' + IntToStr(needYearIK) + ') and (pcsg.ik_grup in (SELECT ik_grup FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(IK) + '))';
        tempDS.Open;
        while not tempDS.Eof do
        begin
          for i:= 1 to tempDS.FieldByName('subgroup_count').AsInteger do
          begin
            dbgCalcUnits.DataSource.DataSet.Insert;
            if tempDS.FieldByName('subgroup_count').AsInteger = 1 then
              insertedName:= tempDS.FieldByName('cName_grup').AsString
            else insertedName:= tempDS.FieldByName('cName_grup').AsString + ' - ' + IntToStr(i);
            dbgCalcUnits.DataSource.DataSet.FieldByName('cName_calc_unit').Value:= insertedName;
            dbgCalcUnits.DataSource.DataSet.FieldByName('ik_grup').Value:= tempDS.FieldByName('ik_grup').Value;
            dbgCalcUnits.DataSource.DataSet.FieldByName('ik_spec_fac').Value:= tempDS.FieldByName('ik_spec_fac').Value;
            if tempDS.FieldByName('ik_uch_plan').Value <> NULL then
              dbgCalcUnits.DataSource.DataSet.FieldByName('ik_uch_plan').Value:= tempDS.FieldByName('ik_uch_plan').Value
            else dbgCalcUnits.DataSource.DataSet.FieldByName('ik_uch_plan').Value:= fPotokUchPlanIK;
            dbgCalcUnits.DataSource.DataSet.Post;
            for j := 0 to fPotokShemaContingent.Count - 1 do
              if sgContingent.Cells[2, j + 1] = tempStr then
                TPotokShemaYearContingent(fPotokShemaContingent[j]).AddCalcUnitContingent(TCalcUnitContingent.Create(insertedName, tempDS.FieldByName('ik_spec_fac').Value, tempDS.FieldByName('ik_grup').Value, 0, 0));
          end;  
          tempDS.Next;
        end;
      finally
        if groupsDS.Active then groupsDS.Close;
        groupsDS.Free;
        if tempDS.Active then tempDS.Close;
        tempDS.Free;
      end;     
    end;
  end;    

  if Application.MessageBox('Распределить ожидаемый контингент потока между созданными расчетными единицами?', 'Автоматическое создание расчетных единиц', MB_YESNO) = mrYes then
  begin
    for j := 0 to fPotokShemaContingent.Count - 1 do
      if TPotokShemaYearContingent(fPotokShemaContingent[j]).CalcUnitCount = StrToInt(tempStr) then
        TNagruzkaController.Preparation.AutoDistributeContingentBetweenCalcUnits(IK, dbcbDecomposeType.KeyValue, TPotokShemaYearContingent(fPotokShemaContingent[j]));
  end;

  for j := 0 to fPotokShemaContingent.Count - 1 do
  begin
    sgContingent.Cells[3, j+1]:= IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[j]).AllCalcUnitBudget);
    sgContingent.Cells[4, j+1]:= IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[j]).AllCalcUnitContract);
  end;   
  Label1.Caption:= IntToStr(dbgCalcUnits.DataSource.DataSet.RecordCount) + ' расч. ед.';
  UpdateModifiedState;

  if isNotConnectedWtihRealGroup then
    Application.MessageBox(PChar('Созданные расчетные единицы не были связаны с реальными группами. Установите данную связь вручную.' + #10#13 +
      'Если данную связь нельзя установить в данный момент, сделайте это позже.'), 'Автоматическое создание расчетных единиц', MB_ICONINFORMATION);
end;

procedure TfrmNagruzkaEditPotokShemes.actLoadGroupListAutoUpdate(
  Sender: TObject);
begin
  if (dbcbDecomposeType.KeyValue <> NULL) then
  begin
    case dbcbDecomposeType.KeyValue of
    1: (Sender as TAction).Enabled:= false;
    2, 3: (Sender as TAction).Enabled:= fPotokShemaContingent.Count > 0;
    end;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfrmNagruzkaEditPotokShemes.actCallAddCalcUnitExecute(
  Sender: TObject);
var
  temp: TfrmNagruzkaAddCalcUnit;
  j: integer;
begin
  temp:= TfrmNagruzkaAddCalcUnit.CreateDialog(nil, Connection, nil);
  try
    temp.IK:= self.IK;
    temp.Tag:= -1;
    temp.Read;
    temp.IsModified:= false;
    if (temp.ShowModal() = mrOk) or (temp.bbApply.Tag = 1) then
    begin
      if dbgCalcUnits.DataSource.DataSet.Locate('cName_calc_unit', temp.dbeUnitName.Text,[loPartialKey]) then
      begin
        Application.MessageBox('Расчетная единица с таким названием уже существует', PChar(Caption), MB_ICONWARNING);
        exit;
      end;
      dbgCalcUnits.DataSource.DataSet.Insert;
      dbgCalcUnits.DataSource.DataSet.FieldByName('cName_calc_unit').Value:= temp.dbeUnitName.Text;
      dbgCalcUnits.DataSource.DataSet.FieldByName('ik_grup').Value:= temp.dbcbGrups.KeyValue;
      if temp.dbcbGrups.KeyValue <> NULL then
        dbgCalcUnits.DataSource.DataSet.FieldByName('ik_spec_fac').AsInteger:= temp.dbcbGrups.ListSource.DataSet.FieldByName('ik_spec_fac').AsInteger
      else dbgCalcUnits.DataSource.DataSet.FieldByName('ik_spec_fac').Value:= NULL;
      dbgCalcUnits.DataSource.DataSet.FieldByName('ik_uch_plan').Value:= temp.dbcbUchPlan.KeyValue;
      dbgCalcUnits.DataSource.DataSet.Post;

      for j := 0 to fPotokShemaContingent.Count - 1 do
      begin
        if temp.dbcbGrups.KeyValue <> NULL then
          TPotokShemaYearContingent(fPotokShemaContingent[j]).AddCalcUnitContingent(TCalcUnitContingent.Create(temp.dbeUnitName.Text, temp.dbcbGrups.ListSource.DataSet.FieldByName('ik_spec_fac').AsInteger, temp.dbcbGrups.ListSource.DataSet.FieldByName('ik_grup').Value, 0, 0))
        else
          TPotokShemaYearContingent(fPotokShemaContingent[j]).AddCalcUnitContingent(TCalcUnitContingent.Create(temp.dbeUnitName.Text, NULL, NULL, 0, 0));
        sgContingent.Cells[3, j+1]:= IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[j]).AllCalcUnitBudget);
        sgContingent.Cells[4, j+1]:= IntToStr(TPotokShemaYearContingent(fPotokShemaContingent[j]).AllCalcUnitContract);
      end;
      Label1.Caption:= IntToStr(dbgCalcUnits.DataSource.DataSet.RecordCount) + ' расч. ед.';
      UpdateModifiedState;
    end;
  finally
    temp.Free;
  end;   
  
{  if not Panel7.Visible then
    ToolButton2.Down:= true;
  if Panel7.Visible and (Panel7.Tag = 1) then
  begin
    Panel7.Visible:= false;
    ToolButton2.Down:= true;
    ToolButton4.Down:= false;
  end;
  if ToolButton2.Down then
  begin
    Panel7.Top:= 23;
    Panel7.Visible:= true;
    Panel7.Tag:= 0;
    Refresh;
    dbeUnitName.Text:= '';
    dbcbGrupsKeyValueChanged(dbcbGrups);
    dbeUnitName.SetFocus;
    dbeUnitName.SelLength:= 0;
    dbeUnitName.SelStart:= Length(dbeUnitName.Text);
  end
  else Panel7.Visible:= false;  }
end;

procedure TfrmNagruzkaEditPotokShemes.actCallAddCalcUnitUpdate(Sender: TObject);
begin
  if dbcbDecomposeType.KeyValue <> NULL then
    actCallAddCalcUnit.Enabled:= dbcbDecomposeType.KeyValue <> 1
  else
    actCallAddCalcUnit.Enabled:= false;
end;

procedure TfrmNagruzkaEditPotokShemes.UpdateModifiedState;
begin
  if dsCalcUnits.DataSet <> nil then
  begin
    if dsCalcUnits.DataSet.Active then
      IsModified:= (dbeName.Text <> '') and (dbcbDecomposeType.KeyValue <> NULL) and (dsCalcUnits.DataSet.RecordCount > 0)
    else IsModified:= false;
  end
  else IsModified:= false;
end;

end.
