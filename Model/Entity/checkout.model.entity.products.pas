unit checkout.model.entity.products;

interface

type
  TPRODUCTS = class
    private
      FID: Integer;
      FDESCRIPTION: String;
      FSALE_PRICE: Currency;
    public
      property ID: Integer read FID write FID;
      property DESCRIPTION: String read FDESCRIPTION write FDESCRIPTION;
      property SALE_PRICE: Currency read FSALE_PRICE write FSALE_PRICE;
  end;

implementation

end.
