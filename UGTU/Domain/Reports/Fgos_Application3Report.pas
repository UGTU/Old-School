unit Fgos_Application3Report;

interface

uses
Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf,
ReportsBase, db, adodb, comObj,  uFgosController;

const TableBeg = 6;  //начало данных в таблице
      OK = 1;
      PK = 2;
      Spec = 16;
      Spclz = 19;
      Qualif = 22;
      Year = 36;
type
    TFgos_Application3Report= class(TExcelReportBase)
    private
       dsTitle: TDataset;
       dsDataDisc: TDataset;
       IKPlan:integer;
       IDGos: integer;
       dsDiscBasedOn:TDataset;
       dsDiscMainStayFor: TDataset;
       dsCompForDiscUchPlan: TDataset;
    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent;  Title, dsDisc:TDataset; IKUchPlan,Gos: integer);
    end;

    implementation

 constructor TFgos_Application3Report.Create (AOwner : TComponent; Title,dsDisc:TDataset; IKUchPlan,Gos: integer);
  begin
  inherited Create(AOwner);
  dsDataDisc:= dsDisc;
  dsTitle := Title;
  IKPlan:= IKUchPlan;
  IDGos:= Gos;
  end;

  procedure TFgos_Application3Report.Execute;
  var
    i,j, ik_disc_uch_plan: Integer;
    strDiscBasedOn, strDiscMainStayFor, CompForDisc: string;
  begin
    inherited;
    if (dsDataDisc = nil) and (dsTitle = nil) then
     exit;

     if (not dsDataDisc.Active) and (not dsTitle.Active) then
     begin
     showmessage('Отчет не сформирован!');
     exit;
     end;

     self.ActivateWorksheet(1);
     if (dsTitle <> nil)  then
    begin
    Items[Spec,3]:=dsTitle.FieldByName('Sh_spec').Value+' '+  dsTitle.FieldByName('Cname_spec').Value;
    Items[Spclz,3]:=dsTitle.FieldByName('cName_spclz').Value;
    Items[Qualif,3]:= dsTitle.FieldByName('Cname_qualif').Value;
    Items[Year,1]:= CurrentYear();
    end else ShowMessage('Титульный лист не заполнен!');

    self.ActivateWorksheet(2);

    dsDataDisc.First;
    // под свой отчет организовать
    for i := 0 to dsDataDisc.RecordCount-1 do
    begin
      Items[TableBeg+i,1] := dsDataDisc.FieldByName('cname_ckl_disc1').Value;
      Items[TableBeg+i,2] := dsDataDisc.FieldByName('cname_disc').Value;

      ik_disc_uch_plan:=dsDataDisc.FieldByName('ik_disc_uch_plan').Value;

      dsDiscBasedOn:=TFgosController.Instance.getDiscBasedOn(ik_disc_uch_plan);
      dsDiscMainStayFor:=TFgosController.Instance.getDiscMainStayFor(ik_disc_uch_plan);
      dsCompForDiscUchPlan:=TFgosController.Instance.getCompetenceForDiscUchPlan(ik_disc_uch_plan,
      IKPlan,IDGos);

      if (not dsDiscBasedOn.Active) and (not dsDiscMainStayFor.Active)and
      (not dsCompForDiscUchPlan.Active) then
      begin
      showmessage('Отчет не сформирован!');
      exit;
      end;

      dsDiscBasedOn.First;
      strDiscBasedOn:='';
      for j := 0 to dsDiscBasedOn.RecordCount - 1 do
      begin
      strDiscBasedOn:=strDiscBasedOn+ dsDiscBasedOn.FieldByName('cname_ckl_disc1').Value;
      if j<>dsDiscBasedOn.RecordCount - 1 then strDiscBasedOn:=strDiscBasedOn+',' else strDiscBasedOn:=strDiscBasedOn+'.';
      dsDiscBasedOn.Next;
      end;
      Items[TableBeg+i,4]:= strDiscBasedOn;

      dsDiscMainStayFor.First;
      strDiscMainStayFor:='';
      for j := 0 to dsDiscMainStayFor.RecordCount - 1 do
      begin
      strDiscMainStayFor:=strDiscMainStayFor+ dsDiscMainStayFor.FieldByName('cname_ckl_disc1').Value;
      if j<>dsDiscMainStayFor.RecordCount - 1 then strDiscMainStayFor:=strDiscMainStayFor+ ',' else strDiscMainStayFor:=strDiscMainStayFor+ '.';
      dsDiscMainStayFor.Next;
      end;
      Items[TableBeg+i,5]:= strDiscMainStayFor;

      dsCompForDiscUchPlan.First;
      CompForDisc:='';
      for j := 0 to dsCompForDiscUchPlan.RecordCount - 1 do
      begin
      CompForDisc:=CompForDisc + dsCompForDiscUchPlan.FieldByName('short_Name').Value;
      if j<>dsCompForDiscUchPlan.RecordCount - 1 then CompForDisc:=CompForDisc + ',' else CompForDisc:=CompForDisc + '.';
      dsCompForDiscUchPlan.Next;
      end;
      Items[TableBeg+i,6]:= CompForDisc;
      dsDataDisc.Next;
    end;
      Range['A'+inttostr(TableBeg),'F'+intToStr(TableBeg+dsDataDisc.RecordCount)].Borders.Weight:=2;
  end;


  //Определим общее число шагов в создании рапорта
  //Реальное число шагов скорее всего будет равно количеству
  //записей, возвращённых запросом для отчёта
  //Example: Result := MyDataSet.Recordscount;
  function TFgos_Application3Report.GetTotalSteps: Integer;
  begin
    Result := dsDataDisc.RecordCount;
  end;
end.

