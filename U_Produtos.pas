unit U_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, u_cadastrasimilar,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, SqlExpr, ToolEdit,
  CurrEdit, DB, Menus, ComCtrls, DateUtils, ExtDlgs, EditNum, Inifiles, u_cadprodutos, AppEvnts;

type
  T_frmProdutos = class(TForm)
    pan_titulo: TPanel;
    pan_botoes: TPanel;
    btnEntrarProduto: TSpeedButton;
    btnCadastrarProduto: TSpeedButton;
    btnInativar: TSpeedButton;
    btnSair: TSpeedButton;
    btnimprimir: TSpeedButton;
    pangrid_inclusao: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    PanGridCadEntradas: TPanel;
    pnl_Produto: TPanel;
    lstEscolheTipoRel: TListBox;
    pnl_Periodo: TPanel;
    lbl41: TLabel;
    edt_DataInicio_RelEntrada: TDateEdit;
    lbl42: TLabel;
    edt_DataFim_RelEntrada: TDateEdit;
    btnPesquisar: TSpeedButton;
    btnFechar: TSpeedButton;
    grBotoesNovaEntrada: TGroupBox;
    btnGravarEntrada: TSpeedButton;
    GroupBox3: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    pangrid_BaixaNoEstoque: TPanel;
    grp_Cabecalho: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    db_Descricao: TDBEdit;
    db_IDDOPRODUTO: TDBEdit;
    db_ESTOQUEATUAL: TDBEdit;
    GroupBox10: TGroupBox;
    btnBaixarDoEstoque: TSpeedButton;
    btnSairBaixaProdutos: TSpeedButton;
    btnBaixarProdutos: TSpeedButton;
    GroupBox11: TGroupBox;
    Label4: TLabel;
    edt_NomeProdutoEntrada: TEdit;
    Label5: TLabel;
    edt_EstoqueAtual: TEdit;
    Label6: TLabel;
    edt_QuantidadeNovaEntrada: TEdit;
    edt_IDProduto: TEdit;
    grp1: TGroupBox;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label9: TLabel;
    bloco_Foto: TGroupBox;
    btnEscolherFoto: TBitBtn;
    GroupBox1: TGroupBox;
    btnConfirmaInclusao: TSpeedButton;
    btnRetornaDaInclusao: TSpeedButton;
    btnCancelarInclusao: TSpeedButton;
    pangrid_visualizacao: TPanel;
    txtMsg: TStaticText;
    txtQdeItens: TStaticText;
    abrefoto: TOpenPictureDialog;
    Label10: TLabel;
    Label1: TLabel;
    btnFabricantes: TSpeedButton;
    grPesquisa: TGroupBox;
    edtConsProduto: TEdit;
    DBIDFornecedor: TDBEdit;
    btnCategorias: TSpeedButton;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    edtLucro: TEdit;
    edtPrecoCompra: TEditNum;
    edtPrecoVenda: TEditNum;
    btnSairCadastro: TSpeedButton;
    bloco_campos_inclusao: TGroupBox;
    lbl11: TLabel;
    lbl22: TLabel;
    lbl2: TLabel;
    Label17: TLabel;
    Label26: TLabel;
    Label23: TLabel;
    DBFornecedor: TLabel;
    lblLucro: TLabel;
    lbl16: TLabel;
    Label20: TLabel;
    lbl35: TLabel;
    Label21: TLabel;
    Label18: TLabel;
    Label31: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    edt_CodAlt1: TEdit;
    edt_DescricaoCadProduto: TEdit;
    txtEstoqueMinimo: TEdit;
    DBCategoria: TDBLookupComboBox;
    DBFabricante: TDBLookupComboBox;
    DBFornecedorProduto: TDBLookupComboBox;
    edt_precocompra: TEditNum;
    edt_percentual: TEditNum;
    edt_precovenda: TEditNum;
    edt_QuantidadeDeEntrada: TEdit;
    cmbUnidade: TComboBox;
    cmbAliquota: TComboBox;
    edt_Lucro: TEditNum;
    edt_CodAlt2: TEdit;
    edt_CodAlt3: TEdit;
    edt_CodAlt4: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    edt_MotivoDaBaixa: TEdit;
    edt_QuantidadeDaBaixa: TEditNum;
    btnNovoProduto: TSpeedButton;
    txtStatusCadastro: TStaticText;
    PanGridAlteraFotoProdutos: TPanel;
    btnAlterarProduto: TSpeedButton;
    grid_VisualizaProdutos: TDBGrid;
    edt_CodBarrasNovaEntrada: TEdit;
    cod_barra: TImage;
    Label55: TLabel;
    cod_barras: TImage;
    DBIDFabr: TDBEdit;
    DBIDFornec: TDBEdit;
    DBIDCat: TDBEdit;
    edt_CodigoProduto: TEdit;
    Label56: TLabel;
    GroupBox5: TGroupBox;
    edtAplicacao: TEdit;
    db_CODIGOBARRAS: TDBEdit;
    Label3: TLabel;
    Label19: TLabel;
    lblStatusLogoff: TLabel;
    GroupBox9: TGroupBox;
    img_MostraProdutoParaAlteracao: TImage;
    btnAlterarFotoProduto: TSpeedButton;
    btnSairAlteracaoProduto: TSpeedButton;
    edtCodBarrasProduto: TStaticText;
    edtNomeProduto: TStaticText;
    edtPercentLucro: TEdit;
    Label14: TLabel;
    img_CadProduto: TImage;
    img_mostraproduto: TImage;
    btnForncedores: TSpeedButton;
    imgInformacao: TImage;
    grDados: TGroupBox;
    grCampos: TGroupBox;
    lbl1: TLabel;
    lbl7: TLabel;
    lbl5: TLabel;
    lbl31: TLabel;
    lbl23: TLabel;
    lbl3: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label57: TLabel;
    Label33: TLabel;
    Label40: TLabel;
    dbedtPROD_DATACAD: TDBEdit;
    dbedtPROD_DESCRICAO: TDBEdit;
    dbCodBarrasTelaInicial: TDBEdit;
    dbedtPROD_PRECOVENDA: TDBEdit;
    dbedtESTOQUEMINIMO: TDBEdit;
    dbedtQUANTIDADE: TDBEdit;
    GroupBox8: TGroupBox;
    img_produto_telainicial: TImage;
    dbedtID_PRODUTO: TDBEdit;
    dbedtFORNECEDOR: TDBEdit;
    DBEDT_VALORCOMPRA: TDBEdit;
    DBEDT_VALORLUCRO: TDBEdit;
    DBEDT_CODALT1: TDBEdit;
    DBEDT_CODALT2: TDBEdit;
    DBEDT_CODALT3: TDBEdit;
    DBEDT_CODALT4: TDBEdit;
    dbedtPERCENTLUCRO: TDBEdit;
    dbedtCATEGORIA: TDBEdit;
    dbedFABRICANTE: TDBEdit;
    grOBS: TGroupBox;
    memoTelaPrin: TDBMemo;
    cmbTipoLucro: TComboBox;
    Label41: TLabel;

    //PROCEDIMENTOS PERSO
    procedure PesquisarRelatorio;
    procedure DesabilitarBotoesDeEntrada;
    procedure HabilitarBotoes;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure Abrir_Fechar_Tabelas;
    procedure GravarEntradaDeProdutos;
    procedure LimparCamposPrimeiraEntrada;
    procedure PesquisarCodBarProdutoParaEntrada;
    procedure PesquisarProdutoParaBaixa;
    procedure LimparPesquisaDeProdutos;
    procedure LimparCamposNovaEntrada;
    procedure CalcularValorDeLucro;
    procedure CalculaEstoqueMinimo;
    procedure CalcularValorTotalCompradoDoItem;
    procedure MostrarFotoProdutoTelaInicial;
    procedure MostrarFotoPadrao;
    procedure EscolherFotoParaCadastro;
    procedure VerificaEstoquesMinimos;
    procedure BaixarQdeUsadaDoEstoque;
    procedure CalcularPrecoVenda;
    procedure PesquisarProdutoPorNome;
    procedure PesquisarProdutoPorID;
    procedure GravaNovaEntradaDeProdutosCadastrados;
    procedure AtualizarHistoricoEP;
    procedure GravarProduto;
    procedure VerificarDuplicidadeCodBar;
    procedure AlterarPercentualDeLucro;
    procedure AlterarPrecoDeCompra;
    procedure AlterarPrecoDeCompraPelaTelaAlteracao;
    procedure AlterarPercentualDeLucroPelaTelaAlteracao;
    procedure AlterarEstoqueAtual;
    procedure AlterarEstoqueMinimo;
    procedure AlterarDescricaoProduto;
    procedure AlterarCodigoAlt;
    procedure CopiarFotoProdutoParaDiretorio;
    procedure DeletarFotoAlteradaDoDiretorio;
    procedure RenomearFotoAlteradaNoDiretorio;
    procedure AlterarFotoDoProduto;
    procedure gerarCodigoBarrasAuto;
    procedure copiarFotoPadraoComNomeDoCodigoBarras;
    procedure EstadoInicialDosBotoes;
    procedure MostrarDadosTelaInicial;
    procedure FormatarValoresComoMoeda;
    procedure MostraIdFuncionario;
    procedure GerarCodigoDeBarrasAuto;
    procedure BloquearCamposParaAlteracaoOBS;
    procedure LiberarCamposAposAlteracaoOBS;
    procedure GravarAlteracaoOBS;
    procedure InformacaoSobreAlteracaoDeCampos;
    procedure InativarProduto;
    procedure ListarCategorias;
    procedure ListarFornecedores;
    procedure ListarFabricantes;
    procedure CalcularPrecoVendaPorPercentual;
    procedure CalcularPrecoVendaPorValor;

    //PROCEDIMENTOS PADRAO
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmaInclusaoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnRetornaDaInclusaoClick(Sender: TObject);
    procedure dbedtPROD_PRECOVENDA2KeyPress(Sender: TObject; var Key: Char);
    procedure edt_statusKeyPress(Sender: TObject; var Key: Char);
    procedure edt_QuantidadeEntradaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_unidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_percentlucroKeyPress(Sender: TObject; var Key: Char);
    procedure edt_percent_estoqueminimoKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCadastrarProdutoClick(Sender: TObject);
    procedure btnCadastraFornecedorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEntrarProdutoClick(Sender: TObject);
    procedure btnSairDaRequisicaoClick(Sender: TObject);
    procedure edt_QuantidadeSaidaKeyPress(Sender: TObject; var Key: Char);
    procedure btnInativarClick(Sender: TObject);
    procedure dbID_FORNECEDOREnter(Sender: TObject);
    procedure dblkcbbID_CLIENTEEnter(Sender: TObject);
    procedure lstEscolheTipoRelClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edt_QuantidadeDeEntrada2KeyPress(Sender: TObject;
      var Key: Char);
    procedure btnCancelarInclusaoClick(Sender: TObject);
    procedure edt_PercentEstoqueMinimoKeyPress(Sender: TObject;
      var Key: Char);
    procedure msk_CepClienteKeyPress(Sender: TObject; var Key: Char);
    procedure msk_DataNasctoClienteKeyPress(Sender: TObject;
      var Key: Char);
    procedure msk_FoneClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edt_status_ClienteKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtESTOQUEMINIMOClick(Sender: TObject);
    procedure btnSairBaixaProdutosClick(Sender: TObject);
    procedure edt_ProdutoEntradaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_PercentualLucroKeyPress(Sender: TObject; var Key: Char);
    procedure edt_NumNotaKeyPress(Sender: TObject; var Key: Char);
    procedure db_NumSerieKeyPress(Sender: TObject; var Key: Char);
    procedure edt_QuantidadeNovaEntradaKeyPress(Sender: TObject;
      var Key: Char);
    procedure btnGravarEntradaClick(Sender: TObject);
    procedure dbedtPROD_PRECOVENDAExit(Sender: TObject);
    procedure grid_VisualizaProdutosCellClick(Column: TColumn);
    procedure btnEscolherFotoClick(Sender: TObject);
    procedure dbedtQUANTIDADEClick(Sender: TObject);
    procedure btnBaixarDoEstoqueClick(Sender: TObject);
    procedure btnBaixarProdutosClick(Sender: TObject);
    procedure Grid_BaixaCellClick(Column: TColumn);
    procedure txtEstoqueMinimoKeyPress(Sender: TObject; var Key: Char);
    procedure DBCategoriaClick(Sender: TObject);
    procedure btnSairAteracaoCategoriaClick(Sender: TObject);
    procedure edtConsProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConsProdutoChange(Sender: TObject);
    procedure DBFornecedoresClick(Sender: TObject);
    procedure edt_CodBarrasNovaEntradaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedtPROD_DESCRICAOExit(Sender: TObject);
    procedure btnFabricantesClick(Sender: TObject);
    procedure btnCategoriasClick(Sender: TObject);
    procedure DBFornecedorProdutoClick(Sender: TObject);
    procedure edt_QuantidadeDeEntrada2Click(Sender: TObject);
    procedure DBFabricanteClick(Sender: TObject);
    procedure edt_QuantidadeDeEntradaEnter(Sender: TObject);
    procedure edt_percentualExit(Sender: TObject);
    procedure edtPrecoCompraExit(Sender: TObject);
    procedure edt_QuantidadeNovaEntradaExit(Sender: TObject);
    procedure edtPrecoCompraClick(Sender: TObject);
    procedure edt_QuantidadeNovaEntradaEnter(Sender: TObject);
    procedure DBEDT_VALORCOMPRAClick(Sender: TObject);
    procedure btnSairCadastroClick(Sender: TObject);
    procedure edt_CodBarrasNovaEntradaEnter(Sender: TObject);
    procedure edt_DescricaoCadProdutoEnter(Sender: TObject);
    procedure edt_CodigoProdutoEnter(Sender: TObject);
    procedure edt_MotivoDaBaixaKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtID_PRODUTOClick(Sender: TObject);
    procedure btnNovoProdutoClick(Sender: TObject);
    procedure memoObsEnter(Sender: TObject);
    procedure edt_CodAlt1Enter(Sender: TObject);
    procedure edt_CodAlt2Enter(Sender: TObject);
    procedure edt_CodAlt3Enter(Sender: TObject);
    procedure edt_CodAlt4Enter(Sender: TObject);
    procedure edt_precocompraEnter(Sender: TObject);
    procedure edt_percentualEnter(Sender: TObject);
    procedure edt_precovendaEnter(Sender: TObject);
    procedure txtEstoqueMinimoEnter(Sender: TObject);
    procedure DBFabricanteEnter(Sender: TObject);
    procedure DBCategoriaEnter(Sender: TObject);
    procedure DBFornecedorProdutoEnter(Sender: TObject);
    procedure cmbAliquotaEnter(Sender: TObject);
    procedure cmbUnidadeEnter(Sender: TObject);
    procedure btnSairAlteracaoProdutoClick(Sender: TObject);
    procedure DBALTERAPRECOVENDAClick(Sender: TObject);
    procedure memoTelaPrinClick(Sender: TObject);
    procedure dbedtPROD_DESCRICAOClick(Sender: TObject);
    procedure DBEDT_CODALT1Click(Sender: TObject);
    procedure DBALTERAPRECOCOMPRAClick(Sender: TObject);
    procedure btnAlterarProdutoClick(Sender: TObject);
    procedure edt_QuantidadeDeEntradaKeyPress(Sender: TObject;
      var Key: Char);
    procedure bloco_FotoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edt_QuantidadeNovaEntradaClick(Sender: TObject);
    procedure edt_QuantidadeNovaEntradaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbCodBarrasTelaInicialClick(Sender: TObject);
    procedure dbedtPERCENTLUCROClick(Sender: TObject);
    procedure DBEDT_CODALT2Click(Sender: TObject);
    procedure DBEDT_CODALT3Click(Sender: TObject);
    procedure DBEDT_CODALT4Click(Sender: TObject);
    procedure memoTelaPrinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAlterarFotoProdutoClick(Sender: TObject);
    procedure edt_precocompraExit(Sender: TObject);
    procedure edt_QuantidadeDeEntradaExit(Sender: TObject);
    procedure edtAplicacaoEnter(Sender: TObject);
    procedure edt_DescricaoCadProdutoExit(Sender: TObject);
    procedure edtPercentLucroExit(Sender: TObject);
    procedure edtPercentLucroClick(Sender: TObject);
    procedure btnCadFornecedorClick(Sender: TObject);
    procedure edt_QuantidadeDaBaixaClick(Sender: TObject);
    procedure edtConsProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure btnForncedoresClick(Sender: TObject);
    procedure edt_DataInicio_RelEntradaClick(Sender: TObject);
    procedure edt_DataFim_RelEntradaClick(Sender: TObject);
    procedure imgInformacaoClick(Sender: TObject);
    procedure pangrid_visualizacaoMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure pan_botoesMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure txtQdeItensMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pan_tituloMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbedtCATEGORIAClick(Sender: TObject);
    procedure dbedtFORNECEDORClick(Sender: TObject);
    procedure dbedFABRICANTEClick(Sender: TObject);
    procedure edt_CodigoProdutoClick(Sender: TObject);
    procedure rdPORVALORClick(Sender: TObject);
    procedure edt_percentualKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTipoLucroClick(Sender: TObject);
    procedure cmbTipoLucroEnter(Sender: TObject);


  private
    { Private declarations }
    umProduto : TProduto;
    umSimilar : TSimilar;
    alterandoObs : boolean;


  public
    { Public declarations }
     CodigoBarrasParaCancelamento, CodBarServico, idProdutoPesquisa : string;

  end;

