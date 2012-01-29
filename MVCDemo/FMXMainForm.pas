unit FMXMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, AppController, Orders,
  FMX.Layouts, FMX.TreeView, FMX.Grid;

type
  TFMXMainFrm = class(TForm, IView)
    ButtonAdd: TButton;
    ButtonDelete: TButton;
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
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

{$R *.fmx}

uses Order, System.Generics.Collections;

{ TForm2 }

procedure TFMXMainFrm.ButtonDeleteClick(Sender: TObject);
begin
  FController.DeleteOrder(nil); // ToDo
end;

function TFMXMainFrm.GetController: TAppController;
begin
  Result := FController;
end;

procedure TFMXMainFrm.SetController(const Value: TAppController);
begin
  FController := Value;
end;

function TFMXMainFrm.GetModel: TOrders;
begin
  Result := FModel;
end;

procedure TFMXMainFrm.SetModel(const Value: TOrders);
begin
  FModel := Value;
end;

procedure TFMXMainFrm.RefreshView;
var
  LOrders: TList<TOrder>;
  LOrder: TOrder;
  I: Integer;
  // C: TColumn;
begin
  LOrders := Model.GetAllOrders();
  StringGrid1.RowCount := LOrders.Count;

  // C := TCheckColumn.Create(StringGrid1);
  // C.Name := 'x';
  // C.Width := 100;
  I := 0;
  for LOrder in LOrders do
  begin
    StringGrid1.Cells[0, I] := LOrder.Text;
    StringGrid1.Cells[1, I] := FloatToStr(LOrder.FullPrice);
    StringGrid1.Cells[2, I] := FloatToStr(LOrder.DiscountedPrice);
    Inc(I);
  end;
end;

end.
