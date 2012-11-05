object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'BCscore'
  ClientHeight = 334
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gpnlMenu: TGridPanel
    Left = 0
    Top = 0
    Width = 419
    Height = 334
    Align = alClient
    BevelOuter = bvNone
    ColumnCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = pnlNewGame
        Row = 0
      end
      item
        Column = 1
        Control = pnlExtra
        Row = 0
      end
      item
        Column = 0
        Control = pnlOverview
        Row = 1
      end
      item
        Column = 1
        Control = pnlExit
        Row = 1
      end>
    Padding.Left = 8
    Padding.Top = 8
    Padding.Right = 8
    Padding.Bottom = 8
    ParentColor = True
    RowCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    TabOrder = 0
    object pnlNewGame: TPanel
      Left = 16
      Top = 16
      Width = 185
      Height = 143
      Align = alClient
      BevelOuter = bvNone
      Color = clAppWorkSpace
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        185
        143)
      object lblNewGameShortCut: TLabel
        Left = 5
        Top = 8
        Width = 40
        Height = 77
        Alignment = taCenter
        AutoSize = False
        Caption = '7'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -64
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object Label5: TLabel
        Left = 46
        Top = 48
        Width = 123
        Height = 98
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        Caption = 'Start een nieuwe wedstrijd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -96
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
    object pnlExtra: TPanel
      Left = 217
      Top = 16
      Width = 186
      Height = 143
      Align = alClient
      BevelOuter = bvNone
      Color = clAppWorkSpace
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        186
        143)
      object lblExtraShortCut: TLabel
        Left = 5
        Top = 8
        Width = 40
        Height = 77
        Alignment = taCenter
        AutoSize = False
        Caption = '9'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -64
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object Label1: TLabel
        Left = 46
        Top = 48
        Width = 123
        Height = 95
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        Caption = 'Inlezen eID gegevens ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -96
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
    object pnlOverview: TPanel
      Left = 16
      Top = 175
      Width = 185
      Height = 143
      Align = alClient
      BevelOuter = bvNone
      Color = clAppWorkSpace
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        185
        143)
      object lblOverviewShortCut: TLabel
        Left = 5
        Top = 8
        Width = 40
        Height = 77
        Alignment = taCenter
        AutoSize = False
        Caption = '1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -64
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object Label2: TLabel
        Left = 46
        Top = 48
        Width = 123
        Height = 95
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        Caption = 'Overzicht wedstrijden v/e speler'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -96
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
    object pnlExit: TPanel
      Left = 217
      Top = 175
      Width = 186
      Height = 143
      Align = alClient
      BevelOuter = bvNone
      Color = clAppWorkSpace
      ParentBackground = False
      TabOrder = 3
      DesignSize = (
        186
        143)
      object lblExitShortCut: TLabel
        Left = 5
        Top = 8
        Width = 40
        Height = 77
        Alignment = taCenter
        AutoSize = False
        Caption = '3'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -64
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object Label3: TLabel
        Left = 46
        Top = 48
        Width = 123
        Height = 95
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        Caption = 'Be'#235'indigen en computer afsluiten'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -96
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
  end
end
