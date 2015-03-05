{ -----------------------------------------------------------
  ������ uUspevGroupController:
  uUspevGroupController - ���������� ����������
  "��������" - ������������ ������
  ���� ��������: 09.02.2008
  ���� ���������� ���������:
  �����������: ������� �.�.
  ----------------------------------------------------------- }
unit uUspevGroupController;

{ #Author tanyav@ist.ugtu.net }
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, GeneralController, Grids,
  ExcelXP, ComObj, DBGrids, uDMUspevaemost, ComCtrls, DateUtils,
  udmUgtuStructure, DBGridEh, ApplicationController, ExceptionBase, ReportsBase,
  D_VedomostBRS,
  D_VedomostBRSLast, D_BRSAllModules, D_BRSExamVedomost, D_BRSRankReport,
  D_BRSRankAverageReport,
  Vedomost2014, Assemly_Report2014, Spravka, SpravkaReport2014, Spravka2014,
  CommandController;

type
  PDBGrid = ^TDBGridEh;
  TVedType = (exam, zach, KP, KR);

  TUspevGroupController = class(TObject)
  private
    FVedomostController: TVedomostController;
    FBRSVedomostController: TBRSVedomostController;
    FNapravController: TNapravController;
    function GetVedomostController: TVedomostController;
    procedure SetActiveStudent(const StudGrupIK: integer);
  protected
    constructor CreateInstance;
    // AccessInstance ������������� ������ � ���������� �����������
    class function AccessInstance(Request: Integer): TUspevGroupController;
    constructor Create;
    destructor Destroy; override;

  public

    // Instance - ���������� �������� ������� �����������
    class function Instance: TUspevGroupController;
    // ReleaseInstance - ���������� ����������
    class procedure ReleaseInstance;

    // *********��������������� ������������*********************

    // **********************����������**************************
    // ��������� �������� ��� ������ ��� ������ �� ��������� ����������
    procedure SelectAtt(ikVed: Integer; IsBRS: boolean);

    // ��������� �������� ��� ������ ��� ������ �� ��������� � ��������� ���
    procedure SelectBRSExam(ikVed: Integer);

    // ������� �������� ��� ��������� �������� ���������� � ���������� �� ����������
    function GetCreatedBRS(ik_grup, nsem, nomer_att: Integer): Integer;

    // ������� �������� ��� ��������� �������� ��������� ��� � ���������� �� ����������
    function GetAllBRSExam(ik_grup, nsem: Integer): Integer;

    // ������� �������� ��� �������� ���������� �� �������� ����� � ���������� �� ����������
    function GetBRSCount(ik_grup, nsem, nmodule: Integer): Integer;
    function GetBRSExamVidZan(ik_grup, nsem: Integer): Integer;

    // ������� ��������� ������� ��������� ��������� ��� ����������
    function CheckAttsExist(ikGroup, nsem, nVed { , ikVidZan } ,
      ikPredm: Integer; IsBRS: boolean): boolean;

    // ������� ��������� ������� ��������� ��������� ��� ����������
    function CheckBRSExamExist(ik_grup, nsem, ikVidZan,
      ikPredm: Integer): boolean;

    // ������� ������� ��� ��������� ����������
    function CreateAllBRS(ik_group, nsem, numMod: Integer): boolean;

    // ������� ������� ��� ��������� ��������� ���
    function CreateAllBRSExam(ik_grup, nsem: Integer): boolean;

    // ������� ������ ������ ��� ������ �� ��������� ����������
    function SelAtt(nsem, ikPredm, ikVidZan, ik_grup, nom_ved: Integer)
      : boolean;

    // ������� ������ ������ ��� ������ �� ��������� ��� ��������
    function SelBRSExam(nsem, ikPredm, ikVidZan, ik_grup: Integer): boolean;

    // ��������� ���������� ���������� � ��������
    function SaveAtt(ikVed: Integer; dbgrdAtt: PDBGrid): boolean;

    function SaveBRSAtt(ikVed: Integer; dbgrdBRSAtt: TDBGridEh; i_tab: string;
      date: TDateTime): boolean;

    function SaveBRSExam(ikVed: Integer; dbgrdBRSExam: TDBGridEh; i_tab: string;
      date: TDateTime): boolean;

    // ��������� ��� �������� ��������� ����������
    function CloseAllAtt(ik_grup, nsem, numAtt: Integer): boolean;

    // ��������� ���� ���� ��� ����������
    function SaveDateAllAtt(ik_grup, nsem, numAtt: Integer;
      dateAtt: TDateTime): boolean;

    // �������� ����������
    function CloseAtt(ikVed: Integer; itab_n: string; lclose: boolean): boolean;

    //DataSet � �����������
    function GetVedomSet: TADODataSet;

    function GetBRSVedomSet: TADODataSet;

    // ***************������� ���������**************************
    // SelPrepodsForVedom �������� ������������� ��� ���������
    function SelPrepodsForVedom(ik_grup, iK_vid_zanyat, n_sem: variant)
      : boolean;

    // GetNSem ��������� � �������� �������� (�� ���� �������� ������)
    function GetNSem(FoundYear: Integer): Integer;

    function GetNSemBRS(FoundYear: Integer): Integer;

    // CheckVedClose ���������, ������� �� ��� ��������� �������� ������
    function CheckVedClose(nsem, ik_group: Integer;
      var allZachs: boolean): boolean;

    // GetAllPredms ���������� ��� ���������� �������� ����� (�������� ���
    // �������������� ������ ������������ ���-� bitExam)
    function GetAllPredms(nsem, ik_group: Integer; bitExam: boolean)
      : TADOStoredProc;

    // GetAllVeds ���������� ��� ��������� ��������� �������� ��. �����
    procedure GetAllVeds(nsem, ik_group: Integer);

    // GetVedChangeEnabled ��������� ����������� �������������� ���������
    // (�� ���� ������� ��� ��� ���)
    function GetVedChangeEnabled(): boolean;

    // GetVedChangeOpenEnabled ��������� ����������� ��������/�������� ���������
    function GetVedChangeOpenEnabled: boolean;

    // DoCheckVedExist ��������, ���������� �� ���������
    function DoCheckVedExist(ik_upContent: Integer): boolean;

    // UpdateVedsContent ��������� ������ ��������� �� ���� �������� ����������
    // ������ � ��������� ��������
    procedure UpdateVedsContent(nsem, ik_group: Integer);

    // CreateIndependVeds ������� ��� ����������� �� ��. ����� ���������
    // ��� ����� ��������
    procedure CreateIndependVeds(nsem, ik_group: Integer); overload;

    // CreateDependVeds ������� ��� ����������� �� ��. ����� ���������
    // ��� ����������� ���� �������
    procedure CreateDependVeds(nsem, ik_group, iK_vid_zanyat: Integer);
      overload;

    // CreateVeds ������� ��� ���������
    // (��� ���� ���������� �������� ��� ��������������� ������)
    procedure CreateVeds(nsem, ik_group: Integer);

    // CanCreateVnostVed ��������� ����� �� �������
    // �������� ��������� �� �������
    function CanCreateVnostVed: boolean;

    // CanCreateDependVeds ��������� ����� �� �������
    // ��������� �� ��������� ����� �������
    function CanCreateDependVeds(): boolean;

    // CanCreateIndependVeds ��������� ����� �� �������
    // ����������� ���������
    function CanCreateIndependVeds(nsem, ik_group: Integer): boolean;

    // ���������� � ���� ������ ���� �������, ������� ����� �������
    // � ������� ������� �� ����������� ���� �������
    function GetEnableVidZanyats(nsem, ik_group, ikVidZan: Integer): string;

    // CanCreateVeds ���������, ����� �� ������� ���������
    function CanCreateVeds(nsem, ik_group: Integer): boolean;

    // ArePredmsInUchPlan ��������� ���� �� �������� ������ � ������� �����
    function ArePredmsInUchPlan(nsem, ik_group: Integer): boolean;

    // CanUpdateVedsList ��������� ����� �� �������� ���������
    function CanUpdateVedsList(nsem, ik_group: Integer): boolean;

    // UpdateVedsList ������� ��� ����������� �� ��. ����� ���������
    // ��� ����� ��������
    procedure UpdateVedsList(nsem, ik_group: Integer);

    // GetAllVidZanyats ��������� ��� ���� �������, ��� ������� ����� ���������
    // ��������� � ����������� ��� ����� �����������
    procedure GetAllVidZanyats(nsem, ik_group: Integer);

    // GetDependVidZanyats ��������� ������ ����� ������� ,������� ��� ����� �������
    // (�� ��� �� �������) � ������� ������� �� ����������� ���� �������
    procedure GetDependVidZanyats(nsem, ik_group, ikVidZan: Integer);

    // SetFilterForVidZanyats ��������� ���� �������
    procedure SetFilterForVidZanyats(CreateEnable, IsCreated,
      IsDependent: boolean);

    // GetListOfVeds ��������� ������ ��� ��������� ���������� ��� ����� ��������,
    // ������� ����������� �� ��. �����
    // ���������� ���������� ��������� ����������
    function GetListOfVeds(nsem, ik_group, fac_ik: Integer;
      var countPredms: Integer): Integer;

    // GetVedsHeader ������ ��������� ���������
    procedure GetVedsHeader(ikVed: Integer);

    // GetVedsHeader ������ ������ (������) ���������
    function SelectVed(ikVed: Integer): TADODataSet;

    // ApplyUspev ��������� ������ ��������� (������)
    procedure ApplyUspev(ikVed, ikVidZan: Integer; dbgrdVed: PDBGrid);

    // ApplyVed ��������� ������ ��������� (�����)
    procedure ApplyVed(VedNum: string; ikVidExam: Integer;
      bitClose, bitNapr: boolean; ikPrepod: variant; DateExam: TDateTime);

    // OpenVed ��������� ���������
    function OpenVed(ikVed: Integer): boolean;

    // CloseVed ��������� ���������
    procedure CloseNapr(ik_ved, cosenca: Integer; ntab, KPTema: string;
      date_exam: TDateTime);
    // ik_ved, cosenca: integer; ntab, KPTema: string; date_exam: TDateTime

    // UpdateDopuskForVed ��������� ������� � ��������� (�����)
    function UpdateDopuskForVed(ikVed: Integer): boolean;

    // SelContrlForVinVed �������� ������ ��������� ���������
    // ��� �������� �������� ���������
    // (�������� ������ ��, ��� ���-� �� ������� ���������)
    function SelContrlForVinVed(ik_group, nsem: Integer): boolean;

    // GetContrlVidZanForRaport �������� ��� ����������, �� ������� ����� ������� ������
    // ��������� ���� ����������
    function GetContrlVidZanForRaport(ik_group, nsem: Integer): boolean;

    // GetDopusksList ���������� ������� � ��������
    function GetDopusksList(SourceDataSet: PDataSet;
      ik_group, ik_upContent, dopusk: Integer): boolean;

    // AppendRaports �������� � ��������� � ���������� � ��������
    // (�������, �����������, ���������)
    procedure AppendRaports(flag, ik_zach, ik_upContent: Integer;
      bitClose: boolean);

    // DoRaports �������, ���������, ��������� �������
    // �������� ���������� �������
    function DoRaports(lv1, lv2, lvDop, lvNDop: TListView;
      ik_group, ik_upContent: Integer): boolean;
    // �������� ���������
    procedure DelVed(ik_ved: variant);

    /// ////////������� � Excel ����������///////////
    procedure PrintAttestation(ikGrup, nsem, nAtt, ikFac: Integer;
      date: string);

    /// ////////������� � Excel ��������� ��������� ���///////////
    procedure PrintBRSVedomost(ikGrup, nsem, nAtt, ikFac: Integer;
      date, examiner, num: string);

    /// ////////������� � Excel ��������� �������� ���///////////
    procedure PrintBRSExamVedomost(ikGrup, nsem, nAtt, ikFac: Integer;
      date, examiner, num: string);

    /// ////////������� � Excel ������ �� ���///////////
    procedure PrintBRSRankReport(ikGrup, nsem: Integer; num: string);

    /// ////////������� � Excel ������ �� ��� �� �������� �������///////////
    procedure PrintBRSRankAverageReport(ikGrup, nsem: Integer; num: string);

    /// ////////������� � Excel ������ ����������///////////
    procedure PrintBlankAttestation(ikGrup, nsem, nAtt, ikFac: Integer;
      date: string);

    /// ////////������� � Excel �������� ��������� ���///////////
    procedure PrintBRSLastVedomost(ikGrup, nsem, ikFac, ikDisc: Integer;
      datezach, DateExam, examiner, disc: string);

    // ***********�����������*********************************************************************************************


    // ����� DataSet � �����������, �� ������� ����� ���� ����������� ��� �������� ��������
    function GetContentDS(StudIK: Integer): TADODataSet;
    // ����� DataSet � ������������� ��������
    function GetNapravDS: TADODataSet;

    // ���������� ������ ����������� �� ����������
    procedure SetContentNaprav(ContentIK: Integer);

    // ���������� ������� ��� ������ �����������
    procedure SetNapravSemester(nsem: Integer);

    function AddNapr(VidExID: Integer; dateIn, dateOut: TDateTime;
      NaprNum, VidName: string): Integer;

    procedure AnnulNapr(VedIK: Integer);

    procedure SelectNapr(StudGrupIk: Integer; isOpened: boolean);

    // **********������� � EXCEL ����������************
    // ���������� ��������� ����� �� ������,
    // ��� ���� ���������� ������ �� ��� ����� � �����������
    function GetNextSubStr(var str: string): string;

    // ���������� �������� ��������
    function GetPagename(VidZanShortName: string; prevName: string): string;

    // GetAllVedomosts ������� ������ ���� ��������� � �������� ����������
    function GetAllVedomosts(ikGrup, nsem: Integer): TADOStoredProc;

    // GetVedomsShapca �������� ��������� ���������
    function GetVedomsShapca(ik_ved: Integer): boolean;

    // GetVedomsBottom �������� ���������� ��������� (���-�� 3,4,5)
    procedure GetVedomsBottom(ik_ved, iK_vid_zanyat: Integer);

    // �������� c��������� ��������� � ���������
    function GetVedomsOsenciWithDopusk(ik_ved: Integer): TADOStoredProc;

    // �������� c��������� ��������� ��� �������� (�����, ��, ��)
    function GetVedomsOsenciWithoutDopusk(ik_ved: Integer): TADOStoredProc;

    // �������� c��������� ���������
    function GetVedomsOsenci(ik_ved: Integer; hasDopusk: boolean)
      : TADOStoredProc;

    // ��������� ���������� ����� (��� �� - ���� ���������)
    procedure AddPageVedomost(var mainSheet, next: Integer; firstStr: Integer;
      E: variant; HasTema: boolean; VidZanShortName: string);

    // ������� ����� ��������� � Excel
    procedure ExportVedsShapka(mainSheet, next, ikGrup, nsem, ikVed, ikFac,
      ikSpec, ikVidZan, Count, firstStr, firstStrKP: Integer; E: variant;
      HasTema, withOsenca: boolean; VedName, VidZanShortName: string);

    // ��������� ����� ���������
    procedure ExportVedsEnd(mainSheet, next, firstStr: Integer;
      ikVed, ikVidZan, Count: Integer; E: variant; withOsenca: boolean);

    // ����������� ��������� � ����� ��������
    procedure NastrVedsEnd(next, firstStr: Integer;
      ikGrup, nsem, ikVed, ikFac, ikSpec, ikVidZan, Count: Integer; E: variant;
      HasTema, hasDopusk: boolean; VedType: TVedType);

    // printVedomost ���������� ��� ������ ���������
    procedure printVed(ikGrup, nsem, ikVed, ikFac, ikSpec: Integer);

    // printAllVedomost ���������� ��� ��������� �������� (� ��������)
    procedure printAllVedomost(ikGrup, nsem, ikFac, ikSpec: Integer);

    // ************������� � EXCEL ������� ����������******************
    // ���������� ������ ����� ���������
    procedure printVedomost(VedList: TADOStoredProc;
      ikGrup, nsem, ikFac, ikSpec: Integer; withOsenca: boolean);

    // ��������������� ������� ���������������� ������ ���������
    procedure DoPrintVedomost(E: variant; ikGrup, nsem, ikVed, ikFac,
      ikSpec: Integer; withOsenca: boolean);

    { //printBlankVedomostZach ���������� ����� ��������� ��� ������
      procedure printBlankVedomostZach(ikGrup, nSem, ikVed, ikFac, ikSpec: integer; E:Variant; HasDopusk:boolean);

      //printBlankVedomostKP ��������� ������ ��������� ��� ��
      procedure printBlankVedomostKP(ikGrup, nSem, ikVed, ikFac, ikSpec: integer; E:Variant; HasDopusk:boolean);
    }
    // printBlankVedomost ���������� ����� ��������� (��� ������)
    procedure printBlankVedomost(ikGrup, nsem, ikVed, ikFac, ikSpec: Integer;
      tempStoredProc: TADOStoredProc);

    function BuildVedomost2014(ikGrup, nsem, ikVed, ikFac, ikSpec: Integer)
      : TReportBase;
    // printAllBlankVedomost ���������� ��� ������ ���������� �������� (��� ������)
    procedure printAllBlankVedomost(ikGrup, nsem, ikFac, ikSpec: Integer);

    // ***************������� ������������**************************
    // GetAllUspevForGrup ������� ������ ���� ��������� � �������� ����������
    function GetAllUspevForGrup(ikGrup, nsem: Integer): TADOStoredProc;

    // PrintUspevToExcel ������� � Excel ������������ ������ (�������)
    function PrintUspevToExcel(sgUspev: TStringGrid): boolean;

    // ***************��������������**************************
    // getSpecFromSpecFac ���������� IK �������������
    function getSpecFromSpecFac(SpecFacIK: Integer): Integer;
    // ������� �������
    function BuildSpravka2014(_ikStudGrup, _type_spr: Integer): TReportBase;

    // ******************����������� (Kim Spark)*****************************************
    property VedomostController: TVedomostController read GetVedomostController;
    property ActiveStudent: integer write SetActiveStudent;

  end;

implementation

uses CommonIntf, CommonIntfImpl, BRSVedom2014, ConstantRepository;

var
  // FAbitZachislenieControllerInstance - ��������� �����������
  FUspevGroupControllerInstance: TUspevGroupController = nil;
  havePredms: boolean = false;
  CanCreateIndependVeds: boolean = false;
  CanCreateDependVeds: boolean = false;

constructor TUspevGroupController.CreateInstance;
begin
  inherited Create;
  FVedomostController := TVedomostController.Create;
  FBRSVedomostController := TBRSVedomostController.Create;
  FNapravController := TNapravController.Create;
end;

constructor TUspevGroupController.Create;
begin
  inherited Create;

  raise Exception.CreateFmt
    ('������ � ������ %s ����� �������� ������ ����� ���� Instance!',
    [ClassName]);
end;

class function TUspevGroupController.AccessInstance(Request: Integer)
  : TUspevGroupController;
begin
  case Request of
    0:
      ;
    1:
      if not Assigned(FUspevGroupControllerInstance) then
      begin
        FUspevGroupControllerInstance := CreateInstance;

      end;
    2:
      if FUspevGroupControllerInstance <> nil then
      begin

        FreeAndNil(FUspevGroupControllerInstance);
        // FUspevGroupControllerInstance.Free;
        // FUspevGroupControllerInstance:= nil;
      end;
  else
    raise EApplicationException.Create('������ � ���������!',
      Exception.CreateFmt('��������� ������ � ����������� ������������',
      [Request]));
  end;
  Result := FUspevGroupControllerInstance;
end;

class function TUspevGroupController.Instance: TUspevGroupController;
begin
  Result := AccessInstance(1);
end;

class procedure TUspevGroupController.ReleaseInstance;
begin

  AccessInstance(2);
end;












// *********��������������� ������������*********************

// ***********************����������*************************
// ��������� �������� ��� ������ ��� ������ �� ��������� ����������
procedure TUspevGroupController.SelectAtt(ikVed: Integer; IsBRS: boolean);
begin
  if not IsBRS then
  begin
    dmUspevaemost.adodsSelAttGroup.Active := false;
    dmUspevaemost.adodsSelAttGroup.CommandText :=
      'select * from GetSmallAttForGrup(' + IntToStr(ikVed) + ')';
    dmUspevaemost.adodsSelAttGroup.Active := true;
  end
  else
  begin
    dmUspevaemost.adodsSelAttBRSGroup.Active := false;
    dmUspevaemost.adodsSelAttBRSGroup.CommandText :=
      'select * from GetSmallBRSAttForGrup(' + IntToStr(ikVed) + ')';
    dmUspevaemost.adodsSelAttBRSGroup.Active := true;
  end;
end;

procedure TUspevGroupController.SelectBRSExam(ikVed: Integer);
begin
  dmUspevaemost.adodsSelBRSExamGroup.Active := false;
  dmUspevaemost.adodsSelBRSExamGroup.CommandText :=
    'select * from GetSmallBRSExamForGrup(' + IntToStr(ikVed) + ')';
  dmUspevaemost.adodsSelBRSExamGroup.Active := true;
end;

procedure TUspevGroupController.SelectNapr(StudGrupIk: Integer; isOpened: boolean);
begin
  FNapravController.Reload(StudGrupIk);
  if isOpened then FNapravController.LoadOpenedNapr;
end;

// ������� �������� ��� ��������� �������� ��� � ���������� �� ����������
function TUspevGroupController.GetCreatedBRS(ik_grup, nsem, nomer_att: Integer): Integer;
begin
  FBRSVedomostController.Reload(ik_grup, nsem, nomer_att);
  Result := FBRSVedomostController.CreatedCount;
 { dmUspevaemost.adospGetAllAtt.Active := false;

  if IsBRS then
    dmUspevaemost.adospGetAllAtt.ProcedureName := 'GetAllAttestForBRSGrup'
  else
    dmUspevaemost.adospGetAllAtt.ProcedureName := 'GetAllAttestForGrup';

  with dmUspevaemost.adospGetAllAtt.Parameters do
  begin
    Clear;
    AddParameter;
    Items[0].Value := ik_grup;
    AddParameter;
    Items[1].Value := nsem;
    AddParameter;
    Items[2].Value := nomer_att;
  end;
  dmUspevaemost.adospGetAllAtt.ExecProc;
  dmUspevaemost.adospGetAllAtt.Active := true;
  Result := dmUspevaemost.adospGetAllAtt.RecordCount;  }
end;

function TUspevGroupController.GetAllBRSExam(ik_grup, nsem: Integer): Integer;
begin
  Result := 0;
  dmUspevaemost.adospGetAllBRSExam.Active := false;

  with dmUspevaemost.adospGetAllBRSExam.Parameters do
  begin
    Clear;
    AddParameter;
    Items[0].Value := ik_grup;
    AddParameter;
    Items[1].Value := nsem;
  end;
  dmUspevaemost.adospGetAllBRSExam.ExecProc;
  dmUspevaemost.adospGetAllBRSExam.Active := true;
  Result := dmUspevaemost.adospGetAllBRSExam.RecordCount;
end;

// ������� �������� ��� �������� ��� �� �������� ����� � ���������� �� ����������
function TUspevGroupController.GetBRSCount(ik_grup, nsem, nmodule: Integer): Integer;
begin
  try
    with FBRSVedomostController do
    begin
      Reload(ik_grup, nsem, nmodule);
      Result := Count;
    end;

 { try
    dmUspevaemost.adospGetAttVidZan.Active := false;
    with dmUspevaemost.adospGetAttVidZan.Parameters do
    begin
      Clear;
      AddParameter;
      Items[0].Value := ik_grup;
      AddParameter;
      Items[1].Value := nsem;
      if IsBRS then
      begin
        AddParameter;
        Items[2].Value := nmodule;
      end;

    end;
    dmUspevaemost.adospGetAttVidZan.ExecProc;
    dmUspevaemost.adospGetAttVidZan.Active := true;
    Result := dmUspevaemost.adospGetAttVidZan.RecordCount;    }
  except
    Result := 0;
    Raise;
  end;
end;

function TUspevGroupController.GetBRSExamVidZan(ik_grup, nsem: Integer)
  : Integer;
begin
  try
    dmUspevaemost.adospGetBRSExamVidZan.Active := false;
    with dmUspevaemost.adospGetBRSExamVidZan.Parameters do
    begin
      Clear;
      AddParameter;
      Items[0].Value := ik_grup;
      AddParameter;
      Items[1].Value := nsem;
    end;
    dmUspevaemost.adospGetBRSExamVidZan.Active := true;
    Result := dmUspevaemost.adospGetBRSExamVidZan.RecordCount;
  except
    Result := 0;
    Raise;
  end;
end;

function TUspevGroupController.GetBRSVedomSet: TADODataSet;
begin
  Result := FBRSVedomostController.DataSet;
end;

// ������� ��������� ������� ��������� ��������� ��� ����������
function TUspevGroupController.CheckAttsExist(ikGroup, nsem,
  nVed { , ikVidZan } , ikPredm: Integer; IsBRS: boolean): boolean;
begin

  dmUspevaemost.adospSelAtt.Active := false;

  if IsBRS then
    dmUspevaemost.adospSelAtt.ProcedureName := 'SelBRSAtt;1'
  else
    dmUspevaemost.adospSelAtt.ProcedureName := 'SelAtt;1';

  with dmUspevaemost.adospSelAtt.Parameters do
  begin
    Clear;
    AddParameter;
    // ����� ��������
    Items[0].Value := nsem;
    AddParameter;
    // ����������
    Items[1].Value := ikPredm; // ���� �������� ik_upContent
    AddParameter;
    // ��� �������
    // Items[2].Value := ikVidZan;
    // AddParameter;
    // ������
    Items[2].Value := ikGroup;
    AddParameter;
    // ����� ����������
    Items[3].Value := nVed;
  end;
  // dmUspevaemost.adospSelAtt.ExecProc;
  dmUspevaemost.adospSelAtt.Active := true;
  if dmUspevaemost.adospSelAtt.FieldByName('ik_Ved').Value = null then
    Result := false
  else
    Result := true;
end;

function TUspevGroupController.CheckBRSExamExist(ik_grup, nsem, ikVidZan,
  ikPredm: Integer): boolean;
begin
  dmUspevaemost.adospSelBRSExam.Active := false;

  with dmUspevaemost.adospSelBRSExam.Parameters do
  begin
    Clear;
    AddParameter;
    // ����� ��������
    Items[0].Value := nsem;
    AddParameter;
    // ����������
    Items[1].Value := ikPredm;
    AddParameter;
    // ��� �������
    // Items[2].Value := ikVidZan;
    // AddParameter;
    // ������
    Items[2].Value := ik_grup;
  end;
  // dmUspevaemost.adospSelAtt.ExecProc;
  dmUspevaemost.adospSelBRSExam.Active := true;
  if dmUspevaemost.adospSelBRSExam.FieldByName('ik_Ved').Value = null then
    Result := false
  else
    Result := true;
end;

// ������� ������� ��� ��������� ���
function TUspevGroupController.CreateAllBRS(ik_group, nsem, numMod: Integer): boolean;
begin
  Result := false;
  TApplicationController.GetInstance.AddLogEntry('�������� ���-����������');

  FBRSVedomostController.Reload(ik_group, nsem, numMod);
  try
    FBRSVedomostController.CreateAllBRS;
  except
    on E: Exception do
      raise EApplicationException.Create
        ('��������� ������ ��� �������� ����������!', E);
  end;
  Result := (FBRSVedomostController.CreatedCount<>0);
  {
  // �������� ������ ��������� ���������� ������� ������ ���� (���������: GetAttestVidZanyat)
  TUspevGroupController.Instance.GetAttVidZan(ik, nsem, numAtt, IsBRS);

  dmUspevaemost.adospGetAttVidZan.First;
  while not dmUspevaemost.adospGetAttVidZan.Eof do
  begin
    // ���������� ��� ��������� ���������� ���������� (SelBRSAtt/SelAtt)
    if TUspevGroupController.Instance.CheckAttsExist(ik, nsem, numAtt,
      dmUspevaemost.adospGetAttVidZan.Fields[3].Value,
      { dmUspevaemost.adospGetAttVidZan.Fields[1].Value, } {IsBRS) then
    begin
      dmUspevaemost.adospGetAttVidZan.next;
      Continue;
    end;
    // ��������� AppendVedomost
    with dmUspevaemost.adospAppVed.Parameters do
    begin
      Items[1].Value := 1; // �������� ����������
      Items[2].Value := ''; // ����� ����������
      Items[3].Value := ik; // ��� ������
      Items[4].Value := dmUspevaemost.adospGetAttVidZan.Fields[0].Value;
      // ��� �������
      Items[5].Value := nsem; // ����� ��������
      Items[6].Value := dmUspevaemost.adospGetAttVidZan.Fields[1].Value;
      // �������
      Items[7].Value := null; // �������������
      Items[8].Value := numAtt; // ����� ���������� � ���� ��� ��������
      Items[9].Value := date; // ���� ������
      Items[10].Value := date; // ���� ��������
      Items[11].Value := 0; // �������� ����������
      Items[12].Value := 0; // �� �����������
      Items[13].Value := null; // ik ����������
      Items[14].Value := 0; // �� �������� ���
      Items[15].Value := dmUspevaemost.adospGetAttVidZan.Fields[3].Value;
      // ��� ������ �������� �����
    end;
    try
      dmUspevaemost.adospAppVed.ExecProc;
    except
    end;
    dmUspevaemost.adospGetAttVidZan.next;
  end;                 }
  Result := true;

end;

function TUspevGroupController.CreateAllBRSExam(ik_grup, nsem: Integer)
  : boolean;
begin
  Result := false;
  // �������� ������ ��������� ��� �� ������� ������ ���� �������
  TUspevGroupController.Instance.GetBRSExamVidZan(ik_grup, nsem);

  dmUspevaemost.adospGetBRSExamVidZan.First;

  while not dmUspevaemost.adospGetBRSExamVidZan.Eof do
  begin
    // ���������� ��� ��������� ���������� ����������

    if TUspevGroupController.Instance.CheckBRSExamExist(ik_grup, nsem,
      dmUspevaemost.adospGetBRSExamVidZan.Fields[0].Value,
      dmUspevaemost.adospGetBRSExamVidZan.Fields[3].Value)

    then
    begin
      dmUspevaemost.adospGetBRSExamVidZan.next;
      Continue;
    end;
    with dmUspevaemost.adospAppVed.Parameters do
    begin
      Items[1].Value := 1; // �������� ���������
      Items[2].Value := ''; // ����� ���������
      Items[3].Value := ik_grup; // ��� ������
      Items[4].Value := dmUspevaemost.adospGetBRSExamVidZan.Fields[0].Value;
      // ��� �������
      Items[5].Value := nsem; // ����� ��������
      Items[6].Value := dmUspevaemost.adospGetBRSExamVidZan.Fields[1].Value;
      // �������
      Items[7].Value := null; // ������
      Items[8].Value := 0; // ����� ���������� � ���� ��� ��������
      Items[9].Value := date; // ���� ������
      Items[10].Value := date; // ���� ��������
      Items[11].Value := 0; // �������� ����������
      Items[12].Value := 0; // �� �����������
      Items[13].Value := null; // ik ����������
      Items[14].Value := 0; // �� �������� ���
      Items[15].Value := dmUspevaemost.adospGetBRSExamVidZan.Fields[3].Value;
      // ��� ������ �������� �����
    end;
    dmUspevaemost.adospAppVed.ExecProc;
    dmUspevaemost.adospGetBRSExamVidZan.next;
  end;
  Result := true;

end;

// ������� ������ ������ ��� ������ �� ��������� ����������
function TUspevGroupController.SelAtt(nsem, ikPredm, ikVidZan, ik_grup,
  nom_ved: Integer): boolean;
begin
  try
    dmUspevaemost.adospSelAtt.Fields.Clear;
    dmUspevaemost.adospSelAtt.Active := false;
    with dmUspevaemost.adospSelAtt.Parameters do
    begin
      Clear;
      // ����� ��������
      AddParameter;
      Items[0].Value := nsem;
      // ����������
      AddParameter;
      Items[1].Value := ikPredm; // ik_upContent
      // ��� �������
      // AddParameter;
      // Items[2].Value := ikVidZan;
      // ������
      AddParameter;
      Items[2].Value := ik_grup;
      // ����� ����������
      AddParameter;
      Items[3].Value := nom_ved;
    end;
    dmUspevaemost.adospSelAtt.Open;
    // dmUspevaemost.adospSelAtt.Active := true;

    Result := true;
  except
    Result := false;
  end;
end;

function TUspevGroupController.SelBRSExam(nsem, ikPredm, ikVidZan,
  ik_grup: Integer): boolean;
begin
  try
    dmUspevaemost.adospSelBRSExam.Fields.Clear;
    dmUspevaemost.adospSelBRSExam.Active := false;
    with dmUspevaemost.adospSelBRSExam.Parameters do
    begin
      Clear;
      // ����� ��������
      AddParameter;
      Items[0].Value := nsem;
      // ����������
      AddParameter;
      Items[1].Value := ikPredm; // @ik_upContent
      // ��� �������
      // AddParameter;
      // Items[2].Value := ikVidZan;
      // ������
      AddParameter;
      Items[2].Value := ik_grup;
    end;
    dmUspevaemost.adospSelBRSExam.ExecProc;
    dmUspevaemost.adospSelBRSExam.Active := true;

    Result := true;
  except
    Result := false;
  end;
end;

// ��������� ���������� ���������� � ��������
function TUspevGroupController.SaveAtt(ikVed: Integer;
  dbgrdAtt: PDBGrid): boolean;
begin

  Result := false;

  dmUspevaemost.adodsSelAttGroup.First;
  while not dmUspevaemost.adodsSelAttGroup.Eof do
  begin
    if (dbgrdAtt.Fields[1].Value <> null) and (dbgrdAtt.Fields[1].Text <> '')
    then
    begin
      dmUspevaemost.adospAppendRezAtt.Parameters[1].Value := 0;
      dmUspevaemost.adospAppendRezAtt.Parameters[2].Value := ikVed;
      dmUspevaemost.adospAppendRezAtt.Parameters[3].Value :=
        dbgrdAtt.Fields[4].Value;

      // ������
      if (dbgrdAtt.Fields[5].Value <> null) then
        dmUspevaemost.adospAppendRezAtt.Parameters[4].Value :=
          dbgrdAtt.Fields[5].Value
      else
        dmUspevaemost.adospAppendRezAtt.Parameters[4].Value := -1;
      // �������� ��� ������������ �������
      dmUspevaemost.adospAppendRezAtt.Parameters[5].Value :=
        dbgrdAtt.Fields[7].Value;
      // �������� �� ������������ �������
      dmUspevaemost.adospAppendRezAtt.Parameters[6].Value :=
        dbgrdAtt.Fields[6].Value;

      dmUspevaemost.adospAppendRezAtt.ExecProc;
    end;
    dmUspevaemost.adodsSelAttGroup.next;
  end;
  dmUspevaemost.adodsSelAttGroup.First;

  Result := true;

end;

function TUspevGroupController.SaveBRSAtt(ikVed: Integer;
  dbgrdBRSAtt: TDBGridEh; i_tab: string; date: TDateTime): boolean;
begin

  Result := false;

  with dmUspevaemost.aspSetAttributesVedomost do
  begin
    Parameters.Clear;
    Parameters.AddParameter;
    Parameters[0].Value := ikVed;
    Parameters.AddParameter;
    Parameters[1].Value := date;
    Parameters.AddParameter;
    Parameters[2].Value := i_tab;
    ExecProc;
  end;

  dmUspevaemost.adodsSelAttBRSGroup.First;
  while not dmUspevaemost.adodsSelAttBRSGroup.Eof do
  begin
    if (dbgrdBRSAtt.Fields[1].Value <> null) and
      (dbgrdBRSAtt.Fields[1].Text <> '') then
    begin
      with dmUspevaemost.adospAppendRezBRSAtt do
      begin
        Parameters[1].Value := 0;
        Parameters[2].Value := ikVed;
        Parameters[3].Value := dbgrdBRSAtt.Fields[4].Value;
        // �����
        // if dmUspevaemost.adospAppendRezBRSAtt.Parameters[4].Value <> NULL then
        Parameters[4].Value := dbgrdBRSAtt.Fields[5].Value;
        // else  dmUspevaemost.adospAppendRezBRSAtt.Parameters[4].Value := -1;
        // ��������
        Parameters[5].Value := dbgrdBRSAtt.Fields[6].Value;
        Parameters[6].Value := dbgrdBRSAtt.Fields[7].Value;
        ExecProc;
      end;
    end;
    dmUspevaemost.adodsSelAttBRSGroup.next;
  end;
  dmUspevaemost.adodsSelAttBRSGroup.First;

  Result := true;

end;

function TUspevGroupController.SaveBRSExam(ikVed: Integer;
  dbgrdBRSExam: TDBGridEh; i_tab: string; date: TDateTime): boolean;
begin

  Result := false;

  with dmUspevaemost.aspSetAttributesVedomost do
  begin
    Parameters.Clear;
    Parameters.AddParameter;
    Parameters[0].Value := ikVed;
    Parameters.AddParameter;
    Parameters[1].Value := date;
    Parameters.AddParameter;
    Parameters[2].Value := i_tab;
    ExecProc;
  end;

  dmUspevaemost.adodsSelBRSExamGroup.First;
  while not dmUspevaemost.adodsSelBRSExamGroup.Eof do
  begin
    if (dbgrdBRSExam.Fields[1].Value <> null) and
      (dbgrdBRSExam.Fields[1].Text <> '') then
    begin
      with dmUspevaemost.adospAppendRezAttWithGrade do
      begin
        Parameters[1].Value := 0;
        Parameters[2].Value := ikVed;
        // �������
        Parameters[3].Value := dbgrdBRSExam.Fields[4].Value;
        // �����
        Parameters[4].Value := dbgrdBRSExam.Fields[5].Value;
        // ������ �� ������������ �����
        Parameters[5].Value := dbgrdBRSExam.Fields[7].Value;
        ExecProc;
      end;
    end;
    dmUspevaemost.adodsSelBRSExamGroup.next;
  end;
  dmUspevaemost.adodsSelBRSExamGroup.First;

  Result := true;

end;

function TUspevGroupController.SaveDateAllAtt(ik_grup, nsem, numAtt: Integer;
  dateAtt: TDateTime): boolean;
begin
  Result := true;
  try

    dmUspevaemost.adospSaveDateAllAtt.Active := false;
    with dmUspevaemost.adospSaveDateAllAtt.Parameters do
    begin
      Clear;
      AddParameter;
      Items[0].Value := ik_grup;
      AddParameter;
      Items[1].Value := nsem;
      AddParameter;
      Items[2].Value := numAtt;
      AddParameter;
      Items[3].Value := dateAtt;
    end;
    dmUspevaemost.adospSaveDateAllAtt.ExecProc;

  except
    Result := false;
  end;
end;

// ��������� ��� �������� ��������� ����������
function TUspevGroupController.CloseAllAtt(ik_grup, nsem,
  numAtt: Integer): boolean;
begin
  Result := true;
  try

    dmUspevaemost.adoCloseAllAtt.Active := false;
    with dmUspevaemost.adoCloseAllAtt.Parameters do
    begin
      Clear;
      AddParameter;
      Items[0].Value := ik_grup;
      AddParameter;
      Items[1].Value := nsem;
      AddParameter;
      Items[2].Value := numAtt;
    end;
    dmUspevaemost.adoCloseAllAtt.ExecProc;

  except
    Result := false;
  end;

end;

function TUspevGroupController.CloseAtt(ikVed: Integer; itab_n: string;
  lclose: boolean): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  Result := true;
  try

    tempStoredProc := TADOStoredProc.Create(nil);
    tempStoredProc.ProcedureName := 'Dek_CloseAtt;1';
    tempStoredProc.Connection := dm.DBConnect;
    tempStoredProc.Parameters.CreateParameter('@Ik_ved', ftInteger, pdInput,
      0, ikVed);
    tempStoredProc.Parameters.CreateParameter('@Itab_n', ftString, pdInput,
      50, itab_n);
    tempStoredProc.Parameters.CreateParameter('@lclose', ftBoolean, pdInput,
      0, lclose);

    tempStoredProc.ExecProc;

  except
    Result := false;
  end;
end;

procedure TUspevGroupController.CloseNapr(ik_ved, cosenca: Integer;
  ntab, KPTema: string; date_exam: TDateTime);
// ik_ved, cosenca: integer; ntab, KPTema: string; date_exam: TDateTime
begin
  TApplicationController.GetInstance.AddLogEntry('�������� �����������');
  case FNapravController.CloseNapr(ik_ved, cosenca, ntab, KPTema, date_exam) of
    StatusError:
      ShowMessage('������ ������� ����������� � ������ ��������');
  end;
end;

// ***************������� ���������**************************
// �������� �������������� ��� ���������
function TUspevGroupController.SelPrepodsForVedom(ik_grup, iK_vid_zanyat,
  n_sem: variant): boolean;
begin
  try
    dmUspevaemost.adospPrepodVed.Close;
    with dmUspevaemost.adospPrepodVed.Parameters do
    begin
      Clear;
      CreateParameter('@Ik_grup', ftInteger, pdInput, 0, ik_grup);
      CreateParameter('@iK_vid_zanyat', ftInteger, pdInput, 0, iK_vid_zanyat);
      CreateParameter('@n_sem', ftInteger, pdInput, 0, n_sem);
    end;
    dmUspevaemost.adospPrepodVed.Open;
    Result := true;
  except
    Result := false;
  end;
end;

// ��������� � �������� �������� (�� ���� �������� ������)
function TUspevGroupController.GetNSem(FoundYear: Integer): Integer;
var
  nsem: Integer;
begin
  // if (FoundYear>CurrentYear) or (FoundYear<1990) then
  // result:= -1;
  nsem := 1;
  if MonthOf(date) > 8 then
    nsem := 1 + (CurrentYear - FoundYear) * 2
  else if MonthOf(date) < 4 then
    nsem := (CurrentYear - FoundYear) * 2 - 1
  else if (MonthOf(date) <= 8) and (MonthOf(date) >= 4) then
    nsem := (CurrentYear - FoundYear) * 2;
  if nsem > 12 then
    nsem := 1;
  Result := nsem;
end;

function TUspevGroupController.GetNSemBRS(FoundYear: Integer): Integer;
var
  nsem: Integer;
begin
  // if (FoundYear>CurrentYear) or (FoundYear<1990) then
  // result:= -1;
  nsem := 1;
  if MonthOf(date) > 8 then
    nsem := 1 + (CurrentYear - FoundYear) * 2
  else if MonthOf(date) < 2 then
    nsem := (CurrentYear - FoundYear) * 2 - 1
  else
    nsem := (CurrentYear - FoundYear) * 2;
  if nsem > 12 then
    nsem := 1;
  Result := nsem;
end;

// ���������, ������� �� ��� ��������� �������� ������
function TUspevGroupController.CheckVedClose(nsem, ik_group: Integer;
  var allZachs: boolean): boolean;
begin
  allZachs := false;

  dmUspevaemost.adospCheckVedClose.Close;
  with dmUspevaemost.adospCheckVedClose.Parameters do
  begin
    Clear;
    CreateParameter('@n_sem', ftInteger, pdInput, 0, nsem);
    CreateParameter('@ik_grup', ftInteger, pdInput, 0, ik_group);
  end;
  dmUspevaemost.adospCheckVedClose.Active := true;
  dmUspevaemost.adospCheckVedClose.First;

  allZachs := dmUspevaemost.adospCheckVedClose.FieldByName('allZachVed')
    .AsBoolean;
  Result := dmUspevaemost.adospCheckVedClose.FieldByName('checkved').AsBoolean;

end;

// ���������� ��� ���������� �������� ����� (�������� ���
// �������������� ������ ������������ ���-� bitExam)
function TUspevGroupController.GetAllPredms(nsem, ik_group: Integer;
  bitExam: boolean): TADOStoredProc;
begin //
  try
    dmUspevaemost.adospGetAllPredms.Close;
    with dmUspevaemost.adospGetAllPredms.Parameters do
    begin
      Clear;
      CreateParameter('@ik_group', ftInteger, pdInput, 0, ik_group);
      CreateParameter('@n_sem', ftInteger, pdInput, 0, nsem);
      CreateParameter('@bitExam', ftBoolean, pdInput, 0, bitExam);
    end;
    dmUspevaemost.adospGetAllPredms.Active := true;
    Result := dmUspevaemost.adospGetAllPredms;
  except
    Result := nil;
    exit;
    raise;
  end;
end;

// ���������� ��� ��������� ��������� �������� ��. �����
procedure TUspevGroupController.GetAllVeds(nsem, ik_group: Integer);
begin //
  TApplicationController.GetInstance.AddLogEntry
    ('������� ������ ���� ����������');
  dmUspevaemost.adospGetAllVeds4Group.Close;
  with dmUspevaemost.adospGetAllVeds4Group.Parameters do
  begin
    Clear;
    CreateParameter('@ik_group', ftInteger, pdInput, 0, ik_group);
    CreateParameter('@n_sem', ftInteger, pdInput, 0, nsem);
  end;
  dmUspevaemost.adospGetAllVeds4Group.Filter := 'n_module=NULL';
  dmUspevaemost.adospGetAllVeds4Group.Filtered := true;
  dmUspevaemost.adospGetAllVeds4Group.Active := true;

end;

// ��������� ����������� �������������� ���������
// (�� ���� ������� ��� ��� ���)
function TUspevGroupController.GetVedChangeEnabled(): boolean;
begin
  Result := FVedomostController.IsOpened;

  { result:= false;
    if dmUspevaemost.adospSelVed.Active then
    result:= not dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean; }
end;

// ��������� ����������� ��������/�������� ���������
// (������, ���� ��������� ������� � ��� ������� ��������� ���������)
function TUspevGroupController.GetVedChangeOpenEnabled: boolean;
begin
  Result := false;
  if dmUspevaemost.adospSelVed.Active then
    Result := true;
end;

// ��������, ���������� �� ���������
function TUspevGroupController.DoCheckVedExist(ik_upContent: Integer): boolean;
begin
  dmUspevaemost.adospGetAllVeds4Group.Close;
  dmUspevaemost.adospGetAllVeds4Group.Open;
  Result := dmUspevaemost.adospGetAllVeds4Group.Locate('ik_upContent',
    ik_upContent, []);

  { dmUspevaemost.adospSelVed.Active := false;
    with dmUspevaemost.adospSelVed.Parameters do
    begin
    Clear;
    AddParameter;
    // ����� ��������
    Items[0].Value := nSem;
    AddParameter;
    // ����������
    Items[1].Value := ikPredm;
    AddParameter;
    // ��� �������
    Items[2].Value := ikVidZan;
    AddParameter;
    // ������
    Items[3].Value := ikGroup;
    end;
    dmUspevaemost.adospSelVed.ExecProc;
    dmUspevaemost.adospSelVed.Active := true;
    if dmUspevaemost.adospSelVed.FieldByName('ik_Ved').Value = null then
    Result := false
    else
    Result := true; }
end;

// ��������� ��� ���� �������, ��� ������� ����� ���������
// ��������� � ����������� ��� ����� �����������
procedure TUspevGroupController.GetAllVidZanyats(nsem, ik_group: Integer);
begin
  // try
  TApplicationController.GetInstance.AddLogEntry('�������� ���� ����� �������');
  dmUspevaemost.adospGetAllVidZanyat.Close;
  dmUspevaemost.adospGetAllVidZanyat.SQL[1] := '(' + IntToStr(nsem) + ', ' +
    IntToStr(ik_group) + ')';
  dmUspevaemost.adospGetAllVidZanyat.Open;
  // except

  // end;
end;

// ��������� ������ ����� ������� ,������� ��� ����� �������
// (�� ��� �� �������) � ������� ������� �� ����������� ���� �������
procedure TUspevGroupController.GetDependVidZanyats(nsem, ik_group,
  ikVidZan: Integer);
begin
  dmUspevaemost.adospUspevDependVidZanyat.Close;
  with dmUspevaemost.adospUspevDependVidZanyat.Parameters do
  begin
    Clear;
    CreateParameter('@n_sem', ftInteger, pdInput, 0, nsem);
    CreateParameter('@Ik_grup', ftInteger, pdInput, 0, ik_group);
    CreateParameter('@ik_Vid_zanyat', ftInteger, pdInput, 0, ikVidZan);
  end;
  dmUspevaemost.adospUspevDependVidZanyat.Open;
end;

// ��������� ���� �������
procedure TUspevGroupController.SetActiveStudent(const StudGrupIK: integer);
begin

end;

procedure TUspevGroupController.SetContentNaprav(ContentIK: Integer);
begin
  FNapravController.ContentIK := ContentIK;
end;

procedure TUspevGroupController.SetFilterForVidZanyats(CreateEnable, IsCreated,
  IsDependent: boolean);
begin
  dmUspevaemost.adospGetAllVidZanyat.Close;
  dmUspevaemost.adospGetAllVidZanyat.Filter := '((CreateEnable=' +
    BoolToStr(CreateEnable) + ') and (IsCreated=' + BoolToStr(IsCreated) +
    ') and (IsDependent=' + BoolToStr(IsDependent) + '))';
  dmUspevaemost.adospGetAllVidZanyat.Filtered := true;
  dmUspevaemost.adospGetAllVidZanyat.Open;
end;

procedure TUspevGroupController.SetNapravSemester(nsem: Integer);
begin
  FNapravController.Semester := nsem;
end;

// ��������� ������ ��������� �� ���� �������� ����������
// ������ � ��������� ��������
procedure TUspevGroupController.UpdateVedsContent(nsem, ik_group: Integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc := TADOStoredProc.Create(nil);
  try
    tempStoredProc.ProcedureName := 'UspevUpdateAllVedomosts;1';
    tempStoredProc.Connection := dm.DBConnect;
    with tempStoredProc.Parameters do
    begin
      Clear;
      CreateParameter('@ik_grup', ftInteger, pdInput, 0, ik_group);
      CreateParameter('@nSem', ftInteger, pdInput, 0, nsem);
    end;
    tempStoredProc.ExecProc;
  finally
    tempStoredProc.Free;
  end;
end;

// ������� ��� ����������� �� ��. ����� ���������
// ��� ����� ��������
procedure TUspevGroupController.CreateIndependVeds(nsem, ik_group: Integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('�������� ����������� (��������) ����������');
  tempStoredProc := TADOStoredProc.Create(nil);
  try
    tempStoredProc.ProcedureName := 'UspevCreateAllVedsForSemestr;1';
    tempStoredProc.Connection := dm.DBConnect;
    with tempStoredProc.Parameters do
    begin
      Clear;
      CreateParameter('@nSem', ftInteger, pdInput, 0, nsem);
      CreateParameter('@ik_grup', ftInteger, pdInput, 0, ik_group);
    end;
    tempStoredProc.ExecProc;
  finally
    tempStoredProc.Free;
  end;
end;

// ������� ��� ����������� �� ��. ����� ���������
// ��� ����������� ���� �������
procedure TUspevGroupController.CreateDependVeds(nsem, ik_group,
  iK_vid_zanyat: Integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('�������� ��������� (���������) ����������');
  tempStoredProc := TADOStoredProc.Create(nil);
  try
    tempStoredProc.ProcedureName := 'UspevCreateAllVedsForVid_zanyat;1';
    tempStoredProc.Connection := dm.DBConnect;
    with tempStoredProc.Parameters do
    begin
      Clear;
      CreateParameter('@nSem', ftInteger, pdInput, 0, nsem);
      CreateParameter('@ik_grup', ftInteger, pdInput, 0, ik_group);
      CreateParameter('@ik_vid_zanyat', ftInteger, pdInput, 0, iK_vid_zanyat);
    end;
    tempStoredProc.ExecProc;
  finally
    tempStoredProc.Free;
  end;
end;

// ������� ��� ���������
procedure TUspevGroupController.CreateVeds(nsem, ik_group: Integer);
begin
  TApplicationController.GetInstance.AddLogEntry('�������� ����������');

  FVedomostController.Reload(ik_group, nsem);
  try
    FVedomostController.CreateAllVed;
  except
    on E: Exception do
      raise EApplicationException.Create
        ('��������� ������ ��� �������� ����������!', E);
  end;

end;

function TUspevGroupController.CanCreateVnostVed: boolean;
begin
  Result := true;
  { if (dmUspevaemost.adospGetAllVidZanyat.Active) then
    begin
    dmUspevaemost.adospGetAllVidZanyat.First;
    while (not dmUspevaemost.adospGetAllVidZanyat.Eof) do
    begin
    //���� ���� ���� �� 1 ��� �������, �� ��������
    //��� �� ������� ���������, � ��� ������ �������,
    //� ���� ��� ������� ������� �� ������
    if (not dmUspevaemost.adospGetAllVidZanyat.FieldByName('IsCreated').AsBoolean) and
    (not dmUspevaemost.adospGetAllVidZanyat.FieldByName('CreateEnable').AsBoolean) and
    (dmUspevaemost.adospGetAllVidZanyat.FieldByName('IsDependent').AsBoolean)  then
    begin
    result:= true;
    break;
    end;
    dmUspevaemost.adospGetAllVidZanyat.Next;
    end;
    end; }

end;

function TUspevGroupController.CanCreateDependVeds: boolean;
begin
  Result := false;
  if (dmUspevaemost.adospGetAllVidZanyat.Active) then
  begin
    dmUspevaemost.adospGetAllVidZanyat.First;
    while (not dmUspevaemost.adospGetAllVidZanyat.Eof) do
    begin
      // ���� ���� ���� �� 1 ��� �������, �� ��������
      // ��� �� ������� ���������, �� ��� ����� �������,
      // � ���� ��� ������� ������� �� ������
      if (not dmUspevaemost.adospGetAllVidZanyat.FieldByName('IsCreated')
        .AsBoolean) and
        (dmUspevaemost.adospGetAllVidZanyat.FieldByName('CreateEnable')
        .AsBoolean) and
        (dmUspevaemost.adospGetAllVidZanyat.FieldByName('IsDependent').AsBoolean)
      then
      begin
        Result := true;
        break;
      end;
      dmUspevaemost.adospGetAllVidZanyat.next;
    end;
  end;
end;

function TUspevGroupController.CanCreateIndependVeds(nsem,
  ik_group: Integer): boolean;
begin

  if (dmUspevaemost.adospGetAllVidZanyat.Active) then
    Result := not CanUpdateVedsList(nsem, ik_group)
  else
    Result := false;
end;

function TUspevGroupController.CanCreateVeds(nsem, ik_group: Integer): boolean;
begin
  Result := CanCreateDependVeds or CanCreateIndependVeds(nsem, ik_group);
end;

function TUspevGroupController.GetEnableVidZanyats(nsem, ik_group,
  ikVidZan: Integer): string;
begin
  Result := '';
  // ��������� ������ ��������� ����� �������
  GetDependVidZanyats(nsem, ik_group, ikVidZan);
  dmUspevaemost.adospUspevDependVidZanyat.First;
  while not dmUspevaemost.adospUspevDependVidZanyat.Eof do
  begin
    if Result = '' then
      Result := '"' + dmUspevaemost.adospUspevDependVidZanyat.FieldByName
        ('cName_vid_zanyat').AsString + '"'
    else
      Result := ', "' + dmUspevaemost.adospUspevDependVidZanyat.FieldByName
        ('cName_vid_zanyat').AsString + '"';
    dmUspevaemost.adospUspevDependVidZanyat.next;
  end;
  dmUspevaemost.adospUspevDependVidZanyat.Close;
  if Result <> '' then
  begin // ����� ��������� ���������������
    if dmUspevaemost.adospGetAllVidZanyat.Active then
      if dmUspevaemost.adospGetAllVidZanyat.Locate('ik_vid_zanyat', ikVidZan, [])
      then
      begin
        Result := '������� ��� ��������� "' +
          dmUspevaemost.adospGetAllVidZanyat.FieldByName('cName_vid_zanyat')
          .AsString + '". ������ ����� ������� ��������� ' + Result;
      end;
  end;
end;

// ��������� ���� �� �������� ������ � ������� �����
function TUspevGroupController.ArePredmsInUchPlan(nsem,
  ik_group: Integer): boolean;
begin

  // ���� ���� ���� �������
  if (dmUspevaemost.adospGetAllVidZanyat.Active) and
    (dmUspevaemost.adospGetAllVidZanyat.RecordCount > 0) then
    Result := true
  else
    Result := false;
end;

function TUspevGroupController.BuildSpravka2014(_ikStudGrup, _type_spr: Integer)
  : TReportBase;
var
  report: TSpravka_Report;
  result_report: TSpravka;
  FindRange: variant;
begin
  report := TSpravka_Report.Create(_ikStudGrup, _type_spr);
  result_report := report.AddReport();
  Result := SpravkaReport.Create(result_report);

  if (_type_spr = 1) then
  begin
    Result.ReportTemplate := ExtractFilePath(Application.ExeName) +
      'reports\SprvPens.xlt';
  end
  else
  begin
    Result.ReportTemplate := ExtractFilePath(Application.ExeName) +
      'reports\Sprv.xlt';
  end;

  report.Free;
end;

function TUspevGroupController.BuildVedomost2014(ikGrup, nsem, ikVed, ikFac,
  ikSpec: Integer): TReportBase;
var
  report: TAssemly_Report;
  result_report: TVedomost;
  FindRange: variant;
begin

  report := TAssemly_Report.Create(ikVed);
  result_report := report.AddReport();
  Result := TBRS2014VedomostReport.Create(result_report);
  if (result_report.ik_vid_zan <> GOS_EXAM) then
  begin
    if (result_report.Is_brs) then
    begin
      Result.ReportTemplate := ExtractFilePath(Application.ExeName) +
        'reports\Vedomost_with_BRS.xlt';
    end
    else
    begin
      Result.ReportTemplate := ExtractFilePath(Application.ExeName) +
        'reports\Vedomost_No_BRS.xlt';
    end;
  end
  else
  begin
    Result.ReportTemplate := ExtractFilePath(Application.ExeName) +
      'reports\GOS_ekz.xlt';
  end;
  report.Free;

end;

// ���������, ����� �� �������� ������ ��������� ���������
function TUspevGroupController.CanUpdateVedsList(nsem,
  ik_group: Integer): boolean;
begin
  Result := false;
  if (dmUspevaemost.adospGetAllVidZanyat.Active) then
  begin
    dmUspevaemost.adospGetAllVidZanyat.First;
    while (not dmUspevaemost.adospGetAllVidZanyat.Eof) do
    begin
      // ���� ������� ���� �� 1 ��������� (���� �� �� 1 ���� �������),
      // �� ����� ��������� ���������
      if (dmUspevaemost.adospGetAllVidZanyat.FieldByName('IsCreated').AsBoolean)
      then
      begin
        Result := true;
        break;
      end;
      dmUspevaemost.adospGetAllVidZanyat.next;
    end;
  end;
end;

// ������� ��� ����������� �� ��. ����� ���������
// ��� ����� ��������
procedure TUspevGroupController.UpdateVedsList(nsem, ik_group: Integer);
var
  tempStoredProc: TADOStoredProc;
begin
  // ���� ����� �������� ���������
  if CanUpdateVedsList(nsem, ik_group) then
  begin
    tempStoredProc := TADOStoredProc.Create(nil);
    try
      tempStoredProc.ProcedureName := 'UspevCreateAllVedsForSemestr;1';
      tempStoredProc.Connection := dm.DBConnect;
      with tempStoredProc.Parameters do
      begin
        Clear;
        CreateParameter('@nSem', ftInteger, pdInput, 0, nsem);
        CreateParameter('@ik_grup', ftInteger, pdInput, 0, ik_group);
      end;
      tempStoredProc.ExecProc;
    finally
      tempStoredProc.Free;
    end;
  end;
end;

// ��������� ������ ��� ��������� ���������� ��� ����� ��������,
// ������� ����������� �� ��. �����
// ���������� ������, ���� � ��. ����� ���� ����������
function TUspevGroupController.GetListOfVeds(nsem, ik_group, fac_ik: Integer;
  var countPredms: Integer): Integer;
begin

  with FVedomostController do
  begin
    Reload(ik_group, nsem); // ��������� ������ �� ������� �������� � ������
    countPredms := ContentCount; // �������, ������� ������ ���� ����� �����
    Result := VedomCount; // ������� �� ��� ������� ����������

    if (Result > 0) and (countPredms > Result) then
    // ���� ��������� �������, �� �� ���
    begin
      CreateAllVed; // ������� ���������� ���������
      Result := VedomCount; // ����� ������������ ������ Result = countPredms
    end;
  end;

end;

// ������ ��������� ���������
procedure TUspevGroupController.GetVedsHeader(ikVed: Integer);
begin
  dmUspevaemost.adospSelVed.Close;
  dmUspevaemost.adospSelVed.Fields.Clear;
  with dmUspevaemost.adospSelVed.Parameters do
  begin
    Clear;
    // ��� ���������
    AddParameter;
    Items[0].Value := ikVed;
  end;
  dmUspevaemost.adospSelVed.Active := true;
end;

// ������ ������ (������) ���������
function TUspevGroupController.SelectVed(ikVed: Integer): TADODataSet;
begin
  try
    // Result:= TGeneralController.Instance.getDataSetValues(@dmUspevaemost.adospSelVedGroup, 'select * from GetSmallVedForGrup('+IntToStr(ikVed)+')', 'ik_zach', false, NULL);
    FVedomostController.Vedomost := ikVed;
    Result := FVedomostController.UspevDataSet;
  except
    on E: Exception do
    begin
      raise EApplicationException.Create
        ('��������� ������ ��� �������� ���������.', E);
      Result := nil;
      exit;
    end;
  end;
end;

// ��������� ������ ��������� (������)
procedure TUspevGroupController.ApplyUspev(ikVed, ikVidZan: Integer;
  dbgrdVed: PDBGrid);
var
  FindRange: variant;
begin
  // TApplicationController.GetInstance.AddLogEntry('���������� ������ � ��� ��������.');
  // FVedomostController.Save;
  { dmUspevaemost.adospSelVedGroup.DisableControls;
    try
    dmUspevaemost.adospSelVedGroup.First;
    while not dmUspevaemost.adospSelVedGroup.Eof do
    begin
    if (dbgrdVed.Fields[1].Value <> Null)and
    (dbgrdVed.Fields[1].Text <> '') and
    //		   ���� ��� �������, �� ���������� ������
    ((ikVidZan<>6) or ((ikVidZan=6) and
    (dmUspevaemost.adospSelVedGroup.FieldByName('dopusc').Value=true))) then
    begin
    with dmUspevaemost.adospAppendUspev.Parameters do
    begin
    Clear;
    CreateParameter('@flag', ftInteger, pdInput, 0, 0);
    CreateParameter('@Ik_ved', ftInteger, pdInput, 0, ikVed);
    CreateParameter('@Ik_zach', ftInteger, pdInput, 0, dbgrdVed.Fields[5].Value);
    if (dbgrdVed.Fields[8].Value <> Null) then
    CreateParameter('@Cosenca', ftInteger, pdInput, 0, dbgrdVed.Fields[8].Value)
    else
    CreateParameter('@Cosenca', ftInteger, pdInput, 0, -1);
    CreateParameter('@cTema', ftString, pdInput, 2000, '');
    CreateParameter('@i_balls', ftInteger, pdInput, 0, dbgrdVed.Fields[7].Value)
    end;
    dmUspevaemost.adospAppendUspev.ExecProc;

    //if (dbgrdVed.Fields[4].AsString>'') then
    //begin
    with dmUspevaemost.adospAppendUspevKPTheme.Parameters do
    begin
    Clear;
    CreateParameter('@flag', ftInteger, pdInput, 0, 1);
    CreateParameter('@Ik_zach', ftInteger, pdInput, 0, dbgrdVed.Fields[5].Value);
    CreateParameter('@Ik_ved', ftInteger, pdInput, 0, ikVed);
    CreateParameter('@KPTheme', ftString, pdInput, 2000, dbgrdVed.Fields[4].AsString);
    end;
    dmUspevaemost.adospAppendUspevKPTheme.ExecProc;
    //end;

    end;
    dmUspevaemost.adospSelVedGroup.Next;
    end;
    finally
    dmUspevaemost.adospSelVedGroup.EnableControls;
    end; }
end;

// ��������� ������ ��������� (�����)
procedure TUspevGroupController.ApplyVed(VedNum: string; ikVidExam: Integer;
  bitClose, bitNapr: boolean; ikPrepod: variant; DateExam: TDateTime);
begin
  TApplicationController.GetInstance.AddLogEntry('�������� ������ ���������');

  FVedomostController.Save(ikVidExam, VedNum, ikPrepod, DateExam,
    bitClose, bitNapr);

  { with dmUspevaemost.adospAppVed.Parameters do
    begin
    Clear;
    CreateParameter('@flag', ftInteger, pdInput, 0, flag);
    CreateParameter('@cNumber_ved', ftString, pdInput, 12, VedNum);
    CreateParameter('@Ik_grup', ftInteger, pdInput, 0, ik_group);
    CreateParameter('@ik_vid_zanyat', ftInteger, pdInput, 0, ikVidZan);
    CreateParameter('@n_sem', ftInteger, pdInput, 0, nSem);
    CreateParameter('@ik_disc', ftInteger, pdInput, 0, ikPredm);
    CreateParameter('@Itab_n', ftString, pdInput, 50, ikPrepod);
    CreateParameter('@Ik_vid_exam', ftInteger, pdInput, 0, ikVidExam);
    CreateParameter('@Dd_exam', ftDateTime, pdInput, 0, DateExam);
    CreateParameter('@dD_vydano', ftDateTime, pdInput, 0, Date);
    CreateParameter('@lClose', ftBoolean, pdInput, 0, bitClose);
    CreateParameter('@lPriznak_napr', ftBoolean, pdInput, 0, bitNapr);
    CreateParameter('@Ik_ved', ftInteger, pdInput, 0, ikVed);
    CreateParameter('@lVnosn', ftBoolean, pdInput, 0, bitVnost);    // �������� ���
    CreateParameter('@ik_upContent', ftInteger, pdInput, 0, ik_upContent);
    end;
    dmUspevaemost.adospAppVed.ExecProc; }
end;

// ��������� ���������
function TUspevGroupController.OpenVed(ikVed: Integer): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  Result := false;
  TApplicationController.GetInstance.AddLogEntry
    ('�������� �������� ��� ���������');
  try
    tempStoredProc := TADOStoredProc.Create(nil);
    tempStoredProc.ProcedureName := 'OpenVedomost;1';
    tempStoredProc.Connection := dm.DBConnect;
    tempStoredProc.Parameters.CreateParameter('@Ik_ved', ftInteger, pdInput,
      0, ikVed);
    tempStoredProc.ExecProc;
    Result := true;
  finally
    tempStoredProc.Free;
  end;
end;

// ��������� ������� � ��������� (�����)
function TUspevGroupController.UpdateDopuskForVed(ikVed: Integer): boolean;
begin
  try
    dmUspevaemost.adospUpdateDopusk.Active := false;
    with dmUspevaemost.adospUpdateDopusk.Parameters do
    begin
      Clear;
      CreateParameter('@ik_ved', ftInteger, pdInput, 0, ikVed);
    end;

    dmUspevaemost.adospUpdateDopusk.ExecProc;
    Result := true;
  except
    Result := false;
    exit;
  end;
end;

// SelContrlForVinVed �������� ������ ��������� ����� ��������
// ��� �������� �������� ���������
// (�������� ������ ��, ��� ���-� �� ������� ���������)
function TUspevGroupController.SelContrlForVinVed(ik_group,
  nsem: Integer): boolean;
begin
  try
    dmUspevaemost.adosp4VinVed.Active := false;
    with dmUspevaemost.adosp4VinVed.Parameters do
    begin
      Clear;
      AddParameter;
      Items[0].Value := ik_group;
      AddParameter;
      Items[1].Value := nsem;
    end;
    dmUspevaemost.adosp4VinVed.Active := true;
    Result := true;
  except
    Result := false;
    raise;
  end;
end;

// �������� ��� ����������, ���-� ���� � ��. ����� (��� ���� �������)
function TUspevGroupController.GetContentDS(StudIK: Integer)
  : TADODataSet;
begin
  FNapravController.Reload(StudIK);
  Result := FNapravController.ContentDS;
end;

function TUspevGroupController.GetContrlVidZanForRaport(ik_group,
  nsem: Integer): boolean;
begin
  try
    dmUspevaemost.adospGetUpContRap.Close;
    with dmUspevaemost.adospGetUpContRap.Parameters do
    begin
      Clear;
      CreateParameter('@ik_group', ftInteger, pdInput, 0, ik_group);
      CreateParameter('@n_sem', ftInteger, pdInput, 0, nsem);
    end;
    dmUspevaemost.adospGetUpContRap.Open;
    Result := true;
  except
    Result := false;
    exit;
  end;
end;

// ���������� ������� � ��������
function TUspevGroupController.GetDopusksList(SourceDataSet: PDataSet;
  ik_group, ik_upContent, dopusk: Integer): boolean;
begin
  try
    TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'select * from GetDopuscForVedom(' + IntToStr(ik_group) + ', ' +
      IntToStr(ik_upContent) + ') where dopusc = ' + IntToStr(dopusk) +
      ' order by FIO', 'ik_zach', false, null);
    Result := true;
  except
    on E: Exception do
    begin
      raise EApplicationException.Create
        ('��������� ������ ��� �������� ������ ���������� ���������!', E);
      Result := false;
      exit;
    end;
  end;
end;

// �������� � ��������� � ���������� � ��������
// (�������, �����������, ���������)
procedure TUspevGroupController.AppendRaports(flag, ik_zach,
  ik_upContent: Integer; bitClose: boolean);
begin
  with dmUspevaemost.adospAppendRap.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 0, null);
    CreateParameter('@flag', ftInteger, pdInput, 0, flag);
    CreateParameter('@ik_zach', ftInteger, pdInput, 0, ik_zach);
    CreateParameter('@ik_upContent', ftInteger, pdInput, 0, ik_upContent);
    CreateParameter('@bitClose', ftBoolean, pdInput, 0, bitClose);
  end;
  dmUspevaemost.adospAppendRap.ExecProc;
  if (dmUspevaemost.adospAppendRap.Parameters.ParamByName('@RETURN_VALUE')
    .Value < 0) then
    raise EApplicationException.Create
      ('��������� ������ ��� ������ � ��������.');

end;

// �������, ���������, ��������� �������
// �������� ���������� ������� � ��� ��������� ��������
function TUspevGroupController.DoRaports(lv1, lv2, lvDop, lvNDop: TListView;
  ik_group, ik_upContent: Integer): boolean;
var
  i: Integer;
  li: TListItem;
  SourceDataSet: TADODataSet;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('�������� ������� � ���������');
  try
    // ��������� ������ ����������/������������
    SourceDataSet := TADODataSet.Create(nil);
    TGeneralController.Instance.getDataSetValues(@SourceDataSet,
      'select * from GetDopuscForVedom(' + IntToStr(ik_group) + ', ' +
      IntToStr(ik_upContent) + ') order by FIO', 'ik_zach', false, null);
  except
    Result := false;
    exit;
  end;
  try
    // ��������� ��� � ����� ����������
    dmUspevaemost.adospAppendRap.Connection.BeginTrans;
    // �������� ������ ��������: �������� �� ������ ������������
    for i := 0 to lvNDop.Items.Count - 1 do
    begin
      li := lvNDop.Items[i];
      if SourceDataSet.Locate('ik_zach', StrToInt(li.SubItems[1]), []) then
      begin
        // ������� ������, ���� ��� ��� ���
        if not SourceDataSet.FieldByName('bitRaport').AsBoolean then
          AppendRaports(1, StrToInt(li.SubItems[1]), ik_upContent, false)
          // ���� ������ ��� ������, �� ������, ����� ��������� ���
        else if (SourceDataSet.FieldByName('dopusc').AsBoolean) then
          AppendRaports(0, StrToInt(li.SubItems[1]), ik_upContent, false);
      end;
    end;
    // �������� ��������: �������� �� ������ ����������
    for i := 0 to lvDop.Items.Count - 1 do
    begin
      li := lvDop.Items[i];
      if SourceDataSet.Locate('ik_zach', StrToInt(li.SubItems[1]), []) then
        // ���� ���� �������� ������, ���������
        if (SourceDataSet.FieldByName('bitRaport').AsBoolean) and
          (not SourceDataSet.FieldByName('dopusc').AsBoolean) then
          AppendRaports(0, StrToInt(li.SubItems[1]), ik_upContent, true);
    end;
    dmUspevaemost.adospAppendRap.Connection.CommitTrans;
    Result := true;
  except
    dmUspevaemost.adospAppendRap.Connection.RollbackTrans;
    Result := false;
    exit;
  end;
end;

// �������� ���������
procedure TUspevGroupController.DelVed(ik_ved: variant);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('�������� ���������');
  FVedomostController.DelVed(ik_ved);

 { tempStoredProc := TADOStoredProc.Create(nil);
  try
    tempStoredProc.ProcedureName := 'DelVed;1';
    tempStoredProc.Connection := dm.DBConnect;
    with tempStoredProc.Parameters do
    begin
      Clear;
      CreateParameter('@ik_ved', ftInteger, pdInput, 0, ik_ved);
    end;
    tempStoredProc.ExecProc;
  finally
    tempStoredProc.Free;
  end;           }
end;

destructor TUspevGroupController.Destroy;
begin
  FreeAndNil(FVedomostController);
  FreeAndNil(FBRSVedomostController);
  FreeAndNil(FNapravController);

  inherited;
end;

procedure IncExcelCell(var CellNumber: string);
var
  c: char;
begin
  c := CellNumber[length(CellNumber)];
  if (c = 'Z') then
    CellNumber := Copy(CellNumber, 1, length(CellNumber) - 1) + 'AA'
  else
  begin
    inc(c);
    CellNumber := Copy(CellNumber, 1, length(CellNumber) - 1) + c;
  end;

end;

/// ////////������� � Excel ����������///////////

procedure TUspevGroupController.PrintAttestation(ikGrup, nsem, nAtt,
  ikFac: Integer; date: string);
var
  E: variant;
  str, prop, uvag: string;
  nVed: Integer;
  Count: Integer;
  // stroka,
  stolb: string;
  // fl:boolean;
  i: Integer;
begin

  try
    E := CreateOleObject('Excel.Application');
    str := ExtractFilePath(Application.ExeName) + 'reports\Attest.XLT';
    E.WorkBooks.Add(str);
    // E.Visible := true;

    E.Sheets[1].Select;
    E.Sheets.Add(after := E.Sheets.item[1]);
    E.Sheets[2].PageSetup.Orientation := 2;
    E.Sheets[2].name := '����������';

    E.Sheets[1].Range['A1:A2'].Copy;
    E.Sheets[2].Range['A1:A2'].Insert;

    dmUgtuStructure.adoqSpecFac.Open;
    dmUgtuStructure.adoqSpecFac.Filter := '';
    if dmUgtuStructure.adoqSpecFac.Locate('ik_fac', ikFac, [loCaseInsensitive])
    then
    begin
      str := dmUgtuStructure.adoqSpecFacCname_fac.AsString;
      E.Sheets[2].Range['A1'].Value := str + '.  ����������  ' + date;
    end;

    dmUgtuStructure.adoqSelAllGroups.Open;
    dmUgtuStructure.adoqSelAllGroups.Filter := '';
    if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup', ikGrup,
      [loCaseInsensitive]) then
    begin
      str := dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup')
        .AsString;
      E.Sheets[2].Range['A2'].Value := '������  ' + str;
    end;

    dmUspevaemost.adospGetAllAtt.Active := false;
    with dmUspevaemost.adospGetAllAtt.Parameters do
    begin
      Clear;
      AddParameter;
      Items[0].Value := ikGrup;
      AddParameter;
      Items[1].Value := nsem;
      AddParameter;
      Items[2].Value := nAtt;
    end;
    dmUspevaemost.adospGetAllAtt.ExecProc;
    dmUspevaemost.adospGetAllAtt.Active := true;

    E.Sheets[1].Range['A3:B7'].Copy;
    E.Sheets[2].Range['A3:B7'].Insert;

    stolb := 'C';

    dmUspevaemost.adospGetAllAtt.First;

    nVed := dmUspevaemost.adospGetAllAtt.FieldByName('ik_ved').asinteger;

    dmUspevaemost.adodsSelAttGroup.Active := false;
    dmUspevaemost.adodsSelAttGroup.CommandText :=
      'select * from GetSmallAttForGrup(' + IntToStr(nVed) + ')';
    dmUspevaemost.adodsSelAttGroup.Active := true;

    Count := dmUspevaemost.adodsSelAttGroup.RecordCount;

    str := stolb;
    While not dmUspevaemost.adospGetAllAtt.Eof do
    begin
      E.Sheets[1].Range['C3:D7'].Copy;

      str := stolb;
      IncExcelCell(stolb);
      E.Sheets[2].Range[str + '3'].Insert;
      E.Sheets[2].Range[str + '4'] := dmUspevaemost.adospGetAllAtt.FieldByName
        ('cname_disc').AsString;
      str := stolb;
      IncExcelCell(stolb);
      dmUspevaemost.adospGetAllAtt.next;
    end;

    E.Sheets[2].Range['C3:' + str + '3'].MergeCells := true;
    E.Sheets[2].Range['C3:' + str + '3'].Value := '����������';

    str := stolb;
    IncExcelCell(stolb);

    E.Sheets[1].Range['E3:F6'].Copy;
    E.Sheets[2].Range[str + '3'].Insert;

    for i := 1 to Count - 1 do
    begin
      E.Sheets[2].Range['A6:' + (stolb) + '6'].Copy;
      E.Sheets[2].Range['A' + IntToStr(i + 6)].Insert;
    end;

    // E.Sheets[1].Range['A7:D7'].Copy;
    // E.Sheets[2].Range['A'+inttostr(count+6)+':D'+inttostr(count+6)].Insert;

    dmUspevaemost.adodsSelAttGroup.First;
    i := 1;
    While not dmUspevaemost.adodsSelAttGroup.Eof do
    begin
      E.Sheets[2].Range['A' + IntToStr(5 + i)].Value := IntToStr(i);
      E.Sheets[2].Range['B' + IntToStr(5 + i)].Value :=
        dmUspevaemost.adodsSelAttGroup.FieldByName('StudName').AsString + '   '
        + dmUspevaemost.adodsSelAttGroup.FieldByName('KatZach').AsString;

      inc(i);
      dmUspevaemost.adodsSelAttGroup.next;
    end;

    dmUspevaemost.adospGetAllAtt.First;
    stolb := 'C';

    While not dmUspevaemost.adospGetAllAtt.Eof do
    begin
      i := 1;
      str := stolb;
      IncExcelCell(stolb);
      nVed := dmUspevaemost.adospGetAllAtt.FieldByName('ik_ved').asinteger;

      dmUspevaemost.adodsSelAttGroup.Active := false;
      dmUspevaemost.adodsSelAttGroup.CommandText :=
        'select * from GetSmallAttForGrup(' + IntToStr(nVed) + ')';
      dmUspevaemost.adodsSelAttGroup.Active := true;

      Count := dmUspevaemost.adodsSelAttGroup.RecordCount;

      While not dmUspevaemost.adodsSelAttGroup.Eof do
      begin
        if dmUspevaemost.adodsSelAttGroup.FieldByName('cosenca').Value = 1 then
          E.Sheets[2].Range[str + IntToStr(5 + i)].Value := '��'
        else
          E.Sheets[2].Range[str + IntToStr(5 + i)].Value := '���';

        if dmUspevaemost.adodsSelAttGroup.FieldByName('propcount').Value = null
        then
          prop := '-'
        else
          prop := dmUspevaemost.adodsSelAttGroup.FieldByName
            ('propcount').AsString;

        if dmUspevaemost.adodsSelAttGroup.FieldByName('uvag_propcount').Value = null
        then
          uvag := '-'
        else
          uvag := dmUspevaemost.adodsSelAttGroup.FieldByName
            ('uvag_propcount').AsString;

        E.Sheets[2].Range[(stolb) + IntToStr(5 + i)].Value := uvag + '/' + prop;

        if uvag <> '-' then
          E.Sheets[1].Range['a' + IntToStr(55 + i)].Value :=
            E.Sheets[1].Range['a' + IntToStr(55 + i)].Value + StrToInt(uvag);

        if prop <> '-' then
          E.Sheets[1].Range['b' + IntToStr(55 + i)].Value :=
            E.Sheets[1].Range['b' + IntToStr(55 + i)].Value + StrToInt(prop);

        inc(i);
        dmUspevaemost.adodsSelAttGroup.next;
      end;

      IncExcelCell(stolb);
      dmUspevaemost.adospGetAllAtt.next;
    end;

    i := 1;

    dmUspevaemost.adodsSelAttGroup.First;
    While not dmUspevaemost.adodsSelAttGroup.Eof do
    begin
      E.Sheets[2].Range[(stolb) + IntToStr(5 + i)].Value :=
        IntToStr(E.Sheets[1].Range['a' + IntToStr(55 + i)].Value) + '/' +
        IntToStr(E.Sheets[1].Range['b' + IntToStr(55 + i)].Value);

      inc(i);
      dmUspevaemost.adodsSelAttGroup.next;
    end;

    E.Sheets[1].Range['A8:A12'].Copy;
    E.Sheets[2].Range['A' + IntToStr(Count + 7) + ':A' +
      IntToStr(Count + 7)].Insert;

    E.Sheets[2].Range['A4'].RowHeight := 24;
    E.Sheets[2].Range['A' + IntToStr(Count + 6)].RowHeight := 19.5;

    E.Sheets[2].Range['A1'].ColumnWidth := 2.43;
    E.Sheets[2].Range['B1'].ColumnWidth := 17.86;

    str := stolb;
    stolb := 'C';
    while str > stolb do
    begin
      E.Sheets[2].Range[(stolb) + '1'].ColumnWidth := 6.43;
      IncExcelCell(stolb);
    end;

    E.Sheets[2].Range[(stolb) + '1'].ColumnWidth := 13.57;
    IncExcelCell(stolb);
    E.Sheets[2].Range[(stolb) + '1'].ColumnWidth := 10;

    E.Sheets[2].PageSetup.LeftMargin := 29;
    E.Sheets[2].PageSetup.RightMargin := 29;
    E.Sheets[2].PageSetup.TopMargin := 34;
    E.Sheets[2].PageSetup.BottomMargin := 29;
    E.Sheets[2].PageSetup.Order := 2;

    E.DisplayAlerts := false;
    E.Sheets[1].Delete;
    E.DisplayAlerts := true;

    // E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
    E.Visible := true;

  except
    on Ex: Exception do
    begin
      E.Quit;
      E := UnAssigned;
      raise EApplicationException.Create
        ('��������� ������ ��� �������� ���������.', Ex);
      exit;
    end;
  end;

end;

/// ////////������� � Excel ������ ����������///////////

procedure TUspevGroupController.PrintBlankAttestation(ikGrup, nsem, nAtt,
  ikFac: Integer; date: string);
var
  E: variant;
  str: string;
  nVed: Integer;
  Count: Integer;
  // stroka,
  stolb: string;
  // fl:boolean;
  i: Integer;
begin

  try
    E := CreateOleObject('Excel.Application');
    str := ExtractFilePath(Application.ExeName) + 'reports\Attest.XLT';
    E.WorkBooks.Add(str);
    // E.Visible := true;

    E.Sheets[1].Select;
    E.Sheets.Add(after := E.Sheets.item[1]);
    E.Sheets[2].PageSetup.Orientation := 2;
    E.Sheets[2].name := '����������';

    E.Sheets[1].Range['A1:A2'].Copy;
    E.Sheets[2].Range['A1:A2'].Insert;

    dmUgtuStructure.adoqSpecFac.Open;
    dmUgtuStructure.adoqSpecFac.Filter := '';
    if dmUgtuStructure.adoqSpecFac.Locate('ik_fac', ikFac, [loCaseInsensitive])
    then
    begin
      str := dmUgtuStructure.adoqSpecFacCname_fac.AsString;
      E.Sheets[2].Range['A1'].Value := str + '.  ����������  ' + date;
    end;

    dmUgtuStructure.adoqSelAllGroups.Open;
    dmUgtuStructure.adoqSelAllGroups.Filter := '';
    if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup', ikGrup,
      [loCaseInsensitive]) then
    begin
      str := dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup')
        .AsString;
      E.Sheets[2].Range['A2'].Value := '������  ' + str;

    end;

    dmUspevaemost.adospGetAllAtt.Active := false;
    with dmUspevaemost.adospGetAllAtt.Parameters do
    begin
      Clear;
      AddParameter;
      Items[0].Value := ikGrup;
      AddParameter;
      Items[1].Value := nsem;
      AddParameter;
      Items[2].Value := nAtt;
    end;
    dmUspevaemost.adospGetAllAtt.ExecProc;
    dmUspevaemost.adospGetAllAtt.Active := true;

    E.Sheets[1].Range['A3:B7'].Copy;
    E.Sheets[2].Range['A3:B7'].Insert;

    stolb := 'C';

    dmUspevaemost.adospGetAllAtt.First;

    nVed := dmUspevaemost.adospGetAllAtt.FieldByName('ik_ved').asinteger;

    dmUspevaemost.adodsSelAttGroup.Active := false;
    dmUspevaemost.adodsSelAttGroup.CommandText :=
      'select * from GetSmallAttForGrup(' + IntToStr(nVed) + ')';
    dmUspevaemost.adodsSelAttGroup.Active := true;

    Count := dmUspevaemost.adodsSelAttGroup.RecordCount;

    While not dmUspevaemost.adospGetAllAtt.Eof do
    begin
      E.Sheets[1].Range['C3:D7'].Copy;

      str := stolb;
      IncExcelCell(stolb);
      E.Sheets[2].Range[str + '3:' + stolb + '7'].Insert;
      E.Sheets[2].Range[str + '4'] := dmUspevaemost.adospGetAllAtt.FieldByName
        ('cname_disc').AsString;
      str := stolb;
      IncExcelCell(stolb);
      dmUspevaemost.adospGetAllAtt.next;
    end;

    E.Sheets[2].Range['C3:' + str + '3'].MergeCells := true;
    E.Sheets[2].Range['C3:' + str + '3'].Value := '����������';

    str := stolb;
    IncExcelCell(stolb);

    E.Sheets[1].Range['E3:F6'].Copy;
    E.Sheets[2].Range[str + '3:' + stolb + '6'].Insert;

    for i := 1 to Count - 1 do
    begin
      E.Sheets[2].Range['A6:' + stolb + '6'].Copy;
      E.Sheets[2].Range['A' + IntToStr(i + 6) + ':' + stolb +
        IntToStr(i + 6)].Insert;
    end;

    // E.Sheets[1].Range['A7:D7'].Copy;
    // E.Sheets[2].Range['A'+inttostr(count+6)+':D'+inttostr(count+6)].Insert;

    dmUspevaemost.adodsSelAttGroup.First;
    i := 1;
    While not dmUspevaemost.adodsSelAttGroup.Eof do
    begin
      E.Sheets[2].Range['A' + IntToStr(5 + i)].Value := IntToStr(i);
      E.Sheets[2].Range['B' + IntToStr(5 + i)].Value :=
        dmUspevaemost.adodsSelAttGroup.FieldByName('StudName').AsString + '   '
        + dmUspevaemost.adodsSelAttGroup.FieldByName('KatZach').AsString;

      inc(i);
      dmUspevaemost.adodsSelAttGroup.next;
    end;

    E.Sheets[1].Range['A8:A12'].Copy;
    E.Sheets[2].Range['A' + IntToStr(Count + 7) + ':A' +
      IntToStr(Count + 7)].Insert;

    E.Sheets[2].Range['A4'].RowHeight := 24;
    E.Sheets[2].Range['A' + IntToStr(Count + 6)].RowHeight := 19.5;

    E.Sheets[2].Range['A1'].ColumnWidth := 2.43;
    E.Sheets[2].Range['B1'].ColumnWidth := 17.86;

    stolb := 'C';
    while str > stolb do
    begin
      E.Sheets[2].Range[stolb + '1'].ColumnWidth := 6.43;
      IncExcelCell(stolb);
    end;

    E.Sheets[2].Range[stolb + '1'].ColumnWidth := 13.57;
    IncExcelCell(stolb);
    E.Sheets[2].Range[stolb + '1'].ColumnWidth := 10;

    E.Sheets[2].PageSetup.LeftMargin := 29;
    E.Sheets[2].PageSetup.RightMargin := 29;
    E.Sheets[2].PageSetup.TopMargin := 34;
    E.Sheets[2].PageSetup.BottomMargin := 29;
    E.Sheets[2].PageSetup.Order := 2;

    E.DisplayAlerts := false;
    E.Sheets[1].Delete;
    E.DisplayAlerts := true;

    // E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
    E.Visible := true;

  except
    on Ex: Exception do
    begin
      E.Quit;
      E := UnAssigned;
      raise EApplicationException.Create
        ('��������� ������ ��� �������� ������ ����������.', Ex);
      exit;
    end;
  end;

end;

// **********������� � EXCEL ����������************
// ���������� ����� ��������� (� ��������)
procedure TUspevGroupController.printVed(ikGrup, nsem, ikVed, ikFac,
  ikSpec: Integer);
var
  VedList: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('���������. ������� � Excel ���������');

  VedList := GetAllVedomosts(ikGrup, nsem);

  // ��������� ������, ����� �������� ������ 1 ���������
  VedList.Filter := 'Ik_ved=' + IntToStr(ikVed);
  VedList.Filtered := true;
  printVedomost(VedList, ikGrup, nsem, ikFac, ikSpec, true);
end;

// ���������� ��� ������ ���������� (��� ������)
procedure TUspevGroupController.printAllVedomost(ikGrup, nsem, ikFac,
  ikSpec: Integer);
var
  VedList: TADOStoredProc;
begin

  TApplicationController.GetInstance.AddLogEntry
    ('���������. ������� � Excel ���� ����������');

  VedList := GetAllVedomosts(ikGrup, nsem);

  printVedomost(VedList, ikGrup, nsem, ikFac, ikSpec, true);

end;

// ************������� � EXCEL ����������******************
// ������� ������ ���� ��������� � �������� ����������
function TUspevGroupController.GetAllVedomosts(ikGrup, nsem: Integer)
  : TADOStoredProc;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc := TADOStoredProc.Create(nil);
  try
    tempStoredProc.ProcedureName := 'GetAllVedomostsForGrupWithBRS;1';
    tempStoredProc.Connection := dm.DBConnect;
    tempStoredProc.Parameters.CreateParameter('@ik_group', ftInteger, pdInput,
      0, ikGrup);
    tempStoredProc.Parameters.CreateParameter('@n_sem', ftInteger,
      pdInput, 0, nsem);
    tempStoredProc.Open;
    Result := tempStoredProc;
  except
    on E: Exception do
    begin
      tempStoredProc.Free;
      raise EApplicationException.Create
        ('��������� ������ ��� �������� ������ ��������� ����������.', E);
    end;
  end;
end;

// ������� ��������� ���������
function TUspevGroupController.GetVedomsShapca(ik_ved: Integer): boolean;
begin
  try
    dmUspevaemost.adospVedTop.Close;
    with dmUspevaemost.adospVedTop.Parameters do
    begin
      Clear;
      CreateParameter('@ik_ved', ftInteger, pdInput, 0, ik_ved);
    end;
    dmUspevaemost.adospVedTop.Open;
    Result := true;
  except
    Result := false;
    exit;
  end;
end;

// ������� ���������� ��������� (���-�� 3,4,5)

function TUspevGroupController.GetVedomostController: TVedomostController;
begin

end;

procedure TUspevGroupController.GetVedomsBottom(ik_ved, iK_vid_zanyat: Integer);
begin
  dmUspevaemost.adospSelVedBottom.Close;
  with dmUspevaemost.adospSelVedBottom.Parameters do
  begin
    Clear;
    CreateParameter('@iK_vid_zanyat', ftInteger, pdInput, 0, iK_vid_zanyat);
    CreateParameter('@ik_ved', ftInteger, pdInput, 0, ik_ved);
  end;
  dmUspevaemost.adospSelVedBottom.Open;
end;

function TUspevGroupController.GetVedomSet: TADODataSet;
begin
  Result := FVedomostController.DataSet;
end;

// �������� c��������� ��������� � ���������
function TUspevGroupController.GetVedomsOsenciWithDopusk(ik_ved: Integer)
  : TADOStoredProc;
begin
  Result := TADOStoredProc.Create(nil);
  Result.Connection := dm.DBConnect;
  Result.ProcedureName := 'UspevSelVedWithDopusk;1';
  Result.Parameters.CreateParameter('@RETURN_VALUE', ftInteger,
    pdReturnValue, 4, null);
  Result.Parameters.CreateParameter('@ik_ved', ftInteger, pdInput, 4, ik_ved);
  Result.Open;
end;

// �������� c��������� ��������� ��� �������� (�����, ��, ��)
function TUspevGroupController.GetVedomsOsenciWithoutDopusk(ik_ved: Integer)
  : TADOStoredProc;
begin
  Result := TADOStoredProc.Create(nil);
  Result.Connection := dm.DBConnect;
  Result.ProcedureName := 'UspevSelVedWithoutDopusk;1';
  Result.Parameters.CreateParameter('@RETURN_VALUE', ftInteger,
    pdReturnValue, 4, null);
  Result.Parameters.CreateParameter('@ik_ved', ftInteger, pdInput, 4, ik_ved);
  Result.Open;
end;

// �������� c��������� ���������
function TUspevGroupController.GetVedomsOsenci(ik_ved: Integer;
  hasDopusk: boolean): TADOStoredProc;
begin
  if hasDopusk then // � ��������
    Result := GetVedomsOsenciWithDopusk(ik_ved)
  else // ��� �������
    Result := GetVedomsOsenciWithoutDopusk(ik_ved);
end;

// ������� ����� ��������� � Excel
procedure TUspevGroupController.ExportVedsShapka(mainSheet, next, ikGrup, nsem,
  ikVed, ikFac, ikSpec, ikVidZan, Count, firstStr, firstStrKP: Integer;
  E: variant; HasTema, withOsenca: boolean; VedName, VidZanShortName: string);
const
  mag = 18; // ������������
var
  str: string;
  FindRange: variant;
  // stroka:char;
  // fl:boolean;
  i: Integer;
  spec: string;
begin

  // �a��������� ������ ��������
  E.Sheets[next].Select;

  FindRange := E.Cells.Replace(What := '#VedName#', Replacement := VedName);

  spec := '������������� ';

  if ikFac = mag then
    spec := '����������� ';

  dmUgtuStructure.adoqSpecFac.Open;
  dmUgtuStructure.adoqSpecFac.Filter := '';
  if dmUgtuStructure.adoqSpecFac.Locate('ik_fac', ikFac, [loCaseInsensitive])
  then
  begin
    str := dmUgtuStructure.adoqSpecFacCname_fac.AsString;
    FindRange := E.Cells.Replace(What := '#facName#', Replacement := str);
  end;

  dmUgtuStructure.adoqSpec.Open;
  dmUgtuStructure.adoqSpec.Filter := '';
  if dmUgtuStructure.adoqSpec.Locate('ik_Spec', ikSpec, [loCaseInsensitive])
  then
  begin
    str := spec + dmUgtuStructure.adoqSpec.FieldByName('Cshort_spec').AsString +
      ' ' + dmUgtuStructure.adoqSpec.FieldByName('sh_spec').AsString;
    FindRange := E.Cells.Replace(What := '#specName#', Replacement := str);
  end;

  dmUgtuStructure.adoqSelAllGroups.Open;
  dmUgtuStructure.adoqSelAllGroups.Filter := '';
  if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup', ikGrup,
    [loCaseInsensitive]) then
  begin
    str := '������: ' + dmUgtuStructure.adoqSelAllGroups.FieldByName
      ('cname_grup').AsString;
    FindRange := E.Cells.Replace(What := '#groupName#', Replacement := str);
  end;

  // ����� ��������
  str := '�������: ' + IntToStr(nsem);
  FindRange := E.Cells.Replace(What := '#nSem#', Replacement := str);

  // ����� ����������
  // dmUspevaemost.adospVedTop
  str := '����������          ' + dmUspevaemost.adospVedTop.FieldByName
    ('cName_disc').AsString;
  FindRange := E.Cells.Replace(What := '#Discpl#', Replacement := str);

  str := '����� ���������� �����       ' + dmUspevaemost.adospVedTop.FieldByName
    ('iHour_gos').AsString;
  FindRange := E.Cells.Replace(What := '#HourCount#', Replacement := str);

  // ����� ������������ adospVedTop
  str := '�����������      ' + dmUspevaemost.adospVedTop.FieldByName
    ('NamePrepod').AsString;
  FindRange := E.Cells.Replace(What := '#PrepName#', Replacement := str);

  // ����� ����, ���� �������� ������
  if withOsenca then
    str := '����  ' + dmUspevaemost.adospVedTop.FieldByName('Dd_exam').AsString
  else
    str := '����                        ';
  FindRange := E.Cells.Replace(What := '#DateExam#', Replacement := str);

  // �������� ������� � ��������� - ������ ���-��
  for i := 1 to Count do
  begin
    E.Sheets[mainSheet].Range['A' + IntToStr(firstStr + 1) + ':H' +
      IntToStr(firstStr + 1)].Copy;
    E.Sheets[next].Range['A' + IntToStr(i + firstStr) + ':H' +
      IntToStr(i + firstStr)].Insert;
  end;

  // ����������� ������ �������� (��� �� � ��)
  if HasTema then
  begin
    E.Sheets[next + 1].Select;

    str := '���������� � ��������� �� ' + VidZanShortName + ' �' +
      dmUspevaemost.adospVedTop.FieldByName('cNumber_Ved').AsString;
    FindRange := E.Cells.Replace(What := '#PrilName#', Replacement := str);

    str := '������: ' + dmUgtuStructure.adoqSelAllGroups.FieldByName
      ('cname_grup').AsString;
    FindRange := E.Cells.Replace(What := '#groupName#', Replacement := str);

    str := '����������         ' + dmUspevaemost.adospVedTop.FieldByName
      ('cName_disc').AsString;
    FindRange := E.Cells.Replace(What := '#Discpl#', Replacement := str);

    str := '����� ���������� �����       ' +
      dmUspevaemost.adospVedTop.FieldByName('iHour_gos').AsString;
    FindRange := E.Cells.Replace(What := '#HourCount#', Replacement := str);
    // �������� ������� � ���������� - ������ ���-��
    for i := 1 to Count do
    begin
      E.Sheets[mainSheet].Range['A' + IntToStr(27) + ':H' + IntToStr(27)].Copy;
      E.Sheets[next + 1].Range['A' + IntToStr(i + firstStrKP) + ':H' +
        IntToStr(i + firstStrKP)].Insert;
    end;
    E.Sheets[next + 1].Range['A' + IntToStr(firstStrKP) + ':H' +
      IntToStr(Count + firstStrKP)].RowHeight := 30;
  end;

