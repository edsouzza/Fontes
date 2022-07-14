object _frmBalancete: T_frmBalancete
  Left = 475
  Top = 273
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Balancete Financeiro'
  ClientHeight = 532
  ClientWidth = 951
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001000800680500001600000028000000100000002000
    0000010008000000000000000000000000000000000000000000000000000000
    000001010100FF0000000000FF00B4B4FF005959FF002121FF00FFFFFF008E8E
    FF00DDDDFF003B3BFF001010FF009999FF006666FF00E6E6FF00CCCCFF003333
    FF000808FF007F7FFF00A6A6FF00F7F7FF004B4BFF006666FF002929FF00BFBF
    FF001717FF007373FF00ABABFF004040FF000000000000000000000000000000
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
    0000000000000000000000000000000303030814090603030303030303000003
    0303100F070F10100B03030303000003031A0707070707071810030303000003
    0A07070F0808040707090603030000030C07071A0303110707070D0303000003
    171C1C11190518070709170303000003030303130E1407071405030303000003
    0311130707070908060B11110300000303050707090D030310041B1A03000003
    031507071803030B0C0707120300000303191307070C081807070F1103000003
    0303110D0F070707071306030300000303030303191015070708030303000003
    030303030303031207141A03030000000000000000000000000000000000FFFF
    0000800100008001000080010000800100008001000080010000800100008001
    0000800100008001000080010000800100008001000080010000FFFF0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_titulo: TPanel
    Left = 0
    Top = 0
    Width = 951
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Balancete Financeiro'
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lblDataDoDia: TLabel
      Left = 840
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
    object lblStatusLogoff: TLabel
      Left = 181
      Top = 28
      Width = 35
      Height = 14
      Caption = 'Status'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
  end
  object pnlReceitas: TPanel
    Left = 0
    Top = 65
    Width = 475
    Height = 402
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object grp1: TGroupBox
      Left = 8
      Top = 8
      Width = 456
      Height = 385
      Caption = 'RECEITAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object grp3: TGroupBox
        Left = 7
        Top = 24
        Width = 220
        Height = 300
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object lbl1: TLabel
          Left = 9
          Top = 32
          Width = 200
          Height = 20
          Caption = 'Or'#231'amentos  executados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 9
          Top = 62
          Width = 202
          Height = 20
          Caption = 'Cr'#233'ditos  por Pend'#234'ncias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 94
          Width = 142
          Height = 20
          Caption = 'Cr'#233'ditos Diversos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object grp4: TGroupBox
        Left = 228
        Top = 24
        Width = 220
        Height = 300
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object edt_Orcamentos: TCurrencyEdit
          Left = 21
          Top = 28
          Width = 177
          Height = 21
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          ZeroEmpty = False
        end
        object edt_Creditos: TCurrencyEdit
          Left = 21
          Top = 59
          Width = 177
          Height = 21
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          ZeroEmpty = False
        end
        object edt_CreditosDiversos: TCurrencyEdit
          Left = 21
          Top = 91
          Width = 177
          Height = 21
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          ZeroEmpty = False
        end
      end
      object grp5: TGroupBox
        Left = 7
        Top = 323
        Width = 443
        Height = 57
        Caption = 'Total de Receitas..:'
        TabOrder = 2
        object edt_TotalReceitas: TCurrencyEdit
          Left = 141
          Top = 25
          Width = 177
          Height = 23
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  object pnlDespesas: TPanel
    Left = 475
    Top = 65
    Width = 477
    Height = 402
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object grp2: TGroupBox
      Left = 8
      Top = 8
      Width = 456
      Height = 385
      Caption = 'DESPESAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object grp6: TGroupBox
        Left = 7
        Top = 24
        Width = 220
        Height = 300
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object lbl5: TLabel
          Left = 6
          Top = 32
          Width = 183
          Height = 20
          Caption = 'Pagamento de Boletos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 6
          Top = 65
          Width = 153
          Height = 20
          Caption = 'Retiradas do Caixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 6
          Top = 95
          Width = 55
          Height = 20
          Caption = 'Trocos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object grp7: TGroupBox
        Left = 229
        Top = 24
        Width = 220
        Height = 300
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object edt_PagtoBoletos: TCurrencyEdit
          Left = 21
          Top = 28
          Width = 177
          Height = 21
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          ZeroEmpty = False
        end
        object edt_RetiradasCaixa: TCurrencyEdit
          Left = 21
          Top = 61
          Width = 177
          Height = 21
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          ZeroEmpty = False
        end
        object edt_Trocos: TCurrencyEdit
          Left = 21
          Top = 93
          Width = 177
          Height = 21
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          ZeroEmpty = False
        end
      end
      object grp8: TGroupBox
        Left = 7
        Top = 323
        Width = 443
        Height = 57
        Caption = 'Total de Despesas..:'
        TabOrder = 2
        object edt_TotalDespesas: TCurrencyEdit
          Left = 141
          Top = 25
          Width = 177
          Height = 23
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  object pnl_botoes: TPanel
    Left = 0
    Top = 467
    Width = 951
    Height = 65
    Align = alBottom
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clMaroon
    TabOrder = 3
    object pnl_Periodo: TPanel
      Left = 6
      Top = 6
      Width = 935
      Height = 49
      Align = alClient
      Color = clMaroon
      TabOrder = 0
      object grp9: TGroupBox
        Left = 720
        Top = 2
        Width = 211
        Height = 42
        Caption = 'Saldo ..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object edt_ValorBalancoFinal: TCurrencyEdit
          Left = 32
          Top = 13
          Width = 149
          Height = 22
          AutoSize = False
          Color = clInfoBk
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object grp10: TGroupBox
        Left = 3
        Top = 2
        Width = 418
        Height = 42
        Caption = 'Definir Per'#237'odo..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lbl41: TLabel
          Left = 15
          Top = 20
          Width = 68
          Height = 16
          Caption = 'Data In'#237'cio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl42: TLabel
          Left = 234
          Top = 20
          Width = 57
          Height = 16
          Caption = 'Data Fim'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_DataInicio: TDateEdit
          Left = 91
          Top = 15
          Width = 106
          Height = 20
          Cursor = crHandPoint
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnButtonClick = edt_DataInicioButtonClick
          OnChange = edt_DataInicioChange
          OnClick = edt_DataInicioClick
        end
        object edt_DataFim: TDateEdit
          Left = 297
          Top = 15
          Width = 106
          Height = 20
          Cursor = crHandPoint
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnButtonClick = edt_DataFimButtonClick
          OnChange = edt_DataFimChange
          OnClick = edt_DataFimClick
        end
      end
      object grp11: TGroupBox
        Left = 423
        Top = 2
        Width = 295
        Height = 42
        Caption = 'A'#231#227'o..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object rb_Filtrar: TRadioButton
          Left = 52
          Top = 17
          Width = 93
          Height = 17
          Cursor = crHandPoint
          Caption = 'Mostrar'
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnClick = rb_FiltrarClick
        end
        object rb_Sair: TRadioButton
          Left = 197
          Top = 17
          Width = 64
          Height = 17
          Cursor = crHandPoint
          Caption = 'Sair'
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnClick = rb_SairClick
        end
      end
    end
  end
end
