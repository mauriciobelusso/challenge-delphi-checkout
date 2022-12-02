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
  TControllerOrders = class(TInterfacedObject, iControllerOrders)
    private
      FModel: iModelOrders;
    public
      constructor Create;
      class function New: iControllerOrders;
      function Find(var ADataSet: TDataSet): iControllerOrders;
      function Save(const AOrder: TOrders): iControllerOrders;
      function Delete(const AOrder: TOrders): iControllerOrders;
      function Items(): iControllerOrdersProducts;
  end;

implementation

{ TControllerOrders }

constructor TControllerOrders.Create;
begin
  FModel := TModel.New.Orders;
end;

function TControllerOrders.Delete(const AOrder: TOrders): iControllerOrders;
begin
  Result := Self;
  FModel.delete(AOrder);
end;

function TControllerOrders.Find(var ADataSet: TDataSet): iControllerOrders;
begin
  Result := Self;
  FModel.find(ADataSet);
end;

function TControllerOrders.Items: iControllerOrdersProducts;
begin
  Result := TControllerOrdersProducts.New;
end;

class function TControllerOrders.New: iControllerOrders;
begin
  Result := Self.Create;
end;

function TControllerOrders.Save(const AOrder: TOrders): iControllerOrders;
begin
  Result := Self;
  FModel.Save(AOrder);
end;

end.
