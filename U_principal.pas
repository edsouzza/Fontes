unit U_principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls, Buttons, jpeg, StdCtrls, AppEvnts,SqlExpr,
  Mask, DBCtrls, RxGIF, ImgList, ToolWin, DB, IBCustomDataSet, IBQuery, Printers,
  IBDatabase, RpCon, RpConDS, RpRave, RpDefine, RpBase, RpSystem, ExtDlgs, WinInet;



type
  T_frmPrincipal = class(TForm)
    lista_imagens: TImageList;
    menuPrincipal: TMainMenu;
    logo: TImage;
    config_impressora: TPrinterSetupDialog;
    mnuCadastros: TMenuItem;
    mnuCadClientes: TMenuItem;
    mnuCadFuncionarios: TMenuItem;
    mnuReativacao: TMenuItem;
    mnuConfiguracoes: TMenuItem;
    mnuNossaEmpresa: TMenuItem;
    BarraStatus: TStatusBar;
    Panel2: TPanel;
    btnFornecedores: TSpeedButton;
    btnProdutos: TSpeedButton;
    btnCadastraFunc: TSpeedButton;
    btnCadastraCliente: TSpeedButton;
    btnOrcamentos: TSpeedButton;
    btnSobre: TSpeedButton;
    btnMovimentarCaixa: TSpeedButton;
    btnCalculadora: TSpeedButton;
    btnAgenda: TSpeedButton;
    btnSairDoSistema: TSpeedButton;
    btnFinanceiro: TSpeedButton;
    btnPagamentos: TSpeedButton;
    btnCaixa: TSpeedButton;
    btnContatos: TSpeedButton;
    mnuAtivacao: TMenuItem;
    btnCreditosReceber: TSpeedButton;
    btnOS: TSpeedButton;
    btnCredores: TSpeedButton;
    mnuCredores: TMenuItem;
    mnuDataExpiracao: TMenuItem;
    btnAgendamentos: TSpeedButton;
    mnuMovimentarCaixa: TMenuItem;
    abrefoto: TOpenPictureDialog;
    mnuLogOperacoes: TMenuItem;
    mnuNiveisdeAcesso: TMenuItem;
    mnuLogoff: TMenuItem;
    lblStatusLogoff: TLabel;
    mnuConsultas: TMenuItem;
    mnuSuporte: TMenuItem;
    mnuContatos: TMenuItem;
    mnuConfigImagens: TMenuItem;
    mnuPermissoes: TMenuItem;
    mnuProdutos: TMenuItem;
    btnCategorias: TSpeedButton;
    btnFabricantes: TSpeedButton;
    btnVendas: TSpeedButton;
    menProdsFabricantes: TMenuItem;
    menProdsCategorias: TMenuItem;
    mnuFormasdePagamento: TMenuItem;
    mnuFrenteCaixa: TMenuItem;
    btnImprimirCupom: TSpeedButton;
    pan_logo: TPanel;
    mnuSegmentos: TMenuItem;
    mnuOrcamentos: TMenuItem;
    mnuFinanceiros: TMenuItem;
    Agenda1: TMenuItem;
    menProdsFornecedores: TMenuItem;
    mnuContasGeral: TMenuItem;
    mnuImpressoras: TMenuItem;
    menuJatoTinta: TMenuItem;
    menuMatricial: TMenuItem;
    mnuAnotacoes: TMenuItem;

    //FUNCOES
    Function temInativadoEmAlgumaTabela:boolean;


    //PROCEDIMENTOS PERSONALIZADOS
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure AbriFecharTabelas;
    procedure VerificaStatusDoCaixaParaAberturaDeVendas;
    procedure VerificaStatusDoCaixaParaAbertura;
    procedure GravaPrimeiraAberturaDoCaixa;
    procedure FecharValorCaixaDiaAnterior;
    procedure FechandoSessaoAcessos;
    procedure FechandoSessaoExecutandoBackupSaindoDoSistema;
    procedure AbrirCaixaDoDia;
    procedure ControlarResolucao;
    procedure ReiniciarComMensagemTemporizada;
    procedure GerarBackupNaPasta;
    procedure verificarStatusModuloFrenteDeCaixa;
    procedure setarImpressoraPadrao;
    procedure getControlaMenuImpressoraPadrao;


    //PROCEDIMENTOS PADRAO
    procedure FormCreate(Sender: TObject);
    procedure btnSobreClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenSobreEdinfoClick(Sender: TObject);
    procedure btnCalculadoraClick(Sender: TObject);
    procedure MenReativarFuncionariosClick(Sender: TObject);
    procedure MenReativarClientesClick(Sender: TObject);
    procedure mnuCadClientesClick(Sender: TObject);
    procedure mnuNossaEmpresaClick(Sender: TObject);
    procedure Funces1Click(Sender: TObject);
    procedure btnCadastraClienteClick(Sender: TObject);
    procedure btnCadastraFuncClick(Sender: TObject);
    procedure btnOrcamentosClick(Sender: TObject);
    procedure btnMovimentarCaixaClick(Sender: TObject);
    procedure btnSairDoSistemaClick(Sender: TObject);
    procedure btnPagamentosClick(Sender: TObject);
    procedure mnuCredoresClick(Sender: TObject);
    procedure Boletos1Click(Sender: TObject);
    procedure btnFinanceiroClick(Sender: TObject);
    procedure MenCaixaClick(Sender: TObject);
    procedure btnCaixaClick(Sender: TObject);
    procedure mnuAtivacaoClick(Sender: TObject);
    procedure mnuAberturaOrcamentoClick(Sender: TObject);
    procedure mnuAtualizaFechaOrcamentoClick(Sender: TObject);
    procedure mnuOrcamentoConsultaPorCliente1Click(Sender: TObject);
    procedure mnuCadFuncionariosClick(Sender: TObject);
    procedure mnuDataExpiracaoClick(Sender: TObject);
    procedure RelatriosDiversos1Click(Sender: TObject);
    procedure mnuImagemTelaPrinClick(Sender: TObject);
    procedure Cupomdevenda1Click(Sender: TObject);
    procedure mnuFinanceirosClick(Sender: TObject);
    procedure mnuLogOperacoesClick(Sender: TObject);
    procedure mnuNiveisdeAcessoClick(Sender: TObject);
    procedure mnuLogoffClick(Sender: TObject);
    procedure mnuPagarOrcamentosClick(Sender: TObject);
    procedure btnCreditosReceberClick(Sender: TObject);
    procedure btnContatosClick(Sender: TObject);
    procedure mnuContatosClick(Sender: TObject);
    procedure btnCredoresClick(Sender: TObject);
    procedure ReativarContatosClick(Sender: TObject);
    procedure ImpressodeRecibo1Click(Sender: TObject);
    procedure btnAgendaClick(Sender: TObject);
    procedure mnuConfigImagensClick(Sender: TObject);
    procedure mnuPermissoesClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure mnuReativarProdutosClick(Sender: TObject);
    procedure mnuCategoriasClick(Sender: TObject);
    procedure mnuFornecedoresClick(Sender: TObject);
    procedure btnFornecedoresClick(Sender: TObject);
    procedure MenReativarFornecedoresClick(Sender: TObject);
    procedure menProdsFabricantesClick(Sender: TObject);
    procedure menProdsCategoriasClick(Sender: TObject);
    procedure btnVendasClick(Sender: TObject);
    procedure mnuFormasdePagamentoClick(Sender: TObject);
    procedure Caixa2Click(Sender: TObject);
    procedure BoletosaPagar2Click(Sender: TObject);
    procedure CreditosaReceber1Click(Sender: TObject);
    procedure GrficoFinanceiro1Click(Sender: TObject);
    procedure RelatriosFinanceiros1Click(Sender: TObject);
    procedure mnuMovimentarCaixaClick(Sender: TObject);
    procedure mnuFrenteCaixaClick(Sender: TObject);
    procedure btnImprimirCupomClick(Sender: TObject);
    procedure btnFabricantesClick(Sender: TObject);
    procedure mnuFabricantesClick(Sender: TObject);
    procedure mnuSegmentosClick(Sender: TObject);
    procedure mnuOrcamentosClick(Sender: TObject);
    procedure mnuReativacaoClick(Sender: TObject);
    procedure mnuProdutosClick(Sender: TObject);
    procedure VideosTutoriais1Click(Sender: TObject);
    procedure Agenda1Click(Sender: TObject);
    procedure mnuSuporteClick(Sender: TObject);
    procedure mnuBackupClick(Sender: TObject);
    procedure menProdsFornecedoresClick(Sender: TObject);
    procedure mnuContasPagarClick(Sender: TObject);
    procedure mnuContasReceberClick(Sender: TObject);
    procedure mnuContasGeralClick(Sender: TObject);
    procedure mnuConfiguracoesClick(Sender: TObject);
    procedure menuJatoTintaClick(Sender: TObject);
    procedure menuMatricialClick(Sender: TObject);
    procedure mnuImpressorasClick(Sender: TObject);
    procedure mnuAnotacoesClick(Sender: TObject);

  private
    { Private declarations }
    ValorTotalCaixaDoDiaAnterior  : double;
    DataAtual                     : TDate;
    DataDoDia, DataExpiracao      : TDateTime;
    procedure eventoDadosBarraStatus(Sender:TObject);
    procedure eventoTimerReiniciar(Sender:TObject);


  public
    { Public declarations }


  end;

