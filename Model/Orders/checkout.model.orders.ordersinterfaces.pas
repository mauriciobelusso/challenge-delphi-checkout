unit checkout.model.orders.ordersinterfaces;

interface

uses
  Data.DB,
  checkout.model.entity.orders;

type
  iModelOrdersInterfaces = interface
  ['{85DCC1A2-65BE-45AF-ABA0-66A4A982ADD3}']
    function find(var ADataSet: TDataSet): iModelOrdersInterfaces;
    function save(const AOrder: TOrders): iModelOrdersInterfaces;
    function delete(const AOrder: TOrders): iModelOrdersInterfaces;
  end;

implementation

end.
