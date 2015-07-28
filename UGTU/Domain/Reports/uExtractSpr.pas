unit uExtractSpr;
interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls, SpravkaHistory2014, Spravka2014,
  DateUtils, uDM, ConstantRepository, uDMDocuments;

type
  ExtractSprReport = class(TExcelReportBase)
  private
    Fik_doc: integer;
  protected
    procedure Execute; override;
  public
    property ik_doc: integer read Fik_doc;

    constructor Create(_ik_doc: integer);

  end;

implementation

uses System.Variants;
{ AkademSprReport }

constructor ExtractSprReport.Create(_ik_doc: integer);
begin
  Fik_doc := _ik_doc;
end;

procedure ExtractSprReport.Execute;
var
  spVipiska, spInf, spGos, spKP, spPrakt, spUspev, spDoc,
    sp_history: TADOStoredProc;
  AYear, AMonth, ADay: word;
  m, I, fkp, k, fusp, w, ind, l: integer;
  podgot, diplom, prakt, week, ZE, let: string;
  fl, flg, flpr: boolean;
  ZECount: double;
begin
  inherited;
  fl := true;
  flg := true;
  flpr := true;
  spDoc := TADOStoredProc.Create(nil);
  spInf := TADOStoredProc.Create(nil);
  spVipiska := TADOStoredProc.Create(nil);
  spGos := TADOStoredProc.Create(nil);
  spKP := TADOStoredProc.Create(nil);
  spPrakt := TADOStoredProc.Create(nil);
  spUspev := TADOStoredProc.Create(nil);
  sp_history := TADOStoredProc.Create(nil);
  diplom := '';
  ind := 0;
  try
    // данные студента
    spInf.ProcedureName := 'StudInfoSpravBuild;1';
    spInf.Connection := dm.DBConnect;
    spInf.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
      50, ik_doc);
    spInf.Open;
    spInf.First;
    Replace('#form_ed2#', spInf.FieldByName('Cname_form_pril').AsString);
    k := 0;
    // данные по выписке
    spVipiska.ProcedureName := 'GetVipiscaForDiplom;1';
    spVipiska.Connection := dm.DBConnect;
    spVipiska.Parameters.CreateParameter('@ik_zach', ftString, pdInput, 50,
      spInf.FieldByName('Ik_zach').AsString);
    spVipiska.Parameters.CreateParameter('@ik_CurGroup', ftString, pdInput, 50,
      spInf.FieldByName('ik_grup').AsString);
    spVipiska.Open;
    spVipiska.First;
    with spVipiska do
    begin
      DecodeDate(FieldByName('Dd_birth').AsDateTime, AYear, AMonth, ADay);
      m := AMonth;
      Replace('#FIO#', FieldByName('StudName').AsString);
      Replace('#birth#', 'ƒата рождени€ ' + ADay.ToString() + ' ' + GetMonthR(m)
        + ' ' + AYear.ToString() + 'г.');
      Replace('#obr#', FieldByName('docum').AsString);
      Replace('#god_post#', FieldByName('yearPostup').AsString);
      let := FieldByName('YearObuch').AsString;
      l := StrToInt(Copy(let, let.Length, 1));
      if l < 5 then
        let := let + ' года '
      else if (l < 10) or (l > 20) then
      begin
        if l = 1 then
          let := let + ' год '
        else
          let := let + ' лет';
      end
      else
        let := let + ' лет ';

      Replace('#kol_y#', let);
      podgot := spInf.FieldByName('Podgot').AsString;
      if podgot = 'направлени€ подготовки' then
        podgot := 'Ќаправление подготовки';
      Replace('#podgot#', podgot);
      Replace('#form_ed#', FieldByName('form').AsString);
      Replace('#sh_spec#', FieldByName('Sh_spec').AsString);
      Replace('#spec#', spInf.FieldByName('Cname_spec').AsString);
      if FieldByName('OcencaDiplom').AsString <> '' then
        if FieldByName('cdiplom').AsString <> '' then
        begin
          Replace('#tema_diplom#', FieldByName('cdiplom').AsString);
          diplom := FieldByName('OcencaDiplom').AsString;
        end
        else
        begin
          Replace('#tema_diplom#', 'не выполн€л(а)');
          Replace('#diplom#', '');
          fl := false;
        end
      else
      begin
        Replace('#tema_diplom#', 'не выполн€л(а)');
        Replace('#diplom#', '');
      end;
    end;

    sp_history.ProcedureName := 'StudHistForSpr;1';
    sp_history.Connection := dm.DBConnect;
    sp_history.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
      50, ik_doc);
    sp_history.Open;
    sp_history.Last;
    if sp_history.FieldByName('ikTypePric').AsInteger = 2 then
    begin
      DecodeDate(sp_history.FieldByName('Dd_prikazVst').AsDateTime, AYear,
        AMonth, ADay);
      // проверить отчислен ли студент ? закончил ли обучение
      Replace(' #god_zav#', AYear.ToString() +
        ' году в ‘едеральном государственном бюджетном образовательном учреждении высшего професисонального образовани€ "”хтинский государственный технический университет " '
        + '(' + spVipiska.FieldByName('form').AsString + ' форма обучени€)');
      Replace('#pric#', 'ѕриказ об отчислении от ' + ADay.ToString() + ' ' +
        GetMonthR(StrToInt(AMonth.ToString())) + ' ' + AYear.ToString() + ' є '
        + sp_history.FieldByName('Nn_prikaz').AsString);
    end
    else
    begin
      Replace(' #god_zav#', 'продолжает обучение');
      Replace(' #pric#', 'ѕродолжает обучение');
    end;

    spDoc.ProcedureName := 'DocInfoSpravBuild;1';
    spDoc.Connection := dm.DBConnect;
    spDoc.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
      50, ik_doc);
    spDoc.Open;
    spDoc.First;
    Replace('#num#', spDoc.FieldByName('NumberDoc').AsString);
    Replace('#date_vid#', spDoc.FieldByName('DateCreate').AsString);

    // данные по курсовым
    spKP.ProcedureName := 'SelKPForVipisca;1';
    spKP.Connection := dm.DBConnect;
    spKP.Parameters.CreateParameter('@ik_zach', ftString, pdInput, 50,
      spInf.FieldByName('Ik_zach').AsString);
    spKP.Parameters.CreateParameter('@iK_vid_zanyat', ftString, pdInput, 50, 8);
    spKP.Parameters.CreateParameter('@ik_CurGroup', ftString, pdInput, 50,
      spInf.FieldByName('ik_grup').AsString);
    spKP.Open;
    spKP.First;
    fkp := 28;

    while not spKP.Eof do
    begin

      if spKP.FieldByName('Dd_exam').AsDateTime <=
        spDoc.FieldByName('DateCreate').AsDateTime then
      begin
        Range['A' + inttostr(fkp), 'H' + inttostr(fkp)
          ].Insert(xlDown, xlFormatFromRightOrBelow);
        // xlFormatFromLeftOrAbove);
        Range['A' + inttostr(fkp), 'H' + inttostr(fkp)].Select;
        if spKP.FieldByName('discName').AsString.Length < 55 then
          Items[fkp, 1] := spKP.FieldByName('discName').AsString + ', ' +
            spKP.FieldByName('cOsenca').AsString
        else
        begin
          Items[fkp, 1] := spKP.FieldByName('discName').AsString + ', ';
          fkp := fkp + 1;
          ind := ind + 1;
          Range['A' + inttostr(fkp), 'H' + inttostr(fkp)
            ].Insert(xlDown, xlFormatFromRightOrBelow);
          // xlFormatFromLeftOrAbove);
          Range['A' + inttostr(fkp), 'H' + inttostr(fkp)].Select;
          Items[fkp, 1] := spKP.FieldByName('cOsenca').AsString
        end;
        fkp := fkp + 1;
        ind := ind + 1;
        k := k + 1;
      end;
      spKP.Next;
    end;

    if k = 0 then
    begin
      Items[fkp, 1] := 'не сдавал(а)';
      fkp := fkp + 2;
    end
    else
    begin
      fkp := fkp + 1;
      Range['A' + inttostr(fkp), 'H' + inttostr(fkp)].Delete(xlUp);
    end;
    fkp := fkp + 1;

    // данные по практике
    spPrakt.ProcedureName := 'SelPractForVipisca;1';
    spPrakt.Connection := dm.DBConnect;
    spPrakt.Parameters.CreateParameter('@ik_zach', ftString, pdInput, 50,
      spInf.FieldByName('Ik_zach').AsString);
    spPrakt.Parameters.CreateParameter('@ik_CurGroup', ftString, pdInput, 50,
      spInf.FieldByName('ik_grup').AsString);
    spPrakt.Open;
    spPrakt.First;
    k := 0;
    while not spPrakt.Eof do
    begin
      if spPrakt.FieldByName('Dd_exam').AsDateTime <=
        spDoc.FieldByName('DateCreate').AsDateTime then
      begin
        if spPrakt.FieldByName('ik_disc').AsString.Length <> 0 then
        begin
          Range['A' + inttostr(fkp), 'H' + inttostr(fkp)
            ].Insert(xlDown, xlFormatFromRightOrBelow);
          Range['A' + inttostr(fkp), 'H' + inttostr(fkp)].Select;
          prakt := spPrakt.FieldByName('DiscName').AsString + ', ' +
            spPrakt.FieldByName('weekCount').AsString + ' ';
          week := spPrakt.FieldByName('weekCount').AsString;
          w := StrToInt(Copy(week, week.Length, 1));
          if (w < 5) and (w >1) then
            prakt := prakt + 'недели, '
          else if (w < 10) or (w > 20) then
          begin
            if w = 1 then
              prakt := prakt + 'недел€, '
            else
              prakt := prakt + 'недель, ';
          end
          else
            prakt := prakt + 'недель, ';
          prakt := prakt + spPrakt.FieldByName('cOsenca').AsString;
          Items[fkp, 1] := prakt;
          fkp := fkp + 1;
          ind := ind + 1;
          flpr := false;
        end;

        k := k + 1;
      end;
      spPrakt.Next;

    end;

    if flpr then
    begin
      // Range['A' + inttostr(fkp), 'H' + inttostr(fkp)
      // ].Insert(xlDown, xlFormatFromRightOrBelow);
      // Range['A' + inttostr(fkp), 'H' + inttostr(fkp)].Select;
      Items[fkp, 1] := 'не сдавал(а)';
      fkp := fkp + 1;
    end
    else
    begin
      fkp := fkp + 1;
      Range['A' + inttostr(fkp), 'H' + inttostr(fkp)].Delete(xlUp);
    end;

    if k = 0 then
      Items[fkp, 1] := 'не сдавал(а)';
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
        spDoc.FieldByName('DateCreate').AsDateTime then
      begin
        if flg then
        begin
          if spGos.FieldByName('ik_disc').AsInteger = 588 then
          begin
            Replace('#gos#', spGos.FieldByName('cOsenca').AsString);
            flg := false;
          end;
        end;

        if fl then
        begin

          if spGos.FieldByName('ik_disc').AsInteger = 593 then
          begin
            ZE := spGos.FieldByName('ZECount').AsString;
            ZECount := StrToInt(Copy(ZE, ZE.Length, 1)) / 1.5;
            if ZECount < 5 then
              diplom := ZECount.ToString() + ' недели' + diplom
            else if (ZECount < 10) or (ZECount > 20) then
            begin
              if ZECount = 1 then
                diplom := ZECount.ToString() + ' недел€' + diplom
              else
                diplom := ZECount.ToString() + ' недель' + diplom;
            end
            else
              diplom := ZECount.ToString() + ' недель' + diplom;

            Replace('#diplom#', diplom);
          end;
        end;
      end;
      spGos.Next;
    end;
    if flg then
      Replace('#gos#', 'не сдавал(а)');
    // данные по документу
    // данные по успеваемости
    spUspev.ProcedureName := 'SelUspevForVipisca;1';
    spUspev.Connection := dm.DBConnect;
    spUspev.Parameters.CreateParameter('@ik_zach', ftString, pdInput, 50,
      spInf.FieldByName('Ik_zach').AsString);
    spUspev.Parameters.CreateParameter('@ik_CurGroup', ftString, pdInput, 50,
      spInf.FieldByName('ik_grup').AsString);
    spUspev.Open;
    spUspev.First;
    fusp := 57;
    ind := ind - 3;
    for I := 0 to ind do
      Range['A' + inttostr(41 + ind), 'H' + inttostr(41 + ind)].Delete(xlUp);
    ind := ind + 41;
    while not spUspev.Eof do
    begin
      if spUspev.FieldByName('Dd_exam').AsDateTime <=
        spDoc.FieldByName('DateCreate').AsDateTime then
      begin
        if spUspev.FieldByName('iK_disc').AsInteger > 0 then
        begin
          Range['A' + inttostr(fusp), 'K' + inttostr(fusp)
            ].Insert(xlDown, xlFormatFromRightOrBelow);
          Range['A' + inttostr(fusp), 'K' + inttostr(fusp)].Select;
          Items[fusp, 1] := spUspev.FieldByName('cName_disc').AsString;
          Items[fusp, 6] := spUspev.FieldByName('HourCount').AsString;
          Items[fusp, 9] := spUspev.FieldByName('cOsenca').AsString;
          fusp := fusp + 1;
          Range['F' + inttostr(fusp - 1), 'H' + inttostr(fusp - 1)].Select;
          Selection.MergeCells := true;
          // Selection.HorizontalAlignment := xlCenter;
        end;
        if spUspev.FieldByName('iK_disc').AsInteger = 0 then
        begin
          Replace('#all#', spUspev.FieldByName('HourCount').AsString);
        end;
        if spUspev.FieldByName('iK_disc').AsInteger < 0 then
        begin
          Replace('#audit#', spUspev.FieldByName('HourCount').AsString);
        end;
      end;
      spUspev.Next;
    end;
    Range['A' + inttostr(fusp), 'K' + inttostr(fusp)].Delete(xlUp);
    // ActiveSheet.ExportAsFixedFormat(0, 'e:\out.pdf', 0, false, true,
    // EmptyParam, EmptyParam,  true, EmptyParam);
  finally
    spInf.Free;
    spVipiska.Free;
    spGos.Free;
    spKP.Free;
    spPrakt.Free;
    spUspev.Free;
    sp_history.Free;
    spDoc.Free;
  end;
end;

end.
