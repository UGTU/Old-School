(*
  Модуль    : DBTVStudObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект Специальность узла зачисление в дереве
*)
unit DBTVSpecZachObj;
{#Author sergdev@ist.ugtu.net}
interface
uses
Dialogs,
  DBTVObj,
  SysUtils,
  comctrls,
  db,
  ADODB,
  graphics,
  Variants,
  Classes,
  DBTVSpecRecObj;


  type
    TDBNodeSpecZachObject = class (TDBNodeSpecRecObject)
    protected
       function DoAddChildNodes: Boolean; override;

    public
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
      procedure AddChild(Caption:string;ik:integer;RegNum:integer);

    end;

implementation

function TDBNodeSpecZachObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
// empty method (overload)
result:=nil;
end;

procedure TDBNodeSpecZachObject.AddChild(Caption:string;ik:integer;RegNum:integer);
begin
// empty method (overload)
end;

function TDBNodeSpecZachObject.DoAddChildNodes: Boolean;
begin
result:=false;
// empty method (overload)
end;

end.
 