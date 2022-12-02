unit checkout.controller.controllerinterfaces;

interface

uses
  checkout.controller.orders.ordersinterfaces;

type
  iController = interface
    ['{168EEF1C-BDDA-473A-BABB-4F7395944F2D}']
    function Orders: iControllerOrders;
    function OrdersProducts: iControllerOrdersProducts;
  end;

implementation

end.
