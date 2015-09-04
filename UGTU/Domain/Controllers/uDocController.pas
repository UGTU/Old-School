unit uDocController;

{ #Author villain@ist.ugtu.net }
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  uDMUgtuStructure,
  Forms, Dialogs, DBLookupEh, Variants, GeneralController, ExcelXP, ComObj,
  ComCtrls, Math,
  ConstantRepository, DiscClasses,ExceptionBase,ReportsBase,uDMDocuments,uPrintMagazine;

type

  TDocController = class(TObject)
  private
  protected
  constructor CreateInstance;
  public
    constructor Create;
    destructor Destroy;
    class function Instance: TDocController;
    function CalculationLastNum(ik_Grup: Integer; ik_dest: Integer)
      : Integer;
    function CalculationDepIndex(ik_Grup: Integer): string;
    function CalculationBeginYearLern(): string;
    function BuildSpr(datebegin,dateend:string): TReportBase;
    class function AccessInstance(Request: Integer):TDocController;
  end;

implementation
var
FDocControllerInstance: TDocController = nil;

{ TDocController }
class function TDocController.Instance: TDocController;
begin
  Result := AccessInstance(1);
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

function TDocController.BuildSpr(datebegin,dateend:string): TReportBase;
begin
        Result := PrintMagazine.Create(datebegin,dateend);
        Result.ReportTemplate := ExtractFilePath(Application.ExeName) +
          'reports\PrintMagazine.xlt';


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
  ik_dest: Integer): Integer;
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
      CalculationDepIndex(ik_Grup) + ''',' + ik_dest.ToString() + ')';
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
