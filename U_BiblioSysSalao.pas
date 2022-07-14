unit U_BiblioSysSalao;

interface

uses QForms, Controls, DB, DBClient, StdCtrls, SqlExpr,  Dialogs, Encryp, ExtDlgs,Registry,
SysUtils, Variants, Classes, Buttons, Messages, Windows, Graphics, Forms, Printers, ComCtrls,
Grids, DBGrids, Mask, DBCtrls, DateUtils, ToolEdit, Inifiles, WinInet, ShellApi, QExtCtrls, ExtCtrls;



//FUNÇÕES PERSONALIZADAS
Function Transform(valor:Double):string;
Function verificaCaption(caption: string; Botao: TSpeedButton): Boolean;
Function TestaDataset(Dataset : TClientDataSet) : Boolean;
Function IdFuncionarioLogado(nome_func : string): integer;
Function RetornaIDPassandoString(campoID,tabela,campoParam,pParam:string): integer;
Function RetornaStringPassandoID(campoDesejado,tabela,campoID:String; pIdParam:integer): string;
Function NomeFuncionarioLogado(id_func : integer): string;
Function RetornaNomeUsuarioLogado(idUser:integer):string;
Function valorPorExtenso(vlr: real): string;
Function CalcularValorPorPercentual(valorAtual, percentual : double): double;
Function VerificaSeEProduto(IDProd : integer): boolean;
Function RetiraPonto(S: string): Double;
Function MostrarMesEAno(nomeEditComData:string):string;
Function SoNumeros(Const Texto:String):String;
Function LetrasIniciaisMaiusculas(Texto:String): String;
Function TodasLetrasIniciaisEmMaiusculas(Str: string): string;
Function ListaQdeRegs(cds: TClientDataSet):integer;
Function PedidoTemItens(NumPedido:integer):boolean;
Function TemEmpresaCadastrada:boolean;
Function PedidoAberto(NumPedido:integer):boolean;
Function AgendamentoAberto(NumAgendamento:integer):boolean;
Function NumeroPar(aNum: Integer): Boolean;
Function GerarProximoID(nomeCampoID, nomeTabela: string): integer;
Function Explode(Texto, Separador : String) : TStrings;
Function ContaChar(texto,caracter:string):integer;
Function ObterQtdeOcorrencias(MeuTexto: String): Integer;
Function TabelaEstaVazia(tabela:String):Boolean;
Function TemInativos(tabela, campoStatus:String):Boolean;
Function TemOrcamentoDesaprovado:Boolean;
Function TemOrcamentosFinalizados(idCliente:integer):Boolean;
Function TemUmOrcamentoFinalizado:Boolean;
Function TemDuplicidade(cds: TClientDataSet; campo: string; sParam:string):Boolean;
Function TemDuplicidadeNoCampo(sCampo,sTabela,sParam:string):boolean;
Function retornaQuantidadeRegsTabela(campoID,tabela:string):integer;
Function retornaQuantidadeRegsAtivosTabela(campoID,tabela,campoStatus:string):integer;
Function retornaPrimeiroUltimoNome(texto: String): String;
Function retornaPrimeiroNome(texto: string): string;
Function retornaSegundoNome(texto: string): string;
Function retornaPrimeiroESegundoNome(texto: string): string;
Function retornarNomeMes(numMes:integer) : string;
Function retornaNomeMesPassandoData(data : TDateTime) : string;
Function retornaAnoPassandoData(data : TDateTime) : string;
Function retornaDiaPassandoData(data : TDateTime) : integer;
Function retornaNumMes : integer;
Function SistemaLiberado : boolean;
Function CarregarLogoEmpresa: String;
Function CarregarImagem(descricao:string):String;
Function retornaTotalPalavras(str : string) : integer;
Function gerarMesAno : string;
Function gerarMesAnoPassandoData(data : TDateTime) : string;
Function GetSerialNumberFromHD(const SourceDrive: String): String;
Function Criptografar(Action, Src: String): String;
Function EliminarFormatacao(sTexto:String):String;
Function QtdCaracteres(Edit:String): integer;
Function RetornaDifDiasEntreDatas(DataVenc, DataAtual: TDateTime): Extended;
Function RetornarDiferencaEmDiasEntreDatas(data1, data2 : TDateTime):integer;
Function DifDiasEntreDatas(data1, data2 : TDate):integer;
Function ArredondaPraCima(nValor: Double; Casas: Integer): Double;
Function Quebra(input: String; separador: char) : TStringList;
Function retornaValorPercentualDeLucro(idProduto : integer): double;
Function EClienteBalcao(idClienteVenda:integer) : boolean;
Function frenteDeCaixaLiberado : boolean;
Function RetornaUsuarioLogado(idUser:integer):string;
function GetIndiceImpressoraPadrao: Integer;
function temImpressoraPadrao:boolean;
function IsNumero(Texto: string): Boolean;
function sistemaConectadoInternet: Boolean;
Function GerarStaff : string;
Function GerarSigla(nomeEmpresa : string): string;
function NaoTemSigla : boolean;
Function RetornarInicioDegustacao : string;
Function RetornarFimDegustacao : string;
Function RetornarCaminhoBanco: String;
Function RetornarDataInstalacao : string;
Function RetornarDataLiberacao : string;
Function RetornarCaminhoImgPadrao: String;
Function RetornarCaminhoImgTelaInicial: String;
Function RetornarCaminhoImgCodBarras : String;
Function RetornarCaminhoPastaBackup : string;
Function RetornarContraChave : string;
Function RetornarDataExpiracao : string;
Function RetornarCaminhoDaAplicacao : string;
Function retornarNomeBancoSetado(path:string):string;
Function SysVersion(Ver: _OSVERSIONINFOA): boolean;
Function RetornarNumeroVersionSistemaOperacional: string;
Function RetornarNomeWindowsSO: string;
Function ItemDuplicadoNaVenda(pProduto: string): boolean;
Function ItemEncontradoNoListBox(listBox:TListBox; item:string):boolean;
Function ProdutoEmEstoque(id:integer;codbarras,codalt,descricao:string):boolean;
Function ProdutoConstaDaVendaAtual(idProduto:integer):boolean;
Function DeletarPasta(FolderName: String; LeaveFolder: Boolean): Boolean;
Function RetornaPrimerioUsuario:string;
Function RetornaStatusMenuFinanceiro:string;
Function RetornaNumOrc(idVenda:integer):integer;
Function RetornaNumVenda(idOrc:integer):integer;
Function TemImpressoraDefinida : boolean;
Function retornarTipoImpressora : string;
Function getImpressoraSetada : string;
Function getLogoEmpresa : String;
Function retornaQuantidadeRegsUserLogado(campoID,campoIdUSER,idUsuarioLogado,tabela:string):integer;



//PROCEDIMENTOS PERSONALIZADOS
procedure DeletarArquivosDaPasta(caminho:string);
procedure GerarLogBackup(sInformacao: string);
procedure FiltrarPorNome(cds:TClientDataSet; tabela:string; campoFiltro:string; NomeDoEdit: TEdit);
procedure VerificarSeTabelaVazia(cds: TClientDataSet; botao1:TSpeedButton; botao2:TSpeedButton);
procedure FiltraNome(cds: TClientDataSet; TextoSql: string; NomeDoEdit: TEdit);
procedure LocalizarDadosGeral(cds: TClientDataSet; TextoSql: string);
procedure DeletarRegistro(tabela,campoid,id : string);
procedure FiltrarPeriodo(cds_FiltraPeriodo: TClientDataSet; TextoSql: string; TxtDataInicio: string; TxtDataFim: string; TxtStatusAgendamento: string);
procedure VerificarDuplicidade(cds: TClientDataSet; campo: string; NomeDoEdit: TEdit);
procedure LogOperacoes(usuario : string; ocorrencia : string);
procedure MensagemBtnOk(msg:string; titulo:string);
procedure AbrirTabela(cds:TClientDataSet);
procedure FecharTabela(cds:TClientDataSet);
procedure AtualizarTabela(cds:TClientDataSet);
procedure ReativarLoginFuncionarioInativado(iIdParam:integer);
procedure GerarSenhaInicial(id:integer);
procedure GerarArquivoTxt;
procedure GerarListaEmailsClientes;
procedure AvisoTemporario(const m: string; const t: Cardinal=2000);
procedure OrdenarRecordSet(cds:TClientDataSet; tabela,campoID : string);
procedure ApagarTabela(tabela:string);
procedure DesabilitarMenus(nomeDoMenu:string);
procedure SetandoConfigsModuloFrenteDeCaixaParaUsuario(nivel:integer);
procedure GerenciarConfiguracaoPadraoBotoesMenusDosUsuarios;
procedure verificarPermissoes(pNivelid:integer);
procedure BloquearFrenteDeCaixa;
procedure LiberarFrenteDeCaixa;
procedure gravarValoresPadraoDoClienteBalcao;
procedure formatarRelatoriosDisplay100;
procedure GerarNovaSigla;
procedure ReiniciarSistema(Nome, Parametros: String);
procedure gravarNovoBancoSetado(path:string);
procedure atualizarUmCampoDaTabela(tabela,campo,valor,campoId,valorId,tipoDado:string);
procedure DeletarRegistroPeloID(tabela:string;idProduto:integer);
procedure CentralizarDigitacao(edit:TEdit);
procedure ReiniciarComMensagemETemporizador(timer:TTimer; msg,titulomsg:string; tempo:Cardinal);
procedure CriarTimerBarraStatus;
procedure CriarTimerReiniciar;
procedure RetornarComponenteComFoco;
procedure GerarCupomMatricial(idVendaCupom:integer);
procedure GravarEscolhaImpressora(tipo:string);
procedure AlterarEscolhaImpressora(tipo:string);


const
     PATHBANCO        : string = 'C:\Meus Documentos\Bancos_De_Projetos\SysPdv\SYSPDV.FDB';
     CHAVEFRENTECAIXA : string = '872D598132A438A1B29578532';     

var
  _Sql,_Sql1,_Sql2,_Sql3,_Sql4, IdentificarUsuarioLogado,NomeDoUsuarioLogado,texto, mes_ano, nomeMes, mes, cpf_cnpj, IDForne, DescProdutoGeral, cpf,cnpj, url_video, sTringGeral,campoID, tipoAcesso, nomeAtuaUserLogado,
  NumVendaParaCreditos, ValorVendaParaCreditos, ValorDaParcelaAVista, NumNFGerarDuplicatas, ValorDuplicata, IPLocal, textoInicial, NomeCliente, nomeTabela, pathVideo, tituloVideo, pathFile, nomeParaAgendamento,
  NomeDoClienteDaVenda, NomeFornecedorGerarDuplicata, historicoDaVendaParaCaixa, NomeDoProdutoParaVenda, mesAnoSelecionado, ValorPendenciaParaCreditos, campoStatus, LoginUsuarioParaNovaSenha, numAnoDataPassada,
  nomeDoCredorParaFiltrarBoletos, NomeUsuarioParaNovaSenha, NomeEmpresaLogada, NomeDoProduto, NumDaNF,FotoDoProduto, NumOrcParaCreditos, campoNome, sResultado,DestinoArq, sNomeSelecionado, sNomeBanco, sFuncao,
  ValorOrcParaCreditos, sNomeClienteVenda, sIdClienteVenda, codBarrasProduto, sUsuarioLogado, sSegmentoContato, periodo, getTipoImpressoraDefinida, tipoImpressora : string;

  IdDoUsuarioLogado, proxNum, proxNum1, flag, TotalRegs, Tentativas, numMes, IDOperador, opc, IDProdutoGeral, IDPedidoGerarDuplicatas, IdGeral, IdTipoAcesso, proxNumLogin,idOrcamentoSelecionado, UserLevel,
  IDFornecedorGerarDuplicata, IDVendaParaAlterarData, idCliente, idVenda, IdContatoSelecionado, NivelFuncao, idEmpresaLogada, idUsuarioSelecionado, idClienteImpressao, idCreditoSelecionado, valorTag, idClienteVenda,
  qde, qdeRegs,proxNumContato, idProdutoCadastrado, qdeParcelas, NumOrcamentoSelecionado, controleNumerico, contador, idSelecionado, NumVendaSelecionada, numdia, idOrcImpressao : Integer;

  valorCompraProdNaoCad, valorLucroProdNaocad, valorVendaProdNaoCad, estoqueProduto, TotalOrcamento, valorDoPagamento, valorNovaParcela, valorParcelado, QdeDiasParaExpirar  : double;

  CaixaAberto, CaixaFechado, TemAcesso, EProduto, ECliente, Vendeu, AlterouDataVenda, alterouPreco, clienteNovo, ConsultouPorCliente, inserindo, reativandoFuncionario, reativandoProduto, entrounovasenha, cadastroInicial, clienteBalcao, logado, 
  vendaCredito, GerouPendencia, inseriuServico, inseriuProduto, AtualizandoOrcamento, pagandoOrcamento,editando, gravouNovoSegmentoPelosContatos, cadastrando, alterouFuncao, agendando, vendaCliente, filtrouPorCliente, gerouDesconto,
  PorCredor, PorCredorVencidosPendentes, PorCredorVencidosFinalizados, PorCredorNaoVencidos, alterandoUsuario, TemNivers, TemProdsEstoqueBaixo, ImprimindoRelatorio, AlterandoDadosEmpresa, AlterandoCodBarrasTelaIni, ModuloFrenteCaixaAtivado,
  cadastrandoContato, abrindoOrcamento, reativando, verificandoEstoqueMinimo, pagandoVenda, fechandoVenda, escolheuPesquisarPorNome, escolheuPesquisarPorOrc, escolheuPesquisarPorVenda, imprimirJato, imprimirMatricial, controlaImpressao : boolean;

  DataDoDia,  DataInicio, DataFim, DataAtual, DataVendaAlterada, DataVenda, DataSelecionada, DataInicioImprimir, DataFimImprimir : TDate;

  dtDataDoDia : TDateEdit; //variavel de componente que deve ser instanciada usada e destruida

  Arquivo: TIniFile;       //variavel de componente que deve ser instanciada usada e destruida

  ArqTXT, arq_impr : TextFile;

  valorTotal, valorDoItem  : double;

  cdsTable   : TClientDataSet;

  dsTable    : TDataSource;

  tResultado : TStringList;

  tListaEmails : TList;

  caminhoTXT :TSaveDialog;

  listaMenusForm : TStringList;

  TimerBarraStatus, TimerReiniciar : TTimer;

implementation


uses U_dmDados, U_dmDadosSegundo, U_dmPesquisas, U_dmPesqDados, U_Principal, U_ContasPagar,
  U_LiberaModuloFrenteCaixa, U_BloquearModuloFrenteCaixa;

procedure RetornarComponenteComFoco;
begin
    ShowMessage(Screen.ActiveControl.Name);
end;

