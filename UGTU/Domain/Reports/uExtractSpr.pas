unit uExtractSpr;

interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls, SpravkaHistory2014, Spravka2014,
  DateUtils, uDM, ConstantRepository, uDMDocuments, Math, Document,
  System.Generics.Collections;

type
  ExtractSprReport = class(TExcelReportBase)
  private
    FListDoc: TObjectList<TDopDoc>;
  protected
    procedure Execute; override;
  public
    property ListDoc: TObjectList<TDopDoc> read FListDoc;
    constructor Create(_ListDoc: TObjectList<TDopDoc>);

  end;

implementation

uses System.Variants;
{ AkademSprReport }

constructor ExtractSprReport.Create(_ListDoc: TObjectList<TDopDoc>);
begin
  FListDoc := _ListDoc;
end;
procedure ExtractSprReport.Execute;
var
  spInf, spGos, spUspev, sp_doc, sp_history: TADOStoredProc;
  AYear, AMonth, ADay: word;
  I, k, fusp, ind, kurs, sem, lastkurs, ocenka, kol_ocenca, ik_inst, h,
    g,ik_doc,j: integer;
  podgot, diplom, prakt, week, ZE, let: string;
  m: Extended;
  fl, flg, flpr, flag: boolean;
  ZECount: double;
  sr_b: double;
  ch: Extended;
