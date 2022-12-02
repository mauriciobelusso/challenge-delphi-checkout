unit checkout.model.products;

interface

uses
  Data.DB,
  checkout.model.productsinterfaces,
  FireDAC.Stan.Param,
  ConnectionDB;

type
  TModelProducts = class(TInterfacedObject, iModelProducts)
    public
      constructor Create;
      class function New: iModelProducts;

      function FindById(const AProductId: Integer; var ADataSet: TDataSet): iModelProducts;
  end;

implementation

{ TModelProducts }

constructor TModelProducts.Create;
begin

end;

function TModelProducts.FindById(const AProductId: Integer;
  var ADataSet: TDataSet): iModelProducts;
var
  LParams: TFDParams;
begin
  LParams := TFDParams.Create;
  try
    LParams.Add('ID', AProductId);
    ConnectionDB.DmConnection.Connection.ExecSQL('SELECT * FROM PRODUCTS WHERE ID = :ID', LParams, ADataSet);
  finally
    LParams.Free;
  end;
end;

class function TModelProducts.New: iModelProducts;
begin
  Result := Self.Create;
end;

end.