var
  _frmProdutos: T_frmProdutos;
  permitido, escolheuFornecedor, escolheuCategoria, escolheuFabricante, GerouCodBarra, escolheufotocadastro : Boolean;
  IdProduto, IDFornecedorEntrada, IDCategoriaEntrada, IDFabricanteEntrada   : integer;
  PrecoCusto, PrecoVenda, PercentualLucro, ValorTotal, PrecoCustoDeEntrada, PercentualLucroDeEntrada, PrecoVendaDeEntrada : Currency;
  ValorTotalDaComanda : Extended;
  idAlt, origem, Destino, caminho, sqlDefalt : String;
  PercentEstMinimo, QuantidadeEstoque, ValorDeEstoqueMinimo, estoque_atual, qde_NovaEntrada, novoestoque, percentual, valorCompra,
  PrecoDeCompra, PrecoDeVenda, ValorDeLucro, valorPercentual, novoprecocompra, precoVendas, valorLucro, precoCompra, PercentLucro : double;


implementation

uses U_dmDados, U_dmDadosSegundo, U_BiblioSysSalao, U_dmPesquisas, U_QRelProdutosCompleto,
  U_QRelProdutosIndividual, U_QRelEntradaProdutos, U_AlteraPrecoProduto, U_AlteraEstoqueMinimo,
  U_AlteraTodosPrecosProdutos, DBClient, U_QRelSaidaProdutos,
  U_AlteraQdeEstoque, U_QRelBaixa, U_Config, U_QRelCategorias,
  U_QRelPorCategoria, U_QRelFabricantes, U_CadCodBarras,
  U_QRelPorFabricantes, U_CadFabricantesProdutos, U_CadCategoriasProdutos,
  U_AlteraFotoDoProduto, U_QRelProdutosPorLucro, U_AlteraPrecoDeCompra,
  U_QRelEstoqueRealProdutos, U_CadSimilares, U_QRelEstoqueCritico,
  U_Fornecedores, U_CadastroPadraoUmCampo, U_ListaPadraoComUmCampoReativar, U_ListaPadraoComUmCampo,
  U_QRelPorFornecedores, U_QRelProdutosInativos;

{$R *.dfm}

var
  //itens para ser usado no txtStatus durante o cadastro do produto
  ItensStatusCadastro : array[1..19] of string =('Entre com o código de barras, caso contrário será gerado automaticamente','Entre com a descrição do produto','Entre com o código alternativo',
                                                'Entre com o preço de compra','Entre com o percentual de lucro','Entre com o preço de venda',
                                                'Entre com a quantidade de entrada','Entre com o estoque mínimo para este produto',
                                                '[Obrigatório] Escolha o fabricante na lista ou cadastre-o no botão abaixo', '[Obrigatório] Escolha a categoria na lista ou cadastre-a no botão abaixo','[Opcional] Entre com o fornecedor do produto',
                                                '[Opcional] Entre com a aliquota de ICMS','[Opcional] Entre com o tipo de unidade', '[Opcional] Entre com as observações pertinentes ao produto',
                                                '[Opcional] Entrando com a foto do produto','Clique no botão NOVO para continuar cadastrando','As fotos do produto dever ter largura maior que altura tipo => 400 x 237', 'Defina como será calculado o lucro, por percentual % ou por valor',
                                                'Entre com o valor de lucro');


procedure T_frmProdutos.FormCreate(Sender: TObject);
//DESABILITA O BOTAO FECHAR DO FORMULÁRIO
var
  hwndHandle : THANDLE;
  hMenuHandle : HMenu;
begin
//Impede movimentação do formulário
 DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  hwndHandle := Self.Handle;
  if (hwndHandle <> 0) then
    begin
      hMenuHandle := GetSystemMenu(hwndHandle, FALSE);
        if (hMenuHandle <> 0) then
          DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);

  end;       

    //Recebe a data atual por padrão

    lblDataDoDia.Caption           := DateToStr(date);
    lblHoraAtual.Caption           := timetoStr(time);
    Caption                        := 'LOGADO POR '+NomeDoUsuarioLogado;
    dtDataDoDia                    := TDateEdit.Create(self);
    dtDataDoDia.Date               := date;
    EstadoInicialDosBotoes;

end;

procedure T_frmProdutos.FormShow(Sender: TObject);
begin

        permitido                      := False;
        edt_DataInicio_RelEntrada.Date := date;
        edt_DataFim_RelEntrada.Date    := date;      

        MostrarDadosTelaInicial;

        VerificaEstoquesMinimos;

        if DM_Pesq.cdsPesqProduto.RecordCount = 0 then
        begin

           btnBaixarProdutos.Enabled := false;

        end;
        grDados.Enabled := false;

end;

procedure T_frmProdutos.AbrirTabelas;
begin

     dm_Conexao.cds_CadProduto.Active               := True;
     dm_Conexao.cds_Fornecedor.Active               := True;
     dm_Conexao.cds_DadosFuncionarios.Active        := True;
     DM_Pesq.cdsPesqAutenticacao.Active             := True;
     dm_DadosSegundo.cds_Config.Active              := True;
     dm_DadosSegundo.cds_Categorias.Active          := True;
     dm_Conexao.cds_Fabricante.Active               := True;
     dm_DadosSegundo.cds_HistoricoProdutos.Active   := True;
     DM_Pesq.cdsPesqProduto.Active                  := True;
     dm_DadosSegundo.cds_CodBarServicos.Active      := true;
     dm_DadosSegundo.cds_Servicos.Active            := true;
     dm_Conexao.cds_Similares.Active                := true;

end;

procedure T_frmProdutos.FecharTabelas;
begin

     DM_Pesq.cdsPesqAutenticacao.Active             := False;
     dm_Conexao.cds_DadosFuncionarios.Active        := False;
     dm_DadosSegundo.cds_Config.Active              := False;
     dm_DadosSegundo.cds_Categorias.Active          := False;
     dm_Conexao.cds_Fabricante.Active               := False;
     dm_DadosSegundo.cds_HistoricoProdutos.Active   := False;
     DM_Pesq.cdsPesqProduto.Active                  := False;
     dm_DadosSegundo.cds_CodBarServicos.Active      := false;
     dm_DadosSegundo.cds_Servicos.Active            := false;
     dm_Conexao.cds_Similares.Active                := false;
     dm_Conexao.cds_Fornecedor.Active               := false;

end;


procedure T_frmProdutos.Abrir_Fechar_Tabelas;
begin

     dm_Conexao.cds_CadProduto.Active               := false;
     dm_Conexao.cds_CadProduto.Active               := True;

     dm_DadosSegundo.cds_Categorias.Active          := False;
     dm_DadosSegundo.cds_Categorias.Active          := True;

     dm_Conexao.cds_Fabricante.Active               := false;
     dm_Conexao.cds_Fabricante.Active               := True;

     dm_DadosSegundo.cds_HistoricoProdutos.Active   := False;
     dm_DadosSegundo.cds_HistoricoProdutos.Active   := True;

     DM_Pesq.cdsPesqProduto.Active                  := False;
     DM_Pesq.cdsPesqProduto.Active                  := True;

     dm_DadosSegundo.cds_CodBarServicos.Active      := false;
     dm_DadosSegundo.cds_CodBarServicos.Active      := true;

     dm_DadosSegundo.cds_Servicos.Active            := false;
     dm_DadosSegundo.cds_Servicos.Active            := true;

     dm_Conexao.cds_Fornecedor.Active               := false;
     dm_Conexao.cds_Fornecedor.Active               := True;


end;

procedure T_frmProdutos.MostrarFotoPadrao;
var
  pathImgPadrao : string;
begin

      pathImgPadrao   := RetornarCaminhoDaAplicacao+'Produtos\padrao.jpg';

      if FileExists(pathImgPadrao) then
      begin
            //verifica se a imagem da tela principal existe
            img_produto_telainicial.Picture.LoadFromFile(pathImgPadrao);
            img_produto_telainicial.Transparent := true;

            img_CadProduto.Picture.LoadFromFile(pathImgPadrao);
            img_CadProduto.Transparent := true;

            img_mostraproduto.Picture.LoadFromFile(pathImgPadrao);
            img_mostraproduto.Transparent := true;


      end else begin

            texto:= 'A Imagem '+pathImgPadrao+', correspondente á imagem padrão não foi encontrada!';
            Application.MessageBox(PChar(texto),'Imagem não encontrada!',MB_OK + MB_SYSTEMMODAL);

      end;

end;


procedure T_frmProdutos.MostrarFotoProdutoTelaInicial;
begin

     if(TabelaEstaVazia('produtos'))then
     begin

          MostrarFotoPadrao;

     end else
     begin

         FotoDoProduto := ExtractFilePath(Application.ExeName)+'Produtos\'+dbCodBarrasTelaInicial.Text+'.jpg';
         if(FileExists(FotoDoProduto))then
         begin
              img_produto_telainicial.Picture.LoadFromFile(FotoDoProduto);
         end;

     end;     

end;

procedure T_frmProdutos.EscolherFotoParaCadastro;
var
  NomeDoArqDaFoto, NovoNomeArqDaFoto : string;
begin

       //COPIANDO A FOTO PARA O DIRETORIO DOS PRODUTOS
       caminho := ExtractFilePath(Application.ExeName)+'Produtos\';

       //escolhendo a foto para cadastro inicial, caso não escolha uma foto para o produto ao salvar o sistema cadastra com uma foto padrão
       if  ( abrefoto.Execute ) then begin

             NomeDoArqDaFoto     :=  abrefoto.FileName;
             NovoNomeArqDaFoto   :=  edt_CodigoProduto.Text+'.jpg'; //numero do codigo de barras

             //mostrando a foto escolhida
             img_CadProduto.Picture.LoadFromFile(NomeDoArqDaFoto);

             //fazendo a copia da foto para o diretorio dos produtos usando o codigo de barras como nome
             origem  := NomeDoArqDaFoto;
             Destino := caminho + NovoNomeArqDaFoto;
             CopyFile(PChar(origem), PChar(Destino), False);
             escolheufotocadastro:= true;

       end;

end;

procedure T_frmProdutos.copiarFotoPadraoComNomeDoCodigoBarras;
var
  nomeFotoPadrao,codProduto : string;
begin

     //COPIANDO A FOTO PARA O DIRETORIO DOS PRODUTOS
     codProduto         := edt_CodigoProduto.Text+'.jpg';
     nomeFotoPadrao     := 'padrao.jpg';
     caminho            := ExtractFilePath(Application.ExeName)+'Produtos\';

     if not DirectoryExists(caminho) then
     begin

         CreateDir(caminho);

     end else
     begin

          //Aqui pego o caminho inteiro inclusive com o nome do arquivo
          origem := ExtractFilePath(Application.ExeName)+'Produtos\'+nomeFotoPadrao;
          //ShowMessage('Nome origem : '+origem);

          Destino := ExtractFilePath(Application.ExeName)+'Produtos\'+codProduto;
          //ShowMessage('Nome destino : '+Destino);

          CopyFile(PChar(Origem), PChar(Destino), False);

     end;

end;

procedure T_frmProdutos.btnEscolherFotoClick(Sender: TObject);
begin

     btnConfirmaInclusao.Enabled:=true;
     EscolherFotoParaCadastro;
     txtStatusCadastro.Caption     := ItensStatusCadastro[15];
     LogOperacoes(NomeDoUsuarioLogado, 'acesso a escolha de foto para cadastrar produto');

end;

procedure T_frmProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin     

      FecharTabelas;
      Release;

end;

procedure T_frmProdutos.GerarCodigoDeBarrasAuto;
var
  proxNumServ   : integer;

begin

        proxNumServ := 0;

        //GRAVANDO NA TABELA CODBARSERVICO O CODIGO DE BARRAS

        With DM_Pesq.qry_Cod do
        begin

            Close;
            SQL.Clear;
            SQL.Add('select max(idcodbarservico) from codbarservico');
            Open;

            if not IsEmpty then begin

               proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

            end;

         end;

         CodBarServico := StringOfChar('0',13-Length(IntToStr(proxNum)))+ IntToStr(proxNum);

         with dm_DadosSegundo.cds_CodBarServicos do
         begin

            Append;
            FieldByName('idcodbarservico').AsInteger  := proxNum;
            FieldByName('codbarservico').AsString     := CodBarServico;
            FieldByName('tipo').AsString              := 'P'; //P = PRODUTO => POR CONTA DE UTILIZARMOS ESSES CODIGOS PARA SERVIÇOS E TB PARA PRODUTOS SEM CODIGO DE BARRAS
            ApplyUpdates(0);

         end;

         //GRAVANDO NA TABELA SERVIÇO COMO TIPO P=PRODUTO PARA NAO HAVER DUPLICIDADE NO CODIGO DE BARRAS
          With DM_Pesq.qry_Cod do
          begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_servico) from Servicos');
              Open;

              if not IsEmpty then begin

                 proxNumServ := DM_Pesq.qry_Cod.Fields[0].AsInteger+1;

              end;

            end;


           // Formatando a Data para a gravação
           DateSeparator := '/';
           ShortDateFormat := 'dd/mm/yyyy';


           // Abrindo um registro novo e gravando no bd
           with dm_DadosSegundo.cds_Servicos do begin

              Append;
              FieldByName('id_servico').AsInteger  := proxNumServ;
              FieldByName('operador_id').AsInteger := IdFuncionarioLogado(lblStatusLogoff.Caption);
              FieldByname('codbarras').AsString    := CodBarServico;
              FieldByname('descricao').AsString    := 'CADASTRO DE PRODUTO SEM CODIGO DE BARRAS';
              FieldByname('valor').AsFloat         := 0;
              FieldByname('tipo').AsString         := 'P';
              FieldByname('status').AsString       := 'A';
              FieldByname('data').AsDateTime       :=  date;
              ApplyUpdates(0);

           end;
           LogOperacoes(NomeDoUsuarioLogado, 'geração de código de barras automatico e cadastro de produto sem código de barras');
           GerouCodBarra  := true;

end;

procedure T_frmProdutos.VerificarDuplicidadeCodBar;
begin

    if ( GerouCodBarra ) then
    begin

       with DM_Pesq.Qry_Geral do
       begin

          close;
          sql.Clear;
          sql.Add('SELECT cod_barras FROM produtos WHERE cod_barras = :pcodbarras');
          params.ParamByName('pcodbarras').AsString := edt_CodigoProduto.Text;
          open;

              if not IsEmpty then
              begin

                  Application.MessageBox('Código de barras já cadastrado ou inativado, favor verificar!',
                    'Duplicidade!', MB_OK + MB_ICONWARNING);

                  edt_CodigoProduto.SelStart  :=0;
                  edt_CodigoProduto.SelLength := Length(edt_CodigoProduto.text);
                  edt_CodigoProduto.SetFocus;
                  GerouCodBarra := false;

              end;
         end;
     end;
end;



procedure T_frmProdutos.btnConfirmaInclusaoClick(Sender: TObject);
begin

    if     (edt_precocompra.Text = '') or (edt_precocompra.Text = '0,00') or (edt_precocompra.Text = '0') or
           (edt_precovenda.Text = '') or  (edt_precovenda.Text = '0,00') or  (edt_precovenda.Text = '0')  or
           (txtEstoqueMinimo.Text = '') or (txtEstoqueMinimo.Text = '0,00') or (txtEstoqueMinimo.Text = '0') or
           (edt_DescricaoCadProduto.Text = '') then
    begin

        Application.MessageBox('Preencha todos os campos para prosseguir!', 'Campo vazio verifique!', MB_OK);
        edt_precocompra.SetFocus;

    end;

    GravarProduto;

    DesabilitarBotoesDeEntrada;
    btnRetornaDaInclusao.Enabled  := true;
    btnCancelarInclusao.Enabled   := False;
    btnConfirmaInclusao.Enabled   := False;
    btnFabricantes.Enabled        := false;
    btnCategorias.Enabled         := false;
    escolheuFornecedor            := false;
    escolheufotocadastro          := false;
    bloco_campos_inclusao.Enabled := false;
    bloco_Foto.Enabled            := false;
    btnNovoProduto.Enabled        := true;
    cmbTipoLucro.Enabled          := true;
    cmbTipoLucro.ItemIndex        := 0;
    txtStatusCadastro.Caption     := ItensStatusCadastro[16];

end;


procedure T_frmProdutos.GravarProduto;
begin

    if not TemDuplicidadeNoCampo('cod_barras','produtos',edt_CodigoProduto.Text)then
    begin
      GravarEntradaDeProdutos;
      GerouCodBarra  := false;
    end else
    begin

      Application.MessageBox('Código de barras já cadastrado ou inativado, favor verificar!',
                    'Duplicidade!', MB_OK + MB_ICONWARNING);
      LimparCamposPrimeiraEntrada;

    end;

end;

procedure T_frmProdutos.GravarEntradaDeProdutos;
var
  IDOperador, proxNumHistorico: Integer;
  NovoEstoque : double;
