unit DBDekTreeView_TEST;
 {#Author sergdev@ist.ugtu.net}
interface

uses
  SysUtils, Classes, Controls, ADODB, ComCtrls,DBTVDekanat;

type
  TDBDekTreeView_TEST = class(TDBDekanatTreeView)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
    
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TDBDekTreeView_TEST]);
end;

end.
