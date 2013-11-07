unit Fgos_Application1Report;

interface

uses
Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf,
ReportsBase, db, adodb, comObj;

const TableBeg = 56;  //начало данных в таблице
      OK = 1;
      PK = 2;
      Spec = 32;
      Spclz = 35;
      Qualif = 38;
      Year = 52;
type
    TFgos_Application1Report= class(TExcelReportBase)
    private
       FDataset:TADODataset;
       dsTitle: TDataset;
    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; ds : TAdoDataset; Title:TDataset);
    end;

    implementation


 constructor TFgos_Application1Report.Create (AOwner : TComponent; ds : TAdoDataset; Title:TDataset);
  begin
  inherited Create(AOwner);
  FDataset := ds;
  dsTitle := Title;
  end;

  procedure TFgos_Application1Report.Execute;
  var
    i, sh,n_lvl1, n_lvl2, sh2 : Integer;
    ShName, Znach, NameLvl, descr_content, tmp: string;
    flag, flag2 :boolean;
  begin
    inherited;

    if FDataset = nil then
     exit;

     if not FDataset.Active then
     begin
     showmessage('Отчет не сформирован!');
     exit;
     end;
     
    FDataset.First;
    flag:=false;
    flag2:=true;
    n_lvl2:=0;
    Range['A'+inttostr(TableBeg),'C'+inttostr(TableBeg+FDataset.RecordCount-1)].HorizontalAlignment:= 2 ;
    Range['A'+inttostr(TableBeg),'C'+inttostr(TableBeg+FDataset.RecordCount-1)].VerticalAlignment:=1;
    Range['B'+inttostr(TableBeg),'C'+inttostr(TableBeg+FDataset.RecordCount-1)].WrapText:=True;
    if (dsTitle <> nil)  then
    begin
    Items[Spec,3]:=dsTitle.FieldByName('Sh_spec').Value+' '+  dsTitle.FieldByName('Cname_spec').Value;
    Items[Spclz,3]:=dsTitle.FieldByName('cName_spclz').Value;
    Items[Qualif,3]:= dsTitle.FieldByName('Cname_qualif').Value;
    Items[Year,1]:= CurrentYear();
    end else ShowMessage('Титульный лист не заполнен!');

    for i := 0 to FDataset.RecordCount-1 do
    begin
    if flag2 then
      begin
      sh:= TableBeg+i;
      n_lvl1:=TableBeg+i;
      end;
      flag2:=false;
      //Range['A'+inttostr(TableBeg+i+1),'L'+inttostr(TableBeg+i+1)].NumberFormat := '@';
      ShName:= FDataset.FieldByName('short_Name').Value; 
      Znach:= FDataset.FieldByName('zhach_competence').Value;
      NameLvl:= FDataset.FieldByName('name_level_competence').AsString;
      descr_content:= FDataset.FieldByName('description_content').AsString;
       if flag then
       begin
          if (NameLvl=tmp)and (ShName=Items[TableBeg+i-1,1].Text) then
          Items[TableBeg+i,3] := '-'+FDataset.FieldByName('description_content').Value+';'
          else Items[TableBeg+i,3] := NameLvl + ': '#10+ '-'+FDataset.FieldByName('description_content').Value+';';

          if (ShName=Items[TableBeg+i-1,1].Text)and (i<>FDataset.RecordCount-1)
            then sh2:=TableBeg+i
            else
            begin
              if (sh2-sh<1) then sh:=TableBeg+i else
              begin
                if (i=FDataset.RecordCount-1) then sh2:=TableBeg+i;
                Range['A'+inttostr(sh+1),'A'+inttostr(sh2)].Clear;
                Range['A'+inttostr(sh),'A'+inttostr(sh2)].MergeCells:=True;
                Range['B'+inttostr(sh+1),'B'+inttostr(sh2)].Clear;
                Range['B'+inttostr(sh),'B'+inttostr(sh2)].MergeCells:=True;
                Range['C'+inttostr(sh),'C'+intToStr(sh2)].Borders[xlEdgeTop].LineStyle:=1;
                Range['C'+inttostr(sh),'C'+intToStr(sh2)].Borders[xlEdgeBottom].LineStyle:=1;
                Range['C'+inttostr(sh),'C'+intToStr(sh2)].Borders[xlEdgeLeft].LineStyle:=1;
                Range['C'+inttostr(sh),'C'+intToStr(sh2)].Borders[xlEdgeRight].LineStyle:=1;
                sh:= TableBeg+i;
                sh2:=sh+1;
              end;
            end;
       end
       else  Items[TableBeg+i,3] := NameLvl + ': '#10+ '-'+FDataset.FieldByName('description_content').Value+';';

      Items[TableBeg+i,1] := ShName;
      Items[TableBeg+i,2] := Znach;
      tmp:= NameLvl;
      FDataset.Next;
      flag:=true;
    end;
    Range['A'+inttostr(TableBeg),'B'+intToStr(TableBeg+FDataset.RecordCount-1)].Borders.Weight:=2;
    Range['C'+inttostr(TableBeg),'C'+intToStr(TableBeg+FDataset.RecordCount-1)].Borders[xlEdgeRight].LineStyle:=1;
  end;

  //Определим общее число шагов в создании рапорта
  //Реальное число шагов скорее всего будет равно количеству
  //записей, возвращённых запросом для отчёта
  //Example: Result := MyDataSet.Recordscount;
  function TFgos_Application1Report.GetTotalSteps: Integer;
  begin
    Result := FDataset.RecordCount;
  end;

end.
