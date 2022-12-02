unit checkout.model.entity.orders;

interface

type
  TORDERS = class
    private
      FID: Integer;
      FCUSTOMER_ID: Integer;
      FISSUE_DATE: TDateTime;
      FTOTAL: Currency;
    public
      property ID: Integer read FID write FID;
      property CUSTOMER_ID: Integer read FCUSTOMER_ID write FCUSTOMER_ID;
      property ISSUE_DATE: TDateTime read FISSUE_DATE write FISSUE_DATE;
      property TOTAL: Currency read FTOTAL write FTOTAL;
  end;

implementation

end.
