unit checkout.model.orders;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  DataSnap.DBClient,
  checkout.model.orders.ordersinterfaces,
  checkout.model.entity.orders,
  checkout.model.orders.orderproducts,
  checkout.model.entity.orders_products;

type
  TModelOrders = class(TInterfacedObject, iModelOrders)
    private
      FModelOrdersProducts: iModelOrdersProducts;
      procedure Insert(const AOrder: TOrders);
      procedure Update(const AOrder: TOrders);
    public
      constructor Create;
      class function New: iModelOrders;

      function Find(var ADataSet: TDataSet): iModelOrders;
      function Save(const AOrder: TOrders): iModelOrders;
      function Delete(const AOrder: TOrders): iModelOrders;
  end;

implementation

uses
  ConnectionDB;

{ TModelOrders }

constructor TModelOrders.Create;
begin
  FModelOrdersProducts := TModelOrdersProducts.New;
end;

function TModelOrders.delete(const AOrder: TOrders): iModelOrders;
begin
  Result := Self;
  ConnectionDB.DmConnection.Connection.ExecSQL('DELETE FROM ORDERS WHERE ID = :ID', [AOrder.ID]);
end;

function TModelOrders.find(var ADataSet: TDataSet): iModelOrders;
begin
  Result := Self;
  ConnectionDB.DmConnection.Connection.ExecSQL('SELECT * FROM ORDERS', ADataSet);
end;

procedure TModelOrders.Insert(const AOrder: TOrders);
begin
  ConnectionDB.DmConnection.Connection.Transaction.StartTransaction;
  try
    ConnectionDB.DmConnection.Connection.ExecSQL(
      'INSERT INTO ORDERS(CUSTOMER_ID, ISSUE_DATE, TOTAL)'+
      'VALUES(:CUSTOMER_ID, :ISSUE_DATE, :TOTAL)',
      [AOrder.CUSTOMER_ID, AOrder.ISSUE_DATE, AOrder.TOTAL]
    );

    AOrder.ID := ConnectionDB.DmConnection.Connection.GetLastAutoGenValue('');

    for var LItem: TORDERS_PRODUCTS in AOrder.PRODUCTS do
    begin
      FModelOrdersProducts.Save(LItem);
    end;

    ConnectionDB.DmConnection.Connection.Transaction.Commit;
  except
    on E: Exception do
    begin
      ConnectionDB.DmConnection.Connection.Transaction.Rollback;
      raise;
    end;
  end;
end;

class function TModelOrders.New: iModelOrders;
begin
  Result := Self.Create;
end;

function TModelOrders.Save(const AOrder: TOrders): iModelOrders;
begin
  Result := Self;
  if AOrder.ID = 0 then
    Insert(AOrder)
  else
    Update(AOrder);
end;

procedure TModelOrders.Update(const AOrder: TOrders);
begin
  ConnectionDB.DmConnection.Connection.Transaction.StartTransaction;
  try
    ConnectionDB.DmConnection.Connection.ExecSQL(
      'UPDATE ORDERS SET CUSTOMER_ID = :CUSTOMER_ID, ISSUE_DATE = :ISSUE_DATE, TOTAL = :TOTAL'+
      ' WHERE ID = :ID',
      [AOrder.CUSTOMER_ID, AOrder.ISSUE_DATE, AOrder.TOTAL, AOrder.ID]
    );

    for var LItem: TORDERS_PRODUCTS in AOrder.PRODUCTS do
    begin
      FModelOrdersProducts.Save(LItem);
    end;

    ConnectionDB.DmConnection.Connection.Transaction.Commit;
  except
    on E: Exception do
    begin
      ConnectionDB.DmConnection.Connection.Transaction.Rollback;
      raise;
    end;
  end;
end;

end.
