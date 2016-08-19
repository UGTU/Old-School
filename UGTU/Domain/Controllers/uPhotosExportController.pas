unit uPhotosExportController;

interface

uses Forms, SysUtils, dialogs, System.Generics.Collections, classes, ADODB, DB, VCL.Graphics, JPEG, uDMStudentSelectionProcs;

const BankCode = '001000';
const LogoPath = 'Reports\LI.jpg';
const BigLogoPath = 'Reports\FC.jpg';
const TargetWidth = 202;
const TargetHeight = 275;

type
TRGBTriple = packed record
  rgbtBlue: Byte;
  rgbtGreen: Byte;
  rgbtRed: Byte;
end;

  TRGBArray = array[Word] of TRGBTriple;
  pRGBArray = ^TRGBArray;

  TPhotosExportController = class(TObject)
  protected
    FLogo:TGraphic;
    FBigLogo:TGraphic;
    FPath:string;
    constructor Create;
    procedure ExportStud4Bank(id:integer);

  public

    // Instance - ���������� ��������������������� ������� �����������
    class function Instance: TPhotosExportController;

    // --------------------------������ � ����----------------------------
    procedure Export4Bank(ds:TDataset; path:string);
  end;

implementation

var
  inst: TPhotosExportController = nil;


constructor TPhotosExportController.Create;
begin

FLogo := TJPEGImage.Create;
FLogo.LoadFromFile(ExtractFilePath(Application.ExeName)+LogoPath);

FBigLogo := TJPEGImage.Create;
FBigLogo.LoadFromFile(ExtractFilePath(Application.ExeName)+BigLogoPath);
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

    ShowMessage('��� ��������� ���������� �������������� � ���������� '+FPath);
end;

procedure TPhotosExportController.ExportStud4Bank(id: integer);
var lfname, pfname, num, ser:string;
photo:TGraphic;
phstream:TStream;
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

  //�������� �� id ��������: ����� � ����� ��������, ����� ����
  photo:=TJPEGImage.Create;
  phstream:=TStream.Create;

  if (dmStudentSelectionProcs.aspSelStudPhotoAndPassport.RecordCount>0) then
  if ((dmStudentSelectionProcs.aspSelStudPhotoAndPassport.FieldbyName('Photo') as TBlobField).Value<>nil) then
  begin

  if (dmStudentSelectionProcs.aspSelStudPhotoAndPassport.FieldbyName('ik_grazd').Value=2) then
    ser:=dmStudentSelectionProcs.aspSelStudPhotoAndPassport.FieldbyName('cd_Seria').Value else
    ser:='0000';
  num:=dmStudentSelectionProcs.aspSelStudPhotoAndPassport.FieldbyName('np_Number').Value;

  //��������� �������� � ���� � ���� LI_<SSSS>_<NNNNNN>_<BBBFFF>.jpg
      FLogo.SaveToFile(FPath+'\LI_'+ser+'_'+num+'_'+BankCode+'.jpg');

  //��������� �������� � ���� � ���� FI_<SSSS>_<NNNNNN>_<BBBFFF>.jpg
      (dmStudentSelectionProcs.aspSelStudPhotoAndPassport.FieldbyName('Photo')as TBlobField).SaveToFile(FPath+'\FI_'+ser+'_'+num+'_'+BankCode+'.jpg');

  end
  else
  begin
  if (dmStudentSelectionProcs.aspSelStudPhotoAndPassport.FieldbyName('ik_grazd').Value=2) then
    ser:=dmStudentSelectionProcs.aspSelStudPhotoAndPassport.FieldbyName('cd_Seria').Value else
    ser:='0000';

    num:=dmStudentSelectionProcs.aspSelStudPhotoAndPassport.FieldbyName('np_Number').Value;
      FBigLogo.SaveToFile(FPath+'\FC_'+ser+'_'+num+'_'+BankCode+'.jpg');
  end;

end;





class function TPhotosExportController.Instance: TPhotosExportController;
begin
  if inst=nil then inst := TPhotosExportController.Create;
  Result := inst;

end;



end.
