unit uExecStorProcThread;

interface

uses
  Classes, ExtCtrls, Dialogs, DBTVFacobj, DB, uDm, uMain;

type

  TExecStorProcThread = class(TThread)
  private

  protected
    procedure Execute; override;
  public
    constructor Create();
  //published
    procedure StopExec;
    //property FreeOnTerminate default True;
  end;

implementation

uses Windows, uFac, uDMFacultetStatistic;

constructor TExecStorProcThread.Create();
begin
  //if WaitForSingleObject(self.Handle,0)=0 then ;
  FreeOnTerminate := True;
  inherited Create(False);
end;


procedure TExecStorProcThread.Execute;
begin
  //fmFacultet.dbgrItogi.DataSource:=(dm.dsSelKursItogiCol as TDataSource);
  try
    try
    begin
      (frmMain.ActiveFrame as TfmFacultet).dbgrItogi.DataSource:=nil;
      dmFacultetStatistic.adospSelKursItogiCol.Active := true;
    end;
    except
      ShowMessage('Ошибка формирования отчёта по итогам сессии. Проверьте данные о студентах.');
    //MessageBox(Handle, 'Ошибка формирования отчёта по итогам сессии. Проверьте данные о студентах.',
    //'ИС "УГТУ"', MB_OK);
    end;       
    {if (frmMain.ActiveFrame as TfmFacultet).ExecProc then
      begin
      (frmMain.ActiveFrame as TfmFacultet).ExecProc:=false;
      (frmMain.ActiveFrame as TfmFacultet).dbgrItogi.DataSource:=dmFacultetStatistic.dsSelKursItogiCol;
      end;      }
  finally
    {(frmMain.ActiveFrame as TfmFacultet).Modified:=false;
    (frmMain.ActiveFrame as TfmFacultet).Panel2.Visible:=false;
    (frmMain.ActiveFrame as TfmFacultet).SpeedButton2.Enabled:=true;
    (frmMain.ActiveFrame as TfmFacultet).dbgrItogi.Refresh;  }
  end;
end;


procedure TExecStorProcThread.StopExec;
begin
  {(frmMain.ActiveFrame as TfmFacultet).ExecProc:=false;
  (frmMain.ActiveFrame as TfmFacultet).Modified:=false;
  (frmMain.ActiveFrame as TfmFacultet).Panel2.Visible:=false;
  (frmMain.ActiveFrame as TfmFacultet).SpeedButton2.Enabled:=true;
  (frmMain.ActiveFrame as TfmFacultet).dbgrItogi.Refresh;}
end;

end.
