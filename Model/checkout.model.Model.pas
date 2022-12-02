unit checkout.model.model;

interface

uses
  checkout.model.ModelInterfaces,
  checkout.model.orders.ordersinterfaces,
  checkout.model.orders,
  checkout.model.orders.orderproducts,
  checkout.model.customersinterfaces,
  checkout.model.customers,
  checkout.model.productsinterfaces,
  checkout.model.products;

type
  TModel = class(TInterfacedObject, iModel)
    public
      constructor Create;
      class function New: iModel;

      function Orders: iModelOrders;
      function OrdersProducts: iModelOrdersProducts;
      function Customers: iModelCustomers;
      function Products: iModelProducts;
  end;

implementation

{ TModel }

constructor TModel.Create;
begin

end;

class function TModel.New: iModel;
begin
  Result := Self.Create;
end;

function TModel.Orders: iModelOrders;
begin
  Result := TModelOrders.New;
end;

function TModel.OrdersProducts: iModelOrdersProducts;
begin
  Result := TModelOrdersProducts.New;
end;

function TModel.Products: iModelProducts;
begin
  Result := TModelProducts.New;
end;

function TModel.Customers: iModelCustomers;
begin
  Result := TModelCustomers.New;
end;

end.
