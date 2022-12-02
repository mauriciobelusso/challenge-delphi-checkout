unit checkout.model.orders.interfaces;

interface

uses
  Data.DB,
  checkout.model.entity.orders;

type
  TOrdersInterfaces = interface
    function find(const ADataSet: TDataSet): TOrdersInterfaces;
    function save(const AOrder: TOrders): TOrdersInterfaces;
    function delete(const AOrder: TOrders): TOrdersInterfaces;
  end;

implementation

end.
