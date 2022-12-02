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
    public
      property ID: Integer read FID write FID;
      property CUSTOMER_ID: Integer read FCUSTOMER_ID write FCUSTOMER_ID;
      property ISSUE_DATE: TDateTime read FISSUE_DATE write FISSUE_DATE;
      property TOTAL: Currency read FTOTAL write FTOTAL;
      property PRODUCTS: TList<TORDERS_PRODUCTS> read GetProducts;
  end;

implementation

{ TORDERS }

function TORDERS.GetProducts: TList<TORDERS_PRODUCTS>;
begin
  Result := TList<TORDERS_PRODUCTS>.Create(FPRODUCTS);
end;

end.
