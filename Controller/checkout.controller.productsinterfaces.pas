unit checkout.controller.productsinterfaces;

interface

uses
  Data.DB;

type
  iControllerProducts = interface
    ['{205C07D4-A72C-4DD7-B14D-0B947D23BFD2}']
    function FindById(const AProductId: Integer; var ADataSet: TDataSet): iControllerProducts;
  end;

implementation

end.
