unit checkout.model.orders;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  DataSnap.DBClient,
  System.Generics.Collections,
  checkout.model.orders.ordersinterfaces,
  checkout.model.entity.orders,
  checkout.model.orders.orderproducts,
  checkout.model.entity.orders_products, FireDAC.Stan.Param;

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
      function FindById(const AOrder: TORDERS): iModelOrders;
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

function TModelOrders.Delete(const AOrder: TOrders): iModelOrders;
begin
  Result := Self;
  ConnectionDB.DmConnection.Connection.ExecSQL('DELETE FROM ORDERS WHERE ID = :ID', [AOrder.ID]);
end;

function TModelOrders.Find(var ADataSet: TDataSet): iModelOrders;
begin
  Result := Self;
  ConnectionDB.DmConnection.Connection.ExecSQL('SELECT * FROM ORDERS', ADataSet);
end;

function TModelOrders.FindById(const AOrder: TORDERS): iModelOrders;
var
  LParams: TFDParams;
  LDataSet: TDataSet;
begin
  Result := Self;
  LDataSet := nil;
  LParams := nil;
  try
    LParams := TFDParams.Create;
    LParams.Add('ID', AOrder.ID);
    ConnectionDB.DmConnection.Connection.ExecSQL('SELECT * FROM ORDERS WHERE ID = :ID', LParams, LDataSet);
    AOrder.CUSTOMER_ID := LDataSet.FieldByName('CUSTOMER_ID').AsInteger;
    AOrder.ISSUE_DATE := LDataSet.FieldByName('ISSUE_DATE').AsDateTime;
    AOrder.TOTAL := LDataSet.FieldByName('TOTAL').AsCurrency;
  finally
    LParams.Free;
  end;
end;

procedure TModelOrders.Insert(const AOrder: TOrders);
var
  LProducts: TList<TORDERS_PRODUCTS>;
begin
  LProducts := nil;
  ConnectionDB.DmConnection.Connection.Transaction.StartTransaction;
  try
    try
      ConnectionDB.DmConnection.Connection.ExecSQL(
        'INSERT INTO ORDERS(CUSTOMER_ID, ISSUE_DATE, TOTAL)'+
        'VALUES(:CUSTOMER_ID, :ISSUE_DATE, :TOTAL)',
        [AOrder.CUSTOMER_ID, AOrder.ISSUE_DATE, AOrder.TOTAL]
      );

      AOrder.ID := ConnectionDB.DmConnection.Connection.GetLastAutoGenValue('');

      LProducts := AOrder.PRODUCTS;

      for var LItem: TORDERS_PRODUCTS in LProducts do
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
  finally
    LProducts.Free;
  end;
end;

class function TModelOrders.New: iModelOrders;
begin
  Result := Self.Create;
end;

function TModelOrders.Save(const AOrder: TOrders): iModelOrders;
begin
  Result := Self;
  if AOrder.ID > 0 then
    Update(AOrder)
  else
    Insert(AOrder);
end;

procedure TModelOrders.Update(const AOrder: TOrders);
var
  LProducts: TList<TORDERS_PRODUCTS>;
begin
  LProducts := nil;
  ConnectionDB.DmConnection.Connection.Transaction.StartTransaction;
  try
    try
      ConnectionDB.DmConnection.Connection.ExecSQL(
        'UPDATE ORDERS SET CUSTOMER_ID = :CUSTOMER_ID, ISSUE_DATE = :ISSUE_DATE, TOTAL = :TOTAL'+
        ' WHERE ID = :ID',
        [AOrder.CUSTOMER_ID, AOrder.ISSUE_DATE, AOrder.TOTAL, AOrder.ID]
      );

      LProducts := AOrder.PRODUCTS;

      for var LItem: TORDERS_PRODUCTS in LProducts do
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
  finally
    LProducts.Free;
  end;
end;

end.