end;

function TUspevGroupController.GetNapravDS: TADODataSet;
begin

  Result := FNapravController.DataSet;
end;

function TUspevGroupController.GetNextSubStr(var str: string): string;
const
  divider: set of char = [' ', ',', '.', ';', ':', '/', '\', '&', '<', '<', '*',
    '-']; // ��������� ������������
  StartStrPosition: Integer = 1;
  // ����� �����, � �������� �������� ����� ������
var
  strCurPosition: Integer; // ������� ����� ����� � ������
begin
  strCurPosition := StartStrPosition;
  while (strCurPosition <= length(str)) and
    (not(str[strCurPosition] in divider)) do
  begin
    inc(strCurPosition);
  end;

  Result := Copy(str, StartStrPosition, strCurPosition - 1);

  if (strCurPosition > length(str)) then
    strCurPosition := length(str);

  Delete(str, StartStrPosition, strCurPosition);
end;

// ���������� �������� �������� Excel
function TUspevGroupController.GetPagename(VidZanShortName: string;
  prevName: string): string;
var
  pageName: string;
  delCount: Integer;
  discName: string;
begin
  discName := dmUspevaemost.adospVedTop.FieldByName('cName_disc').AsString;
  pageName := VidZanShortName + GetNextSubStr(discName);
  while (discName <> '') and (prevName <> '') and
    (pos(pageName, prevName) > 0) do
  begin
    pageName := pageName + GetNextSubStr(discName);
  end;
  if (length(pageName) > 31) then
    Delete(pageName, 32, length(pageName));

  // ����� �������������� ����������� ���������� �������� ����� �� 0
  // ������ ��������������� ���-�� ����
  if (prevName = pageName) then
  begin
    randomize();
    delCount := random(5);
    Delete(pageName, length(pageName) - delCount, delCount);
  end;

  Result := pageName;
