unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, ConnectionDB, checkout.controller.controller,
  checkout.controller.orders.ordersinterfaces, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, checkout.model.entity.orders, checkout.model.entity.orders_products;

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
    procedure BindModelToView(const AOrder: TORDERS);
    procedure BindViewToModel(const AOrder: TORDERS);
    procedure OpenOrderProducts;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.BindModelToView(const AOrder: TORDERS);
begin

end;

procedure TFrmMain.BindViewToModel(const AOrder: TORDERS);
var
  LBookmark: TBookmark;
  LProduct: TORDERS_PRODUCTS;
begin
  AOrder.CUSTOMER_ID := 0;
  AOrder.ISSUE_DATE := Now;
  AOrder.TOTAL := 0;

  try
    FDMemTable1.DisableControls;
    FDMemTable1.Bookmark;
    FDMemTable1.First;
    while not FDMemTable1.Eof do
    begin
      LProduct := TORDERS_PRODUCTS.Create;
      try
        LProduct.ID := FDMemTable1.FieldByName('ID').AsInteger;
        LProduct.ORDER_ID := FDMemTable1.FieldByName('ORDER_ID').AsInteger;
        LProduct.QUANTITY := FDMemTable1.FieldByName('QUANTITY').AsFloat;
        LProduct.UNIT_VALUE := FDMemTable1.FieldByName('UNIT_VALUE').AsCurrency;
        LProduct.TOTAL := FDMemTable1.FieldByName('TOTAL').AsCurrency;
      except
        LProduct.Free;
        raise;
      end;
      AOrder.AddProduct(LProduct);
      FDMemTable1.Next;
    end;
  finally
    FDMemTable1.EnableControls;
    FDMemTable1.Bookmark := LBookmark;
  end;
end;

procedure TFrmMain.btnFinalizarVendaClick(Sender: TObject);
var
  LOrder: TORDERS;
begin
  LOrder := TORDERS.Create;
  try
    BindViewToModel(LOrder);
    FController.Save(LOrder);
    OpenOrderProducts;
  finally
    LOrder.Free;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  ConnectionDB.DmConnection.Connection.Connected := True;

  FController := TController.New.Orders;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  OpenOrderProducts;
end;

procedure TFrmMain.OpenOrderProducts;
var
  LQuery: TFDQuery;
begin
  LQuery := nil;
  try
    FController.Items.FindByOrderId(-1, TDataSet(LQuery));
    FDMemTable1.CloneCursor(LQuery);
  finally
    LQuery.Free;
  end;
end;

end.
