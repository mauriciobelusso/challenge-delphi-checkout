unit checkout.model.ModelInterfaces;

interface

uses
  checkout.model.orders.interfaces;

type
  iModelInterfaces = interface
  ['{1F7E52A0-4BAF-47A1-A2A5-6FE871BCDDAF}']
    function Orders: iOrdersInterfaces;
  end;

implementation

end.