end;

// ��������� ���������� ����� (��� �� - ���� ���������)
function TUspevGroupController.AddNapr(VidExID: Integer;
  dateIn, dateOut: TDateTime; NaprNum, VidName: string): Integer;
var
  VedIK: Integer;
begin
  TApplicationController.GetInstance.AddLogEntry('���������� �����������');
  case FNapravController.AddNapr(VidExID, dateIn, dateOut, NaprNum, VedIK) of
    1:
      begin
        ShowMessage('��� ����������� "' + VidName +
          '" �� �������� ��� ���������');
        Result := 0;
      end;
  else
    Result := VedIK;
  end;

end;

procedure TUspevGroupController.AddPageVedomost(var mainSheet, next: Integer;
  firstStr: Integer; E: variant; HasTema: boolean; VidZanShortName: string);
var
  prevSheetName: string; // �������� ���������� �������� Excel
  currentSheetName: string; // �������� ������� (�����������) �������� Excel
begin
  next := 3; // ����� ��e������ �������� (������� �����������)
  // ���� ��� �� ��� ��, �� �������� 2-� ��������
  if HasTema then
    mainSheet := 2
  else // ����� - ������
    mainSheet := 1;

  E.Sheets.Add(after := E.Sheets.item[next - 1]);

  E.Sheets[mainSheet].Range['B1:H' + IntToStr(firstStr)].Copy;
  E.Sheets[next].Range['B1'].Insert;

  if (E.Sheets.Count > next) then
    prevSheetName := E.Sheets[next + 1].name
  else
    prevSheetName := '';

  currentSheetName := GetPagename(VidZanShortName, prevSheetName);
  E.Sheets[next].name := currentSheetName;

  if HasTema then
  begin
    // ��������� ���� ��� ����������
    E.Sheets.Add(after := E.Sheets.item[next]);
    // E.Sheets[mainNum].PageSetup.Orientation:=1;
    E.Sheets[mainSheet].Range['B21:E26'].Copy;
    E.Sheets[next + 1].Range['B1'].Insert;
    E.Sheets[next + 1].name := '����������' + currentSheetName;
  end;
