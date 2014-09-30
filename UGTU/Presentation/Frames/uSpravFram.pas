unit uSpravFram;
   {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, DBClient, Provider, DB, ADODB, Grids, DBGridEh,
  ExtCtrls, DBCtrls, StdCtrls, ImgList, ComCtrls, ToolWin, Buttons,
  ActnList, Menus, GridsEh, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, System.Actions, DBAxisGridsEh;

type
  TfmSprav = class(TfmBase)
    Label1: TLabel;
    cbSprav: TComboBox;
    DBNavigator1: TDBNavigator;
    gSprav: TDBGridEh;
    dsSprav: TDataSource;
    Sprav: TADOTable;
    tSpravList: TADOTable;
    dsSpravList: TDataSource;
    prvSprav: TDataSetProvider;
    cdsSprav: TClientDataSet;
    dsDopSprav: TDataSource;
    tDopSprav: TADOQuery;
    ToolBar1: TToolBar;
    dsDopSprav2: TDataSource;
    tDopSprav2: TADOQuery;
    pmMenu: TPopupMenu;
    ActionList1: TActionList;
    aCancel: TAction;
    aSave: TAction;
    aNext: TAction;
    aInsert: TAction;
    aDel: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    btnSprav: TBitBtn;
    aOpenSprav: TAction;
    aLast: TAction;
    aFirst: TAction;
    aPred: TAction;
    aClose: TAction;
    BitBtn1: TBitBtn;
    tSprav: TADOQuery;
    actCangeSortType: TAction;
    btnCangeSortType: TToolButton;
    btnDel: TToolButton;
    btnSave: TToolButton;
    btnCansel: TToolButton;
    ToolButton1: TToolButton;
    procedure cbSpravChange(Sender: TObject);
    procedure cdsSpravBeforePost(DataSet: TDataSet);
    procedure gSpravKeyPress(Sender: TObject; var Key: Char);
    procedure cdsSpravAfterScroll(DataSet: TDataSet);
    procedure gSpravColExit(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aInsertExecute(Sender: TObject);
    constructor CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection);override;
    procedure aOpenSpravExecute(Sender: TObject);
    procedure aNextExecute(Sender: TObject);
    procedure aLastExecute(Sender: TObject);
    procedure aFirstExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aPredExecute(Sender: TObject);
    procedure actCangeSortTypeExecute(Sender: TObject);
    procedure actCangeSortTypeUpdate(Sender: TObject);
  protected
     function DoApply: Boolean; override;
     procedure DoCancel; override;
     procedure DoRefreshFrame;override;
     procedure DoList;
     procedure ChangeSprav;
     procedure LoadPickList(num:integer;  Query: TADOQuery; FieldName: string);
     //GetSortFieldNumber возвращает номер поля,
     //начиная с которого нужно сортировать справочник
     function GetSortFieldNumber:integer;
     //GetSortString возвращает строку сортировки справочника
     function GetSortString:string;
     //SortSprav сортирует справочник
     procedure SortSprav();

     function SetNext(var str:string):string;
     procedure OpenDopSprav(Query: TADOQuery;TabName: string);
     //ClearZavTabList очищает список ссылочных таблиц
     procedure ClearZavTabList;
     //формирует список ссылочных таблиц
     procedure DoColKey(tbl:string; key:string; name:string;var count:integer);
     procedure UpdatePickList(num: integer);
  end;

  Type TZavTab=record
                     TbName: string;      //имя таблицы
                     prkey: string;       //загружаемые данные
                     SpravName: string;   //название справочника
                     value:string;        //текущее значение
                     ZavTbNum: integer;   //название зависимой таблицы
                  end;

var
  fmSprav: TfmSprav;
  ZavTab:array of TZavTab;
  flexit:boolean;
  hierSort:boolean; //флаг:сортировка по иерархии или нет
  keyCol:integer;
  tabKeycol:integer;   //кол-во внешних ключей, включенных в представление (каждого по 2)

implementation

uses uMain, uSpravForm;

{$R *.dfm}
var
  frmSprav: TfrmSprav;


constructor TfmSprav.CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection);
begin
  inherited;
  try
  frmSprav:=nil;
  {btnSave.Caption:='';
  btnCansel.Caption:='';
  btnDel.Caption:='';}
  Connection:=AConn;
  Modified:=false;
  aSave.Enabled:=false;
  aCancel.Enabled:=false;
  tSprav.Connection:=Connection;
  tDopSprav.Connection:=Connection;
  tDopSprav2.Connection:=Connection;
  tSpravList.Connection:=Connection;
  flexit:=false;
  hierSort:= true;
  //загружаем список справочников
  tSpravList.TableName:='Sprav';
  tSpravList.Active:=true;
  tSpravList.First;
  while not   tSpravList.Eof do
  begin
    if tSpravList.FieldByName('Visible').AsBoolean then
      cbSprav.Items.Add(tSpravList.FieldByName('SpravName').AsString);
    tSpravList.Next;
  end;
  cbSprav.ItemIndex:=0;
  ChangeSprav;
  except
     ShowMessage('CreateFrame');
  end;
