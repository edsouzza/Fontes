object _frmFuncionarios: T_frmFuncionarios
  Left = 508
  Top = 236
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Controle de Funcion'#225'rios'
  ClientHeight = 569
  ClientWidth = 874
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001000800680500001600000028000000100000002000
    0000010008000000000000000000000000000000000000000000000000000000
    000001010100FFFFFF000000FF00800000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0004000000010000000000010000000000040400000100000101010000000000
    0404040400000101020201000000000404040404040000010201010100000404
    0404040400000101020202020100040400040400000101010102020201000400
    0004000000010101020202020201040000000000000101010202020101020400
    0000000000010101010102020102000400000000000101010101010102010000
    0000000000000101010101010101000000000000000000010101010100000000
    000000000000000000000000010000000000000000000000000000000000FFFF
    0000FFFF0000EEFB0000E6C70000C30700008183000003010000260100006E00
    00007E0000007E000000BE000000FF000000FF830000FFFD0000FFFF0000}
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_alteracao: TPanel
    Left = 0
    Top = 65
    Width = 874
    Height = 437
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
    object grp2: TGroupBox
      Left = 47
      Top = 17
      Width = 777
      Height = 325
      Caption = 'ALTERA'#199#213'ES'
      TabOrder = 1
      object lbl10: TLabel
        Left = 24
        Top = 34
        Width = 37
        Height = 13
        Caption = 'NOME'
        FocusControl = dbedtFUNC_NOME
      end
      object lbl20: TLabel
        Left = 24
        Top = 99
        Width = 69
        Height = 13
        Caption = 'ENDERECO'
        FocusControl = dbedtFUNC_ENDERECO1
      end
      object lbl21: TLabel
        Left = 402
        Top = 99
        Width = 48
        Height = 13
        Caption = 'BAIRRO'
        FocusControl = dbedtFUNC_COMPLEMENTO1
      end
      object lbl22: TLabel
        Left = 24
        Top = 271
        Width = 140
        Height = 13
        Caption = 'DATA DE NASCIMENTO'
      end
      object lbl23: TLabel
        Left = 542
        Top = 271
        Width = 127
        Height = 13
        Caption = 'DATA DO CADASTRO'
      end
      object lbl24: TLabel
        Left = 282
        Top = 271
        Width = 50
        Height = 13
        Caption = 'STATUS'
      end
      object lbl25: TLabel
        Left = 26
        Top = 162
        Width = 38
        Height = 13
        Caption = 'EMAIL'
        FocusControl = dbedtFUNC_EMAIL1
      end
      object lbl26: TLabel
        Left = 301
        Top = 99
        Width = 25
        Height = 13
        Caption = 'CEP'
      end
      object lbl34: TLabel
        Left = 404
        Top = 163
        Width = 111
        Height = 13
        Caption = 'N'#205'VEL DE ACESSO'
      end
      object lbl51: TLabel
        Left = 587
        Top = 34
        Width = 57
        Height = 13
        Caption = 'USU'#193'RIO'
      end
      object Label26: TLabel
        Left = 261
        Top = 211
        Width = 76
        Height = 13
        Caption = 'TELEFONE 2'
      end
      object Label27: TLabel
        Left = 223
        Top = 211
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label29: TLabel
        Left = 448
        Top = 211
        Width = 76
        Height = 13
        Caption = 'TELEFONE 3'
      end
      object Label28: TLabel
        Left = 410
        Top = 211
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label31: TLabel
        Left = 652
        Top = 211
        Width = 57
        Height = 13
        Caption = 'CELULAR'
      end
      object Label33: TLabel
        Left = 614
        Top = 211
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label34: TLabel
        Left = 66
        Top = 211
        Width = 69
        Height = 13
        Caption = 'TELEFONE '
      end
      object Label35: TLabel
        Left = 28
        Top = 211
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object dbedtFUNC_NOME: TDBEdit
        Left = 24
        Top = 50
        Width = 545
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'FUNC_NOME'
        DataSource = dm_Conexao.ds_DadosFuncionarios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnChange = dbedtFUNC_NOMEChange
        OnExit = dbedtFUNC_NOMEExit
      end
      object dbedtFUNC_ENDERECO1: TDBEdit
        Left = 24
        Top = 115
        Width = 265
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'FUNC_ENDERECO'
        DataSource = dm_Conexao.ds_DadosFuncionarios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnChange = dbedtFUNC_ENDERECO1Change
      end
      object dbedtFUNC_COMPLEMENTO1: TDBEdit
        Left = 402
        Top = 115
        Width = 356
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'FUNC_COMPLEMENTO'
        DataSource = dm_Conexao.ds_DadosFuncionarios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnChange = msk_cep2Change
      end
      object dbedtFUNC_EMAIL1: TDBEdit
        Left = 24
        Top = 178
        Width = 361
        Height = 19
        Hint = 'Digite tudo em letras min'#250'sculas'
        CharCase = ecLowerCase
        Ctl3D = False
        DataField = 'FUNC_EMAIL'
        DataSource = dm_Conexao.ds_DadosFuncionarios
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
        OnChange = msk_cep2Change
      end
      object dbedtFUNC_DATACAD2: TDBEdit
        Left = 542
        Top = 286
        Width = 220
        Height = 19
        Hint = 'Este campo n'#227'o pode ser alterado'
        CharCase = ecLowerCase
        Ctl3D = False
        DataField = 'FUNC_DATACAD'
        DataSource = dm_Conexao.ds_DadosFuncionarios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 17
      end
      object msk_cep2: TMaskEdit
        Left = 300
        Top = 114
        Width = 85
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
        TabOrder = 3
        Text = '     -   '
        OnChange = msk_cep2Change
        OnKeyPress = msk_cep2KeyPress
      end
      object combo_Altera_Status: TComboBox
        Left = 281
        Top = 286
        Width = 220
        Height = 21
        Hint = 'A=Ativo    I=Inativo'
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
        Text = 'A'
        OnChange = combo_Altera_StatusChange
        Items.Strings = (
          'A'
          'I')
      end
      object dbFUNC_FUNCAOID: TDBLookupComboBox
        Left = 402
        Top = 179
        Width = 358
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnClick = dbFUNC_FUNCAOIDClick
      end
      object db_FUNC_ID: TDBEdit
        Left = 248
        Top = 25
        Width = 137
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FUNC_ID'
        DataSource = dm_Conexao.ds_DadosFuncionarios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
        Visible = False
        OnChange = msk_cep2Change
        OnKeyPress = msk_cep2KeyPress
      end
      object db_FUNCAOID: TDBEdit
        Left = 656
        Top = 154
        Width = 105
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
        ParentShowHint = False
        ShowHint = True
        TabOrder = 19
        Visible = False
        OnChange = msk_cep2Change
        OnKeyPress = msk_cep2KeyPress
      end
      object edt_UsuarioParaAlteracao: TEdit
        Left = 586
        Top = 50
        Width = 170
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
        OnChange = edt_UsuarioParaAlteracaoChange
      end
      object msk_dtNasc: TDBDateEdit
        Left = 24
        Top = 286
        Width = 220
        Height = 21
        DataField = 'FUNC_DATANASCTO'
        DataSource = dm_Conexao.ds_DadosFuncionarios
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 15
        OnButtonClick = msk_dtNascButtonClick
        OnChange = msk_dtNascChange
      end
      object msk_tel2: TMaskEdit
        Left = 262
        Top = 232
        Width = 107
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
        TabOrder = 10
        Text = '    -    '
        OnKeyPress = msk_cepKeyPress
      end
      object msk_tel3: TMaskEdit
        Left = 449
        Top = 232
        Width = 109
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
        TabOrder = 12
        Text = '    -    '
        OnKeyPress = msk_cepKeyPress
      end
      object msk_tel4: TMaskEdit
        Left = 653
        Top = 232
        Width = 108
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
        TabOrder = 14
        Text = '9    -    '
        OnKeyPress = msk_cepKeyPress
      end
      object msk_tel: TMaskEdit
        Left = 67
        Top = 232
        Width = 110
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
        TabOrder = 8
        Text = '    -    '
        OnKeyPress = msk_cepKeyPress
      end
      object DBEdit7: TDBEdit
        Left = 28
        Top = 232
        Width = 31
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'FUNC_DDDFONE'
        DataSource = dm_Conexao.ds_DadosFuncionarios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnChange = msk_cep2Change
        OnKeyPress = msk_cep2KeyPress
      end
      object DBEdit8: TDBEdit
        Left = 614
        Top = 232
        Width = 31
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'FUNC_DDDFONE4'
        DataSource = dm_Conexao.ds_DadosFuncionarios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        OnChange = msk_cep2Change
        OnKeyPress = msk_cep2KeyPress
      end
      object DBEdit9: TDBEdit
        Left = 410
        Top = 232
        Width = 31
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'FUNC_DDDFONE3'
        DataSource = dm_Conexao.ds_DadosFuncionarios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnChange = msk_cep2Change
        OnKeyPress = msk_cep2KeyPress
      end
      object DBEdit10: TDBEdit
        Left = 221
        Top = 232
        Width = 31
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'FUNC_DDDFONE2'
        DataSource = dm_Conexao.ds_DadosFuncionarios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnChange = msk_cep2Change
        OnKeyPress = msk_cep2KeyPress
      end
    end
    object grp3: TGroupBox
      Left = 46
      Top = 353
      Width = 778
      Height = 63
      TabOrder = 0
      object btnConfirmaAlteracao: TSpeedButton
        Left = 27
        Top = 16
        Width = 185
        Height = 41
        Cursor = crHandPoint
        Hint = 'Clique Aqui para Confirmar '
        Caption = 'Confirmar Altera'#231#227'o'
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
      object btnRetornarDaAlteracao: TSpeedButton
        Left = 569
        Top = 16
        Width = 185
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
        OnClick = btnRetornarDaAlteracaoClick
      end
      object btnCancelarAlteracao: TSpeedButton
        Left = 295
        Top = 16
        Width = 185
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
  object pnl_inclusao: TPanel
    Left = 0
    Top = 65
    Width = 874
    Height = 437
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
    TabOrder = 2
    object grp_DadosDoFunc: TGroupBox
      Left = 36
      Top = 24
      Width = 804
      Height = 309
      Caption = 'INCLUS'#213'ES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object lbl11: TLabel
        Left = 27
        Top = 19
        Width = 37
        Height = 13
        Caption = 'NOME'
      end
      object lbl13: TLabel
        Left = 27
        Top = 88
        Width = 69
        Height = 13
        Caption = 'ENDERECO'
      end
      object lbl14: TLabel
        Left = 531
        Top = 87
        Width = 48
        Height = 13
        Caption = 'BAIRRO'
      end
      object lbl17: TLabel
        Left = 27
        Top = 252
        Width = 119
        Height = 13
        Caption = 'DATA NASCIMENTO'
      end
      object lbl18: TLabel
        Left = 588
        Top = 252
        Width = 127
        Height = 13
        Caption = 'DATA DO CADASTRO'
      end
      object lbl15: TLabel
        Left = 364
        Top = 88
        Width = 25
        Height = 13
        Caption = 'CEP'
      end
      object lbl35: TLabel
        Left = 309
        Top = 252
        Width = 111
        Height = 13
        Caption = 'N'#205'VEL DE ACESSO'
      end
      object lbl50: TLabel
        Left = 617
        Top = 19
        Width = 57
        Height = 13
        Caption = 'USU'#193'RIO'
      end
      object lbl16: TLabel
        Left = 533
        Top = 170
        Width = 38
        Height = 13
        Caption = 'EMAIL'
      end
      object lblFones: TLabel
        Left = 74
        Top = 170
        Width = 65
        Height = 13
        Caption = 'TELEFONE'
      end
      object Label21: TLabel
        Left = 32
        Top = 171
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label22: TLabel
        Left = 154
        Top = 171
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label30: TLabel
        Left = 272
        Top = 171
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label32: TLabel
        Left = 390
        Top = 171
        Width = 28
        Height = 13
        Caption = 'DDD'
      end
      object Label23: TLabel
        Left = 189
        Top = 170
        Width = 72
        Height = 13
        Caption = 'TELEFONE2'
      end
      object Label24: TLabel
        Left = 310
        Top = 170
        Width = 72
        Height = 13
        Caption = 'TELEFONE3'
      end
      object Label25: TLabel
        Left = 427
        Top = 170
        Width = 57
        Height = 13
        Caption = 'CELULAR'
      end
      object msk_cep: TMaskEdit
        Left = 364
        Top = 110
        Width = 157
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
        TabOrder = 3
        Text = '     -   '
        OnChange = msk_cepChange
        OnKeyPress = msk_cepKeyPress
      end
      object edt_nome: TEdit
        Left = 27
        Top = 43
        Width = 582
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
        OnEnter = edt_nomeEnter
        OnExit = edt_nomeExit
      end
      object edt_endereco: TEdit
        Left = 27
        Top = 111
        Width = 326
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
        Left = 531
        Top = 107
        Width = 243
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
        TabOrder = 4
      end
      object edt_DataCadastro: TEdit
        Left = 586
        Top = 271
        Width = 183
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
      end
      object db_Mostra_Funcao: TDBLookupComboBox
        Left = 307
        Top = 271
        Width = 249
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 15
      end
      object edt_IncluirUsuario: TEdit
        Left = 617
        Top = 43
        Width = 157
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
        OnEnter = edt_IncluirUsuarioEnter
        OnExit = edt_IncluirUsuarioExit
      end
      object msk_DataNascto: TDateEdit
        Left = 28
        Top = 271
        Width = 249
        Height = 21
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 14
      end
      object edt_email: TEdit
        Left = 532
        Top = 187
        Width = 239
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
        TabOrder = 13
      end
      object msk_Fone: TMaskEdit
        Left = 69
        Top = 188
        Width = 70
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
        TabOrder = 6
        Text = '    -    '
        OnChange = msk_FoneChange
        OnKeyPress = msk_cepKeyPress
      end
      object edt_dddfone: TEdit
        Left = 32
        Top = 189
        Width = 30
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
        TabOrder = 5
        Text = '011'
      end
      object edt_dddfone2: TEdit
        Left = 152
        Top = 189
        Width = 30
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
        TabOrder = 7
        Text = '011'
      end
      object edt_dddfone3: TEdit
        Left = 272
        Top = 189
        Width = 29
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
        TabOrder = 9
        Text = '011'
      end
      object edt_dddfone4: TEdit
        Left = 390
        Top = 189
        Width = 30
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
        TabOrder = 11
        Text = '011'
      end
      object msk_Fone2: TMaskEdit
        Left = 188
        Top = 188
        Width = 71
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
        TabOrder = 8
        Text = '    -    '
        OnChange = msk_Fone2Change
        OnKeyPress = msk_cepKeyPress
      end
      object msk_Fone3: TMaskEdit
        Left = 308
        Top = 188
        Width = 72
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
        TabOrder = 10
        Text = '    -    '
        OnChange = msk_Fone3Change
        OnKeyPress = msk_cepKeyPress
      end
      object msk_Fone4: TMaskEdit
        Left = 428
        Top = 188
        Width = 93
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
        TabOrder = 12
        Text = '9    -    '
        OnChange = msk_Fone4Change
        OnKeyPress = msk_cepKeyPress
      end
    end
    object grp4: TGroupBox
      Left = 36
      Top = 338
      Width = 804
      Height = 73
      TabOrder = 0
      object btnConfirmaInclusao: TSpeedButton
        Left = 6
        Top = 20
        Width = 130
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
      object btnRetornarDaInclusao: TSpeedButton
        Left = 666
        Top = 20
        Width = 130
        Height = 41
        Cursor = crHandPoint
        Hint = 'Clique Aqui para Retornar a Tela Principal'
        Caption = 'Retornar'
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
        OnClick = btnRetornarDaInclusaoClick
      end
      object btnCancelarInclusao: TSpeedButton
        Left = 336
        Top = 20
        Width = 130
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
        OnClick = btnCancelarInclusaoClick
      end
    end
  end
  object pnl_visualizacao: TPanel
    Left = 0
    Top = 65
    Width = 874
    Height = 437
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
    TabOrder = 4
    object lbl1: TLabel
      Left = 344
      Top = 23
      Width = 37
      Height = 13
      Caption = 'NOME'
      FocusControl = dbedtFUNC_NOME1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl9: TLabel
      Left = 687
      Top = 23
      Width = 57
      Height = 13
      Caption = 'USU'#193'RIO'
      FocusControl = dbedtFUNC_APELIDO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl7: TLabel
      Left = 342
      Top = 358
      Width = 105
      Height = 13
      Caption = 'DATA CADASTRO'
      FocusControl = dbedtFUNC_DATACAD
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 344
      Top = 93
      Width = 69
      Height = 13
      Caption = 'ENDERE'#199'O'
      FocusControl = dbedtFUNC_ENDERECO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl6: TLabel
      Left = 515
      Top = 357
      Width = 119
      Height = 13
      Caption = 'DATA NASCIMENTO'
      FocusControl = dbedtFUNC_DATANASCTO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 686
      Top = 356
      Width = 25
      Height = 13
      Caption = 'CEP'
      FocusControl = dbedtFUNC_CEP
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 344
      Top = 282
      Width = 38
      Height = 13
      Caption = 'EMAIL'
      FocusControl = dbedtFUNC_EMAIL
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl28: TLabel
      Left = 685
      Top = 93
      Width = 49
      Height = 13
      Caption = 'C'#211'DIGO'
      FocusControl = dbedtFUNC_ID
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFone: TLabel
      Left = 344
      Top = 157
      Width = 210
      Height = 13
      Caption = 'COMPLEMENTOS E OBSERVA'#199#213'ES'
      FocusControl = dbedtFUNC_COMPLEMENTO
    end
    object Label1: TLabel
      Left = 381
      Top = 221
      Width = 65
      Height = 13
      Caption = 'TELEFONE'
      FocusControl = dbedtFUNC_COMPLEMENTO
    end
    object Label2: TLabel
      Left = 345
      Top = 221
      Width = 28
      Height = 13
      Caption = 'DDD'
    end
    object Label3: TLabel
      Left = 512
      Top = 221
      Width = 65
      Height = 13
      Caption = 'TELEFONE'
      FocusControl = dbedtFUNC_COMPLEMENTO
    end
    object Label4: TLabel
      Left = 476
      Top = 221
      Width = 28
      Height = 13
      Caption = 'DDD'
    end
    object Label17: TLabel
      Left = 642
      Top = 221
      Width = 65
      Height = 13
      Caption = 'TELEFONE'
      FocusControl = dbedtFUNC_COMPLEMENTO
    end
    object Label18: TLabel
      Left = 606
      Top = 221
      Width = 28
      Height = 13
      Caption = 'DDD'
    end
    object Label19: TLabel
      Left = 768
      Top = 221
      Width = 57
      Height = 13
      Caption = 'CELULAR'
      FocusControl = dbedtFUNC_COMPLEMENTO
    end
    object Label20: TLabel
      Left = 732
      Top = 221
      Width = 28
      Height = 13
      Caption = 'DDD'
    end
    object dbgrd_Funcionarios: TDBGrid
      Left = 20
      Top = 48
      Width = 304
      Height = 353
      Cursor = crHandPoint
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgRowLines, dgAlwaysShowSelection]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = dbgrd_FuncionariosCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'FUNC_NOME'
          Title.Caption = 'FUNCION'#193'RIOS'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 280
          Visible = True
        end>
    end
    object dbedtFUNC_DATACAD: TDBEdit
      Left = 342
      Top = 379
      Width = 155
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_DATACAD'
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
    object dbedtFUNC_APELIDO: TDBEdit
      Left = 686
      Top = 43
      Width = 162
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_APELIDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbedtFUNC_NOME1: TDBEdit
      Left = 344
      Top = 43
      Width = 321
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_NOME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object dbedtFUNC_ENDERECO: TDBEdit
      Left = 344
      Top = 113
      Width = 321
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_ENDERECO'
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
    object dbedtFUNC_DATANASCTO: TDBEdit
      Left = 512
      Top = 379
      Width = 155
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_DATANASCTO'
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
    object dbedtFUNC_CEP: TDBEdit
      Left = 685
      Top = 379
      Width = 162
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_CEP'
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
    object dbedtFUNC_COMPLEMENTO: TDBEdit
      Left = 344
      Top = 174
      Width = 502
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_COMPLEMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object dbedtFUNC_EMAIL: TDBEdit
      Left = 344
      Top = 302
      Width = 501
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_EMAIL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object dbedtFUNC_ID: TDBEdit
      Left = 685
      Top = 114
      Width = 162
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object dbedtFUNC_FONE: TDBEdit
      Left = 381
      Top = 238
      Width = 76
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_FONE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object dbedtDDD_FONE: TDBEdit
      Left = 344
      Top = 238
      Width = 30
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_DDDFONE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 14
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object dbedtFUNC_FONE2: TDBEdit
      Left = 512
      Top = 238
      Width = 76
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_FONE2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object dbedtDDD_FONE2: TDBEdit
      Left = 475
      Top = 238
      Width = 30
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_DDDFONE2'
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
    object dbedtFUNC_FONE3: TDBEdit
      Left = 642
      Top = 238
      Width = 76
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_FONE3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 14
    end
    object dbedtDDD_FONE3: TDBEdit
      Left = 605
      Top = 238
      Width = 30
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_DDDFONE3'
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
    object dbedtFUNC_FONE4: TDBEdit
      Left = 768
      Top = 238
      Width = 76
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_FONE4'
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
    object dbedtDDD_FONE4: TDBEdit
      Left = 731
      Top = 238
      Width = 30
      Height = 19
      Ctl3D = False
      DataField = 'FUNC_DDDFONE4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 14
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
    end
    object GroupBox9: TGroupBox
      Left = 21
      Top = 8
      Width = 302
      Height = 37
      TabOrder = 18
      object edtConsFunc: TEdit
        Left = 6
        Top = 11
        Width = 290
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
        OnChange = edtConsFuncChange
        OnKeyDown = edtConsFuncKeyDown
      end
    end
    object txtMsg: TStaticText
      Left = 19
      Top = 405
      Width = 828
      Height = 21
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 19
    end
  end
  object pan_botoes: TPanel
    Left = 0
    Top = 502
    Width = 874
    Height = 67
    Align = alBottom
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clMaroon
    TabOrder = 1
    object btnCadastros: TSpeedButton
      Left = 8
      Top = 14
      Width = 137
      Height = 35
      Cursor = crHandPoint
      Hint = 'Incluir Novos Funcion'#225'rios'
      Caption = 'Cadastrar'
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
      OnClick = btnCadastrosClick
    end
    object btnAlterar: TSpeedButton
      Left = 151
      Top = 14
      Width = 133
      Height = 35
      Cursor = crHandPoint
      Hint = 'Alterar Dados dos Funcion'#225'rios'
      Caption = 'Alterar'
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
      OnClick = btnAlterarClick
    end
    object btnInativar: TSpeedButton
      Left = 294
      Top = 14
      Width = 137
      Height = 35
      Cursor = crHandPoint
      Hint = 'Inativar Funcion'#225'rios'
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
      Left = 724
      Top = 14
      Width = 137
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
      Left = 580
      Top = 14
      Width = 137
      Height = 35
      Cursor = crHandPoint
      Hint = 'Imprimir Funcion'#225'rios'
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
    object btnSenhas: TSpeedButton
      Left = 437
      Top = 14
      Width = 133
      Height = 35
      Cursor = crHandPoint
      Hint = 'Alterar senha dos Funcion'#225'rios'
      Caption = 'Senhas'
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        7E010000424D7E01000000000000760000002800000018000000160000000100
        0400000000000801000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
        0000000000080777777777777777777777700F77777777777777777777700F88
        888888888888888887700F88888888888888888887700F888888888888888888
        87700F88888888888888888887700F88888888888888888887700F8888888888
        8008008887700F88870088888008008887700F88707008888008008887700F88
        008800000000000887700F88008800000000000887700F887070088888888888
        87700F88870088888888888887700F88888888888888888887700F8888888888
        8888888887700F88888888888888888887700F88888888888888888887700F88
        888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
        0008}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSenhasClick
    end
    object pnl_Periodo: TPanel
      Left = 6
      Top = 38
      Width = 854
      Height = 51
      Color = clMaroon
      TabOrder = 1
      Visible = False
      object lbl52: TLabel
        Left = 26
        Top = 18
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
      object lbl53: TLabel
        Left = 336
        Top = 18
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
      object btnFechar: TSpeedButton
        Left = 726
        Top = 5
        Width = 123
        Height = 40
        Caption = 'Sair'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
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
        OnClick = btnFecharClick
      end
      object btnPesquisar: TSpeedButton
        Left = 590
        Top = 6
        Width = 123
        Height = 40
        Cursor = crHandPoint
        Caption = 'Pesquisar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F0000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFF000FFFFF000FFC0C0FFFF
          FFF080FFFFF080FFC0C0FFFFFFF0007FFF7000FFC0C0FFFFFFF00000000000FF
          C0C0FF0000008000080000FFC0C0FF0FFFF08000080000FFC0C0FF0F00F00000
          000000FFC0C0FF0FFFFF0000F0000FFFC0C0FF0CCCCCC00CCC00FFFFC0C0FFFC
          FFFFF00FFF00FFFFC0C0FFFCF00F00080F00FFFFC0C0FFFCFFFFFFFFFFCFFFFF
          C0C0FFFCCCCCCCCCCCCFFFFFC0C0FFFC8CC8CC8CC8CFFFFFC0C0FFFCCCCCCCCC
          CCCFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
          FFFFFFFFFFFFFFFFC0C0}
        ParentFont = False
        OnClick = btnPesquisarClick
      end
      object edt_DataInicio: TDateEdit
        Left = 102
        Top = 13
        Width = 162
        Height = 22
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
      end
      object edt_DataFim: TDateEdit
        Left = 399
        Top = 13
        Width = 162
        Height = 22
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
        OnKeyDown = edt_DataFimKeyDown
      end
    end
    object lstEscolheTipoRel: TListBox
      Left = 720
      Top = 43
      Width = 201
      Height = 38
      Cursor = crHandPoint
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      Items.Strings = (
        'RELAT'#211'RIO   DE  TODOS  OS  FUNCION'#193'RIOS'
        'RELAT'#211'RIO DO FUNCION'#193'RIO SELECIONADO'
        'RELAT'#211'RIO DE ACESSOS DOS FUNCION'#193'ROS')
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnClick = lstEscolheTipoRelClick
    end
  end
  object pan_titulo: TPanel
    Left = 0
    Top = 0
    Width = 874
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Controle de Funcion'#225'rios - Visualizando...'
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
    object lbl49: TLabel
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
end