end;

procedure TUspevGroupController.AnnulNapr(VedIK: Integer);
begin
  TApplicationController.GetInstance.AddLogEntry('������������� �����������');
  case FNapravController.Annul(VedIK) of
    StatusError:
      ShowMessage('���������� ������������ �������� �����������');
  end;
end;

// ����������� ��������� � ����� ��������
procedure TUspevGroupController.NastrVedsEnd(next, firstStr: Integer;
  ikGrup, nsem, ikVed, ikFac, ikSpec, ikVidZan, Count: Integer; E: variant;
  HasTema, hasDopusk: boolean; VedType: TVedType);
begin

  E.Sheets[next].Select;
  // E.Sheets[next].Range['A'+inttostr(firstStr)].RowHeight:=20,25;
  E.Range['A' + IntToStr(firstStr)].RowHeight := 40;

  E.Range['A1'].ColumnWidth := 3;
  E.Range['B1'].ColumnWidth := 30; // ���
  E.Range['E1'].ColumnWidth := 0; //

  case VedType of
    exam: // �������
      begin
        if hasDopusk then
        begin
          E.Range['C1'].ColumnWidth := 20;
          E.Range['D1'].ColumnWidth := 15;
          E.Range['F1'].ColumnWidth := 15;
          E.Range['G1'].ColumnWidth := 13;
        end
        else
        begin
          E.Range['C1'].ColumnWidth := 25;
          E.Range['D1'].ColumnWidth := 0;
          E.Range['F1'].ColumnWidth := 17;
          E.Range['G1'].ColumnWidth := 20;
        end;
        E.Range['E1'].ColumnWidth := 0;
      end;
    zach: // �����
      begin
        if hasDopusk then
        begin
          E.Range['C1'].ColumnWidth := 20;
          E.Range['D1'].ColumnWidth := 15;
          E.Range['G1'].ColumnWidth := 15;
          E.Range['H1'].ColumnWidth := 13;
        end
        else
        begin
          E.Range['C1'].ColumnWidth := 25;
          E.Range['D1'].ColumnWidth := 0;
          E.Range['E1'].ColumnWidth := 17;
          E.Range['G1'].ColumnWidth := 20;
        end;
        E.Range['F1'].ColumnWidth := 0;
      end;
  else
    begin
      if hasDopusk then
      begin
        E.Range['F1'].ColumnWidth := 0;
        E.Range['C1'].ColumnWidth := 15;
        E.Range['D1'].ColumnWidth := 10;
        E.Range['E1'].ColumnWidth := 23;
        E.Range['F1'].ColumnWidth := 13.57;
      end
      else
      begin
        E.Range['F1'].ColumnWidth := 0;
        E.Range['C1'].ColumnWidth := 24;
        E.Range['D1'].ColumnWidth := 0;
        E.Range['E1'].ColumnWidth := 24;
        E.Range['F1'].ColumnWidth := 13.57;
      end;
      E.Range['G1'].ColumnWidth := 0;
    end;
  end;

  E.Sheets[next].PageSetup.LeftMargin := 60;
  E.Sheets[next].PageSetup.RightMargin := 20;
  E.Sheets[next].PageSetup.TopMargin := 29;
  E.Sheets[next].PageSetup.BottomMargin := 29;
  E.Sheets[next].PageSetup.Order := 2;
  if HasTema then
  begin
    E.Sheets[next + 1].Select;
    E.Range['A1'].RowHeight := 20;
    E.Range['A6'].RowHeight := 30;

    E.Range['A1'].ColumnWidth := 3;
    E.Range['B1'].ColumnWidth := 25;
    E.Range['C1'].ColumnWidth := 50;
    E.Range['D1'].ColumnWidth := 10;
    E.Range['E1'].ColumnWidth := 10;

    E.Sheets[next + 1].PageSetup.LeftMargin := 60;
    E.Sheets[next + 1].PageSetup.RightMargin := 20;
    E.Sheets[next + 1].PageSetup.TopMargin := 29;
    E.Sheets[next + 1].PageSetup.BottomMargin := 29;
    E.Sheets[next + 1].PageSetup.Order := 2;
  end;