var
  _frmPrincipal: T_frmPrincipal;


implementation

uses USobre, U_Funcionarios, U_Produtos, U_dmDados, U_dmDadosSegundo, U_dmPesquisas,
  U_BiblioSysSalao, U_Login, U_Atendimentos, U_EscolhaDoProdutoParaReativacao,
  U_EscolhaDoFuncionarioParaReativacao, U_Etiquetas, U_Caixa, U_ConsultaVendas,
  U_EscolhaFormaDePagamento, U_EscolhaFormaDePagamentoParaRelatorios,
  U_LoginDeAcessos, U_AbreCaixa, U_FechaCaixa,
  U_EscolhaTipoDeRelatorioParaCaixa, U_Config, U_MovimentaCaixa,
  U_TrocaDeProduto, U_PesquisarProduto,
  U_BackupBancoDados, U_Graficos, U_Clientes,
  U_EscolhaDoClienteParaReativacao, U_Cotacao,
  U_ConsultaCotacoesRealizadas, U_ConsCotacoesPeriodo, U_FecharCotacao,
  U_Fornecedores,
  U_EscolhaDoFornecedorParaReativacao,
  U_ConsCotacoesPeriodoGeral, U_OrdemDeServico,
  U_CadEmpresa, U_Servicos, U_EscolhaServicoParaReativacao,
  U_AlteraFotoDoProduto, U_CadCategoriasProdutos, U_CadFabricantesProdutos,
  U_ConsVendasPorClientes,
  U_EscolhaDoMesDosAniversariantes, U_CadFuncoes,
  U_Metas, U_CadCredores, U_ContasPagar, U_EscolhaDoCredorParaPagamento,
  U_EscolhaDoFinanceiro, U_AlteraFornecedorDoProduto, U_Desbloqueio,
  U_DesbloqueioPermanente, U_EscolhaClienteParaOrcamento, U_orcamento,
  U_ConsOrcamentosPeriodo, U_ConsOrcamentosPorCliente, U_CadPedido,
  U_ConsTodosPedidos, U_ConsPedidosPorPeriodo, U_EscolhaParaPedidos,
  U_EscolhaParaOrcamentos, U_EscolhaParaPagamentos, U_EscolhaParaProdutos,
  U_ControlaExclusoes, U_EscolhaParaFuncionarios, U_EscolhaParaCotacoes,
  U_CadPrazos, U_ControlaDataExpiracao, U_ConsContatosFornecedores,
  U_ConsProdutosFornecedores, U_EscolhaDoContatoParaReativacao,
  U_EscolhaParaFornecedores, U_CadSimilares, U_ConsSimilares,
  U_CadAplicacoes, U_GerenciarSimilares, U_GerenciarDuplicatas,
  U_ListaAgendamentosAbertos, U_EscolhaTipoDeAgendamento,
  U_EscolhaParaImpressaoDeAgendamentos,
  U_GerenciarCreditosPagamentosComCartao, U_ConsVendasComOrcamentos,
  U_CupomVenda, U_LogOperacoes, DBClient, U_EmpresasClientes,
  U_ConsultaPrazos, U_ConsOrcamentosParaPagamento, U_ESCOLHAPARAVIDEO,
  U_Contatos, U_Segmentos, U_CadastraCredor, U_CadNovosCredores,
  U_CadastroPadraoUmCampo, U_ListaPadraoComUmCampoReativar, U_CadContatos,
  U_CadFuncionarios, U_Agenda, U_Configuracoes, U_PERMISSOES,
  U_dmPesqDados, U_EntraCPFCNPJVendaBalcao,
  U_ListarVendasParaImpressaoDeCupons, U_SPLASH, U_LiberaModuloFrenteCaixa,
  U_EscolhaAcaoParaFinaceiro, U_EscolhaParaReativacao,
  U_EscolhaAcaoParaProdutos, U_BloquearModuloFrenteCaixa,
  U_ConsFornecedoresProdutos, U_EscolhaImpressoraPadrao, U_Anotacoes;

{$R *.dfm}

procedure T_frmPrincipal.ControlarResolucao;
var
  XW, xH :double;
begin

     //controla a resolu��o do video
     XW := (((Screen.Width)  / 100) * 100);
     XH := (((Screen.Height) / 100) * 100);

     Self.Width := Round(XW);
     Self.Height := Round(xH);

    _frmPrincipal.Position := poScreenCenter;

end;

procedure T_frmPrincipal.FormCreate(Sender: TObject);
//DESABILITA O BOTAO FECHAR DO FORMUL�RIO
var
  hwndHandle : THANDLE;
  hMenuHandle : HMenu;
begin

   //controla a resolu��o do video
   //ControlarResolucao;

   //Impede movimenta��o do formul�rio
   DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

   hwndHandle := Self.Handle;
   if (hwndHandle <> 0) then
    begin
      hMenuHandle := GetSystemMenu(hwndHandle, FALSE);
        if (hMenuHandle <> 0) then
          DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);

   end;

   AbrirTabelas;

   CriarTimerBarraStatus;  //TimerBarraStatus ser� criado nesse procedimento
   TimerBarraStatus.OnTimer:= eventoDadosBarraStatus;

   CriarTimerReiniciar;    //TimerReiniciar ser� criado nesse procedimento
   TimerReiniciar.OnTimer:= eventoTimerReiniciar;

   setarImpressoraPadrao;


end;

procedure T_frmPrincipal.FormShow(Sender: TObject);
begin

    //carregando a logo da empresa dados vindo da tabela EMPRESA
    logo.Picture.LoadFromFile(getLogoEmpresa); 

    DataAtual          := now;
    DataExpiracao      := StrToDate(RetornarDataExpiracao);
    sNomeBanco         := RetornarCaminhoBanco;
    delete(sNomeBanco,1,45);  //encurtando a string e mostrando somente o necess�rio que � o nome do banco apenas

    if not(SistemaLiberado)then
    begin

        if(QdeDiasParaExpirar <= 5 )then
        begin
            self.Caption := 'ESTA LICEN�A TEM '+FloatToStr(QdeDiasParaExpirar)+' DIA(S) DE VALIDADE PARA '+NomeEmpresaLogada;
        end else if( QdeDiasParaExpirar ) > 5 then
        begin
            //self.Caption := 'ESTA LICEN�A TEM '+FloatToStr(QdeDiasParaExpirar)+' DIA(S) DE VALIDADE PARA '+NomeEmpresaLogada;
            self.Caption := 'ESTA LICEN�A ESTA LIBERADA PARA '+NomeEmpresaLogada+' AT� O DIA '+RetornarFimDegustacao;
        end;
        
    end else
    begin
    
        //FACA UMA VERIFICACAO E INFORME SE FOR LICEN�A PERMANENTE NO TOPO DO FORMULARIO PRINCIPAL
        self.Caption := 'SISTEMA LICENCIADO PARA '+NomeEmpresaLogada;

    end;

    //VERIFICANDO E MOSTRANDO NA TELA O STATUS DO MODULO FRENTE DE CAIXA
    //verificarStatusModuloFrenteDeCaixa;

    //VERIFICANDO AS PERMISS�ES DE MENUS E BOT�ES
    //ShowMessage('nivel funcao :'+ IntToStr(NivelFuncao));
    verificarPermissoes(NivelFuncao);

    //VERIFICAR STATUS DE FRENTE DE CAIXA SE LIBERADO OU N�O
   { if(frenteDeCaixaLiberado)then
        AtivarModuloFrenteDeCaixa(NivelFuncao);  }

    //VERIFICANDO OS STATUS DO CAIXA
    VerificaStatusDoCaixaParaAbertura;
    VerificaStatusDoCaixaParaAberturaDeVendas;

    DataDoDia := date;

    if ( IdDoUsuarioLogado = 1 ) then
    begin
        mnuAtivacao.Visible        := true;
        mnuDataExpiracao.Visible   := true;
    end else
    begin
        mnuAtivacao.Visible        := false;
        mnuDataExpiracao.Visible   := false;
    end;

    if not( TemEmpresaCadastrada ) then
       mnuNossaEmpresaClick(self);

end;

procedure T_frmPrincipal.eventoDadosBarraStatus(Sender: TObject);
var anoVigente : string;
begin

     anoVigente := retornaAnoPassandoData(now);
     barrastatus.Panels[0].Text:= ''+getImpressoraSetada;
     BarraStatus.Panels[1].Text:= sNomeBanco;
     barrastatus.Panels[2].Text:= ''+NomeDoUsuarioLogado;
     barrastatus.Panels[3].Text:= sFuncao;
     barrastatus.Panels[4].Text:= ''+NomeEmpresaLogada;
     barrastatus.Panels[5].Text:= ''+'99475-6517';
     barrastatus.Panels[6].Text:= ''+DateToStr(date);
     barrastatus.Panels[7].Text:= ''+TimeToStr(time);

end;


procedure T_frmPrincipal.eventoTimerReiniciar(Sender: TObject);
begin

     keybd_event(VK_RETURN,0,0,0);
     TimerReiniciar.Enabled := False;

end;

