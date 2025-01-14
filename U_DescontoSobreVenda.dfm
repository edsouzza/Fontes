object _frmDesconto: T_frmDesconto
  Left = 747
  Top = 332
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Escolha o Desconto'
  ClientHeight = 218
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grp_CadastrarSenha: TGroupBox
    Left = 0
    Top = 32
    Width = 341
    Height = 151
    Align = alCustom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 42
      Width = 92
      Height = 16
      Caption = 'Percentual %'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 40
      Top = 106
      Width = 64
      Height = 16
      Caption = 'Por valor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtPorPercentual: TEditNum
      Left = 147
      Top = 38
      Width = 154
      Height = 22
      Cursor = crHandPoint
      Hint = 'Valor do desconto com valor direto'
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Inteiro = 6
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = '0,00'
      OnClick = edtPorPercentualClick
    end
    object edtPorValor: TEditNum
      Left = 147
      Top = 100
      Width = 154
      Height = 22
      Cursor = crHandPoint
      Hint = 'Valor do desconto com valor direto'
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Inteiro = 6
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Text = '0,00'
      OnClick = edtPorValorClick
      OnKeyDown = edtPorValorKeyDown
    end
  end
  object pnl_cabecalho: TPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 40
    Align = alTop
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Desconto'
    Color = clBlue
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
  end
  object pnl_rodape: TPanel
    Left = 0
    Top = 178
    Width = 341
    Height = 40
    Cursor = crArrow
    Align = alBottom
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clBlue
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    object btnAplicarDesconto: TSpeedButton
      Left = 120
      Top = 5
      Width = 115
      Height = 28
      Cursor = crHandPoint
      Caption = 'Ok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btnAplicarDescontoClick
    end
  end
end
