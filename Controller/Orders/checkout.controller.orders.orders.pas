unit checkout.controller.orders.orders;

interface

uses
  Data.DB,
  checkout.model.entity.orders,
  checkout.controller.orders.ordersinterfaces,
  checkout.model.orders.ordersinterfaces,
  checkout.model.model,
  checkout.controller.orders.ordersproducts;

type
  TControllerOrders = class(TInterfacedObject, iControllerOrdersInterfaces)
    private
      FModel: iModelOrdersInterfaces;
    public
      constructor Create;
      class function New: iControllerOrdersInterfaces;
      function Find(var ADataSet: TDataSet): iControllerOrdersInterfaces;
      function Save(const AOrder: TOrders): iControllerOrdersInterfaces;
      function Delete(const AOrder: TOrders): iControllerOrdersInterfaces;
      function Items(): iControllerOrdersProductsInterfaces;
  end;

implementation

{ TControllerOrders }

constructor TControllerOrders.Create;
begin
  FModel := TModel.New.Orders;
end;

function TControllerOrders.Delete(const AOrder: TOrders): iControllerOrdersInterfaces;
begin
  Result := Self;
  FModel.delete(AOrder);
end;

function TControllerOrders.Find(var ADataSet: TDataSet): iControllerOrdersInterfaces;
begin
  Result := Self;
  FModel.find(ADataSet);
end;

function TControllerOrders.Items: iControllerOrdersProductsInterfaces;
begin
  Result := TControllerOrdersProducts.New;
end;

class function TControllerOrders.New: iControllerOrdersInterfaces;
begin
  Result := Self.Create;
end;

function TControllerOrders.Save(const AOrder: TOrders): iControllerOrdersInterfaces;
begin
  Result := Self;
  FModel.Save(AOrder);
end;

end.