end;


//непосредственно вызов сохранения
function TfmSprav.DoApply: Boolean;
begin
  Result := true;
  //пересылаем данные на сервер
  try
    cdsSprav.ApplyUpdates(-1);//(-1);
  except
    MessageBox(Handle, 'Данные некорректны. Сохранение отменено.','ИС "УГТУ"',MB_OK);
   end;
   modified:=false;
   aSave.Enabled:=false;
   aCancel.Enabled:=false;

end;

//отмена изменений
procedure TfmSprav.DoCancel;
begin
      //отменяем все изменения и загружаем данные заново
   cdsSprav.Data:=prvSprav.Data;
   Modified:=false;
   aSave.Enabled:=false;
   aCancel.Enabled:=false;
   tSprav.Close;
   tSprav.Open;
   DoList;
end;

procedure TfmSprav.DoRefreshFrame;
begin
  ChangeSprav;
end;

function TfmSprav.SetNext(var str:string):string;
var k:integer;
    res:string;
begin
   k:=pos(',',str);
   if (k>0) then
   begin
      res:=copy(str,1,k-1);
      delete(str,1,k);
   end
   else
   begin
      res:=str;
      str:='';
   end;
   result:=res;
end;

//процедура настройки свойств таблицы
procedure TfmSprav.DoColKey(tbl:string; key:string; name:string;var count:integer);
var i:integer;
    stt,stk:string;
begin
   stt:=tbl;
   stk:=key;
   if ((tbl<>'') and (key<>'')) then
   begin
      i:=count+1;
      repeat
        //определяем наименование ссылочного справочника
         ZavTab[i].SpravName:=SetNext(name);
        //определяем название ссылочной таблицы
         ZavTab[i].TbName:=SetNext(tbl);
        //определяем название загружаемого поля ссылочной таблицы
         ZavTab[i].prkey:= SetNext(key);
       //позиционируемся на "ccылочном" справочнике
         if tSpravList.Locate('SpravName',ZavTab[i].SpravName,[loPartialKey]) then
         begin
       //и опредеяем его ссылочную таблицу
            if ((tSpravList.FieldByName('CTableVn').Value<>null) and
               (tSpravList.FieldByName('CPrKey').Value<>null)) then
            begin //начинаем рекурсию
            //оставляем ссылку на зависимый столбец
               ZavTab[i+1].ZavTbNum:=i;
                  DoColKey(tSpravList.FieldByName('CTableVn').AsString,
                           tSpravList.FieldByName('CPrKey').AsString,
                           tSpravList.FieldByName('TableVnName').AsString,
                           i);
            end
            else
              TabKeycol:=TabKeycol+1;
          end
          else
            TabKeycol:=TabKeycol+1;
         i:=i+1;
      until (tbl='') or (key='');
   end;

end;

procedure TfmSprav.OpenDopSprav(Query: TADOQuery;TabName: string);
begin
   Query.Close;
   Query.Filter:='';
   Query.Filtered:=false;
   Query.SQL.Clear;
   Query.SQL.Add('select * from ');
   Query.SQL.Add(TabName);
   Query.SQL.Add(' order by 2');

end;

//роцедура загружает в PickList список значений
procedure TfmSprav.LoadPickList (num:integer; Query: TADOQuery; FieldName: string);
begin
  try
   Query.First;
   gSprav.Columns.Items[num].PickList.Clear;
   while not  Query.Eof do
   begin
      gSprav.Columns.Items[num].PickList.Add(Query.FieldByName(FieldName).AsString);
      Query.Next;
   end;
  except
     ShowMessage('LoadPickList');
  end;
end;

