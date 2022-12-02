unit checkout.model.Model;

interface

uses
  checkout.model.ModelInterfaces,
  checkout.model.orders.interfaces,
  checkout.model.orders;

type
  TModel = class(TInterfacedObject, iModelInterfaces)
    public
      function Orders: iOrdersInterfaces;
  end;

implementation

{ TModel }

function TModel.Orders: iOrdersInterfaces;
begin
  Result := TModelOrders.New;
end;

end.
