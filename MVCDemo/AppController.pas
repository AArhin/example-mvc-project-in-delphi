unit AppController;

interface

uses Orders, Order;

type
  TAppController = class;

  IView = interface
    function GetController: TAppController;
    procedure SetController(const Value: TAppController);
    property Controller: TAppController read GetController write SetController;

    function GetModel: TOrders;
    procedure SetModel(const Value: TOrders);
    property Model: TOrders read GetModel write SetModel;

    procedure RefreshView;
  end;

  IViewHandler = interface
    function CreateMainView(Model: TOrders; Controller: TAppController): IView;
    procedure InitGUI(mainView: IView);
    function YesNo(const AQuestion: string): Boolean;
    { IView CreateOrderView(Orders model, AppController appController);
      void ShowDialog(IView view);
      void CloseView(IView addOrderView);
      IView CreateTimeView(Orders model, AppController appController); }
  end;

  TAppController = class
  strict private
    FModel: TOrders;
    FViewHandler: IViewHandler;
    FMainView: IView;
  public
    procedure StartApp(viewHandler: IViewHandler; Model: TOrders);
    procedure AddOrder(Order: TOrder);
    procedure DeleteOrder(Order: TOrder);
  end;

implementation

{ TAppController }

procedure TAppController.StartApp(viewHandler: IViewHandler; Model: TOrders);
begin
  Self.FModel := Model;
  Self.FViewHandler := viewHandler;
  FMainView := viewHandler.CreateMainView(Model, Self);
  FMainView.RefreshView;
  // timeView = viewHandler.CreateTimeView(model, this);
  viewHandler.InitGUI(FMainView);
end;

procedure TAppController.AddOrder(Order: TOrder);
begin
  Assert(False, 'TAppController.AddOrder() not yet implemented!');
end;

procedure TAppController.DeleteOrder(Order: TOrder);
begin
  if FViewHandler.YesNo('Really delete?') then
    FModel.DeleteOrder(Order);
  FMainView.RefreshView;
end;

end.
