unit checkout.controller.controller;

interface

uses
  checkout.controller.ControllerInterfaces,
  checkout.controller.orders.ordersinterfaces,
  checkout.controller.orders.orders,
  checkout.controller.orders.ordersproducts;

type
  TController = class(TInterfacedObject, iController)
    public
      constructor Create;
      class function New: iController;
      function Orders: iControllerOrders;
      function OrdersProducts: iControllerOrdersProducts;
  end;

implementation

{ TController }

constructor TController.Create;
begin

end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

function TController.Orders: iControllerOrders;
begin
  Result := TControllerOrders.New;
end;

function TController.OrdersProducts: iControllerOrdersProducts;
begin
  Result := TControllerOrdersProducts.New;
end;

end.
