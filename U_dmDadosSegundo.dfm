object dm_DadosSegundo: Tdm_DadosSegundo
  OldCreateOrder = False
  Left = 394
  Top = 220
  Height = 635
  Width = 1429
  object dsp_CadFuncoes: TDataSetProvider
    DataSet = sql_CadFuncoes
    Options = [poAllowCommandText]
    Left = 114
    Top = 80
  end
  object cds_CadFuncoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_CadFuncoes'
    Left = 114
    Top = 136
  end
  object ds_CadFuncoes: TDataSource
    DataSet = cds_CadFuncoes
    Left = 114
    Top = 184
  end
  object sql_CadFuncoes: TSQLDataSet
    CommandText = 
      'SELECT * FROM FUNCOES '#13#10'WHERE'#13#10'FUNCAO_ID > 1'#13#10'ORDER BY FUNCAO_ID' +
      ' DESC'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 114
    Top = 24
  end
  object dsp_Login: TDataSetProvider
    DataSet = sql_login
    Options = [poAllowCommandText]
    Left = 276
    Top = 84
  end
  object cds_Login: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Login'
    Left = 276
    Top = 137
  end
  object ds_Login: TDataSource
    DataSet = cds_Login
    Left = 276
    Top = 188
  end
  object sql_login: TSQLDataSet
    CommandText = 'SELECT * FROM LOGIN'#13#10'WHERE'#13#10'STATUS = '#39'A'#39#13#10'ORDER BY'#13#10'USUARIO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 276
    Top = 28
  end
  object criptografa: TTomEncryption
    Key = 'eas1708'
    Left = 42
    Top = 11
  end
  object dsp_Expiracao: TDataSetProvider
    DataSet = sql_Expiracao
    Options = [poAllowCommandText]
    Left = 204
    Top = 82
  end
  object cds_Expiracao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Expiracao'
    Left = 204
    Top = 135
  end
  object ds_Expiracao: TDataSource
    DataSet = cds_Expiracao
    Left = 204
    Top = 186
  end
  object sql_Expiracao: TSQLDataSet
    CommandText = 'select * from EXPIRACAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 204
    Top = 26
  end
  object sql_CodBarra: TSQLDataSet
    CommandText = 'select * from codbarras'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 622
    Top = 30
  end
  object dsp_CodBarra: TDataSetProvider
    DataSet = sql_CodBarra
    Options = [poAllowCommandText]
    Left = 622
    Top = 86
  end
  object cds_CodBarra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_CodBarra'
    Left = 622
    Top = 142
  end
  object ds_CodBarra: TDataSource
    DataSet = cds_CodBarra
    Left = 624
    Top = 192
  end
  object dsp_Venda: TDataSetProvider
    DataSet = sql_Venda
    Options = [poAllowCommandText]
    Left = 118
    Top = 349
  end
  object cds_Venda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Venda'
    Left = 118
    Top = 405
  end
  object ds_Venda: TDataSource
    DataSet = cds_Venda
    Left = 120
    Top = 455
  end
  object sql_ItensVendas: TSQLDataSet
    CommandText = 'select * from ITENS_VENDAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 198
    Top = 293
  end
  object dsp_ItensVendas: TDataSetProvider
    DataSet = sql_ItensVendas
    Options = [poAllowCommandText]
    Left = 198
    Top = 349
  end
  object cds_ItensVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_ItensVendas'
    Left = 198
    Top = 405
  end
  object ds_ItensVendas: TDataSource
    DataSet = cds_ItensVendas
    Left = 200
    Top = 455
  end
  object dsp_TiposPgtos: TDataSetProvider
    DataSet = sql_TiposPgtos
    Options = [poAllowCommandText]
    Left = 442
    Top = 84
  end
  object cds_TiposPgtos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_TiposPgtos'
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 442
    Top = 140
  end
  object ds_TiposPgtos: TDataSource
    DataSet = cds_TiposPgtos
    Left = 442
    Top = 190
  end
  object sql_TiposPgtos: TSQLDataSet
    CommandText = 'Select * from tipospgtos'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 442
    Top = 28
  end
  object dsp_Config: TDataSetProvider
    DataSet = sql_Config
    Options = [poAllowCommandText]
    Left = 356
    Top = 86
  end
  object cds_Config: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_Config'
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 356
    Top = 142
    object cds_ConfigFOTOS: TStringField
      FieldName = 'FOTOS'
      Size = 100
    end
    object cds_ConfigP1: TStringField
      FieldName = 'P1'
      Size = 15
    end
    object cds_ConfigP2: TStringField
      FieldName = 'P2'
      Size = 15
    end
    object cds_ConfigP3: TStringField
      FieldName = 'P3'
      Size = 15
    end
    object cds_ConfigP4: TStringField
      FieldName = 'P4'
      Size = 15
    end
    object cds_ConfigP5: TStringField
      FieldName = 'P5'
      Size = 15
    end
  end
  object ds_Config: TDataSource
    DataSet = cds_Config
    Left = 356
    Top = 192
  end
  object sql_Config: TSQLDataSet
    CommandText = 'Select * from config'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 356
    Top = 30
  end
  object dsp_Categorias: TDataSetProvider
    DataSet = sql_Categorias
    Options = [poAllowCommandText]
    Left = 530
    Top = 86
  end
  object cds_Categorias: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    CommandText = 'SELECT * FROM CATEGORIAS ORDER BY CATEGORIA'
    Params = <>
    ProviderName = 'dsp_Categorias'
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 530
    Top = 142
  end
  object ds_Categorias: TDataSource
    DataSet = cds_Categorias
    Left = 530
    Top = 192
  end
  object sql_Categorias: TSQLDataSet
    CommandText = 
      'Select * from categorias '#13#10'where id_categoria > 1'#13#10'order by cate' +
      'goria'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 530
    Top = 30
  end
  object DBGrid1: TDBGrid
    Left = 72
    Top = 72
    Width = 721
    Height = 249
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dsp_cotacao: TDataSetProvider
    DataSet = sql_cotacao
    Options = [poAllowCommandText]
    Left = 276
    Top = 354
  end
  object cds_cotacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_cotacao'
    Left = 276
    Top = 407
  end
  object ds_cotacao: TDataSource
    DataSet = cds_cotacao
    Left = 276
    Top = 458
  end
  object sql_cotacao: TSQLDataSet
    CommandText = 'select * from COTACAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 276
    Top = 298
  end
  object dsp_ICotacao: TDataSetProvider
    DataSet = sql_ICotacao
    Options = [poAllowCommandText]
    Left = 348
    Top = 354
  end
  object cds_ICotacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_ICotacao'
    Left = 348
    Top = 407
    object cds_ICotacaoID_DETALHESCOTACAO: TIntegerField
      FieldName = 'ID_DETALHESCOTACAO'
      Required = True
    end
    object cds_ICotacaoCOTACAO_ID: TIntegerField
      FieldName = 'COTACAO_ID'
      Required = True
    end
    object cds_ICotacaoPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
    end
    object cds_ICotacaoUNITARIO: TFMTBCDField
      FieldName = 'UNITARIO'
      currency = True
      Precision = 18
      Size = 2
    end
    object cds_ICotacaoQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object cds_ICotacaoTOTALITEM: TFMTBCDField
      FieldName = 'TOTALITEM'
      Precision = 18
      Size = 2
    end
    object cds_ICotacaoFLAG: TStringField
      FieldName = 'FLAG'
      FixedChar = True
      Size = 1
    end
  end
  object ds_ICotacao: TDataSource
    DataSet = cds_ICotacao
    Left = 348
    Top = 458
  end
  object sql_ICotacao: TSQLDataSet
    CommandText = 'select * from I_COTACAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 348
    Top = 298
  end
  object dsp_TCotacao: TDataSetProvider
    DataSet = sql_TCotacao
    Options = [poAllowCommandText]
    Left = 428
    Top = 354
  end
  object cds_TCotacao: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_Tcotacao'
    Left = 428
    Top = 407
    object cds_TCotacaoID_DETALHESCOTACAO: TIntegerField
      FieldName = 'ID_DETALHESCOTACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_TCotacaoCOTACAO_ID: TIntegerField
      FieldName = 'COTACAO_ID'
      Required = True
    end
    object cds_TCotacaoPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
    end
    object cds_TCotacaoUNITARIO: TFMTBCDField
      FieldName = 'UNITARIO'
      currency = True
      Precision = 18
      Size = 2
    end
    object cds_TCotacaoQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object cds_TCotacaoTOTALITEM: TFMTBCDField
      FieldName = 'TOTALITEM'
      currency = True
      Precision = 18
      Size = 2
    end
    object cds_TCotacaototal_item: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'total_item'
    end
    object cds_TCotacaoFLAG: TStringField
      FieldName = 'FLAG'
      FixedChar = True
      Size = 1
    end
    object cds_TCotacaoPRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'PRODUTO'
      LookupDataSet = dm_Conexao.cds_CadProduto
      LookupKeyFields = 'ID_PRODUTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO_ID'
      Size = 40
      Lookup = True
    end
    object cds_TCotacaototal_geral: TAggregateField
      Alignment = taRightJustify
      FieldName = 'total_geral'
      Active = True
      DisplayFormat = '##0.00'
      Expression = 'sum(total_item)'
    end
  end
  object ds_TCotacao: TDataSource
    DataSet = cds_TCotacao
    Left = 428
    Top = 458
  end
  object sql_TCotacao: TSQLDataSet
    CommandText = 'select * from T_COTACAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 428
    Top = 298
  end
  object dsp_Orcamento: TDataSetProvider
    DataSet = sql_Orcamento
    Options = [poAllowCommandText]
    Left = 538
    Top = 352
  end
  object cds_Orcamento: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_Orcamento'
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 538
    Top = 408
  end
  object ds_Orcamento: TDataSource
    DataSet = cds_Orcamento
    Left = 538
    Top = 458
  end
  object sql_Orcamento: TSQLDataSet
    CommandText = 'Select * from orcamento'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 538
    Top = 296
  end
  object dsp_IOrcamento: TDataSetProvider
    DataSet = sql_IOrcamento
    Options = [poAllowCommandText]
    Left = 626
    Top = 349
  end
  object cds_IOrcamento: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_IOrcamento'
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 634
    Top = 405
    object cds_IOrcamentoID_DETALHESORC: TIntegerField
      FieldName = 'ID_DETALHESORC'
      Required = True
    end
    object cds_IOrcamentoORC_ID: TIntegerField
      FieldName = 'ORC_ID'
    end
    object cds_IOrcamentoFLAG: TStringField
      FieldName = 'FLAG'
      FixedChar = True
      Size = 1
    end
    object cds_IOrcamentoVALOR_PECAS: TFMTBCDField
      FieldName = 'VALOR_PECAS'
      Precision = 18
      Size = 2
    end
    object cds_IOrcamentoVALOR_ITEM: TFMTBCDField
      FieldName = 'VALOR_ITEM'
      Precision = 18
      Size = 2
    end
    object cds_IOrcamentoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cds_IOrcamentoQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cds_IOrcamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object cds_IOrcamentoITEM_ID: TIntegerField
      FieldName = 'ITEM_ID'
    end
  end
  object ds_IOrcamento: TDataSource
    DataSet = cds_IOrcamento
    Left = 634
    Top = 455
  end
  object sql_IOrcamento: TSQLDataSet
    CommandText = 'Select * from i_orcamento'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 626
    Top = 293
  end
  object dsp_TOrcamento: TDataSetProvider
    DataSet = sql_TOrcamento
    Options = [poAllowCommandText]
    Left = 722
    Top = 349
  end
  object cds_TOrcamento: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_TOrcamento'
    OnCalcFields = cds_TOrcamentoCalcFields
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 722
    Top = 405
    object cds_TOrcamentoID_DETALHESORC: TIntegerField
      FieldName = 'ID_DETALHESORC'
      Required = True
    end
    object cds_TOrcamentoORC_ID: TIntegerField
      FieldName = 'ORC_ID'
    end
    object cds_TOrcamentoFLAG: TStringField
      FieldName = 'FLAG'
      FixedChar = True
      Size = 1
    end
    object cds_TOrcamentototal_item: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'total_item'
    end
    object cds_TOrcamentoVALOR_PECAS: TFMTBCDField
      FieldName = 'VALOR_PECAS'
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cds_TOrcamentoVALOR_ITEM: TFMTBCDField
      FieldName = 'VALOR_ITEM'
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cds_TOrcamentoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cds_TOrcamentoQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object cds_TOrcamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 90
    end
    object cds_TOrcamentoITEM_ID: TIntegerField
      FieldName = 'ITEM_ID'
    end
    object cds_TOrcamentototal_geral: TAggregateField
      Alignment = taRightJustify
      FieldName = 'total_geral'
      Active = True
      DisplayFormat = '##0.00'
      Expression = 'sum(total_item)'
    end
  end
  object ds_TOrcamento: TDataSource
    DataSet = cds_TOrcamento
    Left = 722
    Top = 455
  end
  object sql_TOrcamento: TSQLDataSet
    CommandText = 'Select * from t_orcamento'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 722
    Top = 293
  end
  object dsp_HistoricoProdutos: TDataSetProvider
    DataSet = sql_HistoricoProdutos
    Options = [poAllowCommandText]
    Left = 818
    Top = 357
  end
  object cds_HistoricoProdutos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_HistoricoProdutos'
    OnCalcFields = cds_TOrcamentoCalcFields
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 818
    Top = 413
  end
  object ds_HistoricoProdutos: TDataSource
    DataSet = cds_HistoricoProdutos
    Left = 818
    Top = 471
  end
  object sql_HistoricoProdutos: TSQLDataSet
    CommandText = 'Select * from historico_produtos'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 818
    Top = 301
  end
  object sql_OS: TSQLDataSet
    CommandText = 
      'SELECT o.*, c.* FROM os o, clientes c'#13#10'WHERE '#13#10'c.cli_id = o.clie' +
      'nte_id '#13#10'AND'#13#10'o.status = '#39'A'#39#13#10'ORDER BY c.cli_nome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 686
    Top = 30
  end
  object dsp_OS: TDataSetProvider
    DataSet = sql_OS
    Options = [poAllowCommandText]
    Left = 686
    Top = 86
  end
  object cds_OS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_OS'
    Left = 686
    Top = 142
    object cds_OSID_OS: TIntegerField
      FieldName = 'ID_OS'
      Required = True
    end
    object cds_OSCLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
    end
    object cds_OSEQUIPAMENTO: TStringField
      FieldName = 'EQUIPAMENTO'
      Size = 40
    end
    object cds_OSNUMSERIE: TStringField
      FieldName = 'NUMSERIE'
      Size = 40
    end
    object cds_OSMARCA: TStringField
      FieldName = 'MARCA'
      Size = 40
    end
    object cds_OSMODELO: TStringField
      FieldName = 'MODELO'
      Size = 40
    end
    object cds_OSACESSORIOS: TStringField
      FieldName = 'ACESSORIOS'
      Size = 40
    end
    object cds_OSVL_ORCAMENTO: TFMTBCDField
      FieldName = 'VL_ORCAMENTO'
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cds_OSPROBLEMA: TStringField
      FieldName = 'PROBLEMA'
      Size = 40
    end
    object cds_OSDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
    end
    object cds_OSDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
    end
    object cds_OSSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object cds_OSCLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'CLIENTE'
      LookupDataSet = dm_Conexao.sql_DadosClientes
      LookupKeyFields = 'CLI_ID'
      LookupResultField = 'CLI_NOME'
      KeyFields = 'CLIENTE_ID'
      Size = 40
      Lookup = True
    end
    object cds_OSCLI_ID: TIntegerField
      FieldName = 'CLI_ID'
      Required = True
    end
    object cds_OSCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Required = True
      Size = 40
    end
    object cds_OSCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Required = True
      Size = 40
    end
    object cds_OSCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      Size = 10
    end
    object cds_OSCLI_DDDFONE: TStringField
      FieldName = 'CLI_DDDFONE'
      Size = 3
    end
    object cds_OSCLI_FONE: TStringField
      FieldName = 'CLI_FONE'
      Size = 15
    end
    object cds_OSCLI_DDDFONE4: TStringField
      FieldName = 'CLI_DDDFONE4'
      Size = 3
    end
    object cds_OSCLI_FONE4: TStringField
      FieldName = 'CLI_FONE4'
      Size = 15
    end
    object cds_OSCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      Size = 40
    end
    object cds_OSCLI_COMPLEMENTO: TStringField
      FieldName = 'CLI_COMPLEMENTO'
      Size = 40
    end
    object cds_OSOPERADOR_ID: TIntegerField
      FieldName = 'OPERADOR_ID'
    end
    object cds_OSCLI_STATUS: TStringField
      FieldName = 'CLI_STATUS'
      FixedChar = True
      Size = 1
    end
    object cds_OSCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      Size = 40
    end
    object cds_OSCLI_CNPJ: TStringField
      FieldName = 'CLI_CNPJ'
      Size = 40
    end
  end
  object ds_OS: TDataSource
    DataSet = cds_OS
    Left = 688
    Top = 200
  end
  object sql_Empresa: TSQLDataSet
    CommandText = 'select * from EMPRESA '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 766
    Top = 30
  end
  object dsp_Empresa: TDataSetProvider
    DataSet = sql_Empresa
    Options = [poAllowCommandText]
    Left = 766
    Top = 86
  end
  object cds_Empresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Empresa'
    Left = 766
    Top = 142
  end
  object ds_Empresa: TDataSource
    DataSet = cds_Empresa
    Left = 768
    Top = 200
  end
  object sql_Servicos: TSQLDataSet
    CommandText = 
      'select * from SERVICOS'#13#10'WHERE'#13#10'status = '#39'A'#39#13#10'AND'#13#10'tipo = '#39'S'#39#13#10'OR' +
      'DER BY'#13#10'id_servico'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 846
    Top = 30
  end
  object dsp_Servicos: TDataSetProvider
    DataSet = sql_Servicos
    Options = [poAllowCommandText]
    Left = 846
    Top = 86
  end
  object cds_Servicos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Servicos'
    Left = 846
    Top = 142
    object cds_ServicosID_SERVICO: TIntegerField
      FieldName = 'ID_SERVICO'
      Required = True
    end
    object cds_ServicosCODBARRAS: TStringField
      FieldName = 'CODBARRAS'
      Size = 40
    end
    object cds_ServicosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object cds_ServicosVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cds_ServicosTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cds_ServicosSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object cds_ServicosDATA: TDateField
      FieldName = 'DATA'
    end
    object cds_ServicosOPERADOR_ID: TIntegerField
      FieldName = 'OPERADOR_ID'
    end
  end
  object ds_Servicos: TDataSource
    DataSet = cds_Servicos
    Left = 848
    Top = 200
  end
  object sql_CodBarServicos: TSQLDataSet
    CommandText = 'SELECT * FROM CODBARSERVICO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 38
    Top = 293
  end
  object dsp_CodBarServicos: TDataSetProvider
    DataSet = sql_CodBarServicos
    Options = [poAllowCommandText]
    Left = 38
    Top = 349
  end
  object cds_CodBarServicos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_CodBarServicos'
    Left = 38
    Top = 405
  end
  object ds_CodBarServicos: TDataSource
    DataSet = cds_CodBarServicos
    Left = 38
    Top = 460
  end
  object dsp_CPedido: TDataSetProvider
    DataSet = sql_CPedido
    Options = [poAllowCommandText]
    Left = 914
    Top = 360
  end
  object cds_CPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_CPedido'
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 914
    Top = 416
  end
  object ds_CPedido: TDataSource
    DataSet = cds_CPedido
    Left = 914
    Top = 474
  end
  object sql_CPedido: TSQLDataSet
    CommandText = 'Select * from c_pedido'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 914
    Top = 304
  end
  object dsp_IPedido: TDataSetProvider
    DataSet = sql_IPedido
    Options = [poAllowCommandText]
    Left = 986
    Top = 357
  end
  object cds_IPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_IPedido'
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 986
    Top = 413
  end
  object ds_IPedido: TDataSource
    DataSet = cds_IPedido
    Left = 986
    Top = 471
  end
  object sql_IPedido: TSQLDataSet
    CommandText = 'Select * from i_pedido'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 986
    Top = 301
  end
  object dsp_TPedido: TDataSetProvider
    DataSet = sql_TPedido
    Options = [poAllowCommandText]
    Left = 1074
    Top = 357
  end
  object cds_TPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_TPedido'
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 1074
    Top = 413
    object cds_TPedidoID_PEDIDOTEMP: TIntegerField
      FieldName = 'ID_PEDIDOTEMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_TPedidoPEDIDO_ID: TIntegerField
      FieldName = 'PEDIDO_ID'
    end
    object cds_TPedidoPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
    end
    object cds_TPedidoVL_UNITARIO: TFMTBCDField
      FieldName = 'VL_UNITARIO'
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cds_TPedidoQDE: TFMTBCDField
      FieldName = 'QDE'
      Precision = 18
      Size = 2
    end
    object cds_TPedidoVL_TOTALITEM: TFMTBCDField
      FieldName = 'VL_TOTALITEM'
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cds_TPedidoTotal_Item: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'Total_Item'
    end
    object cds_TPedidoPRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'PRODUTO'
      LookupDataSet = dm_Conexao.cds_CadProduto
      LookupKeyFields = 'ID_PRODUTO'
      LookupResultField = 'COD_ALT1'
      KeyFields = 'PRODUTO_ID'
      Size = 40
      Lookup = True
    end
    object cds_TPedidoTOTAL: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOTAL'
      Active = True
      DisplayFormat = '##0.00'
      Expression = 'SUM(Total_Item)'
    end
  end
  object ds_TPedido: TDataSource
    DataSet = cds_TPedido
    Left = 1074
    Top = 471
  end
  object sql_TPedido: TSQLDataSet
    CommandText = 'Select * from t_pedido'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 1074
    Top = 301
  end
  object sql_Agendamentos: TSQLDataSet
    CommandText = 'select * from AGENDA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 942
    Top = 30
  end
  object dsp_Agendamentos: TDataSetProvider
    DataSet = sql_Agendamentos
    Options = [poAllowCommandText]
    Left = 942
    Top = 86
  end
  object cds_Agendamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Agendamentos'
    Left = 942
    Top = 142
  end
  object ds_Agendamentos: TDataSource
    DataSet = cds_Agendamentos
    Left = 944
    Top = 200
  end
  object sql_Ativos_Credito: TSQLDataSet
    CommandText = 'select * from  ATIVOS_CREDITO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 1038
    Top = 30
  end
  object dsp_Ativos_Credito: TDataSetProvider
    DataSet = sql_Ativos_Credito
    Options = [poAllowCommandText]
    Left = 1038
    Top = 86
  end
  object cds_Ativos_Credito: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Ativos_Credito'
    Left = 1038
    Top = 142
  end
  object ds_Ativos_Credito: TDataSource
    DataSet = cds_Ativos_Credito
    Left = 1040
    Top = 200
  end
  object dsp_LogOperacoes: TDataSetProvider
    DataSet = sql_LogOperacoes
    Options = [poAllowCommandText]
    Left = 1146
    Top = 85
  end
  object cds_LogOperacoes: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_LogOperacoes'
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 1146
    Top = 141
  end
  object ds_LogOperacoes: TDataSource
    DataSet = cds_LogOperacoes
    Left = 1146
    Top = 199
  end
  object sql_LogOperacoes: TSQLDataSet
    CommandText = 'Select * from log_operacoes order by idoperacao desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 1146
    Top = 29
  end
  object IBanco: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1252')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 40
    Top = 72
  end
  object IB_Estatisticas: TIBQuery
    Database = IBanco
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT SUM(VL_LIQUIDO) as TOTAL, mesano, nummes'
      'FROM'
      'venda'
      'WHERE '
      'data_venda'
      'BETWEEN'
      ':DataInicio'
      'AND'
      ':DataFim'
      'GROUP BY'
      'mesano, nummes'
      '')
    Left = 40
    Top = 184
    ParamData = <
      item
        DataType = ftDate
        Name = 'DataInicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DataFim'
        ParamType = ptUnknown
      end>
    object IB_EstatisticasTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object IB_EstatisticasMESANO: TIBStringField
      FieldName = 'MESANO'
      Origin = 'VENDA.MESANO'
      Size = 10
    end
    object IB_EstatisticasNUMMES: TIntegerField
      FieldName = 'NUMMES'
      Origin = 'VENDA.NUMMES'
    end
  end
  object IBTransaction: TIBTransaction
    Active = False
    DefaultDatabase = IBanco
    AutoStopAction = saNone
    Left = 40
    Top = 128
  end
  object sql_Venda: TSQLDataSet
    CommandText = 'select * from VENDA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 118
    Top = 293
  end
  object dsp_MovCaixa: TDataSetProvider
    DataSet = sql_MovCaixa
    Options = [poAllowCommandText]
    Left = 1170
    Top = 365
  end
  object cds_MovCaixa: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_MovCaixa'
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 1170
    Top = 421
    object cds_MovCaixaID_MOVIMENTO: TIntegerField
      FieldName = 'ID_MOVIMENTO'
      Required = True
    end
    object cds_MovCaixaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object cds_MovCaixaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 100
    end
    object cds_MovCaixaTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 10
    end
    object cds_MovCaixaDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object ds_MovCaixa: TDataSource
    DataSet = cds_MovCaixa
    Left = 1170
    Top = 479
  end
  object sql_MovCaixa: TSQLDataSet
    CommandText = 'Select * from movimentacaocaixa'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 1170
    Top = 309
  end
  object dsp_Segmentos: TDataSetProvider
    DataSet = sql_Segmentos
    Options = [poAllowCommandText]
    Left = 1250
    Top = 85
  end
  object cds_Segmentos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_Segmentos'
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 1250
    Top = 141
  end
  object ds_Segmentos: TDataSource
    DataSet = cds_Segmentos
    Left = 1250
    Top = 199
  end
  object sql_Segmentos: TSQLDataSet
    CommandText = 'Select * from segmentos'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 1250
    Top = 29
  end
  object dsp_Contatos: TDataSetProvider
    DataSet = sql_Contatos
    Options = [poAllowCommandText]
    Left = 1266
    Top = 365
  end
  object cds_Contatos: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_Contatos'
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 1266
    Top = 421
  end
  object ds_Contatos: TDataSource
    DataSet = cds_Contatos
    Left = 1266
    Top = 479
  end
  object sql_Contatos: TSQLDataSet
    CommandText = 
      'select c.*, s.id_segmento, s.segmento FROM contatos c INNER JOIN' +
      ' segmentos s ON s.id_segmento = c.cont_segid WHERE c.cont_status' +
      '='#39'A'#39' ORDER BY c.cont_nome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 1266
    Top = 309
  end
  object dsp_tipoimpressora: TDataSetProvider
    DataSet = sql_tipoimpressora
    Options = [poAllowCommandText]
    Left = 1338
    Top = 85
  end
  object cds_tipoimpressora: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_tipoimpressora'
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 1338
    Top = 141
  end
  object ds_tipoimpressora: TDataSource
    DataSet = cds_tipoimpressora
    Left = 1338
    Top = 199
  end
  object sql_tipoimpressora: TSQLDataSet
    CommandText = 'Select * from tipoimpressora'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 1338
    Top = 29
  end
  object dsp_anotacoes: TDataSetProvider
    DataSet = sql_anotacoes
    Options = [poAllowCommandText]
    Left = 1346
    Top = 365
  end
  object cds_anotacoes: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dsp_anotacoes'
    OnReconcileError = cds_AbreAgendamentoReconcileError
    Left = 1346
    Top = 421
  end
  object ds_anotacoes: TDataSource
    DataSet = cds_anotacoes
    Left = 1346
    Top = 479
  end
  object sql_anotacoes: TSQLDataSet
    CommandText = 'SELECT * FROM ANOTACOES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.conexao_dados
    Left = 1346
    Top = 309
  end
end
