object _frmGerarCreditosPorPendencia: T_frmGerarCreditosPorPendencia
  Left = 607
  Top = 343
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cr'#233'ditos a cadastrados a t'#237'tulo de pend'#234'ncias'
  ClientHeight = 295
  ClientWidth = 541
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
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pan_titulo: TPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Gerando Cr'#233'ditos Pendentes'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lblHoraAtual: TLabel
      Left = 10
      Top = 13
      Width = 87
      Height = 16
      Caption = 'lblHoraAtual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataDoDia: TLabel
      Left = 426
      Top = 13
      Width = 95
      Height = 16
      Alignment = taRightJustify
      Caption = 'lblDataDoDia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl45: TLabel
      Left = 10
      Top = 36
      Width = 50
      Height = 14
      Caption = 'Logado : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblStatusLogoff: TLabel
      Left = 61
      Top = 36
      Width = 35
      Height = 14
      Caption = 'Status'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pan_botoes: TPanel
    Left = 0
    Top = 231
    Width = 541
    Height = 64
    Cursor = crArrow
    Align = alBottom
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Digite a quantidade de parcelas e tecle <Enter>'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object grCabecalho: TGroupBox
    Left = 2
    Top = 63
    Width = 534
    Height = 165
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object grDados: TGroupBox
      Left = 6
      Top = 11
      Width = 521
      Height = 73
      Caption = 'Identifica Opera'#231'ao : Venda | Or'#231'amento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lblTipoOperacao: TLabel
        Left = 12
        Top = 36
        Width = 112
        Height = 20
        Caption = 'OR'#199'AMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 305
        Top = 36
        Width = 43
        Height = 20
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object edtNumeroDocto: TStaticText
        Left = 127
        Top = 35
        Width = 150
        Height = 22
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Color = clHighlightText
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object edtValor: TEditNum
        Left = 353
        Top = 35
        Width = 150
        Height = 22
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Inteiro = 6
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '0,00'
      end
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 84
      Width = 521
      Height = 77
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label3: TLabel
        Left = 191
        Top = 17
        Width = 133
        Height = 20
        Caption = 'Qde de Parcelas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object edtQdeParcelas: TEdit
        Left = 190
        Top = 41
        Width = 133
        Height = 22
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = '1'
        OnEnter = edtQdeParcelasEnter
        OnKeyDown = edtQdeParcelasKeyDown
      end
    end
  end
end
