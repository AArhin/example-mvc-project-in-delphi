unit Orders;

interface

uses System.Generics.Collections, Order;

type
  TOrders = class
  private
    FList: TList<TOrder>;
  public
    constructor Create;
    destructor Destroy; override;
    function GetAllOrders: TList<TOrder>;
    procedure AddOrder(AOrder: TOrder);
    procedure DeleteOrder(const AOrder: TOrder);
  end;

implementation

uses System.SysUtils;

{ TOrders }

constructor TOrders.Create;
var
  O: TOrder;
begin
  inherited;
  FList := TList<TOrder>.Create;

  O := TOrder.Create;
  O.Text := 'Order No. 1';
  O.FullPrice := Random;
  O.DiscountedPrice := Random;
  AddOrder(O);

  O := TOrder.Create;
  O.Text := 'Order No. 2';
  O.FullPrice := Random;
  O.DiscountedPrice := Random;
  AddOrder(O);
end;

destructor TOrders.Destroy;
var
  O: TOrder;
begin
  for O in FList do
    O.Free;
  FreeAndNil(FList);
  inherited;
end;

function TOrders.GetAllOrders: TList<TOrder>;
begin
  Result := FList;
end;

procedure TOrders.AddOrder(AOrder: TOrder);
begin
  FList.Add(AOrder);
end;

procedure TOrders.DeleteOrder(const AOrder: TOrder);
begin
  FList.Remove(AOrder);
end;

end.
