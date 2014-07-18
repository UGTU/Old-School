unit uPhotoBooth;

interface

uses Windows, Classes, SysUtils, Graphics, ProcessUtils, jpeg, Controls, StdCtrls, ExtCtrls, ShlObj;

const ccipath = '\utils\cci\cci.exe';
      filepath = '\StudentPhoto\';
      defname = 'noname';

type
TPhotoBooth = class
private
  FProcess : TProcessHelper;
  FCurrentImage : TJPEGImage;
  FWorkingDir: string;
  FCurrentPath:string;
  FImgView:TImage;
  FPhotographedName : string;
  FSaveToPath:string;

  procedure OnProcessExit(Sender :TObject; Code : DWORD);
  function GetPathForShot:string;

public
  constructor Create(PhotographedName:string; workingDir:string); overload;
  constructor Create(PhotographedName:string; workingDir:string; ImgView:TImage);overload;

  function MakePhoto:TGraphic;

  property FileName: string read GetPathForShot;

end;

implementation


function GetMyDoc : string;
var
  SpecialDir: PItemIdList;
begin
    SetLength(result, MAX_PATH);

    SHGetSpecialFolderLocation(0, CSIDL_PERSONAL, SpecialDir);

    SHGetPathFromIDList(SpecialDir, PChar(Result));

    SetLength(result, lStrLen(PChar(Result)));

end;

{ PhotoBooth }

constructor TPhotoBooth.Create(PhotographedName: string; workingDir:string);
begin
   if PhotographedName<>'' then
   FPhotographedName:=PhotographedName else
   FPhotographedName:=defname;

   FWorkingDir := workingDir;
   FImgView:=nil;
   FSaveToPath:=GetMyDoc+filepath;

   if not DirectoryExists(FSaveToPath) then
   Createdir(FSaveToPath);

end;

constructor TPhotoBooth.Create(PhotographedName: string; workingDir:string; ImgView: TImage);
begin
   Create(PhotographedName, workingDir);
   FImgView:=ImgView;
end;

function TPhotoBooth.GetPathForShot: string;
var fname:string;
    num:integer;
begin
   num:=0;
   fname:=FSaveToPath+FPhotographedName+'.jpg';

   while FileExists(fname) do
   begin
   fname:=FSaveToPath+FPhotographedName+inttostr(num)+'.jpg';
   inc(num);
   end;

   result:= fname;
end;

function TPhotoBooth.MakePhoto: TGraphic;
begin
  FCurrentPath := GetPathForShot;

  FProcess := TProcessHelper.Create(Format('"%s" "%s" "%s"', [FWorkingDir+ccipath, FCurrentPath, FPhotographedName]));
  FProcess.OnProcessExit := OnProcessExit;
  FProcess.Start;
end;


procedure TPhotoBooth.OnProcessExit(Sender: TObject; Code: DWORD);
begin
if FImgView<>nil then
    FImgView.Picture.Assign(nil);

  if (Code = 0) then
  begin
    FCurrentImage := TJPEGImage.Create;
    FCurrentImage.LoadFromFile(FCurrentPath);
    if FImgView<>nil then
    FImgView.Picture.Assign(FCurrentImage);
  end;
  FProcess.Free;
  FProcess := nil;
  self.Free;
end;

end.