end;

// ��������� ����� ���������
procedure TUspevGroupController.ExportVedsEnd(mainSheet, next,
  firstStr: Integer; ikVed, ikVidZan, Count: Integer; E: variant;
  withOsenca: boolean);
const
  AllCount: Integer = 36;
var
  strNum: Integer;
  IsZach: boolean;
  FindRange: variant;
  str: string;
begin

  if Count < AllCount then
    strNum := 47
  else
    strNum := firstStr + 1 + Count;

  if withOsenca then
  begin
    // ��������� �����
    GetVedomsBottom(ikVed, ikVidZan);
    if not dmUspevaemost.adospSelVedBottom.Active then
      raise EApplicationException.Create
        ('��������� ������ ��� �������� ������ ���������.');
    IsZach := (dmUspevaemost.adospSelVedBottom.FieldByName('zachCount')
      .asinteger > 0) or (ikVidZan = 7);
  end
  else
    IsZach := (ikVidZan = 7);

  // ��� ������� ��������� ����������, �� ����������
  if IsZach then
  begin
    E.Sheets[mainSheet].Range['B21:E24'].Copy;
  end
  else
    E.Sheets[mainSheet].Range['B13:E19'].Copy;
  E.Sheets[next].Range['B' + IntToStr(strNum)].Insert;

  if withOsenca then
  begin

    strNum := strNum + 2;
    if (not IsZach) then
    begin
      E.Sheets[next].Range['C' + IntToStr(strNum)].Value :=
        dmUspevaemost.adospSelVedBottom.FieldByName('otlCount').AsString;
      inc(strNum);
      E.Sheets[next].Range['C' + IntToStr(strNum)].Value :=
        dmUspevaemost.adospSelVedBottom.FieldByName('horCount').AsString;
      inc(strNum);
      E.Sheets[next].Range['C' + IntToStr(strNum)].Value :=
        dmUspevaemost.adospSelVedBottom.FieldByName('udovlCount').AsString;
      inc(strNum);
      E.Sheets[next].Range['C' + IntToStr(strNum)].Value :=
        dmUspevaemost.adospSelVedBottom.FieldByName('neudCount').AsString;
      inc(strNum);
      E.Sheets[next].Range['C' + IntToStr(strNum)].Value :=
        dmUspevaemost.adospSelVedBottom.FieldByName('nedopCount').AsString;
    end
    else
    begin
      E.Sheets[next].Range['C' + IntToStr(strNum)].Value :=
        dmUspevaemost.adospSelVedBottom.FieldByName('zachCount').AsString;
      inc(strNum);
      E.Sheets[next].Range['C' + IntToStr(strNum)].Value :=
        dmUspevaemost.adospSelVedBottom.FieldByName('nedopCount').AsString;
    end;
  end;
  str := dmUspevaemost.adospSelVed.FieldByName('ManagerPostName').AsString;
  FindRange := E.Sheets[next].Cells.Replace(What := '#ManName#',
    Replacement := str);

