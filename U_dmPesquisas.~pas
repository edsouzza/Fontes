unit U_dmPesquisas;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr;

type
  TDM_Pesq = class(TDataModule)
    sdsPesquisas: TSQLDataSet;
    dspPesquisa: TDataSetProvider;
    cdsPesqProduto: TClientDataSet;
    qry_Produtos: TSQLQuery;
    ds_QryGeral: TDataSource;
    qry_Cod: TSQLQuery;
    dsPesqProduto: TDataSource;
    cdsPesqFuncionarios: TClientDataSet;
    dsPesqFuncionarios: TDataSource;
    cdsPesqAutenticacao: TClientDataSet;
    dsPesqAutenticacao: TDataSource;
    dsPesqConsFuncionarios: TDataSource;
    cdsPesqFormaPagto: TClientDataSet;
    dsPesqFormaPagto: TDataSource;
    cdsPesqConsFuncionarios: TClientDataSet;
    cdsPesqLogin: TClientDataSet;
    dsPesqLogin: TDataSource;
    cdsPesqLoginPermissoes: TClientDataSet;
    dsPesqLoginPermissoes: TDataSource;
    qry_Vendas: TSQLQuery;
    qry_VendasID_PRODUTO: TIntegerField;
    qry_VendasCOD_BARRAS: TStringField;
    qry_VendasDESCRICAO: TStringField;
    qry_VendasPRECOVENDA: TBCDField;
    qry_VendasDATACAD: TDateField;
    qry_VendasOBS: TStringField;
    qry_VendasMESANO: TStringField;
    qry_VendasSTATUS: TStringField;
    cdsPesqVendaProduto: TClientDataSet;
    dsPesqVendaProduto: TDataSource;
    cdsPesqVendaProdutoID_PRODUTO: TIntegerField;
    cdsPesqVendaProdutoCOD_BARRAS: TStringField;
    cdsPesqVendaProdutoDESCRICAO: TStringField;
    cdsPesqVendaProdutoPRECOVENDA: TBCDField;
    cdsPesqVendaProdutoDATACAD: TDateField;
    cdsPesqVendaProdutoOBS: TStringField;
    cdsPesqVendaProdutoMESANO: TStringField;
    cdsPesqVendaProdutoSTATUS: TStringField;
    cdsPesqItensVendas: TClientDataSet;
    dsPesqItensVendas: TDataSource;
    cdsPesqItensVendasID_ITENS: TIntegerField;
    cdsPesqItensVendasID_VENDA: TIntegerField;
    cdsPesqItensVendasID_PRODUTO: TIntegerField;
    cdsPesqItensVendasVL_UNITARIO: TFMTBCDField;
    cdsPesqItensVendasVL_TOTALITEM: TFMTBCDField;
    cdsPesqItensVendasFLAG_DEVOLUCAO: TStringField;
    Qry_Auxiliar: TSQLQuery;
    dsPesqVenda: TDataSource;
    cdsPesqVenda: TClientDataSet;
    cdsPesqCliente: TClientDataSet;
    dsPesqCliente: TDataSource;
    cdsPesqProdutosCotacao: TClientDataSet;
    dsPesqProdutosCotacao: TDataSource;
    cdsPesqListaCotacoes: TClientDataSet;
    dsPesqListaCotacoes: TDataSource;
    cdsPesqClientesCotacao: TClientDataSet;
    dsPesqClientesCotacao: TDataSource;
    cdsPesqFuncionariosCotacao: TClientDataSet;
    dsPesqFuncionariosCotacao: TDataSource;
    Qry_Geral: TSQLQuery;
    cdsPesqFornecedor: TClientDataSet;
    dsPesqFornecedor: TDataSource;
    cdsPesqProdutosPedido: TClientDataSet;
    dsPesqProdutosPedido: TDataSource;
    cdsPesqListaPedidos: TClientDataSet;
    dsPesqListaPedidos: TDataSource;
    cdsPesqListaPedidosID_PEDIDO: TIntegerField;
    cdsPesqListaPedidosID_OPERADOR: TIntegerField;
    cdsPesqListaPedidosNUMPEDIDO: TStringField;
    cdsPesqListaPedidosNUMNF: TStringField;
    cdsPesqListaPedidosFORNECEDOR_ID: TIntegerField;
    cdsPesqListaPedidosDATA_ABERTURA: TDateField;
    cdsPesqListaPedidosDATA_ENTREGA: TDateField;
    cdsPesqListaPedidosVL_TOTALPEDIDO: TFMTBCDField;
    cdsPesqListaPedidosSTATUS: TStringField;
    cdsPesqListaTodosPedidos: TClientDataSet;
    dsPesqListaTodosPedidos: TDataSource;
    cdsPesqGeral: TClientDataSet;
    dsPesqGeral: TDataSource;
    cdsPesqAgendamentos: TClientDataSet;
    dsPesqAgendamentos: TDataSource;
    cdsPesqServicos: TClientDataSet;
    dsPesqServicos: TDataSource;
    ds_QryAtuxiliar: TDataSource;
    cdsPesqCredores: TClientDataSet;
    dsPesqCredores: TDataSource;
    cdsPesqClientesOrcamento: TClientDataSet;
    dsPesqClientesOrcamento: TDataSource;
    cdsPesqListaOrcamentos: TClientDataSet;
    dsPesqListaOrcamentos: TDataSource;
    cdsPesqContatos: TClientDataSet;
    dsPesqContatos: TDataSource;
    cdsPesqListaPedidosCONTATO_ID: TIntegerField;
    dsPesqAuxiliar: TDataSource;
    cdsPesqAuxiliar: TClientDataSet;
    cdsPesqConsulta: TClientDataSet;
    dsPesqConsulta: TDataSource;
    cdsPesqListaPedidosPRAZO_ID: TIntegerField;
    cdsPesqListaPedidosPRAZO: TStringField;
    qry_VendasESTOQUE_ATUAL: TFMTBCDField;
    qry_VendasESTOQUEMINIMO: TFMTBCDField;
    cdsPesqItensVendasQUANTIDADE: TFMTBCDField;
    cdsPesqVendaProdutoESTOQUE_ATUAL: TFMTBCDField;
    cdsPesqVendaProdutoESTOQUEMINIMO: TFMTBCDField;
    cdsPesqContas: TClientDataSet;
    dsPesqContas: TDataSource;
    qry_VendasCATEGORIA_ID: TIntegerField;
    qry_VendasFABRICANTE_ID: TIntegerField;
    qry_VendasFORNECEDOR_ID: TIntegerField;
    qry_VendasCOD_ALT1: TStringField;
    qry_VendasCOD_ALT2: TStringField;
    qry_VendasCOD_ALT3: TStringField;
    qry_VendasCOD_ALT4: TStringField;
    qry_VendasPRECOCOMPRA: TFMTBCDField;
    qry_VendasVALORDELUCRO: TFMTBCDField;
    qry_VendasUNIDADE: TStringField;
    qry_VendasTIPO: TStringField;
    qry_VendasALIQUOTA: TStringField;
    sqlPesqGeral: TSQLDataSet;
    dspPesqGeral: TDataSetProvider;
    sqlPesqAuxiliar: TSQLDataSet;
    dspPesqAuxiliar: TDataSetProvider;
    sqlPesqConsulta: TSQLDataSet;
    dspPesqConsulta: TDataSetProvider;
    sqlPesqContas: TSQLDataSet;
    dspPesqContas: TDataSetProvider;
    sqlPesFormaPagto: TSQLDataSet;
    dspPesqFormaPagto: TDataSetProvider;
    sqlPesqProduto: TSQLDataSet;
    dspPesqProduto: TDataSetProvider;
    sqlPesqLogin: TSQLDataSet;
    dspPesqLogin: TDataSetProvider;
    sqlPesqFuncionarios: TSQLDataSet;
    dspPesqFuncionarios: TDataSetProvider;
    sqlPesqConsFuncionarios: TSQLDataSet;
    dspPesqConsFuncionarios: TDataSetProvider;
    sqlPesqVenda: TSQLDataSet;
    dspPesqVenda: TDataSetProvider;
    sqlPesqCliente: TSQLDataSet;
    dspPesqCliente: TDataSetProvider;
    sqlPesqItensVendas: TSQLDataSet;
    dspPesqItensVendas: TDataSetProvider;
    sqlPesqCredores: TSQLDataSet;
    dspPesqCredores: TDataSetProvider;
    sqlPesqContatos: TSQLDataSet;
    dspPesqContatos: TDataSetProvider;
    sqlPesqAutenticacao: TSQLDataSet;
    dspPesqAutenticacao: TDataSetProvider;
    sqlPesqLoginPermissoes: TSQLDataSet;
    dspPesqLoginPermissoes: TDataSetProvider;
    sqlPesqVendaProduto: TSQLDataSet;
    dspPesqVendaProduto: TDataSetProvider;
    sqlPesqProdutosCotacao: TSQLDataSet;
    dspPesqProdutosCotacao: TDataSetProvider;
    sqlPesqListaCotacoes: TSQLDataSet;
    dspPesqListaCotacoes: TDataSetProvider;
    sqlPesqClientesCotacao: TSQLDataSet;
    dspPesqClientesCotacao: TDataSetProvider;
    sqlPesqListaOrcamentos: TSQLDataSet;
    dspPesqListaOrcamentos: TDataSetProvider;
    sqlPesqFuncionariosCotacao: TSQLDataSet;
    dspPesqFuncionariosCotacao: TDataSetProvider;
    sqlPesqFornecedor: TSQLDataSet;
    dspPesqFornecedor: TDataSetProvider;
    sqlPesqProdutosPedido: TSQLDataSet;
    dspPesqProdutosPedido: TDataSetProvider;
    sqlPesqListaPedidos: TSQLDataSet;
    dspPesqListaPedidos: TDataSetProvider;
    sqlPesqListaTodosPedidos: TSQLDataSet;
    dspPesqListaTodosPedidos: TDataSetProvider;
    sqlPesqAgendamentos: TSQLDataSet;
    dspPesqAgendamentos: TDataSetProvider;
    sqlPesqServicos: TSQLDataSet;
    dspPesqServicos: TDataSetProvider;
    sqlPesqClientesOrcamento: TSQLDataSet;
    dspPesqClientesOrcamento: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_Pesq: TDM_Pesq;

implementation

uses U_dmDados;

{$R *.dfm}

end.