procedure T_frmPrincipal.ReiniciarComMensagemTemporizada;
begin

   texto := 'O  sistema   ser�  reiniciado  automaticamente, acesse   com   o  usu�rio  desejado  autenticando  sua  senha  de  acesso!';
   ReiniciarComMensagemETemporizador(TimerReiniciar,texto,'Reiniciando...',5000);

end;

procedure T_frmPrincipal.btnSobreClick(Sender: TObject);
begin
      //Criando e abrindo o formul�rio ao clicar no bot�o
      logo.Visible := false;
      Application.CreateForm(T_frmsobre,  _frmsobre);
      _frmsobre.ShowModal;
      FreeAndNil(_frmsobre);

end;


procedure T_frmPrincipal.AbrirTabelas;
begin

     dm_Conexao.cds_acessos.Active              := true;
     dm_Conexao.cds_Caixa.Active                := true;
     dm_Conexao.cds_Permissoes.Active           := true;
     dm_DadosSegundo.cds_tipoimpressora.Active  := true;

end;

procedure T_frmPrincipal.FecharTabelas;
begin

    dm_Conexao.cds_acessos.Active              := False;
    dm_Conexao.cds_Permissoes.Active           := False;
    dm_DadosSegundo.cds_tipoimpressora.Active  := False;

end;

procedure T_frmPrincipal.AbriFecharTabelas;
begin

    dm_Conexao.cds_DadosFuncionarios.Active      := False;
    dm_Conexao.cds_DadosFuncionarios.Active      := True;

    DM_Pesq.cdsPesqFuncionarios.Active           := False;
    DM_Pesq.cdsPesqFuncionarios.Active           := True;

    dm_DadosSegundo.cds_tipoimpressora.Active    := False;
    dm_DadosSegundo.cds_tipoimpressora.Active    := true;

end;

procedure T_frmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    FecharTabelas;
    FreeAndNil(TimerBarraStatus);
    FreeAndNil(TimerReiniciar);

end;

procedure T_frmPrincipal.MenSobreEdinfoClick(Sender: TObject);
begin

  btnSobreClick(sender);

end;

procedure T_frmPrincipal.GerarBackupNaPasta;
var
  Origem, Destino, Arquivo : string;
begin

    //gera um backup automatico do banco de dados na pasta padr�o ou escolhida pelo cliente
    Arquivo := RetornarCaminhoPastaBackup+'SYSPDV.FDB';

    //setando o arquivo sem atributo para posterior exclus�o se necess�rio ou seja n�o oculto, n�o somente leitura...
    SetFileAttributes(PChar(Arquivo),0);

    //se pasta de backup n�o existir criar automaticamente
    if not DirectoryExists(RetornarCaminhoPastaBackup) then
    begin
          MkDir(PChar(RetornarCaminhoPastaBackup));
    end;  

    //ShowMessage('Pasta a serem deletados os arquivos : '+RetornarCaminhoPastaBackup);
    DeletarArquivosDaPasta(RetornarCaminhoPastaBackup); //limpando a pasta para gravar o arquivo atual

    Origem  := RetornarCaminhoBanco;
    //ShowMessage('Origem : '+Origem);

    Destino := Arquivo;
    //ShowMessage('Destino : '+Destino);

    //copiando o arquivo para pasta destino
    if CopyFile(PChar(Origem), PChar(Destino), False) then
    begin
       //ShowMessage('Backup executado com sucesso, verifique na pasta se foi adicionado o arquivo SYSPDV.FDB com data corrente!')
       GerarLogBackup('�ltimo backup realizado: '+ DateToStr(date) + ' �s ' + TimeToStr(time) );
    end else
    begin
       ShowMessage('#Aten��o# - Problema ao copiar o arquivo!');
    end;

    //setando o arquivo sem atributos para posterior exclusao pois se tiver como somente leitura ou sistema n�o deixa excluir
    Arquivo := RetornarCaminhoPastaBackup+'SYSPDV.FDB';
    SetFileAttributes(PChar(Arquivo),0);

end;


procedure T_frmPrincipal.FechandoSessaoAcessos;
var
   pastaBackup:string;
begin

     IdDoUsuarioLogado := IdFuncionarioLogado(lblStatusLogoff.Caption);

     //ATUALIZANDO O USUARIO NO LOGIN ATRAVES DO ID
     With DM_Pesq.Qry_Geral do
     begin

       close;
       sql.Clear;
       sql.Add('UPDATE log_acessos SET log_saida = :pGravaSaida WHERE id_usuario = :pIdUser');
       Params.ParamByName('pGravaSaida').AsString  := TimeToStr(time);
       Params.ParamByName('pIdUser').AsInteger     := IdDoUsuarioLogado;
       ExecSQL();

    end;

    {CRIANDO/ATUALIZANDO UMA COPIA DO BANCO DE DADOS COM O NOME DE SYSDESENV => IMPORTANTE SE O ARQUIVO SYSDESENV ESTIVER ABERTO N�O PODER� SER EFEITVADA A C�PIA
     SEGUE UM FORMA DE TESTAR SE A C�PIA ESTA SENDO FEITA COM SUCESSO}
    if CopyFile('C:\Meus Documentos\Bancos_De_Projetos\SysPdv\SYSPDV.FDB', 'C:\Meus Documentos\Bancos_De_Projetos\SysPdv\SYSDESENV.FDB', False) then
    begin
     //ShowMessage('Arquivo copiado com sucesso')
    end else
    begin
     //ShowMessage('#Aten��o# - Problema ao copiar o arquivo!');
    end;

    //gerando backup do banco de dados na pasta padrao c:\backup_syspdv\ se o usu�rio n�o definiu uma pasta na hora da config inicial da empresa
    //pastaBackup := 'c:\bkpdados\';

    if(pastaBackup <> 'c:\bkpdados\')then
    begin
        pastaBackup := RetornarCaminhoPastaBackup;
    end;

    //criando a pasta padr�o do backup caso o diret�rio n�o exista
    if not DirectoryExists(pastaBackup) then
    begin
        MkDir(PChar(pastaBackup));
         //grava no banco
         atualizarUmCampoDaTabela('expiracao','caminho_backup',pastaBackup,'id_dia','1','string');

         Application.MessageBox('A pasta  de  backup do banco de dados foi definida  como  c:\bkpdados\, se desejar acesse a tela de configura��es da empresa e altere o caminho!',
         'Pasta de backup de dados', MB_OK + MB_ICONWARNING);
    end else
    begin

        //verificar o caminho da pasta
        GerarBackupNaPasta;

    end;

end;

procedure T_frmPrincipal.FechandoSessaoExecutandoBackupSaindoDoSistema;
begin

    FechandoSessaoAcessos;
    Application.Terminate; //coloquei aqui por conta do menu logoff pra n�o fechar a aplica��o quando solicitado o logoff

end;

procedure T_frmPrincipal.btnSairDoSistemaClick(Sender: TObject);
begin

     logo.Visible:=false;
     FechandoSessaoExecutandoBackupSaindoDoSistema;

end;

procedure T_frmPrincipal.btnCalculadoraClick(Sender: TObject);
begin

    WinExec('c:\windows\system32\calc.exe',1);

end;


procedure T_frmPrincipal.VerificaStatusDoCaixaParaAberturaDeVendas;
begin

      DataAtual := date;

       //VERIFICANDO SE O CAIXA ESTA ABERTO

       _Sql := 'select id_caixa, data, status from caixa WHERE id_caixa = (select max(id_caixa) from caixa) '+
               'AND status = '+QuotedStr('A')+' AND data = :pDataAtual';

       With DM_Pesq.Qry_Geral do
       begin

          Close;
          SQL.Clear;
          SQL.Add(_Sql);
          ParamByName('pDataAtual').AsDateTime := DataAtual;
          Open;

              if IsEmpty then
              begin

                   CaixaFechado := true;
                   CaixaAberto  := false;

              end
              else begin

                   CaixaAberto  := true;
                   CaixaFechado := false;

              end;

       end;

end;


procedure T_frmPrincipal.GravaPrimeiraAberturaDoCaixa;
begin

           // ATUALIZANDO O CAIXA
           With DM_Pesq.qry_Cod do begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_caixa) from caixa');
              Open;

              if not IsEmpty then begin

                 proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;

            with dm_Conexao.cds_Caixa do begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNum;
                FieldByName('id_venda').AsInteger        := 0;
                FieldByName('saldo_anterior').AsFloat    := 0;
                FieldByName('valor_movimento').AsFloat   := 0;
                FieldByName('saldo_atual').AsFloat       := 0;
                FieldByName('data').AsDateTime           := date;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := 'INICIALIZACAO DO SISTEMA DE CAIXA';

                ApplyUpdates(0);
                LogOperacoes('ADMINISTRADOR', 'Inicializacao do sistema de caixa!');

            end;


           // GRAVANDO A ABERTURA DO CAIXA NA TABELA ABRECAIXA

           With DM_Pesq.qry_Cod do begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_abrecaixa) from abrecaixa');
              Open;

              if not IsEmpty then begin

                 proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;

            dm_Conexao.cds_AbreCaixa.Active := true;
            with dm_Conexao.cds_AbreCaixa do
            begin

                Append;

                FieldByName('id_abrecaixa').AsInteger    := proxNum;
                FieldByName('valor_abertura').AsFloat    := 0;
                FieldByName('data_abertura').AsDateTime  := date;
                FieldByName('hora_abertura').AsString    := TimeToStr(time);
                FieldByName('id_funcionario').AsInteger  := 1;

                ApplyUpdates(0);

            end;

             CaixaAberto := true;

