unit ConsoleViewHandler;

interface

uses AppController, Orders;

type
  TConsoleViewHandler = class(TInterfacedObject, IViewHandler)
    function CreateMainView(Model: TOrders; Controller: TAppController): IView;
    procedure InitGUI(mainView: IView);
    function YesNo(const AQuestion: string): Boolean;
  end;

implementation

uses SysUtils, ConsoleMainView;

{ TConsoleViewHandler }

function TConsoleViewHandler.CreateMainView(Model: TOrders;
  Controller: TAppController): IView;
begin
  Result := TConsoleMainView.Create;
  Result.Model := Model;
  Result.Controller := Controller;
end;

procedure TConsoleViewHandler.InitGUI(mainView: IView);
var
  S: string;
begin
  while True do
  begin
    System.Write('[A]dd order, [D]elete order, [R]efresh browse, [E]xit: ');
    System.Readln(S);
    if SameText(S, 'a') then
       mainView.Controller.AddOrder(nil) // ToDo
    else if SameText(S, 'd') then
      mainView.Controller.DeleteOrder(nil) // ToDo
    else if SameText(S, 'r') then
      mainView.RefreshView
    else if (S = '') or SameText(S, 'e') then
      Exit;
  end;
end;

function TConsoleViewHandler.YesNo(const AQuestion: string): Boolean;
var
  S: string;
begin
  System.Write(AQuestion, ' [Y|n]:');
  System.Readln(S);
  Result := SameText(S, 'y');
end;

end.
