unit D_VedomostBRSLast;

interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb;

const TableBeg = 13;

type
    TBRSReportLast = class(TExcelReportBase)
    private
       FDataset:TADODataset;
       FFaculty:string;
       FGroup:string;
       FYear:integer;
       FSemester:integer;
       FDiscipline:string;
       FExaminator:string;
       FDateExam:string;
       FDateZach:string;
       FGrade:integer;
       FNum:string;

    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; dsVed : TAdoDataset);
       constructor CreateFull (AOwner : TComponent; dsVed : TAdoDataset; fac,group,disc,exam, dateexam, datezach:string;sem, year, grade:integer);
    end;

    implementation

  constructor TBRSReportLast.Create (AOwner : TComponent; dsVed : TAdoDataset);
  begin
  inherited Create(AOwner);
  FDataset := dsVed;
  end;

  constructor TBRSReportLast.CreateFull (AOwner : TComponent; dsVed : TAdoDataset; fac,group,disc,exam, dateexam, datezach:string;sem, year, grade:integer);
  begin
  inherited Create(AOwner);
  FDataset := dsVed;
  FFaculty := fac;
  FGroup := group;
  FSemester := sem;
  FDiscipline := disc;
  FExaminator := exam;
  FDateExam:=dateexam;
  FDateZach:=datezach;
  FYear:=year;
 end;

  procedure TBRSReportLast.Execute;
  var
    i : Integer;
    examballs:integer;
    allballs:integer;
  begin
    inherited;
     if FDataset = nil then
     exit;

     if not FDataset.Active then
     begin
     showmessage('Выберите ведомость для печати!');
     exit;
     end;

    FDataset.First;
    Range['B15','F23'].Copy(Range['B'+intToStr(15+FDataset.RecordCount-1),'F'+intToStr(23+FDataset.RecordCount-1)]);
    Range['B15','F23'].Clear;

    Items[4,3] := FYear;
    Items[5,3] := FSemester;
    Items[6,3] := FFaculty;
    Items[6,5] := FGrade;
    Items[6,7] := FGroup;
    Items[7,3] := FDiscipline;
    Items[8,3] := FExaminator;
    Items[9,3] := FDateZach;
    Items[9,7] := FDateExam;

    for i := 0 to FDataset.RecordCount-1 do
    begin
      Range['A'+inttostr(TableBeg+i),'J'+inttostr(TableBeg+i)].NumberFormat := '@';
      Items[TableBeg+i,1] := i+1;
      Items[TableBeg+i,2] := FDataset.FieldByName('StudName').Value;
      Items[TableBeg+i,3] := FDataset.FieldByName('nn_zach').Value;
      Items[TableBeg+i,4] := FDataset.FieldByName('FirstModBalls').Value; // баллы после первой аттестации
      Items[TableBeg+i,5] := FDataset.FieldByName('SecondModBalls').Value; // баллы после первой аттестации
      Items[TableBeg+i,6] := FDataset.FieldByName('ThirdModBalls').Value;  // баллы за семестр
      Items[TableBeg+i,7] := FDataset.FieldByName('Zach').Value;  // зачет
      allballs := FDataset.FieldByName('ThirdModBalls').Value + FDataset.FieldByName('Exam').Value;  // рейтинговая оценка в баллах
      Items[TableBeg+i,8] := allballs;

      // итоговая оценка по пятибалльной шкале
       if allballs>=91 then
      Items[TableBeg+i,9] := 'Отлично'
      else if allballs>=81 then
            Items[TableBeg+i,9] := 'Хорошо'
      else if allballs>=71 then
            Items[TableBeg+i,9] := 'Удовл.'
      else
            Items[TableBeg+i,9] := 'Неуд.';

      Range['A'+inttostr(TableBeg+i),'J'+inttostr(TableBeg+i)].Font.Size:=12;
      Range['B'+inttostr(TableBeg+i),'B'+inttostr(TableBeg+i)].HorizontalAlignment:= xlLeft ;
      Range['C'+inttostr(TableBeg+i),'J'+inttostr(TableBeg+i)].HorizontalAlignment:= xlCenter ;
      NextStep(1, 'Обработано оценок: '+ IntToStr(i+1));
      FDataset.Next;
    end;

    Range['A'+inttostr(TableBeg-1),'J'+intToStr(TableBeg+FDataset.RecordCount-1)].Borders.Weight:=2;

  end;

  //Определим общее число шагов в создании рапорта
  //Реальное число шагов скорее всего будет равно количеству
  //записей, возвращённых запросом для отчёта
  //Example: Result := MyDataSet.Recordscount;
  function TBRSReportLast.GetTotalSteps: Integer;
  begin
    Result := FDataset.RecordCount;
  end;

end.
