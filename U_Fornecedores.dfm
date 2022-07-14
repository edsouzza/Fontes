object _frmFornecedores: T_frmFornecedores
  Left = 490
  Top = 217
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Controle de Fornecedores'
  ClientHeight = 643
  ClientWidth = 1092
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001000800680500001600000028000000100000002000
    0000010008000000000000000000000000000000000000000000000000000000
    00000101010000000000999999000000FF006666660047474700E4E4E4000010
    8700BEBEBE00292929008C8C8C005A5A5A00212121003660AF0099999900FFFF
    FF00191919004F6DB70066666600CECCC500ADADAD00525C9100848484003C3C
    3C00121212007F8DA800D7D7D700F2F2F200102B9500B0B2B600ADABA7005252
    5200C5C5C5006483C100080808007F7F7F00D4DDEE0033333300DDDDDD007373
    7300CCCCCC0000109000424242004B639E00B3B0AB008C848400B6B6B600C3C6
    CD00D5D1C8000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000020
    101022082510101017071010100000201010251D12301010070B071029000020
    1010100E2A1A2D10101C0B202400002010101F162C1E091F1010150300000020
    1009281431172815091F0B0000000005211B2B0B172F210B0B17000000000000
    0B050C1701192F1B110C00000000000000280B0A190B0A151511000000000000
    000C110A151B1F111E0D2000000000000B010D15292121181123230000000000
    000D0B1B29202320200A010B0000000000172827061117192020110B00000000
    00030C18010A0C1719200D03000000000000030C23010D0C2401180000000000
    000000032819010D0D2600000000000000000000000C05112000000000008001
    000080010000800100008003000080070000800F0000C00F0000E00F0000E007
    0000C0070000E0030000E0030000E0030000F0070000F80F0000FE1F0000}
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 403
    Top = 497
    Width = 69
    Height = 13
    Caption = 'ENDERE'#199'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pangrid_alteracao: TPanel
    Left = 0
    Top = 65
    Width = 1092
    Height = 513
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object grp2: TGroupBox
      Left = 106
      Top = 24
      Width = 890
      Height = 400
      Caption = 'ALTERA'#199#213'ES'
      TabOrder = 1
      object lbl10: TLabel
        Left = 31
        Top = 21
        Width = 37
        Height = 13
        Caption = 'NOME'
        FocusControl = dbedtFORNE_NOME1
      end
      object lbl20: TLabel
        Left = 31
        Top = 72
        Width = 69
        Height = 13
        Caption = 'ENDERECO'
        FocusControl = dbedtFORNE_ENDERECO1
      end
      object lbl21: TLabel
        Left = 33
        Top = 124
        Width = 48
        Height = 13
        Caption = 'BAIRRO'
        FocusControl = dbedtFORNE_COMPLEMENTO1
      end
      object lbl25: TLabel
        Left = 31
        Top = 177
        Width = 38
        Height = 13
        Caption = 'EMAIL'
        FocusControl = dbedtFORNE_EMAIL1
      end
      object lbl26: TLabel
        Left = 680
        Top = 122
        Width = 25
        Height = 13
        Caption = 'CEP'
      end
      object lbl27: TLabel
        Left = 680
        Top = 20
        Width = 54
        Height = 13
        Caption = 'APELIDO'
        FocusControl = dbedtFORNE_APELIDO1
      end
      object lbl29: TLabel
        Left = 71
        Top = 292
        Width = 65
        Height = 13
        Caption = 'TELEFONE'
      end
      object Label18: TLabel
        Left = 32
        Top = 292
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label19: TLabel
        Left = 281
        Top = 292
        Width = 76
        Height = 13
        Caption = 'TELEFONE 2'
      end
      object Label20: TLabel
        Left = 243
        Top = 292
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label33: TLabel
        Left = 497
        Top = 292
        Width = 76
        Height = 13
        Caption = 'TELEFONE 3'
      end
      object Label34: TLabel
        Left = 457
        Top = 292
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label35: TLabel
        Left = 706
        Top = 292
        Width = 57
        Height = 13
        Caption = 'CELULAR'
      end
      object Label36: TLabel
        Left = 670
        Top = 292
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label5: TLabel
        Left = 31
        Top = 228
        Width = 32
        Height = 13
        Caption = 'CNPJ'
      end
      object Label6: TLabel
        Left = 447
        Top = 227
        Width = 21
        Height = 13
        Caption = 'I.E.'
      end
      object Label13: TLabel
        Left = 31
        Top = 350
        Width = 92
        Height = 13
        Caption = 'OBSERVA'#199#213'ES'
        FocusControl = dbedtFORNE_OBS1
      end
      object dbedtFORNE_NOME1: TDBEdit
        Left = 31
        Top = 37
        Width = 642
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'FORNE_NOME'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnChange = dbedtFORNE_NOME1Change
      end
      object dbedtFORNE_ENDERECO1: TDBEdit
        Left = 31
        Top = 88
        Width = 826
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'FORNE_ENDERECO'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnChange = dbedtFORNE_ENDERECO1Change
      end
      object dbedtFORNE_COMPLEMENTO1: TDBEdit
        Left = 31
        Top = 140
        Width = 642
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'FORNE_COMPLEMENTO'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnChange = dbedtFORNE_COMPLEMENTO1Change
      end
      object dbedtFORNE_EMAIL1: TDBEdit
        Left = 31
        Top = 193
        Width = 824
        Height = 19
        Hint = 'Digite tudo em letras min'#250'sculas'
        CharCase = ecLowerCase
        Ctl3D = False
        DataField = 'FORNE_EMAIL'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnChange = dbedtFORNE_EMAIL1Change
      end
      object dbedtFORNE_APELIDO1: TDBEdit
        Left = 680
        Top = 36
        Width = 175
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'FORNE_APELIDO'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnChange = dbedtFORNE_APELIDO1Change
        OnEnter = dbedtFORNE_APELIDO1Enter
      end
      object msk_tel: TMaskEdit
        Left = 71
        Top = 310
        Width = 150
        Height = 19
        Ctl3D = False
        EditMask = '9999-9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 9
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
        Text = '    -    '
        OnChange = msk_telChange
        OnKeyPress = msk_cep2KeyPress
      end
      object msk_cep2: TMaskEdit
        Left = 680
        Top = 138
        Width = 175
        Height = 19
        Ctl3D = False
        EditMask = '#####-###;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 9
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        Text = '     -   '
        OnChange = msk_cep2Change
        OnKeyPress = msk_cep2KeyPress
      end
      object dbedtforne_ddd: TDBEdit
        Left = 31
        Top = 310
        Width = 33
        Height = 19
        Hint = 'Digite tudo em letras min'#250'sculas'
        CharCase = ecLowerCase
        Ctl3D = False
        DataField = 'FORNE_DDDFONE'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnChange = dbedtFORNE_EMAIL1Change
      end
      object msk_tel2: TMaskEdit
        Left = 281
        Top = 310
        Width = 150
        Height = 19
        Ctl3D = False
        EditMask = '9999-9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 9
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 11
        Text = '    -    '
        OnChange = msk_tel2Change
        OnKeyPress = msk_cep2KeyPress
      end
      object dbedtforne_ddd2: TDBEdit
        Left = 242
        Top = 310
        Width = 33
        Height = 19
        Hint = 'Digite tudo em letras min'#250'sculas'
        CharCase = ecLowerCase
        Ctl3D = False
        DataField = 'FORNE_DDDFONE2'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnChange = dbedtFORNE_EMAIL1Change
      end
      object msk_tel3: TMaskEdit
        Left = 497
        Top = 310
        Width = 150
        Height = 19
        Ctl3D = False
        EditMask = '9999-9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 9
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 13
        Text = '    -    '
        OnChange = msk_tel3Change
        OnKeyPress = msk_cep2KeyPress
      end
      object dbedtforne_ddd3: TDBEdit
        Left = 456
        Top = 310
        Width = 33
        Height = 19
        Hint = 'Digite tudo em letras min'#250'sculas'
        CharCase = ecLowerCase
        Ctl3D = False
        DataField = 'FORNE_DDDFONE3'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnChange = dbedtFORNE_EMAIL1Change
      end
      object msk_tel4: TMaskEdit
        Left = 706
        Top = 310
        Width = 150
        Height = 19
        Ctl3D = False
        EditMask = '\99999-9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 15
        Text = '9    -    '
        OnChange = msk_tel4Change
        OnKeyPress = msk_cep2KeyPress
      end
      object dbedtforne_ddd4: TDBEdit
        Left = 669
        Top = 310
        Width = 33
        Height = 19
        Hint = 'Digite tudo em letras min'#250'sculas'
        CharCase = ecLowerCase
        Ctl3D = False
        DataField = 'FORNE_DDDFONE4'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        OnChange = dbedtFORNE_EMAIL1Change
      end
      object msk_cnpj2: TMaskEdit
        Left = 31
        Top = 246
        Width = 410
        Height = 22
        Ctl3D = False
        EditMask = '##.###.###/####-##;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 18
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        Text = '  .   .   /    -  '
        OnChange = msk_cnpj2Change
        OnEnter = msk_cnpj2Enter
      end
      object msk_ie2: TMaskEdit
        Left = 446
        Top = 245
        Width = 410
        Height = 22
        Ctl3D = False
        EditMask = '###.###.###.###;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 15
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        Text = '   .   .   .   '
        OnChange = msk_ie2Change
        OnEnter = msk_ie2Enter
      end
      object DBEDTIDFORNE: TDBEdit
        Left = 767
        Top = 10
        Width = 90
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'FORNE_ID'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 17
        Visible = False
      end
      object dbedtFORNE_OBS1: TDBEdit
        Left = 31
        Top = 366
        Width = 826
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_OBS'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
        OnChange = dbedtFORNE_EMAIL1Change
      end
    end
    object grp3: TGroupBox
      Left = 106
      Top = 426
      Width = 890
      Height = 73
      TabOrder = 0
      object btnConfirmaAlteracao: TSpeedButton
        Left = 17
        Top = 20
        Width = 225
        Height = 41
        Cursor = crHandPoint
        Hint = 'Clique Aqui para Confirmar '
        Caption = 'Gravar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B00000001000069000000FFFFFF00F7FF
          FF00FFFEF100F9F8FD00FFFFDE00F7F7F900FFFFCC00F1F2F600F0F0EF00EDED
          E500EDEEDD00E6E6E600F5F7AA00DEDEE300DEDEDE00DBDAD700D4D4E400D7D7
          D700ECEC8C00D2D5DE00D3D3D100D9D9B000D8DB9C00EFDC8D00CCCCCC00E9E9
          6000C4C4D300E3E35700EED19000C6C5C300BBBBBB00B5B7BC00D6D64300B6B6
          B700B1B1C800B4B2AF00CBCD4A00B0AFAF00A6A6C500C3C35A00A4A4CC00C7B4
          8A00B9B97400A5A7AF00ADA5AD00A8A89E00A3A4A700A0A0A3009595C000ADAD
          6400B0B05300A3989D009C9C8D009E9E7A0094968C00A0968200978F81008A8A
          9500878797009797510085878B008686850081809A009999330087817300886E
          AE00656BC500837F78006D6DB5006769BC007A7A78008A8A3D007A7670007E80
          47007B7D4D006060B400727174007A7B4200837F280074753E00666666007972
          2B00645B4F007F584A0058585200393AAF003939A80065553800614C51004F4F
          46006A5523002D2DAD0047474A004F4F27002B2AA70053530E004A3B18004141
          000035352B0045381B003C3C10003B3B0000361C520033330000000099000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000505050505050
          50505050505050505050501A44222630141414141414141405505010565B5545
          0E0E0E0E0E0B0B0B0550500928685E1F0E131D1D1E1E1D180950500D4B424166
          38291D211D18140F0E505008100002334863463D1F2B2E251D50500F0E0F0F0B
          543C2F4C525A371F1F50500707070703360E0B2D3F4E483D3650501111111401
          1C400A2A32245D60435050070707070807363B15125F67675450500E0E0E0E0E
          0E0B350C2F5C65616750500B0B0B0B0B0B0B23514D3A54656762500505050505
          0505052C4F47395964315034343434343434343650494A3E2720505050505050
          5050505050585716061B50505050505050505050505053170419}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnConfirmaAlteracaoClick
      end
      object btnRetornar: TSpeedButton
        Left = 646
        Top = 20
        Width = 225
        Height = 41
        Cursor = crHandPoint
        Hint = 'Clique Aqui para Retornar'
        Caption = 'Sair'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
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
        OnClick = btnRetornarClick
      end
      object btnCancelarAlteracao: TSpeedButton
        Left = 331
        Top = 20
        Width = 225
        Height = 41
        Cursor = crHandPoint
        Hint = 'Clique Aqui para Cancelar a Opera'#231#227'o'
        Caption = 'Cancelar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
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
        OnClick = btnCancelarAlteracaoClick
      end
    end
  end
  object pangrid_inclusao: TPanel
    Left = 0
    Top = 65
    Width = 1092
    Height = 513
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object grp1: TGroupBox
      Left = 106
      Top = 24
      Width = 890
      Height = 400
      Caption = 'INCLUS'#195'O'
      TabOrder = 1
      object lbl11: TLabel
        Left = 31
        Top = 23
        Width = 37
        Height = 13
        Caption = 'NOME'
      end
      object lbl13: TLabel
        Left = 31
        Top = 76
        Width = 69
        Height = 13
        Caption = 'ENDERECO'
      end
      object lbl14: TLabel
        Left = 31
        Top = 130
        Width = 48
        Height = 13
        Caption = 'BAIRRO'
      end
      object lbl16: TLabel
        Left = 31
        Top = 182
        Width = 38
        Height = 13
        Caption = 'EMAIL'
      end
      object lbl15: TLabel
        Left = 681
        Top = 130
        Width = 25
        Height = 13
        Caption = 'CEP'
      end
      object lbl12: TLabel
        Left = 682
        Top = 23
        Width = 54
        Height = 13
        Caption = 'APELIDO'
      end
      object lblFones: TLabel
        Left = 70
        Top = 295
        Width = 65
        Height = 13
        Caption = 'TELEFONE'
      end
      object Label15: TLabel
        Left = 31
        Top = 295
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label16: TLabel
        Left = 277
        Top = 295
        Width = 76
        Height = 13
        Caption = 'TELEFONE 2'
      end
      object Label17: TLabel
        Left = 239
        Top = 295
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label29: TLabel
        Left = 493
        Top = 295
        Width = 76
        Height = 13
        Caption = 'TELEFONE 3'
      end
      object Label30: TLabel
        Left = 455
        Top = 295
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label31: TLabel
        Left = 707
        Top = 295
        Width = 76
        Height = 13
        Caption = 'TELEFONE 4'
      end
      object Label32: TLabel
        Left = 669
        Top = 295
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label3: TLabel
        Left = 31
        Top = 235
        Width = 32
        Height = 13
        Caption = 'CNPJ'
      end
      object Label4: TLabel
        Left = 458
        Top = 235
        Width = 21
        Height = 13
        Caption = 'I.E.'
      end
      object Label12: TLabel
        Left = 31
        Top = 352
        Width = 92
        Height = 13
        Caption = 'OBSERVA'#199#213'ES'
      end
      object msk_cep: TMaskEdit
        Left = 681
        Top = 147
        Width = 175
        Height = 19
        Ctl3D = False
        EditMask = '#####-###;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 9
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        Text = '     -   '
        OnChange = msk_cepChange
        OnKeyPress = msk_cepKeyPress
      end
      object edt_nome: TEdit
        Left = 31
        Top = 39
        Width = 642
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnChange = edt_nomeChange
        OnExit = edt_nomeExit
      end
      object edt_apelido: TEdit
        Left = 682
        Top = 39
        Width = 175
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnEnter = edt_apelidoEnter
      end
      object edt_endereco: TEdit
        Left = 31
        Top = 92
        Width = 826
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object edt_complemento: TEdit
        Left = 31
        Top = 147
        Width = 642
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object edt_email: TEdit
        Left = 31
        Top = 200
        Width = 826
        Height = 19
        CharCase = ecLowerCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
      end
      object msk_Fone: TMaskEdit
        Left = 71
        Top = 314
        Width = 150
        Height = 19
        Ctl3D = False
        EditMask = '9999-9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 9
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
        Text = '    -    '
        OnChange = msk_FoneChange
        OnKeyDown = msk_FoneKeyDown
        OnKeyPress = msk_cepKeyPress
      end
      object edt_DataCadastro: TEdit
        Left = 176
        Top = 13
        Width = 73
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 17
        Visible = False
      end
      object edt_dddfone: TEdit
        Left = 31
        Top = 313
        Width = 33
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
        Text = '011'
        OnKeyPress = edt_dddfoneKeyPress
      end
      object msk_Fone2: TMaskEdit
        Left = 278
        Top = 314
        Width = 150
        Height = 19
        Ctl3D = False
        EditMask = '9999-9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 9
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 11
        Text = '    -    '
        OnChange = msk_Fone2Change
        OnKeyDown = msk_FoneKeyDown
        OnKeyPress = msk_cepKeyPress
      end
      object edt_dddfone2: TEdit
        Left = 239
        Top = 313
        Width = 33
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
        Text = '011'
        OnKeyPress = edt_dddfone2KeyPress
      end
      object msk_Fone3: TMaskEdit
        Left = 494
        Top = 314
        Width = 150
        Height = 19
        Ctl3D = False
        EditMask = '9999-9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 9
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 13
        Text = '    -    '
        OnChange = msk_Fone3Change
        OnKeyDown = msk_FoneKeyDown
        OnKeyPress = msk_cepKeyPress
      end
      object edt_dddfone3: TEdit
        Left = 455
        Top = 313
        Width = 32
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 12
        Text = '011'
        OnKeyPress = edt_dddfoneKeyPress
      end
      object msk_Fone4: TMaskEdit
        Left = 708
        Top = 314
        Width = 150
        Height = 19
        Ctl3D = False
        EditMask = '\99999-9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 15
        Text = '9    -    '
        OnChange = msk_Fone4Change
        OnKeyDown = msk_FoneKeyDown
        OnKeyPress = msk_cepKeyPress
      end
      object edt_dddfone4: TEdit
        Left = 669
        Top = 313
        Width = 33
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 14
        Text = '011'
        OnKeyPress = edt_dddfone2KeyPress
      end
      object msk_cnpj: TMaskEdit
        Left = 31
        Top = 251
        Width = 396
        Height = 22
        Ctl3D = False
        EditMask = '##.###.###/####-##;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 18
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        Text = '  .   .   /    -  '
        OnChange = msk_cnpjChange
        OnClick = msk_cnpjClick
        OnEnter = msk_cnpjEnter
      end
      object msk_ie: TMaskEdit
        Left = 457
        Top = 250
        Width = 400
        Height = 22
        Ctl3D = False
        EditMask = '###.###.###.###;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 15
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        Text = '   .   .   .   '
        OnChange = msk_ieChange
        OnClick = msk_ieClick
        OnEnter = msk_ieEnter
      end
      object edtIDAtual: TEdit
        Left = 80
        Top = 13
        Width = 73
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 18
        Visible = False
      end
      object edt_Obs: TEdit
        Left = 31
        Top = 368
        Width = 826
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 16
      end
    end
    object GroupBox1: TGroupBox
      Left = 106
      Top = 426
      Width = 890
      Height = 73
      TabOrder = 0
      object btnConfirmaInclusao: TSpeedButton
        Left = 16
        Top = 20
        Width = 220
        Height = 41
        Cursor = crHandPoint
        Hint = 'Clique Aqui para Confirmar '
        Caption = 'Gravar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFA09F9FA09F9FA09F9FA09F9FA09F9FA09F9FA09F9FA09F9FA09F9FA09F
          9FA09F9FA09F9FA09F9FA09F9FA09F9FA09F9FA09F9FA09F9FA09F9FA09F9FA0
          9F9FA09F9FA09F9FA09F9FA09F9FA09F9FA09F9FA09F9FFFFFFFFFFFFFFFFFFF
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000A09F9FA09F9FFFFFFF000000
          CF0000CF0000CF00000000009097909097909097909097909097909097909097
          9090979090979090979090979090979090979090979090979090979090979090
          9790909790909790000000CF0000CF0000CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00CF67FFCF67FFCF67FFCF67FFCF67FFCF67FF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FFFFFF90C8FF90C8FFFFFFFFFFFFFF000000CF67
          FFCF67FFCF67FFCF67FFCF67FFCF67FFCF67FFCF67FF000000FFFFFFFFFFFF90
          C8FF90C8FFFFFFFF000000FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF970000000090C8FF90C8FF90C8FF90C8FFFFFFFF000000CF67
          FFCF67FFCF67FFCF67FFCF67FFCF67FFCF67FFCF67FF000000FFFFFF90C8FF90
          C8FF90C8FF90C8FF000000FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF970000000090C8FF90C8FF90C8FF90C8FFFFFFFF0000000000
          00000000000000000000000000000000000000000000000000FFFFFF90C8FF90
          C8FF90C8FF90C8FF000000FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FFFFFF90C8FF90C8FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90
          C8FF90C8FFFFFFFF000000FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
          FF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFF
          FFFFFFFFFFFFFFFF000000FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
          FF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFF
          FFFFFFFFFFFFFFFF000000FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
          FF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFF
          FFFFFFFFFFFFFFFF000000FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700FF97000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000FF9700FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF97
          00FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF
          9700FF9700FF9700FF9700FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF97
          00FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF9700FF
          9700FF9700FF9700FF9700FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700FF97000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000FF9700FF
          9700FF9700FF9700FF9700FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FF9700FF9700FF9700000000CFC8CFCFC8CFCFC8
          CFCFC8CFCFC8CFCFC8CFCFC8CFCFC8CFCFC8CFCFC8CFCFC8CFCFC8CF000000FF
          9700FF9700FF9700FF9700FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FF9700FF9700FF9700000000CFC8CFCFC8CFCFC8
          CFCFC8CFCFC8CFCFC8CFCFC8CF000000000000000000000000CFC8CF000000FF
          9700FF9700FF9700FF9700FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FF9700FF9700FF9700000000CFC8CFCFC8CFCFC8
          CFCFC8CFCFC8CFCFC8CFCFC8CF000000FF9700FF9700000000CFC8CF000000FF
          9700FF9700FF9700FF9700FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FF9700FF9700FF9700000000CFC8CFCFC8CFCFC8
          CFCFC8CFCFC8CFCFC8CFCFC8CF000000FF9700FF9700000000CFC8CF000000FF
          9700FF9700FF9700FF9700FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FF9700FF9700FF9700000000CFC8CFCFC8CFCFC8
          CFCFC8CFCFC8CFCFC8CFCFC8CF000000FF9700FF9700000000CFC8CF000000FF
          9700FF9700FF9700FF9700FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FF9700FF9700FF9700000000CFC8CFCFC8CFCFC8
          CFCFC8CFCFC8CFCFC8CFCFC8CF000000FF9700FF9700000000CFC8CF000000FF
          9700FF9700FF9700FF9700FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FF9700FF9700FF9700000000CFC8CFCFC8CFCFC8
          CFCFC8CFCFC8CFCFC8CFCFC8CF000000FF9700FF9700000000CFC8CF000000FF
          9700FF9700FF9700FF9700FF9700FF9700CF0000000000A09F9FFFFFFF000000
          FFFF90FF9700FF9700000000FF9700FF9700FF9700000000CFC8CFCFC8CFCFC8
          CFCFC8CFCFC8CFCFC8CFCFC8CF000000000000000000000000CFC8CF000000FF
          FF90FF9700FF9700FF9700FF9700FF9700CF0000000000FFFFFFFFFFFF000000
          FFFF90FFFF90FFFF90000000FFFF90FFFF90FFFF90000000EFF8FFEFF8FFEFF8
          FFEFF8FFEFF8FFEFF8FFEFF8FFEFF8FFEFF8FFEFF8FFEFF8FFEFF8FF00000000
          0000FFFF90FFFF90FFFF90FFFF90FFFF90000000FFFFFFFFFFFFFFFFFFFFFFFF
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000000FF
          FFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnConfirmaInclusaoClick
      end
      object btnRetornar2: TSpeedButton
        Left = 657
        Top = 20
        Width = 220
        Height = 41
        Cursor = crHandPoint
        Hint = 'Clique Aqui para Retornar'
        Caption = 'Sair'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
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
        OnClick = btnRetornar2Click
      end
      object btnCancelarInclusaoForne: TSpeedButton
        Left = 336
        Top = 20
        Width = 220
        Height = 41
        Cursor = crHandPoint
        Hint = 'Clique Aqui para Cancelar a Opera'#231#227'o'
        Caption = 'Cancelar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
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
        OnClick = btnCancelarInclusaoForneClick
      end
    end
  end
  object pangrid_visualizacao: TPanel
    Left = 0
    Top = 65
    Width = 1092
    Height = 513
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object txtMsg: TStaticText
      Left = 11
      Top = 480
      Width = 1070
      Height = 21
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object grListaForne: TGroupBox
      Left = 11
      Top = 10
      Width = 370
      Height = 463
      TabOrder = 1
      object GroupBox9: TGroupBox
        Left = 10
        Top = 8
        Width = 351
        Height = 43
        TabOrder = 0
        object edtConsForne: TEdit
          Left = 8
          Top = 11
          Width = 334
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
          OnChange = edtConsForneChange
          OnKeyDown = edtConsForneKeyDown
          OnKeyPress = edtConsForneKeyPress
        end
      end
      object grid_Fornecedores: TDBGrid
        Left = 8
        Top = 57
        Width = 354
        Height = 392
        Cursor = crHandPoint
        Ctl3D = False
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgRowLines, dgAlwaysShowSelection]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = grid_FornecedoresCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'FORNE_NOME'
            Title.Alignment = taCenter
            Title.Caption = 'FORNECEDOR'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 325
            Visible = True
          end>
      end
    end
    object grDadosForne: TGroupBox
      Left = 384
      Top = 8
      Width = 697
      Height = 465
      Enabled = False
      TabOrder = 2
      object lbl1: TLabel
        Left = 103
        Top = 26
        Width = 37
        Height = 13
        Caption = 'NOME'
        FocusControl = dbedtFORNE_NOME
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl9: TLabel
        Left = 551
        Top = 27
        Width = 54
        Height = 13
        Caption = 'APELIDO'
        FocusControl = dbedtFORNE_APELIDO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl7: TLabel
        Left = 554
        Top = 347
        Width = 105
        Height = 13
        Caption = 'DATA CADASTRO'
        FocusControl = dbedtFORNE_DATACAD
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 19
        Top = 89
        Width = 69
        Height = 13
        Caption = 'ENDERE'#199'O'
        FocusControl = dbedtFORNE_ENDERECO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 555
        Top = 148
        Width = 25
        Height = 13
        Caption = 'CEP'
        FocusControl = dbedtFORNE_CEP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 72
        Top = 278
        Width = 76
        Height = 13
        Caption = 'TELEFONE 1'
        FocusControl = dbedtFORNE_COMPLEMENTO
      end
      object lbl5: TLabel
        Left = 19
        Top = 347
        Width = 38
        Height = 13
        Caption = 'EMAIL'
        FocusControl = dbedtFORNE_EMAIL
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl28: TLabel
        Left = 16
        Top = 26
        Width = 49
        Height = 13
        Caption = 'C'#211'DIGO'
        FocusControl = dbedtFORNE_ID
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFone: TLabel
        Left = 19
        Top = 150
        Width = 48
        Height = 13
        Caption = 'BAIRRO'
        FocusControl = dbedtFORNE_COMPLEMENTO
      end
      object Label9: TLabel
        Left = 18
        Top = 278
        Width = 28
        Height = 13
        Caption = 'DDD'
        FocusControl = dbedtFORNE_COMPLEMENTO
      end
      object Label10: TLabel
        Left = 241
        Top = 278
        Width = 76
        Height = 13
        Caption = 'TELEFONE 2'
        FocusControl = dbedtFORNE_COMPLEMENTO
      end
      object Label11: TLabel
        Left = 186
        Top = 278
        Width = 28
        Height = 13
        Caption = 'DDD'
        FocusControl = dbedtFORNE_COMPLEMENTO
      end
      object Label21: TLabel
        Left = 413
        Top = 278
        Width = 72
        Height = 13
        Caption = 'TELEFONE3'
        FocusControl = dbedtFORNE_COMPLEMENTO
      end
      object Label22: TLabel
        Left = 358
        Top = 278
        Width = 28
        Height = 13
        Caption = 'DDD'
        FocusControl = dbedtFORNE_COMPLEMENTO
      end
      object Label23: TLabel
        Left = 584
        Top = 278
        Width = 57
        Height = 13
        Caption = 'CELULAR'
        FocusControl = dbedtFORNE_COMPLEMENTO
      end
      object Label24: TLabel
        Left = 530
        Top = 278
        Width = 28
        Height = 13
        Caption = 'DDD'
        FocusControl = dbedtFORNE_COMPLEMENTO
      end
      object Label1: TLabel
        Left = 19
        Top = 213
        Width = 32
        Height = 13
        Caption = 'CNPJ'
        FocusControl = dbedtFORNE_CNPJ
      end
      object Label2: TLabel
        Left = 376
        Top = 212
        Width = 21
        Height = 13
        Caption = 'I.E.'
        FocusControl = dbedtFORNE_IE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 19
        Top = 413
        Width = 92
        Height = 13
        Caption = 'OBSERVA'#199#213'ES'
        FocusControl = dbedtFORNE_EMAIL
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedtFORNE_DATACAD: TDBEdit
        Left = 554
        Top = 366
        Width = 134
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_DATACAD'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedtFORNE_APELIDO: TDBEdit
        Left = 551
        Top = 46
        Width = 136
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_APELIDO'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedtFORNE_NOME: TDBEdit
        Left = 101
        Top = 46
        Width = 441
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_NOME'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object dbedtFORNE_ENDERECO: TDBEdit
        Left = 19
        Top = 109
        Width = 668
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_ENDERECO'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object dbedtFORNE_CEP: TDBEdit
        Left = 554
        Top = 167
        Width = 134
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_CEP'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object dbedtFORNE_COMPLEMENTO: TDBEdit
        Left = 19
        Top = 167
        Width = 524
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_COMPLEMENTO'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object dbedtFORNE_EMAIL: TDBEdit
        Left = 19
        Top = 366
        Width = 524
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_EMAIL'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object dbedtFORNE_ID: TDBEdit
        Left = 18
        Top = 46
        Width = 77
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_ID'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object dbedtFORNE_FONEDDD: TDBEdit
        Left = 17
        Top = 297
        Width = 50
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_DDDFONE'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 14
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object dbedtFORNE_FONE2: TDBEdit
        Left = 239
        Top = 297
        Width = 105
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_FONE2'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 14
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object dbedtFORNE_FONEDDD2: TDBEdit
        Left = 184
        Top = 297
        Width = 50
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_DDDFONE2'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 14
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object dbedtFORNE_FONE: TDBEdit
        Left = 70
        Top = 297
        Width = 105
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_FONE'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
      end
      object dbedtFORNE_FONEDDD3: TDBEdit
        Left = 355
        Top = 297
        Width = 50
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_DDDFONE3'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 14
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object dbedtFORNE_FONE4: TDBEdit
        Left = 583
        Top = 297
        Width = 105
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_FONE4'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 14
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object dbedtFORNE_FONEDDD4: TDBEdit
        Left = 527
        Top = 297
        Width = 50
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_DDDFONE4'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 14
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
      end
      object dbedtFORNE_FONE3: TDBEdit
        Left = 411
        Top = 297
        Width = 105
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_FONE3'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 14
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
      end
      object dbedtFORNE_CNPJ: TDBEdit
        Left = 19
        Top = 230
        Width = 310
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_CNPJ'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
      end
      object dbedtFORNE_IE: TDBEdit
        Left = 373
        Top = 230
        Width = 310
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_IE'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 17
      end
      object dbedtFORNE_OBS: TDBEdit
        Left = 20
        Top = 432
        Width = 668
        Height = 19
        Ctl3D = False
        DataField = 'FORNE_OBS'
        DataSource = dm_Conexao.ds_Fornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
      end
    end
  end
  object pan_titulo: TPanel
    Left = 0
    Top = 0
    Width = 1092
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Controle de Fornecedores - Visualizando...'
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
      Left = 979
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
      Left = 12
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
      Visible = False
    end
  end
  object pan_botoes: TPanel
    Left = 0
    Top = 578
    Width = 1092
    Height = 65
    Align = alBottom
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clMaroon
    TabOrder = 2
    object btnCadastros: TSpeedButton
      Left = 11
      Top = 12
      Width = 180
      Height = 35
      Cursor = crHandPoint
      Hint = 'Incluir Novos Fornecedores'
      Caption = 'Cadastrar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B00000001000069000000FFFFFF00F7FF
        FF00FFFEF100F9F8FD00FFFFDE00F7F7F900FFFFCC00F1F2F600F0F0EF00EDED
        E500EDEEDD00E6E6E600F5F7AA00DEDEE300DEDEDE00DBDAD700D4D4E400D7D7
        D700ECEC8C00D2D5DE00D3D3D100D9D9B000D8DB9C00EFDC8D00CCCCCC00E9E9
        6000C4C4D300E3E35700EED19000C6C5C300BBBBBB00B5B7BC00D6D64300B6B6
        B700B1B1C800B4B2AF00CBCD4A00B0AFAF00A6A6C500C3C35A00A4A4CC00C7B4
        8A00B9B97400A5A7AF00ADA5AD00A8A89E00A3A4A700A0A0A3009595C000ADAD
        6400B0B05300A3989D009C9C8D009E9E7A0094968C00A0968200978F81008A8A
        9500878797009797510085878B008686850081809A009999330087817300886E
        AE00656BC500837F78006D6DB5006769BC007A7A78008A8A3D007A7670007E80
        47007B7D4D006060B400727174007A7B4200837F280074753E00666666007972
        2B00645B4F007F584A0058585200393AAF003939A80065553800614C51004F4F
        46006A5523002D2DAD0047474A004F4F27002B2AA70053530E004A3B18004141
        000035352B0045381B003C3C10003B3B0000361C520033330000000099000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000505050505050
        50505050505050505050501A44222630141414141414141405505010565B5545
        0E0E0E0E0E0B0B0B0550500928685E1F0E131D1D1E1E1D180950500D4B424166
        38291D211D18140F0E505008100002334863463D1F2B2E251D50500F0E0F0F0B
        543C2F4C525A371F1F50500707070703360E0B2D3F4E483D3650501111111401
        1C400A2A32245D60435050070707070807363B15125F67675450500E0E0E0E0E
        0E0B350C2F5C65616750500B0B0B0B0B0B0B23514D3A54656762500505050505
        0505052C4F47395964315034343434343434343650494A3E2720505050505050
        5050505050585716061B50505050505050505050505053170419}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCadastrosClick
    end
    object btnAlterar: TSpeedButton
      Left = 232
      Top = 12
      Width = 180
      Height = 35
      Cursor = crHandPoint
      Hint = 'Alterar Dados dos Fornecedores'
      Caption = 'Alterar'
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00111111111111
        11111111111111111111100000000000000177777777777777017FB700B8B8B8
        B7017F87E077778B87017FB777B80008B7017F8B8B83B87087017FB700B3B070
        B7017F87E0773B3087017FB777B833B8B7017FFFFFFFFFFFF7017B8B8B8B7777
        771117B8B8B71111111111777771111111111111111111111111}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAlterarClick
    end
    object btnInativar: TSpeedButton
      Left = 453
      Top = 12
      Width = 180
      Height = 35
      Cursor = crHandPoint
      Hint = 'Inativar Fornecedores'
      Caption = 'Inativar'
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
      OnClick = btnInativarClick
    end
    object btnSair: TSpeedButton
      Left = 896
      Top = 12
      Width = 180
      Height = 35
      Cursor = crHandPoint
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
    object btnimprimir: TSpeedButton
      Left = 674
      Top = 12
      Width = 180
      Height = 35
      Cursor = crHandPoint
      Hint = 'Imprimir Fornecedores'
      Caption = 'Relat'#243'rios'
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
      OnClick = btnimprimirClick
    end
    object lstEscolheTipoRel: TListBox
      Left = 194
      Top = 12
      Width = 33
      Height = 35
      Cursor = crHandPoint
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      Items.Strings = (
        'RELAT'#211'RIO   DE  TODOS  OS  FORNECEDORES'
        'RELAT'#211'RIO   DO  FORNECEDOR SELECIONADO')
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnClick = lstEscolheTipoRelClick
    end
  end
end
