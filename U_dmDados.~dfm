object dm_Conexao: Tdm_Conexao
  OldCreateOrder = False
  Left = 551
  Top = 234
  Height = 642
  Width = 1048
  object conexao_dados: TSQLConnection
    ConnectionName = 'SYSPDV'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=C:\Meus Documentos\Bancos_De_Projetos\SysPdv\SYSPDV.FDB'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=SYSDBA'
      'WaitOnLocks=True')
    VendorLib = 'fbclient.dll'
    Left = 34
    Top = 8
  end
  object sql_DadosFuncionarios: TSQLDataSet
    CommandText = 
      'select u.*, f.* FROM funcionarios u INNER JOIN funcoes f ON u.fu' +
      'nc_funcaoid = f.funcao_id WHERE '#13#10'u.func_nome <> '#39'ADMINISTRACAO'#39 +
      #13#10'AND'#13#10'u.func_nome <> '#39'SISTEMA'#39#13#10'AND'#13#10'u.func_status = '#39'A'#39' '#13#10'ORDE' +
      'R BY u.func_nome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 214
    Top = 88
  end
  object dsp_DadosFuncionarios: TDataSetProvider
    DataSet = sql_DadosFuncionarios
    Options = [poAllowCommandText]
    Left = 214
    Top = 144
  end
  object cds_DadosFuncionarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_DadosFuncionarios'
    Left = 214
    Top = 200
  end
  object ds_DadosFuncionarios: TDataSource
    DataSet = cds_DadosFuncionarios
    Left = 214
    Top = 256
  end
  object sql_FormaPagtos: TSQLDataSet
    CommandText = 'SELECT * FROM FORMAPAGTO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 401
    Top = 88
  end
  object dsp_FormaPagtos: TDataSetProvider
    DataSet = sql_FormaPagtos
    Options = [poAllowCommandText]
    Left = 401
    Top = 144
  end
  object cds_FormaPagtos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_FormaPagtos'
    Left = 401
    Top = 200
    object intgrfld_FormaPagtosFORMA_ID: TIntegerField
      FieldName = 'FORMA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object strngfld_FormaPagtosFORMA_DESCRICAO: TStringField
      FieldName = 'FORMA_DESCRICAO'
      Size = 40
    end
  end
  object ds_FormaPagtos: TDataSource
    DataSet = cds_FormaPagtos
    Left = 401
    Top = 255
  end
  object dsp_CadProduto: TDataSetProvider
    DataSet = sql_CadProduto
    Options = [poAllowCommandText]
    Left = 30
    Top = 144
  end
  object cds_CadProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_CadProduto'
    Left = 30
    Top = 200
    object cds_CadProdutoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_CadProdutoCATEGORIA_ID: TIntegerField
      FieldName = 'CATEGORIA_ID'
    end
    object cds_CadProdutoFABRICANTE_ID: TIntegerField
      FieldName = 'FABRICANTE_ID'
    end
    object cds_CadProdutoCOD_BARRAS: TStringField
      FieldName = 'COD_BARRAS'
      Size = 40
    end
    object cds_CadProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object cds_CadProdutoPRECOVENDA: TBCDField
      FieldName = 'PRECOVENDA'
      DisplayFormat = '###.##0.00'
      Precision = 9
      Size = 2
    end
    object cds_CadProdutoPRECOCOMPRA: TFMTBCDField
      FieldName = 'PRECOCOMPRA'
      DisplayFormat = '#,0.00'
      Precision = 18
      Size = 2
    end
    object cds_CadProdutoDATACAD: TDateField
      FieldName = 'DATACAD'
    end
    object cds_CadProdutoMESANO: TStringField
      FieldName = 'MESANO'
      Size = 10
    end
    object cds_CadProdutoSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object cds_CadProdutoFABRICANTE: TStringField
      FieldKind = fkLookup
      FieldName = 'FABRICANTE'
      LookupDataSet = cds_Fabricante
      LookupKeyFields = 'ID_FABRICANTE'
      LookupResultField = 'NOME_FABRICANTE'
      KeyFields = 'FABRICANTE_ID'
      Size = 40
      Lookup = True
    end
    object cds_CadProdutoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cds_CadProdutoFORNECEDOR_ID: TIntegerField
      FieldName = 'FORNECEDOR_ID'
    end
    object cds_CadProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cds_CadProdutoALIQUOTA: TStringField
      FieldName = 'ALIQUOTA'
      Size = 4
    end
    object cds_CadProdutoVALORDELUCRO: TFMTBCDField
      FieldName = 'VALORDELUCRO'
      DisplayFormat = '#,0.00'
      Precision = 18
      Size = 2
    end
    object cds_CadProdutoOBS: TStringField
      FieldName = 'OBS'
      Size = 1500
    end
    object cds_CadProdutoESTOQUE_ATUAL: TFMTBCDField
      FieldName = 'ESTOQUE_ATUAL'
      Precision = 18
      Size = 2
    end
    object cds_CadProdutoESTOQUEMINIMO: TFMTBCDField
      FieldName = 'ESTOQUEMINIMO'
      Precision = 18
      Size = 2
    end
    object cds_CadProdutoCOD_ALT1: TStringField
      FieldName = 'COD_ALT1'
      Size = 40
    end
    object cds_CadProdutoCOD_ALT2: TStringField
      FieldName = 'COD_ALT2'
      Size = 40
    end
    object cds_CadProdutoCOD_ALT3: TStringField
      FieldName = 'COD_ALT3'
      Size = 40
    end
    object cds_CadProdutoCOD_ALT4: TStringField
      FieldName = 'COD_ALT4'
      Size = 40
    end
    object cds_CadProdutoPERCENTLUCRO: TFMTBCDField
      FieldName = 'PERCENTLUCRO'
      Precision = 18
      Size = 2
    end
  end
  object ds_CadProduto: TDataSource
    DataSet = cds_CadProduto
    Left = 30
    Top = 248
  end
  object sql_CadProduto: TSQLDataSet
    CommandText = 
      'SELECT *'#13#10'FROM produtos  '#13#10'WHERE'#13#10'DESCRICAO <> '#39'PRODUTO NAO CADA' +
      'STRADO'#39#13#10'AND'#13#10'STATUS = '#39'A'#39#13#10'ORDER BY '#13#10'DESCRICAO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 30
    Top = 88
  end
  object sql_unidades: TSQLDataSet
    CommandText = 'SELECT * FROM UNIDADES'#13#10'ORDER BY ID_UNIDADE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 312
    Top = 88
  end
  object dsp_unidades: TDataSetProvider
    DataSet = sql_unidades
    Options = [poAllowCommandText]
    Left = 312
    Top = 144
  end
  object cds_unidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_unidades'
    Left = 312
    Top = 200
  end
  object ds_unidades: TDataSource
    DataSet = cds_unidades
    Left = 312
    Top = 256
  end
  object dsp_acessos: TDataSetProvider
    DataSet = sql_acessos
    Options = [poAllowCommandText]
    Left = 685
    Top = 399
  end
  object cds_acessos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_acessos'
    Left = 685
    Top = 455
  end
  object sql_acessos: TSQLDataSet
    CommandText = 'SELECT * FROM LOG_ACESSOS ORDER BY ID_ACESSOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 685
    Top = 343
  end
  object ds_acessos: TDataSource
    Left = 685
    Top = 511
  end
  object cds_AbreCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_AbreCaixa'
    Left = 30
    Top = 448
  end
  object ds_AbreCaixa: TDataSource
    DataSet = cds_AbreCaixa
    Left = 30
    Top = 504
  end
  object sql_AbreCaixa: TSQLDataSet
    CommandText = 'SELECT * FROM ABRECAIXA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 30
    Top = 336
  end
  object dsp_AbreCaixa: TDataSetProvider
    DataSet = sql_AbreCaixa
    Options = [poAllowCommandText]
    Left = 30
    Top = 392
  end
  object cds_FechaCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_FechaCaixa'
    Left = 111
    Top = 448
  end
  object ds_FechaCaixa: TDataSource
    DataSet = cds_FechaCaixa
    Left = 111
    Top = 512
  end
  object sql_FechaCaixa: TSQLDataSet
    CommandText = 'SELECT * FROM FECHACAIXA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 111
    Top = 336
  end
  object dsp_FechaCaixa: TDataSetProvider
    DataSet = sql_FechaCaixa
    Options = [poAllowCommandText]
    Left = 111
    Top = 392
  end
  object cds_Caixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Caixa'
    Left = 193
    Top = 448
  end
  object ds_Caixa: TDataSource
    DataSet = cds_Caixa
    Left = 193
    Top = 504
  end
  object sql_Caixa: TSQLDataSet
    CommandText = 'SELECT * FROM CAIXA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 193
    Top = 336
  end
  object dsp_Caixa: TDataSetProvider
    DataSet = sql_Caixa
    Options = [poAllowCommandText]
    Left = 193
    Top = 392
  end
  object cds_Backup: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Backup'
    Left = 693
    Top = 205
    object cds_BackupID_BACKUP: TIntegerField
      FieldName = 'ID_BACKUP'
      Required = True
    end
    object cds_BackupTXT_ORIGEM: TStringField
      FieldName = 'TXT_ORIGEM'
      Size = 200
    end
    object cds_BackupTXT_DESTINO: TStringField
      FieldName = 'TXT_DESTINO'
      Size = 200
    end
  end
  object ds_Backup: TDataSource
    DataSet = cds_Backup
    Left = 693
    Top = 261
  end
  object sql_Backup: TSQLDataSet
    CommandText = 'SELECT * FROM CONFIG_BACKUP'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 693
    Top = 93
  end
  object dsp_Backup: TDataSetProvider
    DataSet = sql_Backup
    Options = [poAllowCommandText]
    Left = 693
    Top = 149
  end
  object sql_Fabricante: TSQLDataSet
    CommandText = 
      'SELECT *'#13#10'FROM fabricantes'#13#10'WHERE id_fabricante > 1'#13#10'ORDER BY'#13#10'n' +
      'ome_fabricante'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 115
    Top = 88
  end
  object dsp_Fabricante: TDataSetProvider
    DataSet = sql_Fabricante
    Options = [poAllowCommandText]
    Left = 115
    Top = 144
  end
  object cds_Fabricante: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM FABRICANTES ORDER BY NOME_FABRICANTE'
    Filtered = True
    Params = <>
    ProviderName = 'dsp_Fabricante'
    Left = 115
    Top = 200
  end
  object ds_Fabricante: TDataSource
    DataSet = cds_Fabricante
    Left = 115
    Top = 256
  end
  object sql_DadosClientes: TSQLDataSet
    CommandText = 'select  * from CLIENTES order by cli_nome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 500
    Top = 88
  end
  object dsp_DadosClientes: TDataSetProvider
    DataSet = sql_DadosClientes
    Options = [poAllowCommandText]
    Left = 500
    Top = 144
  end
  object cds_DadosClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_DadosClientes'
    Left = 500
    Top = 200
    object intgrfld_DadosClientesCLI_ID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CLI_ID'
      Required = True
    end
    object strngfld_DadosClientesCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Required = True
      Size = 40
    end
    object strngfld_DadosClientesCLI_APELIDO: TStringField
      FieldName = 'CLI_APELIDO'
      Size = 40
    end
    object strngfld_DadosClientesCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Required = True
      Size = 40
    end
    object strngfld_DadosClientesCLI_COMPLEMENTO: TStringField
      FieldName = 'CLI_COMPLEMENTO'
      Size = 40
    end
    object strngfld_DadosClientesCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      Size = 10
    end
    object cds_DadosClientesCLI_DDDFONE: TStringField
      FieldName = 'CLI_DDDFONE'
      Size = 3
    end
    object strngfld_DadosClientesCLI_FONE: TStringField
      FieldName = 'CLI_FONE'
      Size = 15
    end
    object cds_DadosClientesCLI_DDDFONE2: TStringField
      FieldName = 'CLI_DDDFONE2'
      Size = 3
    end
    object cds_DadosClientesCLI_FONE2: TStringField
      FieldName = 'CLI_FONE2'
      Size = 15
    end
    object cds_DadosClientesCLI_DDDFONE3: TStringField
      FieldName = 'CLI_DDDFONE3'
      Size = 3
    end
    object cds_DadosClientesCLI_FONE3: TStringField
      FieldName = 'CLI_FONE3'
      Size = 15
    end
    object cds_DadosClientesCLI_DDDFONE4: TStringField
      FieldName = 'CLI_DDDFONE4'
      Size = 3
    end
    object cds_DadosClientesCLI_FONE4: TStringField
      FieldName = 'CLI_FONE4'
      Size = 15
    end
    object strngfld_DadosClientesCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      Size = 40
    end
    object strngfld_DadosClientesCLI_DATACAD: TStringField
      FieldName = 'CLI_DATACAD'
      Required = True
      Size = 15
    end
    object strngfld_DadosClientesCLI_STATUS: TStringField
      FieldName = 'CLI_STATUS'
      FixedChar = True
      Size = 1
    end
    object cds_DadosClientesCLI_DATANASCTO: TDateField
      FieldName = 'CLI_DATANASCTO'
    end
    object cds_DadosClientesCLI_IE: TStringField
      FieldName = 'CLI_IE'
      Size = 40
    end
    object cds_DadosClientesCLI_OBS: TStringField
      FieldName = 'CLI_OBS'
      Size = 1500
    end
    object cds_DadosClientesCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      Size = 40
    end
    object cds_DadosClientesCLI_CNPJ: TStringField
      FieldName = 'CLI_CNPJ'
      Size = 40
    end
    object cds_DadosClientesCLI_HISTORICO: TMemoField
      FieldName = 'CLI_HISTORICO'
      BlobType = ftMemo
    end
  end
  object ds_DadosClientes: TDataSource
    DataSet = cds_DadosClientes
    Left = 500
    Top = 256
  end
  object sql_Fornecedor: TSQLDataSet
    CommandText = 
      'SELECT * FROM '#13#10'FORNECEDORES'#13#10'WHERE forne_status = '#39'A'#39#13#10'AND forn' +
      'e_id > 1'#13#10'ORDER BY'#13#10'FORNE_NOME'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 277
    Top = 336
  end
  object dsp_Fornecedor: TDataSetProvider
    DataSet = sql_Fornecedor
    Options = [poAllowCommandText]
    Left = 277
    Top = 392
  end
  object cds_Fornecedor: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM FORNECEDORES ORDER BY FORNE_NOME'
    Params = <>
    ProviderName = 'dsp_Fornecedor'
    Left = 277
    Top = 448
    object intgrfld_FornecedorFORNE_ID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'FORNE_ID'
      Required = True
    end
    object strngfld_FornecedorFORNE_NOME: TStringField
      FieldName = 'FORNE_NOME'
      Required = True
      Size = 40
    end
    object strngfld_FornecedorFORNE_APELIDO: TStringField
      FieldName = 'FORNE_APELIDO'
      Size = 40
    end
    object strngfld_FornecedorFORNE_ENDERECO: TStringField
      FieldName = 'FORNE_ENDERECO'
      Required = True
      Size = 40
    end
    object strngfld_FornecedorFORNE_COMPLEMENTO: TStringField
      FieldName = 'FORNE_COMPLEMENTO'
      Size = 40
    end
    object strngfld_FornecedorFORNE_CEP: TStringField
      FieldName = 'FORNE_CEP'
      Size = 10
    end
    object cds_FornecedorFORNE_DDDFONE: TStringField
      FieldName = 'FORNE_DDDFONE'
      Size = 3
    end
    object strngfld_FornecedorFORNE_FONE: TStringField
      FieldName = 'FORNE_FONE'
      EditMask = '0000-0000;1;_'
      Size = 15
    end
    object cds_FornecedorFORNE_DDDFONE2: TStringField
      FieldName = 'FORNE_DDDFONE2'
      Size = 3
    end
    object cds_FornecedorFORNE_FONE2: TStringField
      FieldName = 'FORNE_FONE2'
      Size = 15
    end
    object cds_FornecedorFORNE_DDDFONE3: TStringField
      FieldName = 'FORNE_DDDFONE3'
      Size = 3
    end
    object cds_FornecedorFORNE_FONE3: TStringField
      FieldName = 'FORNE_FONE3'
      Size = 15
    end
    object cds_FornecedorFORNE_DDDFONE4: TStringField
      FieldName = 'FORNE_DDDFONE4'
      Size = 3
    end
    object cds_FornecedorFORNE_FONE4: TStringField
      FieldName = 'FORNE_FONE4'
      Size = 15
    end
    object strngfld_FornecedorFORNE_EMAIL: TStringField
      FieldName = 'FORNE_EMAIL'
      Size = 40
    end
    object strngfld_FornecedorFORNE_DATACAD: TStringField
      FieldName = 'FORNE_DATACAD'
      Required = True
      Size = 15
    end
    object cds_FornecedorFORNE_STATUS: TStringField
      FieldName = 'FORNE_STATUS'
      FixedChar = True
      Size = 1
    end
    object cds_FornecedorFORNE_IE: TStringField
      FieldName = 'FORNE_IE'
      Size = 40
    end
    object cds_FornecedorFORNE_CNPJ: TStringField
      FieldName = 'FORNE_CNPJ'
      Size = 40
    end
    object cds_FornecedorFORNE_OBS: TStringField
      FieldName = 'FORNE_OBS'
      Size = 100
    end
  end
  object ds_Fornecedor: TDataSource
    DataSet = cds_Fornecedor
    Left = 277
    Top = 504
  end
  object sql_HistoricoAtivos: TSQLDataSet
    CommandText = 'SELECT * FROM HISTORICO_ATIVOS'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 597
    Top = 88
  end
  object dsp_HistoricoAtivos: TDataSetProvider
    DataSet = sql_HistoricoAtivos
    Options = [poAllowCommandText]
    Left = 597
    Top = 144
  end
  object cds_HistoricoAtivos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_HistoricoAtivos'
    Left = 597
    Top = 200
  end
  object ds_HistoricoAtivos: TDataSource
    DataSet = cds_HistoricoAtivos
    Left = 597
    Top = 256
  end
  object sql_Metas: TSQLDataSet
    CommandText = 'select * from METAS'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 446
    Top = 342
  end
  object dsp_Metas: TDataSetProvider
    DataSet = sql_Metas
    Options = [poAllowCommandText]
    Left = 446
    Top = 398
  end
  object cds_Metas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Metas'
    Left = 446
    Top = 454
    object cds_MetasID_META: TIntegerField
      FieldName = 'ID_META'
      Required = True
    end
    object cds_MetasDTINICIAL: TDateField
      FieldName = 'DTINICIAL'
    end
    object cds_MetasDTFINAL: TDateField
      FieldName = 'DTFINAL'
    end
    object cds_MetasVL_ABERTURAMETA: TFMTBCDField
      FieldName = 'VL_ABERTURAMETA'
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cds_MetasVL_FECHAMENTOMETA: TFMTBCDField
      FieldName = 'VL_FECHAMENTOMETA'
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cds_MetasRESULTADO: TStringField
      FieldName = 'RESULTADO'
      Size = 100
    end
    object cds_MetasMESANO: TStringField
      FieldName = 'MESANO'
      Size = 10
    end
    object cds_MetasSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object ds_Metas: TDataSource
    DataSet = cds_Metas
    Left = 448
    Top = 504
  end
  object sql_Pagamentos: TSQLDataSet
    CommandText = 'select * from Pagamentos'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 526
    Top = 342
  end
  object dsp_Pagamentos: TDataSetProvider
    DataSet = sql_Pagamentos
    Options = [poAllowCommandText]
    Left = 526
    Top = 398
  end
  object cds_Pagamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Pagamentos'
    Left = 526
    Top = 454
  end
  object ds_Pagamentos: TDataSource
    DataSet = cds_Pagamentos
    Left = 528
    Top = 504
  end
  object sql_Credores: TSQLDataSet
    CommandText = 'select * from credores ORDER BY credor'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 606
    Top = 342
  end
  object dsp_Credores: TDataSetProvider
    DataSet = sql_Credores
    Options = [poAllowCommandText]
    Left = 606
    Top = 398
  end
  object cds_Credores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Credores'
    Left = 606
    Top = 454
  end
  object ds_Credores: TDataSource
    DataSet = cds_Credores
    Left = 608
    Top = 504
  end
  object cds_TItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Backup'
    Left = 773
    Top = 205
  end
  object ds_TItens: TDataSource
    DataSet = cds_TItens
    Left = 773
    Top = 261
  end
  object sql_TItens: TSQLDataSet
    CommandText = 'SELECT * FROM T_ITENS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 773
    Top = 93
  end
  object dsp_TItens: TDataSetProvider
    DataSet = sql_TItens
    Options = [poAllowCommandText]
    Left = 773
    Top = 149
  end
  object dsp_Prazos: TDataSetProvider
    DataSet = sql_Prazos
    Options = [poAllowCommandText]
    Left = 853
    Top = 151
  end
  object cds_Prazos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Prazos'
    Left = 853
    Top = 207
  end
  object sql_Prazos: TSQLDataSet
    CommandText = 'SELECT * FROM PRAZOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 853
    Top = 95
  end
  object ds_Prazos: TDataSource
    DataSet = cds_Prazos
    Left = 853
    Top = 263
  end
  object sql_ContatosForne: TSQLDataSet
    CommandText = 'SELECT * FROM '#13#10'CONTATOS_FORNECEDORES'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 365
    Top = 336
  end
  object dsp_ContatosForne: TDataSetProvider
    DataSet = sql_ContatosForne
    Options = [poAllowCommandText]
    Left = 365
    Top = 392
  end
  object cds_ContatosForne: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_ContatosForne'
    Left = 365
    Top = 448
  end
  object ds_ContatosForne: TDataSource
    DataSet = cds_ContatosForne
    Left = 365
    Top = 504
  end
  object dsp_Similares: TDataSetProvider
    DataSet = sql_Similares
    Options = [poAllowCommandText]
    Left = 765
    Top = 399
  end
  object cds_Similares: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Similares'
    Left = 765
    Top = 455
  end
  object sql_Similares: TSQLDataSet
    CommandText = 'SELECT * FROM SIMILARES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 765
    Top = 343
  end
  object ds_Similares: TDataSource
    DataSet = cds_Similares
    Left = 765
    Top = 511
  end
  object dsp_Duplicatas: TDataSetProvider
    DataSet = sql_Duplicatas
    Options = [poAllowCommandText]
    Left = 853
    Top = 399
  end
  object cds_Duplicatas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Duplicatas'
    Left = 853
    Top = 455
  end
  object sql_Duplicatas: TSQLDataSet
    CommandText = 'SELECT * FROM DUPLICATAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 853
    Top = 343
  end
  object ds_Duplicatas: TDataSource
    DataSet = cds_Duplicatas
    Left = 853
    Top = 511
  end
  object dsp_Permissoes: TDataSetProvider
    DataSet = sql_Permissoes
    Options = [poAllowCommandText]
    Left = 941
    Top = 151
  end
  object cds_Permissoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Permissoes'
    Left = 941
    Top = 207
  end
  object sql_Permissoes: TSQLDataSet
    CommandText = 'SELECT * FROM PERMISSOES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 941
    Top = 95
  end
  object ds_Permissoes: TDataSource
    DataSet = cds_Permissoes
    Left = 941
    Top = 263
  end
  object dsp_ListaEmpresas: TDataSetProvider
    DataSet = sql_ListaEmpresas
    Options = [poAllowCommandText]
    Left = 949
    Top = 399
  end
  object cds_ListaEmpresas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_ListaEmpresas'
    Left = 949
    Top = 455
  end
  object sql_ListaEmpresas: TSQLDataSet
    CommandText = 'SELECT * FROM LISTAEMPRESAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao_dados
    Left = 949
    Top = 343
  end
  object ds_ListaEmpresas: TDataSource
    DataSet = cds_ListaEmpresas
    Left = 949
    Top = 511
  end
end
