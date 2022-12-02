unit checkout.controller.products;

interface

uses
  Data.DB,
  checkout.controller.productsinterfaces,
  checkout.model.model;

type
  TControllerProducts = class(TInterfacedObject, iControllerProducts)
    public
      constructor Create;
      class function New: iControllerProducts;

      function FindById(const AProductId: Integer; var ADataSet: TDataSet): iControllerProducts;
  end;

implementation

{ TControllerProducts }

constructor TControllerProducts.Create;
begin

end;

function TControllerProducts.FindById(const AProductId: Integer;
  var ADataSet: TDataSet): iControllerProducts;
begin
  Result := Self;
  TModel.New.Products.FindById(AProductId, ADataSet);
end;

class function TControllerProducts.New: iControllerProducts;
begin
  Result := Self.Create;
end;

end.