end;

procedure TUspevGroupController.printVedomost(VedList: TADOStoredProc;
  ikGrup, nsem, ikFac, ikSpec: Integer; withOsenca: boolean);
var
  E: variant;
  str: string;
begin



  // if VedList=nil then
  // begin
  // raise EApplicationException.Create('��������� ������ ��� �������� ������ ��������� ����������.');
  // exit;
  // end;
  //
  // try
  // if VedList.Active then
  // begin
  // E := CreateOleObject('Excel.Application');
  // try
  // try
  // str := ExtractFilePath(Application.ExeName)+'reports\UspevVedomost.XLT';
  // E.WorkBooks.Add(str);
  // E.Visible := false;
  // E.DisplayAlerts:=false;
  // VedList.First;
  // while not VedList.Eof do
  // begin      //������ � ��������� ������� ���������
  // DoPrintVedomost(E, ikGrup,nSem,VedList.FieldByName('Ik_ved').AsInteger, ikFac,
  // ikSpec, withOsenca);
  // VedList.Next;
  // end;
  // E.Sheets[1].Delete;
  // E.Sheets[1].Delete;
  // E.DisplayAlerts:=true;
  // E.Visible := true;
  // except
  // E.Quit;
  // raise ;
  // end;
  //
  // finally
  // E:= UnAssigned;
  // end;
  // end;
  // finally
  // VedList.Free;
  // end;

  if VedList = nil then
  begin
    raise EApplicationException.Create
      ('��������� ������ ��� �������� ������ ��������� ����������.');
    exit;
  end;

  try
    if VedList.Active then
    begin
      E := CreateOleObject('Excel.Application');
      try
        try
          str := ExtractFilePath(Application.ExeName) +
            'reports\UspevVedomost.XLT';
          E.WorkBooks.Add(str);
          E.Visible := false;
          E.DisplayAlerts := false;
          VedList.First;
          while not VedList.Eof do
          begin // ������ � ��������� ������� ���������
            DoPrintVedomost(E, ikGrup, nsem, VedList.FieldByName('Ik_ved')
              .asinteger, ikFac, ikSpec, withOsenca);
            VedList.next;
          end;
          E.Sheets[1].Delete;
          E.Sheets[1].Delete;
          E.DisplayAlerts := true;
          E.Visible := true;
        except
          E.Quit;
          raise;
        end;

      finally
        E := UnAssigned;
      end;
    end;
  finally
    VedList.Free;
  end;
  // Release-1.0.4.441
