unit checkout.model.orders.ordersinterfaces;

interface

uses
  Data.DB,
  checkout.model.entity.orders;

type
  iModelOrders = interface
  ['{85DCC1A2-65BE-45AF-ABA0-66A4A982ADD3}']
    function Find(var ADataSet: TDataSet): iModelOrders;
    function Save(const AOrder: TOrders): iModelOrders;
    function Delete(const AOrder: TOrders): iModelOrders;
  end;


  iModelOrdersProducts = interface
  ['{D87BFBC0-44BF-438E-8FE9-1F69D4C9D42A}']
    function Find(var ADataSet: TDataSet): iModelOrdersProducts;
    function Save(const AOrder: TOrders): iModelOrdersProducts;
    function Delete(const AOrder: TOrders): iModelOrdersProducts;
  end;

implementation

end.
