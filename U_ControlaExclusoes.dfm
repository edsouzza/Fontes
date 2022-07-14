object _frmControlaExclusoes: T_frmControlaExclusoes
  Left = 256
  Top = 123
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Controle de Exclus'#245'es'
  ClientHeight = 532
  ClientWidth = 872
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
    Width = 872
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Controle de Exclus'#245'es '
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
      Left = 763
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
    object lblStatusLogoff: TLabel
      Left = 60
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
  end
  object pan_botoes: TPanel
    Left = 0
    Top = 467
    Width = 872
    Height = 65
    Align = alBottom
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clMaroon
    TabOrder = 1
    object btnExcluir: TSpeedButton
      Left = 34
      Top = 12
      Width = 230
      Height = 35
      Hint = 'Excluir'
      Caption = 'Excluir'
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
      OnClick = btnExcluirClick
    end
    object btnSair: TSpeedButton
      Left = 605
      Top = 12
      Width = 230
      Height = 35
      Hint = 'Retornar a Tela Principal'
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
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 65
    Width = 872
    Height = 402
    Cursor = crHandPoint
    ActivePage = TabClientes
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Images = _frmPrincipal.lista_imagens
    ParentFont = False
    TabOrder = 2
    object TabClientes: TTabSheet
      Caption = 'Clientes'
      OnShow = TabClientesShow
      object GroupBox9: TGroupBox
        Left = 33
        Top = -1
        Width = 799
        Height = 39
        TabOrder = 0
        object edtConsCliente: TEdit
          Left = 12
          Top = 13
          Width = 773
          Height = 19
          Hint = 'Entre com o nome para filtrar'
          CharCase = ecUpperCase
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnChange = edtConsClienteChange
          OnClick = edtConsClienteClick
          OnKeyDown = edtConsClienteKeyDown
        end
      end
      object gridClientes: TDBGrid
        Left = 32
        Top = 49
        Width = 800
        Height = 295
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgRowLines, dgAlwaysShowSelection]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = gridClientesCellClick
      end
      object DBIdCliente: TDBEdit
        Left = -1
        Top = 6
        Width = 34
        Height = 24
        TabOrder = 2
      end
      object txtNomeCliente: TStaticText
        Left = 32
        Top = 347
        Width = 799
        Height = 21
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 3
      end
    end
    object TabFornecedores: TTabSheet
      Caption = 'Fornecedores'
      ImageIndex = 1
      OnShow = TabFornecedoresShow
      object DBIdFornecedor: TDBEdit
        Left = -1
        Top = 6
        Width = 34
        Height = 24
        TabOrder = 0
        Visible = False
      end
      object GroupBox1: TGroupBox
        Left = 33
        Top = -1
        Width = 799
        Height = 39
        TabOrder = 1
        object edtConsFornecedor: TEdit
          Left = 12
          Top = 13
          Width = 773
          Height = 19
          Hint = 'Entre com o nome para filtrar'
          CharCase = ecUpperCase
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnChange = edtConsFornecedorChange
          OnClick = edtConsFornecedorClick
          OnKeyDown = edtConsFornecedorKeyDown
        end
      end
      object GridFornecedores: TDBGrid
        Left = 32
        Top = 49
        Width = 800
        Height = 295
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgRowLines, dgAlwaysShowSelection]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = GridFornecedoresCellClick
      end
      object txtNomeFornecedor: TStaticText
        Left = 32
        Top = 347
        Width = 799
        Height = 21
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 3
      end
    end
    object TabFuncionarios: TTabSheet
      Caption = 'Funcion'#225'rios'
      ImageIndex = 2
      OnShow = TabFuncionariosShow
      object DBIdFuncionario: TDBEdit
        Left = -1
        Top = 6
        Width = 34
        Height = 24
        TabOrder = 0
        Visible = False
      end
      object GroupBox2: TGroupBox
        Left = 33
        Top = -1
        Width = 799
        Height = 39
        TabOrder = 1
        object edtConsFuncionario: TEdit
          Left = 12
          Top = 13
          Width = 773
          Height = 22
          Hint = 'Entre com o nome para filtrar'
          CharCase = ecUpperCase
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnChange = edtConsFuncionarioChange
          OnClick = edtConsFuncionarioClick
          OnKeyDown = edtConsFuncionarioKeyDown
        end
      end
      object GridFuncionarios: TDBGrid
        Left = 32
        Top = 49
        Width = 800
        Height = 295
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgRowLines, dgAlwaysShowSelection]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = GridFuncionariosCellClick
      end
      object txtNomeFuncionario: TStaticText
        Left = 32
        Top = 347
        Width = 799
        Height = 21
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 3
      end
    end
    object TabProdutos: TTabSheet
      Caption = 'Produtos'
      ImageIndex = 3
      OnShow = TabProdutosShow
      object DBIdProduto: TDBEdit
        Left = -1
        Top = 6
        Width = 34
        Height = 24
        TabOrder = 0
        Visible = False
      end
      object GroupBox3: TGroupBox
        Left = 33
        Top = -1
        Width = 799
        Height = 39
        TabOrder = 1
        object edtConsProduto: TEdit
          Left = 12
          Top = 13
          Width = 773
          Height = 22
          Hint = 'Entre com o nome para filtrar'
          CharCase = ecUpperCase
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnChange = edtConsProdutoChange
          OnClick = edtConsProdutoClick
          OnKeyDown = edtConsProdutoKeyDown
        end
      end
      object GridProdutos: TDBGrid
        Left = 32
        Top = 49
        Width = 800
        Height = 295
        Cursor = crHandPoint
        DataSource = dm_Conexao.ds_CadProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgRowLines, dgAlwaysShowSelection]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = GridProdutosCellClick
      end
      object txtNomeProduto: TStaticText
        Left = 32
        Top = 347
        Width = 799
        Height = 21
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 3
      end
    end
    object TabServicos: TTabSheet
      Caption = 'Servi'#231'os'
      ImageIndex = 4
      OnShow = TabServicosShow
      object DBIdServico: TDBEdit
        Left = -1
        Top = 6
        Width = 34
        Height = 24
        TabOrder = 0
        Visible = False
      end
      object GroupBox4: TGroupBox
        Left = 33
        Top = -1
        Width = 799
        Height = 39
        TabOrder = 1
        object edtConsServico: TEdit
          Left = 12
          Top = 13
          Width = 773
          Height = 22
          Hint = 'Entre com o nome para filtrar'
          CharCase = ecUpperCase
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnChange = edtConsServicoChange
          OnClick = edtConsServicoClick
          OnKeyDown = edtConsServicoKeyDown
        end
      end
      object GridServicos: TDBGrid
        Left = 32
        Top = 49
        Width = 800
        Height = 295
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgRowLines, dgAlwaysShowSelection]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = GridServicosCellClick
      end
      object txtNomeServico: TStaticText
        Left = 32
        Top = 347
        Width = 799
        Height = 21
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 3
      end
      object DBCodBarras: TDBEdit
        Left = -1
        Top = 46
        Width = 242
        Height = 24
        TabOrder = 4
        Visible = False
      end
    end
    object TabVendas: TTabSheet
      Caption = 'Exclus'#227'o de Vendas'
      ImageIndex = 13
      OnShow = TabVendasShow
      object Panel1: TPanel
        Left = 208
        Top = 83
        Width = 473
        Height = 197
        Color = clBlack
        TabOrder = 1
      end
      object GroupBox5: TGroupBox
        Left = 200
        Top = 72
        Width = 473
        Height = 201
        Color = clTeal
        ParentColor = False
        TabOrder = 0
        object Label2: TLabel
          Left = 66
          Top = 41
          Width = 367
          Height = 19
          Caption = 'Entre com o n'#250'mero da venda e tecle enter   '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object GroupBox6: TGroupBox
          Left = 130
          Top = 77
          Width = 225
          Height = 88
          TabOrder = 0
          object edtNumVenda: TEdit
            Left = 53
            Top = 33
            Width = 121
            Height = 32
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 10
            ParentFont = False
            TabOrder = 0
            OnKeyDown = edtNumVendaKeyDown
          end
        end
      end
      object DBMemoHistorico: TDBMemo
        Left = 732
        Top = 3
        Width = 132
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
        TabOrder = 2
        Visible = False
      end
    end
  end
end
