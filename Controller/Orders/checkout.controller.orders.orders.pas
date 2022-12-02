unit checkout.controller.orders.orders;

interface

uses
  Data.DB,
  checkout.model.entity.orders,
  checkout.controller.orders.ordersinterfaces,
  checkout.model.orders.ordersinterfaces,
  checkout.model.model;

type
  TControllerOrders = class(TInterfacedObject, iControllerOrdersInterfaces)
    private
      FModel: iModelOrdersInterfaces;
    public
      constructor Create;
      class function New: iControllerOrdersInterfaces;
      function find(var ADataSet: TDataSet): iControllerOrdersInterfaces;
      function save(const AOrder: TOrders): iControllerOrdersInterfaces;
      function delete(const AOrder: TOrders): iControllerOrdersInterfaces;
  end;

implementation

{ TControllerOrders }

constructor TControllerOrders.Create;
begin
  FModel := TModel.New.Orders;
end;

function TControllerOrders.delete(const AOrder: TOrders): iControllerOrdersInterfaces;
begin
  Result := Self;
  FModel.delete(AOrder);
end;

function TControllerOrders.find(var ADataSet: TDataSet): iControllerOrdersInterfaces;
begin
  Result := Self;
  FModel.find(ADataSet);
end;

class function TControllerOrders.New: iControllerOrdersInterfaces;
begin
  Result := Self.Create;
end;

function TControllerOrders.save(const AOrder: TOrders): iControllerOrdersInterfaces;
begin
  Result := Self;
  FModel.save(AOrder);
end;

end.
