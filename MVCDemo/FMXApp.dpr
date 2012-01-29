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

  // dva øádky níže standardnì vygenerované IDE zakomentovány a nahrazeny
  // vytvoøením Mopdelu, Controlleru atd.
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
