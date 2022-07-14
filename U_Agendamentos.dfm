object _frmAgendamentos: T_frmAgendamentos
  Left = 297
  Top = 51
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Controle da Agenda'
  ClientHeight = 602
  ClientWidth = 871
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
  object pnl_cabecalho: TPanel
    Left = 0
    Top = 65
    Width = 871
    Height = 472
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object lblStatus: TLabel
      Left = 12
      Top = 443
      Width = 844
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'Escolha o nome do cliente ou digite para filtrar'
      Color = clMaroon
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 11
      Top = 6
      Width = 844
      Height = 375
      TabOrder = 0
      object lst_Horarios: TListBox
        Left = 428
        Top = 75
        Width = 405
        Height = 290
        Cursor = crHandPoint
        Hint = 'Lista de Hor'#225'rios'
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 24
        Items.Strings = (
          '06 : 00'
          '06 : 15'
          '06 : 30'
          '06 : 45'
          '07 : 00'
          '07 : 15'
          '07 : 30'
          '07 : 45'
          '08 : 00'
          '08 : 15'
          '08 : 30'
          '08 : 45'
          '09 : 00'
          '09 : 15'
          '09 : 30'
          '09 : 45'
          '10 : 00'
          '10 : 15'
          '10 : 30'
          '10 : 45'
          '11 : 00'
          '11 : 15'
          '11 : 30'
          '11 : 45'
          '12 : 00'
          '12 : 15'
          '12 : 30'
          '12 : 45'
          '13 : 00'
          '13 : 15'
          '13 : 30'
          '13 : 45'
          '14 : 00'
          '14 : 15'
          '14 : 30'
          '14 : 45'
          '15 : 00'
          '15 : 15'
          '15 : 30'
          '15 : 45'
          '16 : 00'
          '16 : 15'
          '16 : 30'
          '16 : 45'
          '17 : 00'
          '17 : 15'
          '17 : 30'
          '17 : 45'
          '18 : 00'
          '18 : 15'
          '18 : 30'
          '18 : 45'
          '19 : 00'
          '19 : 15'
          '19 : 30'
          '19 : 45'
          '20 : 00'
          '20 : 15'
          '20 : 30'
          '20 : 45'
          '21 : 00'
          '21 : 15'
          '21 : 30'
          '21 : 45'
          '22 : 00'
          '22 : 15'
          '22 : 30'
          '22 : 45'
          '23 : 00'
          '23 : 15'
          '23 : 30'
          '23 : 45'
          ''
          '')
        ParentFont = False
        TabOrder = 0
        OnClick = lst_HorariosClick
      end
      object gr_dataagendada: TGroupBox
        Left = 429
        Top = 7
        Width = 405
        Height = 64
        Caption = 'Data'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object calendario: TDateTimePicker
          Left = 72
          Top = 24
          Width = 273
          Height = 27
          Cursor = crHandPoint
          Date = 365.709808657396900000
          Time = 365.709808657396900000
          Color = clWhite
          DragCursor = crHandPoint
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnChange = calendarioChange
        end
      end
      object grid_clientes: TDBGrid
        Left = 11
        Top = 75
        Width = 405
        Height = 290
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
        OnCellClick = grid_clientesCellClick
      end
      object GroupBox2: TGroupBox
        Left = 12
        Top = 7
        Width = 405
        Height = 64
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object edt_Nome: TEdit
          Left = 25
          Top = 25
          Width = 354
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnChange = edt_NomeChange
          OnKeyDown = edt_NomeKeyDown
        end
      end
    end
    object gr_dadosdoAgendamento: TGroupBox
      Left = 12
      Top = 385
      Width = 844
      Height = 57
      Caption = 'Detalhes do Agendamento'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 19
        Top = 30
        Width = 40
        Height = 15
        Caption = 'Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 408
        Top = 30
        Width = 80
        Height = 15
        Caption = 'Data Agendada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 631
        Top = 30
        Width = 82
        Height = 15
        Caption = 'Hora Agendada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txt_MostraNomeCliente: TStaticText
        Left = 65
        Top = 25
        Width = 327
        Height = 20
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Color = clBtnHighlight
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object txt_MostraDataAgendada: TStaticText
        Left = 498
        Top = 25
        Width = 110
        Height = 20
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Color = clBtnHighlight
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
      end
      object txt_MostraHoraAgendada: TStaticText
        Left = 726
        Top = 25
        Width = 110
        Height = 20
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Color = clBtnHighlight
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 2
      end
      object dbedtCLI_ID: TDBEdit
        Left = 674
        Top = 22
        Width = 47
        Height = 25
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        Visible = False
      end
    end
  end
  object pan_titulo: TPanel
    Left = 0
    Top = 0
    Width = 871
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Agendamentos de Clientes'
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
    Top = 537
    Width = 871
    Height = 65
    Align = alBottom
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clMaroon
    TabOrder = 1
    object btnSairDoAgendamento: TSpeedButton
      Left = 690
      Top = 12
      Width = 169
      Height = 35
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
      OnClick = btnSairDoAgendamentoClick
    end
    object btnCancelarGravacaoDoAgendamento: TSpeedButton
      Tag = 100
      Left = 177
      Top = 12
      Width = 169
      Height = 35
      Hint = 'Limpar / Cancelar o agendamento em curso'
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B000000010000030000007F00000000FF
        FF007F7F7F000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
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
        0101010101010101010101010101010101010101010101010101010101010101
        0101010101010101010101010101010101010101010101010101010101010101
        0101010101020001010101010000000000010101010100020101010100000000
        0101010101010100010101010000000101010101010101000101010100000100
        0101010101010100010101010001010100000101010100020101010101010101
        0101000000000201010101010101010101010101010101010101010101010101
        0101010101010101010101010101010101010101010101010101010101010101
        0101010101010101010101010101010101010101010101010101}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelarGravacaoDoAgendamentoClick
    end
    object btnGravarAgendamento: TSpeedButton
      Left = 7
      Top = 12
      Width = 169
      Height = 35
      Hint = 'Gravar novo agendamento'
      Caption = 'Gravar '
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
      OnClick = btnGravarAgendamentoClick
    end
    object btnGerenciarAgendamentos: TSpeedButton
      Tag = 100
      Left = 348
      Top = 12
      Width = 169
      Height = 35
      Hint = 'Ir para tela de gerenciamento de agendamentos'
      Caption = 'Lista Agendados'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B00000001000012000000FFFFFF00EFEF
        EF00DFDFDF00CFCFCF00C0C0C000BFBFBF00AFAFAF009F9FBF00A0A0A0009F9F
        9F007F7FBF00808080007F7F7F006F6FAF006060A00040404000800000000000
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000111111111111
        1111111111111111111111090F0F0F0F0F0F0F0F0F0F0F0F0C11110500020002
        00020002040404040C1111050203020302030203040404040C11110500020002
        00020002000200020C1111050203020302030203020302030C11110500020002
        00020002000200020C11110502030203020302030A0702030C11110500020002
        0002000A010D00020C11110502030203020302070D0E02030C11110504040404
        04040002000200020C1111050808080808080506050605060C11110510101010
        10100B0B0B0B0B0B0B1111050505050505050505050505050511111111111111
        1111111111111111111111111111111111111111111111111111}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnGerenciarAgendamentosClick
    end
    object btnAgendarNaoCliente: TSpeedButton
      Tag = 100
      Left = 519
      Top = 12
      Width = 169
      Height = 35
      Hint = 'Agendamento de n'#227'o clientes'
      Caption = 'Agendar n'#227'o cliente'
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
      OnClick = btnAgendarNaoClienteClick
    end
  end
end