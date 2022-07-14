object _frmPesquisaVenda: T_frmPesquisaVenda
  Left = 406
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 2
  Caption = 'Pesquisa r'#225'pida atrav'#233's do n'#250'mero da venda '
  ClientHeight = 397
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001000800680500001600000028000000100000002000
    0000010008000000000000000000000000000000000000000000000000000000
    000001010100FFFFFF00EFEFEF00DFDFDF00CFCFCF00C0C0C000BFBFBF00AFAF
    AF009F9FBF00A0A0A0009F9F9F007F7FBF00808080007F7F7F006F6FAF006060
    A00040404000800000000000FF00000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000B1111111111111111111111110E000007
    0204020402040204060606060E0000070405040504050405060606060E000007
    0204020402040204020402040E0000070405040504050405040504050E000007
    0204020402040204020402040E00000704050405040504050C0904050E000007
    020402040204020C030F02040E00000704050405040504090F1004050E000007
    0606060606060204020402040E0000070A0A0A0A0A0A0708070807080E000007
    1212121212120D0D0D0D0D0D0D00000707070707070707070707070707000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    0000800100008001000080010000800100008001000080010000800100008001
    00008001000080010000800100008001000080010000FFFF0000FFFF0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cabecalho: TPanel
    Left = 0
    Top = 0
    Width = 631
    Height = 41
    Align = alTop
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Entre com o n'#250'mero da venda '
    Color = clBlue
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 41
    Width = 631
    Height = 315
    Color = clGradientActiveCaption
    TabOrder = 1
    object GroupBox9: TGroupBox
      Left = 1
      Top = -1
      Width = 630
      Height = 39
      TabOrder = 0
      object edtVenda: TEdit
        Left = 236
        Top = 11
        Width = 163
        Height = 22
        Hint = 'Entre com o n'#250'mero da venda ou clique aqui para apagar'
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnClick = edtVendaClick
        OnKeyDown = edtVendaKeyDown
      end
      object btnLimpar: TButton
        Left = 513
        Top = 10
        Width = 113
        Height = 25
        Caption = 'Limpar Pesquisa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Visible = False
        OnClick = btnLimparClick
      end
      object btnVisualizarVenda: TButton
        Left = 448
        Top = 10
        Width = 65
        Height = 25
        Caption = 'Visualizar venda'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Visible = False
        OnClick = btnVisualizarVendaClick
      end
    end
    object gridVenda: TDBGrid
      Left = 2
      Top = 40
      Width = 628
      Height = 272
      Cursor = crHandPoint
      Hint = 'Clique na venda para visualizar os detalhes'
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = gridVendaCellClick
    end
  end
  object pnl_rodape: TPanel
    Left = 0
    Top = 356
    Width = 631
    Height = 41
    Align = alBottom
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Clique aqui para Sair'
    Color = clBlue
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    OnClick = pnl_rodapeClick
  end
end