end;

// ������� ���������
procedure TUspevGroupController.DoPrintVedomost(E: variant;
  ikGrup, nsem, ikVed, ikFac, ikSpec: Integer; withOsenca: boolean);
const
  firstStr: Integer = 10;
  // ������ ������� � ������� ���������, ���������� ����� �������
  firstStrKP: Integer = 6;
  // ������ ������� � ������� ���������, ���������� ����� ������� ��� ��
var
  Count: Integer;
  tempDS: TADODataSet;
  mainSheet: Integer; // ����� ����������� �����
  next: Integer; // ����� �������� �����
  i: Integer;
  VedContent: TADOStoredProc;
  VedType: TVedType;
  VedName: string; // �������� ���������
  VidZanShortName: string; // ������� �������� ���� �������
begin

  // ������ �������o� ���������
  GetVedsHeader(ikVed);
  if not dmUspevaemost.adospSelVed.Active then
    raise EApplicationException.Create
      ('��������� ������ ��� �������� ����� ������ ���������.');

  // ������ ����� ���������
  GetVedomsShapca(ikVed);
  if not dmUspevaemost.adospVedTop.Active then
    raise EApplicationException.Create
      ('��������� ������ ��� �������� ��������� ���������.');


  // ���������� ��� ��������� ���� � ����������� �� ���� ���� �������
  // TVedType = (exam,zach,KP,KR);
  // case dmUspevaemost.adospSelVed.FieldByName('ik_Vid_zanyat').AsInteger of
  // 6:   //�������
  // begin
  // VedType:= exam;
  // VedName:= '����������o���� ��������� �';
  // VidZanShortName:= '���';
  // end;
  // 56:  // ��� �������
  // begin
  // VedType:= exam;
  // VedName:= '��������� �� ��������������� ������� �';
  // VidZanShortName:= '������';
  // end;
  // 7:  //�����
  // begin
  // VedType:= zach;
  // VedName:= '�������� ��������� �';
  // VidZanShortName:= '���';
  // end;
  // 8:  //
  // begin
  // VedType:= KP;
  // VedName:= '��������� �� �������� ������ �';
  // VidZanShortName:= '��';
  // end;
  // 9:  //
  // begin
  // VedType:= KR;
  // VedName:=  '��������� �� �������� ������ �';
  // VidZanShortName:= '��';
  // end;
  // 27:  //��������
  // begin
  // VedType:= zach;
  // VedName:= '��������� �� �������� �';
  // VidZanShortName:= '����';
  // end;
  // end;

  VedName := VedName + ' ' + IntToStr(ikVed);

  TApplicationController.GetInstance.AddLogEntry
    ('���������. ������� � Excel ��������� ' +
    dmUspevaemost.adospVedTop.FieldByName('cName_disc').AsString + ' ' +
    VidZanShortName);

  // ������� ������
  VedContent := GetVedomsOsenci(ikVed, dmUspevaemost.adospSelVed.FieldByName
    ('HasDopusk').AsBoolean);
  if not VedContent.Active then
    raise EApplicationException.Create
      ('��������� ������ ��� �������� ������ ���������.');

  // dmUspevaemost.adospSelVed.FieldByName('ik_Vid_zanyat').AsBoolean
  Count := VedContent.RecordCount;

  AddPageVedomost(mainSheet, next, firstStr, E,
    dmUspevaemost.adospSelVed.FieldByName('HasTema').AsBoolean,
    VidZanShortName); // ��������� ��������

  ExportVedsShapka(mainSheet, next, ikGrup, nsem, ikVed, ikFac, ikSpec,
    dmUspevaemost.adospSelVed.FieldByName('ik_Vid_zanyat').asinteger, Count,
    firstStr, firstStrKP, E, dmUspevaemost.adospSelVed.FieldByName('HasTema')
    .AsBoolean, withOsenca, VedName, VidZanShortName); // �����

  E.Sheets[next].Select;

  i := 1;
  VedContent.First;
  While not VedContent.Eof do
  begin
    E.Range['A' + IntToStr(firstStr + i)].Value := IntToStr(i);
    E.Range['B' + IntToStr(firstStr + i)].Value :=
      VedContent.FieldByName('StudName').AsString + '   ' +
      VedContent.FieldByName('KatZach').AsString;

    E.Range['C' + IntToStr(firstStr + i)].Value :=
      VedContent.FieldByName('NN_zach').AsString;
    if dmUspevaemost.adospSelVed.FieldByName('HasDopusk').AsBoolean then
      E.Range['D' + IntToStr(firstStr + i)].Value :=
        VedContent.FieldByName('dopusc').AsString;
    if withOsenca then // �������� ������
    begin
      case VedType of
        exam: // �������
          E.Range['F' + IntToStr(firstStr + i)].Value :=
            VedContent.FieldByName('nameOsenca').AsString;
      else // �����
        E.Range['E' + IntToStr(firstStr + i)].Value :=
          VedContent.FieldByName('nameOsenca').AsString;
        { 8:     //��
          E.Range['E'+inttostr(firstStr+i)].Value:= VedContent.FieldByName('nameOsenca').AsString;
          9:     //��
          E.Range['E'+inttostr(firstStr+i)].Value:= VedContent.FieldByName('nameOsenca').AsString;
        }
      end;
    end;
    inc(i);
    VedContent.next;
  end;
  // E.Sheets[next].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;

  // ����� ���� ��� �� � ��
  if dmUspevaemost.adospSelVed.FieldByName('HasTema').AsBoolean then
  begin
    E.Sheets[next + 1].Select;
    i := 1;
    VedContent.First;
    while not VedContent.Eof do
    begin
      E.Range['A' + IntToStr(firstStrKP + i)].Value := IntToStr(i);
      E.Range['B' + IntToStr(firstStrKP + i)].Value :=
        VedContent.FieldByName('StudName').AsString + '   ' +
        VedContent.FieldByName('KatZach').AsString;

      if withOsenca then // �������� ����
        E.Range['C' + IntToStr(firstStrKP + i)].Value :=
          VedContent.FieldByName('cTema').AsString;

      inc(i);
      VedContent.next;
    end;
    // E.Sheets[next+1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
  end;

  E.Sheets[2].PageSetup.LeftMargin := 44;
  E.Sheets[2].PageSetup.RightMargin := 20;
  E.Sheets[2].PageSetup.TopMargin := 29;
  E.Sheets[2].PageSetup.BottomMargin := 29;
  E.Sheets[2].PageSetup.Order := 2;

  ExportVedsEnd(mainSheet, next, firstStr, ikVed,
    dmUspevaemost.adospSelVed.FieldByName('ik_Vid_zanyat').asinteger, Count, E,
    withOsenca);

  NastrVedsEnd(next, firstStr, ikGrup, nsem, ikVed, ikFac, ikSpec,
    dmUspevaemost.adospSelVed.FieldByName('ik_Vid_zanyat').asinteger, Count, E,
    dmUspevaemost.adospSelVed.FieldByName('HasTema').AsBoolean,
    dmUspevaemost.adospSelVed.FieldByName('HasDopusk').AsBoolean, VedType);