end;

procedure T_frmPrincipal.FecharValorCaixaDiaAnterior;
var
   DataFechamento : Tdate;
   proxNumIdCaixa : integer;

begin

        DataFechamento := date;
        proxNumIdCaixa := 0;

        // COLETAR O SALDO DE FECHAMENTO DO DIA ANTERIOR

        _Sql := 'SELECT data, saldo_atual, status FROM caixa WHERE id_caixa = (select max(id_caixa) from caixa)';

          With DM_Pesq.Qry_Auxiliar do begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              Open;

              if not IsEmpty then begin

                  DataFechamento               := DM_Pesq.Qry_Auxiliar.Fields[0].Value;
                  ValorTotalCaixaDoDiaAnterior := DM_Pesq.Qry_Auxiliar.Fields[1].Value;

              end;

                  dm_Conexao.cds_FechaCaixa.Active := true;

                  // GRAVANDO O FECHAMENTO DO CAIXA
                   With DM_Pesq.qry_Cod do begin

                      Close;
                      SQL.Clear;
                      SQL.Add('select max(id_fechacaixa) from fechacaixa');
                      Open;

                      if not IsEmpty then begin

                         proxNumCaixa := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

                      end;

                   end;


                    with  dm_Conexao.cds_FechaCaixa do begin

                        Append;

                        FieldByName('id_fechacaixa').AsInteger    := proxNumCaixa;
                        FieldByName('saldo_fechamento').AsFloat   := ValorTotalCaixaDoDiaAnterior;
                        FieldByName('data_fechamento').AsDateTime := DataFechamento;
                        FieldByName('hora_fechamento').AsString   := TimeToStr(time);
                        FieldByName('id_funcionario').AsInteger   := 1;

                        ApplyUpdates(0);

                    end;

           end;


          //ATUALIZA CAIXA APOS FECHAMENTO DO DIA ANTERIOR

           With DM_Pesq.qry_Cod do begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_caixa) from caixa');
              Open;

              if not IsEmpty then begin

                 proxNumIdCaixa := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;


            with  dm_Conexao.cds_Caixa do begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNumIdCaixa;
                FieldByName('saldo_anterior').AsFloat    := ValorTotalCaixaDoDiaAnterior;
                FieldByName('saldo_atual').AsFloat       := ValorTotalCaixaDoDiaAnterior;
                FieldByName('data').AsDateTime           := date - 1;
                FieldByName('status').AsString           := 'F';
                FieldByName('historico').AsString        := 'FECHAMENTO DO CAIXA';

                ApplyUpdates(0);

            end;


            //FECHA TODOS OS REGISTROS QUE EST�O ABERTOS DO DIA ANTERIOR OU SEJA O QUE ESTIVER COM 'A' PASSA PARA 'F'

            with DM_Pesq.Qry_Geral do
            begin

                close;
                sql.Clear;
                sql.Add('UPDATE caixa SET status='+QuotedStr('F')+' WHERE  status='+QuotedStr('A')+'');
                ExecSQL()

            end;
end;


procedure T_frmPrincipal.AbrirCaixaDoDia;
begin

           // ATUALIZANDO O CAIXA
           With DM_Pesq.qry_Cod do begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_caixa) from caixa');
              Open;

              if not IsEmpty then begin

                 proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;


            with  dm_Conexao.cds_Caixa do begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNum;
                FieldByName('id_venda').AsInteger        := 0;
                FieldByName('saldo_anterior').AsFloat    := ValorTotalCaixaDoDiaAnterior; //aqui entra o valor de saldo do dia anterior
                FieldByName('valor_movimento').AsFloat   := 0;
                FieldByName('saldo_atual').AsFloat       := ValorTotalCaixaDoDiaAnterior;
                FieldByName('data').AsDateTime           := date;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := 'ABERTURA DO CAIXA '+TimeToStr(time);
                ApplyUpdates(0);

            end;


            // GRAVANDO A ABERTURA DO CAIXA NA TABELA ABRECAIXA

           With DM_Pesq.qry_Cod do begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_abrecaixa) from abrecaixa');
              Open;

              if not IsEmpty then begin

                 proxNumCaixa := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;

            dm_Conexao.cds_AbreCaixa.Active := true;
            with dm_Conexao.cds_AbreCaixa do
            begin

                Append;

                FieldByName('id_abrecaixa').AsInteger    := proxNumCaixa;
                FieldByName('valor_abertura').AsFloat    := ValorTotalCaixaDoDiaAnterior;
                FieldByName('data_abertura').AsDateTime  := date;
                FieldByName('hora_abertura').AsString    := TimeToStr(time);
                FieldByName('id_funcionario').AsInteger  := 1;

                ApplyUpdates(0);

            end;

            CaixaAberto := true;

end;


procedure T_frmPrincipal.VerificaStatusDoCaixaParaAbertura;
begin

   //verifica o status do caixa para abertura do proprio

   dm_Conexao.cds_Caixa.Active := true;

   if ( dm_Conexao.cds_Caixa.Eof ) then
   begin

      //VERIFICA SE A TABELA CAIXA ESTA VAZIA, CASO POSITIVO CRIA UM REGISTRO INICIAL DE LEITURA
      GravaPrimeiraAberturaDoCaixa;

   end
   else begin

       DataAtual := date;

       {CASO O CAIXA JA TENHA REGS E DATA FOR ANTERIOR A DATA ATUAL, FECHA O DIA ANTERIOR E ABRE O CAIXA DO DIA
         SE JA ESTIVER ABERTO O CAIXA DO DIA NAO FAZ NADA}

       _Sql := 'select id_caixa, data, status from caixa WHERE id_caixa = (select max(id_caixa) from caixa) '+
               'AND data < :pDataAtual AND status = :pStatus';

       With DM_Pesq.qry_Cod do
       begin

          Close;
          SQL.Clear;
          SQL.Add(_Sql);
          ParamByName('pDataAtual').AsDate  := DataAtual;
          ParamByName('pStatus').AsString   := 'A';
          Open;

              if not IsEmpty then
              begin

                   //FECHAR O CAIXA DO DIA ANTERIOR
                   FecharValorCaixaDiaAnterior;

                   //ABRINDO O CAIXA DO DIA ATUAL
                   AbrirCaixaDoDia;

              end
              else begin

                   exit;

              end;
       end;

   end;

end;

procedure T_frmPrincipal.MenReativarFuncionariosClick(Sender: TObject);
begin

     _Sql := 'SELECT * FROM funcionarios WHERE func_status = :pStatus';

        with DM_Pesq.cdsPesqGeral do
        begin

            Close;
            CommandText:=(_Sql);
            Params.ParamByName('pStatus').AsString   :=  'I';
            Open;

            if IsEmpty then begin

               Application.MessageBox('No momento n�o existem funcionarios inativados!!',
               'Aten��o...', MB_OK + MB_ICONWARNING);

            end
            else begin

                 //dados necess�rios para acessar lista padr�o com apenas um campo para reativacao
                 campoID       := 'FUNC_ID';
                 nomeTabela    := 'FUNCIONARIOS';
                 campoNome     := 'FUNC_NOME';
                 campoStatus   := 'FUNC_STATUS';

                 reativandoFuncionario := true;
                 Application.CreateForm(T_frmListaPadraoReativacao,  _frmListaPadraoReativacao);
                 _frmListaPadraoReativacao.ShowModal;
                 FreeAndNil(_frmListaPadraoReativacao);

            end;

        end;

end;

procedure T_frmPrincipal.MenReativarClientesClick(Sender: TObject);
begin

       _Sql := 'SELECT * FROM clientes WHERE cli_status = :pStatus';

            with DM_Pesq.cdsPesqGeral do
            begin

                Close;
                CommandText:=(_Sql);
                Params.ParamByName('pStatus').AsString   :=  'I';
                Open;

                if IsEmpty then begin

                   Application.MessageBox('No momento n�o existem clientes inativados!!',
                   'Aten��o...', MB_OK + MB_ICONWARNING);

                end
                else begin

                     //dados necess�rios para acessar lista padr�o com apenas um campo para reativacao
                     campoID       := 'CLI_ID';
                     nomeTabela    := 'CLIENTES';
                     campoNome     := 'CLI_NOME';
                     campoStatus   := 'CLI_STATUS';

                     Application.CreateForm(T_frmListaPadraoReativacao,  _frmListaPadraoReativacao);
                     _frmListaPadraoReativacao.ShowModal;
                     FreeAndNil(_frmListaPadraoReativacao);
                end;

            end;
                        
end;

procedure T_frmPrincipal.mnuCadClientesClick(Sender: TObject);
begin

     btnCadastraClienteClick(self);

end;

procedure T_frmPrincipal.mnuNossaEmpresaClick(Sender: TObject);
begin

      Application.CreateForm(T_frmCadastraEmpresa,  _frmCadastraEmpresa);
      _frmCadastraEmpresa.ShowModal;
      FreeAndNil(_frmCadastraEmpresa);

      //entrando na altera��o dos dados da empresa
      AlterandoDadosEmpresa := true;

end;

