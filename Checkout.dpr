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
  checkout.model.Model in 'Model\checkout.model.Model.pas',
  checkout.model.ModelInterfaces in 'Model\checkout.model.ModelInterfaces.pas',
  checkout.controller.Controller in 'Controller\checkout.controller.Controller.pas',
  checkout.controller.ControllerInterfaces in 'Controller\checkout.controller.ControllerInterfaces.pas',
  checkout.controller.orders.OrdersInterfaces in 'Controller\Orders\checkout.controller.orders.OrdersInterfaces.pas';

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