procedure CriarTimerBarraStatus;
begin

  TimerBarraStatus:= TTimer.create(nil);
  Try
    With TimerBarraStatus Do
    Begin
      Enabled  := TRUE;
      Interval := 1000;
      //Ontimer := Será passado dinamicante dentro do formulário;
    end;
  Finally;
 end;

end;

procedure CriarTimerReiniciar;
begin

  TimerReiniciar:= TTimer.create(nil);
  Try
    With TimerReiniciar Do
    Begin
      Enabled  := false;
      //Interval := Será passado dinamicante dentro do formulário;
      //Ontimer  := Será passado dinamicante dentro do formulário;
    end;
  Finally;
 end;

end;

procedure ReiniciarComMensagemETemporizador(timer:TTimer; msg,titulomsg:string; tempo:Cardinal);
var
    caminhoDaAplicacao:String;
begin

    timer.Interval := tempo; // Tempo que a msg ficará na tela -> 3000 = 3Segs
    timer.Enabled  := True;
    //MessageBox(handle, PChar('O sistema será reiniciado automaticamente, entre novamente!'), Pchar('Reiniciando...'), 8224);
    Application.MessageBox(PChar(msg), PChar(titulomsg), MB_ICONEXCLAMATION);

    caminhoDaAplicacao := ExtractFilePath(ParamStr(0))+'syspdv.exe';
    ReiniciarSistema(caminhoDaAplicacao,'/syspdv');
    Application.Terminate;

    {
       IMPORTANTE : deixe a propriedade Enable do Timer como False e coloque este codigo no evento OnTimer do objeto Timer que for adicionado ao formulario, atente para o nome se for mudado
       keybd_event(VK_RETURN,0,0,0);
       Timer1.Enabled := False;

       USANDO O PROCEDIMENTO:
       texto := 'Parabéns os cadastros iniciais foram efetivados com sucesso,  acesse  o  sistema  novamente   com   seu   usuário : '+login+', cadastre  sua  senha pessoal e desfrute o máximo do Sistema.';
       ReiniciarComMensagemETemporizador(Timer1,texto,'Cadastros iniciais efetivados!',10000);

     }

end;

Function RetornaNumOrc(idVenda:integer):integer;
begin

    _Sql4:= 'select orcamento_id FROM venda WHERE id_venda = :id_Venda';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=_Sql4;
          Params.ParamByName('id_Venda').AsInteger := idVenda;
          Open;

          if not IsEmpty then
          begin

              result  := DM_Pesq.cdsPesqGeral.fields[0].value;

          end else
          begin
              result  := 0;

          end;

      end;
end;

Function RetornaNumVenda(idOrc:integer):integer;
begin

    _Sql4:= 'select id_venda FROM venda WHERE orcamento_id = :id_Orc';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=_Sql4;
          Params.ParamByName('id_Orc').AsInteger := idOrc;
          Open;

          if not IsEmpty then
          begin

              result  := DM_Pesq.cdsPesqGeral.fields[0].value;

          end else
          begin
              result  := 0;

          end;

      end;
end;

procedure GerarCupomMatricial(idVendaCupom:integer);
var
   venda, descricao, pathArq, tipovenda, cpf, cnpj, ie : string;
   cont  : integer;
begin

    //IMPRIME DIRETO NA IMPRESSORA SETADA COMO PADRAO
    Assignprn(arq_impr); //direciona diretamente para impressora

    {DIRECIONAR PARA ARQUIVO TXT
    define onde será gerado o arquivo texto. Somente teste pois a idéia é imprimir diretamente na impressora de cupom}
    pathArq := ExtractFilePath(application.ExeName)+'\cupom\cupom.txt';
    //AssignFile(arq_impr,pathArq);

    {define a regravação do proprio arquivo}
    rewrite(arq_impr);

    {define configurações do texto}
    Printer.Canvas.Font.Name  := 'Courier New';
    Printer.Canvas.Font.Size  := 8;
    Printer.Canvas.Font.style := [fsBold];


    {define tipo DA VENDA}

    _Sql3:= 'select tipo, id_venda, orcamento_id FROM venda WHERE id_venda = :id_da_venda';

    with DM_Pesq.cdsPesqAuxiliar do
      begin

        Close;
        CommandText:=_Sql3;
        Params.ParamByName('id_da_venda').AsInteger := idVendaCupom;
        Open;

            if not IsEmpty then
            begin

                 tipovenda :=  DM_Pesq.cdsPesqAuxiliar.fieldbyname('tipo').Value;

                 if tipovenda = 'O' then
                 begin
                     tipovenda := 'ORCAMENTO';
                     idOrcImpressao := DM_Pesq.cdsPesqAuxiliar.fieldbyname('orcamento_id').Value;  //Retorna o numero do orçamento passando o numero da venda
                     venda     := intToStr(idOrcImpressao);
                     venda     :=  StringOfChar('0',10-Length(venda))+venda;
                     //ShowMessage('Numero do Orçamento : '+inttostr(idOrcImpressao));
                 end else
                 begin
                     tipovenda := 'VENDA';
                     venda     := IntToStr(DM_Pesq.cdsPesqAuxiliar.FieldByName('id_venda').value);
                     venda     :=  StringOfChar('0',10-Length(venda))+venda;
                 end;

            end;
            //ShowMessage('TIPO DA VENDA : '+tipovenda);
      end;

    {fim definição da VENDA}


    {define o que será impresso no CABEÇALHO}

     _Sql:= 'select * FROM Empresa WHERE id_empresa = 1';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=_Sql;
          Open;

          if not IsEmpty then
          begin

              cpf  := DM_Pesq.cdsPesqGeral.FieldByName('cpf').value;
              cnpj := DM_Pesq.cdsPesqGeral.FieldByName('cnpj').value;
              ie   := DM_Pesq.cdsPesqGeral.FieldByName('ie').value;

              Writeln(arq_impr, ''+DM_Pesq.cdsPesqGeral.FieldByName('razaosocial').value+'');
              Writeln(arq_impr, ''+DM_Pesq.cdsPesqGeral.FieldByName('endereco').value+'');
              Writeln(arq_impr, ''+DM_Pesq.cdsPesqGeral.FieldByName('bairro').value+'-'+DM_Pesq.cdsPesqGeral.FieldByName('uf').value+'');

              //Priorizando impressão do cnpj caso contrário imprime o cpf se não cadastrar nenhum dos dois não imprime nenhum
              if(cnpj <> '00.000.000/0000-00') then
              begin

                  Writeln(arq_impr, ''+DM_Pesq.cdsPesqGeral.FieldByName('cnpj').value+'');

              end else
              if(cpf <> '000.000.000-00') then
              begin

                  Writeln(arq_impr, ''+DM_Pesq.cdsPesqGeral.FieldByName('cpf').value+'');

              end;    

              Writeln(arq_impr, '-----------------------------------------------');
              Writeln(arq_impr, '           DOCUMENTO SEM VALOR FISCAL');
              Writeln(arq_impr, '-----------------------------------------------');
              Writeln(arq_impr, 'ITEM     CODIGO	       DESCRIÇÃO');
              Writeln(arq_impr, '          QTD	        VL.UNIT           TOTAL  ');
              Writeln(arq_impr, '-----------------------------------------------');

          end;

      end;

     {fim definição do que será impresso no CABEÇALHO}


    {define impressão dos ÍTENS DA VENDA}
    cont := 1; //controla o numero dos ítens

   if tipovenda = 'VENDA' then
    begin

       _Sql3:= 'select distinct p.cod_barras,p.descricao,i.* FROM produtos p, ITENS_VENDAS i WHERE i.id_produto=p.id_produto and i.id_venda = :id_da_venda';

    end else if(tipovenda = 'ORCAMENTO') then
    begin

       _Sql3:= 'select * FROM I_ORCAMENTO WHERE orc_id = :id_orc_venda';

    end;
                                                                                     //IntToStr(NumOrcamentoSelecionado)
     with DM_Pesq.cdsPesqAuxiliar do
      begin

        Close;
        CommandText:=_Sql3;

          if tipovenda = 'VENDA' then
          begin

              Params.ParamByName('id_da_venda').AsInteger := idVendaCupom;

          end else if(tipovenda = 'ORCAMENTO') then
          begin

             Params.ParamByName('id_orc_venda').AsInteger := NumOrcamentoSelecionado;

          end;

        Open;


              if tipovenda = 'VENDA' then
              begin

                    if not IsEmpty then
                    begin

                        while not DM_Pesq.cdsPesqAuxiliar.Eof do
                        begin

                           descricao :=  DM_Pesq.cdsPesqAuxiliar.FieldByName('descricao').value;
                           descricao := copy(descricao,1,17); // Limitando a descricao a 17 caracteres

                           Writeln(arq_impr, '  '+IntToStr(cont)+'   '+DM_Pesq.cdsPesqAuxiliar.FieldByName('cod_barras').value+'    '+descricao+'');
                           Writeln(arq_impr, ''+ Transform(DM_Pesq.cdsPesqAuxiliar.FieldByName('quantidade').value)+'  '+ Transform(DM_Pesq.cdsPesqAuxiliar.FieldByName('vl_unitario').value)+'  '+ Transform(DM_Pesq.cdsPesqAuxiliar.FieldByName('vl_totalitem').value)+'');
                           inc(cont);
                           Next;

                        end;
                    end;

              end else if(tipovenda = 'ORCAMENTO') then
              begin

                    if not IsEmpty then
                    begin

                        while not DM_Pesq.cdsPesqAuxiliar.Eof do
                        begin

                           descricao :=  DM_Pesq.cdsPesqAuxiliar.FieldByName('descricao').value;
                           descricao := copy(descricao,1,17); // Limitando a descricao a 17 caracteres

                           Writeln(arq_impr, '  '+IntToStr(cont)+'   0000000000000    '+descricao+'');
                           Writeln(arq_impr, ''+ Transform(DM_Pesq.cdsPesqAuxiliar.FieldByName('quantidade').value)+'  '+ Transform(DM_Pesq.cdsPesqAuxiliar.FieldByName('valor_item').value)+'  '+ Transform(DM_Pesq.cdsPesqAuxiliar.FieldByName('total').value)+'');
                           inc(cont);
                           Next;

                        end;
                    end;

              end;

      end;

    {fim definição da impressão dos ÍTENS DA VENDA}


    {define impressão do TOTAL DA VENDA}

    if tipovenda = 'VENDA' then
    begin

       _Sql4:= 'select vl_desconto, vl_totalpagar, vl_bruto, vl_recebido, vl_troco FROM VENDA WHERE id_venda = :id_da_venda';

    end else if(tipovenda = 'ORCAMENTO') then
    begin

       _Sql4:= 'select vl_desconto, vl_totalpagar, vl_bruto, vl_recebido, vl_troco FROM VENDA WHERE orcamento_id = :id_do_orc';

    end;

    with DM_Pesq.cdsPesqAuxiliar do
      begin

        Close;
        CommandText:=_Sql4;

                  if tipovenda = 'VENDA' then
                  begin

                     Params.ParamByName('id_da_venda').AsInteger := idVendaCupom;

                  end else if tipovenda = 'ORCAMENTO' then
                  begin

                     Params.ParamByName('id_do_orc').AsInteger := idOrcImpressao;

                  end;

        Open;

            if not IsEmpty then
            begin

                  Writeln(arq_impr, '-----------------------------------------------');
                  Writeln(arq_impr, 'TOTAL                        R$ '+ Transform(DM_Pesq.cdsPesqAuxiliar.FieldByName('vl_bruto').value)+'');
                  Writeln(arq_impr, 'DESCONTO                     R$ '+ Transform(DM_Pesq.cdsPesqAuxiliar.FieldByName('vl_desconto').value)+'');
                  Writeln(arq_impr, 'LIQUIDO                      R$ '+ Transform(DM_Pesq.cdsPesqAuxiliar.FieldByName('vl_totalpagar').value)+'');
                  Writeln(arq_impr, 'VALOR PAGO                   R$ '+ Transform(DM_Pesq.cdsPesqAuxiliar.FieldByName('vl_recebido').value)+'');
                  Writeln(arq_impr, 'TROCO                        R$ '+ Transform(DM_Pesq.cdsPesqAuxiliar.FieldByName('vl_troco').value)+'');
                  Writeln(arq_impr, '-----------------------------------------------');

            end;
      end;

    {fim definição da impressão do TOTAL DA VENDA}


    {define o que será impresso no RODAPE}



    if tipovenda = 'VENDA' then
    begin

       Writeln(arq_impr, 'VENDA     : '+venda+'');

    end else if tipovenda = 'ORCAMENTO' then
    begin

       Writeln(arq_impr, 'ORÇAMENTO : '+venda+'');

    end;


    Writeln(arq_impr, 'OPERADOR  : '+retornaPrimeiroNome(NomeDoUsuarioLogado)+'');
    Writeln(arq_impr, '-----------------------------------------------');
    Writeln(arq_impr, 'Obrigado volte sempre!     '+datetostr(now)+'  '+timetostr(now)+'');

    {fim definição do que será impresso no RODAPE}


    {define fechamento do arquivo}
    System.CloseFile(arq_impr);

end;

Function RetornaStatusMenuFinanceiro:string;
begin

     _Sql := 'SELECT status FROM menus WHERE menu = '+QuotedStr('MNUFINANCEIRO');

      with DM_Pesq.Qry_Geral do
      begin
           close;
           sql.Clear;
           sql.Add(_Sql);
           open;

           if not IsEmpty then
           begin
               result := DM_Pesq.Qry_Geral.Fields[0].AsString;
           end else
           begin
               result:='';
           end;
      end;

end;

function sistemaConectadoInternet: Boolean;
var
 Flags : Cardinal;
begin
 // verifica se está conectado a internet usando a API do Windows, é preciso declarar a uses WinInet.
 if not InternetGetConnectedState(@flags, 0) then
    result := false
 else
    result := true;
end;    

function IsNumero(Texto: string): Boolean;
VAR
 i:integer;
begin
result:=False;
  i:=1;
  While i<= Length(Texto) do
    begin
       if not (Texto[i] in ['0'..'9']) Then
          begin
            result:=True;
            Break;
          end;
       i:=i+1;
    end;
end;

procedure formatarRelatoriosDisplay100;
var
  i : integer;
  tBar: TComponent; PrevFrm: TForm;
begin

      //tratando o tamanho dos relatórios ao abrir
      PrevFrm := nil;
      for i := 0 to Screen.FormCount-1 do
      with Screen.Forms[i] do

      if ClassName = 'TQRStandardPreview' then
      PrevFrm := Screen.Forms[i]; // Se não encontrou o Form, abandona

      if PrevFrm = nil then
      Exit;

      tBar := PrevFrm.FindComponent('Zoom100');  // Zoom100 / ZoomFit
      if tBar <> nil then
      TSpeedButton(tBar).Click;
      
end;

