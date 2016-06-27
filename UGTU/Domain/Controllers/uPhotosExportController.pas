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

    // Instance - ���������� ��������������������� ������� �����������
    class function Instance: TPhotosExportController;

    // --------------------------������ � ����----------------------------
    procedure Export4Bank(ds:TDataset);
  end;

implementation

var
  inst: TPhotosExportController = nil;


constructor TPhotosExportController.Create;
begin
//�������� �������� � ���� � ��������� � ���� FLogo
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
//�������� �� id ��������: ����� � ����� ��������, ����� ����
//����� ���������� � ��������

//��������� �������� � ���� � ���� LI_<SSSS>_<NNNNNN>_<BBBFFF>.jpg
//��������� �������� � ���� � ���� FI_<SSSS>_<NNNNNN>_<BBBFFF>.jpg

end;

class function TPhotosExportController.Instance: TPhotosExportController;
begin
  if inst=nil then inst := TPhotosExportController.Create;
  Result := inst;
end;



end.
