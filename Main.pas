unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, ConnectionDB, checkout.controller.controller,
  checkout.controller.orders.ordersinterfaces, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, checkout.model.entity.orders, checkout.model.entity.orders_products,
  Vcl.WinXCtrls;

type
  TFrmMain = class(TForm)
    pnlMain: TPanel;
    DBGrid1: TDBGrid;
    dsProdutos: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    btnFinalizarVenda: TButton;
    Panel3: TPanel;
    btnAddProduto: TButton;
    FDMemTable1: TFDMemTable;
    Panel4: TPanel;
    edtCustomer: TLabeledEdit;
    edtProduct: TLabeledEdit;
    edtQuantity: TLabeledEdit;
    edtCustomerId: TEdit;
    edtUnitValue: TLabeledEdit;
    edtProductId: TEdit;
    edtTotal: TLabeledEdit;
    lblCustomer: TLabel;
    lblProduct: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFinalizarVendaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddProdutoClick(Sender: TObject);
    procedure edtQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure edtUnitValueKeyPress(Sender: TObject; var Key: Char);
    procedure edtCustomerIdExit(Sender: TObject);
    procedure edtProductIdExit(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FDMemTable1AfterPost(DataSet: TDataSet);
    procedure FDMemTable1AfterDelete(DataSet: TDataSet);
    procedure FDMemTable1BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FController: iControllerOrders;
    procedure BindViewToModel(const AOrder: TORDERS);
    procedure BindViewToDataSet;
    procedure BindDataSetToView;
    procedure OpenOrderProducts;
    procedure AddProductToGrid;
    procedure MergeProduct;
    procedure SaveProduct;
    procedure CheckProduct;
    procedure FindCustomer;
    procedure FindProduct;
    procedure EvaluateSubTotal;
    procedure NewOrder;
    procedure EditProduct;
    procedure NewProduct;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.MergeProduct;
begin
  CheckProduct;
  SaveProduct;
  NewProduct;
end;

procedure TFrmMain.AddProductToGrid;
begin
  BindViewToDataSet;
end;

procedure TFrmMain.BindDataSetToView;
begin
  edtProductId.Text := FDMemTable1.FieldByName('PRODUCT_ID').AsString;
  edtProduct.Text := FDMemTable1.FieldByName('DESCRIPTION').AsString;
  edtQuantity.Text := FDMemTable1.FieldByName('QUANTITY').AsString;
  edtUnitValue.Text := FDMemTable1.FieldByName('UNIT_VALUE').AsString;
end;

procedure TFrmMain.BindViewToDataSet;
begin
  FDMemTable1.FieldByName('PRODUCT_ID').AsInteger := StrToIntDef(edtProductId.Text, 0);
  FDMemTable1.FieldByName('DESCRIPTION').ReadOnly := False;
  FDMemTable1.FieldByName('DESCRIPTION').AsString := edtProduct.Text;
  FDMemTable1.FieldByName('DESCRIPTION').ReadOnly := True;
  FDMemTable1.FieldByName('QUANTITY').AsFloat := StrToFloatDef(edtQuantity.Text, 0);
  FDMemTable1.FieldByName('UNIT_VALUE').AsCurrency:= StrToCurrDef(edtUnitValue.Text, 0);
end;

procedure TFrmMain.BindViewToModel(const AOrder: TORDERS);
var
  LBookmark: TBookmark;
  LProduct: TORDERS_PRODUCTS;
begin
  AOrder.CUSTOMER_ID := StrToIntDef(edtCustomerId.Text, 0);
  AOrder.ISSUE_DATE := Now;
  AOrder.TOTAL := StrToCurrDef(edtTotal.Text, 0);

  try
    FDMemTable1.DisableControls;
    FDMemTable1.Bookmark;
    FDMemTable1.First;
    while not FDMemTable1.Eof do
    begin
      LProduct := TORDERS_PRODUCTS.Create;
      try
        LProduct.ID := FDMemTable1.FieldByName('ID').AsInteger;
        LProduct.PRODUCT_ID := FDMemTable1.FieldByName('PRODUCT_ID').AsInteger;
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

procedure TFrmMain.btnAddProdutoClick(Sender: TObject);
begin
  MergeProduct;
end;

procedure TFrmMain.btnFinalizarVendaClick(Sender: TObject);
var
  LOrder: TORDERS;
begin
  LOrder := TORDERS.Create;
  try
    BindViewToModel(LOrder);
    FController.Save(LOrder);
    NewOrder;
  finally
    LOrder.FreeProducts;
    LOrder.Free;
  end;
end;

procedure TFrmMain.CheckProduct;
begin
  if not (StrToIntDef(edtProductId.Text, 0) > 0) then
    raise Exception.Create('Informe o Produto');
  if not (StrToFloatDef(edtQuantity.Text, 0) > 0) then
    raise Exception.Create('Informe a Quantidade');
  if not (StrToCurrDef(edtUnitValue.Text, 0) > 0) then
    raise Exception.Create('Informe o Valor Unitário');
end;

procedure TFrmMain.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if FDMemTable1.IsEmpty then Exit;
  
  if Key = VK_DELETE then
  begin
    if MessageDlg('Apagar registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       FDMemTable1.Delete
  end
  else if Key = VK_RETURN then
  begin
    EditProduct;
  end;
end;

procedure TFrmMain.EditProduct;
begin
  DBGrid1.Enabled := False;
  FDMemTable1.Edit;
  btnAddProduto.Caption := 'Salvar';
  BindDataSetToView;
  edtProductId.SetFocus;
end;

procedure TFrmMain.edtCustomerIdExit(Sender: TObject);
begin
  FindCustomer;
end;

procedure TFrmMain.edtProductIdExit(Sender: TObject);
begin
  FindProduct;
end;

procedure TFrmMain.edtQuantityKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (CharInSet(Key, ['0'..'9', '.', #8, #9]))) or ((Key = '.') and (Pos('.', TEdit(Sender).Text)>0)) then Key := #0;
end;

procedure TFrmMain.edtUnitValueKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (CharInSet(Key, ['0'..'9', '.', #8, #9]))) or ((Key = '.') and (Pos('.', TEdit(Sender).Text)>0)) then Key := #0;
end;

procedure TFrmMain.EvaluateSubTotal;
var
  LClone: TFDMemTable;
  LSubTotal: Currency;
begin
  LSubTotal := 0;
  LClone := TFDMemTable.Create(nil);
  try
    LClone.CloneCursor(FDMemTable1);
    while not LClone.Eof do
    begin
      LSubTotal := LSubTotal + LClone.FieldByName('TOTAL').AsCurrency;
      LClone.Next;
    end;
  finally
    LClone.Free;
  end;
  edtTotal.Text := FormatCurr('0.00',LSubTotal);
end;

procedure TFrmMain.FDMemTable1AfterDelete(DataSet: TDataSet);
begin
  EvaluateSubTotal;
end;

procedure TFrmMain.FDMemTable1AfterPost(DataSet: TDataSet);
begin
  EvaluateSubTotal;
  btnAddProduto.Caption := 'Inserir';
end;

procedure TFrmMain.FDMemTable1BeforePost(DataSet: TDataSet);
begin
  FDMemTable1.FieldByName('TOTAL').AsCurrency :=
    FDMemTable1.FieldByName('QUANTITY').AsFloat * FDMemTable1.FieldByName('UNIT_VALUE').AsCurrency;
end;

procedure TFrmMain.FindCustomer;
var
  LQry: TFDQuery;
begin
  if edtCustomerId.Text = EmptyStr then Exit;

  LQry := nil;
  try
    TController.New
      .Customers
        .FindById(StrToIntDef(edtCustomerId.Text, 0), TDataSet(LQry));

    if LQry.IsEmpty then
    begin
      lblCustomer.Caption := 'Não encontrado';
      edtCustomer.Text := LQry.FieldByName('NAME').AsString;
    end
    else
    begin
      lblCustomer.Caption := EmptyStr;
      edtCustomer.Text := LQry.FieldByName('NAME').AsString;
    end;
  finally
    LQry.Free;
  end;
end;

procedure TFrmMain.FindProduct;
var
  LQry: TFDQuery;
begin
  if edtProductId.Text = EmptyStr then Exit;

  LQry := nil;
  try
    TController.New
      .Products
        .FindById(StrToIntDef(edtProductId.Text, 0), TDataSet(LQry));

    if LQry.IsEmpty then
    begin
      lblProduct.Caption := 'Não encontrado';
      edtProduct.Text := EmptyStr;
    end
    else
    begin
      lblProduct.Caption := EmptyStr;
      edtProduct.Text := LQry.FieldByName('DESCRIPTION').AsString;
      edtUnitValue.Text := LQry.FieldByName('SALE_PRICE').AsString;
    end;
  finally
    LQry.Free;
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

procedure TFrmMain.NewOrder;
begin
  OpenOrderProducts;
  edtCustomer.Text := EmptyStr;
  edtCustomerId.Text := EmptyStr;
  edtProduct.Text := EmptyStr;
  edtProductId.Text := EmptyStr;
  edtTotal.Text := EmptyStr;
  lblCustomer.Caption := EmptyStr;
  lblProduct.Caption := EmptyStr;
  edtCustomerId.SetFocus;
end;

procedure TFrmMain.NewProduct;
begin
  edtUnitValue.Text := EmptyStr;
  edtQuantity.Text := EmptyStr;
  edtProductId.Text := EmptyStr;
  edtProduct.Text := EmptyStr;
  edtProductId.SetFocus;
end;

procedure TFrmMain.OpenOrderProducts;
var
  LQuery: TFDQuery;
begin
  LQuery := nil;
  try
    FController.Items.FindByOrderId(0, TDataSet(LQuery));
    FDMemTable1.CloneCursor(LQuery);
    for var LField: TField in FDMemTable1.Fields do
    begin
      if (LField is TFloatField) or (LField is TFMTBCDField) then
      begin
        var LFieldFloat := TFloatField(LField);
        LFieldFloat.DisplayFormat := '0.00###';
        LFieldFloat.EditFormat := '0.00###';
      end;
    end;
  finally
    LQuery.Free;
  end;
end;

procedure TFrmMain.SaveProduct;
begin
  if not (FDMemTable1.State = dsEdit) then
    FDMemTable1.Insert;
  BindViewToDataSet;
  FDMemTable1.Post;
  DBGrid1.Enabled := True;
end;

end.
