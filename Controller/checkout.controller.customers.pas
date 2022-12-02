unit checkout.controller.customers;

interface

uses
  Data.DB,
  checkout.controller.customersinterfaces,
  checkout.model.model;

type
  TControllerCustomers = class(TInterfacedObject, iControllerCustomers)
    public
      constructor Create;
      class function New: iControllerCustomers;

      function FindById(const ACustomerId: Integer; var ADataSet: TDataSet): iControllerCustomers;
  end;

implementation

{ TModelCustomers }

constructor TControllerCustomers.Create;
begin

end;

function TControllerCustomers.FindById(const ACustomerId: Integer; var ADataSet: TDataSet): iControllerCustomers;
begin
  Result := Self;
  TModel.New.Customers.FindById(ACustomerId, ADataSet);
end;

class function TControllerCustomers.New: iControllerCustomers;
begin
  Result := Self.Create;
end;

end.

