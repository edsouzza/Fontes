object _frmPesquisarOpcaoAtivoCredito: T_frmPesquisarOpcaoAtivoCredito
  Left = 711
  Top = 342
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Escolha o Tipo de Pesquisa'
  ClientHeight = 184
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lstOpcoes: TListBox
    Left = 0
    Top = 0
    Width = 412
    Height = 184
    Cursor = crHandPoint
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
    OnClick = lstOpcoesClick
    OnKeyDown = lstOpcoesKeyDown
  end
end