begin

            if escolheuFornecedor then
            begin
                   IDFornecedorEntrada := StrToInt(DBIDFornec.Text);
            end else
                   IDFornecedorEntrada := 1;

            if escolheuCategoria then
            begin
                   IDCategoriaEntrada := StrToInt(DBIDCat.Text);
            end else
                   IDCategoriaEntrada := 1;

            if escolheuFabricante then
            begin
                   IDFabricanteEntrada := StrToInt(DBIDFabr.Text);
            end else
                   IDFabricanteEntrada := 1;   

             IDOperador         := IdDoUsuarioLogado;    

             mes_ano := gerarMesAnoPassandoData(now);

             NovoEstoque := StrToFloat(edt_QuantidadeDeEntrada.text);

             idProdutoCadastrado := GerarProximoID('id_produto','produtos');

             with umProduto do
             begin
                 //passando os valores
                 id_produto       := idProdutoCadastrado;
                 categoria_id     := IDCategoriaEntrada;
                 fabricante_id    := IDFabricanteEntrada;
                 fornecedor_id    := IDFornecedorEntrada;
                 cod_alt1         := edt_CodAlt1.Text;
                 cod_alt2         := edt_CodAlt2.Text;
                 cod_alt3         := edt_CodAlt3.Text;
                 cod_alt4         := edt_CodAlt4.Text;
                 cod_barras       := edt_CodigoProduto.Text;
                 descricao        := edt_DescricaoCadProduto.Text;
                 estoque_atual    := NovoEstoque;
                 estoqueminimo    := StrToFloat(txtEstoqueMinimo.Text);
                 precocompra      := StrToFloat(edt_precocompra.text);
                 precovenda       := StrToFloat(edt_precovenda.text);
                 percentlucro     := StrToFloat(edt_percentual.text);
                 valordelucro     := StrToFloat(edt_Lucro.text);
                 unidade          := cmbUnidade.Text;
                 datacad          := TDateTime(now);
                 obs              := edtAplicacao.Text;
                 mesano           := mes_ano;
                 tipo             := 'P';
                 aliquota         := cmbAliquota.Text;
                 status           := 'A';

             end;

             if ( umProduto.inserirProduto )then     //inicio inserirProduto
             begin

                   MostraIdFuncionario;                                  // Procura ID do funcionario e mostra na variavel IdDoFuncionarioLogado
                   IDProdutoGeral    := idProdutoCadastrado;             //IDProdutoGeral trata-se de uma variavel que esta na biblioteca
                   DescProdutoGeral  := edt_DescricaoCadProduto.Text;    //DescProdutoGeral trata-se de uma variavel que esta na biblioteca

                   //ATUALIZAR HISTORICO DE PRODUTOS
                   proxNumHistorico := GerarProximoID('id_historico','historico_produtos');

                   // Abrindo um registro novo e gravando no bd
                   with dm_DadosSegundo.cds_HistoricoProdutos do begin

                      Append;

                      FieldByName('id_historico').AsInteger     := proxNumHistorico;
                      FieldByName('produto_id').AsInteger       := idProdutoCadastrado;
                      FieldByName('pedido_id').AsInteger        := 0;
                      FieldByName('numnf').AsString             := '0';
                      FieldByName('fornecedor_id').AsInteger    := 0;
                      FieldByName('venda_id').AsInteger         := 0;
                      FieldByName('cliente_id').AsInteger       := 0;
                      FieldByname('precovenda').AsCurrency      := StrToFloat(edt_precovenda.text);
                      FieldByname('precocompra').AsCurrency     := StrToFloat(edt_precocompra.text);
                      FieldByname('valordelucro').AsCurrency    := StrToFloat(edt_Lucro.text);
                      FieldByname('operador_id').AsInteger      := IDOperador;
                      FieldByname('codmov').AsString            := 'EP';  //entrada de produto
                      FieldByname('quantidade').AsFloat         := NovoEstoque;
                      FieldByname('datamov').AsDateTime         := TDateTime(now);
                      FieldByname('historico').AsString         := 'ENTRADA DE PRODUTO';
                      FieldByName('mesano').AsString            := mes_ano;
                      ApplyUpdates(0);

                   end;

                   if not (escolheufotocadastro)then
                   begin
                        //se não escolher uma foto para o produto entrar com a foto padrão usar como nome o codigo de barras
                        copiarFotoPadraoComNomeDoCodigoBarras;
                   end;

                   Abrir_Fechar_Tabelas;
                   LimparCamposPrimeiraEntrada;
                   LogOperacoes(NomeDoUsuarioLogado, 'cadastro de novo produto');
                   Application.MessageBox('Novo produto cadastrado com sucesso!', 'Informação do Sistema!', MB_OK);

           end;  //fim inserirProduto


end;



procedure T_frmProdutos.FormKeyPress(Sender: TObject; var Key: Char);
begin

    // Enter por Tab
    //verifica se a tecla pressionada é a tecla ENTER, conhecida pelo Delphi como #13
    If key = #13 then
    Begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
    end;

end;


procedure T_frmProdutos.btnSairClick(Sender: TObject);
begin

    FreeAndNil(dtDataDoDia);
    edtConsProduto.Clear;
    Abrir_Fechar_Tabelas;
    close;
    HabilitarBotoes;

end;


procedure T_frmProdutos.btnRetornaDaInclusaoClick(Sender: TObject);
begin

      //Inclusao
      pangrid_visualizacao.BringToFront;
      pan_titulo.Caption            := 'Controle de Produtos - Visualizando...';
      pan_botoes.Enabled            := true;
      btnEscolherFoto.Enabled       := false;

      HabilitarBotoes;
      edt_CodigoProduto.Clear;
      umProduto.Destroy;
      umSimilar.Destroy;
      grDados.Enabled:=false;
      EstadoInicialDosBotoes;
      MostrarDadosTelaInicial;
      Abrir_Fechar_Tabelas;
      bloco_campos_inclusao.Enabled := true;

      txtQdeItens.Caption := 'Total de Itens Cadastrados : ' +IntToStr(TotalRegs);
      btnCadastrarProduto.Caption := 'Cadastro Inicial';
      btnCadastrarProduto.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');

end;


procedure T_frmProdutos.dbedtPROD_PRECOVENDA2KeyPress(Sender: TObject;
  var Key: Char);
