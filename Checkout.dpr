program Checkout;

uses
  Vcl.Forms,
  System.Classes,
  ConnectionDB in 'ConnectionDB.pas' {DmConnection: TDataModule},
  Main in 'Main.pas' {FrmMain},
  checkout.model.entity.orders in 'Model\Entity\checkout.model.entity.orders.pas',
  checkout.model.entity.customers in 'Model\Entity\checkout.model.entity.customers.pas',
  checkout.model.entity.products in 'Model\Entity\checkout.model.entity.products.pas',
  checkout.model.entity.orders_products in 'Model\Entity\checkout.model.entity.orders_products.pas',
  checkout.model.orders in 'Model\Orders\checkout.model.orders.pas',
  checkout.model.orders.ordersinterfaces in 'Model\Orders\checkout.model.orders.ordersinterfaces.pas',
  checkout.model.model in 'Model\checkout.model.model.pas',
  checkout.model.modelinterfaces in 'Model\checkout.model.modelinterfaces.pas',
  checkout.controller.controller in 'Controller\checkout.controller.controller.pas',
  checkout.controller.controllerinterfaces in 'Controller\checkout.controller.controllerinterfaces.pas',
  checkout.controller.orders.ordersinterfaces in 'Controller\Orders\checkout.controller.orders.ordersinterfaces.pas',
  checkout.controller.orders.orders in 'Controller\Orders\checkout.controller.orders.orders.pas',
  checkout.controller.orders.ordersproducts in 'Controller\Orders\checkout.controller.orders.ordersproducts.pas',
  checkout.model.orders.orderproducts in 'Model\Orders\checkout.model.orders.orderproducts.pas',
  checkout.model.customers in 'Model\checkout.model.customers.pas',
  checkout.model.products in 'Model\checkout.model.products.pas',
  checkout.model.customersinterfaces in 'Model\checkout.model.customersinterfaces.pas',
  checkout.model.productsinterfaces in 'Model\checkout.model.productsinterfaces.pas',
  checkout.controller.customersinterfaces in 'Controller\checkout.controller.customersinterfaces.pas',
  checkout.controller.customers in 'Controller\checkout.controller.customers.pas',
  checkout.controller.products in 'Controller\checkout.controller.products.pas',
  checkout.controller.productsinterfaces in 'Controller\checkout.controller.productsinterfaces.pas',
  checkout.view.orders in 'View\checkout.view.orders.pas' {FrmOrders};

{$R *.res}

begin
  Application.Initialize;

  {$WARNINGS OFF}
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  {$WARNINGS ON}

  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmConnection, DmConnection);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
