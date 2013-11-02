(*
  ������    : DBTVRIOPlanObj
  ��������� : ..
  ������: 0.5
  ����� : ������� �. �.

  ����������: ������ ���� ������� � ������
*)
unit DBTVRIOPlanObj;
 {#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
  DBTVFacObj,
  DBTVRecruitObj,
  DBTVScheduleObj,
  DBTVZachObj,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants;


  type
  TDBNodeRIOPlanObject = class (TDBNodeObject)
  private
  FName:string;
  FIK:integer;
  protected
    function DoAddChildNodes: Boolean; override;
  public
    property Name: string read FName write FName;
    property ik: integer read FIK write FIK;
  end;

implementation


function TDBNodeRIOPlanObject.DoAddChildNodes: Boolean;
begin
result:=false;
end;

end.



