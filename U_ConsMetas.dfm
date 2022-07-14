object _frmConsMetas: T_frmConsMetas
  Left = 348
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Metas'
  ClientHeight = 535
  ClientWidth = 870
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
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pangrid_atendimentos: TPanel
    Left = 0
    Top = 65
    Width = 873
    Height = 400
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
    object gridMetas: TDBGrid
      Left = 6
      Top = 6
      Width = 857
      Height = 384
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = gridMetasDrawColumnCell
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTINICIAL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'DATA INICIAL'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Times New Roman'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTFINAL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'DATA FINAL'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Times New Roman'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_ABERTURAMETA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'ABERTURA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Times New Roman'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_FECHAMENTOMETA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'FECHAMENTO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Times New Roman'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RESULTADO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Title.Caption = 'STATUS'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Times New Roman'
          Title.Font.Style = [fsBold]
          Width = 350
          Visible = True
        end>
    end
  end
  object pan_titulo: TPanel
    Left = 0
    Top = 0
    Width = 870
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Caption = 'Relat'#243'rios de Metas'
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lblDataDoDia: TLabel
      Left = 760
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
    Top = 465
    Width = 870
    Height = 70
    Align = alBottom
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = clMaroon
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 756
      Top = 10
      Width = 102
      Height = 45
      TabOrder = 0
      object btnFechar: TSpeedButton
        Left = 1
        Top = 6
        Width = 102
        Height = 38
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
    end
    object grPeriodo: TGroupBox
      Left = 8
      Top = 7
      Width = 422
      Height = 49
      Caption = 'Per'#237'odo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object lbl52: TLabel
        Left = 11
        Top = 22
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
        Left = 225
        Top = 22
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
        Left = 85
        Top = 17
        Width = 120
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
        OnChange = edt_DataInicioChange
      end
      object edt_DataFim: TDateEdit
        Left = 288
        Top = 17
        Width = 120
        Height = 22
        DefaultToday = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
        OnButtonClick = edt_DataFimButtonClick
      end
    end
    object grMes: TGroupBox
      Left = 434
      Top = 7
      Width = 214
      Height = 49
      Caption = 'M'#234's'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object cmbMeses: TComboBox
        Left = 21
        Top = 18
        Width = 84
        Height = 21
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = 'JAN'
        OnClick = cmbMesesClick
        Items.Strings = (
          'JAN'
          'FEV'
          'MAR'
          'ABR'
          'MAI'
          'JUN'
          'JUL'
          'AGO'
          'SET'
          'OUT'
          'NOV'
          'DEZ')
      end
      object cmbAnos: TComboBox
        Left = 112
        Top = 18
        Width = 84
        Height = 21
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnClick = cmbAnosClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 651
      Top = 10
      Width = 102
      Height = 45
      TabOrder = 3
      object btnPesquisar: TSpeedButton
        Left = 1
        Top = 6
        Width = 102
        Height = 38
        Caption = 'Pesquisar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B000000010000720000000C10B500D0D1
          E9007F7E7800484845003C42B7005154D600767BE10041413E00F1F1F2005154
          C6008184CE00BCBDDF004043CF00272AC8008D8D9C00A7A8CE004848FF009FA1
          E600E2E2E3002528B90060605B00FDFDF2006B71F400A7A69E00D6D6F300C9CA
          F20094948D003337DA001418C500AEAEC5009094E700686DC100292DCC00F3F3
          EA00666BD9005959540074747D00BAA8FD009495C1009999FF00D6D6EF001619
          B600DEDFF7008E90D700AEAEBF002125CC008E8E8700383BCF002A33E100DCC4
          FF000E12BB00F9F8F900787BF500FFFFFF00BEBFD700AFA6FF008686EB001F23
          C400E5E5FA00999999003333CC003339C4005C62DD00EEEEF500999AD800CCCC
          FF007B71FF001B1FC600C5C5DE00CFCFEE001118B800363AE500AEAEA5008C8C
          950051514E0099999900434340002A31C700FAF6FF00DFE0F2000117BC007F81
          D6006F74D8006A6EC900595BC6003C40DF001519D000FFF7ED001921BD00FFFB
          F6005C5B5700DBDBFF002327CC00FFF7F7002129C800EDEEFF001115C000E4E2
          EF00666666003A42CE002C30CB00CED6E6004A4A49007A7EDF004E52FD002327
          BE00A6A5A300686BD700A898FB009496D3009FA2D400D5CDFE006E72C700FFFF
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
          0000000000000000000000000000000000000000000000000000717171713B23
          070707070762487171717171711A4418181818181D665A1A717171712C183312
          6E6D0B21081824233B7171714F590A29044069136E591862147171185954321C
          26355260000A5918030201332B323C20636B0D6464460B3A0E4A18333D0D3C5C
          532A2F5C3C58095944071818393C3C2D1F351E6064646408180718195C3C3C64
          390F35674364643F284C283A1B1B0D0D436044350C2D2F334523283516307061
          0550513522560635362E013F5B103E573511591555475F4F49717128356F4238
          4F214F34684135451771717128353531256C27374E35286A7171717171286133
          353535354F457171717171717171714545454545717171717171}
        ParentFont = False
        OnClick = btnPesquisarClick
      end
    end
  end
end
