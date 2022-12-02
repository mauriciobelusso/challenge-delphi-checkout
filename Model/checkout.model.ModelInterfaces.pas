unit checkout.model.modelinterfaces;

interface

uses
  checkout.model.orders.ordersinterfaces;

type
  iModel = interface
  ['{1F7E52A0-4BAF-47A1-A2A5-6FE871BCDDAF}']
    function Orders: iModelOrders;
    function OrdersProducts: iModelOrdersProducts;
  end;

implementation

end.
