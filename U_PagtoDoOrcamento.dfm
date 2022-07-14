object _frmPagarOrcamento: T_frmPagarOrcamento
  Left = 448
  Top = 160
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 2
  Caption = 'Pagando Or'#231'amento'
  ClientHeight = 691
  ClientWidth = 1211
  Color = clMoneyGreen
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
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTipoImpressora: TLabel
    Left = 1179
    Top = 673
    Width = 27
    Height = 16
    Alignment = taRightJustify
    Caption = 'prn'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 261
    Top = 40
    Width = 705
    Height = 616
    BevelInner = bvRaised
    BevelWidth = 2
    Color = clMaroon
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 4
      Top = 553
      Width = 697
      Height = 59
      Align = alBottom
      Color = clMaroon
      ParentColor = False
      TabOrder = 0
      object btnPagarOrcamento: TSpeedButton
        Left = 370
        Top = 15
        Width = 205
        Height = 36
        Cursor = crHandPoint
        Caption = 'Pagar'
        Enabled = False
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B0000000100001B000000FF0000000000
          FF00B4B4FF005959FF002121FF00FFFFFF008E8EFF00DDDDFF003B3BFF001010
          FF009999FF006666FF00E6E6FF00CCCCFF003333FF000808FF007F7FFF00A6A6
          FF00F7F7FF004B4BFF006666FF002929FF00BFBFFF001717FF007373FF00ABAB
          FF004040FF000000000000000000000000000000000000000000000000000000
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
          0000000000000000000000010101061207040101010101010100000101010E0D
          050D0E0E09010101010000010118050505050505160E0101010000010805050D
          0606020505070401010000010A05051801010F0505050B0101000001151A1A0F
          170316050507150101000001010101110C1205051203010101000001010F1105
          0505070604090F0F0100000101030505070B01010E0219180100000101130505
          160101090A0505100100000101171105050A061605050D0F0100000101010F0B
          0D050505051104010100000101010101170E1305050601010100000101010101
          0101011005121801010000000000000000000000000000000000}
        OnClick = btnPagarOrcamentoClick
      end
      object btnCancelarPagtoCotacao: TSpeedButton
        Left = 125
        Top = 15
        Width = 205
        Height = 36
        Cursor = crHandPoint
        Caption = 'Sair'
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B00000001000008000000000000006699
          CC0066CCCC007F7F7F00FFFFFF000000FF0000FFFF00BFBFBF00000000000000
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
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000030500000003
          0503050305030503050307000001000703070307030703070305000001010006
          0404000000000000000000010101000404060005050505050505000101010004
          0404000505050505050500010001000604040005000005050505000100000004
          0406000002000505050500010001000404040002020000000000000101010006
          0400020202020202020000010101000400020202020202020200000101010004
          0400020202020202020000010100000404060002020000000000000100000406
          0404000002000505050500000000040404040005000005050505000004040604
          0406000505050505050500000000000000000005050505050505}
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_CancelarPagtoClick
      end
      object DBMemoHistorico: TDBMemo
        Left = 601
        Top = 15
        Width = 88
        Height = 35
        Hint = 'Ao terminar de digitar o texto n'#227'o deixe espa'#231'os no final'
        Color = clInfoBk
        DataField = 'CLI_HISTORICO'
        DataSource = dm_Conexao.ds_DadosClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = False
      end
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 5
      Width = 691
      Height = 53
      Color = clMaroon
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object txtNomeCliente: TStaticText
        Left = 125
        Top = 19
        Width = 449
        Height = 22
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Color = clBtnHighlight
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
    end
    object pan_cabecalho: TPanel
      Left = 7
      Top = 65
      Width = 690
      Height = 113
      Color = clMaroon
      TabOrder = 2
      object Label21: TLabel
        Left = 125
        Top = 16
        Width = 92
        Height = 19
        Caption = 'SUB-TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 125
        Top = 56
        Width = 100
        Height = 19
        Caption = 'DESC. <F10>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 125
        Top = 90
        Width = 116
        Height = 19
        Caption = 'TOTAL CUPOM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_ValorDebito: TEditNum
        Left = 251
        Top = 8
        Width = 318
        Height = 27
        Hint = 'Subtotal (Total dos Itens da Compra)'
        Color = 14680063
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Inteiro = 6
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '0,00'
      end
      object edt_ValorDesconto: TEditNum
        Left = 251
        Top = 43
        Width = 318
        Height = 27
        Hint = 'Valor do desconto '
        Color = 14680063
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Inteiro = 6
        ParentFont = False
        TabOrder = 1
        Text = '0,00'
        OnClick = edt_ValorDescontoClick
      end
      object edtTotalpagar: TEditNum
        Left = 251
        Top = 78
        Width = 318
        Height = 27
        Hint = 'Valor a ser pago pelo cliente j'#225' com desconto se tiver'
        Color = 14680063
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Inteiro = 6
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = '0,00'
      end
    end
    object pan_finalizar: TPanel
      Left = 7
      Top = 442
      Width = 690
      Height = 113
      Color = clMaroon
      TabOrder = 3
      object Label1: TLabel
        Left = 125
        Top = 16
        Width = 116
        Height = 19
        Caption = 'TOTAL CUPOM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 125
        Top = 53
        Width = 86
        Height = 19
        Caption = 'RECEBIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 125
        Top = 88
        Width = 102
        Height = 19
        Caption = 'TROCO           '
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtTotalCupom: TEditNum
        Left = 251
        Top = 6
        Width = 318
        Height = 27
        Hint = 'Valor a ser pago pelo cliente j'#225' com desconto se tiver'
        Color = 14680063
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Inteiro = 6
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '0,00'
      end
      object edtValorRecebido: TEditNum
        Left = 251
        Top = 42
        Width = 318
        Height = 27
        Hint = 'Insira o valor em dinheiro recebido do cliente'
        Color = 14680063
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Inteiro = 6
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '0,00'
        OnEnter = edtValorRecebidoEnter
      end
      object edtTroco: TEditNum
        Left = 251
        Top = 78
        Width = 318
        Height = 27
        Hint = 'Troco do cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Inteiro = 6
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = '0,00'
        OnClick = edtTrocoClick
        OnEnter = edtTrocoEnter
      end
    end
    object pan_pagamentos: TPanel
      Left = 7
      Top = 185
      Width = 690
      Height = 251
      Color = clMaroon
      TabOrder = 4
      object LabelPgto1: TLabel
        Left = 125
        Top = 24
        Width = 105
        Height = 19
        Caption = '1 - DINHEIRO '
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelPgto3: TLabel
        Left = 125
        Top = 73
        Width = 95
        Height = 19
        Caption = '2 - CR'#201'DITO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelPgto2: TLabel
        Left = 125
        Top = 122
        Width = 83
        Height = 19
        Caption = '3 - D'#201'BITO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelPgto4: TLabel
        Left = 125
        Top = 170
        Width = 118
        Height = 19
        Caption = '4 - PEND'#202'NCIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelPgto5: TLabel
        Left = 125
        Top = 219
        Width = 117
        Height = 19
        Caption = '5 - DIFEREN'#199'A'
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object valorDINHEIRO: TEditNum
        Left = 251
        Top = 12
        Width = 318
        Height = 27
        Cursor = crHandPoint
        Hint = 'Insira o valor em dinheiro recebido do cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Inteiro = 6
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
        OnClick = valorDINHEIROClick
        OnEnter = valorDINHEIROEnter
        OnExit = valorDINHEIROExit
        OnKeyDown = valorDINHEIROKeyDown
        OnKeyPress = valorDINHEIROKeyPress
      end
      object valorCREDITO: TEditNum
        Left = 251
        Top = 61
        Width = 318
        Height = 27
        Cursor = crHandPoint
        Hint = 'Insira o valor em dinheiro recebido do cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Inteiro = 6
        ParentFont = False
        TabOrder = 1
        Text = '0,00'
        OnClick = valorCREDITOClick
        OnEnter = valorCREDITOEnter
        OnExit = valorCREDITOExit
        OnKeyDown = valorDINHEIROKeyDown
        OnKeyPress = valorCREDITOKeyPress
      end
      object valorDEBITO: TEditNum
        Left = 251
        Top = 111
        Width = 318
        Height = 27
        Cursor = crHandPoint
        Hint = 'Insira o valor em dinheiro recebido do cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Inteiro = 6
        ParentFont = False
        TabOrder = 2
        Text = '0,00'
        OnClick = valorDEBITOClick
        OnEnter = valorDEBITOEnter
        OnExit = valorDEBITOExit
        OnKeyDown = valorDINHEIROKeyDown
        OnKeyPress = valorDEBITOKeyPress
      end
      object valorPENDENCIA: TEditNum
        Left = 251
        Top = 160
        Width = 318
        Height = 27
        Hint = 'Insira o valor em dinheiro recebido do cliente'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Inteiro = 6
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '0,00'
        OnClick = valorPENDENCIAClick
      end
      object valorDIFERENCA: TEditNum
        Left = 251
        Top = 210
        Width = 318
        Height = 27
        Hint = 'Valor total pago at'#233' o momento'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Inteiro = 6
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = '0,00'
      end
    end
  end
end
