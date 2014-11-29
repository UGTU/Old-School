unit BRSVedom2014;

interface
uses
Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs,
XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
 udmUspevaemost, ComCtrls, uAverageBalls, Vedomost2014,Assemly_Report2014;
type
    TBRS2014VedomostReport = class(TExcelReportBase)
    private
       FReport :TVedomost;
    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
    property  Report:TVedomost  read  FReport;
       constructor Create (report:TVedomost);


    end;
implementation

{ TBRS2014Report }


constructor TBRS2014VedomostReport.Create(report: TVedomost);
begin
  FReport:=report;
end;

procedure  TBRS2014VedomostReport.Execute();
const first_str=15;
var
  I: Integer;
num: Integer;
Rng:Variant;
dir_inst,copystr1,copystr2,fio:string;
posit:integer;
//var report:TAssemly_Report;
//   result_report:TVedomost;
begin
  inherited;
  Replace('#institut#',FReport.Institute);
  Replace('#grup#',FReport.grup);
    Replace('#sem#',inttostr(FReport.num_s));
  Replace('#disc#',FReport.disc);
  if (FReport.ik_vid_zan=6) then
      begin
       Replace('#date_ekz#',DateTimeToStr(FReport.date));
       Replace('#date_zach#','');
  end
  else
 if (FReport.ik_vid_zan=7) then
      begin
       Replace('#date_ekz#','');
       Replace('#date_zach#',DateTimeToStr(FReport.date));
     end
      else
      begin
      Replace('#date_zach#','');
      Replace('#date_ekz#','');
      end;
    dir_inst:=FReport.dir_inst;
    posit:=Pos(' ', dir_inst);
    copystr1:=Copy(dir_inst,posit+1,Length(dir_inst));
    copystr2:=Copy(dir_inst,1,posit-1);
    copystr1:=copystr1+' '+copystr2;
   Replace('#dir_inst#',FReport.dir_inst);

   Replace('#ekz_prep#','');

  num:=0;
  for I := first_str to first_str+FReport.Students.Count-1 do
   begin
   if FReport.Students[num]<>Nil then
       begin

    //  GetRange(Cells[1,1],  Cells[1,10]).Insert;
     //  Range['A1','A1'].Insert();
      // ActiveSheet.Rows.Item[2,2].Insert(xlDown, xlFormatFromLeftOrAbove);

//         ActiveSheet.Rows.Item[2,2].Select;
//       Selection.Insert(xlDown, xlFormatFromLeftOrAbove);

   //   ActiveSheet.Rows('A'+1).Insert();
//      Rng.Select;
       //ActiveSheet.Rows[I].Select;
    //Selection.Insert(Shift :=I);
//       Range[Cells[I,1], Cells[I,10]].Select;
//       Selection.Borders.LineStyle:=1;
      Items[I, 1] := num+1;
    fio:=FReport.Students[num].LastName;
    copystr1:=Copy(FReport.Students[num].FirstName,1,1);
    copystr2:=Copy(FReport.Students[num].Otch,1,1);
       Items[I, 2] := fio+ ' '+copystr1+'.'+copystr2+'.';

       if (FReport.Is_brs) then
         begin
           Items[I, 6]:= IntToStr( FReport.Students[num].balls);
         end;
        if I<>first_str+FReport.Students.Count-1 then
        begin
        if FReport.Is_brs then
            begin
         Range['A'+inttostr(i+1),'J'+inttostr(i+1)].Insert(xlDown, xlFormatFromLeftOrAbove);
         Range['A'+inttostr(i+1),'J'+inttostr(i+1)].Select;
         Selection.Borders.LineStyle:=1;
            end
            else
             begin
          Range['A'+inttostr(i+1),'I'+inttostr(i+1)].Insert(xlDown, xlFormatFromLeftOrAbove);
         Range['A'+inttostr(i+1),'I'+inttostr(i+1)].Select;
         Selection.Borders.LineStyle:=1;
             end;

        end;
     end;
     inc(num);
   end;
  //   Cells[


 // NextStep(1, 'Выгружаем отчёт');
end;

function TBRS2014VedomostReport.GetTotalSteps: Integer;
begin
  Result:=1;
end;
end.
