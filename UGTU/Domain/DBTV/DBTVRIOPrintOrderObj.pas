(*
  ������    : DBTVRIOPrintOrderObj
  ��������� : ..
  ������: 0.5
  ����� : ������� �. �.

  ����������: ������ ������ � ������
*)
unit DBTVRIOPrintOrderObj;
 {#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
  DBTVFacObj,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants;


  type
  TDBNodeRIOPrintOrderObject = class (TDBNodeObject)
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


function TDBNodeRIOPrintOrderObject.DoAddChildNodes: Boolean;
begin
result:=false;
end;

end.



