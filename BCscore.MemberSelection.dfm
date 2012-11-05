object MemberSelectionForm: TMemberSelectionForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'MemberSelectionForm'
  ClientHeight = 458
  ClientWidth = 746
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblDescription: TLabel
    Left = 0
    Top = 0
    Width = 746
    Height = 233
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 
      'Selecteer de eerste speler en druk op ENTER om te bevestigen of ' +
      'op 0 op te annuleren.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -64
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object lvMembers: TListView
    Left = 0
    Top = 233
    Width = 746
    Height = 225
    Align = alClient
    Color = clMenu
    Columns = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -64
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.ItemData = {
      03880000000400000000000000FFFFFFFFFFFFFFFF00000000FFFFFFFF000000
      0004740065007300740000000000FFFFFFFFFFFFFFFF00000000FFFFFFFF0000
      0000046D00610072006B0000000000FFFFFFFFFFFFFFFF00000000FFFFFFFF00
      000000036F006C00690000000000FFFFFFFFFFFFFFFF00000000FFFFFFFF0000
      0000056A0065006C006C006500}
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsList
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
end
