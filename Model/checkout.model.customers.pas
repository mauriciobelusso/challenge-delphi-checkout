unit checkout.model.customers;

interface

uses
  Data.DB,
  checkout.model.customersinterfaces,
  ConnectionDB,
  FireDAC.Stan.Param;

type
  TModelCustomers = class(TInterfacedObject, iModelCustomers)
    public
      constructor Create;
      class function New: iModelCustomers;

      function FindById(const ACustomerId: Integer; var ADataSet: TDataSet): iModelCustomers;
  end;

implementation

{ TModelCustomers }

constructor TModelCustomers.Create;
begin

end;

function TModelCustomers.FindById(const ACustomerId: Integer; var ADataSet: TDataSet): iModelCustomers;
var
  LParams: TFDParams;
begin
  LParams := TFDParams.Create;
  try
    LParams.Add('ID', ACustomerId);
    ConnectionDB.DmConnection.Connection.ExecSQL('SELECT * FROM CUSTOMERS WHERE ID = :ID', LParams, ADataSet);
  finally
    LParams.Free;
  end;
end;

class function TModelCustomers.New: iModelCustomers;
begin
  Result := Self.Create;
end;

end.
