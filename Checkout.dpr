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
  checkout.model.orders.interfaces in 'Model\Orders\checkout.model.orders.interfaces.pas',
  ConnectionDB in 'ConnectionDB.pas' {DmConnection: TDataModule};

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
