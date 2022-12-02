unit checkout.controller.orders.ordersinterfaces;

interface

uses
  Data.DB,
  checkout.model.entity.orders;

type
  iControllerOrdersInterfaces = interface
    ['{51B0019E-F7E8-4C68-89B7-66EB1F7B8665}']
    function find(const ADataSet: TDataSet): iControllerOrdersInterfaces;
    function save(const AOrder: TOrders): iControllerOrdersInterfaces;
    function delete(const AOrder: TOrders): iControllerOrdersInterfaces;
  end;

implementation

end.
