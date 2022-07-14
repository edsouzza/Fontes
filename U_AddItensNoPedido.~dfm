object _frmAddItensNoPedido: T_frmAddItensNoPedido
  Left = 402
  Top = 205
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Adicionar Itens no Pedido'
  ClientHeight = 650
  ClientWidth = 995
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
  object Grid_DetalhesDoPedido: TDBGrid
    Left = -1
    Top = 133
    Width = 996
    Height = 457
    Color = clInfoBk
    Ctl3D = False
    DataSource = dm_DadosSegundo.ds_TPedido
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
    ParentCtl3D = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = Grid_DetalhesDoPedidoCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PRODUTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 629
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_UNITARIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Title.Alignment = taRightJustify
        Title.Caption = 'PRE'#199'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QDE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_TOTALITEM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Title.Alignment = taRightJustify
        Title.Caption = 'TOTAL'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 110
        Visible = True
      end>
  end
  object panel_total: TPanel
    Left = -2
    Top = 544
    Width = 997
    Height = 50
    TabOrder = 2
    object lbl37: TLabel
      Left = 639
      Top = 13
      Width = 149
      Height = 24
      Caption = 'Total do Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object db_ValorTotal: TDBEdit
      Left = 801
      Top = 8
      Width = 188
      Height = 30
      Color = clInfoBk
      Ctl3D = False
      DataField = 'TOTAL'
      DataSource = dm_DadosSegundo.ds_TPedido
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
    object txt_IDITEM: TEdit
      Left = 8
      Top = 7
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
    object txt_ValorTotalDoItem: TEdit
      Left = 96
      Top = 7
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
  end
  object pan_titulo: TPanel
    Left = 0
    Top = 0
    Width = 995
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Adicionando '#205'tens no Pedido'
    Color = clMaroon
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
  object panel_Produtos: TPanel
    Left = -1
    Top = 66
    Width = 996
    Height = 65
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 165
      Top = -1
      Width = 828
      Height = 63
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lbl52: TLabel
        Left = 7
        Top = 10
        Width = 166
        Height = 20
        Caption = 'Entre com o Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl33: TLabel
        Left = 608
        Top = 10
        Width = 114
        Height = 20
        Caption = 'Pre'#231'o Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl14: TLabel
        Left = 772
        Top = 10
        Width = 34
        Height = 20
        Caption = 'Qde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 463
        Top = 10
        Width = 94
        Height = 20
        Caption = 'Pre'#231'o Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel
        Left = 390
        Top = 10
        Width = 68
        Height = 20
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object edt_IDPedidoAberto: TEdit
        Left = 184
        Top = 13
        Width = 56
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
        TabOrder = 2
        Visible = False
      end
      object edt_PrecoProdutoPedido: TCurrencyEdit
        Left = 609
        Top = 34
        Width = 142
        Height = 22
        AutoSize = False
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnClick = edt_PrecoProdutoPedidoClick
      end
      object edt_QuantidadeProdutoPedido: TEdit
        Left = 755
        Top = 34
        Width = 65
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnClick = edt_QuantidadeProdutoPedidoClick
        OnKeyDown = edt_QuantidadeProdutoPedidoKeyDown
        OnKeyPress = edt_QuantidadeProdutoPedidoKeyPress
      end
      object edt_IDProdutoPedido: TEdit
        Left = 248
        Top = 13
        Width = 56
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
        TabOrder = 3
        Visible = False
      end
      object edtPrecoAtual: TCurrencyEdit
        Left = 463
        Top = 34
        Width = 142
        Height = 22
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
        TabOrder = 4
        OnClick = edtPrecoAtualClick
      end
      object edtEstoque: TStaticText
        Left = 391
        Top = 34
        Width = 67
        Height = 22
        Alignment = taCenter
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
      end
      object edt_DescProdutoPedido: TEdit
        Left = 8
        Top = 34
        Width = 377
        Height = 22
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        OnClick = edt_DescProdutoPedidoClick
        OnKeyDown = edt_DescProdutoPedidoKeyDown
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = -1
      Width = 151
      Height = 63
      Caption = 'Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object edt_pedido: TLabel
        Left = 9
        Top = 19
        Width = 128
        Height = 37
        Alignment = taCenter
        Caption = 'PEDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -32
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
    end
  end
  object pan_botoes: TPanel
    Left = -2
    Top = 589
    Width = 999
    Height = 64
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clMaroon
    TabOrder = 4
    object btnCancelarPedido: TSpeedButton
      Left = 540
      Top = 9
      Width = 180
      Height = 42
      Hint = 'Cancelar o pedido e todos os '#237'tens'
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888881F88881F8888888888888991F8888889F8888191F888881
        F888888199F88891F8888888191F819F88888888819199F88888888888919F88
        88888888891911F888888888191F89F88888889191F88819F88881919F888881
        9F88891F8888888819F88888888888888888}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelarPedidoClick
    end
    object btnGravarPedido: TSpeedButton
      Left = 10
      Top = 9
      Width = 180
      Height = 42
      Hint = 'Gravar Atualiza'#231#227'o'
      Caption = 'Gravar '
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
      OnClick = btnGravarPedidoClick
    end
    object btnSair: TSpeedButton
      Left = 805
      Top = 9
      Width = 180
      Height = 42
      Hint = 'Sair'
      Caption = 'Sair'
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
      OnClick = btnSairClick
    end
    object btnCadProduto: TSpeedButton
      Left = 275
      Top = 9
      Width = 180
      Height = 42
      Hint = 'Cadastro r'#225'pido de produtos'
      Caption = 'Cadastrar Produto'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        96030000424D9603000000000000360000002800000010000000120000000100
        18000000000060030000120B0000120B00000000000000000000FDFDFDEAEAEA
        D0CFCFC2C3C486B1C032657F41616B635B64574E49524B48AAA9A9BABABAB7B7
        B7FFFFFFFFFFFFFFFFFFC0C0C0E5E5E5D2D1D2BCBCBDB4D4D97EA5AE8697A5A5
        99B7A097A79A90A288878A8B8B8A7373738F8F8FB8B8B8F9F9F9928F8FDBD8D8
        D6D3D5CFD0D3F3F2F0FBF3F5D9D6D2919394515653BBC1BDE1E1E1CCCCCCC1C1
        C15A5A5A6363638A8A898F8883D4CCC8D1C9C6D3D3D5EBE8E7EAE0DFCBC3C27A
        7472454A48EEF1EFFBFAFAF5F5F5E9E9E94B4B4B5C5C5C656665908B97D6D0DE
        DAD3DFD9D9DAECEAE8E6DEDDCBC2C277716F414644C8C8D0FCFBFDE6E6E6D9D9
        D98282825E5E5EBDBDBD96959CDFDDE5E4E2EADCDEDFEAE8E5E8DEDECCC3C374
        6A6B707271898E91C0BFC1C0C0C09B9B9BBFBFBFF5F5F5FFFFFFE0E1DFF5F6F4
        DDDFDCD5D9D9EEE9E9E7E0DEC4BFC06A6B70A7A8A9C1BFBBABAAAACACACBFEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFDADADAC3BEBEAFC3D49FD0F2A5C4F190A9D24A
        5F7182868BB9B6B7989898EBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDD
        C8C7C7DFDEDDE5E3F3D7D7EFBCB5CD706D6C626261DFDFDF8E8E8ED9D9D9FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3C5C5C5E4E4E4F4F2F2F7F8F7CECFCF62
        6263767676FAFAFA8A8A8AE8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1
        E4E4E4F5F5F5E3E5E4E6E7E6B5B6B58E8D8ECAC3C3ECE6E6858282FBFBFBFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEDEEE4E4E4939494D8
        D5D5EAE2E2D6CECE878484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F3E9E9E99B9D9CCFCECBEDE6E6CAC2C2979494FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E1CCCECDDB
        D6D4EEEBEAB9B7B5ACACACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFECECECD5D4D4CED1D0ACA9ADDAC5CEEEE1E1B0ABAABBBBBBFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF4F4F4EFF0EFD0CDD4D9
        D2E0EEE8ECB3A8A5CFCDCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE8E9E7E6E8E7E9EBEDBFBFBEE2E2E2FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF5F5F4D9D8D9F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCadProdutoClick
    end
  end
  object panel_item: TPanel
    Left = -4
    Top = 498
    Width = 999
    Height = 48
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clBlue
    TabOrder = 5
    Visible = False
    object Label5: TLabel
      Left = 72
      Top = 15
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
    object rd_exclusaodoitem: TRadioButton
      Left = 544
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
      TabOrder = 0
      OnClick = rd_exclusaodoitemClick
    end
    object rd_sair: TRadioButton
      Left = 848
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
      TabOrder = 1
      OnClick = rd_sairClick
    end
  end
end
