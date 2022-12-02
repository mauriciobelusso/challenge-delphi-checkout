unit checkout.model.model;

interface

uses
  checkout.model.ModelInterfaces,
  checkout.model.orders.ordersinterfaces,
  checkout.model.orders;

type
  TModel = class(TInterfacedObject, iModelInterfaces)
    public
      constructor Create;
      class function New: iModelInterfaces;
      function Orders: iModelOrdersInterfaces;
  end;

implementation

{ TModel }

constructor TModel.Create;
begin

end;

class function TModel.New: iModelInterfaces;
begin
  Result := Self.Create;
end;

function TModel.Orders: iModelOrdersInterfaces;
begin
  Result := TModelOrders.New;
end;

end.