begin
  inherited;
    try
    if ListDoc.Count > 1 then
      for i := 0 to ListDoc.Count - 2 do
      DuplicatePage(1, 1);
        //ActiveSheet.Copy(0, CurrentWorkbook.Sheets[1], 0);
    for j := 0 to ListDoc.Count - 1 do
    begin
      ActivateWorksheet(j + 1);
      ik_doc:=ListDoc[j].ik_doc;
  fl := true;
  flg := true;
  flpr := true;
  sp_doc := TADOStoredProc.Create(nil);
  spInf := TADOStoredProc.Create(nil);

  spGos := TADOStoredProc.Create(nil);

  sp_history := TADOStoredProc.Create(nil);
  diplom := '';
  ind := 1;
  ocenka := 0;
  kol_ocenca := 0;
  sr_b := 0;
  flag := true;

    // данные студента
    spInf.ProcedureName := 'StudInfoSpravBuild;1';
    spInf.Connection := dm.DBConnect;
    spInf.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
      50, ik_doc);
    spInf.Open;
    spInf.First;
    // Replace('#form_ed2#', spInf.FieldByName('Cname_form_pril').AsString);
    Replace('#fio_rod#', spInf.FieldByName('FIOrod').AsString);
    Replace('#year_post#', spInf.FieldByName('zachYear').AsString);
    if spInf.FieldByName('Podgot').AsString = 'направления подготовки' then
      Replace('#podgot#', 'направление подготовки')
    else
      Replace('#podgot#', spInf.FieldByName('Podgot').AsString);
    Replace('#f_ed#', AnsiLowerCase(spInf.FieldByName('Cname_form_ed')
      .AsString));
    Replace('#sh_spec#', spInf.FieldByName('Sh_spec').AsString);
    Replace('#spec#', LowerCase(spInf.FieldByName('Cname_spec').AsString));
    Replace('#inst#', LowerCase(spInf.FieldByName('Cname_fac').AsString));
    if (spInf.FieldByName('ik_type_kat').AsInteger = 1) or
      (spInf.FieldByName('ik_type_kat').AsInteger = 2) then
      Replace('#type#', 'бюджет')
    else
      Replace('#type#', 'договор');
    ik_inst := spInf.FieldByName('ik_fac').AsInteger;
    if (ik_inst = 27) or (ik_inst = 29) or (ik_inst = 30) then
      Replace('#sh_inst#', 'Ин' + spInf.FieldByName('Cname_fac_small').AsString)
    else
      Replace('#sh_inst#', spInf.FieldByName('Cname_fac_small').AsString);
    // заполняем данные по справке
    sp_doc.ProcedureName := 'DocInfoSpravBuild;1';
    sp_doc.Connection := dm.DBConnect;
    sp_doc.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
      50, ik_doc);
    sp_doc.Open;
    sp_doc.First;
    with sp_doc do
    begin
      DecodeDate(FieldByName('DatePod').AsDateTime, AYear, AMonth, ADay);
      Replace('#num#', FieldByName('NumberDoc').AsString);
      Replace('#year_now#', AYear.ToString());
      kurs := spInf.FieldByName('kurs').AsInteger;
      Replace('#date#', FieldByName('DatePod').AsString);
      DecodeDate(FieldByName('DateCreate').AsDateTime, AYear, AMonth, ADay);
      if StrToInt(AMonth.ToString()) > 8 then
        sem := kurs * 2 - 1
      else
        sem := kurs * 2;
    end;

    fusp := 19;
    kurs := 1;
    // данные по успеваемости
    for I := 1 to sem do
    begin
      spUspev := TADOStoredProc.Create(nil);
      spUspev.ProcedureName := 'SelUspevForStud;1';
      spUspev.Connection := dm.DBConnect;
      spUspev.Parameters.CreateParameter('@n_sem', ftString, pdInput, 50,
        I.ToString());
      spUspev.Parameters.CreateParameter('@ik_zach', ftString, pdInput, 50,
        spInf.FieldByName('Ik_zach').AsString);
      spUspev.Open;
      spUspev.First;

      Range['A' + inttostr(fusp), 'K' + inttostr(fusp)
        ].Insert(xlDown, xlFormatFromRightOrBelow);
      Range['C' + inttostr(fusp), 'E' + inttostr(fusp)].Select;
      Items[fusp, 3] := kurs.ToString() + ' курс ' + I.ToString() + ' семестр';
      Selection.MergeCells := true;
      Range['C' + inttostr(fusp), 'E' + inttostr(fusp)].HorizontalAlignment
        := xlCenter;
      fusp := fusp + 1;
      flag := true;
      while not spUspev.Eof do
      begin
        if spUspev.FieldByName('Dd_exam').AsDateTime <=
          sp_doc.FieldByName('DateCreate').AsDateTime then
          if (spUspev.FieldByName('ShortName').AsString.Length <> 0) and
            (spUspev.FieldByName('ShortName').AsString <> 'не зачт.') then
          begin
            Range['A' + inttostr(fusp), 'K' + inttostr(fusp)
              ].Insert(xlDown, xlFormatFromRightOrBelow);
            Range['A' + inttostr(fusp), 'K' + inttostr(fusp)].Select;
            Items[fusp, 2] := ind.ToString();
            Range['B' + inttostr(fusp), 'B' + inttostr(fusp)
              ].HorizontalAlignment := xlCenter;
            Items[fusp, 3] := spUspev.FieldByName('cName_disc').AsString;
            ch := Int(spUspev.FieldByName('cName_disc').AsString.Length / 42);
            h := 15;
            for g := 1 to StrToInt(ch.ToString()) do
              h := h + 15;
            Range['A' + (fusp).ToString(), 'K' + (fusp).ToString()
              ].RowHeight := h;
            Range['C' + inttostr(fusp), 'E' + inttostr(fusp)].Select;
            Selection.MergeCells := true;
            flag := false;
            if spUspev.FieldByName('cName_disc').AsString <> 'Физическая культура'
            then
              if spUspev.FieldByName('Hours').AsString.Length <> 0 then
              begin
                m := spUspev.FieldByName('Hours').AsInteger / 36;
                Items[fusp, 6] := m.ToString();
                Items[fusp, 7] := spUspev.FieldByName('Hours').AsString;
              end;
            Range['G' + inttostr(fusp), 'H' + inttostr(fusp)].Select;
            Selection.MergeCells := true;
            Range['G' + inttostr(fusp), 'H' + inttostr(fusp)
              ].HorizontalAlignment := xlCenter;
            if (spUspev.FieldByName('cName_vid_zanyat').AsString = 'Зачет') then
              Items[fusp, 9] := spUspev.FieldByName('ShortName').AsString
            else
            begin
              if (spUspev.FieldByName('cName_vid_zanyat').AsString = 'КР') then
                Items[fusp, 10] := 'КР ' + spUspev.FieldByName
                  ('ShortName').AsString;
              if (spUspev.FieldByName('cName_vid_zanyat').AsString = 'КП') then
                Items[fusp, 10] := 'КП ' + spUspev.FieldByName
                  ('ShortName').AsString;

              if (spUspev.FieldByName('cName_vid_zanyat').AsString = 'Экзамен')
                or (spUspev.FieldByName('cName_vid_zanyat')
                .AsString = 'Практика') then
              begin
                Items[fusp, 10] := spUspev.FieldByName('ShortName').AsString;
              end;
              if spUspev.FieldByName('ShortName').AsString = 'удовлетв.' then
                ocenka := ocenka + 3;
              if spUspev.FieldByName('ShortName').AsString = 'хорошо' then
                ocenka := ocenka + 4;
              if spUspev.FieldByName('ShortName').AsString = 'отлично' then
                ocenka := ocenka + 5;
              kol_ocenca := kol_ocenca + 1;
            end;
            Range['J' + inttostr(fusp), 'K' + inttostr(fusp)].Select;
            Selection.MergeCells := true;
            Range['J' + inttostr(fusp), 'K' + inttostr(fusp)
              ].HorizontalAlignment := xlCenter;
            fusp := fusp + 1;
            ind := ind + 1;
            // Range['F' + inttostr(fusp - 1), 'H' + inttostr(fusp - 1)].Select;
            // Selection.MergeCells := true;
          end;
        spUspev.Next;
      end;
      if I mod 2 = 0 then
        kurs := kurs + 1;
      spUspev.Close;
      spUspev.Free;
    end;
    if kol_ocenca <> 0 then
      sr_b := RoundTo(ocenka / kol_ocenca, -1);
    Replace('#sr_b#', FloatToStr(sr_b));
    Range['A' + inttostr(fusp), 'K' + inttostr(fusp)].Delete(xlUp);
    // данные по госам
    spGos.ProcedureName := 'SelGOSForVipisca;1';
    spGos.Connection := dm.DBConnect;
    spGos.Parameters.CreateParameter('@ik_zach', ftString, pdInput, 50,
      spInf.FieldByName('Ik_zach').AsString);
    spGos.Parameters.CreateParameter('@ik_CurGroup', ftString, pdInput, 50,
      spInf.FieldByName('ik_grup').AsString);
    spGos.Open;
    spGos.First;
    k := 0;
    while not spGos.Eof do
    begin
      if spGos.FieldByName('Dd_exam').AsDateTime <=
        sp_doc.FieldByName('DateCreate').AsDateTime then
      begin
        if spGos.FieldByName('ik_disc').AsInteger = 588 then
        begin
          Items[fusp, 3] := 'Итоговый междисциплинарный экзамен';
          Items[fusp, 10] := spGos.FieldByName('cOsenca').AsString;
        end;
      end;
      spGos.Next;
    end;
    if flag then
      Range['B' + inttostr(fusp - 1), 'K' + inttostr(fusp - 1)].Delete(xlUp);
    Replace('#fio1#', '');
    Replace('#fio2#', '');
   // ActiveSheet.Name := '№ '+sp_doc.FieldByName('NumberDoc').AsString+' '+ spInf.FieldByName('FIOrod').AsString;
   ActiveSheet.Name := '№ '+sp_doc.FieldByName('NumberDoc').AsString +' '+ spInf.FieldByName('PersonSmallName').AsString;
    end;
  finally
    spInf.Free;
    spGos.Free;
    // spUspev.Free;
    sp_history.Free;
    sp_doc.Free;

  end;
end;

end.
