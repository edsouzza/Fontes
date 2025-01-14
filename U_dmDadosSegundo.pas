unit U_dmDadosSegundo;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, Provider, DB, DBClient, SqlExpr,
  Encryp, Controls, Grids, DBGrids, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZConnection, IBCustomDataSet, IBDatabase, IBQuery;

type
  Tdm_DadosSegundo = class(TDataModule)
    dsp_CadFuncoes: TDataSetProvider;
    cds_CadFuncoes: TClientDataSet;
    ds_CadFuncoes: TDataSource;
    sql_CadFuncoes: TSQLDataSet;
    dsp_Login: TDataSetProvider;
    cds_Login: TClientDataSet;
    ds_Login: TDataSource;
    sql_login: TSQLDataSet;
    criptografa: TTomEncryption;
    dsp_Expiracao: TDataSetProvider;
    cds_Expiracao: TClientDataSet;
    ds_Expiracao: TDataSource;
    sql_Expiracao: TSQLDataSet;
    sql_CodBarra: TSQLDataSet;
    dsp_CodBarra: TDataSetProvider;
    cds_CodBarra: TClientDataSet;
    ds_CodBarra: TDataSource;
    dsp_Venda: TDataSetProvider;
    cds_Venda: TClientDataSet;
    ds_Venda: TDataSource;
    sql_ItensVendas: TSQLDataSet;
    dsp_ItensVendas: TDataSetProvider;
    cds_ItensVendas: TClientDataSet;
    ds_ItensVendas: TDataSource;
    dsp_TiposPgtos: TDataSetProvider;
    cds_TiposPgtos: TClientDataSet;
    ds_TiposPgtos: TDataSource;
    sql_TiposPgtos: TSQLDataSet;
    dsp_Config: TDataSetProvider;
    cds_Config: TClientDataSet;
    ds_Config: TDataSource;
    sql_Config: TSQLDataSet;
    cds_ConfigFOTOS: TStringField;
    cds_ConfigP1: TStringField;
    cds_ConfigP2: TStringField;
    cds_ConfigP3: TStringField;
    cds_ConfigP4: TStringField;
    cds_ConfigP5: TStringField;
    dsp_Categorias: TDataSetProvider;
    cds_Categorias: TClientDataSet;
    ds_Categorias: TDataSource;
    sql_Categorias: TSQLDataSet;
    DBGrid1: TDBGrid;
    dsp_cotacao: TDataSetProvider;
    cds_cotacao: TClientDataSet;
    ds_cotacao: TDataSource;
    sql_cotacao: TSQLDataSet;
    dsp_ICotacao: TDataSetProvider;
    cds_ICotacao: TClientDataSet;
    ds_ICotacao: TDataSource;
    sql_ICotacao: TSQLDataSet;
    dsp_TCotacao: TDataSetProvider;
    cds_TCotacao: TClientDataSet;
    ds_TCotacao: TDataSource;
    sql_TCotacao: TSQLDataSet;
    cds_ICotacaoID_DETALHESCOTACAO: TIntegerField;
    cds_ICotacaoCOTACAO_ID: TIntegerField;
    cds_ICotacaoPRODUTO_ID: TIntegerField;
    cds_ICotacaoUNITARIO: TFMTBCDField;
    cds_ICotacaoQUANTIDADE: TFMTBCDField;
    cds_TCotacaoID_DETALHESCOTACAO: TIntegerField;
    cds_TCotacaoCOTACAO_ID: TIntegerField;
    cds_TCotacaoPRODUTO_ID: TIntegerField;
    cds_TCotacaoUNITARIO: TFMTBCDField;
    cds_TCotacaoQUANTIDADE: TFMTBCDField;
    cds_TCotacaoTOTALITEM: TFMTBCDField;
    cds_ICotacaoTOTALITEM: TFMTBCDField;
    cds_TCotacaototal_item: TCurrencyField;
    cds_TCotacaototal_geral: TAggregateField;
    cds_TCotacaoFLAG: TStringField;
    cds_ICotacaoFLAG: TStringField;
    cds_TCotacaoPRODUTO: TStringField;
    dsp_Orcamento: TDataSetProvider;
    cds_Orcamento: TClientDataSet;
    ds_Orcamento: TDataSource;
    sql_Orcamento: TSQLDataSet;
    dsp_IOrcamento: TDataSetProvider;
    cds_IOrcamento: TClientDataSet;
    ds_IOrcamento: TDataSource;
    sql_IOrcamento: TSQLDataSet;
    dsp_TOrcamento: TDataSetProvider;
    cds_TOrcamento: TClientDataSet;
    ds_TOrcamento: TDataSource;
    sql_TOrcamento: TSQLDataSet;
    dsp_HistoricoProdutos: TDataSetProvider;
    cds_HistoricoProdutos: TClientDataSet;
    ds_HistoricoProdutos: TDataSource;
    sql_HistoricoProdutos: TSQLDataSet;
    sql_OS: TSQLDataSet;
    dsp_OS: TDataSetProvider;
    cds_OS: TClientDataSet;
    ds_OS: TDataSource;
    cds_OSID_OS: TIntegerField;
    cds_OSCLIENTE_ID: TIntegerField;
    cds_OSEQUIPAMENTO: TStringField;
    cds_OSNUMSERIE: TStringField;
    cds_OSMARCA: TStringField;
    cds_OSMODELO: TStringField;
    cds_OSACESSORIOS: TStringField;
    cds_OSVL_ORCAMENTO: TFMTBCDField;
    cds_OSPROBLEMA: TStringField;
    cds_OSDATA_ABERTURA: TDateField;
    cds_OSDATA_FECHAMENTO: TDateField;
    cds_OSSTATUS: TStringField;
    cds_OSCLIENTE: TStringField;
    cds_OSCLI_ID: TIntegerField;
    cds_OSCLI_NOME: TStringField;
    cds_OSCLI_ENDERECO: TStringField;
    cds_OSCLI_CEP: TStringField;
    cds_OSCLI_DDDFONE: TStringField;
    cds_OSCLI_FONE: TStringField;
    cds_OSCLI_DDDFONE4: TStringField;
    cds_OSCLI_FONE4: TStringField;
    cds_OSCLI_EMAIL: TStringField;
    cds_OSCLI_COMPLEMENTO: TStringField;
    cds_OSOPERADOR_ID: TIntegerField;
    cds_OSCLI_STATUS: TStringField;
    sql_Empresa: TSQLDataSet;
    dsp_Empresa: TDataSetProvider;
    cds_Empresa: TClientDataSet;
    ds_Empresa: TDataSource;
    sql_Servicos: TSQLDataSet;
    dsp_Servicos: TDataSetProvider;
    cds_Servicos: TClientDataSet;
    ds_Servicos: TDataSource;
    cds_ServicosID_SERVICO: TIntegerField;
    cds_ServicosCODBARRAS: TStringField;
    cds_ServicosDESCRICAO: TStringField;
    cds_ServicosVALOR: TFMTBCDField;
    cds_ServicosTIPO: TStringField;
    cds_ServicosSTATUS: TStringField;
    cds_ServicosDATA: TDateField;
    sql_CodBarServicos: TSQLDataSet;
    dsp_CodBarServicos: TDataSetProvider;
    cds_CodBarServicos: TClientDataSet;
    ds_CodBarServicos: TDataSource;
    cds_ServicosOPERADOR_ID: TIntegerField;
    dsp_CPedido: TDataSetProvider;
    cds_CPedido: TClientDataSet;
    ds_CPedido: TDataSource;
    sql_CPedido: TSQLDataSet;
    dsp_IPedido: TDataSetProvider;
    cds_IPedido: TClientDataSet;
    ds_IPedido: TDataSource;
    sql_IPedido: TSQLDataSet;
    dsp_TPedido: TDataSetProvider;
    cds_TPedido: TClientDataSet;
    cds_TPedidoID_PEDIDOTEMP: TIntegerField;
    cds_TPedidoPEDIDO_ID: TIntegerField;
    cds_TPedidoPRODUTO_ID: TIntegerField;
    cds_TPedidoVL_UNITARIO: TFMTBCDField;
    cds_TPedidoQDE: TFMTBCDField;
    cds_TPedidoVL_TOTALITEM: TFMTBCDField;
    cds_TPedidoTotal_Item: TFloatField;
    cds_TPedidoPRODUTO: TStringField;
    cds_TPedidoTOTAL: TAggregateField;
    ds_TPedido: TDataSource;
    sql_TPedido: TSQLDataSet;
    cds_IOrcamentoID_DETALHESORC: TIntegerField;
    cds_IOrcamentoORC_ID: TIntegerField;
    cds_TOrcamentoID_DETALHESORC: TIntegerField;
    cds_TOrcamentoORC_ID: TIntegerField;
    cds_TOrcamentototal_geral: TAggregateField;
    cds_IOrcamentoFLAG: TStringField;
    cds_TOrcamentoFLAG: TStringField;
    cds_TOrcamentototal_item: TCurrencyField;
    cds_IOrcamentoVALOR_PECAS: TFMTBCDField;
    cds_TOrcamentoVALOR_PECAS: TFMTBCDField;
    sql_Agendamentos: TSQLDataSet;
    dsp_Agendamentos: TDataSetProvider;
    cds_Agendamentos: TClientDataSet;
    ds_Agendamentos: TDataSource;
    sql_Ativos_Credito: TSQLDataSet;
    dsp_Ativos_Credito: TDataSetProvider;
    cds_Ativos_Credito: TClientDataSet;
    ds_Ativos_Credito: TDataSource;
    cds_IOrcamentoVALOR_ITEM: TFMTBCDField;
    cds_IOrcamentoTOTAL: TFMTBCDField;
    cds_TOrcamentoVALOR_ITEM: TFMTBCDField;
    cds_TOrcamentoTOTAL: TFMTBCDField;
    cds_TOrcamentoQUANTIDADE: TFMTBCDField;
    cds_IOrcamentoQUANTIDADE: TFMTBCDField;
    cds_OSCLI_CPF: TStringField;
    cds_OSCLI_CNPJ: TStringField;
    dsp_LogOperacoes: TDataSetProvider;
    cds_LogOperacoes: TClientDataSet;
    ds_LogOperacoes: TDataSource;
    sql_LogOperacoes: TSQLDataSet;
    IBanco: TIBDatabase;
    IB_Estatisticas: TIBQuery;
    IBTransaction: TIBTransaction;
    IB_EstatisticasTOTAL: TIBBCDField;
    IB_EstatisticasMESANO: TIBStringField;
    IB_EstatisticasNUMMES: TIntegerField;
    sql_Venda: TSQLDataSet;
    dsp_MovCaixa: TDataSetProvider;
    cds_MovCaixa: TClientDataSet;
    ds_MovCaixa: TDataSource;
    sql_MovCaixa: TSQLDataSet;
    cds_MovCaixaID_MOVIMENTO: TIntegerField;
    cds_MovCaixaVALOR: TFMTBCDField;
    cds_MovCaixaHISTORICO: TStringField;
    cds_MovCaixaTIPO: TStringField;
    cds_MovCaixaDATA: TDateField;
    cds_TOrcamentoITEM_ID: TIntegerField;
    cds_IOrcamentoITEM_ID: TIntegerField;
    dsp_Segmentos: TDataSetProvider;
    cds_Segmentos: TClientDataSet;
    ds_Segmentos: TDataSource;
    sql_Segmentos: TSQLDataSet;
    dsp_Contatos: TDataSetProvider;
    cds_Contatos: TClientDataSet;
    ds_Contatos: TDataSource;
    sql_Contatos: TSQLDataSet;
    cds_IOrcamentoDESCRICAO: TStringField;
    cds_TOrcamentoDESCRICAO: TStringField;
    dsp_tipoimpressora: TDataSetProvider;
    cds_tipoimpressora: TClientDataSet;
    ds_tipoimpressora: TDataSource;
    sql_tipoimpressora: TSQLDataSet;
    dsp_anotacoes: TDataSetProvider;
    cds_anotacoes: TClientDataSet;
    ds_anotacoes: TDataSource;
    sql_anotacoes: TSQLDataSet;
    procedure cds_AbreAgendamentoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cds_TOrcamentoCalcFields(DataSet: TDataSet);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_DadosSegundo: Tdm_DadosSegundo;

implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao;

{$R *.dfm}

procedure Tdm_DadosSegundo.cds_AbreAgendamentoReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
raise Exception.Create(E.Message)
end;

procedure Tdm_DadosSegundo.cds_TOrcamentoCalcFields(DataSet: TDataSet);
begin

     dm_DadosSegundo.cds_TOrcamento.fieldbyname('total_item').Value :=
                    dm_DadosSegundo.cds_TOrcamento.fieldbyname('valor_item').AsFloat *
                                 dm_DadosSegundo.cds_TOrcamento.fieldbyname('quantidade').AsFloat;       

end;

end.