procedure T_frmPrincipal.Funces1Click(Sender: TObject);
begin

     Application.CreateForm(T_frmCadFuncoes,  _frmCadFuncoes);
    _frmCadFuncoes.ShowModal;
    FreeAndNil(_frmCadFuncoes);       

end;

procedure T_frmPrincipal.btnCadastraClienteClick(Sender: TObject);
begin

      Application.CreateForm(T_frmClientes,  _frmClientes);
      _frmClientes.ShowModal;
      FreeAndNil(_frmClientes);

end;

procedure T_frmPrincipal.btnCadastraFuncClick(Sender: TObject);
begin
    
    dm_DadosSegundo.cds_Empresa.Active := true;
    if ( dm_DadosSegundo.cds_Empresa.RecordCount = 0 ) then
    begin

        Application.MessageBox('Cadastre primeiro os dados da empresa no menu consultas!','Informa��o do Sistema',MB_ICONEXCLAMATION);
        exit;

    end else begin

       Application.CreateForm(TF_FUNCIONARIOS,  F_FUNCIONARIOS);
       F_FUNCIONARIOS.ShowModal;
       FreeAndNil(F_FUNCIONARIOS);

  end;

end;

procedure T_frmPrincipal.btnOrcamentosClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

            dm_Conexao.cds_DadosClientes.Active := false;
            dm_Conexao.cds_DadosClientes.Active := true;

            if ( retornaQuantidadeRegsTabela('cli_id','clientes') = 1 ) then
            begin

                Application.MessageBox('A tabela de clientes encontra-se vazia no momento!','Informa��o do Sistema',MB_ICONEXCLAMATION);
                btnCadastraClienteClick(self);
                exit;

            end else begin

              logo.Visible := false;

              Application.CreateForm(T_frmEscolhaParaOrcamentos,  _frmEscolhaParaOrcamentos);
              _frmEscolhaParaOrcamentos.ShowModal;
              FreeAndNil(_frmEscolhaParaOrcamentos);


          end;

     end;

end;

procedure T_frmPrincipal.btnMovimentarCaixaClick(Sender: TObject);
begin

    logo.Visible := false;
    Application.CreateForm(T_frmMovimentaCaixa, _frmMovimentaCaixa);
    _frmMovimentaCaixa.ShowModal;
    FreeAndNil(_frmMovimentaCaixa);

end;

procedure T_frmPrincipal.btnPagamentosClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

       logo.Visible := false;
       Application.CreateForm(T_frmEscolhaParaPagamentos,  _frmEscolhaParaPagamentos);
       _frmEscolhaParaPagamentos.ShowModal;
       FreeAndNil(_frmEscolhaParaPagamentos);

     end;

end;

procedure T_frmPrincipal.mnuCredoresClick(Sender: TObject);
begin
      btnCredoresClick(self);
end;

procedure T_frmPrincipal.Boletos1Click(Sender: TObject);
begin

     btnPagamentosClick(self);

end;

procedure T_frmPrincipal.btnFinanceiroClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

         //Criando e abrindo o formul�rio ao clicar no bot�o

         dm_DadosSegundo.cds_Venda.Active := true;

         if not(dm_DadosSegundo.cds_Venda.RecordCount = 0) then
         begin
             logo.Visible := false;
             Application.CreateForm(T_frmEscolhaDoFinanceiro,  _frmEscolhaDoFinanceiro);
             _frmEscolhaDoFinanceiro.ShowModal;
             FreeAndNil(_frmEscolhaDoFinanceiro);

         end else begin

              Application.MessageBox('Sem movimenta��es cadastradas at� o momento!',
                  'Informa��o do Sistema!', MB_OK + MB_ICONWARNING);

         end;

         LogOperacoes(NomeDoUsuarioLogado, 'acesso aos relatorios financeiros');

     end;

end;

procedure T_frmPrincipal.MenCaixaClick(Sender: TObject);
begin

     btnMovimentarCaixaClick(self);

end;

procedure T_frmPrincipal.btnCaixaClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

        _Sql := 'SELECT * FROM venda WHERE id_venda > 0';

        with DM_Pesq.cdsPesqVenda do begin

            Close;
            CommandText:=(_Sql);
            Open;

            if IsEmpty then begin

                Application.MessageBox('Sem movimenta��es cadastradas at� o momento!',
                'Informa��o do Sistema!', MB_OK + MB_ICONWARNING);

            end
            else begin
                  logo.Visible := false;
                  Application.CreateForm(T_FrmEscolhaTipoDeRelatorioParaCaixa,  _FrmEscolhaTipoDeRelatorioParaCaixa);
                  _FrmEscolhaTipoDeRelatorioParaCaixa.ShowModal;
                  FreeAndNil(_FrmEscolhaTipoDeRelatorioParaCaixa);
                  LogOperacoes(NomeDoUsuarioLogado, 'acesso a consultas de caixa');

            end;

        end;
     end;

end;

procedure T_frmPrincipal.mnuAtivacaoClick(Sender: TObject);
begin

     Application.CreateForm(T_frmDesbloqueioPermanente,  _frmDesbloqueioPermanente);
     _frmDesbloqueioPermanente.ShowModal;
     FreeAndNil(_frmDesbloqueioPermanente);

end;

procedure T_frmPrincipal.mnuAberturaOrcamentoClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

        dm_Conexao.cds_DadosClientes.Active := true;

        if ( dm_Conexao.cds_DadosClientes.RecordCount = 1 ) then
        begin

            Application.MessageBox('A tabela de clientes encontra-se vazia no momento!','Informa��o do Sistema',MB_ICONEXCLAMATION);
            exit;

        end else begin

          Application.CreateForm(T_frmOrcamento,  _frmOrcamento);
          _frmOrcamento.ShowModal;
          FreeAndNil(_frmOrcamento);

        end;

     end;

end;

procedure T_frmPrincipal.mnuAtualizaFechaOrcamentoClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

        dm_DadosSegundo.cds_Orcamento.Active := true;

         if (dm_DadosSegundo.cds_Orcamento.RecordCount = 0) then
         begin

             Application.MessageBox('A tabela de or�amentos encontra-se vazia no momento!','Informa��o do Sistema',MB_ICONEXCLAMATION);

         end else
         begin

            Application.CreateForm(T_frmConsOrcamentosPeriodo,  _frmConsOrcamentosPeriodo);
            _frmConsOrcamentosPeriodo.ShowModal;
            FreeAndNil(_frmConsOrcamentosPeriodo);

         end;

     end;

end;

