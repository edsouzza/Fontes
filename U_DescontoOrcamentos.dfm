object _frmDescontoOrcamentos: T_frmDescontoOrcamentos
  Left = 431
  Top = 234
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 2
  Caption = 'Desconto'
  ClientHeight = 290
  ClientWidth = 433
  Color = cl3DLight
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
  object pnl_cabecalho: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 41
    Align = alTop
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Desconto por valor ou percentual'
    Color = clBlue
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object pnl_rodape: TPanel
    Left = 0
    Top = 249
    Width = 433
    Height = 41
    Align = alBottom
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Clique aqui para sair'
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
    OnClick = pnl_rodapeClick
  end
  object pnl_DadosUsuario: TPanel
    Left = 0
    Top = 41
    Width = 433
    Height = 208
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object grp_CadastrarSenha: TGroupBox
      Left = 8
      Top = 8
      Width = 417
      Height = 193
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 8
        Top = 14
        Width = 401
        Height = 53
        Caption = 'Valor unit'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object edt_valorUnitarioAtual: TEditNum
          Left = 138
          Top = 17
          Width = 121
          Height = 26
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Inteiro = 6
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          OnKeyDown = edt_valorDescontoKeyDown
        end
        object edtIDItem: TEdit
          Left = 11
          Top = 19
          Width = 57
          Height = 26
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 80
        Width = 401
        Height = 105
        Caption = 'Escolha a forma de desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object edt_valorDesconto: TEditNum
          Left = 161
          Top = 20
          Width = 40
          Height = 26
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Inteiro = 6
          ParentFont = False
          TabOrder = 0
          Text = '0,00'
          Visible = False
          OnEnter = edt_valorDescontoEnter
          OnKeyDown = edt_valorDescontoKeyDown
        end
        object edt_percentualDesconto: TEditNum
          Left = 161
          Top = 62
          Width = 39
          Height = 26
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Inteiro = 6
          ParentFont = False
          TabOrder = 1
          Text = '0,00'
          Visible = False
          OnKeyDown = edt_percentualDescontoKeyDown
        end
        object rd_valordireto: TRadioButton
          Left = 8
          Top = 33
          Width = 113
          Height = 17
          Caption = 'Valor Direto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = rd_valordiretoClick
        end
        object rd_porpercentual: TRadioButton
          Left = 10
          Top = 72
          Width = 144
          Height = 17
          Caption = 'Por percentual %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = rd_porpercentualClick
        end
      end
    end
  end
end
