unit FMXFormViewHandler;

interface

uses AppController, Orders;

type
  TFMXFormViewHandler = class(TInterfacedObject, IViewHandler)
  public
    function CreateMainView(Model: TOrders; Controller: TAppController): IView;
    procedure InitGUI(mainView: IView);
    function YesNo(const AQuestion: string): Boolean;
  end;

implementation

uses Fmx.Forms, FMXMainForm, Fmx.Dialogs, System.UITypes;

{ FMXFormViewHandler }

function TFMXFormViewHandler.CreateMainView(Model: TOrders;
  Controller: TAppController): IView;
begin
  // Application.CreateForm(TFMXMainFrm, FMXMainFrm);  <-ve FireMonkey takto nefachá
  Application.MainForm := TFMXMainFrm.Create(Application);
  Application.MainForm.Visible := True;
  Result := Application.MainForm as TFMXMainFrm;
  Result.Model := Model;
  Result.Controller := Controller;
end;

procedure TFMXFormViewHandler.InitGUI(mainView: IView);
begin
  Application.Run;
end;

function TFMXFormViewHandler.YesNo(const AQuestion: string): Boolean;
begin
  Result := MessageDlg(AQuestion, TMsgDlgType.mtConfirmation, mbYesNo,
    0) = idYes;
end;

end.