procedure T_frmPrincipal.mnuOrcamentoConsultaPorCliente1Click(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

        dm_DadosSegundo.cds_Orcamento.Active := true;
        ImprimindoRelatorio := false;

       if (dm_DadosSegundo.cds_Orcamento.RecordCount = 0) then
       begin

           Application.MessageBox('A tabela de or�amentos encontra-se vazia no momento!','Informa��o do Sistema',MB_ICONEXCLAMATION);

       end else
       begin

          Application.CreateForm(T_frmConsOrcamentosPorCliente,  _frmConsOrcamentosPorCliente);
          _frmConsOrcamentosPorCliente.ShowModal;
          FreeAndNil(_frmConsOrcamentosPorCliente);

       end;

     end;

end;

procedure T_frmPrincipal.mnuCadFuncionariosClick(Sender: TObject);
begin
   
     btnCadastraFuncClick(self);

end;

procedure T_frmPrincipal.mnuDataExpiracaoClick(Sender: TObject);
begin

     Application.CreateForm(T_frmControlaDataExpiracao,  _frmControlaDataExpiracao);
     _frmControlaDataExpiracao.ShowModal;
     FreeAndNil(_frmControlaDataExpiracao);

end;

procedure T_frmPrincipal.RelatriosDiversos1Click(Sender: TObject);
begin

     btnFinanceiroClick(self);

end;

procedure T_frmPrincipal.mnuImagemTelaPrinClick(Sender: TObject);
begin

      texto :=  '1� Para alterar a imagem da tela principal voc� deve escolher uma imagem(.GIF) de sua empresa. '#13 + #13+
                '2� Encontrar a pasta do SysPdv em C:\Arquivos de Programas\SysPdv\imagens e colocar sua logo dentro desta pasta. '#13 + #13+
                '3� Finalmente renomear a imagem para logo.gif.';

      Application.MessageBox(PChar(StringReplace(texto, '\r\n', #13#10, [rfReplaceAll, rfIgnoreCase])), 'Como mudar a imagem da tela principal', MB_OK + MB_ICONINFORMATION);

end;

procedure T_frmPrincipal.Cupomdevenda1Click(Sender: TObject);
begin

    dm_DadosSegundo.cds_Venda.Active := true;

     if not(dm_DadosSegundo.cds_Venda.RecordCount = 0) then
     begin

          Application.CreateForm(T_frmCupomVenda,  _frmCupomVenda);
          _frmCupomVenda.ShowModal;
          FreeAndNil(_frmCupomVenda);


     end else begin

           dm_DadosSegundo.cds_Orcamento.Active := true;

           if not(dm_DadosSegundo.cds_Orcamento.RecordCount = 0) then
           begin

                  Application.CreateForm(T_frmCupomVenda,  _frmCupomVenda);
                  _frmCupomVenda.ShowModal;
                  FreeAndNil(_frmCupomVenda);

           end else begin

                    Application.MessageBox('N�o foram encontrados servi�os executados!','Informa��o do Sistema',MB_ICONEXCLAMATION);

           end;

     end;

     LogOperacoes(NomeDoUsuarioLogado, 'acesso a impress�o de cupom de venda');

end;

procedure T_frmPrincipal.mnuFinanceirosClick(Sender: TObject);
begin
    btnFinanceiroClick(self);
end;

procedure T_frmPrincipal.mnuLogOperacoesClick(Sender: TObject);
begin

    Application.CreateForm(T_frmConsLogOperacoes,  _frmConsLogOperacoes);
    _frmConsLogOperacoes.ShowModal;
    FreeAndNil(_frmConsLogOperacoes);

end;


procedure T_frmPrincipal.mnuNiveisdeAcessoClick(Sender: TObject);
begin

     Application.CreateForm(T_frmCadFuncoes,  _frmCadFuncoes);
     _frmCadFuncoes.ShowModal;
     FreeAndNil(_frmCadFuncoes);

end;

procedure T_frmPrincipal.mnuLogoffClick(Sender: TObject);
begin

     _frmPrincipal.ReiniciarComMensagemTemporizada;

end;

procedure T_frmPrincipal.mnuPagarOrcamentosClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

       dm_DadosSegundo.cds_Orcamento.Active := true;

       if (dm_DadosSegundo.cds_Orcamento.RecordCount = 0) then
       begin

           Application.MessageBox('A tabela de or�amentos encontra-se vazia no momento!','Informa��o do Sistema',MB_ICONEXCLAMATION);

       end else
       begin

          Application.CreateForm(T_frmConsOrcamentosParaPagamento,  _frmConsOrcamentosParaPagamento);
          _frmConsOrcamentosParaPagamento.ShowModal;
          FreeAndNil(_frmConsOrcamentosParaPagamento);

       end;

     end;

end;

procedure T_frmPrincipal.btnCreditosReceberClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

        dm_DadosSegundo.cds_Ativos_Credito.Active  := false;
        dm_DadosSegundo.cds_Ativos_Credito.Active  := true;

        if ( dm_DadosSegundo.cds_Ativos_Credito.RecordCount = 0 ) then
        begin

               Application.MessageBox('N�o foram encontrados cr�ditos pendentes at� o momento!',
               'Aten��o tabela vazia...', MB_OK + MB_ICONEXCLAMATION);
               exit;

        end else begin

             Application.CreateForm(T_frmGerenciarCreditosPagosComCartao,  _frmGerenciarCreditosPagosComCartao);
             _frmGerenciarCreditosPagosComCartao.ShowModal;
             FreeAndNil(_frmGerenciarCreditosPagosComCartao);

         end;

     end;

end;

procedure T_frmPrincipal.btnContatosClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

        if (TabelaEstaVazia('SEGMENTOS')) then
        begin

          Application.MessageBox('� necess�rio que o segmento esteja cadastrado, cadastre-o primeiro!','Informa��o do Sistema',MB_ICONEXCLAMATION);
          exit;

        end else begin
        
         cadastrandoContato  := true;
         Application.CreateForm(TF_CONTATOS,  F_CONTATOS);
         F_CONTATOS.ShowModal;
         FreeAndNil(F_CONTATOS);

        end;

     end;

end;

procedure T_frmPrincipal.mnuContatosClick(Sender: TObject);
begin
    btnContatosClick(self);
end;   

procedure T_frmPrincipal.btnCredoresClick(Sender: TObject);
begin
       //dados necess�rios para acessar cadastro em tabela com apenas um campo
       nomeTabela    := 'CREDORES';
       campoNome     := 'CREDOR';
       campoID       := 'ID_CREDOR';
       cdsTable      := dm_Conexao.cds_Credores;
       dsTable       := dm_Conexao.ds_Credores;

       Application.CreateForm(T_frmCadastroPadraoUmCampo,  _frmCadastroPadraoUmCampo);
       _frmCadastroPadraoUmCampo.ShowModal;
       FreeAndNil(_frmCadastroPadraoUmCampo);
end;

procedure T_frmPrincipal.ReativarContatosClick(Sender: TObject);
begin

      _Sql := 'SELECT * FROM contatos WHERE cont_status = :pStatus';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Params.ParamByName('pStatus').AsString   :=  'I';
          Open;

          if IsEmpty then begin

             Application.MessageBox('No momento n�o existem contatos inativados!!',
             'Aten��o...', MB_OK + MB_ICONWARNING);

          end
          else begin

               //dados necess�rios para acessar lista padr�o com apenas um campo para reativacao
               campoID       := 'CONT_ID';
               nomeTabela    := 'CONTATOS';
               campoNome     := 'CONT_NOME';
               campoStatus   := 'CONT_STATUS';

               Application.CreateForm(T_frmListaPadraoReativacao,  _frmListaPadraoReativacao);
               _frmListaPadraoReativacao.ShowModal;
               FreeAndNil(_frmListaPadraoReativacao);
               dm_DadosSegundo.cds_Contatos.Active:=false;
          end;

      end;

end;

procedure T_frmPrincipal.ImpressodeRecibo1Click(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

         dm_DadosSegundo.cds_Orcamento.Active := true;

         if (dm_DadosSegundo.cds_Orcamento.RecordCount = 0) then
         begin

             Application.MessageBox('A tabela de or�amentos encontra-se vazia no momento!','Informa��o do Sistema',MB_ICONEXCLAMATION);

         end else
         begin

            ImprimindoRelatorio := true;

            Application.CreateForm(T_frmConsOrcamentosPorCliente,  _frmConsOrcamentosPorCliente);
            _frmConsOrcamentosPorCliente.ShowModal;
            FreeAndNil(_frmConsOrcamentosPorCliente);

         end;

     end;

end;

procedure T_frmPrincipal.btnAgendaClick(Sender: TObject);
begin

    Application.CreateForm(TF_AGENDA,  F_AGENDA);
    F_AGENDA.ShowModal;
    FreeAndNil(F_AGENDA);
    
end;

procedure T_frmPrincipal.mnuConfigImagensClick(Sender: TObject);
begin

     Application.CreateForm(TF_CONFIGURACOES,  F_CONFIGURACOES);
     F_CONFIGURACOES.ShowModal;
     FreeAndNil(F_CONFIGURACOES);

end;

procedure T_frmPrincipal.mnuPermissoesClick(Sender: TObject);
begin

     Application.CreateForm(TF_PERMISSOES,  F_PERMISSOES);
     F_PERMISSOES.ShowModal;
     FreeAndNil(F_PERMISSOES);

end;

procedure T_frmPrincipal.btnProdutosClick(Sender: TObject);
begin

    Application.CreateForm(T_frmProdutos,  _frmProdutos);
    _frmProdutos.ShowModal;
    FreeAndNil(_frmProdutos);

end;

procedure T_frmPrincipal.Produtos1Click(Sender: TObject);
begin
    Application.CreateForm(T_frmProdutos,  _frmProdutos);
    _frmProdutos.ShowModal;
    FreeAndNil(_frmProdutos);
end;

procedure T_frmPrincipal.mnuReativarProdutosClick(Sender: TObject);
begin

     _Sql := 'SELECT * FROM produtos WHERE status = :pStatus';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Params.ParamByName('pStatus').AsString   :=  'I';
          Open;

          if IsEmpty then begin

             Application.MessageBox('No momento n�o existem produtos inativados!!',
             'Aten��o...', MB_OK + MB_ICONWARNING);

          end
          else begin

               //dados necess�rios para acessar lista padr�o com apenas um campo para reativacao
               campoID       := 'ID_PRODUTO';
               nomeTabela    := 'PRODUTOS';
               campoNome     := 'DESCRICAO';
               campoStatus   := 'STATUS';

               reativandoProduto := true;
               Application.CreateForm(T_frmListaPadraoReativacao,  _frmListaPadraoReativacao);
               _frmListaPadraoReativacao.ShowModal;
               FreeAndNil(_frmListaPadraoReativacao);

          end;

      end;

end;

procedure T_frmPrincipal.mnuCategoriasClick(Sender: TObject);
begin

   //dados necess�rios para acessar cadastro em tabela com apenas um campo
   nomeTabela    := 'CATEGORIAS';
   campoNome     := 'CATEGORIA';
   campoID       := 'ID_CATEGORIA';
   cdsTable      := dm_DadosSegundo.cds_Categorias;
   dsTable       := dm_DadosSegundo.ds_Categorias;

   Application.CreateForm(T_frmCadastroPadraoUmCampo,  _frmCadastroPadraoUmCampo);
   _frmCadastroPadraoUmCampo.ShowModal;
   FreeAndNil(_frmCadastroPadraoUmCampo);

end;

procedure T_frmPrincipal.mnuFornecedoresClick(Sender: TObject);
begin
    Application.CreateForm(T_frmFornecedores,  _frmFornecedores);
    _frmFornecedores.ShowModal;
    FreeAndNil(_frmFornecedores);
end;

procedure T_frmPrincipal.btnFornecedoresClick(Sender: TObject);
begin
    Application.CreateForm(T_frmFornecedores,  _frmFornecedores);
    _frmFornecedores.ShowModal;
    FreeAndNil(_frmFornecedores);
end;

procedure T_frmPrincipal.MenReativarFornecedoresClick(Sender: TObject);
begin

       _Sql := 'SELECT * FROM fornecedores WHERE forne_status = :pStatus';

          with DM_Pesq.cdsPesqGeral do
          begin

              Close;
              CommandText:=(_Sql);
              Params.ParamByName('pStatus').AsString   :=  'I';
              Open;

              if IsEmpty then begin

                 Application.MessageBox('No momento n�o existem fornecedores inativados!!',
                 'Aten��o...', MB_OK + MB_ICONWARNING);

              end
              else begin

                   //dados necess�rios para acessar lista padr�o com apenas um campo para reativacao
                   campoID       := 'FORNE_ID';
                   nomeTabela    := 'FORNECEDORES';
                   campoNome     := 'FORNE_NOME';
                   campoStatus   := 'FORNE_STATUS';

                   reativandoFuncionario := true;
                   Application.CreateForm(T_frmListaPadraoReativacao,  _frmListaPadraoReativacao);
                   _frmListaPadraoReativacao.ShowModal;
                   FreeAndNil(_frmListaPadraoReativacao);

              end;

          end;

end;

procedure T_frmPrincipal.menProdsFabricantesClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin
          if( TabelaEstaVazia('produtos') )then
          begin
             Application.MessageBox('Voc� n�o tem produtos cadastrados,ativos ou dispon�veis'#13'at� o momento, primeiro efetue os cadastros  pertinentes'#13'aos  produtos  para  poder acessar  esta consulta!',
                    'Informa��o do Sistema!', MB_OK + MB_ICONWARNING);
             btnProdutosClick(self);
          end else begin

             Application.CreateForm(T_frmFabricantesProdutos,  _frmFabricantesProdutos);
             _frmFabricantesProdutos.ShowModal;
             FreeAndNil(_frmFabricantesProdutos);

          end;
     end;

end;

procedure T_frmPrincipal.menProdsCategoriasClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

          if( TabelaEstaVazia('produtos') )then
          begin
             Application.MessageBox('Voc� n�o tem produtos cadastrados,ativos ou dispon�veis'#13'at� o momento, primeiro efetue os cadastros  pertinentes'#13'aos  produtos  para  poder acessar  esta consulta!',
                    'Informa��o do Sistema!', MB_OK + MB_ICONWARNING);
             btnProdutosClick(self);
          end else begin

              Application.CreateForm(T_frmCategoriasProdutos,  _frmCategoriasProdutos);
              _frmCategoriasProdutos.ShowModal;
              FreeAndNil(_frmCategoriasProdutos);

          end;

     end;

end;

procedure T_frmPrincipal.menProdsFornecedoresClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

           if( TabelaEstaVazia('produtos') )then
          begin
             Application.MessageBox('Voc� n�o tem produtos cadastrados,ativos ou dispon�veis'#13'at� o momento, primeiro efetue os cadastros  pertinentes'#13'aos  produtos  para  poder acessar  a  esta consulta!',
                    'Informa��o do Sistema!', MB_OK + MB_ICONWARNING);
             btnProdutosClick(self);
          end else begin

              Application.CreateForm(T_frmFornecedoresProdutos,  _frmFornecedoresProdutos);
              _frmFornecedoresProdutos.ShowModal;
              FreeAndNil(_frmFornecedoresProdutos);

          end;

     end;

end;

procedure T_frmPrincipal.btnVendasClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

        //PARA VENDA BALC�O
        if( (TabelaEstaVazia('produtos')) or (retornaQuantidadeRegsAtivosTabela('id_produto','produtos','status') = 0))then
        begin
           Application.MessageBox('Voc� n�o tem produtos cadastrados,ativos ou dispon�veis'#13'at� o momento, primeiro efetue os cadastros  pertinentes'#13'aos  produtos  para  poder acessar  a  venda dos mesmos!',
                  'Informa��o do Sistema!', MB_OK + MB_ICONWARNING);
           btnProdutosClick(self);
        end else begin
          Application.CreateForm(T_frmEntraCPFCNPJ, _frmEntraCPFCNPJ);
          _frmEntraCPFCNPJ.ShowModal;
          FreeAndNil(_frmEntraCPFCNPJ);
        end;

     end;

end;

procedure T_frmPrincipal.mnuFormasdePagamentoClick(Sender: TObject);
begin

      //dados necess�rios para acessar cadastro em tabela com apenas um campo
       nomeTabela    := 'FORMAPAGTO';
       campoNome     := 'FORMA_DESCRICAO';
       campoID       := 'FORMA_ID';
       cdsTable      := dm_Conexao.cds_FormaPagtos;
       dsTable       := dm_Conexao.ds_FormaPagtos;

       Application.CreateForm(T_frmCadastroPadraoUmCampo,  _frmCadastroPadraoUmCampo);
       _frmCadastroPadraoUmCampo.ShowModal;
       FreeAndNil(_frmCadastroPadraoUmCampo);

end;

procedure T_frmPrincipal.Caixa2Click(Sender: TObject);
begin
  btnCaixaClick(self);
end;

procedure T_frmPrincipal.BoletosaPagar2Click(Sender: TObject);
begin
  btnPagamentosClick(self);
end;

procedure T_frmPrincipal.CreditosaReceber1Click(Sender: TObject);
begin
  btnCreditosReceberClick(self);
end;

procedure T_frmPrincipal.GrficoFinanceiro1Click(Sender: TObject);
begin

  if (temImpressoraPadrao)then
  begin

     _Sql := 'SELECT * FROM venda WHERE id_venda > 0';

      with DM_Pesq.cdsPesqVenda do begin

          Close;
          CommandText:=(_Sql);
          Open;

          if IsEmpty then begin

              Application.MessageBox('Sem movimenta��es cadastradas at� o momento!',
              'Informa��o do Sistema!', MB_OK + MB_ICONWARNING);

          end
          else begin

                 Application.CreateForm(T_frmGraficos,  _frmGraficos);
                 _frmGraficos.ShowModal;
                 FreeAndNil(_frmGraficos);

          end;

      end;
  end;
  
end;

procedure T_frmPrincipal.RelatriosFinanceiros1Click(Sender: TObject);
begin
    btnFinanceiroClick(self);
end;

procedure T_frmPrincipal.mnuMovimentarCaixaClick(Sender: TObject);
begin
    btnMovimentarCaixaClick(self);
end;

procedure T_frmPrincipal.mnuFrenteCaixaClick(Sender: TObject);
begin
   // Liberando o m�dulo frente de caixa para o atual cliente
   logo.Visible := false;

   if(retornaQuantidadeRegsTabela('cli_id','clientes') = 1)then
   begin
       Application.MessageBox('Cadastre pelo menos um cliente para continuar!',
                'Informa��o do Sistema!', MB_OK + MB_ICONWARNING);
       btnCadastraClienteClick(self);
       logo.Visible := true;

   end else
   begin

         if(frenteDeCaixaLiberado)then
         begin
               Application.CreateForm(T_frmBloquearModuloFrenteCaixa,  _frmBloquearModuloFrenteCaixa);
               _frmBloquearModuloFrenteCaixa.ShowModal;
               FreeAndNil(_frmBloquearModuloFrenteCaixa);

         end
         else begin               
               Application.CreateForm(T_frmLiberarModuloFrenteCaixa,  _frmLiberarModuloFrenteCaixa);
               _frmLiberarModuloFrenteCaixa.ShowModal;
               FreeAndNil(_frmLiberarModuloFrenteCaixa);

         end;

   end;

end;      

procedure T_frmPrincipal.btnImprimirCupomClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

       if not(TabelaEstaVazia('relcupons'))then
       begin

           Application.CreateForm(T_frmConsVendasParaImpressao,  _frmConsVendasParaImpressao);
           _frmConsVendasParaImpressao.ShowModal;
           FreeAndNil(_frmConsVendasParaImpressao);

       end else
       begin
           Application.MessageBox('Sem movimenta��es cadastradas at� o momento!',
                'Informa��o do Sistema!', MB_OK + MB_ICONWARNING);
       end;
       DM_Pesq.cdsPesqGeral.Active:= false;

    end;

end;

procedure T_frmPrincipal.btnFabricantesClick(Sender: TObject);
begin

   //dados necess�rios para acessar cadastro em tabela com apenas um campo
   nomeTabela    := 'FABRICANTES';
   campoNome     := 'NOME_FABRICANTE';
   campoID       := 'ID_FABRICANTE';
   cdsTable      := dm_Conexao.cds_Fabricante;
   dsTable       := dm_Conexao.ds_Fabricante;

   Application.CreateForm(T_frmCadastroPadraoUmCampo,  _frmCadastroPadraoUmCampo);
   _frmCadastroPadraoUmCampo.ShowModal;
   FreeAndNil(_frmCadastroPadraoUmCampo);

end;

procedure T_frmPrincipal.mnuFabricantesClick(Sender: TObject);
begin
  btnFabricantesClick(self);
end;

procedure T_frmPrincipal.mnuSegmentosClick(Sender: TObject);
begin

       //dados necess�rios para acessar cadastro em tabela com apenas um campo
       nomeTabela          := 'SEGMENTOS';
       campoNome           := 'SEGMENTO';
       campoID             := 'ID_SEGMENTO';
       cdsTable            := dm_DadosSegundo.cds_Segmentos;
       dsTable             := dm_DadosSegundo.ds_Segmentos; 
       cadastrandoContato  := false;

       Application.CreateForm(T_frmCadastroPadraoUmCampo,  _frmCadastroPadraoUmCampo);
       _frmCadastroPadraoUmCampo.ShowModal;
       FreeAndNil(_frmCadastroPadraoUmCampo);

end;

procedure T_frmPrincipal.mnuProdutosClick(Sender: TObject);
begin

   Application.CreateForm(T_frmEscolhaAcaoParaProdutos,  _frmEscolhaAcaoParaProdutos);
   _frmEscolhaAcaoParaProdutos.ShowModal;
   FreeAndNil(_frmEscolhaAcaoParaProdutos);

end;

procedure T_frmPrincipal.mnuOrcamentosClick(Sender: TObject);
begin
  btnOrcamentosClick(self);
end;

procedure T_frmPrincipal.mnuReativacaoClick(Sender: TObject);
begin

     if (temInativadoEmAlgumaTabela) then
     begin
          _frmPrincipal.logo.Visible := false;
          Application.CreateForm(T_frmEscolhaParaReativacoes,  _frmEscolhaParaReativacoes);
          _frmEscolhaParaReativacoes.ShowModal;
          FreeAndNil(_frmEscolhaParaReativacoes);

     end else begin
           //Se nao tiver inativado em nenhuma das tabelas clientes,contatos,produtos,funcionarios, fornecedores

           Application.MessageBox('N�o    h�    clientes,   contatos,   produtos,   funcion�rios'#13'ou  fornecedores  inativados  at�  o  presente  momento!',
                                  'Informa��o do Sistema!', MB_OK + MB_ICONWARNING);

     end;

end;

function T_frmPrincipal.temInativadoEmAlgumaTabela: boolean;
begin

     if (TemInativos('clientes','CLI_STATUS'))then
     begin
                Result := true;

         end else
            if (TemInativos('contatos','CONT_STATUS'))then
            begin
                Result := true;

         end else
               if (TemInativos('produtos','STATUS'))then
               begin
                  Result := true;

         end else
               if (TemInativos('funcionarios','FUNC_STATUS'))then
               begin
                    Result := true;

         end else
              if (TemInativos('fornecedores','FORNE_STATUS'))then
              begin
                   Result := true;

         end else
              if (TemOrcamentoDesaprovado)then
              begin
                   Result := true;

     end else
     begin

       Result := false;

     end;

end;



procedure T_frmPrincipal.VideosTutoriais1Click(Sender: TObject);
var
   nomeSO : string;
begin   

   nomeSO := copy(RetornarNomeWindowsSO,1,9);
   //ShowMessage(nomeSO);  importante atentar para a quantidade de caracteres do copy, tem que bater com a quantidade da string

   if(nomeSO = trim('Windows 7'))then
   begin

       Application.MessageBox('Este  recurso  n�o  funciona no  Windows 7  atualize '#13'seu Sistema Operacional para que os v�deos possam'#13'ser executados via navegador da internet!',
                                'Seu sistema esta desatualizado!', MB_OK + MB_ICONWARNING);
       exit;

   end else
   begin

     if (sistemaConectadoInternet) then
     begin

          logo.Visible := false;
          Application.CreateForm(TF_ESCOLHAPARAVIDEO,  F_ESCOLHAPARAVIDEO);
          F_ESCOLHAPARAVIDEO.ShowModal;
          FreeAndNil(F_ESCOLHAPARAVIDEO);


     end else
     begin

         Application.MessageBox('Para ver o v�deo voc� precisa estar conectado � internet, conecte-se e tente novamente!',
                                'Sistema n�o esta conectado a internet!', MB_OK + MB_ICONWARNING);
         exit;

     end;

   end;

end;

procedure T_frmPrincipal.Agenda1Click(Sender: TObject);
begin
  btnAgendaClick(self);
end;

procedure T_frmPrincipal.mnuSuporteClick(Sender: TObject);
begin
  btnSobreClick(self);
end;

procedure T_frmPrincipal.mnuBackupClick(Sender: TObject);
begin

    Application.CreateForm(T_frmBackupBanco,  _frmBackupBanco);
    _frmBackupBanco.ShowModal;
    FreeAndNil(_frmBackupBanco);

end;      

procedure T_frmPrincipal.mnuContasPagarClick(Sender: TObject);
begin
   btnPagamentosClick(self);
end;

procedure T_frmPrincipal.mnuContasReceberClick(Sender: TObject);
begin
  btnCreditosReceberClick(self);
end;

procedure T_frmPrincipal.mnuContasGeralClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

        _Sql := 'SELECT * FROM venda WHERE id_venda > 0';

        with DM_Pesq.cdsPesqVenda do begin

            Close;
            CommandText:=(_Sql);
            Open;

            if IsEmpty then begin

                Application.MessageBox('Sem movimenta��es cadastradas at� o momento!',
                'Informa��o do Sistema!', MB_OK + MB_ICONWARNING);

            end
            else begin
                  _frmPrincipal.logo.Visible := false;
                  Application.CreateForm(T_frmEscolhaParaFinanceiro,  _frmEscolhaParaFinanceiro);
                  _frmEscolhaParaFinanceiro.ShowModal;
                  FreeAndNil(_frmEscolhaParaFinanceiro);
                  LogOperacoes(NomeDoUsuarioLogado, 'acesso a consultas do financeiro');

            end;

        end;
     end;

end;

procedure T_frmPrincipal.verificarStatusModuloFrenteDeCaixa;
begin

     //VERIFICANDO STATUS DO MODULO FRENTE DE CAIXA
     if(frenteDeCaixaLiberado)then
     begin
        ShowMessage('MODULO FRENTE DE CAIXA LIBERADO');
     end else
     begin
        ShowMessage('MODULO FRENTE DE CAIXA BLOQUEADO');
     end;

end;

procedure T_frmPrincipal.setarImpressoraPadrao;
begin

   retornarTipoImpressora; //buscando o tipo de impressora cadastrado/definido no banco retorna valor para getTipoImpressoraDefinida
   btnImprimirCupom.Hint:='2� via de cupons na '+getImpressoraSetada;

   if not(TemImpressoraDefinida)then
   begin

         Application.CreateForm(T_frmEscolhaTipoImpressora,  _frmEscolhaTipoImpressora);
         _frmEscolhaTipoImpressora.ShowModal;
         FreeAndNil(_frmEscolhaTipoImpressora);

   end else
   begin
       
       if (getTipoImpressoraDefinida = 'JATOTINTA') then
       begin

         //JATO TINTA
         imprimirJato         := true;
         imprimirMatricial    := false;
         controlaImpressao    := true;
         getControlaMenuImpressoraPadrao;
         //ShowMessage('TIPO SETADO JATOTINTA');

       end else if (getTipoImpressoraDefinida = 'MATRICIAL') then
       begin

         //MATRICIAL
         imprimirMatricial    := true;
         imprimirJato         := false;
         controlaImpressao    := true;
         getControlaMenuImpressoraPadrao;
         //ShowMessage('TIPO SETADO MATRICIAL');

       end;

   end;

end;

procedure T_frmPrincipal.getControlaMenuImpressoraPadrao;
begin

     getTipoImpressoraDefinida := retornarTipoImpressora;

     if (getTipoImpressoraDefinida = 'JATOTINTA') then
     begin
         menuJatoTinta.Enabled := false;
         menuMatricial.Enabled := true;

     end else if (getTipoImpressoraDefinida = 'MATRICIAL') then
     begin
         menuMatricial.Enabled := false;
         menuJatoTinta.Enabled := true;

     end;

end;

procedure T_frmPrincipal.mnuConfiguracoesClick(Sender: TObject);
begin
     getControlaMenuImpressoraPadrao;
end;

procedure T_frmPrincipal.menuJatoTintaClick(Sender: TObject);
var
   tipoimpr : string;
begin

   imprimirJato      := true;
   imprimirMatricial := false;
   controlaImpressao := true;
   tipoimpr          := 'JATOTINTA';
   AlterarEscolhaImpressora(tipoimpr);
   AbriFecharTabelas;

    texto:= 'A Impressora padr�o foi alterada para o tipo '+tipoimpr+'!';
    Application.MessageBox(PChar(texto),'Novo tipo de impressora setada!',MB_OK + MB_ICONINFORMATION);      

end;

procedure T_frmPrincipal.menuMatricialClick(Sender: TObject);
var
   tipoimpr : string;
begin

   imprimirMatricial := true;
   imprimirJato      := false;
   controlaImpressao := true;
   tipoimpr          := 'MATRICIAL';
   AlterarEscolhaImpressora(tipoimpr);
   AbriFecharTabelas;

    texto:= 'A Impressora padr�o foi alterada para o tipo '+tipoimpr+'!';
    Application.MessageBox(PChar(texto),'Novo tipo de impressora setada!',MB_OK + MB_ICONINFORMATION);

end;

procedure T_frmPrincipal.mnuImpressorasClick(Sender: TObject);
begin
   getControlaMenuImpressoraPadrao;
end;

procedure T_frmPrincipal.mnuAnotacoesClick(Sender: TObject);
begin

    Application.CreateForm(TF_ANOTACOES,  F_ANOTACOES);
    F_ANOTACOES.ShowModal;
    FreeAndNil(F_ANOTACOES);

end;

end.
