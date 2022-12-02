unit checkout.controller.controller;

interface

uses
  checkout.controller.ControllerInterfaces,
  checkout.controller.orders.ordersinterfaces,
  checkout.controller.orders.orders;

type
  TController = class(TInterfacedObject, iControllerInterfaces)
    public
      constructor Create;
      class function New: iControllerInterfaces;
      function Orders: iControllerOrdersInterfaces;
  end;

implementation

{ TController }

constructor TController.Create;
begin

end;

class function TController.New: iControllerInterfaces;
begin
  Result := Self.Create;
end;

function TController.Orders: iControllerOrdersInterfaces;
begin
  Result := TControllerOrders.New;
end;

end.
