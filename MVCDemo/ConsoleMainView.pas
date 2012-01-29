unit ConsoleMainView;

interface

uses AppController, Orders;

type
  TConsoleMainView = class(TInterfacedObject, IView)
  strict private
    FController: TAppController;
    FModel: TOrders;
    function GetController: TAppController;
    procedure SetController(const Value: TAppController);
    function GetModel: TOrders;
    procedure SetModel(const Value: TOrders);
  public
    property Controller: TAppController read GetController write SetController;
    property Model: TOrders read GetModel write SetModel;
    procedure RefreshView;
  end;

implementation

uses Order;

{ TConsoleMainView }

function TConsoleMainView.GetController: TAppController;
begin
  Result := FController;
end;

procedure TConsoleMainView.SetController(const Value: TAppController);
begin
  FController := Value;
end;

function TConsoleMainView.GetModel: TOrders;
begin
  Result := FModel;
end;

procedure TConsoleMainView.SetModel(const Value: TOrders);
begin
  FModel := Value;
end;

procedure TConsoleMainView.RefreshView;
var
  LOrder: TOrder;
begin
  for LOrder in Model.GetAllOrders do
    System.Writeln(LOrder.Text, LOrder.FullPrice, LOrder.DiscountedPrice);
end;

end.
