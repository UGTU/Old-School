unit uDocController;

{ #Author villain@ist.ugtu.net }
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  uDMUgtuStructure,
  Forms, Dialogs, DBLookupEh, Variants, GeneralController, ExcelXP, ComObj,
  ComCtrls, Math,
  ConstantRepository, DiscClasses,ExceptionBase,ReportsBase,uDMDocuments,uPrintMagazine,
  Destination,  uReviewDoc, uCallSpr, uApplicationSpr, uAkademSpr, uDebtSpr, uNotification,
  uExtractSpr, uWaitingController,
  uReviewCallSpr, uReviewApplication, uReviewAkadem,
  uReviewNotify, Document, Spravka, SpravkaReport2014, Spravka2014,
  System.Generics.Collections;

type

  TDocController = class(TObject)
  private
  protected
  constructor CreateInstance;
  public
    constructor Create;
    destructor Destroy;
    class function Instance: TDocController;
    function CalculationLastNum(ik_Grup: Integer; ik_dest, ik_formEd: Integer)
      : Integer;
    function CalculationDepIndex(ik_Grup: Integer): string;
    function CalculationBeginYearLern(): string;
    function BuildSpr(datebegin,dateend:string): TReportBase;
    class function AccessInstance(Request: Integer):TDocController;
    function BuildSprReport(Dest: TDest): TReportBase;
    function AddListDest(ListDist: TObjectList<TDest>; ik_dest, ik_doc: Integer)
      : TObjectList<TDest>;

    procedure PrintAllDoc(ListDist: TObjectList<TDest>);
  end;

implementation
var
FDocControllerInstance: TDocController = nil;

{ TDocController }
class function TDocController.Instance: TDocController;
begin
  Result := AccessInstance(1);
end;

procedure TDocController.PrintAllDoc(ListDist: TObjectList<TDest>);
var
  report: TReportBase;
  i: Integer;
begin
  for i := 0 to ListDist.Count - 1 do
  begin
    Report:=TDocController.Instance.BuildSprReport(ListDist[i]);
    TWaitingController.GetInstance.Process(Report);

  end;
end;

class function TDocController.AccessInstance(Request: Integer): TDocController;
begin
  case Request of
    0:
      ;
    1:
      if not Assigned(FDocControllerInstance) then
        FDocControllerInstance := CreateInstance;
    2:
      if FDocControllerInstance <> nil then
      begin
        FDocControllerInstance.Free;
        FDocControllerInstance := nil;
      end;
  else
    raise EApplicationException.Create('Ошибка в программе!',
      Exception.CreateFmt('Произошла ошибка в контроллере Успеваемости',
      [Request]));
  end;
  Result := FDocControllerInstance;
end;


constructor TDocController.CreateInstance;
begin
  inherited Create;
end;



function TDocController.AddListDest(ListDist: TObjectList<TDest>; ik_dest,
  ik_doc: Integer): TObjectList<TDest>;
var
  Dest: TDest;
  doc: TDopDoc;
  ind, j: Integer;
begin
  ind := -1;
  if (ik_dest > 0) and (ik_doc > 0) then
  begin
    for j := 0 to ListDist.Count - 1 do
      if ListDist[j].ik_dest = ik_dest then
        ind := j;
    if ind < 0 then
    begin
      Dest := TDest.Create(ik_dest);
      ListDist.Add(Dest);
      ind := ListDist.Count - 1;
    end;
    doc := TDopDoc.Create(ik_doc);
    ListDist[ind].ListDoc.Add(doc);
  end;
  Result := ListDist;

end;

function TDocController.BuildSpr(datebegin,dateend:string): TReportBase;
begin
        Result := PrintMagazine.Create(datebegin,dateend);
        Result.ReportTemplate := ExtractFilePath(Application.ExeName) +
          'reports\PrintMagazine.xlt';
end;

function TDocController.BuildSprReport(Dest: TDest): TReportBase;
var
  ik_doc, ik_destination, i: Integer;
  report: TSpravka_Report;
  result_report: TSpravka;
  FindRange: variant;
  ListSpr: TObjectList<TSpravka>;
begin
  try
  ListSpr:=TObjectList<TSpravka>.Create;
  case (Dest.ik_dest) of
    1:
      begin
      for  i  := 0 to Dest.ListDoc.Count-1 do
       begin
        report := TSpravka_Report.Create(Dest.ik_dest, Dest.ListDoc[i].ik_doc);
        result_report := report.AddReport();
        ListSpr.Add(result_report);
       end;
       Result := SpravkaReport.Create(ListSpr);
       Result.ReportTemplate := ExtractFilePath(Application.ExeName) +
          'reports\Sprv.xlt';
      end;

    2:
      begin
      for  i  := 0 to Dest.ListDoc.Count-1 do
       begin
        report := TSpravka_Report.Create(Dest.ik_dest, Dest.ListDoc[i].ik_doc);
         result_report := report.AddReport();
        ListSpr.Add(result_report);
       end;
         Result := SpravkaReport.Create(ListSpr);
        Result.ReportTemplate := ExtractFilePath(Application.ExeName) +
          'reports\SprvPens.xlt';

      end;

    3:
      begin
        Result := CallSprReport.Create(Dest.ListDoc);

        Result.ReportTemplate := ExtractFilePath(Application.ExeName) +
          'reports\SprСhallenge.xlt';

      end;

    4:
      begin
        Result := ApplSprReport.Create(Dest.ListDoc);
        Result.ReportTemplate := ExtractFilePath(Application.ExeName) +
          'reports\SprApplication.xlt';
      end;
    5:
      begin
        Result := NotificationSprReport.Create(Dest.ListDoc);
        Result.ReportTemplate := ExtractFilePath(Application.ExeName) +
          'reports\SprNotification.xlt';
      end;
    6:
      begin
        Result := DebtSprReport.Create(Dest.ListDoc);
        Result.ReportTemplate := ExtractFilePath(Application.ExeName) +
          'reports\SprDebt.xlt';
      end;

    8:
      begin
        Result := AkademSprReport.Create(Dest.ListDoc);
        Result.ReportTemplate := ExtractFilePath(Application.ExeName) +
          'reports\Akadem_spr.xlt';
      end;
    9:
      begin
        Result := ExtractSprReport.Create(Dest.ListDoc);
        Result.ReportTemplate := ExtractFilePath(Application.ExeName) +
          'reports\SprExtract.xlt';
      end;
  end;
 finally
 end;
end;

function TDocController.CalculationBeginYearLern: string;
var
  datebegin: string;
  AYear, AMonth, ADay: word;
begin
  DecodeDate(Now, AYear, AMonth, ADay);
  if date() > StrToDateTime('01.09.' + AYear.ToString()) then
    datebegin := '01.09.' + AYear.ToString()
  else
    datebegin := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
  result := datebegin;
end;

function TDocController.CalculationDepIndex(ik_Grup: Integer): string;
var
  sp_depInd: TADODataSet;

begin
  inherited;
  sp_depInd := TADODataSet.Create(nil);

  try
    // берем индекс подразделения
    sp_depInd.CommandText := 'select * from DepIndDoc(' +
      ik_Grup.ToString() + ')';
    sp_depInd.Connection := dm.DBConnect;
    sp_depInd.Open;
    result := sp_depInd.FieldByName('Dep_Index').AsString;
  finally
    sp_depInd.Free;
  end;

end;

function TDocController.CalculationLastNum(ik_Grup,
  ik_dest, ik_formEd: Integer): Integer;
var
  AYear, AMonth, ADay: word;
  dateb: string;
  sp_info: TADOStoredProc;
  sp_num: TADODataSet;

begin
  inherited;
  sp_num := TADODataSet.Create(nil);
  try
    DecodeDate(Now, AYear, AMonth, ADay);
    if date() > StrToDateTime('01.09.' + AYear.ToString()) then
      dateb := '01.09.' + AYear.ToString()
    else
      dateb := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
    sp_num.CommandText := 'select * from MaxNumDocument(''' + dateb + '''' + ','
      + '''' + DateTimeToStr(date()) + '''' + ',' + '''' +
      CalculationDepIndex(ik_Grup) + ''',' + ik_dest.ToString() + ',' + ik_formEd.ToString()+ ')';
    sp_num.Connection := dm.DBConnect;
    sp_num.Open;
    sp_num.First;
    result := sp_num.FieldByName('MaxNum').AsInteger + 1;
  finally
    sp_num.Free;
  end;
end;


constructor TDocController.Create;
begin

end;

destructor TDocController.Destroy;
begin

end;

end.
