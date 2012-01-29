/// <summary>
/// FireMonkey application
/// </summary>
program FMXApp;

uses
  FMX.Forms,
  Orders,
  AppController,
  FMXMainForm in 'FMXMainForm.pas' {FMXMainFrm} ,
  FMXFormViewHandler in 'FMXFormViewHandler.pas';

{$R *.res}

var
  Model: TOrders;
  Controller: TAppController;

begin
{$IFDEF DEBUG}
  System.ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  Application.Initialize;

  // dva ��dky n�e standardn� vygenerovan� IDE zakomentov�ny a nahrazeny
  // vytvo�en�m Mopdelu, Controlleru atd.
  // Application.CreateForm(TForm2, Form2);
  // Application.Run;

  Model := TOrders.Create;
  try
    Controller := TAppController.Create;
    try
      Controller.StartApp(TFMXFormViewHandler.Create, Model);
    finally
      Controller.Free;
    end;
  finally
    Model.Free;
  end;

end.