function ProdutoConstaDaVendaAtual(idProduto:integer):boolean;
begin

          //Verifica se o produto não consta da venda atual
          _Sql := ('select id_produto from t_itens where id_produto=:pIdProduto');

          with DM_Pesq.Qry_Geral do
          begin

               close;
               sql.Clear;
               sql.Add(_Sql);
               ParamByName('pIdProduto').AsInteger := idProduto;
               open;

               if not IsEmpty then
               begin
                  result:=true;
               end else
               begin
                   result:=false;
               end;
          end;

end;


function ProdutoEmEstoque(id:integer;codbarras,codalt,descricao:string):boolean;
begin

   //verifica se o produto existe no estoque
   with DM_Pesq.Qry_Auxiliar do
   begin

       close;
       SQL.Clear;
       SQL.Add('SELECT * FROM produtos WHERE id_produto=:pId OR cod_barras=:pCodBarras OR cod_alt1=:pCodAlt1 '+
               'OR cod_alt2=:pCodAlt2 OR cod_alt3=:pCodAlt3 OR cod_alt4=:pCodAlt4 OR descricao=:pDesc');
       params.ParamByName('pId')        .AsInteger  := id;
       params.ParamByName('pCodBarras') .AsString   := codbarras;
       params.ParamByName('pCodAlt1')   .AsString   := codalt;
       params.ParamByName('pCodAlt2')   .AsString   := codalt;
       params.ParamByName('pCodAlt3')   .AsString   := codalt;
       params.ParamByName('pCodAlt4')   .AsString   := codalt;
       params.ParamByName('pDesc')      .AsString   := descricao;
       open;

       If not IsEmpty then      //se nao encontrou um produto com o codigo entrado...
             result := true
       else
             result := false;
       end;

end;


Function frenteDeCaixaLiberado : boolean;
begin

     //verifica se frente de caixa esta liberado retornando verdadeiro ou falso
     with DM_Pesq.Qry_Geral do
     begin

         close;
         sql.Clear;
         sql.Add('SELECT * FROM frente_caixa WHERE status = :pStatus');
         Params.ParamByName('pStatus').AsString:= 'L';
         open;

         if not IsEmpty then
         begin

             Result := true;

         end else begin

             Result := false;

         end;

     end;

end;

Function Quebra(input: String; separador: char) : TStringList;
var
    resultado: TStringList;
begin
    resultado               := TStringList.Create;
    resultado.Delimiter     := separador;
    resultado.DelimitedText := input;
    result                  := resultado;
end;  

function DifDiasEntreDatas(data1, data2 : TDate):integer;
begin

  Result := DaysBetween(data1,data2);

end;

Function retornaDiferencaDiasEntreDatas(pDataFinal, pDataInicial : string):integer;
var
   dataFim, dataInicio : string;
begin

      //trabalhando com o numero real do dia
      dataFim    := formatdatetime('dd',StrToDateTime(pDataFinal));
      dataInicio := formatdatetime('dd',StrToDateTime(pDataInicial));

      Result     := (StrToInt(dataFim) - StrToInt(dataInicio));

end;

function ArredondaPraCima(nValor: Double; Casas: Integer): Double;
var
  sValor,
  sDecimais,
  sParteValor,
  sNovoValor,
  sCasas :string;
  Ponto,
  I, UltimoDigito  :Integer;

begin

  //arredonda um float/double no delphi para cima determinando suas casas decimais
  sCasas := '';//zerar a variável que acrescenta as casas decimais
  for I := 1 to Casas do
    sCasas := sCasas + '0';//quantidade de casas decimais passada na função

  Ponto := Pos(',',FormatFloat('0.'+sCasas, nValor));//verifica onde esta a vírgula que separa as casas decimais, de acordo com o parametro de quantidade de casas passado
  sValor := FloatToStr(nValor); //grava o valor numa string para separação das casas decimais
  sDecimais := Trim(Copy(sValor, Ponto + 1, length(sValor)));//pega as casas decimais do jeito que veio sem tratamento
  sParteValor := Trim(Copy(sValor, 1, Ponto - 1));//pegar a parte anterior as casas decimais

  if Length(sDecimais) > Casas then//significa que deu mais doque duas casas decimais depois da vírgula
  begin
    sDecimais  := Trim(Copy(sDecimais ,1 , Casas));//definir a quantidade de casas de acordo com o parametro
    UltimoDigito := StrToInt(Trim(Copy(sDecimais , Length(sDecimais), 1)));//pegar o ultimo digito de casas decimais
    UltimoDigito := UltimoDigito + 1; //como a função mesmo diz, jogar mais um, sempre arredondar o ultimo valor para cima
    sDecimais := Copy(sDecimais, 1, Casas - 1)+IntToStr(UltimoDigito);//jogar o novo ultimo digito calculado somando mais um nos decimais
    sNovoValor := StringReplace(sParteValor,',','',[rfReplaceAll])+','+sDecimais;//define o novo valor gerado
    Result := StrToFloat(sNovoValor);//retornar o novo valor gerado
  end
  else
    Result := nValor;//caso não seja maior, apenas devolver o valor que veio
end;

function RetornaPrimerioUsuario:string;
begin

   with DM_Pesq.Qry_Geral do
     begin

         close;
         sql.Clear;
         sql.Add('SELECT func_login FROM funcionarios WHERE func_id = 2');
         open;

         if not IsEmpty then
         begin

            Result := DM_Pesq.Qry_Geral.fieldbyname('func_login').asstring;

         end else begin

             Result := '';

         end;

     end;
end;

Function RetornarDiferencaEmDiasEntreDatas(data1, data2 : TDateTime):integer;
var
  dt1, dt2 : integer;
begin

     dt1    := retornaDiaPassandoData(data1);
     dt2    := retornaDiaPassandoData(data2);

     result :=  dt2-dt1;

end;


function RetornaDifDiasEntreDatas(DataVenc, DataAtual: TDateTime): Extended;
Var
  Data: TDateTime;
  dia, mes, ano: Word;
begin

    //Retorna a diferenca de dias entre duas datas
		Data := (DataVenc - DataAtual);
		DecodeDate(Data, ano, mes, dia); //DECOMPONDO A DATA
		Result := (Data);

end;

Function EClienteBalcao(idClienteVenda:integer) : boolean;
begin

    if(idClienteVenda = 1)then
    begin
        Result        := true;     //É cliente balcão
        clienteBalcao := true;
    end else
        Result        := false;   //É cliente cadastrado
        clienteBalcao := false;
    
end;


function QtdCaracteres(Edit:String): integer;
begin
   //retorna a quatidade de caracteres de um Tedit
   Result := Length(Edit);
end;


function EliminarFormatacao(sTexto:String):String;
var
   //elimina formatacao de um maskedit
   iPos : Integer;
   iTamanho : Integer;
   sTextoSemFormato : String;
   sCaractere : String;
   sCaracMascaras : String;
begin
   Result := sTexto;
   if Trim(sTexto) = '' then begin
	  Exit;
   end;
   sTextoSemFormato := '';
   sCaracMascaras   := './><_+=[]{}()-$&@*';
   iTamanho := Length(sTexto);
   for iPos := 1 to iTamanho do begin
	   sCaractere := Trim(Copy(sTexto,iPos,1));
	   if (Pos(sCaractere,sCaracMascaras) = 0) AND (sCaractere <> '') then
	   begin
		  sTextoSemFormato := sTextoSemFormato + sCaractere;
	   end;
   end;
   Result := sTextoSemFormato;
end;


Function Criptografar(Action, Src: String): String;
Label Fim;
var KeyLen : Integer;
       KeyPos : Integer;
       OffSet : Integer;
       Dest, Key : String;
       SrcPos : Integer;
       SrcAsc : Integer;
       TmpSrcAsc : Integer;
       Range : Integer;
begin
       {COMO USAR:
        PARA CRIPTOGRAFAR UM TEXTO USE 'C'
        edt_Chave.Text       :=  Criptografar('C',texto);

        PARA DESCRIPTOGRAFAR O TEXTO USE 'D'
        edt_ContraChave.Text :=  Criptografar('D',edt_Chave.Text);
       }

       if (Src = '') Then
       begin
               Result:= '';
               Goto Fim;
       end;
       Key := 'AQUI VOCE CRIA SUA CHAVE PARA CRIPTOGRAFAR';
       Dest := '';
       KeyLen := Length(Key);
       KeyPos := 0;
       //SrcPos := 0;
       //SrcAsc := 0;
       Range := 256;
       if (Action = UpperCase('C')) then
       begin
               Randomize;
               OffSet := Random(Range);
               Dest := Format('%1.2x',[OffSet]);
               for SrcPos := 1 to Length(Src) do
               begin
                       Application.ProcessMessages;
                       SrcAsc := (Ord(Src[srcPos]) + OffSet) Mod 255;
                       if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;

                       SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
                       Dest := Dest + Format('%1.2x',[srcAsc]);
                       OffSet := SrcAsc;
               end;
       end
       Else if (Action = UpperCase('D')) then
       begin
               OffSet := StrToInt('$' + copy(Src,1,2));//<--------------- adiciona o $ entra as aspas simples
               SrcPos := 3;
               repeat
                       SrcAsc := StrToInt('$' + copy(Src,SrcPos,2));//<--------------- adiciona o $ entra as aspas simples
                       if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
                       TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
                       if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
                       else TmpSrcAsc := TmpSrcAsc - OffSet;
                       Dest := Dest + Chr(TmpSrcAsc);
                       OffSet := SrcAsc;
                       SrcPos := SrcPos + 2;
               until (SrcPos >= Length(Src));
       end;
       Result:= Dest;
Fim:
end;

function DeletarPasta(FolderName: String; LeaveFolder: Boolean): Boolean;
var
   r: TshFileOpStruct;
begin

    Result := False;
    if not DirectoryExists(FolderName) then
    Exit;
    if LeaveFolder then
    FolderName := FolderName + ' *.* '
    else
    if FolderName[Length(FolderName)] = ' \ ' then
    Delete(FolderName,Length(FolderName), 1);
    FillChar(r, SizeOf(r), 0);
    r.wFunc := FO_DELETE;
    r.pFrom := PChar(FolderName);
    r.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
    Result := ((ShFileOperation(r) = 0) and (not r.fAnyOperationsAborted));

end;

procedure DeletarArquivosDaPasta(caminho:string);
var
  SR: TSearchRec;
  Diretorio, Arquivo: string;
