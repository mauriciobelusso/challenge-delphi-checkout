unit checkout.model.entity.customers;

interface

type
  TCUSTOMERS = class
    private
      FID: Integer;
      FNAME: String;
      FCITY: String;
      FUF: String;
    public
      property ID: Integer read FID write FID;
      property NAME: String read FNAME write FNAME;
      property CITY: String read FCITY write FCITY;
      property UF: String read FUF write FUF;
  end;

implementation

end.
