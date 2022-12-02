program Checkout;

uses
  Vcl.Forms,
  System.Classes,
  Main in 'Main.pas' {FrmMain},
  checkout.model.entity.orders in 'Model\Entity\checkout.model.entity.orders.pas',
  checkout.model.entity.customers in 'Model\Entity\checkout.model.entity.customers.pas',
  checkout.model.entity.products in 'Model\Entity\checkout.model.entity.products.pas',
  checkout.model.entity.orders_products in 'Model\Entity\checkout.model.entity.orders_products.pas';

{$R *.res}

begin
  Application.Initialize;

  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
