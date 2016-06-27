unit uPhotosExportController;

interface

uses System.Generics.Collections, ADODB, DB, VCL.Graphics, jpeg;

const BankCode = '001000';
const LogoPath = '';

type
  TPhotosExportController = class(TObject)
  protected
    FLogo:TGraphic;
    constructor Create;
    procedure ExportStud4Bank(id:integer);

  public

    // Instance - возвращает единственныйэкземпл€р данного контроллера
    class function Instance: TPhotosExportController;

    // --------------------------работа с фото----------------------------
    procedure Export4Bank(ds:TDataset);
  end;

implementation

var
  inst: TPhotosExportController = nil;


constructor TPhotosExportController.Create;
begin
//получаем картинку с лого и сохран€ем в поле FLogo
end;

procedure TPhotosExportController.Export4Bank(ds: TDataset; path:string);
var ph:TGraphic;
i:integer;
begin
    ph := TJPEGImage.Create;
    ds.First();

    while not ds.Eof do
    begin
    ExportStud4Bank(ds.FieldByName('nnabit').Value);
    ds.Next;
    end;
end;

procedure TPhotosExportController.ExportStud4Bank(id: integer);
begin
//получаем по id студента: серию и номер паспорта, стрим фото
//стрим превращаем в картинку

//сохран€ем картинку с лого в файл LI_<SSSS>_<NNNNNN>_<BBBFFF>.jpg
//сохран€ем картинку с фото в файл FI_<SSSS>_<NNNNNN>_<BBBFFF>.jpg

end;

class function TPhotosExportController.Instance: TPhotosExportController;
begin
  if inst=nil then inst := TPhotosExportController.Create;
  Result := inst;
end;



end.
