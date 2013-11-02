unit SheduleAccountController;
  {#Author villain@ist.ugtu.net}
interface

uses SheduleController, GeneralController, SheduleClasses, ADODB, DB, Classes, Controls, SysUtils, Contnrs, Variants;

type
  TSheduleAccountController = class(TInterfacedObject, ISheduleAccountController)
  private
    fSemesterLengthInfoStorage: TObjectList;
    function LoadSemesterLengthExceptions(SheduleIK: integer): TADODataSet;
    function getSemesterLengthInfo(ASheduleIK: integer): TDefaultSemLengthInfo;
  public
    constructor Create;
    destructor Destroy; override;
    procedure GetRoomFund(SourceDataSet: PDataSet; KafIK, SheduleIK: integer);
    function CopyRoomListFromPrevSemester(SheduleIK, KafIK: integer): boolean;
    function DeleteRoomsFromRoomFund(SheduleIK: integer; RoomsIK: TStringList): boolean;
    function SaveDepRoomList(KafIK, SheduleIK: integer; fAddedRoomsList: TStringList): boolean;
    function GetSemesterLength(SheduleIK: integer; isLoadExceptions: boolean; var exceptionsDataSet: PDataSet): TDefaultSemLengthInfo;
    function GetCampusDistance(): TObjectList;
    function SaveCampusDistance(fCampusDistanceInfoList: TObjectList): boolean;
    function SaveSemsterLength(SheduleIK, YearIK, SemIK: integer; SemStart, SemStop, SessionStart, SessionStop: TDate; WTStart, WTEnd: TTime): boolean;
    function LoadSemLengthExceptionAvto(SheduleIK: integer; ASemStart, ASessionStart, ASessionStop: TDate): boolean;
    property SemLengthInfos[ASheduleIK: integer]: TDefaultSemLengthInfo read getSemesterLengthInfo;
  end;

implementation

uses uDM, DateUtils, ExceptionBase, SheduleGrids;

function TSheduleAccountController.GetSemesterLength(SheduleIK: integer; isLoadExceptions: boolean; var exceptionsDataSet: PDataSet): TDefaultSemLengthInfo;
var
  tempDataSet: TADODataSet;
begin
  result:= SemLengthInfos[SheduleIK];
  if Result = nil then
  begin
    tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
    tempDataSet.CommandText:= 'Select * From Shedule Where ik_shedule = ' + IntToStr(SheduleIK);
    tempDataSet.Open;
    if tempDataSet.RecordCount > 0 then
      Result:= TDefaultSemLengthInfo(fSemesterLengthInfoStorage[fSemesterLengthInfoStorage.Add(TDefaultSemLengthInfo.Create(SheduleIK, tempDataSet.FieldByName('ik_year').AsInteger, tempDataSet.FieldByName('ik_sem_type').AsInteger,
        tempDataSet.FieldByName('d_sem_start').Value, tempDataSet.FieldByName('d_sem_end').Value,
        tempDataSet.FieldByName('d_session_start').Value, tempDataSet.FieldByName('d_session_end').Value,
        tempDataSet.FieldByName('d_work_time_start').Value, tempDataSet.FieldByName('d_work_time_end').Value))]);
    tempDataSet.Close;
    tempDataSet.Free;
    if Result <> nil then
    begin
      tempDataSet:= LoadSemesterLengthExceptions(SheduleIK);
      tempDataSet.First;
      while not tempDataSet.Eof do
      begin
        Result.AddException(TSemLengthInfo.Create(Result.YearIK, tempDataSet.FieldByName('ik_spec_fac').AsInteger, tempDataSet.FieldByName('course_number').AsInteger,
          tempDataSet.FieldByName('d_sem_start').Value, tempDataSet.FieldByName('d_sem_end').Value,
          tempDataSet.FieldByName('d_session_start').Value, tempDataSet.FieldByName('d_session_end').Value));
        tempDataSet.Next;
      end;
      if isLoadExceptions then
        exceptionsDataSet:= @tempDataSet
      else tempDataSet.Close;
    end;
  end
  else
  begin
    if isLoadExceptions then
    begin
      tempDataSet:= LoadSemesterLengthExceptions(SheduleIK);
      exceptionsDataSet:= @tempDataSet;
    end;
  end;
  if Result = nil then
    raise EApplicationException.Create('Ошибка при получении информации о продолжительности учебного семестра');
end;

function TSheduleAccountController.getSemesterLengthInfo(ASheduleIK: integer): TDefaultSemLengthInfo;
var
  i: integer;
begin
  Result:= nil;
  for I := 0 to fSemesterLengthInfoStorage.Count - 1 do
    if (TDefaultSemLengthInfo(fSemesterLengthInfoStorage[i]).SheduleIK = ASheduleIK) then
      Result:= TDefaultSemLengthInfo(fSemesterLengthInfoStorage[i]);
end;

function TSheduleAccountController.LoadSemesterLengthExceptions(
  SheduleIK: integer): TADODataSet;
var
  year_value: string;
  tempDS: TADODataSet;
begin
  Result:= nil;
  if dm.adsSemLengthExceptions.Active then dm.adsSemLengthExceptions.Close;
  if dm.adsSpecialities.Active then dm.adsSpecialities.Close;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = (SELECT ik_year FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + ')';
    tempDS.Open;
    year_value:= tempDS.FieldByName('year_value').AsString;
    tempDS.Close;
  finally
    tempDS.Free;
  end;
  dm.adsSpecialities.CommandText:= 'Select ik_spec_fac, (Cshort_name_fac + '' - '' + Cshort_spec) as full_name From Spec_stud INNER JOIN Relation_spec_fac rsf ON Spec_stud.ik_spec = rsf.ik_spec INNER JOIN Fac ON rsf.ik_fac = Fac.ik_fac ' +
    'Where (ISNULL(YEAR(dDate_spec), ' + year_value + ') <= ' + year_value + ') ORDER BY Cshort_name_fac, Cshort_spec';
  //dm.adsSpecialities.Open;
  dm.adsSemLengthExceptions.CommandText:= 'SELECT * FROM Semester_length_exception WHERE ik_shedule = ' + IntToStr(SheduleIK);
  dm.adsSemLengthExceptions.Open;
  Result:= dm.adsSemLengthExceptions;
end;

function TSheduleAccountController.LoadSemLengthExceptionAvto(SheduleIK: integer; ASemStart, ASessionStart, ASessionStop: TDate): boolean;
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT * FROM GetSemesterLengthException(' + IntToStr(SheduleIK) + ')';
  tempDS.Open;
  while not tempDS.Eof do
  begin
    dm.adsSemLengthExceptions.Insert;
    dm.adsSemLengthExceptions.FieldByName('ik_shedule').AsInteger:= SheduleIK;
    dm.adsSemLengthExceptions.FieldByName('ik_spec_fac').AsInteger:= tempDS.FieldByName('ik_spec_fac').AsInteger;
    dm.adsSemLengthExceptions.FieldByName('course_number').AsInteger:= tempDS.FieldByName('course_number').AsInteger;
    dm.adsSemLengthExceptions.FieldByName('d_sem_start').AsDateTime:= ASemStart;

    dm.adsSemLengthExceptions.FieldByName('d_sem_end').AsDateTime:= ASemStart + tempDS.FieldByName('kol_ned').AsInteger*7;
    while DayOfWeek(dm.adsSemLengthExceptions.FieldByName('d_sem_end').AsDateTime) = 1 do
      dm.adsSemLengthExceptions.FieldByName('d_sem_end').AsDateTime:= dm.adsSemLengthExceptions.FieldByName('d_sem_end').AsDateTime - 1;

    dm.adsSemLengthExceptions.FieldByName('d_session_start').AsDateTime:= ASemStart + tempDS.FieldByName('kol_ned').AsInteger*7 + 1;
    while DayOfWeek(dm.adsSemLengthExceptions.FieldByName('d_session_start').AsDateTime) = 1 do
      dm.adsSemLengthExceptions.FieldByName('d_session_start').AsDateTime:= dm.adsSemLengthExceptions.FieldByName('d_session_start').AsDateTime + 1;

    dm.adsSemLengthExceptions.FieldByName('d_session_end').AsDateTime:= dm.adsSemLengthExceptions.FieldByName('d_session_start').AsDateTime + DaysBetween(ASessionStop, ASessionStart);
    while DayOfWeek(dm.adsSemLengthExceptions.FieldByName('d_session_end').AsDateTime) = 1 do
      dm.adsSemLengthExceptions.FieldByName('d_session_end').AsDateTime:= dm.adsSemLengthExceptions.FieldByName('d_session_end').AsDateTime - 1;
    dm.adsSemLengthExceptions.Post;
    tempDS.Next;
  end;
  tempDS.Close;
  tempDS.Free;
  Result:= true;
end;

function TSheduleAccountController.GetCampusDistance: TObjectList;
var
  tempDS: TADODataSet;
  campusArray: array of integer;
  i, j: integer;
begin
  Result:= TObjectList.Create;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT ik_campus FROM Campus';
  tempDS.Open;
  SetLength(campusArray, tempDS.RecordCount);
  while not tempDS.Eof do
  begin
    campusArray[tempDS.RecNo-1]:= tempDS.FieldByName('ik_campus').AsInteger;
    tempDS.Next;
  end;
  tempDS.Close;
  for i := 0 to Length(campusArray) - 1 do
  begin
    tempDS.CommandText:= 'SELECT Campus_distance.*, CName_campus FROM Campus LEFT JOIN Campus_distance ON Campus.ik_campus = Campus_distance.ik_first_campus WHERE ik_campus = ' + IntToStr(campusArray[i]);
    tempDS.Open;
    if Length(tempDS.FieldByName('CName_campus').AsString) > 2 then
      Result.Add(TCampusDistanceInfo.Create(campusArray[i], tempDS.FieldByName('CName_campus').AsString, Length(campusArray)))
    else Result.Add(TCampusDistanceInfo.Create(campusArray[i], 'Корпус "' +tempDS.FieldByName('CName_campus').AsString + '"', Length(campusArray)));
    for j := 0 to Length(campusArray) - 1 do
      if tempDS.Locate('ik_second_campus', campusArray[j], [loPartialKey]) then
        TCampusDistanceInfo(Result.Items[Result.Count-1]).Distance[j]:= tempDS.FieldByName('distance').AsInteger
      else TCampusDistanceInfo(Result.Items[Result.Count-1]).Distance[j]:= 0;
    tempDS.Close;
  end;
  tempDS.Free;
end;

procedure TSheduleAccountController.GetRoomFund(SourceDataSet: PDataSet; KafIK,
  SheduleIK: integer);
begin
  TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT Room.*, cName_campus, cName_room_type FROM Room INNER JOIN Campus ON Room.ik_campus = Campus.ik_campus INNER JOIN RoomType ON Room.ik_room_type = RoomType.ik_room_type WHERE ik_room in (SELECT ik_room FROM Relation_kafedra_room WHERE (ik_kaf = ' + IntToStr(KafIK) + ') and (ik_shedule = ' + IntToStr(SheduleIK) + ')) ORDER BY cName_campus, Cname_room', 'ik_room', false, NULL);
end;

function TSheduleAccountController.CopyRoomListFromPrevSemester(
  SheduleIK, KafIK: integer): boolean;
var
  tempDS, secTempDS: TADODataSet;
  YearIK, SemIK, CurYearIK, CurSemIK: integer;
begin
  Result:= false;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  secTempDS:= TGeneralController.Instance.GetNewADODataSet(true);
  try
    tempDS.CommandText:= 'SELECT ik_year, ik_sem_type FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK);
    tempDS.Open;
    CurYearIK:= tempDS.FieldByName('ik_year').AsInteger;
    CurSemIK:= tempDS.FieldByName('ik_sem_type').AsInteger;
    tempDS.Close;
    if CurSemIK = 2 then
    begin
      YearIK:= CurYearIK;
      SemIK:= 1;
    end
    else
    begin
      tempDS.CommandText:= 'SELECT ik_year_uch_pl FROM Year_uch_pl WHERE year_value = (SELECT year_value-1 FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(CurYearIK) + ')';
      tempDS.Open;
      YearIK:= tempDS.FieldByName('ik_year_uch_pl').AsInteger;
      SemIK:= 2;
      tempDS.Close;
    end;
    tempDS.CommandText:= 'SELECT * FROM Relation_kafedra_room WHERE (ik_shedule in (SELECT ik_shedule FROM Shedule WHERE (ik_year = ' + IntToStr(YearIK) + ') and (ik_sem_type = ' + IntToStr(SemIK) + '))) and (ik_kaf = ' + IntToStr(KafIK) + ')';
    tempDS.Open;
    secTempDS.CommandText:= 'SELECT * FROM Relation_kafedra_room WHERE (ik_shedule = ' + IntToStr(SheduleIK) + ') and (ik_kaf = ' + IntToStr(KafIK) + ')';
    secTempDS.Open;
    while not tempDS.Eof do
    begin
      if not secTempDS.Locate('ik_room', tempDS.FieldByName('ik_room').AsInteger, [loPartialKey]) then
      begin
        secTempDS.Insert;
        secTempDS.FieldByName('ik_shedule').AsInteger:= SheduleIK;
        secTempDS.FieldByName('ik_kaf').AsInteger:= KafIK;
        secTempDS.FieldByName('ik_room').AsInteger:= tempDS.FieldByName('ik_room').AsInteger;
        secTempDS.Post;
      end;
      tempDS.Next;
    end;
    secTempDS.UpdateBatch();
    Result:= true;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
    if secTempDS.Active then secTempDS.Close;
    secTempDS.Free;
  end;
end;

constructor TSheduleAccountController.Create;
begin
  inherited Create;
  fSemesterLengthInfoStorage:= TObjectList.Create;
end;

function TSheduleAccountController.DeleteRoomsFromRoomFund(SheduleIK: integer; RoomsIK: TStringList): boolean;
var
  tempDS: TADODataSet;
  i: integer;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText:= 'SELECT * FROM Relation_kafedra_room WHERE ik_shedule = ' + IntToStr(SheduleIK);
  tempDS.Open;
  for i := 0 to RoomsIK.Count - 1 do
    if tempDS.Locate('ik_room', StrToInt(RoomsIK[i]), [loPartialKey]) then
      tempDS.Delete;
  tempDS.UpdateBatch();
  tempDS.Close;
  tempDS.Free;
  Result:= true;
end;

destructor TSheduleAccountController.Destroy;
begin
  if Assigned(fSemesterLengthInfoStorage) then
    FreeAndNil(fSemesterLengthInfoStorage);
  inherited;
end;

function TSheduleAccountController.SaveCampusDistance(
  fCampusDistanceInfoList: TObjectList): boolean;
var
  tempDS: TADODataSet;
  i,j: integer;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText:= 'SELECT * FROM Campus_distance';
  tempDS.Open;
  while not tempDS.Eof do
    tempDS.Delete;
  for I := 0 to fCampusDistanceInfoList.Count - 1 do
    for j := 0 to TCampusDistanceInfo(fCampusDistanceInfoList[i]).DistanceCount - 1 do
    if i <> j then    
    begin
      tempDS.Insert;
      tempDS.FieldByName('ik_first_campus').AsInteger:= TCampusDistanceInfo(fCampusDistanceInfoList[i]).CampusIK;
      tempDS.FieldByName('ik_second_campus').AsInteger:= TCampusDistanceInfo(fCampusDistanceInfoList[j]).CampusIK;
      tempDS.FieldByName('distance').AsInteger:= TCampusDistanceInfo(fCampusDistanceInfoList[i]).Distance[j];
      tempDS.Post;
    end;
  tempDS.UpdateBatch();
  tempDS.Close;
  tempDS.Free;
  Result:= true;
end;

function TSheduleAccountController.SaveDepRoomList(KafIK, SheduleIK: integer;
  fAddedRoomsList: TStringList): boolean;
var
  tempDS: TADODataSet;
  i: integer;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText:= 'SELECT * FROM Relation_kafedra_room WHERE (ik_shedule = ' + IntToStr(SheduleIK) + ') and (ik_kaf = ' + IntToStr(KafIK) + ')';
  tempDS.Open;
  while not tempDS.Eof do
    tempDS.Delete;
  for i := 0 to fAddedRoomsList.Count - 1 do
  begin
    tempDS.Insert;
    tempDS.FieldByName('ik_shedule').AsInteger:= SheduleIK;
    tempDS.FieldByName('ik_room').AsString:= fAddedRoomsList[i];
    tempDS.FieldByName('ik_kaf').AsInteger:= KafIK;
    tempDS.Post;
  end;
  tempDS.UpdateBatch();
  tempDS.Close;
  tempDS.Free;
  Result:= true;
end;

function TSheduleAccountController.SaveSemsterLength(SheduleIK, YearIK, SemIK: integer;
  SemStart, SemStop, SessionStart, SessionStop: TDate; WTStart, WTEnd: TTime): boolean;
var
  tempSP: TADOStoredProc;
  tempItem: TDefaultSemLengthInfo;
  tempExcept: TSemLengthInfo;
  i: integer;
begin
try
  tempSP:= TGeneralController.Instance.GetNewADOStoredProc('UpdateSemsterLength', false);
  tempSP.Parameters.CreateParameter('@ik_shedule', ftInteger, pdInput, 0, SheduleIK);
  tempSP.Parameters.CreateParameter('@d_sem_start', ftDateTime, pdInput, 0, SemStart);
  tempSP.Parameters.CreateParameter('@d_sem_end', ftDateTime, pdInput, 0, SemStop);
  tempSP.Parameters.CreateParameter('@d_session_start', ftDateTime, pdInput, 0, SessionStart);
  tempSP.Parameters.CreateParameter('@d_session_end', ftDateTime, pdInput, 0, SessionStop);
  tempSP.Parameters.CreateParameter('@d_work_time_start', ftDateTime, pdInput, 0, WTStart);
  tempSP.Parameters.CreateParameter('@d_work_time_end', ftDateTime, pdInput, 0, WTEnd);
  try
    tempSP.ExecProc;
  finally
    tempSP.Free;
  end;



  dm.adsSemLengthExceptions.First;
  while not dm.adsSemLengthExceptions.Eof do
  begin
  dm.adsSemLengthExceptions.Edit;
  dm.adsSemLengthExceptions.FieldByName('ik_shedule').AsInteger:= SheduleIK;
  dm.adsSemLengthExceptions.Next;
  end;

  dm.adsSemLengthExceptions.EnableControls;

  dm.adsSemLengthExceptions.UpdateBatch();
  tempItem:= SemLengthInfos[SheduleIK];
  if tempItem = nil then
    tempItem:= TDefaultSemLengthInfo(fSemesterLengthInfoStorage[fSemesterLengthInfoStorage.Add(TDefaultSemLengthInfo.Create(SheduleIK, YearIK, SemIK,
        SemStart, SemStop, SessionStart, SessionStop, WTStart, WTEnd))])
  else
    tempItem.UpdateValues(YearIK, SemIK, SemStart, SemStop, SessionStart, SessionStop, WTStart, WTEnd);

  if dm.adsSemLengthExceptions.Active then
  begin
    i:= 0;
    while i <= tempItem.ExceptionCount - 1 do
    begin
      if not dm.adsSemLengthExceptions.Locate('ik_spec_fac; course_number', VarArrayOf([tempItem.ExceptionsByIndex[i].SpecFacultyIK, tempItem.ExceptionsByIndex[i].CourseNumber]), [loPartialKey]) then
        tempItem.DeleteException(i)
      else inc(i);
    end;
    dm.adsSemLengthExceptions.First;
    while not dm.adsSemLengthExceptions.Eof do
    begin
      tempExcept:= tempItem.Exceptions[dm.adsSemLengthExceptions.FieldByName('ik_spec_fac').AsInteger, dm.adsSemLengthExceptions.FieldByName('course_number').AsInteger];
      if tempExcept = nil then
        tempItem.AddException(TSemLengthInfo.Create(YearIK, dm.adsSemLengthExceptions.FieldByName('ik_spec_fac').AsInteger, dm.adsSemLengthExceptions.FieldByName('course_number').AsInteger,
          dm.adsSemLengthExceptions.FieldByName('d_sem_start').Value, dm.adsSemLengthExceptions.FieldByName('d_sem_end').Value,
          dm.adsSemLengthExceptions.FieldByName('d_session_start').Value, dm.adsSemLengthExceptions.FieldByName('d_session_end').Value))
      else tempExcept.UpdateValues(YearIK, dm.adsSemLengthExceptions.FieldByName('d_sem_start').Value, dm.adsSemLengthExceptions.FieldByName('d_sem_end').Value,
          dm.adsSemLengthExceptions.FieldByName('d_session_start').Value, dm.adsSemLengthExceptions.FieldByName('d_session_end').Value);
      dm.adsSemLengthExceptions.Next;
    end;
  end;
  Result:= true;
except
  raise;
end;
end;

end.
