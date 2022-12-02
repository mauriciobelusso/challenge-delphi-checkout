unit checkout.model.orders;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  checkout.model.orders.interfaces,
  checkout.model.entity.orders;

type
  TModelOrders = class(TInterfacedObject, iOrdersInterfaces)
    private
      procedure insert(const AOrder: TOrders);
      procedure update(const AOrder: TOrders);
    public
      constructor Create;
      class function New: iOrdersInterfaces;

      function find(const ADataSet: TDataSet): iOrdersInterfaces;
      function save(const AOrder: TOrders): iOrdersInterfaces;
      function delete(const AOrder: TOrders): iOrdersInterfaces;
  end;

implementation

uses
  ConnectionDB;

{ TModelOrders }

constructor TModelOrders.Create;
begin

end;

function TModelOrders.delete(const AOrder: TOrders): iOrdersInterfaces;
begin
  Result := Self;
end;

function TModelOrders.find(const ADataSet: TDataSet): iOrdersInterfaces;
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

class function TModelOrders.New: iOrdersInterfaces;
begin
  Result := Self.Create;
end;

function TModelOrders.save(const AOrder: TOrders): iOrdersInterfaces;
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