//возвращает номер поля,
//начиная с которого нужно сортировать справочник
function TfmSprav.GetSortFieldNumber:integer;
var  k:integer;
begin
    tSpravList.Locate('SpravName', cbSprav.Text,[loPartialKey]);//.Seek(cbSprav.Text);
    //
	  tSprav.Open;
	  //сортируем справочник по всем "видимым" полям
	  if tSpravList.FieldByName('TabCount').AsString='' then
    begin
  	  result:= 0;
      exit;
    end;
    //если сортируем по иерархии
    if hierSort then
    begin
				k:=2*tabKeycol;
		  if (k>(tSprav.FieldCount-2)) then
			k:=2;
    end
    else
    begin
				k:=tSprav.FieldCount-2;
        //исключения
      if (tSpravList.FieldByName('cSprav').AsString='PGorod') or
         (tSpravList.FieldByName('cSprav').AsString='PRoom')  then
        k:=tSprav.FieldCount-3;
    end;


	  {//сортировка для учеб. завед. отдельная
	  if tSpravList.FieldByName('cSprav').AsString='PZaved' then
		k:=tSprav.FieldCount-2; }
    result:= k;
end;


//возвращает строку сортировки справочника
function TfmSprav.GetSortString:string;
var i, k:integer;
  str:string;
begin
  try
	  str:='';
    k:= GetSortFieldNumber;
	  for i:=k+1 to tSprav.FieldCount-1 do
	  begin
		if str='' then
		  str:='ORDER BY '
		else str:=str+',';
		str:=str+'['+tSprav.Fields.Fields[i].FieldName+']';
	  end;
	  result:= str;
  except
    MessageBox(Handle, 'Произошла ошибка при настройке параметров сортировки справочника.','ИС "УГТУ"',MB_OK);
  end;
end;

//сортирует справочник
procedure TfmSprav.SortSprav();
begin
  cdsSprav.Close;
  tSprav.Close;
  tSprav.SQL.Add('');
  if  tSprav.SQL.Text.IndexOf('ORDER') < 0  then
 // if tSprav.SQL.Strings[2] = '' then
       tSprav.SQL.Add(GetSortString);
  //tSprav.SQL.Strings[1]:=GetSortString;

  tSprav.Open;

  cdsSprav.Open;

end;

//очищает список ссылочных таблиц
procedure TfmSprav.ClearZavTabList;
var k:integer;
begin
  tabkeyCol:=0;
  keyCol:=tSpravList.FieldByName('TabCount').AsInteger;
  SetLength(ZavTab,keyCol+1);
  for k:=0 to keyCol do
  begin
     ZavTab[k].ZavTbNum:=-1;
     ZavTab[k].TbName:='';
     ZavTab[k].prkey:='';
     ZavTab[k].SpravName:='';
     ZavTab[k].value:='';
  end;
end;

//процедура настройки свойств таблицы
procedure TfmSprav.DoList;
var i,j,k:integer;
  str:string;
