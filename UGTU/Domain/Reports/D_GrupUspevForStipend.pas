unit D_GrupUspevForStipend;
{#Author sofo@ist.ugtu.net}
interface

uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB, Variants;

type
   TGrupUspevForStipend = class(TExcelReportBase)
  private
    FDataSet: TADODataSet;
    FConnection:TADOConnection;
    FikFac: integer;  //код факультета
    FikGrup:integer;  //код группы
    FnSem:integer;    //номер семестра

  protected
    procedure Execute;override;
  public
    property DataSet:TADODataSet read FDataSet write FDataSet;
    property Connection:TADOConnection read fConnection write fConnection;
    property ikFac:integer read FikFac write FikFac;
    property ikGrup:integer read FikGrup write FikGrup;
    property nSem:integer read FnSem write FnSem;
  end;

implementation

uses uDMUspevaemost, uDMUgtuStructure, uBaseDialog;

procedure TGrupUspevForStipend.Execute;
var i, kurs, year_uch_pl :integer;
fac_name, short_fac, grup_name, session, begin_session, end_session:string;
tempStoredProc: TADOStoredProc;
begin

  dmUgtuStructure.adoqFac.Open;
  if dmUgtuStructure.adoqFac.Locate('ik_fac',ikfac,[loCaseInsensitive]) then
	  begin
		 fac_name:=dmUgtuStructure.adoqFac.FieldByName('cname_fac').AsString;
     short_fac:=dmUgtuStructure.adoqFac.FieldByName('cShort_name_fac').AsString;
	  end;

  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= Connection;
  tempStoredProc.ProcedureName:= 'GetSessionPeriod';
  begin
    tempStoredProc.Parameters.CreateParameter('@ik_grup', ftInteger, pdInput, 0, ikGrup);
    tempStoredProc.Parameters.CreateParameter('@n_sem', ftInteger, pdInput, 0, nsem);
  end;
  try
    tempStoredProc.open;
    tempStoredProc.First;
    if tempStoredProc.FieldByName('ik_sem_type').Value=1 then
      session:='зимней'
    else
      session:='летней';
    if tempStoredProc.FieldByName('begin_session').Value <> NULL then
      begin_session:= tempStoredProc.FieldByName('begin_session').Value;
    if tempStoredProc.FieldByName('end_session').Value <> NULL then
      end_session:= tempStoredProc.FieldByName('end_session').Value;
    year_uch_pl:= tempStoredProc.FieldByName('year_value').Value;
    tempStoredProc.Free;
  except
    tempStoredProc.Free;
    raise;
  end;

  Items[3,1] := 'заседания стипендиальной комиссии '+short_fac+', утвержденный приказом';

  kurs:= (nsem+1) div 2;

  dmUgtuStructure.adodsGroupsofspec.Open;
  if dmUgtuStructure.adodsGroupsofspec.Locate('ik_grup',ikGrup,[loCaseInsensitive]) then
	  begin
		 grup_name:=dmUgtuStructure.adodsGroupsofspec.FieldByName('cname_grup').AsString;
    end;

  Items[9,2] := 'Слушали: О назначении стипендии студентам ' + short_fac +
  ' курс '+ inttostr(kurs)+ ' группы ' + grup_name + ' по результатам '
  + session+ ' экзаменационной сессии';

  Items[10,2] := inttostr(year_uch_pl)+'/'+inttostr(year_uch_pl+1)+' учебного года, проходившей с ' + begin_session +
  ' по ' + end_session;


  DMUspevaemost.adodsUspevForStipend.Close;
  with DMUspevaemost.adodsUspevForStipend.Parameters do
    begin
      Clear;
      CreateParameter('@ik_grup', ftInteger, pdInput, 4,ikGrup);
      CreateParameter('@sem', ftInteger, pdInput, 4, nSem);
    end;
    DMUspevaemost.adodsUspevForStipend.Open;

  DataSet:= TADODataSet(DMUspevaemost.adodsUspevForStipend);
  if not FDataSet.Active then
    exit;
  i:=13;

  try

    FDataSet.First;
	  while not FDataSet.Eof do

    begin
     Range['A'+intToStr(i),'N'+intToStr(i)].Copy(Range['A'+intToStr(i+1),'N'+intToStr(i+1)]);

     Items[i,1] := '  '+ inttostr(i-12);
		 Items[i,2] := FDataSet.FieldByName('studname').AsString;
		 if (FDataSet.FieldByName('katzach').value<>'Общий конкурс') then
       Items[i,3] := FDataSet.FieldByName('katzach').AsString;
		 Items[i,4] := FDataSet.FieldByName('pyt').AsString;
		 Items[i,5] := FDataSet.FieldByName('chet').AsString;
		 Items[i,6] := FDataSet.FieldByName('tri').AsString;
		 Items[i,7] := FDataSet.FieldByName('dva').AsString;

     if FDataSet.FieldByName('kolvo_disc').asinteger=
      FDataSet.FieldByName('pyt').asinteger+FDataSet.FieldByName('chet').asinteger+
      FDataSet.FieldByName('tri').asinteger+FDataSet.FieldByName('dva').asinteger then

     if (FDataSet.FieldByName('tri').asinteger=0)
     and (FDataSet.FieldByName('dva').asinteger=0) then
       Items[i,13] := 'назначить'
     else
       Items[i,13] := 'отказано';

     if (FDataSet.FieldByName('typzach').value=3) then
       Items[i,13] := 'отказано';

     if (FDataSet.FieldByName('typepric').value=2) then
       begin
       Range['D11','G11'].Copy(Range['D'+intToStr(i),'G'+intToStr(i)]);
       Items[i,4] := 'Акад./отпуск';
       end;

     if (FDataSet.FieldByName('typepric').value=4) then
       begin
       Range['D11','G11'].Copy(Range['D'+intToStr(i),'G'+intToStr(i)]);
       Items[i,4] := 'Отчислен';
       end;

		 Inc(i);
		 FDataSet.Next;
	  end;

    Range['A'+intToStr(i+1),'N'+intToStr(i+1)].Copy(Range['A'+intToStr(i),'N'+intToStr(i)]);

    Range['B6','B8'].Copy(Range['B'+intToStr(i+1),'B'+intToStr(i+1)]);

    Items[i+1,11] := 'Члены комиссии:';
    Items[i+2,11] := '________________________________';
    Items[i+3,11] := '________________________________';

  finally

  end;

end;

end.
