unit VCLUtils;
  {#Author fmarakasov@ugtu.net}
interface

uses
 contnrs, Menus, classes, stdctrls, SysUtils,  comctrls;


 procedure MergeMenus(Item:TMenuItem; Menu:TMenu);overload; // ƒобавление пунктов меню Menu к пункту меню Item
 procedure MergeMenus(Menu:TMenu; MergeMenu:TMenu);overload; // ƒобавление пунктов меню Menu к меню MergeMenu
 function  InputBoxEx(const Text, Caption:String; Default:String = ''):String;
 procedure AutoFillEditText(const Edit:TComboBox; const Strings:TStrings);
 function  ResolveToSave(const CB:TComboBox):Boolean;
 procedure SelectAllLV(LV:TListView);
 function BSTreeNodePath(Path:String; TV:TTreeView; Root:TTreeNode=nil):TTreeNode;



implementation


procedure MergeMenus(Item:TMenuItem; Menu:TMenu); // ƒобавление пунктов меню Menu к пункту меню Item
var
  i :Integer;
  mi:TMenuItem;
begin
  if Assigned(Menu) and Assigned (Item) then
  begin
    for i:=0 to Menu.Items.Count - 1 do
    begin
      mi:=TMenuItem.Create(Menu);
      mi.Caption:=Menu.Items[i].Caption;
      mi.OnClick:=Menu.Items[i].OnClick;
      mi.ImageIndex:=Menu.Items[i].ImageIndex;
      mi.Action:=Menu.Items[i].Action;
      Item.Add(mi);
    end;
  end;
end;

procedure MergeMenus(Menu:TMenu; MergeMenu:TMenu);// ƒобавление пунктов меню Menu к пункту меню Item
var
  i :Integer;
  mi:TMenuItem;
begin
  if Assigned(Menu) and Assigned (MergeMenu) then
  begin
    for i:=0 to MergeMenu.Items.Count - 1 do
    begin
      mi:=TMenuItem.Create(Menu);
      mi.Caption:=MergeMenu.Items[i].Caption;
      mi.OnClick:=MergeMenu.Items[i].OnClick;
      mi.ImageIndex:=MergeMenu.Items[i].ImageIndex;
      mi.Action:=MergeMenu.Items[i].Action;
      Menu.Items.Add(mi);
    end;
  end;
end;


function  InputBoxEx(const Text, Caption:String; Default:String):String;
begin
  //
end;


procedure AutoFillEditText(const Edit:TComboBox; const Strings:TStrings);

function FindPos:Integer;
var
  i:Integer;
begin
  Result:=-1;
  for i:=0 to Strings.Count - 1 do
  begin
    if Pos(Edit.Text, Strings[i]) = 1 then
    begin
      Result := i;
      Exit;
    end;
  end;
end;

var
  iLen:Integer;
  iPos:Integer;
begin

  if Assigned(Edit) and Assigned(Strings) then
  begin
    iPos:=FindPos;
    if iPos > -1  then
    begin
      iLen:=Length( Edit.Text );
      Edit.Text:=Strings[iPos];
      Edit.SelStart:=iLen;
      Edit.SelLength:=Length(Edit.Text) - iLen;
    end;
  end;
end;



function ResolveToSave(const CB:TComboBox):Boolean;
var
 Text:string;
begin
  Result:=False;
  Text:=Trim(CB.Text);
  if Length(Text) > 0 then
    if CB.Items.IndexOf(Text) = -1 then
    begin
      CB.Items.Add(Text);
      Result:=True;
    end;
end;

procedure SelectAllLV(LV:TListView);
var
  i:Integer;
begin
  if Assigned(LV) then
    if (LV.MultiSelect) then
       for i:=0 to LV.Items.Count - 1 do LV.Items[i].Selected:=True;
end;

function BSTreeNode(Value:String; TV:TTreeView; Node:TTreeNode):TTreeNode;
var
 i, j, k:Integer;
begin
  i:=0;
  j:=Node.Count-1;
  Result:=nil;
  while (abs(i-j) > 1) do
  begin
    k:=Round((i+j) / 2);
    if (Value=Node[k].Text) then
    begin
      Result:=Node[k];
      exit;
    end
    else
      if (Value < Node[k].Text) then
        j:=k
      else
        i:=k;
  end;
end;

function BSTreeNodePath(Path:String; TV:TTreeView; Root:TTreeNode=nil):TTreeNode;
var
  NodeText:String;
  i:Integer;
begin
  if Root = nil then Root:=TV.TopItem;
  Result:=Root;
  repeat
    i:=Pos('\', Path);
    if i > 0 then dec(i);
    if (Length(Path) > 0) and (i=0) then
      i:=Length(Path)
    else
      break;
    NodeText:=Copy(Path, 1, i);
    Delete(Path, 1, i);
    Result:=BSTreeNode(NodeText, TV, Result);
    if Result = nil then exit;
  until (i=0);
end;

end.
