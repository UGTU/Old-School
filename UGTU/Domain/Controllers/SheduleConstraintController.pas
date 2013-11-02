unit SheduleConstraintController;
  {#Author villain@ist.ugtu.net}
interface

uses SysUtils, Classes, Controls, StdCtrls, ComCtrls, Contnrs, SheduleController,
   ADODB, DB, Variants, GeneralController, SheduleClasses, SheduleGrids;

type
  TSheduleConstraintController = class(TInterfacedObject, ISheduleConstraintController)
  public
    procedure InitializeRoomConstraints(KafIK, YearIK, SemIK: integer; ATreeView: TTreeView);
    procedure InitializeTeacherConstraints(SheduleIK, TabN, KafIK: integer; ASemesterGrid: TTeacherSemesterConstraintsGrid);
    procedure InitializeTeacherSessionConstraints(SheduleIK, TabN, KafIK: integer; ASessionDataSet: TADODataSet);
    function SaveTeacherConstraints(SheduleIK, TabN, KafIK: integer; ATeacherConstraintGrid: TTeacherSemesterConstraintsGrid): boolean;
    function SaveRoomConstraint(isKafRooms: boolean; KafIK: integer; PrepodPlanIKList, AddedRooms: TStringList): boolean;
    function DeleteRoomConstraint(PrepodPlanIKList, ObjectIKList: TStringList; objectIsDep: boolean): boolean;
    procedure ReadPotoksToRoomConstraint(KafIK, YearIK, SemIK: integer; parentNode: TTreeNode; ATreeView: TTreeView);
    procedure ReadVZandVNsToRoomConstraint(KafIK, YearIK, SemIK: integer; parentNode: TTreeNode; ATreeView: TTreeView);
    procedure ReadCalcUnitsToRoomConstraint(parentNode: TTreeNode; ATreeView: TTreeView);
    procedure ReadPrepodsToRoomConstraint(ContentPlanIKList: string; parentNode: TTreeNode; ATreeView: TTreeView);
    procedure ReadRoomsToRoomConstraint(parentNode: TTreeNode; ATreeView: TTreeView);
    function GetPrepodPlanIKListForDisc(AKafIK, AYearIK, ASemIK, ADiscIK: integer): TStringList;
    function GetPrepodPlanIKListForPotok(AKafIK, AYearIK, ASemIK, ADiscIK, APotokIK: integer): TStringList;
    function GetPrepodPlanIKListForVZandVN(AContentPlanNagrIKList: string): TStringList;
    function GetPrepodPlanIKListForCalcUnit(AContentPlanNagrIKList: string; ACalcUnitIK: integer): TStringList;

  end;

implementation

uses NagruzkaController;

{ TSheduleConstraintController }

procedure TSheduleConstraintController.ReadCalcUnitsToRoomConstraint(parentNode: TTreeNode; ATreeView: TTreeView);
var
  calcUnitDS: TADODataSet;
  calcUnitNode: TTreeNode;
begin
  calcUnitDS:= TGeneralController.Instance.GetNewADODataSet(false);
  calcUnitDS.CommandText:= 'SELECT DISTINCT ppn.ik_calc_unit, cName_calc_unit FROM Prepod_plan_nagr ppn INNER JOIN Calc_unit_semestr ON ppn.ik_calc_unit = Calc_unit_semestr.ik_calc_unit WHERE ik_content_plan_nagr in (' + TRoomConstraintVZandVNItem(parentNode.Data).ContentPlanNagrIKList + ')';
  calcUnitDS.Open;
  while not calcUnitDS.Eof do
  begin
    calcUnitNode:= ATreeView.Items.AddChildObject(parentNode, calcUnitDS.FieldByName('cName_calc_unit').AsString, TRoomConstraintItem.Create(calcUnitDS.FieldByName('ik_calc_unit').AsInteger, rcitCalcUnit));
    ReadPrepodsToRoomConstraint(TRoomConstraintVZandVNItem(parentNode.Data).ContentPlanNagrIKList, calcUnitNode, ATreeView);
    calcUnitNode.Expand(true);
    calcUnitNode.ImageIndex:= 1;
    calcUnitNode.SelectedIndex:= 1;
    calcUnitDS.Next;
  end;
  calcUnitDS.Close;
  calcUnitDS.Free;
end;

procedure TSheduleConstraintController.ReadPotoksToRoomConstraint(KafIK, YearIK, SemIK: integer;
  parentNode: TTreeNode; ATreeView: TTreeView);
var
  potokDS: TADODataSet;
  potokNode: TTreeNode;
begin
  potokDS:= TGeneralController.Instance.GetNewADODataSet(false);
  potokDS.CommandText:=  'SELECT DISTINCT ps.ik_potok_semestr , cus.cName_calc_unit FROM Potok_semestr ps '+
      'INNER JOIN Potok_semestr_shema pss ON ps.ik_potok_semestr = pss.ik_potok_semestr INNER JOIN Calc_unit_semestr cus ON pss.ik_shema = cus.ik_shema '+
      'INNER JOIN Content_plan_nagr cpn ON pss.ik_shema = cpn.ik_shema INNER JOIN Plan_nagr pn ON cpn.ik_plan_nagr = pn.ik_plan_nagr '+
      'WHERE (ik_year = ' + IntToStr(YearIK) + ') and (ik_sem_type = ' + IntToStr(SemIK) + ') and (ik_kaf = ' + IntToStr(KafIK) + ') and (ik_disc = ' + IntToStr(TRoomConstraintItem(parentNode.Data).IK) + ')';
  potokDS.Open;
  while not potokDS.Eof do
  begin
      potokNode:= ATreeView.Items.AddChildObject(parentNode, potokDS.FieldByName('cName_calc_unit').AsString, TRoomConstraintItem.Create(potokDS.FieldByName('ik_potok_semestr').AsInteger, rcitPotok));
      ReadVZandVNsToRoomConstraint(KafIK, YearIK, SemIK, potokNode, ATreeView);
      potokNode.Expand(true);
      potokNode.ImageIndex:= 0;
      potokNode.SelectedIndex:= 0;
      potokDS.Next;
  end;
  potokDS.Close;
  potokDS.Free;
end;

procedure TSheduleConstraintController.ReadPrepodsToRoomConstraint(ContentPlanIKList: string; parentNode: TTreeNode;
  ATreeView: TTreeView);
var
  teachersDS: TADODataSet;
  teacherNode: TTreeNode;
  i: integer;
begin
  teachersDS:= TGeneralController.Instance.GetNewADODataSet(false);
  teachersDS.CommandText:= 'SELECT DISTINCT ik_prepod_plan, cpn.i_commission_count, ppn.commission_member, ppn.ik_id_prepod, ' +
      '(clastname + '' '' + LEFT(cfirstname, 1) + ''. '' + LEFT(cotch, 1) + ''. (таб. № '' + Convert(nvarchar, Prepods.iTab_n) + '', '' + cName_work_type_short + '')'') as FIO, ' +
      '(clastname + '' '' + LEFT(cfirstname, 1) + ''. '' + LEFT(cotch, 1) + ''. (таб. № '' + Convert(nvarchar, Prepods.iTab_n) + '', '' + cName_work_type_short + '', № в комиссии '' + Convert(nvarchar, commission_member) + '')'') as longFIO ' +
      'FROM Prepod_plan_nagr ppn INNER JOIN Content_plan_nagr cpn ON ppn.ik_content_plan_nagr = cpn.ik_content_plan_nagr INNER JOIN Relation_kafedra_prep rkp ON ppn.ik_id_prepod = rkp.ik_id_prepod INNER JOIN PrepodWorkType ' +
      'ON rkp.ik_work_type = PrepodWorkType.ik_work_type INNER JOIN Prepods ON rkp.itab_n = Prepods.itab_n WHERE (ppn.ik_content_plan_nagr in (' + ContentPlanIKList +
      ')) and (ik_calc_unit = ' + IntToStr(TRoomConstraintItem(parentNode.Data).IK) + ')';
  teachersDS.Open;
  while not teachersDS.Eof do
  begin
    teacherNode:= nil;
    for i := 0 to parentNode.Count - 1 do
      if (TRoomConstraintPrepodItem(parentNode.Item[i].Data).PrepodIK = teachersDS.FieldByName('ik_id_prepod').AsInteger)
          and (TRoomConstraintPrepodItem(parentNode.Item[i].Data).CommissionNumber = teachersDS.FieldByName('commission_member').AsInteger) then
        teacherNode:= parentNode.Item[i];
    if teacherNode = nil then
    begin
      if teachersDS.FieldByName('i_commission_count').AsInteger > 1 then
        teacherNode:= ATreeView.Items.AddChildObject(parentNode, teachersDS.FieldByName('longFIO').AsString, TRoomConstraintPrepodItem.Create(teachersDS.FieldByName('ik_id_prepod').AsInteger, teachersDS.FieldByName('commission_member').AsInteger, rcitPrepodName))
      else teacherNode:= ATreeView.Items.AddChildObject(parentNode, teachersDS.FieldByName('FIO').AsString, TRoomConstraintPrepodItem.Create(teachersDS.FieldByName('ik_id_prepod').AsInteger, teachersDS.FieldByName('commission_member').AsInteger, rcitPrepodName));
    end;
    TRoomConstraintPrepodItem(teacherNode.Data).AddPrepodPlanNagrIK(teachersDS.FieldByName('ik_prepod_plan').AsInteger);
    ReadRoomsToRoomConstraint(teacherNode, ATreeView);
    teacherNode.Expand(true);
    teacherNode.ImageIndex:= 3;
    teacherNode.SelectedIndex:= 3;
    teachersDS.Next;
  end;
  teachersDS.Close;
  teachersDS.Free;
end;

procedure TSheduleConstraintController.ReadRoomsToRoomConstraint(parentNode: TTreeNode;
  ATreeView: TTreeView);
var
  roomsDS: TADODataSet;
  roomNode: TTreeNode;
begin
  roomsDS:= TGeneralController.Instance.GetNewADODataSet(false);
  roomsDS.CommandText:= 'SELECT Room.ik_room, ik_kaf, (cName_room + cName_campus + '' (Тип: '' + LOWER(ISNULL(Cname_room_type, ''<не указан>'')) + '', количество мест: '' + Convert(nvarchar, ISNULL(iSeatCount, 0)) + '')'') as full_room_name ' +
    'FROM Room_use_constraint ruc LEFT JOIN Room ON ruc.ik_room = Room.ik_room LEFT JOIN Campus ON Room.ik_campus = Campus.ik_campus LEFT JOIN RoomType ON Room.ik_room_type = RoomType.ik_room_type WHERE ik_prepod_plan in (' +
        TRoomConstraintPrepodItem(parentNode.Data).PrepodPlanNagrIKList + ')';
  roomsDS.Open;
  while not roomsDS.Eof do
  begin
    if roomsDS.FieldByName('ik_kaf').Value <> NULL then
    begin
      parentNode.DeleteChildren;
      roomNode:= ATreeView.Items.AddChildObject(parentNode, 'Аудитории кафедры ' + TNagruzkaController.Directory.GetDepartmentName(roomsDS.FieldByName('ik_kaf').AsInteger, true), TRoomConstraintItem.Create(roomsDS.FieldByName('ik_kaf').AsInteger, rcitAllRoomInKaf));
      roomNode.ImageIndex:= 2;
      roomNode.SelectedIndex:= 2;
      break;
    end;
    roomNode:= ATreeView.Items.AddChildObject(parentNode, roomsDS.FieldByName('full_room_name').AsString, TRoomConstraintItem.Create(roomsDS.FieldByName('ik_room').AsInteger, rcitRoom));
    roomNode.ImageIndex:= 2;
    roomNode.SelectedIndex:= 2;
    roomsDS.Next;
  end;
  roomsDS.Close;
  roomsDS.Free;
end;

procedure TSheduleConstraintController.ReadVZandVNsToRoomConstraint(KafIK, YearIK, SemIK: integer;
  parentNode: TTreeNode; ATreeView: TTreeView);
var
  vidZanyatDS: TADODataSet;
  vzNode: TTreeNode;
  i: integer;
begin
  vidZanyatDS:= TGeneralController.Instance.GetNewADODataSet(false);
  vidZanyatDS.CommandText:= 'SELECT DISTINCT cpn.ik_content_plan_nagr, cpn.ik_vid_zanyat, cpn.ik_vid_nagruzki, (cName_vid_zanyat + '' ('' + Cname_vid_nagruzki + '')'') as full_name FROM Content_plan_nagr cpn INNER JOIN ' +
        'vid_zaniat ON cpn.ik_vid_zanyat = vid_zaniat.ik_vid_zanyat INNER JOIN Vid_nagruzki ON cpn.ik_vid_nagruzki = Vid_nagruzki.ik_vid_nagruzki ' +
        'WHERE (ik_plan_nagr in (SELECT ik_plan_nagr FROM Plan_nagr WHERE (ik_year = ' + IntToStr(YearIK) + ') and (ik_sem_type = ' + IntToStr(SemIK) + ') and (ik_kaf = ' + IntToStr(KafIK) +
        '))) and (ik_disc = ' + IntToStr(TRoomConstraintItem(parentNode.Parent.Data).IK) + ') and (ik_shema in (SELECT ik_shema FROM Potok_semestr_shema INNER JOIN Potok_semestr ON Potok_semestr_shema.ik_potok_semestr = Potok_semestr.ik_potok_semestr WHERE id_potok = ' + IntToStr(TRoomConstraintItem(parentNode.Data).IK) + ')) and ((iK_type_vz = 3) or (vid_zaniat.iK_vid_zanyat = 6))';
  vidZanyatDS.Open;
  while not vidZanyatDS.Eof do
  begin
    vzNode:= nil;
    for i := 0 to parentNode.Count - 1 do
      if (TRoomConstraintVZandVNItem(parentNode.Item[i].Data).VidZanyatIK = vidZanyatDS.FieldByName('ik_vid_zanyat').AsInteger)
          and (TRoomConstraintVZandVNItem(parentNode.Item[i].Data).VidNagruzkiIK = vidZanyatDS.FieldByName('ik_vid_nagruzki').AsInteger) then
        vzNode:= parentNode.Item[i];
    if vzNode = nil then
      vzNode:= ATreeView.Items.AddChildObject(parentNode, vidZanyatDS.FieldByName('full_name').AsString, TRoomConstraintVZandVNItem.Create(vidZanyatDS.FieldByName('ik_vid_zanyat').AsInteger, vidZanyatDS.FieldByName('ik_vid_nagruzki').AsInteger, rcitVZandVN));
    TRoomConstraintVZandVNItem(vzNode.Data).AddContentPlanNagrIK(vidZanyatDS.FieldByName('ik_content_plan_nagr').AsInteger);

    vzNode.Expand(true);
    vzNode.ImageIndex:= 5;
    vzNode.SelectedIndex:= 5;
    vidZanyatDS.Next;
  end;
  for i := 0 to parentNode.Count - 1 do
    ReadCalcUnitsToRoomConstraint(parentNode.Item[i], ATreeView);
  vidZanyatDS.Close;
  vidZanyatDS.Free;
end;

procedure TSheduleConstraintController.InitializeRoomConstraints(KafIK, YearIK, SemIK: integer;
  ATreeView: TTreeView);
var
  discDS: TADODataSet;
  discNode: TTreeNode;
begin
  discDS:= TGeneralController.Instance.GetNewADODataSet(false);
  discDS.CommandText:= 'SELECT DISTINCT ik_disc, cName_disc FROM discpln WHERE ik_disc in (SELECT ik_disc FROM Content_plan_nagr WHERE ik_plan_nagr in (SELECT ik_plan_nagr FROM Plan_nagr WHERE (ik_year = ' + IntToStr(YearIK) + ') and (ik_sem_type = ' + IntToStr(SemIK) + ') and (ik_kaf = ' + IntToStr(KafIK) + '))) ORDER BY cName_disc';
  discDS.Open;
  while not discDS.Eof do
  begin
    discNode:= ATreeView.Items.AddChildObject(nil, discDS.FieldByName('cName_disc').AsString, TRoomConstraintDiscItem.Create(discDS.FieldByName('ik_disc').AsInteger, rcitDisc));
    discNode.HasChildren:= true;
    discNode.ImageIndex:= 4;
    discNode.SelectedIndex:= 4;
    discDS.Next;
  end;
  discDS.Close;
  discDS.Free;
end;

procedure TSheduleConstraintController.InitializeTeacherConstraints(SheduleIK, TabN, KafIK: integer; ASemesterGrid: TTeacherSemesterConstraintsGrid);
var
  tempDS: TADODataSet;
  tempPartList: TObjectList;
  i, j, curDayNumber: integer;
  curIsDenumerator: boolean;
begin     
  ASemesterGrid.ClearItems;
  TSheduleRegistry.Functions.GetParts(tempPartList);
  ASemesterGrid.ColCount:= tempPartList.Count + 1;
  ASemesterGrid.RowCount:= 14;
  ASemesterGrid.RowHeights[1]:= 22;
  for i:= 0 to 11 do
  begin
    if (i div 6) = 0 then
      ASemesterGrid.Cells[0, i+2]:= DayNames[(i mod 6) + 1] + ', числ.'
    else
      ASemesterGrid.Cells[0, i+2]:= DayNames[(i mod 6) + 1] + ', знам.';
  end;
  for j := 0 to tempPartList.Count - 1 do
  begin
    ASemesterGrid.Cells[j+1, 0]:= IntToStr(TSPartInfo(tempPartList[j]).PartNumber) + '-пара';
    ASemesterGrid.Cells[j+1, 1]:= FormatDateTime('hh:nn', TSPartInfo(tempPartList[j]).StartTime) + ' - ' + FormatDateTime('hh:nn', TSPartInfo(tempPartList[j]).StopTime);
  end;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT bit_denumerator, ti_day_number, ik_event_type FROM Prepod_semester_time_constraint WHERE (iTab_n = ' + IntToStr(TabN) + ') and (ik_shedule = ' + IntToStr(SheduleIK) + ') and (ik_kaf = ' + IntToStr(KafIK) + ')';
  tempDS.Open;
  for i:= 0 to 11 do
    for j:= 0 to tempPartList.Count - 1 do
    begin
      curDayNumber:= (i mod 6) + 1;
      curIsDenumerator:= (i div 6) = 1;
      if tempDS.Locate('bit_denumerator; ti_day_number; ik_event_type', VarArrayOf([curIsDenumerator, curDayNumber, TSPartInfo(tempPartList[j]).PartNumber]), [loPartialKey]) then
        ASemesterGrid.AddItem(TTeacherSemesterConstraintItem.Create(TSPartInfo(tempPartList[j]).PartNumber, curDayNumber, curIsDenumerator, true, ASemesterGrid.Parent))
      else ASemesterGrid.AddItem(TTeacherSemesterConstraintItem.Create(TSPartInfo(tempPartList[j]).PartNumber, curDayNumber, curIsDenumerator, false, ASemesterGrid.Parent));
    end;
  tempDS.Close;
  tempDS.Free;
  ASemesterGrid.IsLoad:= true;  
end;

procedure TSheduleConstraintController.InitializeTeacherSessionConstraints(
  SheduleIK, TabN, KafIK: integer; ASessionDataSet: TADODataSet);
begin
  if ASessionDataSet.Active then ASessionDataSet.Close;
  ASessionDataSet.CommandText:= 'SELECT * FROM Prepod_session_time_constraint WHERE (ik_kaf = ' + IntToStr(KafIK) + ') and (iTab_n = ' + IntToStr(TabN) + ') and (d_session_date >= (SELECT d_session_start FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + ')) and (d_session_date <= (SELECT d_session_end FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + '))';
  ASessionDataSet.Open;
end;

function TSheduleConstraintController.SaveRoomConstraint(isKafRooms: boolean; KafIK: integer;
  PrepodPlanIKList, AddedRooms: TStringList): boolean;
var
  tempDS: TADODataSet;
  i, j: integer;
  tempStr: string;
begin
  tempStr:= '';
  for I := 0 to PrepodPlanIKList.Count - 1 do
    tempStr:= tempStr + PrepodPlanIKList[i] + ',';
  Delete(tempStr, Length(tempStr), 1);
  tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText:= 'SELECT * FROM Room_use_constraint WHERE ik_prepod_plan in (' + tempStr + ')';
  tempDS.Open;
  while not tempDS.Eof do
    tempDS.Delete;
  for I := 0 to PrepodPlanIKList.Count - 1 do
  begin
    if isKafRooms then
    begin
      tempDS.Insert;
      tempDS.FieldByName('ik_prepod_plan').AsString:= PrepodPlanIKList[i];
      tempDS.FieldByName('ik_kaf').AsInteger:= KafIK;
      tempDS.Post;
    end
    else
    begin
      for j := 0 to AddedRooms.Count - 1 do
      begin
        tempDS.Insert;
        tempDS.FieldByName('ik_prepod_plan').AsString:= PrepodPlanIKList[i];
        tempDS.FieldByName('ik_room').AsString:= AddedRooms[j];
        tempDS.Post;
      end;
    end;
  end;
  tempDS.UpdateBatch();
  tempDS.Close;
  tempDS.Free;
  Result:= true;
end;

function TSheduleConstraintController.SaveTeacherConstraints(SheduleIK, TabN, KafIK: integer;
  ATeacherConstraintGrid: TTeacherSemesterConstraintsGrid): boolean;
var
  tempDS: TADODataSet;
  i: integer;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText:= 'SELECT * FROM Prepod_semester_time_constraint WHERE (ik_shedule = ' + IntToStr(SheduleIK) + ') and (iTab_n = ' + IntToStr(TabN) + ') and (ik_kaf = ' + IntToStr(KafIK) + ')';
  tempDS.Open;
  while not tempDS.Eof do
    tempDS.Delete;
  for i := 0 to ATeacherConstraintGrid.TCItemsCount - 1 do
    if ATeacherConstraintGrid.TeacherConstraints[i].CheckBox.Checked then
    begin
      tempDS.Insert;
      tempDS.FieldByName('ik_shedule').AsInteger:= SheduleIK;
      tempDS.FieldByName('iTab_n').AsInteger:= TabN;
      tempDS.FieldByName('ik_kaf').AsInteger:= KafIK;
      tempDS.FieldByName('bit_denumerator').AsBoolean:= ATeacherConstraintGrid.TeacherConstraints[i].IsDenumerator;
      tempDS.FieldByName('ti_day_number').AsInteger:= ATeacherConstraintGrid.TeacherConstraints[i].DayNumber;
      tempDS.FieldByName('ik_event_type').AsInteger:= ATeacherConstraintGrid.TeacherConstraints[i].PartNumber;
      tempDS.Post;
    end;
  tempDS.UpdateBatch();
  tempDS.Close;
  tempDS.Free;
  Result:= true;
end;

function TSheduleConstraintController.DeleteRoomConstraint(
  PrepodPlanIKList, ObjectIKList: TStringList; objectIsDep: boolean): boolean;
var
  tempDS: TADODataSet;
  i: integer;
  tempStr: string;
begin
  tempStr:= '';
  for I := 0 to PrepodPlanIKList.Count - 1 do
    tempStr:= tempStr + PrepodPlanIKList[i] + ',';
  Delete(tempStr, Length(tempStr), 1);
  tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText:= 'SELECT * FROM Room_use_constraint WHERE ik_prepod_plan in (' + tempStr + ')';
  tempDS.Open;
  while not tempDS.Eof do
  begin
    if ObjectIKList = nil then
      tempDS.Delete
    else
    begin
      if objectIsDep then
      begin
        if ObjectIKList.IndexOf(tempDS.FieldByName('ik_kaf').AsString) >= 0 then
          tempDS.Delete
        else tempDS.Next;
      end
      else
      begin
        if ObjectIKList.IndexOf(tempDS.FieldByName('ik_room').AsString) >= 0 then
          tempDS.Delete
        else tempDS.Next;
      end;
    end;
  end;
  tempDS.UpdateBatch();
  tempDS.Close;
  tempDS.Free;
  Result:= true;
end;

function TSheduleConstraintController.GetPrepodPlanIKListForCalcUnit(AContentPlanNagrIKList: string; ACalcUnitIK: integer): TStringList;
var
  tempDS:TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  Result:= TStringList.Create;
  tempDS.CommandText:= 'SELECT DISTINCT ik_prepod_plan FROM Prepod_plan_nagr WHERE (ik_content_plan_nagr in (' + AContentPlanNagrIKList + ')) and (ik_calc_unit = ' + IntToStr(ACalcUnitIK) + ')';
  tempDS.Open;
  while not tempDS.Eof do
  begin
    Result.Add(tempDS.FieldByName('ik_prepod_plan').AsString);
    tempDS.Next;
  end;
  tempDS.Close;
  tempDS.Free;
end;

function TSheduleConstraintController.GetPrepodPlanIKListForDisc(AKafIK, AYearIK, ASemIK,
  ADiscIK: integer): TStringList;
var
  tempDS:TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  Result:= TStringList.Create;
  tempDS.CommandText:= 'SELECT DISTINCT ik_prepod_plan FROM Prepod_plan_nagr WHERE ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Content_plan_nagr WHERE (ik_disc = ' + IntToStr(ADiscIK) + ') and (ik_plan_nagr in (SELECT ik_plan_nagr FROM Plan_nagr WHERE (ik_sem_type = ' + IntToStr(ASemIK) + ') and (ik_year = ' + IntToStr(AYearIK) + ') and (ik_kaf = ' + IntToStr(AKafIK) + '))))';
  tempDS.Open;
  while not tempDS.Eof do
  begin
    Result.Add(tempDS.FieldByName('ik_prepod_plan').AsString);
    tempDS.Next;
  end;
  tempDS.Close;
  tempDS.Free;
end;

function TSheduleConstraintController.GetPrepodPlanIKListForPotok(AKafIK, AYearIK,
  ASemIK, ADiscIK, APotokIK: integer): TStringList;
var
  tempDS:TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  Result:= TStringList.Create;
  tempDS.CommandText:= 'SELECT DISTINCT ik_prepod_plan FROM Prepod_plan_nagr WHERE ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Content_plan_nagr WHERE (ik_disc = ' + IntToStr(ADiscIK) + ') and (ik_shema in (SELECT ik_shema FROM Potok_semestr_shema INNER JOIN Potok_semestr ON Potok_semestr_shema.ik_potok_semestr = Potok_semestr.ik_potok_semestr WHERE id_potok = ' + IntToStr(APotokIK) + ')) and (ik_plan_nagr in (SELECT ik_plan_nagr FROM Plan_nagr WHERE (ik_sem_type = ' + IntToStr(ASemIK) + ') and (ik_year = ' + IntToStr(AYearIK) + ') and (ik_kaf = ' + IntToStr(AKafIK) + '))))';
  tempDS.Open;
  while not tempDS.Eof do
  begin
    Result.Add(tempDS.FieldByName('ik_prepod_plan').AsString);
    tempDS.Next;
  end;
  tempDS.Close;
  tempDS.Free;
end;

function TSheduleConstraintController.GetPrepodPlanIKListForVZandVN(AContentPlanNagrIKList: string): TStringList;
var
  tempDS:TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  Result:= TStringList.Create;
  tempDS.CommandText:= 'SELECT DISTINCT ik_prepod_plan FROM Prepod_plan_nagr WHERE ik_content_plan_nagr in (' + AContentPlanNagrIKList + ')';
  tempDS.Open;
  while not tempDS.Eof do
  begin
    Result.Add(tempDS.FieldByName('ik_prepod_plan').AsString);
    tempDS.Next;
  end;
  tempDS.Close;
  tempDS.Free;
end;

end.