begin
  //APAGA TODO O CONTEUDO DO DIRETORIO
  //Diretorio := 'C:\Diretorio\';
  Diretorio := caminho;
  if FindFirst(Diretorio + '*.*', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr and faDirectory) <> faDirectory then
      begin
        Arquivo := Diretorio + SR.Name;
        if DeleteFile(PChar(Arquivo)) then
          //ShowMessage('Arquivo excluído:'#13 + Arquivo)
        else
          ShowMessage(SysErrorMessage(GetLastError) + #13#13 + Arquivo);
      end;
    until FindNext(SR) <> 0;
  end;
end;

procedure AvisoTemporario(const m: string; const t: Cardinal=2000);
var
  P: TPoint;
  R: TRect;
  X: integer;
begin
  GetCursorPos(P);
  with THintWindow.Create(Application) do
  try
    Application.HintColor := clSkyBlue;

    { Calcula o retângulo }
    R := CalcHintRect(Screen.Width, m, nil);

    { Centraliza horizontalmente }
    X := R.Right - R.Left + 1;
    R.Left := P.X;
    //R.Left := (Screen.Width - X) div 2;
    R.Right := R.Left + X;

    { Centraliza verticalmente }
    X := R.Bottom - R.Top + 1;
    R.Top := P.Y - X;
    //R.Top := (Screen.Height - X) div 2;
    R.Bottom := R.Top + X;

    { Mostra }
    ActivateHint(R, m);
    Update;

    { Aguarda }
    Sleep(t);
  finally
    Free;
  end;
end;

Function retornaNumMes : integer;
begin

      //retorna o numero do mes corrente
      DataDoDia       := date;
      numMes          := MonthOf(DataDoDia);
      Result          := numMes;

end;

Function retornaDiaPassandoData(data : TDateTime) : integer;
begin

    numDia  := DayOf(data);
    Result  := numDia;

end;

Function retornaNumMesPassandoData(data : TDateTime) : integer;
begin

      numMes     := MonthOf(data); //retorna o numero do mes corrente
      Result     := numMes;

end;

Function retornaAnoPassandoData(data : TDateTime) : string;
begin

      numAnoDataPassada  := IntToStr(YearOf(data));
      Result             := numAnoDataPassada;

end;

Function retornaDataAtualString(data : TDateTime) : string;
begin

     Result := DateToStr(data);

end;

Function retornaNomeMesPassandoData(data : TDateTime) : string;
begin

      numMes          := MonthOf(data); //retorna o numero do mes corrente

      case (numMes) of

        1 : nomeMes := 'JANEIRO';
        2 : nomeMes := 'FEVEREIRO';
        3 : nomeMes := 'MARCO';
        4 : nomeMes := 'ABRIL';
        5 : nomeMes := 'MAIO';
        6 : nomeMes := 'JUNHO';
        7 : nomeMes := 'JULHO';
        8 : nomeMes := 'AGOSTO';
        9 : nomeMes := 'SETEMBRO';
       10 : nomeMes := 'OUTUBRO';
       11 : nomeMes := 'NOVEMBRO';
       12 : nomeMes := 'DEZEMBRO';

      end;

      Result  := nomeMes;

end;

Function gerarMesAnoPassandoData(data : TDateTime) : string;
begin

      numMes := MonthOf(data); //retorna o numero do mes corrente

      case (numMes) of

        1 : nomeMes := 'JAN';
        2 : nomeMes := 'FEV';
        3 : nomeMes := 'MAR';
        4 : nomeMes := 'ABR';
        5 : nomeMes := 'MAI';
        6 : nomeMes := 'JUN';
        7 : nomeMes := 'JUL';
        8 : nomeMes := 'AGO';
        9 : nomeMes := 'SET';
       10 : nomeMes := 'OUT';
       11 : nomeMes := 'NOV';
       12 : nomeMes := 'DEZ';

      end;

      mes_ano := nomeMes+'/'+IntToStr(YearOf(data));
      Result  := mes_ano;

end;

Function gerarMesAno : string;
begin

      DataDoDia       := date;
      numMes          := MonthOf(DataDoDia); //retorna o numero do mes corrente

      case (numMes) of

        1 : nomeMes := 'JAN';
        2 : nomeMes := 'FEV';
        3 : nomeMes := 'MAR';
        4 : nomeMes := 'ABR';
        5 : nomeMes := 'MAI';
        6 : nomeMes := 'JUN';
        7 : nomeMes := 'JUL';
        8 : nomeMes := 'AGO';
        9 : nomeMes := 'SET';
       10 : nomeMes := 'OUT';
       11 : nomeMes := 'NOV';
       12 : nomeMes := 'DEZ';

      end;

      mes_ano := nomeMes + '/' +  IntToStr(YearOf(DataDoDia));

      Result  := mes_ano;

end;


Function retornarNomeMes(numMes:integer) : string;
begin

      case (numMes) of

        1 : nomeMes := 'JANEIRO';
        2 : nomeMes := 'FEVEREIRO';
        3 : nomeMes := 'MARÇO';
        4 : nomeMes := 'ABRIL';
        5 : nomeMes := 'MAIO';
        6 : nomeMes := 'JUNHO';
        7 : nomeMes := 'JULHO';
        8 : nomeMes := 'AGOSTO';
        9 : nomeMes := 'SETEMBRO';
       10 : nomeMes := 'OUTUBRO';
       11 : nomeMes := 'NOVEMBRO';
       12 : nomeMes := 'DEZEMBRO';

      end;

      mes_ano := nomeMes;

      Result  := mes_ano;

end;

Function TemEmpresaCadastrada:boolean;
begin

     with DM_Pesq.Qry_Geral do
     begin

         close;
         sql.Clear;
         sql.Add('SELECT id_empresa FROM empresa');
         open;

         if not IsEmpty then
         begin

            Result := true;

         end else begin

             Result := false;

         end;

     end;

end;

Function CarregarImagem(descricao:string):String;
begin
      DM_PESQDADOS.cdsPesqConfiguracoes.Active := true;

      _Sql := 'SELECT config_descricao, config_endereco FROM configuracoes WHERE config_descricao = :pDesc';

      with DM_PESQDADOS.cdsPesqConfiguracoes do
      begin

          Close;
          CommandText:=(_Sql);
          Params.ParamByName('pDesc').AsString:= descricao;
          Open;

          if IsEmpty then begin

             //Application.MessageBox('Nenhuma empresa cadastrada no momento!!',
             //'Atenção...', MB_OK + MB_ICONWARNING);

          end else begin

             Result := DM_PESQDADOS.cdsPesqConfiguracoes.fieldbyname('config_endereco').AsString;

          end;

      end;

end;

Function RetornarCaminhoDaAplicacao : string;
begin

      _Sql := 'SELECT caminho_aplicacao FROM expiracao WHERE id_dia=1';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Open;

          if IsEmpty then begin

             //Application.MessageBox('Nenhuma empresa cadastrada no momento!!',
             //'Atenção...', MB_OK + MB_ICONWARNING);

          end else begin

             Result := DM_Pesq.cdsPesqGeral.fields[0].AsString;

          end;

      end;

end;


Function RetornarDataExpiracao : string;
begin

      _Sql := 'SELECT DT_EXPIRACAO FROM expiracao WHERE id_dia=1';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Open;

          if IsEmpty then begin

             //Application.MessageBox('Nenhuma empresa cadastrada no momento!!',
             //'Atenção...', MB_OK + MB_ICONWARNING);

          end else begin

             Result := datetostr(DM_Pesq.cdsPesqGeral.fields[0].asDateTime);

          end;

      end;

end;

Function RetornarInicioDegustacao : string;
begin

      _Sql := 'SELECT DT_INICIO_DEGUSTACAO FROM expiracao WHERE id_dia=1';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Open;

          if IsEmpty then begin

             //Application.MessageBox('Nenhuma empresa cadastrada no momento!!',
             //'Atenção...', MB_OK + MB_ICONWARNING);

          end else begin

             Result := datetostr(DM_Pesq.cdsPesqGeral.fields[0].asDateTime);

          end;

      end;

end;

Function RetornarFimDegustacao : string;
begin

      _Sql := 'SELECT DT_FIM_DEGUSTACAO FROM expiracao WHERE id_dia=1';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Open;

          if IsEmpty then begin

             //Application.MessageBox('Nenhuma empresa cadastrada no momento!!',
             //'Atenção...', MB_OK + MB_ICONWARNING);

          end else begin

             Result := datetostr(DM_Pesq.cdsPesqGeral.fields[0].asDateTime);

          end;

      end;

end;

Function RetornarDataInstalacao : string;
begin

      _Sql := 'SELECT DT_INSTALACAO FROM expiracao WHERE id_dia=1';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Open;

          if IsEmpty then begin

             //Application.MessageBox('Nenhuma empresa cadastrada no momento!!',
             //'Atenção...', MB_OK + MB_ICONWARNING);

          end else begin

             Result := datetostr(DM_Pesq.cdsPesqGeral.fields[0].asDateTime);

          end;

      end;

end;

Function RetornarDataLiberacao : string;
begin

      _Sql := 'SELECT DT_LIBERACAO FROM expiracao WHERE id_dia=1';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Open;

          if IsEmpty then begin

             //Application.MessageBox('Nenhuma empresa cadastrada no momento!!',
             //'Atenção...', MB_OK + MB_ICONWARNING);

          end else begin

             Result := datetostr(DM_Pesq.cdsPesqGeral.fields[0].asDateTime);

          end;

      end;

end;

Function RetornarCaminhoBanco: String;
begin

      _Sql := 'SELECT caminho_banco FROM expiracao WHERE id_dia=1';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Open;

          if IsEmpty then begin

             //Application.MessageBox('Nenhuma empresa cadastrada no momento!!',
             //'Atenção...', MB_OK + MB_ICONWARNING);

          end else begin

             Result := DM_Pesq.cdsPesqGeral.fields[0].AsString;

          end;

      end;

end;

Function RetornarCaminhoImgPadrao: String;
begin

      _Sql := 'SELECT caminho_imgpadrao FROM expiracao WHERE id_dia=1';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Open;

          if IsEmpty then begin

             //Application.MessageBox('Nenhuma empresa cadastrada no momento!!',
             //'Atenção...', MB_OK + MB_ICONWARNING);

          end else begin

             Result := DM_Pesq.cdsPesqGeral.fields[0].AsString;

          end;

      end;

end;

Function RetornarCaminhoImgTelaInicial: String;
begin

      _Sql := 'SELECT CAMINHO_TELAINICIAL FROM expiracao WHERE id_dia=1';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Open;

          if IsEmpty then begin

             //Application.MessageBox('Nenhuma empresa cadastrada no momento!!',
             //'Atenção...', MB_OK + MB_ICONWARNING);

          end else begin

             Result := DM_Pesq.cdsPesqGeral.fields[0].AsString;

          end;

      end;

end;

Function RetornarCaminhoPastaBackup : string;
begin

     _Sql := 'SELECT CAMINHO_BACKUP FROM expiracao WHERE id_dia=1';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Open;

          if IsEmpty then begin

             //Application.MessageBox('Nenhuma empresa cadastrada no momento!!',
             //'Atenção...', MB_OK + MB_ICONWARNING);

          end else
          begin

             Result := DM_Pesq.cdsPesqGeral.fields[0].AsString;

          end;

      end;

end;

Function RetornarCaminhoImgCodBarras : String;
begin

      _Sql := 'SELECT CAMINHO_IMGCODBARRAS FROM expiracao WHERE id_dia=1';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Open;

          if IsEmpty then begin

             //Application.MessageBox('Nenhuma empresa cadastrada no momento!!',
             //'Atenção...', MB_OK + MB_ICONWARNING);

          end else begin

             Result := DM_Pesq.cdsPesqGeral.fields[0].AsString;

          end;

      end;

end;

Function SistemaLiberado : boolean;
begin

    //se a data de liberacao for = 01/01/2000 o sistema não esta liberado
    if(RetornarDataLiberacao = '01/01/2000')then
         result := false
    else
         result := true;

end;


Function RetornarContraChave : string;
begin

      _Sql := 'SELECT CONTRA_CHAVE FROM expiracao WHERE id_dia=1';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Open;

          if IsEmpty then begin

             //Application.MessageBox('Nenhuma empresa cadastrada no momento!!',
             //'Atenção...', MB_OK + MB_ICONWARNING);

          end else begin

             Result := DM_Pesq.cdsPesqGeral.fields[0].AsString;

          end;

      end;

end;


Function CarregarLogoEmpresa: String;
begin
      dm_DadosSegundo.cds_Empresa.Active := true;

      _Sql := 'SELECT logo FROM empresa';

      with dm_DadosSegundo.cds_Empresa do
      begin

          Close;
          CommandText:=(_Sql);
          Open;

          if IsEmpty then begin

             //Application.MessageBox('Nenhuma empresa cadastrada no momento!!',
             //'Atenção...', MB_OK + MB_ICONWARNING);

          end else begin

             Result := dm_DadosSegundo.cds_Empresa.fieldbyname('logo').AsString;

          end;
      end;
end;

Function getLogoEmpresa : String;
begin
//verificar se o arquivo da logo existe caso contrario mostrar a logo padrao

   if FileExists(CarregarLogoEmpresa) then
   begin
       //ShowMessage('O Arquivo existe.');
       Result := CarregarLogoEmpresa;
  end else
  begin
       //ShowMessage('O Arquivo não existe sera mostrado a imagem padrao edsof');
       atualizarUmCampoDaTabela('empresa','logo',RetornarCaminhoImgPadrao,'id_empresa','1','string');
       Result := RetornarCaminhoImgPadrao;
  end;

end;

Function retornaTotalPalavras(str : string) : integer;
var
  count : integer;
  i : integer;
  len : integer;
begin
  len := length(str);
  count := 0;
  i := 1;
  while i <= len do begin
    while ((i <= len) and ((str[i] = #32) or (str[i] = #9) or (Str[i] = ';'))) do
    inc(i);
    if i <= len then
    inc(count);
    while ((i <= len) and ((str[i] <> #32) and (str[i] <> #9) and (Str[i] <> ';'))) do
    inc(i);
    end;
    retornaTotalPalavras := count;
end;


Function GerarSigla(nomeEmpresa : string): string;
var
   primeiroNome,segundoNome,sSigla : string;
begin
      //retorna primeira letra do primeiro nome
      primeiroNome := retornaPrimeiroNome(nomeEmpresa);

      //retorna primeira letra do segundo nome
      segundoNome  := retornaSegundoNome(nomeEmpresa);

      //sigla = união das duas letras
      sSigla       := copy(primeiroNome,1,1) + copy(segundoNome,1,1);
      Result       := sSigla;
      
end;

procedure GerarNovaSigla;
var
   primeiroNome,segundoNome,sRazaoSocial,sSigla : string;
begin

     {esta função só deverá ser utilizada para uma possível falha na geração da sigla inicial depois do cadastro já feito
     GERA SIGLA}
     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT razaosocial FROM empresa WHERE id_empresa = 1');
          open;

          if not IsEmpty then
          begin
             sRazaoSocial := DM_Pesq.Qry_Geral.fields[0].asString;
          end;

     end;

      primeiroNome := retornaPrimeiroNome(sRazaoSocial);
      segundoNome  := retornaSegundoNome(sRazaoSocial);
      sSigla       := copy(primeiroNome,1,1) + copy(segundoNome,1,1);

      //GRAVA NOVA SIGLA GERADA
      with DM_Pesq.Qry_Auxiliar do
      begin

          close;
          sql.Clear;
          sql.Add('UPDATE empresa SET sigla=:pSigla WHERE id_empresa = 1');
          Params.ParamByName('pSigla').AsString := sSigla;
          ExecSQL;

      end;

end;

function NaoTemSigla : boolean;
begin

     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT sigla FROM empresa WHERE sigla = :pSigla AND id_empresa = 1');
          params.ParamByName('pSigla').AsString:= '';
          open;

          if not IsEmpty then
          begin
             result := true;
          end else
          begin
              result := false;
          end;
     end;

end;

Function GerarStaff : string;
var
   ultimoLogin, proximoLogin, sNumeroLogin, sSigla : string;
   iNumeroLogin, totalRegs : integer;
begin

     totalRegs := retornaQuantidadeRegsTabela('func_id','funcionarios');

     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT sigla FROM empresa WHERE id_empresa = 1');
          open;

          if not IsEmpty then
          begin

            sSigla := DM_Pesq.Qry_Geral.fields[0].asString;

          end;
     end;


    if(totalRegs = 1)then
    begin
       //VAI NA TABELA DE FUNCIONARIOS NO CAMPO FUNC_LOGIN E VERIFICA QUAL É O ULTIMO STAFF EX: RF001 e gera o proximo STAFF RF002
       //SEPARAR O RF E ACRESCENTAR O NUMERO DE 001 a 100

        Result := sSigla+'0001';

    end else if(totalRegs > 1)then
    begin

        with DM_Pesq.Qry_Geral do
         begin
              close;
              sql.Clear;
              sql.Add('SELECT func_login FROM funcionarios WHERE func_id = (select max(func_id) from funcionarios)');
              open;

              if not IsEmpty then
              begin

                  ultimoLogin := DM_Pesq.Qry_Geral.Fields[0].AsString;

                  //retirar somente os numeros da string / acrescentar um a numero e devolver com string para completar a string denominada proximoLogin abaixo
                  sNumeroLogin := SoNumeros(ultimoLogin);

                  iNumeroLogin  := (StrToInt(sNumeroLogin)+1);
                  //ShowMessage('numero '+IntToStr(iNumeroLogin));

                  if((iNumeroLogin > 1) and (iNumeroLogin < 10))then
                  begin
                    proximoLogin:= sSigla+'000'+ IntToStr(iNumeroLogin);
                  end else if((iNumeroLogin = 10) or (iNumeroLogin < 99)) then
                  begin
                    proximoLogin:= sSigla+'00'+ IntToStr(iNumeroLogin);
                  end else if((iNumeroLogin = 100) or (iNumeroLogin <= 999))then
                  begin
                    proximoLogin:= sSigla+'0'+ IntToStr(iNumeroLogin);
                  end else if (iNumeroLogin > 999)then
                  begin
                    proximoLogin:= sSigla + IntToStr(iNumeroLogin);
                  end;
                  Result := proximoLogin;
                  
              end else begin

                  ultimoLogin := '';
                  Result      := ultimoLogin;

              end;

           end;

    end;
end;

procedure ApagarTabela(tabela:string);
begin

     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('DELETE FROM '+tabela+'');
          ExecSQL;
     end;

end;

Function retornaQuantidadeRegsTabela(campoID,tabela:string):integer;
var
  total:integer;
begin
     total := 0;
     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT '+campoID+' FROM '+tabela+'');
          open;

          if not IsEmpty then
          begin
             total := DM_Pesq.Qry_Geral.RecordCount;
          end;
     end;
     Result := total;
end;

Function retornaQuantidadeRegsUserLogado(campoID,campoIdUSER,idUsuarioLogado,tabela:string):integer;
var
  total:integer;
begin
     total := 0;
     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT '+campoID+' FROM '+tabela+' WHERE '+campoIdUSER+'='+idUsuarioLogado+'');
          open;

          if not IsEmpty then
          begin
             total := DM_Pesq.Qry_Geral.RecordCount;
          end;
     end;
     Result := total;
end;

Function retornaQuantidadeRegsAtivosTabela(campoID,tabela,campoStatus:string):integer;
var
  total:integer;
begin
     total := 0;
     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT '+campoID+' FROM '+tabela+' WHERE '+campoStatus+' = '+QuotedStr('A')+'');
          open;

          if not IsEmpty then
          begin
             total := DM_Pesq.Qry_Geral.RecordCount;
          end;
     end;
     Result := total;
end;

Function retornaPrimeiroNome(texto: string): string;
var
   inicio, fim  : integer;
   resultado    : string;
begin
     inicio    := 0;
     fim       := pos(' ',texto)-1;        //determina que o tamanho da string sera 3 => do quarto caracter que é ' ' menos 1
     resultado := copy(texto,inicio,fim);  //o copy quer dizer copie da string texto / a partir da posicao zero 4 (o pos me retorna a posicao do espaço que é a 4)caracteres -1 ou seja 3
     Result    := resultado;
end;

Function retornaSegundoNome(texto: string): string;
var res :  TStringList;
begin

     res        :=  Quebra(texto,' ');
     sResultado := res[1];
     Result     := sResultado;

end;

Function retornaPrimeiroESegundoNome(texto: string): string;
var
  primeiroNome,segundoNome : String;
begin
     primeiroNome := retornaPrimeiroNome(texto);
     segundoNome  := retornaSegundoNome(texto);
     Result       := primeiroNome+' '+segundoNome;
end;

Function retornaPrimeiroUltimoNome(texto: String): String;
var
  retorno : String;
begin

  //funcao retorna o primeiro e ultimo nome dentro de uma string (EDI AQUINO DE SOUZA -> EDI SOUZA

  retorno := ' ';
  //até aqui o retorno é do primeiro nome EDI
  retorno := copy(texto,0,pos(' ',texto)-1);

  //aqui o retorna o ultimo nome SOUZA
  retorno := retorno + ' ' + copy(texto,LastDelimiter(' ',texto),length(texto) - LastDelimiter(' ',texto) + 1);

  Result := retorno;

end;


Function TabelaEstaVazia(tabela:String):Boolean;
begin

     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT * FROM '+tabela);
          open;

          if IsEmpty then
          begin

              Result := true;

          end else begin

              Result := false;

          end;

     end;

end;

Function TemInativos(tabela, campoStatus:String):Boolean;
begin

     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT '+campoStatus+' FROM '+tabela+' WHERE '+campoStatus+' = '+QuotedStr('I')+' ');
          open;

          if not IsEmpty then
          begin

              Result := true;

          end else begin

              Result := false;

          end;

     end;

end;

Function TemOrcamentoDesaprovado:Boolean;
begin

     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT status FROM orcamento WHERE status = '+QuotedStr('DESAPROVADO')+' ');
          open;

          if not IsEmpty then
          begin

              Result := true;

          end else begin

              Result := false;

          end;

     end;

end;

Function TemOrcamentosFinalizados(idCliente:integer):Boolean;
begin

     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT STATUS FROM ORCAMENTO WHERE STATUS = '+QuotedStr('FINALIZADO')+' AND ID_CLIENTE = '+IntToStr(idCliente));
          open;

          if not IsEmpty then
          begin

              Result := true;

          end else begin

              Result := false;

          end;

     end;

end;

Function TemUmOrcamentoFinalizado:Boolean;
begin

     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT STATUS FROM ORCAMENTO WHERE STATUS = '+QuotedStr('FINALIZADO')+'');
          open;

          if not IsEmpty then
          begin

              Result := true;

          end else begin

              Result := false;

          end;

     end;

end;

function retornarNomeBancoSetado(path:string):string;
begin

  //ex: path = C:\Meus Documentos\Bancos_De_Projetos\SysPdv\SYSPDV.FDB  => de 1 a 45 caracteres C:\Meus Documentos\Bancos_De_Projetos\SysPdv\ => deletar vai ficar SYSPDV.FDB
  sNomeBanco := path;
  delete(sNomeBanco,1,45);
  Result     := sNomeBanco;

end;

procedure gravarNovoBancoSetado(path:string);
begin

     _Sql :='UPDATE expiracao SET caminho_banco = :pCaminho WHERE id_dia = 1';

     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add(_Sql);
          Params.ParamByName('pCaminho').AsString := path;
          ExecSQL;

     end;

end;

procedure CentralizarDigitacao(edit:TEdit);
var
    vl_label : TLabel; //variável do tipo Label
begin
      //CENTRALIZANDO A DIGITAÇÃO DO EDIT DA SENHA
      vl_label := TLabel.Create(nil); //criamos um label

      with vl_label do
      begin

          //pegamos a fonte usada no edit
          Font.Name := TEdit(edit).Font.Name;

          //pegamos o conteúdo do edit
          Caption   := TEdit(edit).Text;

         //centraliza no label e retorna para o edit
          SendMessage(TEdit(edit).Handle, EM_SETMARGINS, EC_LEFTMARGIN,
          (TEdit(edit).Width-vl_label.Width) div 2);

      end;

      vl_label.Free;

end;

procedure atualizarUmCampoDaTabela(tabela,campo,valor,campoId,valorId,tipoDado:string);
var
   tipoDadoGravar : variant;
begin

     if tipoDado = 'string' then
     begin
         tipoDadoGravar :=  valor;
     end else if tipoDado = 'data' then
     begin
        tipoDadoGravar := StrToDate(valor);
     end else if tipoDado = 'integer' then
     begin
        tipoDadoGravar :=  valor;
     end;

     _Sql :='UPDATE '+tabela+' SET '+campo+' = :pValor WHERE '+campoId+' = :pCampoId';

     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add(_Sql);
          Params.ParamByName('pValor').value       := tipoDadoGravar;
          Params.ParamByName('pCampoId').AsInteger := StrToInt(valorId);
          try
            ExecSQL;
          Except
            texto:= 'Não foi possível gravar as alterações no banco de dados, favor verificar os dados passados!';
            Application.MessageBox(PChar(texto),'Erro ao tentar gravar dados no banco!',MB_OK + MB_ICONEXCLAMATION);
          end;

     end;

end;

function ItemEncontradoNoListBox(listBox:TListBox; item:string):boolean;
var I:integer;
begin

       I := Pos(item,listBox.Items.Text);

       if(I > 0)then
          result := true
       else
          result := false;

end;

function ItemDuplicadoNaVenda(pProduto: string): boolean;
begin

     _Sql :='SELECT produto FROM t_itens WHERE produto = :pDesc';

     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add(_Sql);
          Params.ParamByName('pDesc').AsString    := pProduto;
          try
            Open;
            if not IsEmpty then
            begin
                result := true;
            end else
            begin
                result := false;
            end;
          Except
            texto:= 'Não foi possível pesquisar no banco de dados, favor verificar os dados passados!';
            Application.MessageBox(PChar(texto),'Erro ao tentar pesquisar dados no banco!',MB_OK + MB_ICONEXCLAMATION);
            result := false;
          end;
     end;

end;


Function ObterQtdeOcorrencias(MeuTexto: String): Integer;
var
   Lista: TStringList;
begin

  //Result := 0;
  
  try
    Lista := TStringList.Create;
    // Note que agora o separador é o caracter '/' que irá separar as ocorrencias
    Result := ExtractStrings(['/'],[' '],PChar(MeuTexto), Lista);     
  finally
    FreeAndNil(Lista);
  end;

end;    

Function ContaChar(texto,caracter:string):integer;
var
tm,i,qtd:integer;
begin
    //esta função conta quantas vezes aparece um caracter em uma string => ContaChar(edtPrazo.text,'/')
    tm := length(texto);
    qtd:=0;
    for i:=1 to tm do
    if copy(texto,i,1)=caracter then
    qtd:=qtd+1;
    result:= qtd;
end;

Function NumeroPar(aNum: Integer): Boolean;
begin
  //esta função retorna se um numero é par caso contrário será impar
  Result := ((aNum div 2) = (aNum/2));

end ;

Function PedidoAberto(NumPedido:integer):boolean;
begin
     //verifica se determinado pedido encontra-se aberto para bloqueio de exclusão acidental
     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT id_pedido FROM c_pedido WHERE id_pedido = :pIDPedido AND status='+QuotedStr('A')+'');
          Params.ParamByName('pIDPedido').AsInteger := NumPedido;
          open;

          if not IsEmpty then
          begin

              Result := true;

          end else begin

              Result := false;

          end;

     end;

end;

Function AgendamentoAberto(NumAgendamento:integer):boolean;
begin
     //verifica se determinado agendamento encontra-se aberto para bloqueio de exclusão acidental
     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT agenda_id FROM agenda WHERE agenda_id = :pIDAgenda AND status='+QuotedStr('ABERTO')+'');
          Params.ParamByName('pIDAgenda').AsInteger := NumAgendamento;
          open;

          if not IsEmpty then
          begin

              Result := true;

          end else begin

              Result := false;

          end;

     end;

end;

procedure DeletarRegistroPeloID(tabela:string;idProduto:integer);
begin

     //verifica se determinado pedido tem ítens cadastrados
     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('DELETE FROM t_itens WHERE id_produto = :pIDProduto');
          Params.ParamByName('pIDProduto').AsInteger := idProduto;
          ExecSQL;

     end;

end;


Function PedidoTemItens(NumPedido:integer):boolean;
begin
     //verifica se determinado pedido tem ítens cadastrados
     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT pedido_id FROM i_pedido WHERE pedido_id = :pIDPedido');
          Params.ParamByName('pIDPedido').AsInteger := NumPedido;
          open;

          if not IsEmpty then
          begin

              Result := true;

          end else begin

              Result := false;

          end;

     end;

end;

Function TemImpressoraDefinida : boolean;
begin
     //verifica se tem uma impressora padrão definida
     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT id_tipo FROM TIPOIMPRESSORA');
          open;

          if not IsEmpty then
          begin

              Result := true;

          end else
          begin

              Result := false;

          end;

     end;

end;

function getImpressoraSetada : string;
begin

    Result :=  retornarTipoImpressora;

end;

Function retornarTipoImpressora : string;
begin
     //retorna o tipo da impressora padrão definida
     with DM_Pesq.Qry_Geral do
     begin
          close;
          sql.Clear;
          sql.Add('SELECT * FROM TIPOIMPRESSORA WHERE id_tipo = 1');
          open;

          if not IsEmpty then
          begin

              Result := DM_Pesq.Qry_Geral.FieldByName('tipo').Value;
              getTipoImpressoraDefinida  := Result;

          end else begin

              Result := '';

          end;

     end;

end;


procedure GravarEscolhaImpressora(tipo:string);
begin

     IdGeral := GerarProximoID('id_tipo','tipoimpressora');

     _Sql := 'insert into tipoimpressora (id_tipo, tipo) values (:id, :tipo)';

     with DM_Pesq.cdsPesqGeral do
      begin

           close;
           CommandText:=(_Sql);
           Params.ParamByName('id').AsInteger  :=  IdGeral;
           Params.ParamByName('tipo').AsString :=  tipo;
           execute;

      end;

end;

procedure AlterarEscolhaImpressora(tipo:string);
begin

     _Sql := 'update tipoimpressora set tipo = :ptipo where id_tipo = 1';

     with DM_Pesq.cdsPesqAuxiliar do
      begin

           close;
           CommandText:=(_Sql);
           Params.ParamByName('ptipo').AsString :=  tipo;
           execute;

      end;

end;



function GerarProximoID(nomeCampoID, nomeTabela: string): integer;
begin
     //esta funcão gera um número de id para o proximo registro da tabela que for passada
     With DM_Pesq.Qry_Geral do
     begin
          Close;
          Sql.Clear;
          sql.Add('select max('+nomeCampoID+') from '+nomeTabela);
          Open;

          if not IsEmpty then
          begin
             Result  := DM_Pesq.Qry_Geral.Fields[0].AsInteger + 1;
             proxNum := Result;

          end else
          begin
             Result  := 0;

          end;
      end;

end;


Function ListaQdeRegs(cds: TClientDataSet):integer;
begin

     qde    := cds.RecordCount;
     result := qde;
     cds.Last;

end;

procedure VerificarSeTabelaVazia(cds: TClientDataSet; botao1:TSpeedButton; botao2:TSpeedButton);
begin

     if ( cds.RecordCount = 0 ) then
     begin

        botao1.Enabled := false;
        botao2.Enabled := false;

     end;

end;


procedure FiltrarPorNome(cds: TClientDataSet; tabela: string; campoFiltro: string; NomeDoEdit: TEdit);
begin

     with cds do
     begin

          Close;
          CommandText := ('SELECT * FROM '+tabela+' WHERE '+campoFiltro+' LIKE :pParam Order by '+campoFiltro);
          Params.ParamByName('pParam').AsString := '%'+(NomeDoEdit.Text)+'%';
          Open;

      end;

end;

procedure MensagemBtnOk(msg:string; titulo:string);
begin

    Application.MessageBox(PChar(msg), PChar(titulo), MB_OK);

end;

Function LetrasIniciaisMaiusculas(Texto:String): String;
begin

     //CONVERTE SOMENTE A PRIMEIRA LETRA DA STRING EM MAIÚSCULA
     if Texto <> '' then
     begin

         Texto := AnsiUpperCase(Copy(Texto,1,1))+AnsiLowerCase(Copy(Texto,2,Length(Texto)));
         Result := Texto;
         
     end;

end;

function TodasLetrasIniciaisEmMaiusculas(Str: string): string;
var
  i: integer;
  esp: boolean;
begin
  str := LowerCase(Trim(str));
  for i := 1 to Length(str) do
  begin
    if i = 1 then
      str[i] := UpCase(str[i])
    else
      begin
        if i <> Length(str) then
        begin
          esp := (str[i] = ' ');
          if esp then
            str[i+1] := UpCase(str[i+1]);
        end;
      end;
  end;
  Result := Str;
end;


Procedure LogOperacoes(usuario : string; ocorrencia : string);
var
 data : string;
 hora : string;
begin

      data       := dateToStr(now);
      hora       := TimeToStr(time);

      ocorrencia := 'Usuario '+usuario+' registrou : '+ocorrencia+ ' em '+data+' as '+hora+'';

      With DM_Pesq.qry_Cod do begin

        Close;
        SQL.Clear;
        SQL.Add('select max(idoperacao) from log_operacoes');
        Open;

        if not IsEmpty then
        begin

           proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger+1;

        end;

      end;

     dm_DadosSegundo.cds_LogOperacoes.Active := TRUE;
     with dm_DadosSegundo.cds_LogOperacoes do
     begin

        Append;
        FieldByName('idOperacao').AsInteger  := proxNum;
        FieldByname('ocorrencia').AsString   := ocorrencia;
        FieldByname('data').AsDateTime       := date;
        ApplyUpdates(0);

     end;

end;


Function MostrarMesEAno(nomeEditComData:string):string;
var
  iMes       : word;
  sMes, sAno : string;
begin                               
       //utilize assim:  MostrarMesEAno(dtDataDoDia.Text);

       sMes := copy(nomeEditComData,4,2);
       sAno := copy(nomeEditComData,7,4);

       iMes := StrToInt(sMes);

       case iMes of

           1:  nomeMes :=  'JAN';
           2:  nomeMes :=  'FEV';
           3:  nomeMes :=  'MAR';
           4:  nomeMes :=  'ABR';
           5:  nomeMes :=  'MAI';
           6:  nomeMes :=  'JUN';
           7:  nomeMes :=  'JUL';
           8:  nomeMes :=  'AGO';
           9:  nomeMes :=  'SET';
           10: nomeMes :=  'OUT';
           11: nomeMes :=  'NOV';
           12: nomeMes :=  'DEZ';

        end;

        result  :=  nomeMes + '/' + sAno;
        mes_ano := result;

end;

function RetiraPonto(S: string): Double;
begin

    S := StringReplace(S, ThousandSeparator,'' , [rfReplaceAll]);
    S := StringReplace(S, CurrencyString, '', [rfReplaceAll]);
    Result := StrToFloat(S);

end;

function valorPorExtenso(vlr: real): string;
const
  unidade: array[1..19] of string = ('um', 'dois', 'três', 'quatro', 'cinco',
             'seis', 'sete', 'oito', 'nove', 'dez', 'onze',
             'doze', 'treze', 'quatorze', 'quinze', 'dezesseis',
             'dezessete', 'dezoito', 'dezenove');
  centena: array[1..9] of string = ('cento', 'duzentos', 'trezentos',
             'quatrocentos', 'quinhentos', 'seiscentos',
             'setecentos', 'oitocentos', 'novecentos');
  dezena: array[2..9] of string = ('vinte', 'trinta', 'quarenta', 'cinquenta',
             'sessenta', 'setenta', 'oitenta', 'noventa');
  qualificaS: array[0..4] of string = ('', 'mil', 'milhão', 'bilhão', 'trilhão');
  qualificaP: array[0..4] of string = ('', 'mil', 'milhões', 'bilhões', 'trilhões');
var
                        inteiro: Int64;
                          resto: real;
  vlrS, s, saux, vlrP, centavos: string;
     n, unid, dez, cent, tam, i: integer;
                    umReal, tem: boolean;
begin
  if (vlr = 0)
     then begin
            valorPorExtenso := 'zero';
            exit;
          end;
 
  inteiro := trunc(vlr); // parte inteira do valor
  resto := vlr - inteiro; // parte fracionária do valor
  vlrS := inttostr(inteiro);
  if (length(vlrS) > 15)
     then begin
            valorPorExtenso := 'Erro: valor superior a 999 trilhões.';
            exit;
          end;
 
  s := '';
  centavos := inttostr(round(resto * 100));
 
// definindo o extenso da parte inteira do valor
  i := 0;
  umReal := false; tem := false;
  while (vlrS <> '0') do
  begin
    tam := length(vlrS);
// retira do valor a 1a. parte, 2a. parte, por exemplo, para 123456789:
// 1a. parte = 789 (centena)
// 2a. parte = 456 (mil)
// 3a. parte = 123 (milhões)
    if (tam > 3)
       then begin
              vlrP := copy(vlrS, tam-2, tam);
              vlrS := copy(vlrS, 1, tam-3);
            end
    else begin // última parte do valor
           vlrP := vlrS;
           vlrS := '0';
         end;
    if (vlrP <> '000')
       then begin
              saux := '';
              if (vlrP = '100')
                 then saux := 'cem'
              else begin
                     n := strtoint(vlrP);        // para n = 371, tem-se:
                     cent := n div 100;          // cent = 3 (centena trezentos)
                     dez := (n mod 100) div 10;  // dez  = 7 (dezena setenta)
                     unid := (n mod 100) mod 10; // unid = 1 (unidade um)
                     if (cent <> 0)
                        then saux := centena[cent];
                     if ((dez <> 0) or (unid <> 0))
                        then begin
                               if ((n mod 100) <= 19)
                                  then begin
                                         if (length(saux) <> 0)
                                            then saux := saux + ' e ' + unidade[n mod 100]
                                         else saux := unidade[n mod 100];
                                       end
                               else begin
                                      if (length(saux) <> 0)
                                         then saux := saux + ' e ' + dezena[dez]
                                      else saux := dezena[dez];
                                      if (unid <> 0)
                                         then if (length(saux) <> 0)
                                                 then saux := saux + ' e ' + unidade[unid]
                                              else saux := unidade[unid];
                                    end;
                             end;
                   end;
              if ((vlrP = '1') or (vlrP = '001'))
                 then begin
                        if (i = 0) // 1a. parte do valor (um real)
                           then umReal := true
                        else saux := saux + ' ' + qualificaS[i];
                      end
              else if (i <> 0)
                      then saux := saux + ' ' + qualificaP[i];
              if (length(s) <> 0)
                 then s := saux + ', ' + s
              else s := saux;
            end;
    if (((i = 0) or (i = 1)) and (length(s) <> 0))
       then tem := true; // tem centena ou mil no valor
    i := i + 1; // próximo qualificador: 1- mil, 2- milhão, 3- bilhão, ...
  end;
 
  if (length(s) <> 0)
     then begin
            if (umReal)
               then s := s + ' real'
            else if (tem)
                    then s := s + ' reais'
                 else s := s + ' de reais';
          end;
// definindo o extenso dos centavos do valor
  if (centavos <> '0') // valor com centavos
     then begin
            if (length(s) <> 0) // se não é valor somente com centavos
               then s := s + ' e ';
            if (centavos = '1')
               then s := s + 'um centavo'
            else begin
                   n := strtoint(centavos);
                   if (n <= 19)
                      then s := s + unidade[n]
                   else begin                 // para n = 37, tem-se:
                          unid := n mod 10;   // unid = 37 % 10 = 7 (unidade sete)
                          dez := n div 10;    // dez  = 37 / 10 = 3 (dezena trinta)
                          s := s + dezena[dez];
                          if (unid <> 0)
                             then s := s + ' e ' + unidade[unid];
                       end;
                   s := s + ' centavos';
                 end;
          end;
  valorPorExtenso := s;   

end;

Function Transform(valor:Double):string;
var
   txt:string;
begin

   // CONVERTE UM VALOR FLOAT EM STRING PARA MOSTRAR EM UM LABEL POR EXEMPLO
   
   txt:='          '+formatfloat('##0.00',valor);
   transform:=copy(txt,length(txt)-13,14);

end;

function  verificaCaption(caption: string; Botao: TSpeedButton): Boolean;
begin

    // Verifica o caption do botão se é : Sair ou Cancelar
    verificaCaption:= false;

    if (Botao.Caption = Caption ) then
       verificaCaption:= true;

end;

Function TestaDataset(Dataset : TClientDataSet) : Boolean;
begin

      // TESTE PARA SABER SE O DATASET ESTA INCLUINDO OU ALTERANDO
      
      if Dataset.State in [dsEdit,dsInsert] then

        Result := True

      else

        Result := False;
end;


procedure FiltraNome(cds: TClientDataSet; TextoSql: string; NomeDoEdit: TEdit);
begin

   If NomeDoEdit.Text <> '' then begin
         cds.Active := true;
         with cds do begin

           Close;
           CommandText:= (TextoSql);
           Params.ParamByName('Pesquisa').AsString:= '%'+(NomeDoEdit.Text)+'%';
           Open;

         end;
   end;

end;


procedure LocalizarDadosGeral(cds: TClientDataSet; TextoSql: string);
begin
        cds.Active := true;
        with cds do begin

           Close;
           CommandText:= (TextoSql);
           Open;

         end;
end;

procedure DeletarRegistro(tabela,campoid,id : string);
begin

      with DM_Pesq.cdsPesqGeral do
      begin

        Close;
        CommandText:= ('DELETE FROM '+tabela+' WHERE '+campoid+' = '+id);
        Execute;

      end;

end;

procedure gravarValoresPadraoDoClienteBalcao;
begin

    with DM_Pesq.cdsPesqGeral do
    begin

        close;
        CommandText:=('UPDATE clientes SET cli_nome = :pNome, cli_cpf = :pCPF, cli_cnpj = :pCNPJ WHERE cli_id = 1');
        Params.ParamByName('pNome').AsString := 'VENDA BALCAO';
        Params.ParamByName('pCPF').AsString  := '000.000.000-00';
        Params.ParamByName('pCNPJ').AsString := '00.000.000/0000-00';
        Execute;

    end;

end;

procedure FiltrarPeriodo(cds_FiltraPeriodo: TClientDataSet; TextoSql: string; TxtDataInicio: string; TxtDataFim: string; TxtStatusAgendamento: string);
var
  DataInicio, DataFim : TDate;
  StatusAgendamento   : string;
begin

      DataInicio         := StrToDate(TxtDataInicio);
      DataFim            := StrToDate(TxtDataFim);
      StatusAgendamento  := TxtStatusAgendamento;
      cds_FiltraPeriodo.Active := true;

      with cds_FiltraPeriodo do begin

          Close;
          CommandText:= (TextoSql);
          Params.ParamByName('Pdataini').AsDate   := DataInicio;
          Params.ParamByName('Pdatafim').AsDate   := DataFim;
          Params.ParamByName('pStatus').AsString  := StatusAgendamento;
          Open;

       end;

end;


procedure VerificarDuplicidade(cds: TClientDataSet; campo: string; NomeDoEdit: TEdit);
begin

       cds.Active := true;
       if cds.Locate(campo,NomeDoEdit.text,[]) then
       begin


          Application.MessageBox('Duplicidade de valores encontrada, favor verificar!',
            'Duplicidade!', MB_OK + MB_ICONWARNING);

          NomeDoEdit.SelStart:=0;
          NomeDoEdit.SelLength:= Length(NomeDoEdit.text);
          NomeDoEdit.SetFocus;

       end;

end;

Function TemDuplicidadeNoCampo(sCampo,sTabela,sParam:string):boolean;
begin

      _Sql:= 'SELECT '+sCampo+' FROM '+sTabela+'  WHERE '+sCampo+' = :pParam';
             
      with DM_Pesq.Qry_Geral do
      begin

          close;
          sql.Clear;
          sql.Add(_sql);
          Params.ParamByName('pParam').AsString := sParam;
          open;

          if not IsEmpty then
          begin
                 result := true;
          end else
          begin
              result := false;
          end;

      end;


end;

Function TemDuplicidade(cds: TClientDataSet; campo: string; sParam:string):Boolean;
begin

       cds.Active := true;
       if cds.Locate(campo,sParam,[]) then
       begin

          Result := true;

       end else begin

          Result := false;

       end;

end;


Function IdFuncionarioLogado(nome_func : string): integer;
begin

    dm_DadosSegundo.cds_Login.Active := true;

    if dm_DadosSegundo.cds_Login.Locate('usuario',nome_func,[]) then
    begin

          IdDoUsuarioLogado :=  dm_DadosSegundo.cds_Login.FieldByName('id_usuario').AsInteger;

    end;

    result := IdDoUsuarioLogado;

end;


Function NomeFuncionarioLogado(id_func : integer): string;
begin

    dm_DadosSegundo.cds_Login.Active := true;

    if dm_DadosSegundo.cds_Login.Locate('id_usuario',id_func,[]) then
    begin

       NomeDoUsuarioLogado :=  dm_DadosSegundo.cds_Login.FieldByName('usuario').AsString;

    end;

    result := NomeDoUsuarioLogado;

end;

Function RetornaNomeUsuarioLogado(idUser:integer):string;
begin     

     _Sql := 'SELECT func_nome FROM funcionarios WHERE func_id = :idParam';

    with DM_Pesq.Qry_Geral do
    begin

         close;
         sql.Clear;
         sql.Add(_Sql);
         Params.ParamByName('idParam').AsInteger := idUser;
         open;

         if not IsEmpty then
         begin

              Result := DM_Pesq.Qry_Geral.FieldByName('func_nome').AsString;

         end;

    end;

    NomeDoUsuarioLogado := Result;

end;

Function RetornaUsuarioLogado(idUser:integer):string;
begin

     _Sql := 'SELECT usuario FROM login WHERE func_id = :idParam';

    with DM_Pesq.Qry_Geral do
    begin

         close;
         sql.Clear;
         sql.Add(_Sql);
         Params.ParamByName('idParam').AsInteger := idUser;
         open;

         if not IsEmpty then
         begin

              Result := DM_Pesq.Qry_Geral.FieldByName('usuario').AsString;

         end;

    end;

    sUsuarioLogado := Result;

end;

Function RetornaStringPassandoID(campoDesejado,tabela,campoID:String; pIdParam:integer): string;
begin

    _Sql := 'SELECT '+campoDesejado+' FROM '+tabela+' WHERE '+campoID+' = :idParam';

    with DM_Pesq.Qry_Geral do
    begin

         close;
         sql.Clear;
         sql.Add(_Sql);
         Params.ParamByName('idParam').AsInteger := pIdParam;
         open;

         if not IsEmpty then
         begin

              Result := DM_Pesq.Qry_Geral.FieldByName(campoDesejado).AsString;

         end;

    end;

end;


Function RetornaIDPassandoString(campoID,tabela,campoParam,pParam:string): integer;
var
  id : integer;
begin

    id := 0;
    _Sql := 'SELECT '+campoID+' FROM '+tabela+' WHERE '+campoParam+' = :sParam';

    with DM_Pesq.Qry_Geral do
    begin

         close;
         sql.Clear;
         sql.Add(_Sql);
         Params.ParamByName('sParam').AsString := pParam;
         open;

         if not IsEmpty then
         begin

              id := DM_Pesq.Qry_Geral.Fields[0].AsInteger;

         end;
         Result := id;
    end;

end;

Function CalcularValorPorPercentual(valorAtual, percentual : double): double;
begin

    { para usar essa funcao crie uma variavel double e jogue o resultado dentro dela por ex:
      ValorAtualizado := AtualizarValorPorPercentual(StrToFloat(txtValorAtual.text), StrToFloat(txtPercentual.text)); }

    Result := ((valorAtual * percentual)/100 + valorAtual);

end;

Function retornaValorPercentualDeLucro(idProduto : integer): double;
var
  valorPercentual : double;
begin

    valorPercentual :=0;

    with DM_Pesq.cdsPesqGeral do
    begin

         close;
         CommandText:= ('SELECT id_produto, percentlucro FROM produtos WHERE id_produto = :IDProd');
         Params.ParamByName('IDProd').Value := idProduto;
         open;

         if not IsEmpty then
         begin

              valorPercentual := DM_Pesq.cdsPesqGeral.Fields[1].AsFloat;

         end;

    end;

    Result := valorPercentual;

end;

Function VerificaSeEProduto(IDProd : integer): boolean;
begin

    EProduto := false;

    with DM_Pesq.cdsPesqGeral do
    begin

         close;
         CommandText:= ('SELECT id_produto, tipo FROM produtos WHERE id_produto = :IDProd AND tipo = '+QuotedStr('P')+'');
         Params.ParamByName('IDProd').Value := IDProd;
         open;

         if not IsEmpty then
         begin

              EProduto := true;

         end;


    end;

       Result := EProduto;

end;

function SoNumeros(const Texto: String): String;
var
I: integer;
S: string;
begin

      S := '';
      for I := 1 To Length(Texto) Do
      begin

        if (Texto[I] in ['0'..'9']) then
        begin
        S := S + Copy(Texto, I, 1);
        end;

      end;

      result := S;

end;

Function Explode(Texto, Separador : String) : TStrings;
var
    strItem       : String;
    ListaAuxUTILS : TStrings;
    NumCaracteres,
    TamanhoSeparador,
    I : Integer;
Begin
    ListaAuxUTILS    := TStringList.Create;
    strItem          := '';
    NumCaracteres    := Length(Texto);
    TamanhoSeparador := Length(Separador);
    I                := 1;
    While I <= NumCaracteres Do
      Begin
        If (Copy(Texto,I,TamanhoSeparador) = Separador) or (I = NumCaracteres) Then
          Begin
            if (I = NumCaracteres) then strItem := strItem + Texto[I];
            ListaAuxUTILS.Add(trim(strItem));
            strItem := '';
            I := I + (TamanhoSeparador-1);
          end
        Else
            strItem := strItem + Texto[I];

        I := I + 1;
      End;
    Explode := ListaAuxUTILS;
end;


procedure AbrirTabela(cds:TClientDataSet);
begin

    cds.Active := true;

end;

procedure FecharTabela(cds:TClientDataSet);
begin

    cds.Active := true;

end;

procedure AtualizarTabela(cds:TClientDataSet);
begin

     cds.Active := false;
     cds.Active := true;

end;

procedure ReativarLoginFuncionarioInativado(iIdParam:integer);
begin
    _Sql := 'UPDATE login SET STATUS = '+QuotedStr('A')+' WHERE func_id = :pID';

    with DM_Pesq.cdsPesqGeral do
    begin

         close;
         CommandText := _Sql;
         Params.ParamByName('pID').AsInteger := iIdParam;
         execute;

    end;

end;

procedure GerarSenhaInicial(id:integer);
var
    Senha : string;
begin

     with dm_DadosSegundo.criptografa do
     begin

        Action := atEncryption;
        Input  := 'e@s170867&';  //senha gerada apenas para o controle de senha inicial
        Execute;

     end;

     Senha   := dm_DadosSegundo.criptografa.Output;

     with  DM_Pesq.Qry_Geral do
     begin

        Close;
        SQL.Clear;
        SQL.Add('Update login SET senha = :pSenha WHERE id_usuario =:pIdUsuario');
        Params.ParamByName('pSenha').AsString       := Senha;
        Params.ParamByName('pIdUsuario').AsInteger  := id;
        ExecSQL();

     end;

     dm_DadosSegundo.cds_Login.ApplyUpdates(0);
     dm_DadosSegundo.cds_Login.Active:=false;
     dm_DadosSegundo.cds_Login.Active:=true;

end;

procedure OrdenarRecordSet(cds:TClientDataSet; tabela,campoID : string);
begin

    with cds do
    begin

         close;
         CommandText := 'SELECT * FROM '+tabela+' ORDER BY '+campoID;
         open;

    end;

end;

Function GetSerialNumberFromHD(const SourceDrive: String): String;
var SerialNumber, DirLenght, Marks: DWord;
  DriveLabel: Array[0..11] of Char;
  stringDrive: String;
  charDrive:  Char;
begin
 Result := 'Error';
 if (length(SourceDrive) = 0) then Exit;

 stringDrive := SourceDrive[1]; charDrive := stringDrive[1];

 if (charDrive in ['A'..'Z','a'..'z'] = false) then Exit;

 try
     GetVolumeInformation(PChar(charDrive+':\'), DriveLabel, 12, @SerialNumber, DirLenght, Marks, nil, 0);
     Result := IntToHex(SerialNumber,8);
 except
     Result := 'Error';
 end;
end;

procedure GerarArquivoTxt;
var
   DestinoArq : string;

begin

      //abrindo o dialogo pra selecionar o diretorio e digitar o nome do arquivo txt
      caminhoTXT        := TSaveDialog.Create(nil);
      caminhoTXT.Filter := 'Arquivos de Texto[.txt]|*.txt';
      caminhoTXT.Execute;

      //pegando o caminho completo do nome do arquivo para cria-lo
      DestinoArq := caminhoTXT.FileName+'.txt';

      //criando o arquivo texto
      AssignFile(ArqTXT, DestinoArq);

        if FileExists(DestinoArq) then
              Append(ArqTXT)
        else
              ReWrite(ArqTXT);
              try
                  Writeln(ArqTXT, 'Teste de criação!');
                  Writeln(ArqTXT, 'testando, um dois tres quatro cinco');
              finally
            CloseFile(ArqTXT);

        end;

      caminhoTXT.Free;
end;

procedure GerarListaEmailsClientes;
Var
  Linha: String;
  Texto: TextFile;
Begin

  //abrindo o dialogo pra selecionar o diretorio e digitar o nome do arquivo txt
  caminhoTXT        := TSaveDialog.Create(nil);
  caminhoTXT.Filter := 'Arquivos de Texto[.txt]|*.txt';
  caminhoTXT.Execute;

  //pegando o caminho completo do nome do arquivo para cria-lo
  DestinoArq := caminhoTXT.FileName+'.txt';

  //criando o arquivo texto
  AssignFile(Texto, DestinoArq);    
  Rewrite(Texto); //abre o arquivo para escrita

       //pesquisa lista de e-mails na tabela de clientes e extrai apenas o campo com emails
       with DM_Pesq.cdsPesqGeral do
       begin

         close;
         CommandText:= ('SELECT CLI_EMAIL FROM clientes where (CLI_EMAIL != :pParam) ORDER BY CLI_EMAIL');
         Params.ParamByName('pParam').AsString := '';
         open;

          While not DM_Pesq.cdsPesqGeral.eof do
          Begin
            Linha := DM_Pesq.cdsPesqGeral.Fields[0].AsString; // Faz a leitura da linha atual e escreve na sequencia na linha
            Writeln(Texto,Linha);                             // Escreve no arquivo e desce uma linha
            Next;                                             // Vai para o proximo registro da Query
          End;

          Closefile(Texto); //fecha o handle de arquivo
       End;

end;


procedure GerarLogBackup(sInformacao: string);
var
   Arq : TextFile;
begin

  AssignFile(Arq, ExtractFilePath(RetornarCaminhoPastaBackup)+'Log backup.log');
  if not FileExists(ExtractFilePath(RetornarCaminhoPastaBackup)+'Log backup.log') then Rewrite(arq,ExtractFilePath(RetornarCaminhoPastaBackup)+'Log backup.log');
  Append(arq);
  Writeln(Arq, sInformacao);
  Writeln(Arq, '');
  CloseFile(Arq);

end;

Procedure DesabilitarMenus(nomeDoMenu:string);
var
   i,indice : integer;
begin
        listaMenusForm := TStringList.Create;

        //LISTA DE MENUS DO FORMULARIO
        for i := 0 to _frmPrincipal.menuPrincipal.Items.Count -1 do
        begin
           listaMenusForm.Add(_frmPrincipal.menuPrincipal.Items[i].name);
           //ShowMessage(listaMenusForm[i]);

        end;

        //nomeDoMenu :='MNUCONFIGURACOES';
        indice := listaMenusForm.IndexOf(nomeDoMenu);
        _frmPrincipal.menuPrincipal.Items[indice].Visible:=false;
        //ShowMessage('INDICE DO MENU CONFIGURACOES : '+IntToStr(indice));


end;

procedure verificarPermissoes(pNivelid:integer);
var
   nomeDoMenu : string;
begin

    //SE O USUARIO[SISTEMA] LOGAR, HABILITA TODOS OS MENUS PRA ELE : ACESSO TOTAL E GERENCIA OS DEMAIS

    with DM_PESQ.Qry_Geral do
    begin

         close;
         sql.Clear;
         sql.Add('SELECT * FROM menus WHERE nivelid=:pNivel and status='+QuotedStr('B'));
         Params.ParamByName('pNivel').AsInteger := pNivelid;
         open;

         while not Eof do
         begin
              nomeDoMenu := DM_PESQ.Qry_Geral.fieldbyname('menu').value;
              //ShowMessage(nomeDoMenu);
              DesabilitarMenus(nomeDoMenu);
              next;
         end;

     end;

     if(frenteDeCaixaLiberado)then
     begin
        SetandoConfigsModuloFrenteDeCaixaParaUsuario(pNivelid);
     end else
     begin
         GerenciarConfiguracaoPadraoBotoesMenusDosUsuarios;
     end;

end;

procedure GerenciarConfiguracaoPadraoBotoesMenusDosUsuarios;
begin

     //PARA O OPERADOR COM NÍVEL 1 DENOMINADO ( SISTEMA ) TODOS OS BOTÕES E MENUS ESTARÃO ATIVADOS E DISPONÍVEIS
     if(NivelFuncao = 1)then
     begin

          _frmPrincipal.btnCadastraFunc.left           := 4;
          _frmPrincipal.btnCadastraCliente.left        := 55;
          _frmPrincipal.btnOrcamentos.left             := 108;
                                                                                                             //mnuFinanceiros
          _frmPrincipal.btnCreditosReceber.left        := 162;
          _frmPrincipal.btnMovimentarCaixa.left        := 213;
          _frmPrincipal.btnPagamentos.left             := 263;
          _frmPrincipal.btnCaixa.left                  := 320;
          _frmPrincipal.btnFinanceiro.left             := 378;

          _frmPrincipal.btnContatos.left               := 430;
          _frmPrincipal.btnCredores.left               := 486;
          _frmPrincipal.btnCalculadora.left            := 544;
          _frmPrincipal.btnSobre.left                  := 596;

          _frmPrincipal.btnAgenda.left                 := 651;
          _frmPrincipal.btnProdutos.left               := 709;
          _frmPrincipal.btnFornecedores.left           := 776;
          _frmPrincipal.btnCategorias.left             := 839;
          _frmPrincipal.btnFabricantes.left            := 896;
          _frmPrincipal.btnVendas.left                 := 959;
          _frmPrincipal.btnImprimirCupom.left          := 1015;
          _frmPrincipal.btnSairDoSistema.left          := 1072;

          _frmPrincipal.menProdsFabricantes.Visible    := true;
          _frmPrincipal.menProdsCategorias.Visible     := true;
          _frmPrincipal.menProdsFornecedores.Visible   := true;
          _frmPrincipal.mnuContasGeral.Visible         := true;

     end else
     //PARA O OPERADOR COM NÍVEL 2 DENOMINADO ( GERENTE ) SEGUE A CONFIGURAÇÃO DE BOTÕES E MENUS
     if(NivelFuncao = 2)then
     begin

           //DESABILITANDO OS BOTOES E MENUS QUE NÃO ESTARÃO DISPONÍVEIS PARA ESTE USUÁRIO
          _frmPrincipal.btnImprimirCupom.Visible       := false;
          _frmPrincipal.btnProdutos.Visible            := false;
          _frmPrincipal.btnFornecedores.Visible        := false;
          _frmPrincipal.btnCategorias.Visible          := false;
          _frmPrincipal.btnFabricantes.Visible         := false;
          _frmPrincipal.btnVendas.Visible              := false;
          _frmPrincipal.mnuNiveisdeAcesso.Visible      := false;
          _frmPrincipal.mnuAtivacao.Visible            := false;
          _frmPrincipal.mnuDataExpiracao.Visible       := false;
          _frmPrincipal.mnuConfigImagens.Visible       := false;
          _frmPrincipal.mnuProdutos.Visible            := false;
          _frmPrincipal.mnuFormasdePagamento.Visible   := false;
          _frmPrincipal.mnuContasGeral.Visible         := true;

          //REALOCANDO OS BOTÕES
          _frmPrincipal.btnCadastraFunc.left           := 4;
          _frmPrincipal.btnCadastraCliente.left        := 55;
          _frmPrincipal.btnOrcamentos.left             := 108;

          _frmPrincipal.btnCreditosReceber.left        := 162;
          _frmPrincipal.btnMovimentarCaixa.left        := 213;
          _frmPrincipal.btnPagamentos.left             := 263;
          _frmPrincipal.btnCaixa.left                  := 320;
          _frmPrincipal.btnFinanceiro.left             := 378;

          _frmPrincipal.btnContatos.left               := 430;
          _frmPrincipal.btnCredores.left               := 486;
          _frmPrincipal.btnCalculadora.left            := 544;
          _frmPrincipal.btnSobre.left                  := 596;
          _frmPrincipal.btnAgenda.left                 := 651;
          _frmPrincipal.btnSairDoSistema.left          := 709;

     end else
     //PARA O OPERADOR COM NÍVEL 3 DENOMINADO ( COLABORADOR ) SEGUE A CONFIGURAÇÃO DE BOTÕES E MENUS
     if(NivelFuncao = 3 )then
     begin

           //DESABILITANDO OS BOTOES E MENUS QUE NÃO ESTARÃO DISPONÍVEIS PARA ESTE USUÁRIO
          _frmPrincipal.btnImprimirCupom.Visible       := false;
          _frmPrincipal.btnProdutos.Visible            := false;
          _frmPrincipal.btnFornecedores.Visible        := false;
          _frmPrincipal.btnCategorias.Visible          := false;
          _frmPrincipal.btnFabricantes.Visible         := false;
          _frmPrincipal.btnVendas.Visible              := false;
          _frmPrincipal.btnMovimentarCaixa.Visible     := false;
          _frmPrincipal.btnFinanceiro.Visible          := false;
          _frmPrincipal.btnCaixa.Visible               := false;

          _frmPrincipal.mnuContasGeral.Visible         := false;
          _frmPrincipal.mnuNiveisdeAcesso.Visible      := false;
          _frmPrincipal.mnuAtivacao.Visible            := false;
          _frmPrincipal.mnuDataExpiracao.Visible       := false;
          _frmPrincipal.mnuConfigImagens.Visible       := false;
          _frmPrincipal.mnuProdutos.Visible            := false;
          _frmPrincipal.mnuMovimentarCaixa.Visible     := false;
          _frmPrincipal.mnuFormasdePagamento.Visible   := false;
          _frmPrincipal.menProdsFabricantes.Visible    := false;
          _frmPrincipal.menProdsCategorias.Visible     := false;
          _frmPrincipal.menProdsFornecedores.Visible   := false;

              //VERIFICANDO SE O MENU FINACEIRO ESTA LIBERADO
               if(RetornaStatusMenuFinanceiro = 'L')then
               begin

                  _frmPrincipal.mnuFinanceiros.Visible          := true;

                  //REALOCANDO OS BOTÕES
                  _frmPrincipal.btnCadastraFunc.left           := 4;
                  _frmPrincipal.btnCadastraCliente.left        := 55;
                  _frmPrincipal.btnOrcamentos.left             := 108;
                  _frmPrincipal.btnPagamentos.left             := 162;
                  _frmPrincipal.btnCreditosReceber.left        := 213;
                  _frmPrincipal.btnContatos.left               := 263;
                  _frmPrincipal.btnCredores.left               := 320;
                  _frmPrincipal.btnCalculadora.left            := 378;
                  _frmPrincipal.btnSobre.left                  := 430;
                  _frmPrincipal.btnAgenda.left                 := 486;
                  _frmPrincipal.btnSairDoSistema.left          := 538;

               end else
               begin

                  _frmPrincipal.mnuFinanceiros.Visible         := false;
                  _frmPrincipal.btnCreditosReceber.Visible     := false;
                  _frmPrincipal.btnPagamentos.Visible          := false;

                   //REALOCANDO OS BOTÕES CASO O STATUS DO MENU FINANCEIRO SEJA 'B'
                  _frmPrincipal.btnCadastraFunc.left           := 4;
                  _frmPrincipal.btnCadastraCliente.left        := 55;
                  _frmPrincipal.btnOrcamentos.left             := 108;
                  _frmPrincipal.btnContatos.left               := 162;
                  _frmPrincipal.btnCredores.left               := 213;
                  _frmPrincipal.btnCalculadora.left            := 263;
                  _frmPrincipal.btnSobre.left                  := 320;
                  _frmPrincipal.btnAgenda.left                 := 378;
                  _frmPrincipal.btnSairDoSistema.left          := 430;

               end;

       end;

end;

procedure SetandoConfigsModuloFrenteDeCaixaParaUsuario(nivel:integer);
begin

   //ATIVANDO MODULO FRENTE DE CAIXA PARA OS NIVEL 1  (SISTEMA)
   if( nivel = 1 )then
   begin

      if(frenteDeCaixaLiberado)then
      begin

            _frmPrincipal.mnuConfiguracoes.Visible     := true;

      end;

   end;

   //ATIVANDO MODULO FRENTE DE CAIXA PARA OS NIVEIS 2 E 3 (ADMINS=(GERENTES) E COLABORADORES) OBSERVANDO QUE PARA O NIVEL SISTEMA JÁ ESTA TUDO ATIVADO
   if( nivel = 2 )then
   begin

      if(frenteDeCaixaLiberado)then
      begin

            _frmPrincipal.mnuConfiguracoes.Visible     := true;

      end;

      //ATIVANDO OS BOTÕES E MENUS
      _frmPrincipal.btnImprimirCupom.Visible     := true;
      _frmPrincipal.btnProdutos.Visible          := true;
      _frmPrincipal.btnFornecedores.Visible      := true;
      _frmPrincipal.btnCategorias.Visible        := true;
      _frmPrincipal.btnFabricantes.Visible       := true;
      _frmPrincipal.btnVendas.Visible            := true;
      _frmPrincipal.mnuProdutos.Visible          := true;
      _frmPrincipal.mnuProdutos.Visible          := true;
      _frmPrincipal.menProdsFabricantes.Visible  := true;
      _frmPrincipal.menProdsCategorias.Visible   := true;
      _frmPrincipal.menProdsFornecedores.Visible := true;
      _frmPrincipal.mnuFrenteCaixa.Visible       := true;
      _frmPrincipal.mnuContasGeral.Visible       := true;
      _frmPrincipal.mnuFormasdePagamento.Visible := false;
      _frmPrincipal.mnuNiveisdeAcesso.Visible    := false;
      _frmPrincipal.mnuConfigImagens.Visible     := false;

      //CONFIGURAÇÃO DAS POSIÇÕES DOS BOTÕES PARA O USUARIO SISTEMA
      _frmPrincipal.btnCadastraFunc.left         := 4;
      _frmPrincipal.btnCadastraCliente.left      := 55;
      _frmPrincipal.btnOrcamentos.left           := 108;

      _frmPrincipal.btnCreditosReceber.left      := 162;
      _frmPrincipal.btnMovimentarCaixa.left      := 213;
      _frmPrincipal.btnPagamentos.left           := 263;
      _frmPrincipal.btnCaixa.left                := 320;
      _frmPrincipal.btnFinanceiro.left           := 378;

      _frmPrincipal.btnContatos.left             := 430;
      _frmPrincipal.btnCredores.left             := 486;
      _frmPrincipal.btnCalculadora.left          := 544;
      _frmPrincipal.btnSobre.left                := 596;

      _frmPrincipal.btnAgenda.left               := 651;
      _frmPrincipal.btnProdutos.left             := 709;
      _frmPrincipal.btnFornecedores.left         := 776;
      _frmPrincipal.btnCategorias.left           := 839;
      _frmPrincipal.btnFabricantes.left          := 896;
      _frmPrincipal.btnVendas.left               := 959;
      _frmPrincipal.btnImprimirCupom.left        := 1015;
      _frmPrincipal.btnSairDoSistema.left        := 1068;

   end;

   if( nivel = 3 )then
   begin

      if(frenteDeCaixaLiberado)then                      
      begin

            _frmPrincipal.mnuConfiguracoes.Visible     := true;
            _frmPrincipal.mnuFrenteCaixa.Visible       := false;
            _frmPrincipal.mnuNossaEmpresa.Visible      := false;
            _frmPrincipal.mnuPermissoes.Visible        := false;
            _frmPrincipal.mnuConfigImagens.Visible     := false;
            _frmPrincipal.btnFinanceiro.Visible        := false;

      end;

      //ATIVANDO OS BOTÕES E MENUS
      _frmPrincipal.btnImprimirCupom.Visible     := true;
      _frmPrincipal.btnProdutos.Visible          := true;
      _frmPrincipal.btnFornecedores.Visible      := true;
      _frmPrincipal.btnCategorias.Visible        := true;
      _frmPrincipal.btnFabricantes.Visible       := true;
      _frmPrincipal.btnVendas.Visible            := true;
      _frmPrincipal.btnCreditosReceber.Visible   := true;
      _frmPrincipal.btnPagamentos.Visible        := true;
      _frmPrincipal.btnFinanceiro.Visible        := false;
      _frmPrincipal.btnMovimentarCaixa.Visible   := false;
      _frmPrincipal.btnCaixa.Visible             := false;

      _frmPrincipal.menProdsFabricantes.Visible  := true;
      _frmPrincipal.menProdsCategorias.Visible   := true;
      _frmPrincipal.menProdsFornecedores.Visible := true;
      _frmPrincipal.mnuProdutos.Visible          := true;
      _frmPrincipal.mnuFormasdePagamento.Visible := false;
      _frmPrincipal.mnuReativacao.Visible        := true;
      _frmPrincipal.mnuLogOperacoes.Visible      := false;
      _frmPrincipal.mnuNiveisdeAcesso.Visible    := false;
      _frmPrincipal.mnuMovimentarCaixa.Visible   := false;
      _frmPrincipal.mnuFinanceiros.Visible       := true;
      _frmPrincipal.mnuConsultas.Visible         := true;

      //LOCALIZAÇÃO DOS BOTOES
      _frmPrincipal.btnCreditosReceber.left      := 162;
      _frmPrincipal.btnPagamentos.left           := 213;
      _frmPrincipal.btnContatos.left             := 263;
      _frmPrincipal.btnCredores.left             := 320;
      _frmPrincipal.btnCalculadora.left          := 378;
      _frmPrincipal.btnSobre.left                := 430;
      _frmPrincipal.btnAgenda.left               := 486;
      _frmPrincipal.btnProdutos.left             := 538;
      _frmPrincipal.btnFornecedores.left         := 593;
      _frmPrincipal.btnCategorias.left           := 651;
      _frmPrincipal.btnFabricantes.left          := 709;
      _frmPrincipal.btnVendas.left               := 776;
      _frmPrincipal.btnImprimirCupom.left        := 839;
      _frmPrincipal.btnSairDoSistema.left        := 896;

               //VERIFICANDO SE O MENU FINACEIRO ESTA LIBERADO
               if(RetornaStatusMenuFinanceiro = 'L')then
               begin

                  _frmPrincipal.mnuFinanceiros.Visible         := true;

                   //REALOCANDO OS BOTÕES CASO O STATUS DO MENU FINANCEIRO SEJA 'L'
                  _frmPrincipal.btnCadastraFunc.left           := 4;
                  _frmPrincipal.btnCadastraCliente.left        := 55;
                  _frmPrincipal.btnOrcamentos.left             := 108;
                  _frmPrincipal.btnPagamentos.left             := 162;
                  _frmPrincipal.btnCreditosReceber.left        := 213;
                  _frmPrincipal.btnContatos.left               := 263;
                  _frmPrincipal.btnCredores.left               := 320;
                  _frmPrincipal.btnCalculadora.left            := 378;
                  _frmPrincipal.btnSobre.left                  := 430;
                  _frmPrincipal.btnAgenda.left                 := 486;
                  _frmPrincipal.btnSairDoSistema.left          := 896;


               end else
               begin

                  _frmPrincipal.mnuFinanceiros.Visible         := false;
                  _frmPrincipal.btnCreditosReceber.Visible     := false;
                  _frmPrincipal.btnPagamentos.Visible          := false;

                   //REALOCANDO OS BOTÕES CASO O STATUS DO MENU FINANCEIRO SEJA 'B'
                  _frmPrincipal.btnCadastraFunc.left           := 4;
                  _frmPrincipal.btnCadastraCliente.left        := 55;
                  _frmPrincipal.btnOrcamentos.left             := 108;
                  _frmPrincipal.btnContatos.left               := 162;
                  _frmPrincipal.btnCredores.left               := 213;
                  _frmPrincipal.btnCalculadora.left            := 263;
                  _frmPrincipal.btnSobre.left                  := 320;
                  _frmPrincipal.btnAgenda.left                 := 378;
                  _frmPrincipal.btnProdutos.left               := 430;
                  _frmPrincipal.btnFornecedores.left           := 486;
                  _frmPrincipal.btnCategorias.left             := 538;
                  _frmPrincipal.btnFabricantes.left            := 593;
                  _frmPrincipal.btnVendas.left                 := 651;
                  _frmPrincipal.btnImprimirCupom.left          := 709;
                  _frmPrincipal.btnSairDoSistema.left          := 776;

               end;

   end;

   ModuloFrenteCaixaAtivado := true;

end;

procedure BloquearFrenteDeCaixa;
begin

     _SQL := 'UPDATE frente_caixa SET status = :pStatus WHERE id_frentecaixa = :pID';

      with DM_Pesq.cdsPesqGeral do
      begin

         Close;
         CommandText:=(_Sql);
         Params.ParamByName('pStatus').AsString  := 'B';
         Params.ParamByName('pID').AsInteger     := 1;
         Execute;

      end;

      texto := 'Módulo   Frente   de   Caixa   bloqueado   com   sucesso   para   '+ NomeEmpresaLogada +' [  Faça   o   login  novamente   para  atualizar  a  informações! ]';
      Application.MessageBox(PChar(texto),'Bloqueado para o próximo acesso!', MB_ICONINFORMATION);
      Sleep(1000);
      _frmPrincipal.ReiniciarComMensagemTemporizada;
      LogOperacoes(NomeDoUsuarioLogado, 'Bloqueio do módulo frente de caixa para o cliente ativo');

end;

procedure LiberarFrenteDeCaixa;
begin

     if(TabelaEstaVazia('frente_caixa'))then
     begin

         _Sql := 'insert into frente_caixa (id_frentecaixa, status) values (:pid, :status)';

         with DM_Pesq.Qry_Auxiliar do
         begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             ParamByName('pid').AsInteger    := 1;
             ParamByName('status').AsString  := 'L';
             ExecSQL;

        end;

     end else
     begin

       _SQL := 'UPDATE frente_caixa SET status = :pStatus WHERE id_frentecaixa = :pID';

        with DM_Pesq.cdsPesqGeral do
        begin

           Close;
           CommandText:=(_Sql);
           Params.ParamByName('pStatus').AsString  := 'L';
           Params.ParamByName('pID').AsInteger     := 1;
           Execute;

        end;

        texto := 'Módulo   Frente   de   Caixa   liberado   com   sucesso   para   '+ NomeEmpresaLogada +' [  Faça   o   login  novamente   para  atualizar  a  informações! ]';
        Application.MessageBox(PChar(texto),'Liberado para o próximo acesso!', MB_ICONINFORMATION);
        Sleep(1000);

        LogOperacoes(NomeDoUsuarioLogado, 'liberação do módulo frente de caixa para o cliente ativo');

     end;

end;

function GetIndiceImpressoraPadrao: Integer;
begin

  //RETORNA O INDICE DA IMPRESSORA PADRAO
  if (Printer.Printers.Count = 0) then
  begin
        Result := -1;
        Application.MessageBox('Nenhuma    impressora    padrão    foi    detectada,'+#13+'para   imprimir   instale   uma   impressora  e  tente  novamente.','Nenhuma impessora instalada!', MB_OK + MB_ICONWARNING);
        exit;
  end else
  begin
        if(Printer.PrinterIndex >= 0)then
          Result := Printer.PrinterIndex                     // ou Printer.Printers[Printer.PrinterIndex]
        else
          Result := -1;//'Nenhuma impressora foi detectada...';
  end;

end;

function temImpressoraPadrao:boolean;
var
  indImpressoraPadaro  : integer;
begin

   //detectando se tem uma impressora instalada, sem sim mostra o nome senão msg de falta de impressora padrão
   indImpressoraPadaro  := GetIndiceImpressoraPadrao;

   if (indImpressoraPadaro >= 0)then
      result := true
   else
      result := false;

end;

procedure ReiniciarSistema(Nome, Parametros: String);
Var
 Comando: Array[0..1024] of Char;
 Parms: Array[0..1024] of Char;
begin

  StrPCopy (Comando, Nome);
  StrPCopy (Parms, Parametros);
  ShellExecute (0, Nil, Comando, Parms, Nil, SW_SHOW);
  
end;

function SysVersion(Ver: _OSVERSIONINFOA): boolean;
begin
  Ver.dwOSVersionInfoSize := SizeOf(Ver);
  Result := GetVersionEx(Ver);
end;


function RetornarNumeroVersionSistemaOperacional: string;
var
  Ver: _OSVERSIONINFOA;
begin
  if SysVersion(Ver) then
  begin
    Result := IntToStr(Ver.dwMajorVersion) + '.' +
    IntToStr(Ver.dwMinorVersion)
  end else
  begin
    Result := '';
  end;
end;

function RetornarNomeWindowsSO: string;
var
  Reg: TRegistry;
begin
    Reg := TRegistry.Create;
    try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('SOFTWARE\MICROSOFT\WINDOWS NT\CURRENTVERSION', False) then
    begin
    Result := Reg.ReadString('ProductName');
    Reg.CloseKey;
    end;
    finally
    Reg.Free;
    end;
end;


end.