begin
        // PARA DBEDIT ACEITAR APENAS LETRAS
       if not (Key in['A'..'Z',#8]) and not (Key in['a'..'z',#8]) then
        begin
          Key := #0;
       end;
end;

procedure T_frmProdutos.edt_statusKeyPress(Sender: TObject; var Key: Char);
begin

        // PARA DBEDIT ACEITAR APENAS LETRAS
       if not (Key in['A'..'Z',#8]) and not (Key in['a'..'z',#8]) then
        begin
          Key := #0;
       end;
end;


procedure T_frmProdutos.edt_unidadeKeyPress(Sender: TObject; var Key: Char);
begin

         // PARA DBEDIT ACEITAR APENAS LETRAS
         if not (Key in['A'..'Z',#8]) and not (Key in['a'..'z',#8]) then
          begin
            Key := #0;
         end;
end;

procedure T_frmProdutos.edt_percentlucroKeyPress(Sender: TObject;
  var Key: Char);
begin

         // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;
         edt_precovenda.Enabled:= true;


         // PARA DBEDIT NÃO ACEITAR VIRGULAS
         If (Key in[#44]) then begin
          Application.MessageBox('Este campo não aceita virgulas!',
            'Valor Inválido!', MB_OK + MB_ICONWARNING);
            Key:=#0;
         end;

         edt_precovenda.Enabled:= true;
end;


procedure T_frmProdutos.edt_percent_estoqueminimoKeyPress(Sender: TObject;
  var Key: Char);
begin

       // PARA DBEDIT ACEITAR APENAS NUMEROS
       If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;
end;


procedure T_frmProdutos.DesabilitarBotoesDeEntrada;
begin

     //Desabilitando os botões
      btnCadastrarProduto.Enabled  := False;
      btnInativar.Enabled          := False;
      btnimprimir.Enabled          := False;
      btnSair.Enabled              := False;
      btnEntrarProduto.Enabled     := False;
      btnBaixarProdutos.Enabled    := False;
      btnAlterarProduto.Enabled    := False;

end;


procedure T_frmProdutos.HabilitarBotoes;
var
  i : Integer;
begin

       //Habilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= true;
      end;


      btnRetornaDaInclusao.Enabled:= True;

end;


procedure T_frmProdutos.CalculaEstoqueMinimo;
begin

    QuantidadeEstoque := StrToFloat(edt_QuantidadeDeEntrada.text);

    ValorDeEstoqueMinimo := (QuantidadeEstoque * PercentEstMinimo)/100;
    txtEstoqueMinimo.Text := FloatToStr(ValorDeEstoqueMinimo);

end;


procedure T_frmProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

      //configurando grid para navegaçao com setinha pra cima e pra baixao
      if  (KEY=38) then
      begin
          dm_Conexao.cds_CadProduto.Prior;
          MostrarFotoProdutoTelaInicial;
      end;

      if  (KEY=40) then
      begin
           dm_Conexao.cds_CadProduto.next;
           MostrarFotoProdutoTelaInicial;
      end;

       if Key = VK_F5 then
       begin

            MostrarDadosTelaInicial;
            txtMsg.Visible                 := FALSE;
            TemNivers                      := false;
            edtConsProduto.Enabled         := true;
            grid_VisualizaProdutos.Cursor  := crHandPoint;
            edtConsProduto.SetFocus;
            EstadoInicialDosBotoes;
            btnCadastrarProduto.Caption := 'Cadastro Inicial';
            btnCadastrarProduto.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');

       end;

      if  (KEY=VK_F1) then
      begin
         InformacaoSobreAlteracaoDeCampos;
      end;

end;


procedure T_frmProdutos.btnCadastrarProdutoClick(Sender: TObject);
begin
   if (btnCadastrarProduto.Caption = 'Voltar')then
   begin

       FormatarValoresComoMoeda;
       edtConsProduto.Clear;
       MostrarFotoProdutoTelaInicial;
       grDados.Enabled:=false;
       EstadoInicialDosBotoes;
       MostrarDadosTelaInicial;
       btnCadastrarProduto.Caption := 'Cadastro Inicial';
       btnCadastrarProduto.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');
       
   end else
   begin

       DBCategoria.KeyValue         := -1;
       DBFabricante.KeyValue        := -1;
       DBFornecedorProduto.KeyValue := -1;
       escolheuFornecedor           := false;
       edtAplicacao.Clear;
       edtConsProduto.Clear;
       grid_VisualizaProdutos.Enabled:= True;
       edt_CodigoProduto.Clear;
       edt_CodigoProduto.SetFocus;
       pan_titulo.Caption:= 'Controle de Produtos - Cadastrando...';
       pangrid_visualizacao.SendToBack;
       pangrid_inclusao.BringToFront;
       DesabilitarBotoesDeEntrada;
       btnConfirmaInclusao.Enabled    := False;
       btnCancelarInclusao.Enabled    := False;
       btnNovoProduto.Enabled := false;
       umProduto := TProduto.criarObj;
       umSimilar := TSimilar.criarObj;
       txtEstoqueMinimo.Text  := '5,00';
       abrefoto.InitialDir    := ExtractFilePath(Application.ExeName)+'\produtos';

   end;

   MostrarFotoPadrao;
   MostrarFotoProdutoTelaInicial;
   
end;

procedure T_frmProdutos.CalcularValorTotalCompradoDoItem;
begin

    QuantidadeEstoque     := StrToFloat(edt_QuantidadeDeEntrada.text);
    ValorTotal            := (PrecoCusto * QuantidadeEstoque);

end;


procedure T_frmProdutos.btnCadastraFornecedorClick(Sender: TObject);
begin

      pan_titulo.Caption:= 'Cadastro de Fornecedores...';

end;


procedure T_frmProdutos.edt_QuantidadeEntradaKeyPress(Sender: TObject;
  var Key: Char);
begin

        // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;


procedure T_frmProdutos.btnEntrarProdutoClick(Sender: TObject);
var
   FotoProdutoNovaEntrada : string;
begin

      if dm_Conexao.cds_CadProduto.RecordCount = 0 then begin

           Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);

      end
      else begin

            PanGridCadEntradas.BringToFront;
            pan_titulo.Caption:='Entrada de Produtos Cadastrados';
            DesabilitarBotoesDeEntrada;
            btnBaixarProdutos.Enabled  := false;
            escolheuFornecedor         := false;

            edt_CodBarrasNovaEntrada.Text     := dbCodBarrasTelaInicial.Text;
            PesquisarCodBarProdutoParaEntrada;

      end;

      edt_QuantidadeNovaEntrada.SetFocus;
      FotoProdutoNovaEntrada     := ExtractFilePath(Application.ExeName)+'Produtos\'+edt_CodBarrasNovaEntrada.Text+'.jpg';
      img_mostraproduto.Picture.LoadFromFile(FotoProdutoNovaEntrada);
      img_mostraproduto.Transparent := true;

end;

procedure T_frmProdutos.LimparPesquisaDeProdutos;
begin

    with DM_Pesq.cdsPesqProduto do begin

        Close;
        CommandText:= ('Select * from produtos WHERE status = '+QuotedStr('A')+' order by descricao');
        Open;

    end;

end;


procedure T_frmProdutos.PesquisarCodBarProdutoParaEntrada;
begin

      _Sql := 'SELECT p.*, c.*, f.nome_fabricante, g.forne_nome FROM produtos p, fabricantes f, fornecedores g, categorias c WHERE c.id_categoria=p.categoria_id AND p.fornecedor_id=g.forne_id AND p.DESCRICAO <> :pDesc '+
              'AND p.FABRICANTE_ID = f.ID_FABRICANTE AND cod_barras = :pCodBarras  AND p.STATUS = :pStatus AND p.tipo = :pTipo ORDER BY p.DESCRICAO';

         with DM_Pesq.cdsPesqProduto do
         begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pDesc').Asstring       := 'PRODUTO NAO CADASTRADO';
            Params.ParamByName('pCodBarras').AsString  := edt_CodBarrasNovaEntrada.text;
            Params.ParamByName('pStatus').Asstring     := 'A';
            Params.ParamByName('pTipo').Asstring       := 'P';
            Open;

          //se o codigo do produto existir
          if not DM_Pesq.cdsPesqProduto.IsEmpty then
          begin

              edt_NomeProdutoEntrada.Text      := DM_Pesq.cdsPesqProduto.Fieldbyname('descricao').AsString;
              edt_EstoqueAtual.Text            := FloatToStr(DM_Pesq.cdsPesqProduto.Fieldbyname('estoque_atual').AsFloat);
              edt_IDProduto.Text               := IntToStr(DM_Pesq.cdsPesqProduto.Fieldbyname('id_produto').AsInteger);
              edt_CodBarrasNovaEntrada.Text    := DM_Pesq.cdsPesqProduto.Fieldbyname('cod_barras').AsString;
              edtPrecoCompra.Text              := FloatToStrF(DM_Pesq.cdsPesqProduto.Fieldbyname('precocompra').AsFloat,ffNumber,4,2);
              edtPrecoVenda.Text               := FloatToStrF(DM_Pesq.cdsPesqProduto.Fieldbyname('precovenda').AsFloat,ffNumber,4,2);
              edtLucro.Text                    := FloatToStrF(DM_Pesq.cdsPesqProduto.Fieldbyname('valordelucro').AsFloat,ffNumber,4,2);
              edtPercentLucro.Text             := FloatToStrF(DM_Pesq.cdsPesqProduto.Fieldbyname('percentlucro').AsFloat,ffNumber,4,2);

              pnl_Produto.Visible              := true;
              DesabilitarBotoesDeEntrada;
              edt_QuantidadeNovaEntrada.SetFocus;

              if FileExists(dm_DadosSegundo.cds_ConfigFOTOS.AsString+'\'+edt_CodBarrasNovaEntrada.Text+'.jpg') then
              begin
                    img_mostraproduto.Picture.LoadFromFile(dm_DadosSegundo.cds_ConfigFOTOS.asString+'\'+edt_CodBarrasNovaEntrada.Text+'.jpg')
              end else
                    MostrarFotoPadrao;

          end
          else begin

                texto := 'Verifique se é um produto e se o mesmo esta cadastrado, deseja sair?';

                if Application.MessageBox(PChar(texto),'Produto não encontrado!',MB_YESNO + MB_ICONQUESTION) = IdYes then
                begin

                    pangrid_visualizacao.BringToFront;
                    pan_titulo.Caption               := 'Controle de Produtos - Visualizando...';
                    pan_botoes.Enabled               := true;
                    pnl_Produto.Visible              := false;
                    edt_CodBarrasNovaEntrada.Clear;
                    edt_IDProduto.Clear;
                    edt_NomeProdutoEntrada.Clear;
                    edt_EstoqueAtual.Clear;
                    edt_QuantidadeNovaEntrada.Clear;

                    HabilitarBotoes;

                end
                else begin
                   edt_CodBarrasNovaEntrada.Text := '';
                   edt_CodBarrasNovaEntrada.SetFocus;

             end;

          end;

        end;
end;



procedure T_frmProdutos.btnSairDaRequisicaoClick(Sender: TObject);
begin


      pangrid_visualizacao.BringToFront;
      pan_titulo.Caption:='Controle de Estoque - Visualizando...';
      HabilitarBotoes;

end;


procedure T_frmProdutos.edt_QuantidadeSaidaKeyPress(Sender: TObject;
  var Key: Char);
begin

        // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmProdutos.InativarProduto;
var
  texto:string;
  idProduto : integer;
begin

     if dm_Conexao.cds_CadProduto.RecordCount = 0 then begin

       Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);

    end
    else begin

          DesabilitarBotoesDeEntrada;
          idProduto         := StrToInt(dbedtID_PRODUTO.text);
          pan_titulo.Caption:= 'Controle de Estoque - Inativando...';

          texto:= 'Confirma o desejo de inativar o Produto '+dbedtPROD_DESCRICAO.Text+ '?';

          if Application.MessageBox(PChar(texto),'Inativar Produto',MB_YESNO + MB_ICONQUESTION) = IdYes then
          begin

              _Sql := ('UPDATE produtos SET status = :pStatus WHERE id_produto = :pID');

              with DM_Pesq.cdsPesqProduto do
              begin

                   close;
                   CommandText := _Sql;
                   Params.ParamByName('pStatus').AsString := 'I';
                   Params.ParamByName('pID').AsInteger  := idProduto;
                   execute;

                   //Para não dar erro de cursor not returned abra novamente a consulta de todos os produtos
                   CommandText := sqlDefalt;
                   Params.ParamByName('pDesc').Asstring   :=  'PRODUTO NAO CADASTRADO';
                   Params.ParamByName('pStatus').Asstring :=  'A';
                   open;

              end;

              Application.MessageBox('O produto foi inativado com sucesso!',
              'Inativo', MB_OK);
              LogOperacoes(NomeDoUsuarioLogado, 'inativação de produto');

              pan_titulo.Caption:= 'Controle de Estoque - Visualizando...';
              HabilitarBotoes;


          end else begin

              dm_Conexao.cds_CadProduto.CancelUpdates;
              pan_titulo.Caption:= 'Controle de Estoque - Visualizando...';
              HabilitarBotoes;

         end;

      end;

      Abrir_Fechar_Tabelas;
      grDados.Enabled:=false;

     if (retornaQuantidadeRegsAtivosTabela('id_produto','produtos','status') = 0)then
     begin
        close;
     end else
     begin

      EstadoInicialDosBotoes;
      MostrarDadosTelaInicial;
      MostrarFotoProdutoTelaInicial;

      //ATUALIZANDO A QUANTIDADE ASSIM QUE FOR INATIVADO UM PRODUTO
      txtQdeItens.Caption := 'Total de Itens Cadastrados : ' +IntToStr(TotalRegs);

     end;

end;

procedure T_frmProdutos.btnInativarClick(Sender: TObject);
begin
    InativarProduto;
end;  

procedure T_frmProdutos.dbID_FORNECEDOREnter(Sender: TObject);
begin

     keybd_event(VK_DOWN, 0, 0, 0);
     keybd_event(VK_UP, 0, 0, 0);

end;

procedure T_frmProdutos.dblkcbbID_CLIENTEEnter(Sender: TObject);
begin
   keybd_event(VK_DOWN, 0, 0, 0);
   keybd_event(VK_UP, 0, 0, 0);
end;


procedure T_frmProdutos.lstEscolheTipoRelClick(Sender: TObject);
begin

    pan_titulo.Caption:= 'Controle de Estoque - Visualizando...';
    LogOperacoes(NomeDoUsuarioLogado, 'acesso a tipos de relatório de produtos');
    lstEscolheTipoRel.Visible:= False;
    lstEscolheTipoRel.Align:= alNone;
    pangrid_visualizacao.Enabled:= True;
    FreeAndNil(Q_RelPorFornecedores);

    if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO PRODUTOS PREÇOS ESTOQUE' then
    begin

        TotalRegs := 0;

        //PESQUISANDO A QUANTIDADE DE REGISTROS RETORNADO PELO QRY

       _Sql := 'SELECT id_produto, cod_barras, descricao, precovenda, estoque_atual, status '+
               'FROM produtos WHERE status = '+QuotedStr('A')+' ORDER BY descricao';

       Application.CreateForm(TQ_RelProdutosCompleto,  Q_RelProdutosCompleto);
       with Q_RelProdutosCompleto.cds_Produtos do
       begin

          close;
          CommandText:= (_Sql);
          Open;

          if not IsEmpty then begin

             TotalRegs := Q_RelProdutosCompleto.cds_Produtos.RecordCount;

          end;

     end;

       Q_RelProdutosCompleto.cds_Produtos.Active   := True;
       Q_RelProdutosCompleto.QRLabelTotal.Caption  := IntToStr(TotalRegs);
       Q_RelProdutosCompleto.Preview;
       FreeAndNil(Q_RelProdutosCompleto);

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO MONETÁRIO DO ESTOQUE ATIVO' then
    begin

        //PESQUISANDO A QUANTIDADE DE REGISTROS RETORNADO PELO QRY

       _Sql := 'SELECT id_produto, cod_barras, descricao, precocompra, estoque_atual, status '+
               'FROM produtos WHERE status = '+QuotedStr('A')+' ORDER BY descricao';

       Application.CreateForm(TQ_RelProdutosEstoqueReal,  Q_RelProdutosEstoqueReal);
       with Q_RelProdutosEstoqueReal.cds_Produtos do
       begin

          close;
          CommandText:= (_Sql);
          Open;

          if not IsEmpty then begin

             TotalRegs := Q_RelProdutosEstoqueReal.cds_Produtos.RecordCount;

          end;

     end;

       Q_RelProdutosEstoqueReal.Preview;
       FreeAndNil(Q_RelProdutosEstoqueReal);

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO  DO  PRODUTO  SELECIONADO' then
    begin

       Application.CreateForm(TQ_RelProdutosIndividual,  Q_RelProdutosIndividual);
       with Q_RelProdutosIndividual.Qry_ProdutosIndividuais do
       begin

          Close;
          ParamByName('id_produto').asinteger := StrToInt(dbedtID_PRODUTO.Text);
          Open;

       end;

       Q_RelProdutosIndividual.Preview;
       FreeAndNil(Q_RelProdutosIndividual);

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO   PRODUTOS  POR CATEGORIA' then
    begin

       Application.CreateForm(TQ_RelPorCategorias,  Q_RelPorCategorias);
       Q_RelPorCategorias.cds_RelCategorias.Active := true;
       Q_RelPorCategorias.Preview;
       FreeAndNil(Q_RelPorCategorias);

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO   DE   PRODUTOS   POR  LUCRO' then
    begin

       Application.CreateForm(TQ_RelProdutosPorLucro,  Q_RelProdutosPorLucro);
       Q_RelProdutosPorLucro.cds_Produtos.Active := true;
       Q_RelProdutosPorLucro.Preview;
       FreeAndNil(Q_RelProdutosPorLucro);

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO   PRODUTOS POR FABRICANTE' then
    begin

       Application.CreateForm(TQ_RelPorFabricantes,  Q_RelPorFabricantes);
       Q_RelPorFabricantes.cds_RelPorFabricantes.Active := true;
       Q_RelPorFabricantes.Preview;
       FreeAndNil(Q_RelPorFabricantes);

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO   PRODUTOS POR FORNECEDOR' then
    begin

       Application.CreateForm(TQ_RelPorFornecedores,  Q_RelPorFornecedores);
       Q_RelPorFornecedores.cds_RelFornecedores.Active := true;
       Q_RelPorFornecedores.Preview;
       FreeAndNil(Q_RelPorFornecedores);   

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO  DE  ENTRADA DE  PRODUTOS' then
    begin

       btnPesquisar.Tag    := 100;
       pnl_Periodo.Visible := True;
       pnl_Periodo.Align   := alClient;

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO   DE  VENDA    DE   PRODUTOS' then
    begin

       btnPesquisar.Tag    := 200;
       pnl_Periodo.Visible := True;
       pnl_Periodo.Align   := alClient;

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO   DE   BAIXA     DE   PRODUTOS' then
    begin

       btnPesquisar.Tag    := 300;
       pnl_Periodo.Visible := True;
       pnl_Periodo.Align   := alClient;

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO PRODUTOS ESTOQUE CRÍTICO' then
    begin

           Application.CreateForm(TQ_RelEstoqueCritico,  Q_RelEstoqueCritico);
           with Q_RelEstoqueCritico.cds_RelEstoqueCritico do
           begin

              close;
              Open;

              if not IsEmpty then
              begin

                  Q_RelEstoqueCritico.Preview;
                  FreeAndNil(Q_RelEstoqueCritico);

              end else
              begin
                   Application.MessageBox('No momento não existem produtos com estoque abaixo do determinado!', 'Produtos com estoque crítico!', MB_OK + MB_ICONWARNING);
                   FreeAndNil(Q_RelEstoqueCritico);
              end;

           end;
    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO DE TODOS PRODUTOS INATIVOS' then
    begin

           Application.CreateForm(TQ_RelProdutosInativos,  Q_RelProdutosInativos);
           with Q_RelProdutosInativos.cds_RelProdutosInativos do
           begin

              close;
              Open;

              if not IsEmpty then
              begin

                  Q_RelProdutosInativos.Preview;
                  FreeAndNil(Q_RelProdutosInativos);

              end else
              begin
                   Application.MessageBox('No momento não existem produtos inativados!', 'Produtos inativos!', MB_OK + MB_ICONWARNING);
                   FreeAndNil(Q_RelEstoqueCritico);
              end;

           end;
    end;

end;

procedure T_frmProdutos.PesquisarRelatorio;
var
  DataInicio, DataFim : TDate;
begin

        DataInicio  := StrToDate(edt_DataInicio_RelEntrada.text);
        DataFim     := StrToDate(edt_DataFim_RelEntrada.text);
        periodo     := edt_DataInicio_RelEntrada.Text+' a '+edt_DataFim_RelEntrada.Text;

        if btnPesquisar.Tag = 100 then
        begin

           Application.CreateForm(TQ_RelEntradaProdutos,  Q_RelEntradaProdutos);
           with Q_RelEntradaProdutos.cds_RelEntradaProdutos do
           begin

              Close;
              Params.ParamByName('datainicial').AsDate := DataInicio;
              Params.ParamByName('datafinal').AsDate   := DataFim;
              Open;

               if not IsEmpty then
               begin

                     Q_RelEntradaProdutos.cds_RelEntradaProdutos.Active:= True;
                     Q_RelEntradaProdutos.ReportTitle        := 'Entrada de produtos no período de '+periodo;
                     Q_RelEntradaProdutos.qrbTitulo.Caption  := 'Entrada de produtos no período de '+periodo;
                     Q_RelEntradaProdutos.Preview;
                     FreeAndNil(Q_RelEntradaProdutos);
                     pnl_Periodo.Visible:= False;
                     edt_DataInicio_RelEntrada.Text := DateToStr(now);

                end else
                begin
                     texto := 'Não foram encontradas entradas para o período '#13'pesquisado : '+periodo;
                     Application.MessageBox(PChar(texto),'Nenhuma entrada!', MB_OK + MB_ICONWARNING);
                     FreeAndNil(Q_RelEntradaProdutos);
                     pnl_Periodo.Visible:= False;
                     exit;
                end;
           end;

        end;
        if btnPesquisar.Tag = 200 then
        begin

           Application.CreateForm(TQ_RelSaidaProdutos,  Q_RelSaidaProdutos);
           with Q_RelSaidaProdutos.cds_RelSaidaProdutos do
           begin

              Close;
              Params.ParamByName('datainicial').AsDate := DataInicio;
              Params.ParamByName('datafinal').AsDate   := DataFim;
              Open;

               if not IsEmpty then
               begin

                     Q_RelSaidaProdutos.cds_RelSaidaProdutos.Active:= True;
                     Q_RelSaidaProdutos.ReportTitle        := 'Venda de produtos no período de '+periodo;
                     Q_RelSaidaProdutos.qrbTitulo.Caption  := 'Venda de produtos no período de '+periodo;
                     Q_RelSaidaProdutos.Preview;
                     FreeAndNil(Q_RelSaidaProdutos);
                     pnl_Periodo.Visible:= False;
                     edt_DataInicio_RelEntrada.Text := DateToStr(now);

                end else
                begin
                     texto := 'Não foram encontradas vendas para o período '#13'pesquisado : '+periodo;
                     Application.MessageBox(PChar(texto),'Nenhuma venda!', MB_OK + MB_ICONWARNING);
                     FreeAndNil(Q_RelSaidaProdutos);
                     pnl_Periodo.Visible:= False;
                     exit;
                end;

           end;    
        end;
        if btnPesquisar.Tag = 300 then
        begin

           Application.CreateForm(TQ_RelBaixados,  Q_RelBaixados);
           with Q_RelBaixados.cds_RelBaixa do
           begin

              Close;
              Params.ParamByName('datainicial').AsDate := DataInicio;
              Params.ParamByName('datafinal').AsDate   := DataFim;
              Open;

            if not IsEmpty then
              begin

                   Q_RelBaixados.cds_RelBaixa.Active:= True;
                   Q_RelBaixados.Preview;
                   FreeAndNil(Q_RelBaixados);
                   pnl_Periodo.Visible:= False;

              end else
              begin
                   texto := 'A pesquisa não encontrou produtos que tiveram baixa no estoque neste período : '+periodo;
                   Application.MessageBox(PChar(texto),'Produtos baixados!!', MB_OK + MB_ICONWARNING);
                   FreeAndNil(Q_RelBaixados);
                   pnl_Periodo.Visible:= False;
                   edt_DataInicio_RelEntrada.Text := DateToStr(now);
              end;
            end;
      end;
end;


procedure T_frmProdutos.btnPesquisarClick(Sender: TObject);
begin

   if( (edt_DataInicio_RelEntrada.Text = '  /  /    ') or (edt_DataFim_RelEntrada.Text = '  /  /    ') )then
   begin

       Application.MessageBox('Entre com as duas datas para pesquisar!', 'Período Inválido!', MB_OK + MB_ICONWARNING);
       edt_DataInicio_RelEntrada.SetFocus;
       edt_DataInicio_RelEntrada.Text := DateToStr(now);
       edt_DataFim_RelEntrada.Text    := DateToStr(now);
       exit;

   end else
   if ( edt_DataInicio_RelEntrada.Date > edt_DataFim_RelEntrada.Date) then
   begin

        Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK + MB_ICONWARNING);
        edt_DataInicio_RelEntrada.SetFocus;
        edt_DataInicio_RelEntrada.Text := DateToStr(now);
        edt_DataFim_RelEntrada.Text    := DateToStr(now);

   end else
   begin

        PesquisarRelatorio;

   end;

end;

procedure T_frmProdutos.btnimprimirClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

        if dm_Conexao.cds_CadProduto.RecordCount = 0 then begin

           Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);

        end
        else begin

          pan_titulo.Caption            := 'Controle de Estoque - Imprimindo...';
          lstEscolheTipoRel.Visible     := True;
          lstEscolheTipoRel.Align       := alClient;
          pangrid_visualizacao.Enabled  := False;
          LogOperacoes(NomeDoUsuarioLogado, 'acesso a impressão de relatórios de produtos');
          grDados.Enabled:=false;
          EstadoInicialDosBotoes;

       end;

     end;

end;


procedure T_frmProdutos.btnFecharClick(Sender: TObject);
begin

    pnl_Periodo.Visible:= False;

end;

procedure T_frmProdutos.edt_QuantidadeDeEntrada2KeyPress(Sender: TObject;
  var Key: Char);
begin

     IF NOT (KEY IN['0'..'9',#13]) THEN
     KEY:= #0;    //SE DIGITAR ALGO QUE NÃO SEJA UM NUMERO DE 1 A 9 TRAVA O TECLADO

end;

procedure T_frmProdutos.edt_PercentEstoqueMinimoKeyPress(Sender: TObject;
  var Key: Char);
begin

      // PARA DBEDIT NÃO ACEITAR VIRGULAS
       If (Key in[#44]) then begin
        Application.MessageBox('Este campo não aceita virgulas!',
          'Valor Inválido!', MB_OK + MB_ICONWARNING);
          Key:=#0;
       end;

end;

procedure T_frmProdutos.msk_CepClienteKeyPress(Sender: TObject;
  var Key: Char);
begin

    // PARA DBEDIT ACEITAR APENAS NUMEROS
    If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmProdutos.msk_DataNasctoClienteKeyPress(Sender: TObject;
  var Key: Char);
begin

   // PARA DBEDIT ACEITAR APENAS NUMEROS
   If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmProdutos.msk_FoneClienteKeyPress(Sender: TObject;
  var Key: Char);
begin

   // PARA DBEDIT ACEITAR APENAS NUMEROS
   If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmProdutos.edt_status_ClienteKeyPress(Sender: TObject;
  var Key: Char);
begin

    // PARA DBEDIT ACEITAR APENAS LETRAS
       if not (Key in['A'..'Z',#8]) and not (Key in['a'..'z',#8]) then
        begin
          Key := #0;
       end;
end;


procedure T_frmProdutos.dbedtQUANTIDADEClick(Sender: TObject);
begin

    AlterarEstoqueAtual;

end;

procedure T_frmProdutos.dbedtESTOQUEMINIMOClick(Sender: TObject);
begin

    AlterarEstoqueMinimo;

end;


procedure T_frmProdutos.VerificaEstoquesMinimos;
begin

    _Sql := 'SELECT p.*, f.nome_fabricante, c.categoria, g.forne_nome FROM produtos p, fabricantes f, categorias c, fornecedores g WHERE p.descricao <> :pDesc '+
            'AND estoque_atual <= estoqueminimo AND p.fabricante_id = f.id_fabricante AND p.categoria_id = c.id_categoria AND p.fornecedor_id = g.forne_id AND p.status = '+QuotedStr('A')+' ORDER BY p.descricao';

         with DM_Pesq.cdsPesqProduto do
         begin

            Close;
            CommandText:= (_Sql);
            Open;


            if not IsEmpty then
            begin

               txtQdeItens.Visible             := false;
               txtMsg.Caption                  := 'Atenção! Este(s) produto(s) encontra(m)-se com o estoque crítico, reponha assim que possível. Clique em F5 para continuar';
               txtMsg.Visible                  := True;
               TemProdsEstoqueBaixo            := true;
               edtConsProduto.Enabled          := false;
               verificandoEstoqueMinimo        := true;
               grid_VisualizaProdutos.Cursor   := crArrow;
               DesabilitarBotoesDeEntrada;       

            end
            else begin

               MostrarDadosTelaInicial;

            end;

         end;

end;

procedure T_frmProdutos.btnSairBaixaProdutosClick(Sender: TObject);
begin

      pangrid_visualizacao.BringToFront;
      grDados.Enabled:=false;
      btnBaixarProdutos.Enabled := false;
      pan_titulo.Caption:='Controle de Estoque - Visualizando...';
      HabilitarBotoes;
      EstadoInicialDosBotoes;
      MostrarDadosTelaInicial;

end;

procedure T_frmProdutos.edt_ProdutoEntradaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

    if key = 13 then
    begin

        exit;
        edt_CodBarrasNovaEntrada.SetFocus;

    end;

end;

procedure T_frmProdutos.edt_PercentualLucroKeyPress(Sender: TObject;
  var Key: Char);
begin

     // PARA DBEDIT ACEITAR APENAS NUMEROS
     If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmProdutos.edt_NumNotaKeyPress(Sender: TObject;
  var Key: Char);
begin

      // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmProdutos.db_NumSerieKeyPress(Sender: TObject;
  var Key: Char);
begin

      // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmProdutos.edt_QuantidadeNovaEntradaKeyPress(Sender: TObject;
  var Key: Char);
begin

      // Só aceita digitação de números
     If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmProdutos.btnGravarEntradaClick(Sender: TObject);
begin

     GravaNovaEntradaDeProdutosCadastrados;

end;


procedure T_frmProdutos.GravaNovaEntradaDeProdutosCadastrados;
begin

     qde_NovaEntrada :=  StrToFloat(edt_QuantidadeNovaEntrada.Text);
     estoque_atual   :=  StrToFloat(edt_EstoqueAtual.Text);
     NovoEstoque     :=  ( estoque_atual + qde_NovaEntrada );
     IdProduto       :=  StrToInt(edt_IDProduto.text);
     PrecoDeCompra   :=  StrToFloat(edtPrecoCompra.Text);
     PrecoDeVenda    :=  StrToFloat(edtPrecoVenda.Text);
     PercentLucro    :=  StrToFloat(edtPercentLucro.Text);
     ValorDeLucro    :=  ( PrecoDeVenda - PrecoDeCompra);

     with DM_Pesq.Qry_Geral do
     begin

        Close;
        SQL.Clear;
        SQL.add('Update produtos SET estoque_atual = :pNovoEstoque, precocompra=:pPrecoCompra, precovenda=:pPrecoVenda, '+
                'percentlucro=:pPercLucro, valordelucro=:pVlLucro WHERE Id_Produto = :pIdProduto');

        ParamByName('pNovoEstoque').asFloat      :=  NovoEstoque;
        ParamByName('pPrecoCompra').asFloat      :=  PrecoDeCompra;
        ParamByName('pPrecoVenda').asFloat       :=  PrecoDeVenda;
        ParamByName('pPercLucro').asFloat        :=  PercentLucro;
        ParamByName('pVlLucro').asFloat          :=  ValorDeLucro;
        ParamByName('pIdProduto').AsInteger      :=  IdProduto;
        ExecSQL;

        //Para não dar erro de cursor not returned abra novamente a consulta de todos os produtos
        SQL.Clear;
        SQL.add(sqlDefalt);
        Params.ParamByName('pDesc').Asstring   :=  'PRODUTO NAO CADASTRADO';
        Params.ParamByName('pStatus').Asstring :=  'A';
        open;

    end;

    MostraIdFuncionario;  // Procura ID do funcionario e mostra na variavel IdDoFuncionarioLogado
    AtualizarHistoricoEP;

    Application.MessageBox('Atualização feita com Sucesso!', 'OK', MB_OK);
    LogOperacoes(NomeDoUsuarioLogado, 'atualizado estoque de produto');
    LimparCamposNovaEntrada;

    Abrir_Fechar_Tabelas;
    EstadoInicialDosBotoes;

end;

procedure T_frmProdutos.AtualizarHistoricoEP;
var
  proxNumHistorico, IDFornecedor  : integer;
begin

          if escolheuFornecedor then
                 IDFornecedor      := StrToInt(DBIDFornecedor.Text)
                    else    IDFornecedor := 1;

          MostrarMesEAno(dtDataDoDia.Text);
          proxNumHistorico  := GerarProximoID('id_historico','historico_produtos');

           // Abrindo um registro novo e gravando no bd
           with dm_DadosSegundo.cds_HistoricoProdutos do begin

              Append;

              FieldByName('id_historico').AsInteger     := proxNumHistorico;
              FieldByName('produto_id').AsInteger       := IdProduto;
              FieldByName('pedido_id').AsInteger        := 0;
              FieldByName('numnf').AsString             := '0';
              FieldByName('fornecedor_id').AsInteger    := IDFornecedor;
              FieldByName('venda_id').AsInteger         := 0;
              FieldByName('cliente_id').AsInteger       := 0;
              FieldByname('operador_id').AsInteger      := IdFuncionarioLogado(lblStatusLogoff.Caption);
              FieldByname('precocompra').AsCurrency     := StrToFloat(edtPrecoCompra.text);
              FieldByname('precovenda').AsCurrency      := StrToFloat(edtPrecoVenda.text);
              FieldByname('valordelucro').AsCurrency    := StrToFloat(edtLucro.text);
              FieldByname('codmov').AsString            := 'EP';  //entrada de produto
              FieldByname('quantidade').AsFloat         := qde_NovaEntrada;
              FieldByname('datamov').AsDateTime         := date;
              FieldByname('historico').AsString         := 'ENTRADA DE PRODUTO';
              FieldByName('mesano').AsString            := mes_ano;
              ApplyUpdates(0);

           end;

           LogOperacoes(NomeDoUsuarioLogado, 'atualização de histórico de entrada de produto');

end;


procedure T_frmProdutos.LimparCamposNovaEntrada;
begin

    edt_CodBarrasNovaEntrada.Clear;
    edt_IDProduto.Clear;
    edt_NomeProdutoEntrada.Clear;
    edt_EstoqueAtual.Clear;
    edt_QuantidadeNovaEntrada.Clear;
    edtPrecoCompra.Clear;
    edtPrecoVenda.Clear;
    edtLucro.Clear;
    escolheuFornecedor       := false;
    btnSairCadastroClick(Self);

end;

procedure T_frmProdutos.MostraIdFuncionario;
begin

      IdDoUsuarioLogado := IdFuncionarioLogado(lblStatusLogoff.Caption);

end;

procedure T_frmProdutos.dbedtPROD_PRECOVENDAExit(Sender: TObject);
begin

    //FORMATANDO O VALOR DO CAMPO COMO CURRENCY SE NAO RECONHECER COLOQUE DB EM USES DEPOIS DE INTERFACE
    TCurrencyField(dm_Conexao.cds_CadProduto.FieldByName('PRECOVENDA')).DisplayFormat:= '###,##0.00';


end;

procedure T_frmProdutos.grid_VisualizaProdutosCellClick(Column: TColumn);
begin
  //somente reaproveitei a variavel não tem a ver com aniversarios
  MostrarFotoProdutoTelaInicial;
  grDados.Enabled             := true;
  btnAlterarProduto.Enabled   := true;
  btnEntrarProduto.Enabled    := true;
  btnBaixarProdutos.Enabled   := true;
  btnimprimir.Enabled         := true;
  codBarrasProduto            :=  dbCodBarrasTelaInicial.text;
  btnCadastrarProduto.Caption := 'Voltar';
  btnCadastrarProduto.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Ok.bmp');

  FormatarValoresComoMoeda;
  
  if not(verificandoEstoqueMinimo)then
  begin
     HabilitarBotoes;
  end else
  begin
     DesabilitarBotoesDeEntrada;
     grDados.Enabled := false;
  end;

end;

procedure T_frmProdutos.PesquisarProdutoParaBaixa;
var
  idProduto : integer;
begin

      idProduto := StrToInt(dbedtID_PRODUTO.Text);

      _Sql := 'SELECT p.*, c.*, f.nome_fabricante, g.forne_nome FROM produtos p, fabricantes f, fornecedores g, categorias c WHERE c.id_categoria=p.categoria_id AND p.fornecedor_id=g.forne_id AND p.DESCRICAO <> :pDesc '+
                 'AND p.FABRICANTE_ID = f.ID_FABRICANTE AND p.STATUS = :pStatus AND p.ID_PRODUTO = :pID';

         with DM_Pesq.cdsPesqProduto do
         begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pID').AsInteger        := idProduto;
            Params.ParamByName('pDesc').Asstring       := 'PRODUTO NAO CADASTRADO';
            Params.ParamByName('pStatus').Asstring     := 'A';
            Open;

            //se o codigo do produto existir
            if not DM_Pesq.cdsPesqProduto.IsEmpty then
            begin
                db_CODIGOBARRAS.Text             := DM_Pesq.cdsPesqProduto.Fieldbyname('cod_barras').AsString;
                db_Descricao.Text                := DM_Pesq.cdsPesqProduto.Fieldbyname('descricao').AsString;
                db_IDDOPRODUTO.Text              := IntToStr(DM_Pesq.cdsPesqProduto.Fieldbyname('id_produto').AsInteger);
                db_ESTOQUEATUAL.Text             := FloatToStr(DM_Pesq.cdsPesqProduto.Fieldbyname('estoque_atual').AsFloat);
            end;

        end;
end;

procedure T_frmProdutos.btnBaixarProdutosClick(Sender: TObject);
begin

       dm_Conexao.cds_CadProduto.Active := true;

       if dm_Conexao.cds_CadProduto.RecordCount = 0 then begin

       Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);

       end
       else begin

            pangrid_BaixaNoEstoque.BringToFront;
            edt_QuantidadeDaBaixa.SetFocus;
            btnBaixarDoEstoque.Enabled := false;
            pan_titulo.Caption         :='Baixando Produtos do Estoque';
            DesabilitarBotoesDeEntrada;
            PesquisarProdutoParaBaixa;

        end;

end;

procedure T_frmProdutos.btnBaixarDoEstoqueClick(Sender: TObject);
begin

      if (edt_QuantidadeDaBaixa.Text = '') or (edt_MotivoDaBaixa.Text = '')  then
      begin

           Application.MessageBox('A quantidade ou o motivo não podem estar vazios!', 'Informação do Sistema', MB_OK);

           if (edt_QuantidadeDaBaixa.Text = '') then begin edt_QuantidadeDaBaixa.SetFocus; end
           else if (edt_MotivoDaBaixa.Text = '') then begin edt_MotivoDaBaixa.SetFocus; end;

      end else begin

        if  (StrToFloat(edt_QuantidadeDaBaixa.text) > StrToFloat(db_ESTOQUEATUAL.Text)) then
        begin

            Application.MessageBox('Não existe quantidade suficiente em estoque para realizar esta operação!', 'Informação do Sistema', MB_OK);
            edt_QuantidadeDaBaixa.SetFocus;

        end else begin

          texto:= 'Confirma o desejo de baixar a quantidade solicitada?';

          if Application.MessageBox(PChar(texto),'Baixa de Produto',MB_YESNO + MB_ICONQUESTION) = IdYes then
          begin

                 BaixarQdeUsadaDoEstoque;

          end else begin

                 exit;

          end;

        end;

      end;

end;


procedure T_frmProdutos.BaixarQdeUsadaDoEstoque;
var

    Id_ProdutoUsado,proxNumHistorico  : integer;
    QdeAnteriorEstoque, QdeAposBaixa, QdePraBaixar : double;

begin

        Id_ProdutoUsado    := StrToInt(db_IDDOPRODUTO.Text);
        QdeAnteriorEstoque := StrToFloat(db_ESTOQUEATUAL.Text);
        QdePraBaixar       := StrToFloat(edt_QuantidadeDaBaixa.Text);
        QdeAposBaixa       := ( QdeAnteriorEstoque - QdePraBaixar );   

        MostrarMesEAno(dtDataDoDia.Text);

        With DM_Pesq.Qry_Geral do
        begin

             close;
             sql.Clear;
             sql.Add('UPDATE produtos SET estoque_atual = :pEstoqueAtualizar WHERE id_produto = :pId_Produto');
             Params.ParamByName('pEstoqueAtualizar').AsFloat   := QdeAposBaixa;
             Params.ParamByName('pId_Produto').AsInteger       := Id_ProdutoUsado;
             ExecSQL();

        end;


          //ATUALIZAR HISTORICO DE PRODUTOS
          proxNumHistorico  := GerarProximoID('id_historico','historico_produtos');

           // Abrindo um registro novo e gravando no bd
           with dm_DadosSegundo.cds_HistoricoProdutos do
           begin

              Append;

              FieldByName('id_historico').AsInteger     := proxNumHistorico;
              FieldByName('produto_id').AsInteger       := StrToInt(db_IDDOPRODUTO.Text);
              FieldByName('pedido_id').AsInteger        := 0;
              FieldByName('numnf').AsString             := '0';
              FieldByName('fornecedor_id').AsInteger    := 0;
              FieldByName('venda_id').AsInteger         := 0;
              FieldByName('cliente_id').AsInteger       := 0;
              FieldByname('operador_id').AsInteger      := IdFuncionarioLogado(lblStatusLogoff.Caption);
              FieldByname('codmov').AsString            := 'BX';  //baixa de produto
              FieldByname('quantidade').AsFloat         := StrToFloat(edt_QuantidadeDaBaixa.Text);
              FieldByname('datamov').AsDateTime         := date;
              FieldByname('historico').AsString         := UpperCase(edt_MotivoDaBaixa.Text);
              FieldByName('mesano').AsString            := mes_ano;
              ApplyUpdates(0);

           end;


        Application.MessageBox('A quantidade solicitada foi baixada  com sucesso do estoque!', 'Operação realizada com sucesso', MB_OK);
        LogOperacoes(NomeDoUsuarioLogado, 'baixa de produto do estoque');
        Abrir_Fechar_Tabelas;

        edt_QuantidadeDaBaixa.Clear;
        edt_QuantidadeDaBaixa.SetFocus;
        edt_MotivoDaBaixa.Clear;
        btnBaixarDoEstoque.Enabled := false;

        //Inclusao
        pangrid_visualizacao.BringToFront;
        pan_titulo.Caption            := 'Controle de Produtos - Visualizando...';
        pan_botoes.Enabled            := true;
        HabilitarBotoes;
        MostrarFotoProdutoTelaInicial;
        grDados.Enabled:=false;
        EstadoInicialDosBotoes;
        MostrarDadosTelaInicial;    

end;

procedure T_frmProdutos.Grid_BaixaCellClick(Column: TColumn);
begin

    btnBaixarDoEstoque.Enabled := true;
    edt_QuantidadeDaBaixa.SetFocus;

end;

procedure T_frmProdutos.CalcularPrecoVendaPorPercentual;
begin

      precocompra            := strtofloat(edt_precocompra.text);
      percentual             := strtofloat(edt_percentual.text);
      precovenda             := CalcularValorPorPercentual(precocompra,percentual);
      edt_precovenda.Text    := floattostr(precovenda);
      edt_precovenda.Enabled := false;
      edt_Lucro.text         := floattostr(precovenda - precocompra);
      edt_QuantidadeDeEntrada.SetFocus;

end;

procedure T_frmProdutos.CalcularPrecoVendaPorValor;
begin

      precocompra            := strtofloat(edt_precocompra.text);
      edt_Lucro.text         := floattostr(precovenda - precocompra);
      valorlucro             := strtofloat(edt_percentual.text);
      precovenda             := ( precocompra + valorlucro );
      edt_Lucro.text         := floattostr(precovenda - precocompra);
      edt_precovenda.Text    := floattostr(precovenda);
      edt_precovenda.Enabled := false;
      edt_percentual.text    := '0,00';
      edt_QuantidadeDeEntrada.SetFocus;


end;

procedure T_frmProdutos.CalcularPrecoVenda;
begin

      if(cmbTipoLucro.ItemIndex = 0)then
      begin

         CalcularPrecoVendaPorPercentual;

      end else if(cmbTipoLucro.ItemIndex = 1)then
      begin

           CalcularPrecoVendaPorValor;

      end;

end;

procedure T_frmProdutos.edt_percentualExit(Sender: TObject);
begin

    if( edt_percentual.Text = '0,00' ) then
    begin

           if(cmbTipoLucro.ItemIndex = 0)then
           begin
             Application.MessageBox('O valor do percentual de lucro não pode ser igual a zero!', 'Valor inválido', MB_ICONWARNING);
           end else
           begin
              Application.MessageBox('O valor de lucro não pode ser igual a zero!', 'Valor inválido', MB_ICONWARNING);
           end;
           edt_percentual.SetFocus;

    end else
    begin
      CalcularPrecoVenda;
    end;

end;

procedure T_frmProdutos.CalcularValorDeLucro;
begin

  if ( edt_lucro.Text <> '0,00' ) then
  begin

      precocompra            := strtofloat(edt_precocompra.text);
      precovenda             := strtofloat(edt_precovenda.text);

      if ( PrecoVenda > precocompra ) then
      begin

          ValorDeLucro                  := ( PrecoVenda - precocompra );
          edt_Lucro.Text                := floattostr(ValorDeLucro);
          txtStatusCadastro.Caption     := ItensStatusCadastro[7];

      end else begin
          txtStatusCadastro.Caption     := ItensStatusCadastro[7];
          Application.MessageBox('O preço de venda não pode ser menor que o preço de compra!', 'Valor inválido!', MB_OK);
          edt_precovenda.SetFocus;

      end;

   end else begin

      cmbTipoLucro.SetFocus;

   end;

end;


procedure T_frmProdutos.edt_QuantidadeDeEntradaEnter(Sender: TObject);
begin

    btnFabricantes.Enabled      := true;
    btnCategorias.Enabled       := true;
    btnForncedores.Enabled      := true;     

end;

procedure T_frmProdutos.txtEstoqueMinimoKeyPress(Sender: TObject;
  var Key: Char);
begin
    // PARA DBEDIT ACEITAR APENAS NUMEROS
    If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;


procedure T_frmProdutos.btnCancelarInclusaoClick(Sender: TObject);
begin

  if VerificaCaption('Cancelar',btnCancelarInclusao) then
  begin
         LimparCamposPrimeiraEntrada;
         Application.MessageBox('O atual cadastro foi cancelado com sucesso!', 'Informação do Sistema', MB_OK);
         btnCancelarInclusao.Enabled    := false;
         bloco_campos_inclusao.Enabled:=false;
         bloco_Foto.Enabled:=false;
         btnNovoProduto.Enabled:=true;
         cmbTipoLucro.Enabled := true;
         cmbTipoLucro.ItemIndex := 0;
         txtEstoqueMinimo.Text  := '5,00';
  end;
        btnCancelarInclusao.Caption := 'Cancelar';

end;

procedure T_frmProdutos.LimparCamposPrimeiraEntrada;
begin

      edt_CodigoProduto.Clear;
      edt_CodigoProduto.SetFocus;
      btnCancelarInclusao.Enabled    := false;
      edt_QuantidadeDeEntrada.Text   := '0';
      txtEstoqueMinimo.Text          := '5,00';
      edt_DescricaoCadProduto.Clear;
      edt_precocompra.Text           := '0,00';
      edt_percentual.Text            := '0,00';
      edt_precovenda.Text            := '0,00';
      edt_Lucro.Text                 := '0,00';
      edtAplicacao.Clear;
      btnConfirmaInclusao.Enabled    := false;
      btnRetornaDaInclusao.Enabled   := true;
      btnEscolherFoto.Enabled        := false;
      edt_precovenda.Enabled         := true;
      btnFabricantes.Enabled         := false;
      btnCategorias.Enabled          := false;
      btnForncedores.Enabled         := false;
      DBCategoria.KeyValue           := -1;
      DBFabricante.KeyValue          := -1;
      DBFornecedorProduto.KeyValue   := -1;

      escolheuFornecedor             := false;
      escolheuCategoria              := false;
      escolheuFabricante             := false;
      GerouCodBarra                  := false;

      edt_CodAlt1.Clear;
      edt_CodAlt2.Clear;
      edt_CodAlt3.Clear;
      edt_CodAlt4.Clear;

      btnNovoProdutoClick(self);

      pan_titulo.Caption:= 'Controle de Produtos - Cadastrando...';
      MostrarFotoPadrao;
      btnNovoProduto.Enabled := true;
      btnRetornaDaInclusao.Enabled:=true;
      GroupBox4.SetFocus;  //Setando grupo para dar algum foco apos o cadastro

end;

procedure T_frmProdutos.DBCategoriaClick(Sender: TObject);
begin

    DBFornecedorProduto.SetFocus;
    escolheuCategoria := true;

end;

procedure T_frmProdutos.btnSairAteracaoCategoriaClick(Sender: TObject);
begin
    pangrid_inclusao.BringToFront;
end;

procedure T_frmProdutos.edtConsProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

      if KEY = VK_RETURN then
      begin

          edtConsProduto.Clear;
          btnInativar.Enabled := false;
          MostrarDadosTelaInicial;
          btnCadastrarProduto.Caption := 'Cadastro Inicial';
          btnCadastrarProduto.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');

      end;

end;

procedure T_frmProdutos.edtConsProdutoChange(Sender: TObject);
begin

     PesquisarProdutoPorNome;

end;

procedure T_frmProdutos.PesquisarProdutoPorNome;
begin

      NomeDoProdutoParaVenda:= edtConsProduto.Text;

      _Sql  := ('SELECT DISTINCT p.*, f.nome_fabricante, c.categoria, g.forne_nome FROM produtos p, fabricantes f, categorias c, fornecedores g WHERE p.descricao <> '+QuotedStr('PRODUTO NAO CADASTRADO')+' '+
                     'AND p.fabricante_id = f.id_fabricante AND p.categoria_id = c.id_categoria AND p.fornecedor_id = g.forne_id AND p.descricao LIKE ''%'+NomeDoProdutoParaVenda+'%'' AND p.tipo = '+QuotedStr('P')+' '+
                     'OR p.COD_ALT1 LIKE ''%'+NomeDoProdutoParaVenda+'%'' OR p.COD_ALT2 LIKE ''%'+NomeDoProdutoParaVenda+'%'' '+
                     'OR p.COD_ALT3 LIKE ''%'+NomeDoProdutoParaVenda+'%'' OR p.COD_ALT4 LIKE ''%'+NomeDoProdutoParaVenda+'%'' '+
                     'OR p.COD_BARRAS LIKE ''%'+NomeDoProdutoParaVenda+'%'' AND p.status = '+QuotedStr('A')+' ORDER BY p.descricao');


      with DM_Pesq.cdsPesqProduto do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

      MostrarFotoProdutoTelaInicial;
      btnCadastrarProduto.Caption := 'Voltar';
      btnCadastrarProduto.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Ok.bmp');
      FormatarValoresComoMoeda;
      
end;


procedure T_frmProdutos.dbedtID_PRODUTOClick(Sender: TObject);
begin

        idProdutoPesquisa := InputBox('Pesquisa produto', 'Entre com Código do produto', '');

        if (idProdutoPesquisa <> '' ) then
        begin
              PesquisarProdutoPorID;
        end else
        begin
            ShowMessage('Código inválido');
            edtConsProduto.SetFocus;
        end;

end;

procedure T_frmProdutos.PesquisarProdutoPorID;
begin

      _Sql  := 'SELECT * FROM produtos WHERE id_produto = :pIDProduto';

      with dm_Conexao.cds_CadProduto do
      begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pIDProduto').AsInteger := StrToInt(idProdutoPesquisa);
            Open;

            if IsEmpty then
            begin

                Application.MessageBox('A pesquisa não retornou registros, digite outro valor!', 'Produto não encontrado!', MB_OK);
                 edtConsProduto.Clear;
                 edtConsProduto.SetFocus;
                exit;

            end;

      end;

      edtConsProduto.SetFocus;
      MostrarFotoProdutoTelaInicial;

end;


procedure T_frmProdutos.DBFornecedoresClick(Sender: TObject);
begin
    escolheuFornecedor := true;
end;

procedure T_frmProdutos.edt_CodBarrasNovaEntradaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

       if key = vk_return then
       begin

       if edt_CodBarrasNovaEntrada.Text = '' then
       begin

             texto := 'O código do produto não foi digitado deseja sair?';

              if Application.MessageBox(PChar(texto),'Digite o código!',MB_YESNO + MB_ICONQUESTION) = IdYes then
              begin

                  pangrid_visualizacao.BringToFront;
                  pan_titulo.Caption:= 'Controle de Produtos - Visualizando...';
                  pan_botoes.Enabled:= true;
                  pnl_Produto.Visible              := false;
                  edt_CodBarrasNovaEntrada.Clear;
                  edt_IDProduto.Clear;
                  edt_NomeProdutoEntrada.Clear;
                  edt_EstoqueAtual.Clear;
                  edt_QuantidadeNovaEntrada.Clear;

                  HabilitarBotoes;

              end
              else begin

                 edt_CodBarrasNovaEntrada.SetFocus;
                 pnl_Produto.Visible := false;

           end;

       end;

       end;
end;

procedure T_frmProdutos.dbedtPROD_DESCRICAOExit(Sender: TObject);
begin

    dm_Conexao.cds_CadProduto.Next;
    dm_Conexao.cds_CadProduto.ApplyUpdates(0);

end;

procedure T_frmProdutos.btnFabricantesClick(Sender: TObject);
begin

   //dados necessários para acessar cadastro em tabela com apenas um campo
   nomeTabela    := 'FABRICANTES';
   campoNome     := 'NOME_FABRICANTE';
   campoID       := 'ID_FABRICANTE';
   cdsTable      := dm_Conexao.cds_Fabricante;
   dsTable       := dm_Conexao.ds_Fabricante;

   Application.CreateForm(T_frmCadastroPadraoUmCampo,  _frmCadastroPadraoUmCampo);
   _frmCadastroPadraoUmCampo.ShowModal;
   FreeAndNil(_frmCadastroPadraoUmCampo);

   dm_Conexao.cds_Fabricante.Active:=true;

end;

procedure T_frmProdutos.btnCategoriasClick(Sender: TObject);
begin

   //dados necessários para acessar cadastro em tabela com apenas um campo
   nomeTabela    := 'CATEGORIAS';
   campoNome     := 'CATEGORIA';
   campoID       := 'ID_CATEGORIA';
   cdsTable      := dm_DadosSegundo.cds_Categorias;
   dsTable       := dm_DadosSegundo.ds_Categorias;

   Application.CreateForm(T_frmCadastroPadraoUmCampo,  _frmCadastroPadraoUmCampo);
   _frmCadastroPadraoUmCampo.ShowModal;
   FreeAndNil(_frmCadastroPadraoUmCampo);

   dm_DadosSegundo.cds_Categorias.Active:=true;

end;

procedure T_frmProdutos.btnForncedoresClick(Sender: TObject);
begin

     Application.CreateForm(T_frmFornecedores,  _frmFornecedores);
     _frmFornecedores.ShowModal;
     FreeAndNil(_frmFornecedores);
          
end;

procedure T_frmProdutos.DBFornecedorProdutoClick(Sender: TObject);
begin

    escolheuFornecedor  := true;

end;

procedure T_frmProdutos.edt_QuantidadeDeEntrada2Click(Sender: TObject);
begin

     edt_QuantidadeDeEntrada.SelStart:=0;
     edt_QuantidadeDeEntrada.SelLength:= Length(edt_QuantidadeDeEntrada.Text);

end;

procedure T_frmProdutos.DBFabricanteClick(Sender: TObject);
begin

      DBCategoria.SetFocus;
      escolheuFabricante := true;

end;


procedure T_frmProdutos.edtPrecoCompraExit(Sender: TObject);
begin
     AlterarPrecoDeCompraPelaTelaAlteracao;
     btnGravarEntrada.Enabled := true;
end;

procedure T_frmProdutos.edt_QuantidadeNovaEntradaExit(Sender: TObject);
begin

     if( edt_QuantidadeNovaEntrada.Text = '' )then
     begin

        edt_QuantidadeNovaEntrada.Text := '0';

     end;
     btnGravarEntrada.Enabled := true;
end;

procedure T_frmProdutos.edtPrecoCompraClick(Sender: TObject);
begin

     edtPrecoCompra.SelStart:=0;
     edtPrecoCompra.SelLength:= Length(edtPrecoCompra.Text);

end;

procedure T_frmProdutos.edt_QuantidadeNovaEntradaEnter(Sender: TObject);
begin

    edtConsProduto.Clear;

end;

procedure T_frmProdutos.memoObsEnter(Sender: TObject);
begin

  txtStatusCadastro.Caption     := ItensStatusCadastro[14];

end;

procedure T_frmProdutos.btnSairCadastroClick(Sender: TObject);
begin

      pangrid_visualizacao.BringToFront;
      pan_titulo.Caption:= 'Controle de Produtos - Visualizando...';
      pan_botoes.Enabled:= true;
      grDados.Enabled:=false;
      btnEntrarProduto.Enabled  := false;
      HabilitarBotoes;
      MostrarFotoProdutoTelaInicial;
      EstadoInicialDosBotoes;
      MostrarDadosTelaInicial;

end;

procedure T_frmProdutos.edt_CodBarrasNovaEntradaEnter(Sender: TObject);
begin

     PesquisarCodBarProdutoParaEntrada;

end;


procedure T_frmProdutos.edt_DescricaoCadProdutoEnter(Sender: TObject);
begin

    if Length(Trim(edt_CodigoProduto.Text)) = 0 then
    begin

        gerarCodigoBarrasAuto;

    end else
    begin

        if not TemDuplicidade(dm_Conexao.cds_CadProduto,'cod_barras',edt_CodigoProduto.Text)then
        begin
          btnEscolherFoto.Enabled       := true;
          btnNovoProduto.Enabled        := false;
          txtStatusCadastro.Caption     := ItensStatusCadastro[2];
        end else
        begin

          Application.MessageBox('Atenção este produto já cadastrado ou inativado!',
                        'Duplicidade!', MB_OK + MB_ICONWARNING);
          LimparCamposPrimeiraEntrada;
          bloco_campos_inclusao.Enabled := false;

        end;

    end;
    txtStatusCadastro.Caption     := ItensStatusCadastro[2];
end;

procedure T_frmProdutos.edt_CodigoProdutoEnter(Sender: TObject);
begin

    btnCancelarInclusao.Enabled   := false;
    btnEscolherFoto.Enabled       := false;
    txtStatusCadastro.Caption     := ItensStatusCadastro[1];

end;


procedure T_frmProdutos.edt_MotivoDaBaixaKeyPress(Sender: TObject;
  var Key: Char);
begin

    btnBaixarDoEstoque.Enabled := true;

end;

procedure T_frmProdutos.btnNovoProdutoClick(Sender: TObject);
begin

        bloco_campos_inclusao.Enabled := true;
        bloco_Foto.Enabled            := true;
        btnNovoProduto.Enabled        := false;
        btnCancelarInclusao.Caption   := 'Cancelar';
        edt_CodigoProduto.SetFocus;

end;


procedure T_frmProdutos.edt_CodAlt1Enter(Sender: TObject);
begin
btnRetornaDaInclusao.Enabled  :=false;
cmbTipoLucro.Enabled          := false;
txtStatusCadastro.Caption     := ItensStatusCadastro[3];
if( edt_DescricaoCadProduto.Text = '' )then
   edt_DescricaoCadProduto.SetFocus;
end;

procedure T_frmProdutos.edt_CodAlt2Enter(Sender: TObject);
begin
txtStatusCadastro.Caption     := ItensStatusCadastro[3];
end;

procedure T_frmProdutos.edt_CodAlt3Enter(Sender: TObject);
begin
txtStatusCadastro.Caption     := ItensStatusCadastro[3];
end;

procedure T_frmProdutos.edt_CodAlt4Enter(Sender: TObject);
begin
txtStatusCadastro.Caption     := ItensStatusCadastro[3];
end;

procedure T_frmProdutos.edt_precocompraEnter(Sender: TObject);
begin
txtStatusCadastro.Caption     := ItensStatusCadastro[4];
end;

procedure T_frmProdutos.edt_percentualEnter(Sender: TObject);
begin

   if(cmbTipoLucro.ItemIndex = 0)then
   begin
       txtStatusCadastro.Caption   := ItensStatusCadastro[5];
   end else begin
     txtStatusCadastro.Caption     := ItensStatusCadastro[19];
   end;

   edt_percentual.SelectAll;

end;

procedure T_frmProdutos.edt_precovendaEnter(Sender: TObject);
begin
txtStatusCadastro.Caption     := ItensStatusCadastro[6];
end;

procedure T_frmProdutos.txtEstoqueMinimoEnter(Sender: TObject);
begin
txtStatusCadastro.Caption     := ItensStatusCadastro[8];
if ( edt_QuantidadeDeEntrada.Text = '' ) then
begin
     edt_QuantidadeDeEntrada.Text := '0';
end;
btnCancelarInclusao.Enabled   := true;
end;

procedure T_frmProdutos.DBFabricanteEnter(Sender: TObject);
begin
txtStatusCadastro.Caption     := ItensStatusCadastro[9];
end;

procedure T_frmProdutos.DBCategoriaEnter(Sender: TObject);
begin
txtStatusCadastro.Caption     := ItensStatusCadastro[10];
end;

procedure T_frmProdutos.DBFornecedorProdutoEnter(Sender: TObject);
begin
txtStatusCadastro.Caption     := ItensStatusCadastro[11];
end;

procedure T_frmProdutos.cmbAliquotaEnter(Sender: TObject);
begin
txtStatusCadastro.Caption     := ItensStatusCadastro[12];
end;

procedure T_frmProdutos.cmbUnidadeEnter(Sender: TObject);
begin
txtStatusCadastro.Caption     := ItensStatusCadastro[13];
end;

procedure T_frmProdutos.edtAplicacaoEnter(Sender: TObject);
begin
txtStatusCadastro.Caption     := ItensStatusCadastro[14];
end;

procedure T_frmProdutos.btnSairAlteracaoProdutoClick(Sender: TObject);
begin

      grDados.Enabled := false;
      pangrid_visualizacao.BringToFront;
      pan_titulo.Caption:= 'Controle de Produtos - Visualizando...';
      pan_botoes.Enabled:= true;
      HabilitarBotoes;
      btnAlterarProduto.Enabled := false;
      EstadoInicialDosBotoes;
      MostrarDadosTelaInicial;
      MostrarFotoProdutoTelaInicial;

end;

procedure T_frmProdutos.DBALTERAPRECOVENDAClick(Sender: TObject);
begin

   {foi criada uma funcao para verificar se o produto em questao é produto ou serviço sendo produto libera alteraçao
   se nao for produto nao permitira que seja alterado o preço de venda, o que devera ser feito em serviços}

    VerificaSeEProduto(Strtoint(dbedtID_PRODUTO.Text));

    if EProduto then
    begin

          if dm_Conexao.cds_CadProduto.RecordCount = 0 then begin

             Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);

          end
          else begin

                if Application.MessageBox('Deseja alterar o preço de venda deste produto?',
                  'Alteração Individual de Preço', MB_YESNO +
                  MB_ICONQUESTION) = IDYES then begin

                     //Criando e abrindo o formulário ao clicar no botão

                      Application.CreateForm(T_frmalterapreco,  _frmalterapreco);
                      _frmalterapreco.ShowModal;
                      FreeAndNil(_frmalterapreco);

                end else begin

                  if Application.MessageBox('Deseja alterar os preços de venda de todos os produtos através de um percentual?',
                    'Alteração coletiva de Preços', MB_YESNO +
                    MB_ICONQUESTION) = IDYES then begin

                       //Criando e abrindo o formulário ao clicar no botão

                       Application.CreateForm(T_frmalteratodosprecos,  _frmalteratodosprecos);
                       _frmalteratodosprecos.ShowModal;
                       FreeAndNil(_frmalterapreco);


                  end else begin

                        Exit;

                  end;

                end;

          end;

     end else begin

       Application.MessageBox('Este recurso só é permitido para produtos e não para serviços!', 'Informação do Sistema', MB_OK);

     end;

end;

procedure T_frmProdutos.BloquearCamposParaAlteracaoOBS;
begin

       grDados.Enabled                       := true;
       btnCadastrarProduto.Enabled           :=false;
       btnSair.Enabled                       :=false;
       grPesquisa.Enabled                    :=false;
       grid_VisualizaProdutos.Enabled        :=false;
       grCampos.Enabled                      :=false;

end;

procedure T_frmProdutos.LiberarCamposAposAlteracaoOBS;
begin

       btnCadastrarProduto.Enabled           :=true;
       btnSair.Enabled                       :=true;
       grPesquisa.Enabled                    :=true;
       grid_VisualizaProdutos.Enabled        :=true;
       grDados.Enabled                       := true;
       memoTelaPrin.Hint                     := '';
       edtConsProduto.SetFocus;
       //ShowMessage(Screen.ActiveControl.Name);
       
end;

procedure T_frmProdutos.memoTelaPrinClick(Sender: TObject);
begin

    if alterandoObs then
    begin
       memoTelaPrin.SetFocus;
    end else
    begin
      if Application.MessageBox('Deseja fazer alterações neste campo? Se sim faça as alterações e tecle [Enter] para gravar!', 'Alterando o campo Observações!', MB_YESNO + MB_ICONWARNING) = IDYES then
      begin
           memoTelaPrin.ReadOnly := false;
           alterandoObs := true;
           EstadoInicialDosBotoes;
           memoTelaPrin.Hint := 'Preencha as alterações neste campo e tecle enter para gravar!';

           //travando campos até que grave as alterações
           BloquearCamposParaAlteracaoOBS;

      end else
      begin
           btnCadastrarProdutoClick(self);
           edtConsProduto.SetFocus;
      end;
    end;

end;

procedure T_frmProdutos.dbedtPROD_DESCRICAOClick(Sender: TObject);
begin
  AlterarDescricaoProduto;
end;

procedure T_frmProdutos.DBALTERAPRECOCOMPRAClick(Sender: TObject);
begin

   {foi criada uma funcao para verificar se o produto em questao é produto ou serviço sendo produto libera alteraçao
   se nao for produto nao permitira que seja alterado o preço de venda, o que devera ser feito em serviços}

    VerificaSeEProduto(Strtoint(dbedtID_PRODUTO.Text));

    if EProduto then
    begin

          if dm_Conexao.cds_CadProduto.RecordCount = 0 then begin

             Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);

          end
          else begin

                if Application.MessageBox('Deseja alterar o preço de compra deste produto?',
                  'Alteração do preço de compra', MB_YESNO +
                  MB_ICONQUESTION) = IDYES then begin

                     //Criando e abrindo o formulário ao clicar no botão

                      Application.CreateForm(T_frmAlteraPrecoDeCompra,  _frmAlteraPrecoDeCompra);
                      _frmAlteraPrecoDeCompra.ShowModal;
                      FreeAndNil(_frmAlteraPrecoDeCompra);

                end else begin

                      Exit;

                  end;

          end;

     end else begin

       Application.MessageBox('Este recurso só é permitido para produtos e não para serviços!', 'Informação do Sistema', MB_OK);

     end;

end;

procedure T_frmProdutos.btnAlterarProdutoClick(Sender: TObject);
   var
   FotoProduto : string;
begin

      FotoProduto := ExtractFilePath(Application.ExeName) + 'Produtos\'+dbCodBarrasTelaInicial.Text+'.jpg';

      if dm_Conexao.cds_CadProduto.RecordCount = 0 then begin

          Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);

      end
      else begin

        PanGridAlteraFotoProdutos.BringToFront;
        pan_titulo.Caption:= 'Alteção de Fotos de Produtos - Cadastrando...';
        pangrid_visualizacao.SendToBack;
        DesabilitarBotoesDeEntrada;
        btnAlterarFotoProduto.Enabled:=true;
        edtNomeProduto.Caption      := dbedtPROD_DESCRICAO.Text;
        edtCodBarrasProduto.Caption := dbCodBarrasTelaInicial.Text;

         if FileExists(FotoProduto) then
          begin

                img_MostraProdutoParaAlteracao.Picture.LoadFromFile(FotoProduto);
                img_MostraProdutoParaAlteracao.Transparent := true;

          end else begin

                texto:= 'A Imagem '+FotoProduto+', correspondente á imagem do código de barras não foi encontrada!';
                Application.MessageBox(PChar(texto),'Imagem não encontrada,verifique!',MB_OK + MB_ICONEXCLAMATION);

          end;
          
      end;

end;

procedure T_frmProdutos.edt_QuantidadeDeEntradaKeyPress(Sender: TObject;
  var Key: Char);
begin
        // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;
        btnConfirmaInclusao.Enabled:= true;
end;

procedure T_frmProdutos.gerarCodigoBarrasAuto;
var
  codBarrasAuto : string;
begin

    //gera um número aleatório de 13 digitos tipo codigo de barras AN13
    randomize;
    codBarrasAuto          :=  FormatFloat('0000000000000', Random(9999999999999));
    edt_CodigoProduto.Text := codBarrasAuto;

end;

procedure T_frmProdutos.bloco_FotoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not (escolheufotocadastro)then
  begin
      txtStatusCadastro.Caption     := ItensStatusCadastro[17];
  end;
end;

procedure T_frmProdutos.edt_QuantidadeNovaEntradaClick(Sender: TObject);
begin
     edt_QuantidadeNovaEntrada.SelStart:=0;
     edt_QuantidadeNovaEntrada.SelLength:= Length(edt_QuantidadeNovaEntrada.Text);
end;

procedure T_frmProdutos.edt_QuantidadeNovaEntradaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    btnGravarEntrada.Enabled:=true;
end;

procedure T_frmProdutos.dbCodBarrasTelaInicialClick(Sender: TObject);
begin
  VerificaSeEProduto(Strtoint(dbedtID_PRODUTO.Text));

    if EProduto then
    begin

          if dm_Conexao.cds_CadProduto.RecordCount = 0 then begin

            Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);

          end
          else begin

               Application.CreateForm(T_frmCadCodBarras,  _frmCadCodBarras);
               _frmCadCodBarras.ShowModal;
              FreeAndNil(_frmCadCodBarras);

          end;


    end else begin

       Application.MessageBox('Este recurso só é permitido para produtos e não para serviços!', 'Informação do Sistema', MB_OK);

     end;
end;

procedure T_frmProdutos.DBEDT_VALORCOMPRAClick(Sender: TObject);
begin

    AlterarPrecoDeCompra;

end;

procedure T_frmProdutos.AlterarPrecoDeCompra;
var
  texto     : String;
  idProduto : integer;
begin

    idProduto := StrToInt(dbedtID_PRODUTO.text);

    if InputQuery('Novo preço de compra','Entre com o novo valor, use a vírgula(,) como separador decimal!',texto)then
    begin

      novoprecocompra        := StrToFloat(texto);
      DBEDT_VALORCOMPRA.Text := FloatToStr(novoprecocompra);

      //CALCULANDO VALOR DE LUCRO DE ACORDO COM O PERCENTUAL APONTADO
      valorPercentual := StrToFloat(dbedtPERCENTLUCRO.text);
      novoprecocompra := StrToFloat(DBEDT_VALORCOMPRA.text);
      valorLucro      := ( novoprecocompra * valorPercentual )/100;

      //CALCULANDO NOVA PREÇO DE VENDA
      precoVendas     := ( novoprecocompra + valorLucro);


      {ShowMessage('valor do Percentual '+FloatToStr(valorPercentual)+'%');
      ShowMessage('valor de lucro = '+FloatToStr(valorLucro)); }

      try

          _Sql := ('UPDATE produtos SET precocompra = :pCompra, valordelucro = :pLucro, precovenda = :pVenda WHERE id_produto =:pID');

          with DM_Pesq.cdsPesqProduto do
          begin

               close;
               CommandText := _Sql;
               Params.ParamByName('pCompra').Asfloat  := novoprecocompra;
               Params.ParamByName('pLucro').Asfloat   := valorLucro;
               Params.ParamByName('pVenda').Asfloat   := precoVendas;
               Params.ParamByName('pID').AsInteger    := idProduto;
               execute;

               //Para não dar erro de cursor not returned abra novamente a consulta de todos os produtos
               CommandText := sqlDefalt;
               Params.ParamByName('pDesc').Asstring   :=  'PRODUTO NAO CADASTRADO';
               Params.ParamByName('pStatus').Asstring :=  'A';
               open;

          end;

          Abrir_Fechar_Tabelas;
          FormatarValoresComoMoeda;
          grDados.Enabled := false;
          Application.MessageBox('Novo preço de compra aplicado com sucesso!', 'Mudando o valor do preço de compra!', MB_ICONINFORMATION);

      except
           ShowMessage('Valor inválido!');
           Exit;
      end;
  end;

end;

procedure T_frmProdutos.dbedtPERCENTLUCROClick(Sender: TObject);
begin

   AlterarPercentualDeLucro;

end;

procedure T_frmProdutos.AlterarPercentualDeLucro;
var
  texto : String;
  idProduto  : integer;
begin

    idProduto       := StrToInt(dbedtID_PRODUTO.text);
    precoCompra     := StrToFloat(DBEDT_VALORCOMPRA.Text);
    valorPercentual := StrToFloat(dbedtPERCENTLUCRO.text);

    if InputQuery('Novo percentual de lucro','Valor Percentual(%)',texto)then
    begin

      valorPercentual := StrToFloat(texto);

      try

          _Sql := ('UPDATE produtos SET percentlucro = :pLucro WHERE id_produto = :pID');

          with DM_Pesq.cdsPesqProduto do
          begin

               close;
               CommandText := _Sql;
               Params.ParamByName('pLucro').Asfloat := valorPercentual;
               Params.ParamByName('pID').AsInteger  := idProduto;
               execute;
               //Para não dar erro de cursor not returned abra novamente a consulta de todos os produtos
               CommandText := sqlDefalt;
               Params.ParamByName('pDesc').Asstring   :=  'PRODUTO NAO CADASTRADO';
               Params.ParamByName('pStatus').Asstring :=  'A';
               open;

          end;

          //ALTERANDO O PRECO VENDA DE ACORDO COM O NOVO PERCENTUAL
          precoVendas := precoCompra + ( precoCompra * valorPercentual )/100;
          valorLucro  := precoVendas - precoCompra;

          //ShowMessage('preco de venda : '+ FloatToStr(precoVendas));
          //ShowMessage('preco de venda : '+ FloatToStr(valorLucro));

          _Sql := ('UPDATE produtos SET precovenda = :pVenda, valordelucro = :pLucro WHERE id_produto = :pID');

          with DM_Pesq.cdsPesqProduto do
          begin

               close;
               CommandText := _Sql;
               Params.ParamByName('pVenda').Asfloat := precoVendas;
               Params.ParamByName('pLucro').Asfloat := valorLucro;
               Params.ParamByName('pID').AsInteger  := idProduto;
               execute;
               //Para não dar erro de cursor not returned abra novamente a consulta de todos os produtos
               CommandText := sqlDefalt;
               Params.ParamByName('pDesc').Asstring   :=  'PRODUTO NAO CADASTRADO';
               Params.ParamByName('pStatus').Asstring :=  'A';
               open;

          end;

          Abrir_Fechar_Tabelas;
          FormatarValoresComoMoeda;
          grDados.Enabled := false;
          Application.MessageBox('Novo percentual aplicado com sucesso!', 'Mudando o valor de percentual!', MB_ICONINFORMATION);

      except
           ShowMessage('Valor inválido!');
           Exit;
      end;
  end;
end;

procedure T_frmProdutos.AlterarEstoqueAtual;
var
  texto : String;
  idProduto : integer;
begin

    idProduto := StrToInt(dbedtID_PRODUTO.text);

    if InputQuery('Novo valor de estoque','Entre com o novo valor, use a vírgula(,) como separador decimal!',texto)then
    begin

      novoestoque := strtofloat(texto);

      try

          _Sql := ('Update produtos Set estoque_atual  = :pEstoque Where id_produto = :pID');

          with DM_Pesq.cdsPesqProduto do
          begin

               close;
               CommandText := _Sql;
               Params.ParamByName('pEstoque').Asfloat := novoestoque;
               Params.ParamByName('pID').AsInteger    := idProduto;
               execute;
               //Para não dar erro de cursor not returned abra novamente a consulta de todos os produtos
               CommandText := sqlDefalt;
               Params.ParamByName('pDesc').Asstring   :=  'PRODUTO NAO CADASTRADO';
               Params.ParamByName('pStatus').Asstring :=  'A';
               open;

          end;

          Abrir_Fechar_Tabelas;
          FormatarValoresComoMoeda;
          grDados.Enabled := false;
          Application.MessageBox('Novo valor de estoque aplicado com sucesso!', 'Mudando o valor do estoque!', MB_ICONINFORMATION);

      except
           ShowMessage('Valor inválido!');
           Exit;
      end;
  end;

end;

procedure T_frmProdutos.AlterarEstoqueMinimo;
var
  texto : String;
  idProduto : integer;
begin

    idProduto := StrToInt(dbedtID_PRODUTO.text);

    if InputQuery('Novo valor de estoque mínimo','Entre com o novo valor, use a vírgula(,) como separador decimal!',texto)then
    begin

      ValorDeEstoqueMinimo := strtofloat(texto);

      try

          _Sql := ('Update produtos Set estoqueminimo  = :pEstoque Where id_produto = :pID');

          with DM_Pesq.cdsPesqProduto do
          begin

               close;
               CommandText := _Sql;
               Params.ParamByName('pEstoque').Asfloat := ValorDeEstoqueMinimo;
               Params.ParamByName('pID').AsInteger    := idProduto;
               execute;
               //Para não dar erro de cursor not returned abra novamente a consulta de todos os produtos
               CommandText := sqlDefalt;
               Params.ParamByName('pDesc').Asstring   :=  'PRODUTO NAO CADASTRADO';
               Params.ParamByName('pStatus').Asstring :=  'A';
               open;

          end;

          Abrir_Fechar_Tabelas;
          FormatarValoresComoMoeda;
          grDados.Enabled := false;
          Application.MessageBox('Novo valor de estoque mínimo aplicado com sucesso!', 'Mudando o valor do estoque mínimo!', MB_ICONINFORMATION);

      except
           ShowMessage('Valor inválido!');
           Exit;
      end;
  end;

end;

procedure T_frmProdutos.AlterarDescricaoProduto;
var
  texto, novaDescricao : String;
  idProduto : integer;

begin

    idProduto := StrToInt(dbedtID_PRODUTO.text);

    if InputQuery('Nova Descrição do Produto','Entre com a nova Descrição!',texto)then
    begin

      novaDescricao := UpperCase(texto);

      try

          _Sql := ('Update produtos Set descricao  = :pDesc Where id_produto = :pID');

          with DM_Pesq.cdsPesqProduto do
          begin

               close;
               CommandText := _Sql;
               Params.ParamByName('pDesc').AsString   := novaDescricao;
               Params.ParamByName('pID').AsInteger    := idProduto;
               execute;
               //Para não dar erro de cursor not returned abra novamente a consulta de todos os produtos
               CommandText := sqlDefalt;
               Params.ParamByName('pDesc').Asstring   :=  'PRODUTO NAO CADASTRADO';
               Params.ParamByName('pStatus').Asstring :=  'A';
               open;

          end;

          Abrir_Fechar_Tabelas;
          FormatarValoresComoMoeda;
          grDados.Enabled := false;
          Application.MessageBox('Nova Descrição aplicada com sucesso!', 'Mudando a Descrição do Produto!', MB_ICONINFORMATION);

      except
           ShowMessage('Valor inválido!');
           Exit;
      end;
  end;

end;

procedure T_frmProdutos.AlterarCodigoAlt;
var
  texto, novoCodAlt : String;
  idProduto : integer;

begin

    idProduto := StrToInt(dbedtID_PRODUTO.text);

    if InputQuery('Novo Código Alt do Produto','Entre com o novo código!',texto)then
    begin

      novoCodAlt := UpperCase(texto);

      try

          _Sql := ('Update produtos Set COD_ALT'+idAlt+' = :pAlt Where id_produto = :pID');

          with DM_Pesq.cdsPesqProduto do
          begin

               close;
               CommandText := _Sql;
               Params.ParamByName('pAlt').AsString    := novoCodAlt;
               Params.ParamByName('pID').AsInteger    := idProduto;
               execute;
               //Para não dar erro de cursor not returned abra novamente a consulta de todos os produtos
               CommandText := sqlDefalt;
               Params.ParamByName('pDesc').Asstring   :=  'PRODUTO NAO CADASTRADO';
               Params.ParamByName('pStatus').Asstring :=  'A';
               open;

          end;

          Abrir_Fechar_Tabelas;
          idAlt := '0';
          FormatarValoresComoMoeda;
          grDados.Enabled := false;
          Application.MessageBox('Novo Código Alt aplicado com sucesso!', 'Mudando o Código Alt do Produto!', MB_ICONINFORMATION);

      except
           ShowMessage('Valor inválido!');
           Exit;
      end;
  end;

end;

procedure T_frmProdutos.DBEDT_CODALT1Click(Sender: TObject);
begin
 idAlt := '1';
 AlterarCodigoAlt;
end;

procedure T_frmProdutos.DBEDT_CODALT2Click(Sender: TObject);
begin
 idAlt := '2';
 AlterarCodigoAlt;
end;

procedure T_frmProdutos.DBEDT_CODALT3Click(Sender: TObject);
begin
 idAlt := '3';
 AlterarCodigoAlt;
end;

procedure T_frmProdutos.DBEDT_CODALT4Click(Sender: TObject);
begin
 idAlt := '4';
 AlterarCodigoAlt;
end;

procedure T_frmProdutos.GravarAlteracaoOBS;
begin

    atualizarUmCampoDaTabela('produtos','obs',memoTelaPrin.Text,'id_produto',dbedtID_PRODUTO.Text,'string');

    Application.MessageBox('Alterações gravadas com sucesso!', 'Gravando alterações', MB_ICONINFORMATION);
    LiberarCamposAposAlteracaoOBS;
    btnCadastrarProdutoClick(self);

    //ShowMessage(Screen.ActiveControl.Name);

end;

procedure T_frmProdutos.memoTelaPrinKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if KEY = VK_RETURN then
    begin

         GravarAlteracaoOBS;
       
   end;
end;

procedure T_frmProdutos.btnAlterarFotoProdutoClick(Sender: TObject);
begin

     AlterarFotoDoProduto;

end;


procedure T_frmProdutos.AlterarFotoDoProduto;
begin

   CopiarFotoProdutoParaDiretorio;
   DeletarFotoAlteradaDoDiretorio;
   RenomearFotoAlteradaNoDiretorio;
   Application.MessageBox('Foto do produto alterada com sucesso!', 'Alteração de Foto do Produto', MB_ICONINFORMATION);
   btnSairAlteracaoProdutoClick(Self);

end;

procedure T_frmProdutos.CopiarFotoProdutoParaDiretorio;
begin

     //COPIANDO A FOTO PARA O DIRETORIO DOS PRODUTOS
     caminho := ExtractFilePath(Application.ExeName)+'Produtos\';

     if not DirectoryExists(caminho) then
     begin

         CreateDir(caminho);

     end else

        if abrefoto.Execute then
        begin

          //Aqui pego o caminho inteiro inclusive com o nome do arquivo
          origem := abrefoto.FileName;

          //Aqui pego somente o nome do arquivo com a extenção
          Delete(Origem, 1, Length(ExtractFilePath(abrefoto.FileName)));

          Destino := caminho + '\' + origem;
          CopyFile(PChar(Origem), PChar(Destino), False);

     end;

end;

procedure T_frmProdutos.DeletarFotoAlteradaDoDiretorio;
var
 caminho : string;
begin

     caminho := ExtractFilePath(Application.ExeName)+'Produtos\'+edtCodBarrasProduto.Caption+'.jpg';
     //ShowMessage(caminho);
     DeleteFile(caminho);

end;

procedure T_frmProdutos.RenomearFotoAlteradaNoDiretorio;
var
 NomeFoto, novoNomeFoto : string;
begin

   NomeFoto          := ExtractFilePath(Application.ExeName)+'Produtos\'+origem;
   novoNomeFoto      := ExtractFilePath(Application.ExeName)+'Produtos\'+edtCodBarrasProduto.Caption+'.jpg';

   {ShowMessage('nome da foto copiada : '+NomeFoto);
   ShowMessage('Novo nome da foto copiada : '+novoNomeFoto); }

   RenameFile(nomeFoto, novoNomeFoto);

end;

procedure T_frmProdutos.edt_precocompraExit(Sender: TObject);
begin

   if(edt_precocompra.Text = '0,00')then
   begin

       Application.MessageBox('O campo preço de compra não pode conter o valor zero!',
                    'Valor inválido!', MB_OK + MB_ICONWARNING);
       edt_precocompra.SetFocus;

   end;

end;

procedure T_frmProdutos.edt_QuantidadeDeEntradaExit(Sender: TObject);
begin

   if(edt_QuantidadeDeEntrada.Text = '0')then
   begin

       Application.MessageBox('O campo quantidade não pode conter o valor zero!',
                    'Valor inválido!', MB_OK + MB_ICONWARNING);
       edt_QuantidadeDeEntrada.SetFocus;

   end;

end;

procedure T_frmProdutos.EstadoInicialDosBotoes;
begin

     btnCadastrarProduto.Enabled := true;
     btnInativar.Enabled         := false;
     btnEntrarProduto.Enabled    := false;
     btnBaixarProdutos.Enabled   := false;
     btnAlterarProduto.Enabled   := false;
     btnimprimir.Enabled         := false;
     btnSair.Enabled             := true;

end;

procedure T_frmProdutos.MostrarDadosTelaInicial;
begin

   Abrir_Fechar_Tabelas;

   sqlDefalt  := 'SELECT p.*, f.nome_fabricante, c.categoria, g.forne_nome FROM produtos p, fabricantes f, categorias c, fornecedores g WHERE p.descricao <> :pDesc '+
                 'AND p.fabricante_id = f.id_fabricante AND p.categoria_id = c.id_categoria AND p.fornecedor_id = g.forne_id AND p.status = :pStatus ORDER BY p.descricao';

   with DM_Pesq.cdsPesqProduto do
      begin

          Close;
          CommandText:= (sqlDefalt);
          Params.ParamByName('pDesc').Asstring   :=  'PRODUTO NAO CADASTRADO';
          Params.ParamByName('pStatus').Asstring :=  'A';
          Open;

            if not IsEmpty then
            begin

                dbedtID_PRODUTO.DataSource          :=  DM_Pesq.dsPesqProduto;
                dbedtID_PRODUTO.DataField           := 'ID_PRODUTO';

                dbCodBarrasTelaInicial.DataSource   :=  DM_Pesq.dsPesqProduto;
                dbCodBarrasTelaInicial.DataField    := 'COD_BARRAS';

                dbedFABRICANTE.DataSource           :=  DM_Pesq.dsPesqProduto;
                dbedFABRICANTE.DataField            := 'NOME_FABRICANTE';

                dbedtCATEGORIA.DataSource           :=  DM_Pesq.dsPesqProduto;
                dbedtCATEGORIA.DataField            := 'CATEGORIA';

                dbedtFORNECEDOR.DataSource          :=  DM_Pesq.dsPesqProduto;
                dbedtFORNECEDOR.DataField           := 'FORNE_NOME';

                DBEDT_CODALT1.DataSource            :=  DM_Pesq.dsPesqProduto;
                DBEDT_CODALT1.DataField             := 'COD_ALT1';

                DBEDT_CODALT2.DataSource            :=  DM_Pesq.dsPesqProduto;
                DBEDT_CODALT2.DataField             := 'COD_ALT2';

                DBEDT_CODALT3.DataSource            :=  DM_Pesq.dsPesqProduto;
                DBEDT_CODALT3.DataField             := 'COD_ALT3';

                DBEDT_CODALT4.DataSource            :=  DM_Pesq.dsPesqProduto;
                DBEDT_CODALT4.DataField             := 'COD_ALT4';

                dbedtPROD_DATACAD.DataSource        :=  DM_Pesq.dsPesqProduto;
                dbedtPROD_DATACAD.DataField         := 'DATACAD';

                dbedtPROD_DESCRICAO.DataSource      :=  DM_Pesq.dsPesqProduto;
                dbedtPROD_DESCRICAO.DataField       := 'DESCRICAO';

                DBEDT_VALORCOMPRA.DataSource        :=  DM_Pesq.dsPesqProduto;
                DBEDT_VALORCOMPRA.DataField         := 'PRECOCOMPRA';

                dbedtPROD_PRECOVENDA.DataSource     :=  DM_Pesq.dsPesqProduto;
                dbedtPROD_PRECOVENDA.DataField      := 'PRECOVENDA';

                dbedtPERCENTLUCRO.DataSource        :=  DM_Pesq.dsPesqProduto;
                dbedtPERCENTLUCRO.DataField         := 'PERCENTLUCRO';

                DBEDT_VALORLUCRO.DataSource         :=  DM_Pesq.dsPesqProduto;
                DBEDT_VALORLUCRO.DataField          := 'VALORDELUCRO';

                dbedtQUANTIDADE.DataSource          :=  DM_Pesq.dsPesqProduto;
                dbedtQUANTIDADE.DataField           := 'ESTOQUE_ATUAL';

                dbedtESTOQUEMINIMO.DataSource       :=  DM_Pesq.dsPesqProduto;
                dbedtESTOQUEMINIMO.DataField        := 'ESTOQUEMINIMO';

                memoTelaPrin.DataSource             :=  DM_Pesq.dsPesqProduto;
                memoTelaPrin.DataField              := 'OBS';


                with grid_VisualizaProdutos do
                begin

                  DataSource:=  DM_Pesq.dsPesqProduto;
                  Columns.Clear;

                  Columns.Add;
                  Columns[0].FieldName         := 'DESCRICAO';
                  Columns[0].Width             := 280;
                  Columns[0].Alignment         := taLeftJustify;
                  Columns[0].Title.caption     := 'DESCRIÇÃO';
                  Columns[0].Title.Font.Style  := [fsBold];

                end;

                TotalRegs := DM_Pesq.cdsPesqProduto.RecordCount;
                MostrarFotoProdutoTelaInicial;
                FormatarValoresComoMoeda;
                verificandoEstoqueMinimo := false;

            end;
      end;

end;

procedure T_frmProdutos.FormatarValoresComoMoeda;
begin

     //FORMATANDO O VALOR DO CAMPO COMO CURRENCY SE NAO RECONHECER COLOQUE DB EM USES DEPOIS DE INTERFACE
     TCurrencyField(DM_Pesq.cdsPesqProduto.FieldByName('PRECOCOMPRA'))   .DisplayFormat:= '###,##0.00';
     TCurrencyField(DM_Pesq.cdsPesqProduto.FieldByName('PRECOVENDA'))    .DisplayFormat:= '###,##0.00';
     TCurrencyField(DM_Pesq.cdsPesqProduto.FieldByName('PERCENTLUCRO'))  .DisplayFormat:= '##0.00';
     TCurrencyField(DM_Pesq.cdsPesqProduto.FieldByName('VALORDELUCRO'))  .DisplayFormat:= '###,##0.00';
     TCurrencyField(DM_Pesq.cdsPesqProduto.FieldByName('ESTOQUE_ATUAL')) .DisplayFormat:= '###,##0.00';
     TCurrencyField(DM_Pesq.cdsPesqProduto.FieldByName('ESTOQUEMINIMO')) .DisplayFormat:= '#,##0.00';

end;

procedure T_frmProdutos.edt_DescricaoCadProdutoExit(Sender: TObject);
begin

   if(TemDuplicidadeNoCampo('descricao','produtos',edt_DescricaoCadProduto.Text))then
   begin

       Application.MessageBox('Este produto esta cadastrado ou inativado verifique!', 'Atenção nome do produto inválido!', MB_ICONWARNING);
       edt_DescricaoCadProduto.Clear;
       edt_DescricaoCadProduto.SetFocus;

   end;

end;

procedure T_frmProdutos.AlterarPrecoDeCompraPelaTelaAlteracao;
begin

      //CALCULANDO VALOR DE LUCRO DE ACORDO COM O PERCENTUAL APONTADO
      valorPercentual    := StrToFloat(edtPercentLucro.text);
      novoprecocompra    := StrToFloat(edtPrecoCompra.text);
      valorLucro         := ( novoprecocompra * valorPercentual )/100;

      //CALCULANDO NOVA PREÇO DE VENDA
      precoVendas        := (novoprecocompra + valorLucro);

      //ALTERANDO VALORES AUTOMATICAMENTE DOS EDITS
      edtPrecoVenda.Text := FloatToStr(precoVendas);
      edtLucro.Text      := FloatToStrF(valorLucro,ffNumber,4,2);

end;

procedure T_frmProdutos.AlterarPercentualDeLucroPelaTelaAlteracao;
begin


      precoCompra        := StrToFloat(edtPrecoCompra.Text);
      valorPercentual    := StrToFloat(edtPercentLucro.text);
      valorLucro         := ( precoCompra * valorPercentual )/100;
      PrecoVenda         := ( precoCompra + valorLucro );

       //ALTERANDO VALORES AUTOMATICAMENTE DOS EDITS
      edtPrecoVenda.Text := FloatToStr(PrecoVenda);
      edtLucro.Text      := FloatToStrF(valorLucro,ffNumber,4,2);

end;

procedure T_frmProdutos.edtPercentLucroExit(Sender: TObject);
begin
    AlterarPercentualDeLucroPelaTelaAlteracao;
    btnGravarEntrada.Enabled := true;
end;

procedure T_frmProdutos.edtPercentLucroClick(Sender: TObject);
begin

   edtPercentLucro.SelStart:=0;
   edtPercentLucro.SelLength:= Length(edtPercentLucro.Text);

end;

procedure T_frmProdutos.btnCadFornecedorClick(Sender: TObject);
begin
    Application.CreateForm(T_frmFornecedores,  _frmFornecedores);
    _frmFornecedores.ShowModal;
    FreeAndNil(_frmFornecedores);
end;

procedure T_frmProdutos.edt_QuantidadeDaBaixaClick(Sender: TObject);
begin
     edt_QuantidadeDaBaixa.SelStart:=0;
     edt_QuantidadeDaBaixa.SelLength:= Length(edt_QuantidadeDaBaixa.Text);
end;

procedure T_frmProdutos.edtConsProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin

      btnAlterarProduto.Enabled   :=false;
      btnInativar.Enabled         :=false;
      btnimprimir.Enabled         := false;
      btnCadastrarProduto.Caption :='Voltar';
      btnCadastrarProduto.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Ok.bmp');
      
end;      

procedure T_frmProdutos.edt_DataInicio_RelEntradaClick(Sender: TObject);
begin
    edt_DataInicio_RelEntrada.SelectAll;
end;

procedure T_frmProdutos.edt_DataFim_RelEntradaClick(Sender: TObject);
begin
   edt_DataFim_RelEntrada.SelectAll;
end;

procedure T_frmProdutos.imgInformacaoClick(Sender: TObject);
begin
    InformacaoSobreAlteracaoDeCampos;
end;

procedure T_frmProdutos.InformacaoSobreAlteracaoDeCampos;
begin

  Application.MessageBox('HELP : Alguns campos aceitam alteração  diretamente na tela  principal, selecione  o  registro/produto  que  deseja  alterar  clique   no  campo  a  ser alterado, se  o cursor for  mostrado  em  formato de mão o campo é editável.',
                         'Como alterar campos diretamente na tela principal dos produtos!', MB_ICONEXCLAMATION);

end;

procedure T_frmProdutos.pangrid_visualizacaoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not(TabelaEstaVazia('produtos'))then FormatarValoresComoMoeda;
end;

procedure T_frmProdutos.pan_botoesMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not(TabelaEstaVazia('produtos'))then FormatarValoresComoMoeda;
end;

procedure T_frmProdutos.txtQdeItensMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not(TabelaEstaVazia('produtos'))then FormatarValoresComoMoeda;
end;

procedure T_frmProdutos.pan_tituloMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not(TabelaEstaVazia('produtos'))then FormatarValoresComoMoeda;
end;

procedure T_frmProdutos.ListarCategorias;
begin
       //dados necessários para acessar lista padrão com apenas um campo
       nomeTabela    := 'CATEGORIAS';
       campoNome     := 'CATEGORIA';
       cdsTable      := dm_DadosSegundo.cds_Categorias;
       dsTable       := dm_DadosSegundo.ds_Categorias;

       Application.CreateForm(T_frmListaPadraoComUmCampo,  _frmListaPadraoComUmCampo);
       _frmListaPadraoComUmCampo.ShowModal;
       FreeAndNil(_frmListaPadraoComUmCampo);

       atualizarUmCampoDaTabela('produtos','categoria_id',inttostr(IdGeral),'id_produto',dbedtID_PRODUTO.Text,'integer');
       Abrir_Fechar_Tabelas;
       FormatarValoresComoMoeda;
       grDados.Enabled := false;
       MostrarFotoProdutoTelaInicial;
       Application.MessageBox('Categoria alterada com sucesso!', 'Alterando categoria!', MB_ICONINFORMATION);

end;

procedure T_frmProdutos.dbedtCATEGORIAClick(Sender: TObject);
begin
  ListarCategorias;
end;

procedure T_frmProdutos.ListarFabricantes;
begin

   //dados necessários para acessar lista padrão com apenas um campo
   nomeTabela    := 'FABRICANTES';
   campoNome     := 'NOME_FABRICANTE';
   cdsTable      := dm_Conexao.cds_Fabricante;
   dsTable       := dm_Conexao.ds_Fabricante;

   Application.CreateForm(T_frmListaPadraoComUmCampo,  _frmListaPadraoComUmCampo);
   _frmListaPadraoComUmCampo.ShowModal;
   FreeAndNil(_frmListaPadraoComUmCampo);

   atualizarUmCampoDaTabela('produtos','fabricante_id',inttostr(IdGeral),'id_produto',dbedtID_PRODUTO.Text,'integer');
   Abrir_Fechar_Tabelas;
   FormatarValoresComoMoeda;
   grDados.Enabled := false;
   MostrarFotoProdutoTelaInicial;
   Application.MessageBox('Fabricante alterado com sucesso!', 'Alterando fabricante!', MB_ICONINFORMATION);

end;

procedure T_frmProdutos.ListarFornecedores;
begin

   //dados necessários para acessar lista padrão com apenas um campo
   nomeTabela    := 'FORNECEDORES';
   campoNome     := 'FORNE_NOME';
   cdsTable      := dm_Conexao.cds_Fornecedor;
   dsTable       := dm_Conexao.ds_Fornecedor;

   Application.CreateForm(T_frmListaPadraoComUmCampo,  _frmListaPadraoComUmCampo);
   _frmListaPadraoComUmCampo.ShowModal;
   FreeAndNil(_frmListaPadraoComUmCampo);

   atualizarUmCampoDaTabela('produtos','fornecedor_id',inttostr(IdGeral),'id_produto',dbedtID_PRODUTO.Text,'integer');
   Abrir_Fechar_Tabelas;
   FormatarValoresComoMoeda;
   grDados.Enabled := false;
   MostrarFotoProdutoTelaInicial;
   Application.MessageBox('Fornecedor alterado com sucesso!', 'Alterando fornecedor!', MB_ICONINFORMATION);

end;

procedure T_frmProdutos.dbedtFORNECEDORClick(Sender: TObject);
begin
  ListarFornecedores;
end;

procedure T_frmProdutos.dbedFABRICANTEClick(Sender: TObject);
begin
    ListarFabricantes;
end;



procedure T_frmProdutos.edt_CodigoProdutoClick(Sender: TObject);
begin

     edt_CodigoProduto.SelStart:=0;
     edt_CodigoProduto.SelLength:= Length(edt_CodigoProduto.Text);

end;

procedure T_frmProdutos.rdPORVALORClick(Sender: TObject);
begin
  edt_percentual.SetFocus;
end;

procedure T_frmProdutos.edt_percentualKeyPress(Sender: TObject;
  var Key: Char);
begin
   if(key = #13)then
       edt_QuantidadeDeEntrada.SetFocus;
end;

procedure T_frmProdutos.cmbTipoLucroClick(Sender: TObject);
begin
edt_CodAlt1.SetFocus; 
end;

procedure T_frmProdutos.cmbTipoLucroEnter(Sender: TObject);
begin
txtStatusCadastro.Caption     := ItensStatusCadastro[18];
end;

end.




