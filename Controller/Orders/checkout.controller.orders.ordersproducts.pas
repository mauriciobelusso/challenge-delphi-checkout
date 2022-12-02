unit checkout.controller.orders.ordersproducts;

interface

uses
  Data.DB,
  checkout.model.entity.orders,
  checkout.controller.orders.ordersinterfaces;

type
  TControllerOrdersProductsInterfaces = class(TInterfacedObject, iControllerOrdersProductsInterfaces)
    private
      FOrder: TOrders;
    public
      constructor Create; overload;
      class function New: iControllerOrdersProductsInterfaces; overload;


      constructor Create(const AOrder: TOrders); overload;
      class function New(const AOrder: TOrders): iControllerOrdersProductsInterfaces; overload;

      function Find(var ADataSet: TDataSet): iControllerOrdersProductsInterfaces;
      function Save(const AOrder: TOrders): iControllerOrdersProductsInterfaces;
      function Delete(const AOrder: TOrders): iControllerOrdersProductsInterfaces;
  end;

implementation

{ TControllerOrdersProductsInterfaces }

constructor TControllerOrdersProductsInterfaces.Create;
begin

end;

constructor TControllerOrdersProductsInterfaces.Create(const AOrder: TOrders);
begin
  FOrder := AOrder;
end;

function TControllerOrdersProductsInterfaces.Delete(
  const AOrder: TOrders): iControllerOrdersProductsInterfaces;
begin
  Result := Self;
end;

function TControllerOrdersProductsInterfaces.Find(
  var ADataSet: TDataSet): iControllerOrdersProductsInterfaces;
begin
  Result := Self;
end;

class function TControllerOrdersProductsInterfaces.New(
  const AOrder: TOrders): iControllerOrdersProductsInterfaces;
begin
  Result := Self.Create(AOrder);
end;

class function TControllerOrdersProductsInterfaces.New: iControllerOrdersProductsInterfaces;
begin
  Result := Self.Create;
end;

function TControllerOrdersProductsInterfaces.Save(
  const AOrder: TOrders): iControllerOrdersProductsInterfaces;
begin
  Result := Self;
end;

end.
