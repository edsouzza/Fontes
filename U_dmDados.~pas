unit U_dmDados;

interface

uses
  SysUtils, Classes, Messages, DBXpress, FMTBcd, DB, DBClient, Provider,
  SqlExpr, Dialogs, Windows, Forms, IBCustomDataSet, IBQuery,
  IBDatabase, RpCon, RpConDS, RpRave, RpDefine, RpBase, RpSystem,
  IdBaseComponent, IdComponent, IdIPWatch;

type
  Tdm_Conexao = class(TDataModule)
    conexao_dados: TSQLConnection;
    sql_DadosFuncionarios: TSQLDataSet;
    dsp_DadosFuncionarios: TDataSetProvider;
    cds_DadosFuncionarios: TClientDataSet;
    ds_DadosFuncionarios: TDataSource;
    sql_FormaPagtos: TSQLDataSet;
    dsp_FormaPagtos: TDataSetProvider;
    cds_FormaPagtos: TClientDataSet;
    ds_FormaPagtos: TDataSource;
    intgrfld_FormaPagtosFORMA_ID: TIntegerField;
    strngfld_FormaPagtosFORMA_DESCRICAO: TStringField;
    dsp_CadProduto: TDataSetProvider;
    cds_CadProduto: TClientDataSet;
    ds_CadProduto: TDataSource;
    sql_CadProduto: TSQLDataSet;
    sql_unidades: TSQLDataSet;
    dsp_unidades: TDataSetProvider;
    cds_unidades: TClientDataSet;
    ds_unidades: TDataSource;
    dsp_acessos: TDataSetProvider;
    cds_acessos: TClientDataSet;
    sql_acessos: TSQLDataSet;
    ds_acessos: TDataSource;
    cds_AbreCaixa: TClientDataSet;
    ds_AbreCaixa: TDataSource;
    sql_AbreCaixa: TSQLDataSet;
    dsp_AbreCaixa: TDataSetProvider;
    cds_FechaCaixa: TClientDataSet;
    ds_FechaCaixa: TDataSource;
    sql_FechaCaixa: TSQLDataSet;
    dsp_FechaCaixa: TDataSetProvider;
    cds_Caixa: TClientDataSet;
    ds_Caixa: TDataSource;
    sql_Caixa: TSQLDataSet;
    dsp_Caixa: TDataSetProvider;
    cds_Backup: TClientDataSet;
    cds_BackupID_BACKUP: TIntegerField;
    cds_BackupTXT_ORIGEM: TStringField;
    cds_BackupTXT_DESTINO: TStringField;
    ds_Backup: TDataSource;
    sql_Backup: TSQLDataSet;
    dsp_Backup: TDataSetProvider;
    sql_Fabricante: TSQLDataSet;
    dsp_Fabricante: TDataSetProvider;
    cds_Fabricante: TClientDataSet;
    ds_Fabricante: TDataSource;
    cds_CadProdutoID_PRODUTO: TIntegerField;
    cds_CadProdutoCATEGORIA_ID: TIntegerField;
    cds_CadProdutoFABRICANTE_ID: TIntegerField;
    cds_CadProdutoCOD_BARRAS: TStringField;
    cds_CadProdutoDESCRICAO: TStringField;
    cds_CadProdutoPRECOVENDA: TBCDField;
    cds_CadProdutoDATACAD: TDateField;
    cds_CadProdutoMESANO: TStringField;
    cds_CadProdutoSTATUS: TStringField;
    sql_DadosClientes: TSQLDataSet;
    dsp_DadosClientes: TDataSetProvider;
    cds_DadosClientes: TClientDataSet;
    intgrfld_DadosClientesCLI_ID: TIntegerField;
    strngfld_DadosClientesCLI_NOME: TStringField;
    strngfld_DadosClientesCLI_APELIDO: TStringField;
    strngfld_DadosClientesCLI_ENDERECO: TStringField;
    strngfld_DadosClientesCLI_COMPLEMENTO: TStringField;
    strngfld_DadosClientesCLI_CEP: TStringField;
    cds_DadosClientesCLI_DDDFONE: TStringField;
    strngfld_DadosClientesCLI_FONE: TStringField;
    cds_DadosClientesCLI_DDDFONE2: TStringField;
    cds_DadosClientesCLI_FONE2: TStringField;
    cds_DadosClientesCLI_DDDFONE3: TStringField;
    cds_DadosClientesCLI_FONE3: TStringField;
    cds_DadosClientesCLI_DDDFONE4: TStringField;
    cds_DadosClientesCLI_FONE4: TStringField;
    strngfld_DadosClientesCLI_EMAIL: TStringField;
    strngfld_DadosClientesCLI_DATACAD: TStringField;
    strngfld_DadosClientesCLI_STATUS: TStringField;
    cds_DadosClientesCLI_DATANASCTO: TDateField;
    ds_DadosClientes: TDataSource;
    sql_Fornecedor: TSQLDataSet;
    dsp_Fornecedor: TDataSetProvider;
    cds_Fornecedor: TClientDataSet;
    intgrfld_FornecedorFORNE_ID: TIntegerField;
    strngfld_FornecedorFORNE_NOME: TStringField;
    strngfld_FornecedorFORNE_APELIDO: TStringField;
    strngfld_FornecedorFORNE_ENDERECO: TStringField;
    strngfld_FornecedorFORNE_COMPLEMENTO: TStringField;
    strngfld_FornecedorFORNE_CEP: TStringField;
    cds_FornecedorFORNE_DDDFONE: TStringField;
    strngfld_FornecedorFORNE_FONE: TStringField;
    cds_FornecedorFORNE_DDDFONE2: TStringField;
    cds_FornecedorFORNE_FONE2: TStringField;
    cds_FornecedorFORNE_DDDFONE3: TStringField;
    cds_FornecedorFORNE_FONE3: TStringField;
    cds_FornecedorFORNE_DDDFONE4: TStringField;
    cds_FornecedorFORNE_FONE4: TStringField;
    strngfld_FornecedorFORNE_EMAIL: TStringField;
    strngfld_FornecedorFORNE_DATACAD: TStringField;
    cds_FornecedorFORNE_STATUS: TStringField;
    ds_Fornecedor: TDataSource;
    cds_CadProdutoFABRICANTE: TStringField;
    cds_CadProdutoTIPO: TStringField;
    cds_CadProdutoFORNECEDOR_ID: TIntegerField;
    sql_HistoricoAtivos: TSQLDataSet;
    dsp_HistoricoAtivos: TDataSetProvider;
    cds_HistoricoAtivos: TClientDataSet;
    ds_HistoricoAtivos: TDataSource;
    cds_CadProdutoUNIDADE: TStringField;
    cds_CadProdutoALIQUOTA: TStringField;
    cds_DadosClientesCLI_IE: TStringField;
    cds_CadProdutoVALORDELUCRO: TFMTBCDField;
    sql_Metas: TSQLDataSet;
    dsp_Metas: TDataSetProvider;
    cds_Metas: TClientDataSet;
    ds_Metas: TDataSource;
    sql_Pagamentos: TSQLDataSet;
    dsp_Pagamentos: TDataSetProvider;
    cds_Pagamentos: TClientDataSet;
    ds_Pagamentos: TDataSource;
    sql_Credores: TSQLDataSet;
    dsp_Credores: TDataSetProvider;
    cds_Credores: TClientDataSet;
    ds_Credores: TDataSource;
    cds_CadProdutoPRECOCOMPRA: TFMTBCDField;
    cds_MetasID_META: TIntegerField;
    cds_MetasDTINICIAL: TDateField;
    cds_MetasDTFINAL: TDateField;
    cds_MetasVL_ABERTURAMETA: TFMTBCDField;
    cds_MetasVL_FECHAMENTOMETA: TFMTBCDField;
    cds_MetasRESULTADO: TStringField;
    cds_MetasMESANO: TStringField;
    cds_MetasSTATUS: TStringField;
    cds_TItens: TClientDataSet;
    ds_TItens: TDataSource;
    sql_TItens: TSQLDataSet;
    dsp_TItens: TDataSetProvider;
    dsp_Prazos: TDataSetProvider;
    cds_Prazos: TClientDataSet;
    sql_Prazos: TSQLDataSet;
    ds_Prazos: TDataSource;
    cds_FornecedorFORNE_IE: TStringField;
    cds_FornecedorFORNE_CNPJ: TStringField;
    sql_ContatosForne: TSQLDataSet;
    dsp_ContatosForne: TDataSetProvider;
    cds_ContatosForne: TClientDataSet;
    ds_ContatosForne: TDataSource;
    dsp_Similares: TDataSetProvider;
    cds_Similares: TClientDataSet;
    sql_Similares: TSQLDataSet;
    ds_Similares: TDataSource;
    dsp_Duplicatas: TDataSetProvider;
    cds_Duplicatas: TClientDataSet;
    sql_Duplicatas: TSQLDataSet;
    ds_Duplicatas: TDataSource;
    cds_CadProdutoOBS: TStringField;
    cds_DadosClientesCLI_OBS: TStringField;
    cds_CadProdutoESTOQUE_ATUAL: TFMTBCDField;
    cds_CadProdutoESTOQUEMINIMO: TFMTBCDField;
    cds_DadosClientesCLI_CPF: TStringField;
    cds_DadosClientesCLI_CNPJ: TStringField;
    cds_DadosClientesCLI_HISTORICO: TMemoField;
    dsp_Permissoes: TDataSetProvider;
    cds_Permissoes: TClientDataSet;
    sql_Permissoes: TSQLDataSet;
    ds_Permissoes: TDataSource;
    dsp_ListaEmpresas: TDataSetProvider;
    cds_ListaEmpresas: TClientDataSet;
    sql_ListaEmpresas: TSQLDataSet;
    ds_ListaEmpresas: TDataSource;
    cds_CadProdutoCOD_ALT1: TStringField;
    cds_CadProdutoCOD_ALT2: TStringField;
    cds_CadProdutoCOD_ALT3: TStringField;
    cds_CadProdutoCOD_ALT4: TStringField;
    cds_CadProdutoPERCENTLUCRO: TFMTBCDField;
    cds_FornecedorFORNE_OBS: TStringField;


  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  dm_Conexao   : Tdm_Conexao;


implementation


{$R *.dfm}          


end.
