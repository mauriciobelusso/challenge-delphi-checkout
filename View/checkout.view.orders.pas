unit checkout.view.orders;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, checkout.model.entity.orders;

type
  TFrmOrders = class(TForm)
    DBGrid1: TDBGrid;
    dsPedidos: TDataSource;
    FDMemTable1: TFDMemTable;
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Order: TORDERS;
  end;

var
  FrmOrders: TFrmOrders;

implementation

{$R *.dfm}

procedure TFrmOrders.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Order.ID := FDMemTable1.FieldByName('ID').AsInteger;
    Order.Issue_Date := FDMemTable1.FieldByName('ISSUE_DATE').AsDateTime;
    Order.CUSTOMER_ID := FDMemTable1.FieldByName('CUSTOMER_ID').AsInteger;
    Close;
  end;
end;

procedure TFrmOrders.FormCreate(Sender: TObject);
begin
  Order := TORDERS.Create;
end;

procedure TFrmOrders.FormDestroy(Sender: TObject);
begin
  Order.Free;
end;

end.
