unit uPhotosExportController;

interface

uses System.Generics.Collections, classes, ADODB, DB, VCL.Graphics, jpeg, uDMStudentSelectionProcs;

const BankCode = '001000';
const LogoPath = 'Reports\LI.jpg';

type
  TPhotosExportController = class(TObject)
  protected
    FLogo:TGraphic;
    FPath:string;
    constructor Create;
    procedure ExportStud4Bank(id:integer);

  public

    // Instance - возвращает единственныйэкземпл€р данного контроллера
    class function Instance: TPhotosExportController;

    // --------------------------работа с фото----------------------------
    procedure Export4Bank(ds:TDataset; path:string);
  end;

implementation

var
  inst: TPhotosExportController = nil;


constructor TPhotosExportController.Create;
begin

FLogo := TJPEGImage.Create;
FLogo.LoadFromFile(LogoPath);
end;

procedure TPhotosExportController.Export4Bank(ds: TDataset; path:string);
var ph:TGraphic;
begin

    FPath:= path;
    ds.Open;
    ds.First();

    while not ds.Eof do
    begin
    ExportStud4Bank(ds.FieldByName('nCode').Value);
    ds.Next;
    end;
end;

procedure TPhotosExportController.ExportStud4Bank(id: integer);
var lfname, pfname, num, ser:string;
photo:TGraphic;
phstream:Tmemorystream;
begin

with dmStudentSelectionProcs.aspSelStudPhotoAndPassport do
  begin
    Active := false;
    Parameters.Clear;
    Parameters.AddParameter;
    Parameters[0].Value := id;
    ExecProc;
    Active := true;
    Open;
  end;

  //получаем по id студента: серию и номер паспорта, стрим фото
  photo:=TJPEGImage.Create;
  phstream:=TMemoryStream.Create;

  if (dmStudentSelectionProcs.aspSelStudPhotoAndPassport.RecordCount>0) then
  begin

  (dmStudentSelectionProcs.aspSelStudPhotoAndPassport.FieldbyName('Photo')as TBlobField).SaveToStream(phstream);

  //стрим превращаем в картинку
  photo.LoadFromStream(phstream);

  ser:=dmStudentSelectionProcs.aspSelStudPhotoAndPassport.FieldbyName('cd_Seria').Value;
  num:=dmStudentSelectionProcs.aspSelStudPhotoAndPassport.FieldbyName('np_Number').Value;

  //сохран€ем картинку с лого в файл LI_<SSSS>_<NNNNNN>_<BBBFFF>.jpg
      FLogo.SaveToFile(FPath+'\LI_'+ser+'_'+num+'_'+BankCode+'.jpg');

  //сохран€ем картинку с фото в файл FI_<SSSS>_<NNNNNN>_<BBBFFF>.jpg
      photo.SaveToFile(FPath+'\FI_'+ser+'_'+num+'_'+BankCode+'.jpg');
  end;
end;

class function TPhotosExportController.Instance: TPhotosExportController;
begin
  if inst=nil then inst := TPhotosExportController.Create;
  Result := inst;

end;



end.
