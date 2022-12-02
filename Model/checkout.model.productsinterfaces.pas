unit checkout.model.productsinterfaces;

interface

uses
  Data.DB;

type
  iModelProducts = interface
    ['{8AC70DCD-8479-402F-947C-7F9DC660858D}']
    function FindById(const AProductId: Integer; var ADataSet: TDataSet): iModelProducts;
  end;

implementation

end.