end;

// ���������� ����� ��������� (��� ������)
procedure TUspevGroupController.printBlankVedomost(ikGrup, nsem, ikVed, ikFac,
  ikSpec: Integer; tempStoredProc: TADOStoredProc);
var
  VedList: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('���������. ������� � Excel ������ ���������');
  VedList := GetAllVedomosts(ikGrup, nsem);

  // ��������� ������, ����� �������� ������ 1 ���������
  VedList.Filter := 'Ik_ved=' + IntToStr(ikVed);
  VedList.Filtered := true;
  printVedomost(VedList, ikGrup, nsem, ikFac, ikSpec, false);
end;

// procedure TUspevGroupController.printBlankVedomost(ikGrup, nSem, ikVed, ikFac, ikSpec: integer; tempStoredProc: TADOStoredProc);
// var
// VedList: TADOStoredProc;
// begin
// TApplicationController.GetInstance.AddLogEntry('���������. ������� � Excel ������ ���������');
// VedList:= GetAllVedomosts(ikGrup, nSem);
//
// //��������� ������, ����� �������� ������ 1 ���������
// VedList.Filter:= 'Ik_ved='+IntToStr(ikVed);
// VedList.Filtered:= true;
// PrintVedomost(VedList,ikGrup,nSem,ikFac, ikSpec, false);
// end;

// ���������� ��� ������ ���������� (��� ������)
procedure TUspevGroupController.printAllBlankVedomost(ikGrup, nsem, ikFac,
  ikSpec: Integer);
var
  VedList: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('���������. ������� � Excel ���� ������� ����������');

  VedList := GetAllVedomosts(ikGrup, nsem);

  printVedomost(VedList, ikGrup, nsem, ikFac, ikSpec, false);
end;

// *******************************************************
// *******************************************************
// *******************************************************
// ***************������� ������������**************************
// ������� ������ ���� ��������� � �������� ����������
function TUspevGroupController.GetAllUspevForGrup(ikGrup, nsem: Integer)
  : TADOStoredProc;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc := TADOStoredProc.Create(nil);
  try
    tempStoredProc.ProcedureName := 'GetAllUspevForGrup_withDate;1';
    tempStoredProc.Connection := dm.DBConnect;
    tempStoredProc.Parameters.CreateParameter('@ik_group', ftInteger, pdInput,
      0, ikGrup);
    tempStoredProc.Parameters.CreateParameter('@n_sem', ftInteger,
      pdInput, 0, nsem);
    tempStoredProc.Open;
    Result := tempStoredProc;
  except
    on E: Exception do
    begin
      tempStoredProc.Free;
      Result := nil;
      raise EApplicationException.Create
        ('��������� ������ ��� �������� ������������.', E);
    end;
  end;
end;

// ������� � Excel ������������ ������ (�������)
procedure TUspevGroupController.PrintBRSExamVedomost(ikGrup, nsem, nAtt,
  ikFac: Integer; date, examiner, num: string);
var
  fac, group, disc: string;
  report: TBRSExamVedomost;
  ikDisc: Integer;
begin
  dmUgtuStructure.adoqSpecFac.Open;
  dmUgtuStructure.adoqSpecFac.Filter := '';
  if dmUgtuStructure.adoqSpecFac.Locate('ik_fac', ikFac, [loCaseInsensitive])
  then
    fac := dmUgtuStructure.adoqSpecFacCname_fac.AsString;

  dmUgtuStructure.adoqSelAllGroups.Open;
  dmUgtuStructure.adoqSelAllGroups.Filter := '';
  if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup', ikGrup,
    [loCaseInsensitive]) then
    group := dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup')
      .AsString;

  ikDisc := dmUspevaemost.adospGetAllBRSExam.FieldByName('ik_disc').Value;
  disc := dmUspevaemost.adospGetAllBRSExam.FieldByName('cname_disc').AsString;
  report := TBRSExamVedomost.Create(nil, dmUspevaemost.adodsSelBRSExamGroup,
    fac, group, disc, examiner, num, date, nsem, ikDisc, ikGrup);
  report.ReportTemplate := ExtractFilePath(Application.ExeName) +
    'reports\BRSExamVedomost.xlt';

  { Report := TBRSReport.CreateFull(nil, dmUspevaemost.adodsSelAttBRSGroup, fac, group, disc, examiner, num, date, nSem);
    //Report.FreeOnComplete := true;
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\VedomostBRS.xlt'; }
  // ������ ���������� ������
  report.BuildReport;
  report.Show;
  report.Free;
end;

procedure TUspevGroupController.PrintBRSLastVedomost(ikGrup, nsem, ikFac,
  ikDisc: Integer; datezach, DateExam, examiner, disc: string);
var
  fac, group: string;
  report: TBRSReportLast;
  year, grade: Integer;
begin
  dmUgtuStructure.adoqSpecFac.Open;
  dmUgtuStructure.adoqSpecFac.Filter := '';
  if dmUgtuStructure.adoqSpecFac.Locate('ik_fac', ikFac, [loCaseInsensitive])
  then
    fac := dmUgtuStructure.adoqSpecFacCname_fac.AsString;

  dmUgtuStructure.adoqSelAllGroups.Open;
  dmUgtuStructure.adoqSelAllGroups.Filter := '';
  if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup', ikGrup,
    [loCaseInsensitive]) then
    group := dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup')
      .AsString;

  year := YearOf(Today);
  grade := (nsem + 1) div 2;

  dmUspevaemost.adsGetBRSVedomost.Active := false;
  dmUspevaemost.adsGetBRSVedomost.CommandText :=
    'select * from dbo.GetBRSVedomost(' + IntToStr(ikDisc) + ',' +
    IntToStr(ikGrup) + ',' + IntToStr(nsem) + ')';
  dmUspevaemost.adsGetBRSVedomost.Active := true;

  report := TBRSReportLast.CreateFull(nil, dmUspevaemost.adsGetBRSVedomost, fac,
    group, disc, examiner, DateExam, datezach, nsem, year, grade);
  report.ReportTemplate := ExtractFilePath(Application.ExeName) +
    'reports\VedomostBRSLast.xlt';
  // ������ ���������� ������
  report.BuildReport;
  report.Show;
  report.Free;

end;

procedure TUspevGroupController.PrintBRSRankAverageReport(ikGrup, nsem: Integer;
  num: string);
var
  group, disc: string;
  report: TBRSRankAverageReport;
  ikDisc: Integer;
  ds: TADODataSet;
begin
  dmUgtuStructure.adoqSelAllGroups.Open;
  dmUgtuStructure.adoqSelAllGroups.Filter := '';
  if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup', ikGrup,
    [loCaseInsensitive]) then
    group := dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup')
      .AsString;

  // ������� ������� ����� ���������
  if num = '�������' then
    exit;

  dmUspevaemost.adodsGetAverageBalls.Active := false;
  dmUspevaemost.adodsGetAverageBalls.CommandText :=
    'select * from dbo.GetBRSAverageBallsForModule(' + IntToStr(ikGrup) + ',' +
    IntToStr(nsem) + ',' + num + ')';
  dmUspevaemost.adodsGetAverageBalls.Active := true;

  report := TBRSRankAverageReport.Create(nil,
    dmUspevaemost.adodsGetAverageBalls, group, num, nsem, ikGrup);
  report.ReportTemplate := ExtractFilePath(Application.ExeName) +
    'reports\BRSRankAverageReport.xlt';
  report.BuildReport;
  report.Show;
  report.Free;
end;

procedure TUspevGroupController.PrintBRSRankReport(ikGrup, nsem: Integer;
  num: string);
var
  group, disc: string;
  report: TBRSRankReport;
  ikDisc: Integer;
  ds: TADODataSet;
begin
  dmUgtuStructure.adoqSelAllGroups.Open;
  dmUgtuStructure.adoqSelAllGroups.Filter := '';
  if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup', ikGrup,
    [loCaseInsensitive]) then
    group := dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup')
      .AsString;

  if dmUspevaemost.adodsSelAttBRSGroup.Active then
    dmUspevaemost.adodsSelAttBRSGroup.Sort := '[i_balls] DESC';

  ikDisc := dmUspevaemost.adospGetAllAtt.FieldByName('ik_disc').Value;
  disc := dmUspevaemost.adospGetAllAtt.FieldByName('cname_disc').AsString;

  report := TBRSRankReport.Create(nil, dmUspevaemost.adodsSelAttBRSGroup, group,
    num, disc, nsem, ikDisc, ikGrup);
  report.ReportTemplate := ExtractFilePath(Application.ExeName) +
    'reports\BRSRankReport.xlt';
  report.BuildReport;
  report.Show;
  report.Free;
end;

procedure TUspevGroupController.PrintBRSVedomost(ikGrup, nsem, nAtt,
  ikFac: Integer; date, examiner, num: string);
var
  fac, group, disc: string;
  report: TBRSAllModulesReport;
  ikDisc, ikcontent: Integer;
  Log: ILogger;
begin
  Log := TNullLogger.GetInstance; // TMemoLogger.GetInstance; //

  Assert(dmUgtuStructure <> nil);
  Assert(dmUgtuStructure.adoqSpecFac <> nil);
  dmUgtuStructure.adoqSpecFac.Open;
  dmUgtuStructure.adoqSpecFac.Filter := '';
  if dmUgtuStructure.adoqSpecFac.Locate('ik_fac', ikFac, [loCaseInsensitive])
  then
    fac := dmUgtuStructure.adoqSpecFacCshort_name_fac.AsString;

  Log.LogMessage('dmUgtuStructure.adoqSpecFac opened and filtered');
  Assert(dmUgtuStructure.adoqSelAllGroups <> nil);
  dmUgtuStructure.adoqSelAllGroups.Open;
  dmUgtuStructure.adoqSelAllGroups.Filter := '';
  if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup', ikGrup,
    [loCaseInsensitive]) then
    group := dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup')
      .AsString;

  Log.LogMessage('dmUgtuStructure.adoqSelAllGroups opened and filtered');
  ikDisc := dmUspevaemost.adospGetAllAtt.FieldByName('ik_disc').Value;
  ikcontent := dmUspevaemost.adospGetAllAtt.FieldByName('ik_upContent').Value;
  disc := dmUspevaemost.adospGetAllAtt.FieldByName('cname_disc').AsString;

  report := TBRSAllModulesReport.CreateFull(nil,
    dmUspevaemost.adsGetBRSVedomost, fac, group, disc, examiner, num, date,
    nsem, ikDisc, ikGrup, ikcontent);
  report.Logger := Log;
  Log.LogMessage('Report created');
  { str := ExtractFilePath(Application.ExeName)+'reports\BRSAllModules.xlt';
    Report.WorkBooks.Add(str); }

  report.ReportTemplate := ExtractFilePath(Application.ExeName) +
    'reports\BRSAllModules.xlt';

  { Report := TBRSReport.CreateFull(nil, dmUspevaemost.adodsSelAttBRSGroup, fac, group, disc, examiner, num, date, nSem);
    //Report.FreeOnComplete := true;
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\VedomostBRS.xlt'; }
  // ������ ���������� ������
  report.BuildReport;
  Log.LogMessage('Report builded');
  report.Show;
  report.Free;
end;

function TUspevGroupController.PrintUspevToExcel(sgUspev: TStringGrid): boolean;
var
  i, j: Integer;
  E: variant;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('������� � MS Excel ������� ������������');

  try
    E := CreateOleObject('Excel.Application');
    E.WorkBooks.Add;
    E.DisplayAlerts := false;
    E.Visible := false;
    E.Sheets[1].Select;
    E.Range['A3:A6'].ColumnWidth := 18;
    // ����� �����
    for i := 0 to sgUspev.RowCount - 1 do
    begin
      for j := 0 to sgUspev.ColCount - 1 do
      begin
        E.Cells[i + 1, j + 1] := sgUspev.Cells[j, i];
      end;
    end;
    E.Range['A1:' + chr(ord('A') + j - 1) + IntToStr(i)].Borders.Weight := 2;
    E.Visible := true;
    E.DisplayAlerts := true;
    Result := true;
  except
    Result := false;
    E.Quit;
    E := UnAssigned;
  end;

end;




// ***************��������������**************************

// getSpecFromSpecFac ���������� IK �������������
function TUspevGroupController.getSpecFromSpecFac(SpecFacIK: Integer): Integer;
var
  DataSet: TADODataSet;
begin
  DataSet := TADODataSet.Create(nil);
  DataSet.Connection := dm.DBConnect;
  DataSet.CommandText := 'Select * From Relation_spec_fac Where ik_spec_fac = '
    + IntToStr(SpecFacIK);
  DataSet.Open;
  Result := DataSet.FieldByName('ik_spec').asinteger;
  DataSet.Close;
  DataSet.Free;
end;

end.
