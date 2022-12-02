unit checkout.controller.controller;

interface

uses
  checkout.controller.ControllerInterfaces,
  checkout.controller.orders.ordersinterfaces,
  checkout.controller.orders.orders,
  checkout.controller.orders.ordersproducts,
  checkout.controller.customersinterfaces,
  checkout.controller.customers,
  checkout.controller.productsinterfaces,
  checkout.controller.products;

type
  TController = class(TInterfacedObject, iController)
    public
      constructor Create;
      class function New: iController;
      function Orders: iControllerOrders;
      function OrdersProducts: iControllerOrdersProducts;
      function Customers: iControllerCustomers;
      function Products: iControllerProducts;
  end;

implementation

{ TController }

constructor TController.Create;
begin

end;

function TController.Customers: iControllerCustomers;
begin
  Result := TControllerCustomers.New;
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

function TController.Products: iControllerProducts;
begin
  Result := TControllerProducts.New;
end;

end.
