program Checkout;

uses
  Vcl.Forms,
  System.Classes,
  Main in 'Main.pas' {FrmMain},
  checkout.model.entity.orders in 'Model\Entity\checkout.model.entity.orders.pas',
  checkout.model.entity.customers in 'Model\Entity\checkout.model.entity.customers.pas',
  checkout.model.entity.products in 'Model\Entity\checkout.model.entity.products.pas',
  checkout.model.entity.orders_products in 'Model\Entity\checkout.model.entity.orders_products.pas',
  checkout.model.orders in 'Model\Orders\checkout.model.orders.pas',
  checkout.model.orders.ordersinterfaces in 'Model\Orders\checkout.model.orders.ordersinterfaces.pas',
  ConnectionDB in 'ConnectionDB.pas' {DmConnection: TDataModule},
  checkout.model.model in 'Model\checkout.model.model.pas',
  checkout.model.modelinterfaces in 'Model\checkout.model.modelinterfaces.pas',
  checkout.controller.controller in 'Controller\checkout.controller.controller.pas',
  checkout.controller.controllerinterfaces in 'Controller\checkout.controller.controllerinterfaces.pas',
  checkout.controller.orders.ordersinterfaces in 'Controller\Orders\checkout.controller.orders.ordersinterfaces.pas';

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
