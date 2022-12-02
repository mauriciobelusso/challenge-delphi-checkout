unit checkout.model.entity.orders_products;

interface

type
  TORDERS_PRODUCTS = class
    private
      FPRODUCT_ID: Integer;
      FUNIT_VALUE: Currency;
      FTOTAL: Currency;
      FID: Integer;
      FORDER_ID: Integer;
      FQUANTITY: Double;
    public
      property ID: Integer read FID write FID;
      property ORDER_ID: Integer read FORDER_ID write FORDER_ID;
      property PRODUCT_ID: Integer read FPRODUCT_ID write FPRODUCT_ID;
      property QUANTITY: Double read FQUANTITY write FQUANTITY;
      property UNIT_VALUE: Currency read FUNIT_VALUE write FUNIT_VALUE;
      property TOTAL: Currency read FTOTAL write FTOTAL;
  end;

implementation

end.
