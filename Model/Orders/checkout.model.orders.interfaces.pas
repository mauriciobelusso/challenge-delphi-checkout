unit checkout.model.orders.interfaces;

interface

uses
  Data.DB,
  checkout.model.entity.orders;

type
  iOrdersInterfaces = interface
  ['{85DCC1A2-65BE-45AF-ABA0-66A4A982ADD3}']
    function find(const ADataSet: TDataSet): iOrdersInterfaces;
    function save(const AOrder: TOrders): iOrdersInterfaces;
    function delete(const AOrder: TOrders): iOrdersInterfaces;
  end;

implementation

end.
