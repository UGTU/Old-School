unit SpravkaReport2014;

interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls, Spravka2014, uDM, SpravkaHistory2014;

type
  TSpravka_Report = class
  private
    // ikStudGrup, type_spr,numspr: integer;
    Fik_destination, Fik_doc: integer;
  protected

  public
    // constructor Create(_ikStudGrup, _type_spr,_num: integer);
    function AddReport(): TSpravka;
    destructor Destroy; override;
    property ik_doc: integer read Fik_doc;
    property ik_destination: integer read Fik_destination;

    constructor Create(_ik_destination, _ik_doc: integer);
  end;

implementation

{ TBRS2014Report }

constructor TSpravka_Report.Create(_ik_destination, _ik_doc: integer);
begin
  // ikStudGrup := _ikStudGrup;
  // type_spr := _type_spr;
  // numspr:= _num ;
  Fik_doc := _ik_doc;
  Fik_destination := _ik_destination;
end;

function TSpravka_Report.AddReport(): TSpravka;
var

  spr_h: TSpravkaHistory;
  sp_spr: TADOStoredProc;

  sp_academ: TADODataSet;
  sp_doc, sp_history: TADOStoredProc;
begin
  sp_spr := TADOStoredProc.Create(nil);
  sp_history := TADOStoredProc.Create(nil);;
  sp_academ := TADODataSet.Create(nil);
  sp_doc := TADOStoredProc.Create(nil);
  try
    // sp_spr.ProcedureName := 'StudGetInfForSprav;1';
    sp_spr.ProcedureName := 'StudInfoSpravBuild;1';
    sp_spr.Connection := dm.DBConnect;
    // sp_spr.Parameters.CreateParameter('@Ik_studGrup', ftString, pdInput, 50,
    // self.ikStudGrup);
    sp_spr.Parameters.CreateParameter('@Ik_document', ftString, pdInput, 50,
      self.ik_doc);
    sp_spr.Open;
    sp_spr.First;
    sp_history.ProcedureName := 'StudHistForSpr;1';
    sp_history.Connection := dm.DBConnect;
    // sp_spr.Parameters.CreateParameter('@Ik_studGrup', ftString, pdInput, 50,
    // self.ikStudGrup);
    sp_history.Parameters.CreateParameter('@Ik_document', ftString, pdInput, 50,
      self.ik_doc);
    sp_history.Open;
    sp_history.First;

    // sp_history.CommandText := 'select * from StudHistory(' +
    // self.ikStudGrup.ToString() + ')';

    // sp_history.Connection := dm.DBConnect;
    // sp_history.Open;
    // sp_history.First;

    sp_doc.ProcedureName := 'DocInfoSpravBuild;1';
    sp_doc.Connection := dm.DBConnect;
    sp_doc.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
      50, ik_doc);
    sp_doc.Open;
    sp_doc.First;
    Result := TSpravka.Create(sp_spr.FieldByName('FIOrod').AsString,
      sp_spr.FieldByName('Podgot').AsString, sp_spr.FieldByName('Cname_spec')
      .AsString, sp_spr.FieldByName('Cshort_spec').AsString,
      sp_spr.FieldByName('ManagerSmallName').AsString,
      sp_spr.FieldByName('Cname_form_pril').AsString,
      sp_spr.FieldByName('Cname_fac_rod_pad').AsString,
      sp_spr.FieldByName('DepPhoneNumber').AsString,
      sp_spr.FieldByName('YearPricZach').AsString, sp_spr.FieldByName('kurs')
      .AsInteger, self.ik_destination, sp_spr.FieldByName('YearGrupEnd')
      .AsString, sp_spr.FieldByName('sprDate').AsString,
      sp_spr.FieldByName('sprMonth').AsString, sp_spr.FieldByName('sprYear')
      .AsString, sp_spr.FieldByName('studBirthYear').AsString,
      sp_spr.FieldByName('Dep_Index').AsString, sp_doc.FieldByName('NumberDoc')
      .AsInteger);
    sp_spr.First;

    While not sp_history.Eof do
    begin
      if (sp_history.FieldByName('ikTypePric').AsInteger = 4) then
      begin
        sp_academ.CommandText := 'select * from StudHistoryAcadem (' + '''' +
          sp_history.FieldByName('Nn_prikaz').AsString + '''' + ',' +
          sp_spr.FieldByName('Ik_zach').AsString + ')';
        sp_academ.Connection := dm.DBConnect;
        sp_academ.Open;
        sp_academ.First;

        spr_h := TSpravkaHistory.Create(sp_history.FieldByName('Nn_prikaz')
          .AsString, sp_history.FieldByName('Cname_pric').AsString,
          sp_history.FieldByName('daypric').AsString,
          sp_history.FieldByName('monthpric').AsString,
          sp_history.FieldByName('yearpric').AsString,
          sp_history.FieldByName('ikTypePric').AsInteger,
          sp_academ.FieldByName('dateBegin').AsString,
          sp_academ.FieldByName('dateEnd').AsString);
        sp_academ.Free;
      end
      else
        spr_h := TSpravkaHistory.Create(sp_history.FieldByName('Nn_prikaz')
          .AsString, sp_history.FieldByName('Cname_pric').AsString,
          sp_history.FieldByName('daypric').AsString,
          sp_history.FieldByName('monthpric').AsString,
          sp_history.FieldByName('yearpric').AsString,
          sp_history.FieldByName('ikTypePric').AsInteger, '', '');
      sp_history.Next;
      Result.Historyes.Add(spr_h);
    end;

  finally
    sp_spr.Free;
    sp_history.Free;
    sp_doc.Free;
  end;

end;

destructor TSpravka_Report.Destroy;
begin

  inherited;
end;

end.
