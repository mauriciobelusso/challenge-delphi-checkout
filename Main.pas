unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, ConnectionDB, checkout.controller.controller,
  checkout.controller.orders.ordersinterfaces, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

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
    FDMemTable1: TFDMemTable;
    procedure FormCreate(Sender: TObject);
    procedure btnFinalizarVendaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FController: iControllerOrders;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.btnFinalizarVendaClick(Sender: TObject);
begin
  FController.Save(nil);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  ConnectionDB.DmConnection.Connection.Connected := True;

  FController := TController.New.Orders;
end;

procedure TFrmMain.FormShow(Sender: TObject);
var
  LQuery: TFDQuery;
begin
  LQuery := nil;
  try
    FController.Items.FindByOrderId(0, TDataSet(LQuery));
    FDMemTable1.CloneCursor(LQuery);
  finally
    LQuery.Free;
  end;
end;

end.
