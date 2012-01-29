object VCLMainFrm: TVCLMainFrm
  Left = 0
  Top = 0
  Caption = 'VCLMainFrm'
  ClientHeight = 202
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    447
    202)
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonAdd: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Add'
    TabOrder = 0
  end
  object ButtonDelete: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Delete'
    TabOrder = 1
    OnClick = ButtonDeleteClick
  end
  object ListView1: TListView
    Left = 8
    Top = 44
    Width = 431
    Height = 150
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'Text'
        Width = 150
      end
      item
        Caption = 'FullPrice'
        Width = 100
      end
      item
        Caption = 'DiscountedPrice'
        Width = 100
      end>
    Items.ItemData = {
      05620000000200000000000000FFFFFFFFFFFFFFFF00000000FFFFFFFF000000
      000A610061006100610061006100610061006100610000000000FFFFFFFFFFFF
      FFFF00000000FFFFFFFF000000000D6200620062006200620062006200620062
      006200620062006200}
    RowSelect = True
    TabOrder = 2
    ViewStyle = vsReport
  end
end