begin
   try  //сортируем справочник
	   tSpravList.Locate('SpravName', cbSprav.Text,[loPartialKey]);
     i:=-1;
	   if ((tSpravList.FieldByName('CTableVn').Value<>null) and
		   (tSpravList.FieldByName('CPrKey').Value<>null)) then
	   begin
		  //очищаем список ссылочных таблиц
		  ClearZavTabList;
		  //формируем список ссылочных таблиц
		  DoColKey(tSpravList.FieldByName('CTableVn').AsString,
				   tSpravList.FieldByName('CPrKey').AsString,
				   tSpravList.FieldByName('TableVnName').AsString,
				   i);

     end;
     SortSprav;
   except
   on E: Exception do
   begin
      str:='Выбранный справочник отсутствует в системе!' + #10#13 + 'Ошибка: ' + E.Message;
      MessageBox(Handle, PWideChar(str),'ИС "УГТУ"',MB_OK);
      cbSprav.ItemIndex:=1;
      ChangeSprav;
   end;
   end;

   try
	   cdsSprav.Fields[0].Visible:=false; //код невидим
	   //если справочник - ссылающаяся таблица
	   if ((tSpravList.FieldByName('CTableVn').Value<>null) and
		   (tSpravList.FieldByName('CPrKey').Value<>null)) then
	   begin
		  //очищаем список ссылочных таблиц
		  {ClearZavTabList;
		  //формируем список ссылочных таблиц
		  DoColKey(tSpravList.FieldByName('CTableVn').AsString,
				   tSpravList.FieldByName('CPrKey').AsString,
				   tSpravList.FieldByName('TableVnName').AsString,
				   i);}
		  i:=-1;
		  ClearZavTabList;
		  //формируем список ссылочных таблиц
		  DoColKey(tSpravList.FieldByName('CTableVn').AsString,
				   tSpravList.FieldByName('CPrKey').AsString,
				   tSpravList.FieldByName('TableVnName').AsString,
				   i);
		  j:=0;
		  for i:=0 to keyCol-1 do
		  begin
			 if (ZavTab[i].ZavTbNum<0) then
			 begin
				gSprav.Columns.Items[j*2].Visible:=false; //код невидим
				gSprav.Columns.Items[j*2+1].Visible:=false; //код невидим
				j:=j+1;
			 end;
			 k:=TabKeycol*2+i;
			 gSprav.Columns.Items[k].ButtonStyle:=cbsAuto;
	   //загружаем список значений
			 UpdatePickList(k);
		  end;
	   end
	   else
		  if (tSpravList.FieldByName('cSprav').AsString[1]<>'P') or (tSpravList.FieldByName('cSprav').AsString='Predpr') then
		  begin
			 cdsSprav.Fields[1].DisplayLabel:='Список значений';
		  end
		  else  //если в таблице присутствует флаг, делаем его невидимым
			 if (tSpravList.FieldByName('lFlag').Value<>null)  then
				gSprav.Columns.Items[0].Visible:=false;
   except
     MessageBox(Handle, 'Произошла ошибка при настройке свойств справочника.','ИС "УГТУ"',MB_OK);
   end;
end;


//определяем название справочника и загружаем его содержимое
procedure TfmSprav.ChangeSprav;
begin
   try
	   if modified then
	   begin
		  case (MessageBox(Handle, PWideChar('         Сохранить внесенные изменения?'), 'ИС "УГТУ"', MB_YESNOCANCEL)) of
			 IDYES:
				Apply;   //вызов сохранения
			 IDCANCEL:
			 begin
				cbSprav.ItemIndex:= cbSprav.Items.IndexOf(tSpravList.FieldByName('SpravName').AsString);
				exit;
			 end;
		  end;
	   end;
     hierSort:= true;
	   cdsSprav.Close;
	   tSprav.Close;
	   Connection.Open;
	   tSpravList.Open;
	   tSpravList.Locate('SpravName',cbSprav.text,[loPartialKey]);
	   tSprav.SQL.Clear;
	   tSprav.SQL.Add('SELECT * FROM '+tSpravList.FieldByName('cSprav').AsString);
	   keyCol:=0;
	   tabkeyCol:=0;
	   tSprav.Open;
	   if (frmSprav<>nil) then
		  frmSprav.predSprav:=cbSprav.text;
	   DoList;
	   modified:=false;
	   aSave.Enabled:=false;
	   aCancel.Enabled:=false;
	   frmMain.StatusBar1.Panels[2].Text:= 'Выбранный справочник: ' + cbSprav.Text;
   except
     ShowMessage('ChangeSprav');
   end;

end;



procedure TfmSprav.cbSpravChange(Sender: TObject);
begin
  ChangeSprav;
end;

procedure TfmSprav.cdsSpravBeforePost(DataSet: TDataSet);
var i,k,j:integer;
    fields, str:string;
