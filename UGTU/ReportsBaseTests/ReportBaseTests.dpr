program ReportBaseTests;
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
  DUnitTestRunner,
  ExcelReportTests in 'ExcelReportTests.pas',
  ReportsBase in '..\Domain\Reports\ReportsBase.pas',
  CommonIntf in '..\Domain\Interfaces\CommonIntf.pas',
  XIntf in '..\Domain\Interfaces\XIntf.pas',
  Barcode in '..\Domain\Reports\Barcode.pas',
  RegularEx in '..\Domain\Common\RegularEx.pas',
  CommonIntfImpl in '..\Domain\Interfaces\DefImpl\CommonIntfImpl.pas',
  ExceptionBase in '..\Utils\ExceptionBase.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

