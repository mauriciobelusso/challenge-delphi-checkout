unit checkout.model.modelinterfaces;

interface

uses
  checkout.model.orders.ordersinterfaces,
  checkout.model.customersinterfaces,
  checkout.model.productsinterfaces;

type
  iModel = interface
  ['{1F7E52A0-4BAF-47A1-A2A5-6FE871BCDDAF}']
    function Orders: iModelOrders;
    function OrdersProducts: iModelOrdersProducts;
    function Customers: iModelCustomers;
    function Products: iModelProducts;
  end;

implementation

end.