begin
  try
	   //открываем список справочников
	   modified:=true;
	   aSave.Enabled:=true;
	   aCancel.Enabled:=true;
	   tSpravList.Open;
	   tSpravList.Locate('SpravName',cbSprav.text,[loCaseInsensitive]);
	   //если в таблице есть флаг, то присваиваем ему соответствующее значение
	   if (tSpravList.FieldByName('lFlag').Value<>null)  then
	   begin
		  cdsSprav.Edit;
      gSprav.Fields[0].Value:=tSpravList.FieldByName('lFlag').Value;
	   end;
     //если справочник ссылающийся, проверяем значения
     //во всех "lookup" полях
	   if ((tSpravList.FieldByName('CTableVn').Value<>null) and
		   (tSpravList.FieldByName('CPrKey').Value<>null)) then
	   begin
		  j:=0;
		  for i:=0 to keyCol-1 do
		  begin
			 k:=keyCol+TabkeyCol*2-i-1;  //определяем номер столбца
			 gSprav.Fields[k].ReadOnly:=false;
       //если значения нет
			 if (gSprav.Fields[k].AsString='') then
			 begin
         //если от этого поля нет зависимых полей (нет иерархии)
         if (ZavTab[i].ZavTbNum<0) then
				 begin
				   try
					  str:='В поле '''+gSprav.Columns.Items[k].Title.Caption+''' не введено значение ! Операция отменена.';
					  MessageBox(Handle, PWideChar(str),'ИС "УГТУ"',MB_OK);
					  cdsSprav.Cancel;
					  Abort;
					  j:=j+1;
				   except
				   end;
				 end;
				//если на этот столбец есть ссылка у предыдущего
				//очищаем и его
				if (ZavTab[i+1].ZavTbNum=i) then
				begin
				   cdsSprav.Edit;
           gSprav.Fields[k-1].AsString:='';
				end;
			 end
			 else
			 begin  //если значение есть, проверяем его правильность
	 //открываем ссылочную таблицу
				OpenDopSprav(tDopSprav,ZavTab[i].TbName);
				tDopSprav.Open;
				if not tDopSprav.Locate(ZavTab[i].prkey,
				   gSprav.Fields[k].AsString,[loCaseInsensitive]) then
				begin
				  str:='Введенное в поле '''+gSprav.Columns.Items[k].Title.Caption+''' значение '''+gSprav.Fields[k].AsString+
							   ''' отсутствует в справочнике '''+
							   ZavTab[i].SpravName+'''! Операция отменена.';
				  MessageBox(Handle, PWideChar(str),'ИС "УГТУ"',MB_OK);
				   cdsSprav.Cancel;
				   Abort;
				end
				else
				begin
		  //если значение на самом деле изменилось
					  cdsSprav.Edit;
            gSprav.Fields[k].Value:=
							tDopSprav.FieldByName(ZavTab[i].prkey).AsString;
            //если от этого столбца не зависят другие столбцы
            //просто записываем соответствующий ключ
				   if (ZavTab[i].ZavTbNum<0) then
				   begin
            cdsSprav.Edit;
					  gSprav.Fields[2*j+0].Value:=tDopSprav.Fields[0].AsInteger;
					  j:=j+1;
				   end;
			  //если на этот столбец ссылается предыдущий
        //обновляем его значение
				   if (ZavTab[i+1].ZavTbNum=i) then
				   begin
					  OpenDopSprav(tDopSprav2,ZavTab[i+1].TbName);
					  tDopSprav2.Open;
					  fields:=tDopSprav2.Fields[0].FieldName;
					  tDopSprav.Locate(ZavTab[i].prkey,
						 gSprav.Fields[k].AsString,[loCaseInsensitive]);
					  if (tDopSprav.FieldByName(fields).AsInteger>0) then
					  begin
						 tDopSprav2.Locate(fields,
						 tDopSprav.FieldByName(fields).AsInteger,[loCaseInsensitive]);
						 if (tDopSprav2.FieldByName(ZavTab[i+1].prkey).AsString>'') then
						 begin
							gSprav.Fields[k-1].ReadOnly:=false;
              cdsSprav.Edit;
							gSprav.Fields[k-1].AsString:=tDopSprav2.FieldByName(ZavTab[i+1].prkey).AsString;
						 end;
					  end;
				   end;
				end;
			 end;
		  end;
	   end;
  except
     //MessageBox(Handle, 'Произошла ошибка при смене справочника.','ИС "УГТУ"',MB_OK);
  end;

end;

procedure
 TfmSprav.gSpravKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  modified:=true;  //обозначаем, что данные изменены
  aSave.Enabled:=true;
  aCancel.Enabled:=true;
end;


//загружает новый pickList , если он изменился (или пуст)
//num - номер колонки
procedure TfmSprav.UpdatePickList(num: integer);
var i, key:integer;
   namekey, str:string;
begin
    if (num<1) then exit;
   if (gSprav.Columns.Items[num].ButtonStyle<>cbsAuto)  then exit;
   try
   //определяем номер колонки
   //проверяем к - ccылающаяся колонка или нет
      if (num<=TabKeycol*2+Keycol-1) and (num>=TabKeycol*2) then
      begin
         //определяем соответствующий элемент массива
         i:=keyCol-(num-TabKeycol*2)-1;
         //проверяем, есть ли на нёё ссылка в последующем элементе массива
         //и изменилось ли значение соответствующего поля
         if ZavTab[i].TbName='' then
          exit;
         
         OpenDopSprav(tDopSprav,ZavTab[i].TbName);
         tDopSprav.Open;
         if  flexit and (gSprav.Fields[num].AsString<>'') and
            (not tDopSprav.Locate(ZavTab[i].prkey,gSprav.Fields[num].AsString,
            [loCaseInsensitive])) then
         begin
            str:='Введенное в поле '''+gSprav.Columns.Items[num].Title.Caption+''' значение '''+gSprav.Fields[num].AsString+
                           ''' отсутствует в справочнике '''+
                           ZavTab[i].SpravName+'''! Будет возвращено прежнее значение.';
            MessageBox(Handle, PWideChar(str),'ИС "УГТУ"',MB_OK);
            cdsSprav.Edit;
            if (tSprav.Locate(cdsSprav.Fields[0].FieldName,
                  cdsSprav.Fields[0].Value,[loCaseInsensitive]))
                  then
            begin
               gSprav.Fields[num].AsString:=tSprav.Fields[num+1].AsString;
            end
            else
               gSprav.Fields[num].AsString:='';
         end;

         if (ZavTab[i+1].ZavTbNum=i) and (ZavTab[i+1].ZavTbNum>-1)
            and (ZavTab[i+1].value<>gSprav.Fields[num-1].AsString) then
         begin
            //откываем ссылочную таблицу (определим ключ для фильтрации)
               ZavTab[i+1].value:=gSprav.Fields[num-1].AsString;
               OpenDopSprav(tDopSprav,ZavTab[i+1].TbName);
               tDopSprav.Open;
               tDopSprav.Locate(ZavTab[i+1].prkey,
                  gSprav.Fields[num-1].AsString,[loCaseInsensitive]);
               key:=tDopSprav.Fields[0].AsInteger;
               namekey:=tDopSprav.Fields[0].FieldName;
             //открываем ссылающуюся таблицу
               OpenDopSprav(tDopSprav,ZavTab[i].TbName);
            if (gSprav.Fields[num-1].AsString<>'') then
            begin
               tDopSprav.Filter:=namekey+'='+inttostr(key);
               tDopSprav.Filtered:=true;
               gSprav.Fields[num].ReadOnly:=false;
             end
             else
             begin

                if (ZavTab[i].ZavTbNum=i-1) and (i>0) then
                begin
                  tDopSprav.Filter:=namekey+'=0';
                  tDopSprav.Filtered:=true;
                  if flexit and (gSprav.Fields[num].AsString<>'') then
                     gSprav.Fields[num].AsString:='';
                  gSprav.Columns.Items[num].PickList.Clear;
                   gSprav.Fields[num].ReadOnly:=true;
                  exit;
                end
                else
                begin
                  tDopSprav.Filter:='';
                  tDopSprav.Filtered:=false;
                  gSprav.Fields[num].ReadOnly:=false;
                end;
             end;
            tDopSprav.Open;
            LoadPickList(num, tDopSprav, ZavTab[i].prkey);
            //проверяем соответствует ли настоящее значение
            //новому pickList-у
            if (not flexit) then exit;
            if (gSprav.Columns.Items[num].PickList.Capacity=0) then
            begin
               if (gSprav.Fields[num].AsString<>'') then
                  gSprav.Fields[num].Value:='';
               gSprav.Fields[num].ReadOnly:=true;
               exit;
            end;

            key:=gSprav.Columns.Items[num].PickList.IndexOf(gSprav.Fields[num].AsString);
            if (key<0)
               and (gSprav.Fields[num].AsString<>'') then
            begin
               namekey:=gSprav.Columns.Items[num].PickList.Strings[0];
               gSprav.Fields[num].AsString:=namekey;
            end ;

            if (key>-1)
               and (gSprav.Fields[num].AsString<>'') then
            begin
               gSprav.Fields[num].AsString:=
                  gSprav.Columns.Items[num].PickList.Strings[key];
            end ;

            exit;
         end;

         if (ZavTab[i+1].ZavTbNum<>i)
            and (ZavTab[i+1].value='') then
         begin
            //откpываем ссылочную таблицу (определим ключ для фильтрации)
            ZavTab[i+1].value:='all';
            OpenDopSprav(tDopSprav,ZavTab[i].TbName);
         //открываем ссылочную таблицу
            tDopSprav.Open;
            LoadPickList(num, tDopSprav, ZavTab[i].prkey);
         end;

      end;
   except

   end;

end;

procedure TfmSprav.cdsSpravAfterScroll(DataSet: TDataSet);
var i:integer;
begin
  inherited;
  try
  //пройдемся по всем ссылающимся столбцам
      for i:=tabkeyCol*2 to tabkeyCol*2+keyCol do
      begin
   //загружаем список значений
         UpdatePickList(i);
      end;
  except

  end;

end;

procedure TfmSprav.gSpravColExit(Sender: TObject);
var i:integer;
begin
  inherited;
  flexit:=true;
  if (keyCol<1) then exit;
  //пройдемся по всем ссылающимся столбцам
  for i:=TabkeyCol*2 to TabkeyCol*2+keyCol-1 do
  begin
   //загружаем список значений
      UpdatePickList(i);
   end;

   flexit:=false;
end;


procedure TfmSprav.aCancelExecute(Sender: TObject);
begin
  inherited;
  Cancel;
end;

procedure TfmSprav.aDelExecute(Sender: TObject);
begin
  inherited;
  if (MessageBox(Handle, '           Удалить запись?','ИС "УГТУ"',
          MB_YESNO) = IDYES) then
  begin
    try
      modified:=true;
      aSave.Enabled:=true;
      aCancel.Enabled:=true;
      cdsSprav.Edit;
      cdsSprav.Delete;
    except
      MessageBox(Handle, 'Произошла ошибка при удалении записи.','ИС "УГТУ"',
          MB_OK);

    end;
  end;
end;

procedure TfmSprav.aSaveExecute(Sender: TObject);
begin
  inherited;
   if modified then
          Apply;   //вызов сохранения
  tSprav.Close;
  cdsSprav.Close;
  DoList;
end;

procedure TfmSprav.aInsertExecute(Sender: TObject);
begin
  inherited;
  try
    cdsSprav.Edit;
    cdsSprav.Insert;
    modified:=true;
    aSave.Enabled:=true;
    aCancel.Enabled:=true;
  except
    MessageBox(Handle, 'Произошла ошибка при добавлении записи.','ИС "УГТУ"',
          MB_OK);
  end;
end;

procedure TfmSprav.aOpenSpravExecute(Sender: TObject);
var i:integer;
begin
  try
	  if frmSprav=nil then
		frmSprav:=TfrmSprav.Create(self);
	  frmSprav.Connection:=Connection;
	  frmSprav.predSprav:=cbSprav.text;

	  frmSprav.ShowModal;
	  for i:=0 to keyCol-1 do
		if (ZavTab[i+1].ZavTbNum<>i) or (ZavTab[i].ZavTbNum = -1) then
			 begin
				//откываем ссылочную таблицу (определим ключ для фильтрации)
				ZavTab[i+1].value:='all';
				OpenDopSprav(tDopSprav,ZavTab[i].TbName);
			 //открываем ссылочную таблицу
				tDopSprav.Open;
				LoadPickList(keyCol-i+TabKeycol*2-1, tDopSprav, ZavTab[i].prkey);
			 end;
	  cdsSprav.AfterScroll(nil);
  except
        MessageBox(Handle, 'Произошла ошибка при попытке открыть справочники в новом окне.','ИС "УГТУ"',
          MB_OK);
  end;

end;

procedure TfmSprav.aNextExecute(Sender: TObject);
begin
  inherited;
  try
    cdsSprav.Next;
  except
  end;
end;

procedure TfmSprav.aLastExecute(Sender: TObject);
begin
  inherited;
  try
    cdsSprav.Last;
  except
  end;
end;

procedure TfmSprav.aFirstExecute(Sender: TObject);
begin
  inherited;
  try
    cdsSprav.First;
  except
  end;
end;

procedure TfmSprav.aCloseExecute(Sender: TObject);
begin
  inherited;
   if modified then
   begin
      if (MessageBox(Handle, 'Сохранить внесенные изменения?','ИС "УГТУ"',
          MB_YESNO) = IDYES) then
          Apply;   //вызов сохранения
   end;

end;

procedure TfmSprav.actCangeSortTypeExecute(Sender: TObject);
begin
  inherited;                
  hierSort:= not hierSort;
  DoList;
end;

procedure TfmSprav.actCangeSortTypeUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:=(not Modified) and
    (keyCol>0);

end;

procedure TfmSprav.aPredExecute(Sender: TObject);
begin
  inherited;
  try
    cdsSprav.Prior;
  except
  end;
end;

end.
