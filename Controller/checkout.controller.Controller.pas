unit checkout.controller.Controller;

interface

uses
  checkout.controller.ControllerInterfaces;

type
  TController = class(TInterfacedObject, iControllerInterfaces)
    public
      constructor Create;
      class function New: iControllerInterfaces;
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

end.
