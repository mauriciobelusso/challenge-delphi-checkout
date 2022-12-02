unit checkout.controller.controllerinterfaces;

interface

uses
  checkout.controller.orders.ordersinterfaces,
  checkout.controller.customersinterfaces,
  checkout.controller.productsinterfaces;

type
  iController = interface
    ['{168EEF1C-BDDA-473A-BABB-4F7395944F2D}']
    function Orders: iControllerOrders;
    function OrdersProducts: iControllerOrdersProducts;
    function Customers: iControllerCustomers;
    function Products: iControllerProducts;
  end;

implementation

end.
