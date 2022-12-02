unit checkout.controller.controller;

interface

uses
  checkout.controller.ControllerInterfaces,
  checkout.controller.orders.ordersinterfaces,
  checkout.controller.orders.orders,
  checkout.controller.orders.ordersproducts;

type
  TController = class(TInterfacedObject, iControllerInterfaces)
    public
      constructor Create;
      class function New: iControllerInterfaces;
      function Orders: iControllerOrdersInterfaces;
      function OrdersProducts: iControllerOrdersProductsInterfaces;
  end;

implementation

{ TController }

constructor TController.Create;
begin

end;

class function TController.New: iControllerInterfaces;
begin
  Result := Self.Create;
end;

function TController.Orders: iControllerOrdersInterfaces;
begin
  Result := TControllerOrders.New;
end;

function TController.OrdersProducts: iControllerOrdersProductsInterfaces;
begin
  Result := TControllerOrdersProducts.New;
end;

end.
