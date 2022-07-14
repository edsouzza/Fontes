object DM_PESQDADOS: TDM_PESQDADOS
  OldCreateOrder = False
  Left = 749
  Top = 246
  Height = 441
  Width = 485
  object sdsPesqContatos: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 40
    Top = 8
  end
  object dspPesqContatos: TDataSetProvider
    DataSet = sdsPesqContatos
    Options = [poAllowCommandText]
    Left = 160
    Top = 8
  end
  object cdsPesqContato: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqContatos'
    Left = 274
    Top = 8
  end
  object dsPesqContato: TDataSource
    DataSet = cdsPesqContato
    Left = 392
    Top = 8
  end
  object sqlPesqConfiguracoes: TSQLDataSet
    CommandText = 'select * from configuracoes'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 40
    Top = 72
  end
  object dspPesqConfiguracoes: TDataSetProvider
    DataSet = sqlPesqConfiguracoes
    Options = [poAllowCommandText]
    Left = 160
    Top = 72
  end
  object cdsPesqConfiguracoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqConfiguracoes'
    Left = 274
    Top = 72
  end
  object dsPesqConfiguracoes: TDataSource
    DataSet = cdsPesqConfiguracoes
    Left = 392
    Top = 72
  end
  object dsp_MENUS: TDataSetProvider
    DataSet = sql_MENUS
    Options = [poAllowCommandText]
    Left = 166
    Top = 160
  end
  object cds_MENUS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_MENUS'
    Left = 286
    Top = 160
  end
  object ds_MENUS: TDataSource
    DataSet = cds_MENUS
    Left = 390
    Top = 160
  end
  object sql_MENUS: TSQLDataSet
    CommandText = 'SELECT * FROM MENUS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 40
    Top = 160
  end
  object dsp_PesqAnotacoes: TDataSetProvider
    DataSet = sql_PesqAnotacoes
    Options = [poAllowCommandText]
    Left = 166
    Top = 240
  end
  object cdsPesqAnotacoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_MENUS'
    Left = 286
    Top = 240
  end
  object dsPesqAnotacoes: TDataSource
    DataSet = cdsPesqAnotacoes
    Left = 390
    Top = 240
  end
  object sql_PesqAnotacoes: TSQLDataSet
    CommandText = 'SELECT * FROM ANOTACOES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 40
    Top = 240
  end
end
