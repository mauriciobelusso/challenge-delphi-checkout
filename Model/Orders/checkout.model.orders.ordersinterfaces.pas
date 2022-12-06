unit checkout.model.orders.ordersinterfaces;

interface

uses
  Data.DB,
  checkout.model.entity.orders,
  checkout.model.entity.orders_products;

type
  iModelOrders = interface
  ['{85DCC1A2-65BE-45AF-ABA0-66A4A982ADD3}']
    function Find(var ADataSet: TDataSet): iModelOrders;
    function FindById(const AOrder: TORDERS): iModelOrders;
    function Save(const AOrder: TORDERS): iModelOrders;
    function Delete(const AOrder: TORDERS): iModelOrders;
  end;


  iModelOrdersProducts = interface
  ['{D87BFBC0-44BF-438E-8FE9-1F69D4C9D42A}']
    function Find(var ADataSet: TDataSet): iModelOrdersProducts;
    function FindByOrderId(const AOrderId: Integer; var ADataSet: TDataSet): iModelOrdersProducts;
    function Save(const AOrderProducts: TORDERS_PRODUCTS): iModelOrdersProducts;
    function Delete(const AOrderProducts: TORDERS_PRODUCTS): iModelOrdersProducts;
  end;

implementation

end.
