unit checkout.model.orders;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  checkout.model.orders.ordersinterfaces,
  checkout.model.entity.orders;

type
  TModelOrders = class(TInterfacedObject, iModelOrdersInterfaces)
    private
      procedure insert(const AOrder: TOrders);
      procedure update(const AOrder: TOrders);
    public
      constructor Create;
      class function New: iModelOrdersInterfaces;

      function find(const ADataSet: TDataSet): iModelOrdersInterfaces;
      function save(const AOrder: TOrders): iModelOrdersInterfaces;
      function delete(const AOrder: TOrders): iModelOrdersInterfaces;
  end;

implementation

uses
  ConnectionDB;

{ TModelOrders }

constructor TModelOrders.Create;
begin

end;

function TModelOrders.delete(const AOrder: TOrders): iModelOrdersInterfaces;
begin
  Result := Self;
end;

function TModelOrders.find(const ADataSet: TDataSet): iModelOrdersInterfaces;
var
  LDataSet: TDataSet;
begin
  Result := Self;
  LDataSet := nil;
  ConnectionDB.DmConnection.Connection.ExecSQL('SELECT * FROM ORDERS', LDataSet);
end;

procedure TModelOrders.insert(const AOrder: TOrders);
var
  LOrderId: Integer;
begin
  ConnectionDB.DmConnection.Connection.Transaction.StartTransaction;
  try
    ConnectionDB.DmConnection.Connection.ExecSQL(
      'INSERT INTO ORDERS(CUSTOMER_ID, ISSUE_DATE, TOTAL)'+
      'VALUES(:CUSTOMER_ID, :ISSUE_DATE, :TOTAL)',
      [AOrder.CUSTOMER_ID, AOrder.ISSUE_DATE, AOrder.TOTAL]
    );

    LOrderId := ConnectionDB.DmConnection.Connection.GetLastAutoGenValue('');

//  FPRODUCTS: TList<TORDERS_PRODUCTS>;
//    ConnectionDB.DmConnection.Connection.ExecSQL(
//      'INSERT INTO ORDERS_PRODUCTS(CUSTOMER_ID, ISSUE_DATE, TOTAL)'+
//      'VALUES(:CUSTOMER_ID, :ISSUE_DATE, :TOTAL)',
//      [AOrder.CUSTOMER_ID, AOrder.ISSUE_DATE, AOrder.TOTAL]
//    );

    ConnectionDB.DmConnection.Connection.Transaction.Commit;
  except
    on E: Exception do
    begin
      ConnectionDB.DmConnection.Connection.Transaction.Rollback;
      raise;
    end;
  end;
end;

class function TModelOrders.New: iModelOrdersInterfaces;
begin
  Result := Self.Create;
end;

function TModelOrders.save(const AOrder: TOrders): iModelOrdersInterfaces;
begin
  Result := Self;
  if AOrder.ID = 0 then
    insert(AOrder)
  else
    update(AOrder);
end;

procedure TModelOrders.update(const AOrder: TOrders);
begin

end;

end.
