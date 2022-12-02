unit checkout.controller.orders.ordersproducts;

interface

uses
  Data.DB,
  checkout.model.entity.orders,
  checkout.controller.orders.ordersinterfaces;

type
  TControllerOrdersProducts = class(TInterfacedObject, iControllerOrdersProducts)
    public
      constructor Create;
      class function New: iControllerOrdersProducts;

      function Find(var ADataSet: TDataSet): iControllerOrdersProducts;
      function Save(const AOrder: TOrders): iControllerOrdersProducts;
      function Delete(const AOrder: TOrders): iControllerOrdersProducts;
      function FindByOrderId(const AOrderId: Integer; var ADataSet: TDataSet): iControllerOrdersProducts;
  end;

implementation

{ TControllerOrdersProducts }

constructor TControllerOrdersProducts.Create;
begin

end;

function TControllerOrdersProducts.Delete(
  const AOrder: TOrders): iControllerOrdersProducts;
begin
  Result := Self;
end;

function TControllerOrdersProducts.Find(
  var ADataSet: TDataSet): iControllerOrdersProducts;
begin
  Result := Self;
end;

function TControllerOrdersProducts.FindByOrderId(const AOrderId: Integer;
  var ADataSet: TDataSet): iControllerOrdersProducts;
begin
  Result := Self;
end;

class function TControllerOrdersProducts.New: iControllerOrdersProducts;
begin
  Result := Self.Create;
end;

function TControllerOrdersProducts.Save(
  const AOrder: TOrders): iControllerOrdersProducts;
begin
  Result := Self;
end;

end.
