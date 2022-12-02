program Checkout;

uses
  Vcl.Forms,
  Main in 'Main.pas',
  System.Classes {FrmMain};

{$R *.res}

begin
  Application.Initialize;

  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
