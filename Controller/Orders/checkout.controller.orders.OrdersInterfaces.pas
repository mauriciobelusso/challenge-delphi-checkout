unit checkout.controller.orders.ordersinterfaces;

interface

uses
  Data.DB,
  checkout.model.entity.orders;

type
  iControllerOrdersProductsInterfaces = interface;

  iControllerOrdersInterfaces = interface
    ['{51B0019E-F7E8-4C68-89B7-66EB1F7B8665}']
    function Find(var ADataSet: TDataSet): iControllerOrdersInterfaces;
    function Save(const AOrder: TOrders): iControllerOrdersInterfaces;
    function Delete(const AOrder: TOrders): iControllerOrdersInterfaces;
    function Items(): iControllerOrdersProductsInterfaces;
  end;

  iControllerOrdersProductsInterfaces = interface
    ['{4BF937A4-C28E-4543-B0E8-88ADE11AC732}']
    function Find(var ADataSet: TDataSet): iControllerOrdersProductsInterfaces;
    function Save(const AOrder: TOrders): iControllerOrdersProductsInterfaces;
    function Delete(const AOrder: TOrders): iControllerOrdersProductsInterfaces;
    function FindByOrderId(const AOrderId: Integer; var ADataSet: TDataSet): iControllerOrdersProductsInterfaces;
  end;

implementation

end.
