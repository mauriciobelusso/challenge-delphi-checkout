unit checkout.controller.orders.ordersproducts;

interface

uses
  Data.DB,
  checkout.model.entity.orders,
  checkout.controller.orders.ordersinterfaces;

type
  TControllerOrdersProducts = class(TInterfacedObject, iControllerOrdersProductsInterfaces)
    public
      constructor Create;
      class function New: iControllerOrdersProductsInterfaces;

      function Find(var ADataSet: TDataSet): iControllerOrdersProductsInterfaces;
      function Save(const AOrder: TOrders): iControllerOrdersProductsInterfaces;
      function Delete(const AOrder: TOrders): iControllerOrdersProductsInterfaces;
      function FindByOrderId(const AOrderId: Integer; var ADataSet: TDataSet): iControllerOrdersProductsInterfaces;
  end;

implementation

{ TControllerOrdersProducts }

constructor TControllerOrdersProducts.Create;
begin

end;

function TControllerOrdersProducts.Delete(
  const AOrder: TOrders): iControllerOrdersProductsInterfaces;
begin
  Result := Self;
end;

function TControllerOrdersProducts.Find(
  var ADataSet: TDataSet): iControllerOrdersProductsInterfaces;
begin
  Result := Self;
end;

function TControllerOrdersProducts.FindByOrderId(const AOrderId: Integer;
  var ADataSet: TDataSet): iControllerOrdersProductsInterfaces;
begin
  Result := Self;
end;

class function TControllerOrdersProducts.New: iControllerOrdersProductsInterfaces;
begin
  Result := Self.Create;
end;

function TControllerOrdersProducts.Save(
  const AOrder: TOrders): iControllerOrdersProductsInterfaces;
begin
  Result := Self;
end;

end.
