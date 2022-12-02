unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, ConnectionDB, checkout.controller.controller;

type
  TFrmMain = class(TForm)
    pnlMain: TPanel;
    DBGrid1: TDBGrid;
    dsProdutos: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    btnFinalizarVenda: TButton;
    btnCancelar: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    Panel3: TPanel;
    btnAddProduto: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnFinalizarVendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.btnFinalizarVendaClick(Sender: TObject);
begin
  TController.New.Orders
    .save(nil);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  ConnectionDB.DmConnection.Connection.Connected := True;
end;

end.
