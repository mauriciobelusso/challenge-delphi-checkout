unit checkout.model.orders;

interface

uses
  Data.DB,
  checkout.model.orders.interfaces,
  checkout.model.entity.orders;

type
  TModelOrders = class(TInterfacedObject, TOrdersInterfaces)
    public
      function find(const ADataSet: TDataSet): TOrdersInterfaces;
      function save(const AOrder: TOrders): TOrdersInterfaces;
      function delete(const AOrder: TOrders): TOrdersInterfaces;
  end;

implementation

{ TModelOrders }

function TModelOrders.delete(const AOrder: TOrders): TOrdersInterfaces;
begin
  Result := Self;
end;

function TModelOrders.find(const ADataSet: TDataSet): TOrdersInterfaces;
begin
  Result := Self;
end;

function TModelOrders.save(const AOrder: TOrders): TOrdersInterfaces;
begin
  Result := Self;
end;

end.
