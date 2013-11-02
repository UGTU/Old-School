unit eApplicationError;

// ������ ��� ���������� - ��� ����, ����� ���������� ������ ����� �
// ������, � ������ ���������

type EApplicationException = class(Exception)
  private
  FException:Exception;
  public
  constructor Create(mes:string; Exc:Exception);
  function ToString:string;
end;

interface

implementation

{ EApplicationException }

constructor EApplicationException.Create(mes: string; Exc: Exception);
begin
inherited Create(mes);
FException:=Exc;
end;

function EApplicationException.ToString: string;
begin
 //not implemented yet
end;

end.
