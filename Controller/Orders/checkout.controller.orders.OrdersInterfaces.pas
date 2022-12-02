unit checkout.controller.orders.ordersinterfaces;

interface

uses
  Data.DB,
  checkout.model.entity.orders;

type
  iControllerOrdersProducts = interface;

  iControllerOrders = interface
    ['{51B0019E-F7E8-4C68-89B7-66EB1F7B8665}']
    function Find(var ADataSet: TDataSet): iControllerOrders;
    function Save(const AOrder: TOrders): iControllerOrders;
    function Delete(const AOrder: TOrders): iControllerOrders;
    function Items(): iControllerOrdersProducts;
  end;

  iControllerOrdersProducts = interface
    ['{4BF937A4-C28E-4543-B0E8-88ADE11AC732}']
    function Find(var ADataSet: TDataSet): iControllerOrdersProducts;
    function Save(const AOrder: TOrders): iControllerOrdersProducts;
    function Delete(const AOrder: TOrders): iControllerOrdersProducts;
    function FindByOrderId(const AOrderId: Integer; var ADataSet: TDataSet): iControllerOrdersProducts;
  end;

implementation

end.
