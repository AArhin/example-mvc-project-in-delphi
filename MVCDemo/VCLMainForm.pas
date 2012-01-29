unit VCLMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  AppController, Orders, Vcl.ComCtrls;

type
  TVCLMainFrm = class(TForm, IView)
    ButtonAdd: TButton;
    ButtonDelete: TButton;
    ListView1: TListView;
    procedure ButtonDeleteClick(Sender: TObject);
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

{$R *.dfm}

uses Order, System.Generics.Collections;

{ TVCLMainFrm }

procedure TVCLMainFrm.ButtonDeleteClick(Sender: TObject);
begin
  Controller.DeleteOrder(nil); // ToDo zde doplnit zjisteni akt objednavy v gridu
end;

function TVCLMainFrm.GetController: TAppController;
begin
  Result := FController;
end;

procedure TVCLMainFrm.SetController(const Value: TAppController);
begin
  FController := Value;
end;

function TVCLMainFrm.GetModel: TOrders;
begin
  Result := FModel;
end;

procedure TVCLMainFrm.SetModel(const Value: TOrders);
begin
  FModel := Value;
end;

procedure TVCLMainFrm.RefreshView;
var
  LOrders: TList<TOrder>;
  LOrder: TOrder;
begin
  LOrders := Model.GetAllOrders();

  with ListView1.Columns do
  begin
    Clear;
    with Add do
    begin
      Caption := 'Text';
      Width := 150;
    end;
    with Add do
    begin
      Caption := 'FullPrice';
      Width := 100;
    end;
    with Add do
    begin
      Caption := 'DiscountedPrice';
      Width := 100;
    end;
  end;

  ListView1.Items.BeginUpdate;
  try
    ListView1.Clear;

    for LOrder in LOrders do
      with ListView1.Items.Add do
      begin
        Caption := LOrder.Text;
        SubItems.Add(FloatToStr(LOrder.FullPrice));
        SubItems.Add(FloatToStr(LOrder.DiscountedPrice));
      end;
  finally
    ListView1.Items.EndUpdate;
  end;
end;

end.
