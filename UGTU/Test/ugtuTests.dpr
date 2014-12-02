program ugtuTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  TestuXMLErrorReader in 'TestuXMLErrorReader.pas',
  TestuLocalLogController in 'TestuLocalLogController.pas',
  AppConst in '..\Utils\ShareAPG\AppConst.pas',
  ClUtils in '..\Utils\ShareAPG\ClUtils.pas',
  CSB in '..\Utils\ShareAPG\CSB.pas',
  csdbg in '..\Utils\ShareAPG\csdbg.pas',
  DbgUtils in '..\Utils\ShareAPG\DbgUtils.pas',
  DBUtils in '..\Utils\ShareAPG\DBUtils.pas',
  DlgUtils in '..\Utils\ShareAPG\DlgUtils.pas',
  EditsEx in '..\Utils\ShareAPG\EditsEx.pas',
  ExUtils in '..\Utils\ShareAPG\ExUtils.pas',
  FileCls in '..\Utils\ShareAPG\FileCls.pas',
  FileUtils in '..\Utils\ShareAPG\FileUtils.pas',
  ggautil in '..\Utils\ShareAPG\ggautil.pas',
  Iterators in '..\Utils\ShareAPG\Iterators.PAS',
  MapFile in '..\Utils\ShareAPG\MapFile.pas',
  OleUtils in '..\Utils\ShareAPG\OleUtils.pas',
  OsUtils in '..\Utils\ShareAPG\OsUtils.pas',
  PrnUtils in '..\Utils\ShareAPG\PrnUtils.pas',
  QParser in '..\Utils\ShareAPG\QParser.pas',
  RegUtils in '..\Utils\ShareAPG\RegUtils.pas',
  SBS in '..\Utils\ShareAPG\SBS.pas',
  secutils in '..\Utils\ShareAPG\secutils.pas',
  StringUtils in '..\Utils\ShareAPG\StringUtils.pas',
  VarFileUtils in '..\Utils\ShareAPG\VarFileUtils.pas',
  VCLUtils in '..\Utils\ShareAPG\VCLUtils.pas',
  win2000 in '..\Utils\ShareAPG\win2000.pas',
  Conditions in '..\Utils\Conditions.pas',
  CorrectDatatypeChecks in '..\Utils\CorrectDatatypeChecks.pas',
  EApplicationError in '..\Utils\EApplicationError.pas',
  ExceptionBase in '..\Utils\ExceptionBase.pas',
  GoogleQr in '..\Utils\GoogleQr.pas',
  Parser in '..\Utils\Parser.pas',
  ProcessUtils in '..\Utils\ProcessUtils.pas',
  uPhotoBooth in '..\Utils\uPhotoBooth.pas',
  uBaseFrame in '..\Presentation\Frames\uBaseFrame.pas' {fmBase: TFrame},
  uBaseDialog in '..\Presentation\Dialogs\uBaseDialog.pas' {frmBaseDialog},
  uSpravForm in '..\Presentation\Forms\uSpravForm.pas',
  uXMLErrorReader in '..\Domain\Controllers\uXMLErrorReader.pas';

{$R *.RES}
{$R XML_Res.RES}

begin
  Application.Initialize;
  if IsConsole then
    TextTestRunner.RunRegisteredTests
  else
    GUITestRunner.RunRegisteredTests;
end.

