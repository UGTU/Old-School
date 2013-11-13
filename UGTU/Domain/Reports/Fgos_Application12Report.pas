unit Fgos_Application12Report;

interface

uses
Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf,
ReportsBase, db, adodb, comObj;

const
      BegDisc = 2;  //изменяется номер столбца
      BegCmptnc = 4;
      OK = 1;
      PK = 2;
      Spec = 31;
      Spclz = 34;
      Qualif = 37;
      Year = 51;
type
    TFgos_Application12Report= class(TExcelReportBase)
    private
       Fds_disc:TDataset;
       Fds_comp:TDataset;
       Fds_comp_disc: TDataset;
       dsTitle: TDataset;
    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
       function NameCol(const N:Integer):String;
       function mchar(const m:Integer):char;
    public
       constructor Create (AOwner : TComponent; Title, dsCompAll ,dsDiscAll, dsComp_Disc : TDataset);
    end;

    implementation

 constructor TFgos_Application12Report.Create (AOwner : TComponent; Title, dsCompAll, dsDiscAll, dsComp_Disc: TDataset);
  begin
  inherited Create(AOwner);
  Fds_disc := dsDiscAll;
  Fds_comp:= dsCompAll;
  Fds_comp_disc:= dsComp_Disc;
  dsTitle:= Title;
  end;

  procedure TFgos_Application12Report.Execute;
  var
    i,j,k, row, col, ik_comp, ik_disc : Integer;
    Cell_1, Cell_2: ExcelRange;
  begin
    inherited;
    if (Fds_disc = nil) and (Fds_comp = nil) then
     exit;

     if (not Fds_disc.Active) and (not Fds_comp.Active) and (not Fds_comp_disc.Active) then
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
     Fds_disc.First;
    for i := 0 to Fds_disc.RecordCount-1 do
    begin
      Items[BegCmptnc-2,BegDisc+i]:=Fds_disc.FieldByName('cName_disc').Value;
      Items[BegCmptnc-1,BegDisc+i]:=i+2;
      Fds_disc.Next;
    end;

    row:= BegCmptnc;
    col:= BegDisc;

    Fds_comp.First;
    for I := 0 to Fds_comp.RecordCount - 1 do
    begin
      ik_comp:=Fds_comp.FieldByName('ik_competence').Value;
      Items[BegCmptnc+i,1]:=Fds_comp.FieldByName('short_Name').Value;

      Fds_disc.First;
      for j := 0 to Fds_disc.RecordCount-1 do
        begin
          Fds_comp_disc.First;
          for k := 0 to Fds_comp_disc.RecordCount-1 do
          begin
            if (Fds_comp_disc.FieldByName('ik_competence').Value=ik_comp)
            and (Fds_comp_disc.FieldByName('ik_disc_uch_plan').Value=Fds_disc.FieldByName('ik_disc_uch_plan').Value)
            then Items[row,col]:='+';
            Fds_comp_disc.Next;
          end;
          col:=col+1;
        Fds_disc.Next;
        end;
      Fds_comp.Next;
      row:=row+1;
      col:=BegDisc;
    end;  

      Range['A2',NameCol(Fds_disc.RecordCount+1)+inttostr(Fds_comp.RecordCount+BegCmptnc-1)].Borders.Weight:=2;
  end;


  //Определим общее число шагов в создании рапорта
  //Реальное число шагов скорее всего будет равно количеству
  //записей, возвращённых запросом для отчёта
  function TFgos_Application12Report.GetTotalSteps: Integer;
  begin
    Result := Fds_disc.RecordCount;
  end;


function TFgos_Application12Report.mchar(const m:Integer):char;
 var i:Integer;
 begin
   i:=m+64;
   mchar:=Chr(i);
 end;

 function TFgos_Application12Report.NameCol(const N:Integer):String;
var Value:Integer;
begin
  if (N < 1) and (N>702) then Exit;
  Result:='';   Value:=N;
  if Value<=26 then
      begin
         Result:=mchar(Value);
         Exit;
      end;
 
  if Value mod 26 = 0 then
      begin
        Dec(Value);
        Result:=mchar(Value div 26)+'Z';
        exit;
      end;
 
  Result:=mchar(Value div 26)+
          mchar(Value mod 26);
end;

end.

