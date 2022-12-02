unit checkout.controller.orders.ordersproducts;

interface

uses
  Data.DB,
  checkout.model.entity.orders_products,
  checkout.controller.orders.ordersinterfaces,
  checkout.model.orders.ordersinterfaces,
  checkout.model.model;

type
  TControllerOrdersProducts = class(TInterfacedObject, iControllerOrdersProducts)
    private
      FModel: iModelOrdersProducts;
    public
      constructor Create;
      class function New: iControllerOrdersProducts;

      function Find(var ADataSet: TDataSet): iControllerOrdersProducts;
      function Save(const AOrderProducts: TORDERS_PRODUCTS): iControllerOrdersProducts;
      function Delete(const AOrderProducts: TORDERS_PRODUCTS): iControllerOrdersProducts;
      function FindByOrderId(const AOrderId: Integer; var ADataSet: TDataSet): iControllerOrdersProducts;
  end;

implementation

{ TControllerOrdersProducts }

constructor TControllerOrdersProducts.Create;
begin
  FModel := TModel.New.OrdersProducts;
end;

function TControllerOrdersProducts.Delete(
  const AOrderProducts: TORDERS_PRODUCTS): iControllerOrdersProducts;
begin
  Result := Self;
  FModel.Delete(AOrderProducts);
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
  FModel.FindByOrderId(AOrderId, ADataSet);
end;

class function TControllerOrdersProducts.New: iControllerOrdersProducts;
begin
  Result := Self.Create;
end;

function TControllerOrdersProducts.Save(
  const AOrderProducts: TORDERS_PRODUCTS): iControllerOrdersProducts;
begin
  Result := Self;
  FModel.Save(AOrderProducts);
end;

end.
