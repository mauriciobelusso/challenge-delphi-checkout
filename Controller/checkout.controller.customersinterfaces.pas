unit checkout.controller.customersinterfaces;

interface

uses
  Data.DB;

type
  iControllerCustomers = interface
    ['{43F0D91E-0906-4E3A-B6A3-D9F754256EA8}']
    function FindById(const ACustomerId: Integer; var ADataSet: TDataSet): iControllerCustomers;
  end;

implementation

end.
