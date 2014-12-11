unit Assemly_Report2014;
interface
uses
Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs,
XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
 udmUspevaemost, ComCtrls, uAverageBalls,Vedomost2014,uDM,VedomostItem2014;
type
    TAssemly_Report = class
    private
      ikVed: integer;
    protected

    public
       constructor Create (_ikVed:integer);
        function AddReport():TVedomost;
        destructor Destroy;override;

    end;
implementation

{ TBRS2014Report }

constructor TAssemly_Report.Create( _ikVed:integer);
begin
  //inherited Create(AOwner);

        ikVed:=_ikVed;

end;
function TAssemly_Report.AddReport():TVedomost;
var
sp_shapka:TADOStoredProc;
sp_studs:TADOStoredProc;
i:integer;
ved:TVedomostItem;
stud_list:TList;
begin
 sp_shapka:= TADOStoredProc.Create(nil);
  sp_studs:= TADOStoredProc.Create(nil);
  try
    sp_shapka.ProcedureName:= 'GetVedShapka;1';
    sp_shapka.Connection:= dm.DBConnect;
    sp_shapka.Parameters.CreateParameter('@ik_ved', ftString, pdInput, 50, self.ikVed );
   sp_shapka.Open;
   sp_shapka.First;

    sp_studs.ProcedureName:= 'GetVedomostWithBRS;1';
    sp_studs.Connection:= dm.DBConnect;
    sp_studs.Parameters.CreateParameter('@ik_ved', ftString, pdInput, 50, self.ikVed );
   sp_studs.Open; sp_studs.First;


  Result:=  TVedomost.Create(sp_shapka.FieldByName('Cname_fac_small').AsString,
  sp_shapka.FieldByName('Cname_grup').AsString,
  sp_shapka.FieldByName('Cname_spec').AsString,
  sp_shapka.FieldByName('cName_disc').AsString,
  sp_shapka.FieldByName('n_sem').AsInteger,
   sp_shapka.FieldByName('ManagerSmallName').AsString,
   sp_shapka.FieldByName('Dd_exam').AsDateTime,
   0,
   sp_shapka.FieldByName('iK_vid_zanyat').AsInteger,
   sp_shapka.FieldByName('nYear_post').AsInteger,
   sp_shapka.FieldByName('IsBRSPlan').AsBoolean);
   sp_studs.first;

   //  stud_list:= TList.Create();
  While not sp_studs.Eof do
  begin

  ved:=TVedomostItem.Create(sp_studs.FieldByName('ik_zach').AsInteger,sp_studs.FieldByName('Cfirstname').AsString,
  sp_studs.FieldByName('Clastname').AsString,sp_studs.FieldByName('Cotch').AsString,sp_studs.FieldByName('balls_modul').AsInteger);
 // stud_list.Add(ved);
   sp_studs.Next;
  //Result.Student.Add(ved);
   Result.Students.Add(ved);
    end;
   //  Result.Student:=stud_list;
  finally
        sp_shapka.Free;

        ved.Free;


  end;

  end;
  destructor TAssemly_Report.Destroy;
begin

  inherited;
end;
end.
