unit Fgos_Application2Report;

interface

uses
Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf,
ReportsBase, db, adodb, comObj, GeneralController;

const
TableBeg1 = 57;  //начало данных в таблице на листе 1
TableBeg3 = 8;   //начало данных в таблице на листе 2
//данные для титульника
Spec = 33;
Spclz = 36;
Qualif = 39;
Year = 52;
ok = 1;
pk = 2;
type
    TFgos_Application2Report= class(TExcelReportBase)
    private

       FDS_sformyr:TDataset;
       FDS_DiscCmpt:TDataset;
       FDS_Struct:TDataset;
       dsTitle: TDataset;
       my_type: integer;
       competence: integer;
       sh_name: string;
       znach_competence: string;
    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; dsSformyr, dsDiscCmpt, dsStruct : TDataset; Title:TDataset;ik_type,ik_comp:integer; short_name, znach:string);
    end;

    implementation


 constructor TFgos_Application2Report.Create (AOwner : TComponent; dsSformyr,dsDiscCmpt,dsStruct : TDataset; Title:TDataset;
                                              ik_type,ik_comp:integer; short_name, znach:string);
  begin
  inherited Create(AOwner);
  FDS_sformyr:=dsSformyr;
  FDS_DiscCmpt:=dsDiscCmpt;
  FDS_Struct:=dsStruct;
  dsTitle:=Title;
  my_type:=ik_type;
  competence:= ik_comp;
  sh_name:=short_name;
  znach_competence:= znach;
  end;

  procedure TFgos_Application2Report.Execute;
  var
    i,j, type1, type2, lvl1, lvl2, ik_lvl_cmpt,tmp : Integer;
    flag, flag2, flag3 :boolean;
    name_type, desc, priznak: string;
    desc_cont, semestr: TDataset;
  begin
    inherited;
    if (FDS_sformyr= nil) and (FDS_DiscCmpt= nil) and (FDS_Struct= nil) then
     exit;

     if not (FDS_sformyr.Active and FDS_DiscCmpt.Active and FDS_Struct.Active) then
     begin
     showmessage('Отчет не сформирован!');
     exit;
     end;
    self.ActivateWorksheet(1);
    if (dsTitle <> nil)  then
    begin
    Items[Spec,3]:= dsTitle.FieldByName('Sh_spec').Value+' '+  dsTitle.FieldByName('Cname_spec').Value;
    Items[Spclz,3]:= dsTitle.FieldByName('cName_spclz').Value;
    Items[Qualif,3]:= dsTitle.FieldByName('Cname_qualif').Value;
    Items[Year,1]:= CurrentYear();
    if my_type = ok then Items[21,2]:=' общекультурной' else  Items[21,2]:=' профессиональной';
    Items[23,2]:=znach_competence + ' ' + sh_name ;
    end else ShowMessage('Титульный лист не заполнен!');

    desc_cont:= TGeneralController.Instance.GetNewADODataSet(false);
    semestr:= TGeneralController.Instance.GetNewADODataSet(false);
    
    //первый лист "Сформированность"
    FDS_sformyr.First;
    Range['A'+inttostr(TableBeg1),'C'+inttostr(TableBeg1+FDS_sformyr.RecordCount-1)].HorizontalAlignment:= 2 ;
    Range['A'+inttostr(TableBeg1),'C'+inttostr(TableBeg1+FDS_sformyr.RecordCount-1)].VerticalAlignment:=1;
    Range['B'+inttostr(TableBeg1),'C'+inttostr(TableBeg1+FDS_sformyr.RecordCount-1)].WrapText:=True;
    flag:=false;
    flag2:=true;
    flag3:=true;
    for i := 0 to FDS_sformyr.RecordCount-1 do
    begin
      if flag2 then
      begin
      type1:= TableBeg1+i;
      end;
      flag2:=false;

      name_type:=FDS_sformyr.FieldByName('name_type_level_sformyr').Value;
      ik_lvl_cmpt:=FDS_sformyr.FieldByName('ik_level_competence').Value;
      priznak := FDS_sformyr.FieldByName('Value_priznak').Value;
      if flag then
       begin

          if (name_type=Items[TableBeg1+i-1,1].Text)and (i<>FDS_sformyr.RecordCount-1) and (ik_lvl_cmpt=tmp)
            then type2:=TableBeg1+i
            else
            begin
              if (ik_lvl_cmpt<>tmp)or (name_type<>Items[TableBeg1+i-1,1].Text)   then
              begin
                if flag3 then
                begin
                lvl1:=type1;
                lvl2:=type2;
                end else lvl2:=TableBeg1+i-1;
                flag3:=false;
                desc_cont.Close;
                (desc_cont as TADODataSet).CommandText := ' select description_content from Structure_competence'+
                ' where ik_competence= ' +inttostr(competence)+' and ik_level_competence=' + inttostr(tmp);
                desc_cont.Open;
                desc_cont.DisableControls;

                Range['B'+inttostr(lvl1),'B'+inttostr(lvl2)].MergeCells:=True;

                desc_cont.First;
                Items[lvl1,2]:='';
                for j := 0 to desc_cont.RecordCount-1 do
                begin
                Items[lvl1,2]:=Items[lvl1,2].Text + desc_cont.FieldByName('description_content').Value+'; ';
                desc_cont.Next;
                end;

                if (i=FDS_sformyr.RecordCount-1)and(ik_lvl_cmpt<>tmp) then
                begin
                 desc_cont.Close;
                (desc_cont as TADODataSet).CommandText := ' select description_content from Structure_competence'+
                ' where ik_competence= ' +inttostr(competence)+' and ik_level_competence=' + inttostr(ik_lvl_cmpt);
                desc_cont.Open;
                desc_cont.DisableControls;

                desc_cont.First;
                Items[TableBeg1+i,2]:=desc_cont.FieldByName('description_content').Value+'; ';
                end;
                lvl1:=TableBeg1+i;
              end;
              
              if (type2-type1<1) then type1:=TableBeg1+i else
              begin
                if (i=FDS_sformyr.RecordCount-1) then type2:=TableBeg1+i;
                Range['A'+inttostr(type1+1),'A'+inttostr(type2)].Clear;
                Range['A'+inttostr(type1),'A'+inttostr(type2)].MergeCells:=True;
                type1:= TableBeg1+i;
                type2:=type1+1;
                flag3:=true;
              end;
            end;
       end;
      Items[TableBeg1+i,1] := name_type;
      Items[TableBeg1+i,3] := priznak;
      tmp:=ik_lvl_cmpt;
      FDS_sformyr.Next;
      flag:=true;
    end;
      Range['A'+inttostr(TableBeg1),'C'+intToStr(TableBeg1+FDS_sformyr.RecordCount-1)].Borders.Weight:=2;


      //переход на  лист "Траектория"
      self.ActivateWorksheet(2);
      FDS_DiscCmpt.First;
      Range['B'+inttostr(TableBeg3),'B'+inttostr(TableBeg3+FDS_DiscCmpt.RecordCount-1)].HorizontalAlignment:= 2 ;
      Range['B'+inttostr(TableBeg3),'B'+inttostr(TableBeg3+FDS_DiscCmpt.RecordCount-1)].VerticalAlignment:=1;
      Range['B'+inttostr(TableBeg3),'B'+inttostr(TableBeg3+FDS_DiscCmpt.RecordCount-1)].WrapText:=True;
      for i := 0 to FDS_DiscCmpt.RecordCount-1 do
      begin
        Items[TableBeg3+i,2]:= FDS_DiscCmpt.FieldByName('cName_disc').Value;
        semestr.Close;
        (semestr as TADODataSet).CommandText := ' select distinct n_sem from  Content_UchPl where ik_disc_uch_plan= '
        + inttostr(FDS_DiscCmpt.FieldByName('ik_disc_uch_plan').Value);
        semestr.Open;
        semestr.DisableControls;
        semestr.First;
        for j := 0 to semestr.RecordCount - 1 do
        begin
          case semestr.FieldByName('n_sem').Value of
          1:Items[TableBeg3+i,3]:='+';
          2:Items[TableBeg3+i,4]:='+';
          3:Items[TableBeg3+i,5]:='+';
          4:Items[TableBeg3+i,6]:='+';
          5:Items[TableBeg3+i,7]:='+';
          6:Items[TableBeg3+i,8]:='+';
          7:Items[TableBeg3+i,9]:='+';
          8:Items[TableBeg3+i,10]:='+';
          end;
          semestr.Next;
        end;
        FDS_DiscCmpt.Next;
      end;
      Range['B'+inttostr(TableBeg3),'J'+intToStr(TableBeg3+FDS_DiscCmpt.RecordCount-1)].Borders.Weight:=2;

  end;


  //Определим общее число шагов в создании рапорта
  //Реальное число шагов скорее всего будет равно количеству
  //записей, возвращённых запросом для отчёта
  //Example: Result := MyDataSet.Recordscount;
  function TFgos_Application2Report.GetTotalSteps: Integer;
  begin
 //   if FDS_sformyr.RecordCount>FDS_DiscCmpt.RecordCount then
    Result := FDS_sformyr.RecordCount;
  end;
end.
