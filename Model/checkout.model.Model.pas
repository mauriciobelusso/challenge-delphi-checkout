unit checkout.model.Model;

interface

uses
  checkout.model.ModelInterfaces,
  checkout.model.orders.ordersinterfaces,
  checkout.model.orders;

type
  TModel = class(TInterfacedObject, iModelInterfaces)
    public
      function Orders: iModelOrdersInterfaces;
  end;

implementation

{ TModel }

function TModel.Orders: iModelOrdersInterfaces;
begin
  Result := TModelOrders.New;
end;

end.
