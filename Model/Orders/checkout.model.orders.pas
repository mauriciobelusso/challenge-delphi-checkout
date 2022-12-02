unit checkout.model.orders;

interface

uses
  Data.DB,
  checkout.model.orders.interfaces,
  checkout.model.entity.orders;

type
  TModelOrders = class(TInterfacedObject, TOrdersInterfaces)
    private
      procedure insert(const AOrder: TOrders);
      procedure update(const AOrder: TOrders);
    public
      function find(const ADataSet: TDataSet): TOrdersInterfaces;
      function save(const AOrder: TOrders): TOrdersInterfaces;
      function delete(const AOrder: TOrders): TOrdersInterfaces;
  end;

implementation

uses
  ConnectionDB;

{ TModelOrders }

function TModelOrders.delete(const AOrder: TOrders): TOrdersInterfaces;
begin
  Result := Self;
end;

function TModelOrders.find(const ADataSet: TDataSet): TOrdersInterfaces;
begin
  Result := Self;
end;

procedure TModelOrders.insert(const AOrder: TOrders);
begin

end;

function TModelOrders.save(const AOrder: TOrders): TOrdersInterfaces;
begin
  Result := Self;
  if AOrder.ID = 0 then
    insert(AOrder)
  else
    update(AOrder);
end;

procedure TModelOrders.update(const AOrder: TOrders);
begin

end;

end.
