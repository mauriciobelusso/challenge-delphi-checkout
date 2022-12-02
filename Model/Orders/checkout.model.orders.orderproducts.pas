unit checkout.model.orders.orderproducts;

interface

uses
  Data.DB,
  checkout.model.entity.orders,
  checkout.model.orders.ordersinterfaces;

type
  TModelOrdersProducts = class(TInterfacedObject, iModelOrdersProducts)
    public
      constructor Create;
      class function New: iModelOrdersProducts;

      function Find(var ADataSet: TDataSet): iModelOrdersProducts;
      function Save(const AOrder: TOrders): iModelOrdersProducts;
      function Delete(const AOrder: TOrders): iModelOrdersProducts;
      function FindByOrderId(const AOrderId: Integer; var ADataSet: TDataSet): iModelOrdersProducts;
  end;

implementation

{ TControllerOrdersProducts }

constructor TModelOrdersProducts.Create;
begin

end;

function TModelOrdersProducts.Delete(
  const AOrder: TOrders): iModelOrdersProducts;
begin
  Result := Self;
end;

function TModelOrdersProducts.Find(
  var ADataSet: TDataSet): iModelOrdersProducts;
begin
  Result := Self;
end;

function TModelOrdersProducts.FindByOrderId(const AOrderId: Integer;
  var ADataSet: TDataSet): iModelOrdersProducts;
begin
  Result := Self;
end;

class function TModelOrdersProducts.New: iModelOrdersProducts;
begin
  Result := Self.Create;
end;

function TModelOrdersProducts.Save(
  const AOrder: TOrders): iModelOrdersProducts;
begin
  Result := Self;
end;

end.
