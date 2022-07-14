object _frmEntraCPFCNPJ: T_frmEntraCPFCNPJ
  Left = 734
  Top = 344
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 2
  Caption = 'CPF / CNPJ'
  ClientHeight = 347
  ClientWidth = 551
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001000800680500001600000028000000100000002000
    0000010008000000000000000000000000000000000000000000000000000000
    0000010101000000000000FFFF00FFFFFF007F7F7F007F000000BFBFBF00FFFF
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
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000010101010000000001010101000000000104010100000000010401010000
    0000010401010100010101040101000000000101010101010104010101010006
    0606010104010107010401010101000604040401010101070101010101000006
    0405050104010101010401010100000604040404010101010101010100000006
    0405050401040105050104010000000604040404010101040401010100000006
    0405050405050405050406000000000604040404040404040404060000000006
    0606060606060606060606000000000607060607060607060607060000000006
    060606060606060606060600000000000000000000000000000000000000F0F0
    0000F0F00000F0400000F0000000800000008001000080010000800300008003
    0000800300008007000080070000800700008007000080070000FFFF0000}
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
    Top = 0
    Width = 551
    Height = 41
    Align = alTop
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Entre com os dados do cliente para o cupom'
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
  object pnl_rodape: TPanel
    Left = 0
    Top = 311
    Width = 551
    Height = 36
    Cursor = crArrow
    Align = alBottom
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Tecle enter para entrar com campo vazio'
    Color = clBlue
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
  end
  object pnl_DadosUsuario: TPanel
    Left = 0
    Top = 41
    Width = 551
    Height = 270
    Align = alClient
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object grp_CadastrarSenha: TGroupBox
      Left = 54
      Top = 23
      Width = 448
      Height = 215
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 17
        Top = 132
        Width = 30
        Height = 16
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 240
        Top = 132
        Width = 40
        Height = 16
        Caption = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 17
        Top = 74
        Width = 45
        Height = 16
        Caption = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object msk_cpf: TMaskEdit
        Left = 68
        Top = 130
        Width = 140
        Height = 19
        Cursor = crHandPoint
        EditMask = '###.###.###-##;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 14
        ParentFont = False
        TabOrder = 1
        Text = '   .   .   -  '
        OnChange = msk_cpfChange
      end
      object msk_cnpj: TMaskEdit
        Left = 291
        Top = 130
        Width = 140
        Height = 19
        Cursor = crHandPoint
        EditMask = '###.###.###/####-##;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 19
        ParentFont = False
        TabOrder = 2
        Text = '   .   .   /    -  '
        OnKeyDown = msk_cnpjKeyDown
      end
      object edtNomeCliente: TEdit
        Left = 68
        Top = 66
        Width = 364
        Height = 22
        MaxLength = 40
        TabOrder = 0
        OnExit = edtNomeClienteExit
      end
    end
  end
end
