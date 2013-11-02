(*
  Модуль    : DBTVDepScheduleObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект кафедра в дереве для расписания
*)
unit DBTVDepScheduleObj;
 {#Author sergdev@ist.ugtu.net}
interface
uses
Dialogs,
  DBTVObj,
  DBTVGroupObj,
    DBTVTeacherObj,
  SysUtils,
  comctrls,
  db,
  ADODB,
  graphics,
  Variants;

  type
    TDBNodeScheduledepartmentObject = class (TDBNodeObject)
    private
      FName:string;
      FShortName:string;
      FIK:integer;
      FIK_semestertype:integer;
      FIK_Year:integer;
      FDataSet: TADODataSet;

    protected
      function DoAddChildNodes: Boolean; override;
    public
    constructor Create(new:TTreeNode;TreeView:TTreeView;terminate:boolean);
      function SetADODataset(Connection:TAdoConnection):TAdodataset;
      procedure AddChild(Caption:string; ik:integer; f, m, l: string);

      property Name: string read FName write FName;
      property ShortName: string read FShortName write FShortName;
      property ik: integer read Fik write Fik;
      property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
      property  IK_SemesterType: integer read FIK_SemesterType write FIK_SemesterType;
      property  IK_Year:integer read FIK_Year write FIK_Year;
    end;

implementation

uses  DBTVDekanat;

constructor TDBNodeScheduledepartmentObject.Create(new:TTreeNode;TreeView:TTreeView;terminate:boolean);
begin
inherited Create(new,TreeView,terminate);
Actiongroup:='catScheduleDep';
end;

function TDBNodeScheduledepartmentObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
result:=nil;
// no implementation required
end;

procedure TDBNodeScheduledepartmentObject.AddChild(Caption:string; ik:integer; f, m, l: string);
begin
// no implementation required
end;

function TDBNodeScheduledepartmentObject.DoAddChildNodes: Boolean;
begin
// no implementation required
result:=false;
end;

end.
