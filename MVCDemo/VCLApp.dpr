program VCLApp;

uses
  Vcl.Forms,
  VCLMainForm in 'VCLMainForm.pas' {VCLMainFrm} ,
  Orders,
  AppController,
  VCLFormViewHandler in 'VCLFormViewHandler.pas';

{$R *.res}

var
  Model: TOrders;
  Controller: TAppController;

begin
{$IFDEF DEBUG}
  System.ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  // dva øádky níže standardnì vygenerované IDE zakomentovány a nahrazeny
  // vytvoøením Mopdelu, Controlleru atd.
  // Application.CreateForm(TVCLMainFrm, VCLMainFrm);
  // Application.Run;

  Model := TOrders.Create;
  try
    Controller := TAppController.Create;
    try
      Controller.StartApp(TVCLFormViewHandler.Create, Model);
    finally
      Controller.Free;
    end;
  finally
    Model.Free;
  end;

end.
