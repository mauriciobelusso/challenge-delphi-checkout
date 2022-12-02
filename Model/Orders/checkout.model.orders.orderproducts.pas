unit checkout.model.orders.orderproducts;

interface

uses
  Data.DB,
  checkout.model.entity.orders_products,
  checkout.model.orders.ordersinterfaces,
  ConnectionDB,
  FireDAC.Stan.Param;

type
  TModelOrdersProducts = class(TInterfacedObject, iModelOrdersProducts)
    private
      procedure Insert(const AOrderProducts: TORDERS_PRODUCTS);
      procedure Update(const AOrderProducts: TORDERS_PRODUCTS);
    public
      constructor Create;
      class function New: iModelOrdersProducts;

      function Find(var ADataSet: TDataSet): iModelOrdersProducts;
      function Save(const AOrderProducts: TORDERS_PRODUCTS): iModelOrdersProducts;
      function Delete(const AOrderProducts: TORDERS_PRODUCTS): iModelOrdersProducts;
      function FindByOrderId(const AOrderId: Integer; var ADataSet: TDataSet): iModelOrdersProducts;
  end;

implementation

{ TControllerOrdersProducts }

constructor TModelOrdersProducts.Create;
begin

end;

function TModelOrdersProducts.Delete(
  const AOrderProducts: TORDERS_PRODUCTS): iModelOrdersProducts;
begin
  Result := Self;
  ConnectionDB.DmConnection.Connection.ExecSQL('DELETE FROM ORDERS_PRODUCTS WHERE ID = :ID', [AOrderProducts.ID]);
end;

function TModelOrdersProducts.Find(
  var ADataSet: TDataSet): iModelOrdersProducts;
begin
  Result := Self;
  ConnectionDB.DmConnection.Connection.ExecSQL('SELECT * FROM ORDERS_PRODUCTS', ADataSet);
end;

function TModelOrdersProducts.FindByOrderId(const AOrderId: Integer;
  var ADataSet: TDataSet): iModelOrdersProducts;
var
  LParams: TFDParams;
begin
  Result := Self;
  LParams := TFDParams.Create;
  try
    LParams.Add('ORDER_ID', AOrderId);
    ConnectionDB.DmConnection.Connection.ExecSQL('SELECT ORDERS_PRODUCTS.*, PRODUCTS.DESCRIPTION FROM ORDERS_PRODUCTS JOIN PRODUCTS ON PRODUCTS.ID = ORDERS_PRODUCTS.PRODUCT_ID WHERE ORDER_ID = :ORDER_ID', LParams, ADataSet);
  finally
    LParams.Free;
  end;
end;

procedure TModelOrdersProducts.Insert(const AOrderProducts: TORDERS_PRODUCTS);
begin
  ConnectionDB.DmConnection.Connection.ExecSQL(
    'INSERT INTO ORDERS_PRODUCTS(ORDER_ID, PRODUCT_ID, QUANTITY, UNIT_VALUE, TOTAL)'+
    ' VALUES (:ORDER_ID, :PRODUCT_ID, :QUANTITY, :UNIT_VALUE, :TOTAL)',
    [AOrderProducts.ORDER_ID, AOrderProducts.PRODUCT_ID, AOrderProducts.QUANTITY, AOrderProducts.UNIT_VALUE, AOrderProducts.TOTAL]);

  AOrderProducts.ID := ConnectionDB.DmConnection.Connection.GetLastAutoGenValue('');
end;

class function TModelOrdersProducts.New: iModelOrdersProducts;
begin
  Result := Self.Create;
end;

function TModelOrdersProducts.Save(
  const AOrderProducts: TORDERS_PRODUCTS): iModelOrdersProducts;
begin
  Result := Self;
  if AOrderProducts.ID > 0 then
    Update(AOrderProducts)
  else
    Insert(AOrderProducts);
end;

procedure TModelOrdersProducts.Update(const AOrderProducts: TORDERS_PRODUCTS);
begin
  ConnectionDB.DmConnection.Connection.ExecSQL(
    'UPDATE ORDERS_PRODUCTS SET ORDER_ID = :ORDER_ID, PRODUCT_ID = :PRODUCT_ID, QUANTITY = :QUANTITY, UNIT_VALUE = :UNIT_VALUE, TOTAL = :TOTAL'+
    ' WHERE ID = :ID',
    [AOrderProducts.ORDER_ID, AOrderProducts.PRODUCT_ID, AOrderProducts.QUANTITY, AOrderProducts.UNIT_VALUE, AOrderProducts.TOTAL, AOrderProducts.ID]);
end;

end.
