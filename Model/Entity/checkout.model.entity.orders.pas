unit checkout.model.entity.orders;

interface

uses
  System.Generics.Collections,
  checkout.model.entity.orders_products;

type
  TORDERS = class
    private
      FID: Integer;
      FCUSTOMER_ID: Integer;
      FISSUE_DATE: TDateTime;
      FTOTAL: Currency;
      FPRODUCTS: TList<TORDERS_PRODUCTS>;
      function GetProducts: TList<TORDERS_PRODUCTS>;
    procedure SetID(const Value: Integer);
    public
      constructor Create;
      destructor Destroy; override;

      procedure AddProduct(const AProduct: TORDERS_PRODUCTS);
      function RemoveProduct(const AProduct: TORDERS_PRODUCTS): Boolean;

      property ID: Integer read FID write SetID;
      property CUSTOMER_ID: Integer read FCUSTOMER_ID write FCUSTOMER_ID;
      property ISSUE_DATE: TDateTime read FISSUE_DATE write FISSUE_DATE;
      property TOTAL: Currency read FTOTAL write FTOTAL;
      property PRODUCTS: TList<TORDERS_PRODUCTS> read GetProducts;
  end;

implementation

{ TORDERS }

procedure TORDERS.AddProduct(const AProduct: TORDERS_PRODUCTS);
begin
  FPRODUCTS.Add(AProduct);
end;

constructor TORDERS.Create;
begin
  FPRODUCTS := TList<TORDERS_PRODUCTS>.Create;
end;

destructor TORDERS.Destroy;
begin
  FPRODUCTS.Free;
  inherited;
end;

function TORDERS.GetProducts: TList<TORDERS_PRODUCTS>;
begin
  //Devolve uma nova lista para manter a integridade da retornada pelo BD
  Result := TList<TORDERS_PRODUCTS>.Create(FPRODUCTS);
end;

function TORDERS.RemoveProduct(const AProduct: TORDERS_PRODUCTS): Boolean;
var
  LRemoved: Boolean;
begin
  LRemoved := False;
  for var LProduct: TORDERS_PRODUCTS in FProducts do
  begin
    if LProduct.ID = AProduct.ID then
    begin
      FPRODUCTS.Remove(AProduct);
      LRemoved := True;
      Break;
    end;
  end;
  Result := LRemoved;
end;

procedure TORDERS.SetID(const Value: Integer);
begin
  if FID = 0 then
  begin
    FID := Value;
    for var LProduct: TORDERS_PRODUCTS in FProducts do
    begin
      LProduct.ORDER_ID := Value;
    end;
  end;
end;

end.
