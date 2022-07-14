object _frmCotacao: T_frmCotacao
  Left = 289
  Top = 6
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cota'#231#227'o de Pre'#231'os'
  ClientHeight = 673
  ClientWidth = 994
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 14
    Top = 83
    Width = 175
    Height = 16
    Alignment = taCenter
    Caption = 'ENTRE COM O SERVI'#199'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = edt_PrecoDescontoProdutoCotacaoClick
  end
  object Label7: TLabel
    Left = 262
    Top = 83
    Width = 184
    Height = 16
    Alignment = taCenter
    Caption = 'ENTRE COM O PRODUTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = edt_PrecoDescontoProdutoCotacaoClick
  end
  object pan_titulo: TPanel
    Left = 0
    Top = 0
    Width = 994
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Abre uma nova cota'#231#227'o de pre'#231'os'
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
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
      Left = 882
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
    Top = 609
    Width = 994
    Height = 64
    Align = alBottom
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clMaroon
    TabOrder = 1
    object btnSairDaCotacao: TSpeedButton
      Left = 805
      Top = 9
      Width = 179
      Height = 42
      Hint = 'Retornar a Tela Principal'
      Caption = 'Sair '
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
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
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSairDaCotacaoClick
    end
    object btnCancelarGravacaoDaCotacao: TSpeedButton
      Tag = 100
      Left = 207
      Top = 9
      Width = 179
      Height = 42
      Hint = 'Limpar Cota'#231#227'o'
      Caption = 'Cancelar Cota'#231#227'o'
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B000000010000020000000000FF000000
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000001010000000000000000000000000001010101
        0000000101010000000000000000010101000101010101000000000000000001
        0101010101000000000000000000000001010100000000000000000000000001
        0101010100000000000000000000010101000101010000000000000000000101
        0000010101010000000000000000010100000001010100000000000000000001
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelarGravacaoDaCotacaoClick
    end
    object btnImprimirCotacao: TSpeedButton
      Tag = 100
      Left = 406
      Top = 9
      Width = 179
      Height = 42
      Hint = 'Imprimir Cota'#231#227'o'
      Caption = 'Imprimir Cota'#231#227'o'
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B0000000100000600000000000000CCCC
        CC00FFFFFF008484840000FFFF000000FF000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000050505050505
        0505050505050505050505050000000000000000000000050505050001010101
        0101010101000100050500000000000000000000000000010005000101010101
        0104040401010000000500010101010101030303010100010005000000000000
        0000000000000001010000010101010101010101010001000100050000000000
        0000000000010001000005050002020202020202020001000100050505000200
        0000000002000000000505050500020202020202020200050505050505050002
        0000000000020005050505050505000202020202020202000505050505050500
        0000000000000000050505050505050505050505050505050505}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnImprimirCotacaoClick
    end
    object btnCadCliente: TSpeedButton
      Tag = 100
      Left = 605
      Top = 9
      Width = 179
      Height = 42
      Hint = 'Cadastrar Cliente'
      Caption = 'Cadastrar Cliente'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B00000001000004000000FFFFFF000000
        FF00800000000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000010101010101
        0101010101010101010101010101010101010101010101010101010101020101
        0103010101010103010101010102020101030101030303010101010102020202
        0101030300000301010101020202020202010103000303030101020202020202
        0101030300000000030102020102020101030303030000000301020101020101
        0103030300000000000302010101010101030303000000030300020101010101
        0103030303030000030001020101010101030303030303030003010101010101
        0101030303030303030301010101010101010103030303030101010101010101
        0101010101010101030101010101010101010101010101010101}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCadClienteClick
    end
    object btnGravarCotacao: TSpeedButton
      Tag = 100
      Left = 8
      Top = 9
      Width = 179
      Height = 42
      Hint = 'Grava a cota'#231#227'o atual'
      Caption = 'Gravar Cota'#231#227'o'
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B00000001000004000000D3D3D3004DA6
        A6004D4D4D000000FF0000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000030303030303
        0303030303030303030303030202020202020202020202020203030201010202
        0202020200000201020303020101020202020202000002010203030201010202
        0202020200000201020303020101020202020202020202010203030201010101
        0101010101010101020303020101020202020202020201010203030201020000
        0000000000000201020303020102000000000000000002010203030201020000
        0000000000000201020303020102000000000000000002010203030201020000
        0000000000000202020303020102000000000000000002000203030202020202
        0202020202020202020303030303030303030303030303030303}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnGravarCotacaoClick
    end
  end
  object panel_itensCotacao: TPanel
    Left = 0
    Top = 137
    Width = 998
    Height = 475
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BorderStyle = bsSingle
    TabOrder = 2
    Visible = False
    object panel_Produtos: TPanel
      Left = 1
      Top = 2
      Width = 960
      Height = 65
      TabOrder = 0
      object lbl14: TLabel
        Left = 676
        Top = 13
        Width = 81
        Height = 16
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl33: TLabel
        Left = 402
        Top = 13
        Width = 42
        Height = 16
        Caption = 'Pre'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl38: TLabel
        Left = 267
        Top = 13
        Width = 58
        Height = 16
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl40: TLabel
        Left = 538
        Top = 13
        Width = 67
        Height = 16
        Caption = 'Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl52: TLabel
        Left = 18
        Top = 13
        Width = 55
        Height = 16
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object edt_QuantidadeProdutoCotacao: TEdit
        Left = 676
        Top = 30
        Width = 275
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnKeyDown = edt_QuantidadeProdutoCotacaoKeyDown
        OnKeyPress = edt_QuantidadeProdutoCotacaoKeyPress
      end
      object edt_PrecoProdutoCotacao: TCurrencyEdit
        Left = 401
        Top = 30
        Width = 125
        Height = 20
        AutoSize = False
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edt_EstoqueCotacao: TEdit
        Left = 266
        Top = 30
        Width = 125
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edt_PrecoDescontoProdutoCotacao: TCurrencyEdit
        Left = 537
        Top = 29
        Width = 125
        Height = 21
        AutoSize = False
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        ZeroEmpty = False
        OnClick = edt_PrecoDescontoProdutoCotacaoClick
      end
      object edt_ProdutoCotacao: TEdit
        Left = 17
        Top = 30
        Width = 240
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object btnInserirProduto: TButton
        Left = 828
        Top = 11
        Width = 116
        Height = 46
        Caption = 'Inserir Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        Visible = False
        OnClick = btnInserirProdutoClick
      end
    end
    object Grid_DetalhesDaCotacao: TDBGrid
      Left = 1
      Top = -1
      Width = 992
      Height = 422
      Color = clInfoBk
      Ctl3D = False
      DataSource = dm_DadosSegundo.ds_TCotacao
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
      ParentCtl3D = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = Grid_DetalhesDaCotacaoCellClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'COTACAO_ID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'COTA'#199#195'O'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 495
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNITARIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taRightJustify
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QUANTIDADE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTALITEM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taRightJustify
          Title.Caption = 'TOTAL'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end>
    end
    object panel_item: TPanel
      Left = -1
      Top = 422
      Width = 994
      Height = 48
      BevelInner = bvLowered
      BevelWidth = 2
      BorderWidth = 2
      BorderStyle = bsSingle
      Color = clBlue
      TabOrder = 2
      Visible = False
      object Label5: TLabel
        Left = 16
        Top = 13
        Width = 282
        Height = 19
        Caption = 'O que deseja fazer com este '#237'tem?'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rd_desconto: TRadioButton
        Left = 381
        Top = 15
        Width = 233
        Height = 17
        Caption = 'Conceder desconto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = rd_descontoClick
      end
      object rd_exclusaodoitem: TRadioButton
        Left = 648
        Top = 15
        Width = 145
        Height = 17
        Caption = 'Excluir '#237'tem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = rd_exclusaodoitemClick
      end
      object rd_sair: TRadioButton
        Left = 864
        Top = 15
        Width = 89
        Height = 17
        Caption = 'Voltar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = rd_sairClick
      end
    end
    object panel_total: TPanel
      Left = 0
      Top = 368
      Width = 994
      Height = 48
      BevelInner = bvLowered
      BorderStyle = bsSingle
      TabOrder = 3
      object lbl37: TLabel
        Left = 661
        Top = 14
        Width = 155
        Height = 24
        Caption = 'Total a Pagar R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object db_ValorTotal: TDBEdit
        Left = 823
        Top = 8
        Width = 161
        Height = 30
        Color = clHighlightText
        Ctl3D = False
        DataField = 'total_geral'
        DataSource = dm_DadosSegundo.ds_TCotacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object txt_IdDoITEM: TEdit
        Left = 8
        Top = 13
        Width = 81
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
      object txt_ValorItem: TEdit
        Left = 96
        Top = 13
        Width = 81
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object txt_IDPRODUTODEL: TEdit
        Left = 184
        Top = 13
        Width = 81
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
      object edt_quantidadeDoItem: TEdit
        Left = 272
        Top = 13
        Width = 81
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        Visible = False
      end
    end
  end
  object panel_CabecalhoCotacao: TPanel
    Left = 0
    Top = 65
    Width = 998
    Height = 72
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BorderStyle = bsSingle
    TabOrder = 3
    object Label3: TLabel
      Left = 535
      Top = 14
      Width = 165
      Height = 16
      Alignment = taCenter
      Caption = 'ESCOLHA O PRODUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = edt_PrecoDescontoProdutoCotacaoClick
    end
    object Label8: TLabel
      Left = 5
      Top = 14
      Width = 153
      Height = 16
      Alignment = taCenter
      Caption = 'ESCOLHA O CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = edt_PrecoDescontoProdutoCotacaoClick
    end
    object Label1: TLabel
      Left = 171
      Top = 14
      Width = 105
      Height = 16
      Alignment = taCenter
      Caption = 'txtNumCotacao'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = edt_PrecoDescontoProdutoCotacaoClick
    end
    object Label2: TLabel
      Left = 355
      Top = 14
      Width = 77
      Height = 16
      Alignment = taCenter
      Caption = 'txtIdCliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = edt_PrecoDescontoProdutoCotacaoClick
    end
    object Label4: TLabel
      Left = 864
      Top = 11
      Width = 83
      Height = 16
      Alignment = taCenter
      Caption = 'txtIdProduto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = edt_PrecoDescontoProdutoCotacaoClick
    end
    object txt_IDPRODUTO: TEdit
      Left = 964
      Top = 6
      Width = 20
      Height = 22
      CharCase = ecUpperCase
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
      Text = '0'
      Visible = False
    end
    object txt_NomeProdutoCotacao: TStaticText
      Left = 536
      Top = 32
      Width = 450
      Height = 22
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clBtnHighlight
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      OnClick = txt_NomeProdutoCotacaoClick
    end
    object txt_NumCotacao: TEdit
      Left = 277
      Top = 6
      Width = 19
      Height = 22
      CharCase = ecUpperCase
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
      Text = '0'
      Visible = False
    end
  end
  object txt_IDCLIENTE: TEdit
    Left = 439
    Top = 72
    Width = 19
    Height = 22
    CharCase = ecUpperCase
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Text = '0'
    Visible = False
  end
  object txt_NomeClienteCotacao: TStaticText
    Left = 7
    Top = 100
    Width = 450
    Height = 22
    AutoSize = False
    BorderStyle = sbsSingle
    Color = clBtnHighlight
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 5
    OnClick = txt_NomeClienteCotacaoClick
  end
end
