unit checkout.model.customersinterfaces;

interface

uses
  Data.DB;

type
  iModelCustomers = interface
    ['{753A253E-9561-4CDA-9468-653D3F4A2CEB}']
    function FindById(const ACustomerId: Integer; var ADataSet: TDataSet): iModelCustomers;
  end;

implementation

end.
