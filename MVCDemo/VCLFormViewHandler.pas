unit VCLFormViewHandler;

interface

uses AppController, Orders;

type
  TVCLFormViewHandler = class(TInterfacedObject, IViewHandler)
    function CreateMainView(Model: TOrders; Controller: TAppController): IView;
    procedure InitGUI(mainView: IView);
    function YesNo(const AQuestion: string): Boolean;
  end;

implementation

uses Windows, Forms, VCLMainForm;

{ VCLFormViewHandler }

function TVCLFormViewHandler.CreateMainView(Model: TOrders;
  Controller: TAppController): IView;
var
  VCLMainFrm: TVCLMainFrm;
begin
  Application.CreateForm(TVCLMainFrm, VCLMainFrm);
  Result := VCLMainFrm; // TVCLMainFrm.Create(nil);
  Result.Model := Model;
  Result.Controller := Controller;
end;

procedure TVCLFormViewHandler.InitGUI(mainView: IView);
begin
  Application.Run;
end;

function TVCLFormViewHandler.YesNo(const AQuestion: string): Boolean;
begin
  Result := Application.MessageBox(PChar(AQuestion), 'Question', MB_YESNO or MB_ICONQUESTION) = IDYES;
end;

end.
