unit U_PagtoDoOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls, DB, Printers,
  EditNum, DateUtils;

type
  TTipoPagto = record
    tipo  : string;
    valor : string;
  end;
  T_frmPagarOrcamento = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    btnPagarOrcamento: TSpeedButton;
    btnCancelarPagtoCotacao: TSpeedButton;
    GroupBox1: TGroupBox;
    txtNomeCliente: TStaticText;
    pan_cabecalho: TPanel;
    Label21: TLabel;
    Label2: TLabel;
    Label17: TLabel;
    edt_ValorDebito: TEditNum;
    edt_ValorDesconto: TEditNum;
    edtTotalpagar: TEditNum;
    pan_finalizar: TPanel;
    Label1: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    edtTotalCupom: TEditNum;
    edtValorRecebido: TEditNum;
    edtTroco: TEditNum;
    pan_pagamentos: TPanel;
    LabelPgto1: TLabel;
    LabelPgto3: TLabel;
    LabelPgto2: TLabel;
    LabelPgto4: TLabel;
    LabelPgto5: TLabel;
    valorDINHEIRO: TEditNum;
    valorCREDITO: TEditNum;
    valorDEBITO: TEditNum;
    valorPENDENCIA: TEditNum;
    valorDIFERENCA: TEditNum;
    DBMemoHistorico: TDBMemo;
    lblTipoImpressora: TLabel;

    //PROCEDIMENTOS
    procedure CalcularValorAPagar;
    procedure AtualizaCaixaAposMovimento;
    procedure AtualizarTabelaMovimentacaoCaixa;
    procedure MovimentacaoComTroco;
    procedure VerificarTotalDosPagamentos;
    procedure MostrarTotalRecebidoETroco;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure PagarOrcamento;
    procedure AtualizaHistoricoAtivos;
    procedure GravarItensNoHistoricoDoCliente;
    procedure ImprimirCupomJato;
    procedure ImprimirCupomMatricial;
    procedure GerarPendenciaDeCredito;
    procedure MostrarSubTotal;
    procedure VerificarSeTemValorPendente;
    procedure AplicarDescontoPorPercentualOrcamento;
    procedure AplicarDescontoPorValorOrcamento;
    procedure TratarValorDePagamento(valorTotalPagtos:double);
    procedure DirecionarFocoAposDigitacaoDoValor;
    procedure LimparCamposDePagamentos;
    procedure gravatipo(EditNum, tipo:string);

    //FUNÇÕES
    function totalPagtoGerouTroco        : boolean;
    function gerarValorPendencia         : double;
    function retornarTotalPagtos         : double;
    function retornarDiferenca           : double;
    function retornarTotalCupom          : double;
    function retornarValorTroco          : double;
    function retornarValorRecebido       : double;
    function retornarPendencia           : double;    //esta função deverá me retornar o tipo de pagto(string 1) e o valor do pagto (double)


    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CancelarPagtoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtValorRecebidoEnter(Sender: TObject);
    procedure valorDEBITOEnter(Sender: TObject);
    procedure valorCREDITOEnter(Sender: TObject);
    procedure valorDINHEIROExit(Sender: TObject);
    procedure valorDEBITOExit(Sender: TObject);
    procedure valorCREDITOExit(Sender: TObject);
    procedure valorDINHEIROClick(Sender: TObject);
    procedure valorDEBITOClick(Sender: TObject);
    procedure valorCREDITOClick(Sender: TObject);
    procedure valorPENDENCIAClick(Sender: TObject);
    procedure edtTrocoEnter(Sender: TObject);
    procedure valorDINHEIROEnter(Sender: TObject);
    procedure btnPagarOrcamentoClick(Sender: TObject);
    procedure valorCREDITOKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ValorDescontoClick(Sender: TObject);
    procedure valorDINHEIROKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTrocoClick(Sender: TObject);
    procedure valorDINHEIROKeyPress(Sender: TObject; var Key: Char);
    procedure valorDEBITOKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    valorServico, valorDesconto, valorAPagar, valorPago, valorTroco, valorServicos, vlPagtoDinheiro, vlPagtoCredito, TaxaDesconto,
    ValorSaldoAnterior, ValorSaldoAtualAposMovto, SomaDosPagtos, TotalDaCompra, valorSubTotal, valorRecebido, vlPagtoDebito,
     subTotal, desconto, totalTroco, totalCupom, totalPago, valorDoMovimento, valorDePendencia : double;
    dataHistorico, horaHistorico : string;

  public
    { Public declarations }
    idVenda : integer;  

  end;

var
  _frmPagarOrcamento: T_frmPagarOrcamento;
  tipoPGTO : TTipoPagto;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo, U_AtualizarFecharOrcamento,  U_QRelPagtoOrcamento, U_GerarCreditosPorCartao,  U_GerarCreditosPorPendencia,
  DBClient, U_DescontoSobreVenda, SqlExpr, U_ConsHistoricoClientes;

{$R *.dfm}

procedure T_frmPagarOrcamento.FormCreate(Sender: TObject);
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
  

end;

procedure T_frmPagarOrcamento.FormShow(Sender: TObject);
begin

     self.Caption                  := 'Pagamento do Orçamento Nº : ' + IntToStr(NumOrcamentoSelecionado);
     lblTipoImpressora.Caption     := retornarTipoImpressora;
     txtNomeCliente.Caption        := NomeCliente;
     edt_ValorDebito.Text          := FloatToStr(TotalOrcamento);   //valor total do orçamento com o valor de peças incluido
     valorServicos                 := TotalOrcamento;
     edt_ValorDebito.Text          := FloatToStr( valorServicos );  //mostrando apenas o valor da mao de obra
     AbrirTabelas;
    
     idVenda  := GerarProximoID('id_venda','venda');
     retornarTotalCupom; //mostrando o total da compra nos campos TOTAL CUPOM
     valorDinheiro.SetFocus;

end;

procedure T_frmPagarOrcamento.btn_CancelarPagtoClick(Sender: TObject);
begin
      Application.MessageBox( 'Este orçamento continuará aberto para posterior pagamento!', 'Atenção orçamento não foi pago!',
                                MB_ICONEXCLAMATION + MB_OK);

      //LIMPANDO OS PARCELAMENTOS INICIALIZADOS
      DeletarRegistro('ativos_credito','orc_id',IntToStr(NumOrcamentoSelecionado));
      FecharAbrirTabelas;
      close;
end;

procedure T_frmPagarOrcamento.CalcularValorAPagar;
begin

     valorServico        := StrToFloat(edt_ValorDebito.text);
     valorDesconto       := StrToFloat(edt_ValorDesconto.Text);
     valorAPagar         := (valorServico-valorDesconto);

     edtTotalpagar.Text  := FloatToStr(valorAPagar);

end;

procedure T_frmPagarOrcamento.FormKeyPress(Sender: TObject; var Key: Char);
begin

  // Enter por Tab verifica se a tecla pressionada é a tecla ENTER, conhecida pelo Delphi como #13
  If key = #13 then
  Begin
      //se for, passa o foco para o próximo campo, zerando o valor da variável Key
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
  end;

end;

procedure T_frmPagarOrcamento.GravarItensNoHistoricoDoCliente;
var
  servRealizado, conteudoAtual, descricao  : string;
  posicaoAtual : integer;
begin

               with DM_Pesq.cdsPesqCliente do
                begin

                   Close;
                    CommandText:= ('SELECT cli_id, cli_historico FROM clientes WHERE cli_id = :pID');
                    Params.ParamByName('pID').AsInteger := idCliente;
                    Open;

                    if not IsEmpty then
                    begin

                        DBMemoHistorico.DataSource :=  DM_Pesq.dsPesqCliente;
                        DBMemoHistorico.DataField  :=  'CLI_HISTORICO';     

                        With DM_Pesq.Qry_Geral do
                         begin

                              Close;
                              SQL.Clear;
                              SQL.Add('SELECT * FROM i_orcamento WHERE orc_id = :pID');
                              Params.ParamByName('pID').AsInteger := NumOrcamentoSelecionado;
                              Open;

                              while not eof do
                              begin

                                 descricao := DM_Pesq.Qry_Geral.FieldByName('DESCRICAO').AsString;

                                 if ( DM_Pesq.cdsPesqCliente.Locate('CLI_ID',idCliente,[]) )then
                                 begin

                                      DM_Pesq.cdsPesqCliente.Edit;

                                      //passando a dataAtual e horaAtual
                                      horaHistorico := TimeToStr(time);
                                      dataHistorico := DateToStr(date);

                                      // Armazena a coluna atual em que se encontra o no dbMemo
                                      posicaoAtual :=  DBMemoHistorico.SelStart;

                                      // Armazena o texto contido anteriormente no dbMemo - Copy(objeto,inicio,fim);
                                      conteudoAtual := Copy(DBMemoHistorico.Text,0,posicaoAtual);

                                      //Preenchendo o dbMemo com o conteudo
                                      DBMemoHistorico.SelStart := Length(conteudoAtual);

                                      //adiciona os itens do orçamento no historico do cliente
                                      servRealizado := dataHistorico + ' ' + horaHistorico + ' ..: ' + ' SERVIÇO   : ' + descricao + ' , ' + ' REF. ORC. N. '+ Inttostr(NumOrcamentoSelecionado);

                                      //Entrando com o serviço inserido na venda
                                      DBMemoHistorico.Lines.Add(servRealizado);

                                      DM_Pesq.cdsPesqCliente.ApplyUpdates(0);

                                end;

                                next;

                           end;
                    end;
           end;
     end;

end;

procedure T_frmPagarOrcamento.btnPagarOrcamentoClick(Sender: TObject);
begin

     PagarOrcamento;

end;

procedure T_frmPagarOrcamento.PagarOrcamento;
begin

      //PAGAMENTO DO ORÇAMENTO SAI COMO UMA VENDA
      dm_DadosSegundo.cds_Venda.Active := true;

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

        //gravar a venda, ou abre nova venda - valorRecebido e valorParcelado são gravados antes de zerar os valores dos edits
        subTotal        :=  StrToFloat(edt_ValorDebito.Text);
        desconto        :=  StrToFloat(edt_ValorDesconto.Text);
        totalTroco      :=  StrToFloat(edtTroco.Text);
        totalPago       :=  subTotal - desconto;

        with dm_DadosSegundo.cds_Venda do
        begin

             Append;

             FieldByName('id_venda').AsInteger             := idVenda;
             FieldByName('id_vendedor').AsInteger          := IDOperador;
             FieldByName('cliente_id').AsInteger           := idCliente;
             FieldByName('orcamento_id').AsInteger         := NumOrcamentoSelecionado;
             FieldByName('data_venda').AsDateTime          := date;
             FieldByName('hora_venda').AsString            := timeToStr(time);
             FieldByname('id_Vendedor').AsInteger          := (IdFuncionarioLogado('status'));
             FieldByname('vl_bruto').AsFloat               := subTotal;
             FieldByname('vl_desconto').AsFloat            := desconto;
             FieldByname('vl_totalpagar').AsFloat          := totalPago;
             FieldByname('vl_troco').AsFloat               := totalTroco;
             FieldByname('vl_recebido').AsFloat            := valorRecebido;
             FieldByname('vl_parcelado').AsFloat           := valorParcelado;
             FieldByname('vl_liquido').AsFloat             := totalPago;
             FieldByname('status').AsString                := 'F';
             mes_ano                                       := nomeMes + '/' +  IntToStr(YearOf(DataDoDia));
             FieldByName('mesano').AsString                := mes_ano;
             FieldByName('nummes').AsInteger               := numMes;
             FieldByname('tipo').AsString                  := 'O';

             ApplyUpdates(0);

          end;

           //ATUALIZANDO DADOS DO REFERENTE AO PAGAMENTO DO ORÇAMENTO
           _Sql:= 'UPDATE orcamento SET status = '+QuotedStr('FINALIZADO')+', id_venda = :pIDVenda, datapagto = :pDataPagto, total = :pTotal where id_orcamento = :pIDORC';

           With DM_Pesq.Qry_Geral do begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              ParamByName('pIDVenda').AsInteger      := idVenda;
              ParamByName('pDataPagto').AsDateTime   := date;
              ParamByName('pIDORC').AsInteger        := NumOrcamentoSelecionado;
              ParamByName('pTotal').AsFloat          := totalCupom;
              ExecSQL();

            end;

          AtualizaCaixaAposMovimento;
          GravarItensNoHistoricoDoCliente;

          //DA ERRO E NAO ABRE O CUPOM

          //abre o formulario de historico auto, se for cliente cadastrado
          pagandoOrcamento:=true;
          
          Application.CreateForm(T_frmConsHistorico,  _frmConsHistorico);
          _frmConsHistorico.ShowModal;
          FreeAndNil(_frmConsHistorico);

          //Direciona a impressao do cupom
          if(imprimirJato)then
          begin
             ImprimirCupomJato;
          end else if (imprimirMatricial)then
          begin
             ImprimirCupomMatricial;
          end;

          FecharAbrirTabelas;
          LogOperacoes(NomeDoUsuarioLogado, 'pagamento de orcamento');
          GerouPendencia          := false;
end;


procedure T_frmPagarOrcamento.AtualizaCaixaAposMovimento;
var
  proxNumIdCaixa  : integer;
begin

       //VERIFICAR O VALOR DO SALDO ANTERIOR (ULTIMO REGISTRO)
        _Sql := 'select id_caixa, saldo_atual from caixa WHERE '+
                'id_caixa = (select max(id_caixa) from caixa)';

       With DM_Pesq.Qry_Auxiliar do
       begin

          Close;
          SQL.Clear;
          SQL.Add(_Sql);
          Open;

              if not IsEmpty then begin

                   ValorSaldoAnterior := DM_Pesq.Qry_Auxiliar.Fields[1].Value;

              end;

       end;

         valorPago                := totalpago;
         ValorSaldoAtualAposMovto := ( ValorSaldoAnterior + valorPago );
         valorDoMovimento         := valorPago;

         // ATUALIZANDO O CAIXA
         proxNumIdCaixa := GerarProximoID('id_caixa','caixa');

         if ( GerouPendencia ) then
         begin

             historicoDaVendaParaCaixa := 'PAGAMENTO PARCIAL DO ORC. N.'+ Inttostr(NumOrcamentoSelecionado);

             if ( SomaDosPagtos = 0 )  then
             begin
                    valorDoMovimento         :=  0;
                    ValorSaldoAtualAposMovto := ( ValorSaldoAnterior );

             end else begin

               // so vai mostrar o movimento sem acrescentar o valor no caixa pois a movimentação se dara qdo do pagto das duplicatas
               valorDoMovimento         := (  (StrToFloat(valorDINHEIRO.Text) +  StrToFloat(valorDEBITO.Text) +  StrToFloat(valorCREDITO.Text)));
               ValorSaldoAtualAposMovto := ( ValorSaldoAnterior + valorDoMovimento );

             end;

         end else
         begin

                //venda normal sem pagto a credito ou pendencia
                historicoDaVendaParaCaixa := 'PAGAMENTO DO ORC. N.'+ Inttostr(NumOrcamentoSelecionado);

                valorDoMovimento          := StrToFloat(valorDINHEIRO.Text) +  StrToFloat(valorDEBITO.Text) +  StrToFloat(valorCREDITO.Text);
                ValorSaldoAtualAposMovto  := ( ValorSaldoAnterior + valorDoMovimento );

         end;


        with  dm_Conexao.cds_Caixa do begin

            Append;
            FieldByName('id_caixa').AsInteger        := proxNumIdCaixa;
            FieldByName('id_venda').AsInteger        := idVenda;
            FieldByName('saldo_anterior').AsFloat    := ValorSaldoAnterior;
            FieldByName('valor_movimento').AsFloat   := valorDoMovimento;
            FieldByName('saldo_atual').AsFloat       := ValorSaldoAtualAposMovto;
            FieldByName('data').AsDateTime           := date;
            FieldByName('status').AsString           := 'A';
            FieldByName('historico').AsString        := historicoDaVendaParaCaixa; //'PAGAMENTO DO ORC.N.'+ Inttostr( NumOrcamentoSelecionado );

            ApplyUpdates(0);

        end;

        MovimentacaoComTroco;
        AtualizaHistoricoAtivos;


end;

procedure T_frmPagarOrcamento.ImprimirCupomJato;
begin

    Application.MessageBox( 'Obrigado  pelo  seu  pagamento,o  Sistema  imprimirá'#13'agora  o  comprovante  não  fiscal  para  seu controle!', 'Pagamento realizado com sucesso...', MB_IconInformation + MB_OK);
    AvisoTemporario('Imprimindo cupom...');
    
    Application.CreateForm(TQ_RelCupomPagtoOrcamento,  Q_RelCupomPagtoOrcamento);
    with Q_RelCupomPagtoOrcamento.cds_RelCupomPagtoOrcamento do
    begin

      Close;
      Params.ParamByName('pIDOrcamento').value  :=  NumOrcamentoSelecionado ;
      Open;

      Q_RelCupomPagtoOrcamento.cds_RelCupomPagtoOrcamento.Active := True;
      Q_RelCupomPagtoOrcamento.lblNomeUsuarioLogado.Caption      := sUsuarioLogado;
      Q_RelCupomPagtoOrcamento.ReportTitle                       := 'Cupom de Pagamento';
      Q_RelCupomPagtoOrcamento.Preview;
      FreeAndNil(Q_RelCupomPagtoOrcamento);

    end;

end;

procedure T_frmPagarOrcamento.ImprimirCupomMatricial;
begin

    AvisoTemporario('Imprimindo cupom...');

    //GERA O CUPOM COM AS DEFINIÇÕES
    GerarCupomMatricial(idVenda);

end;


procedure T_frmPagarOrcamento.AtualizaHistoricoAtivos;
begin

        // ATUALIZANDO O HISTORICO DE ATIVOS
        proxNum := GerarProximoID('id_historicoativos','historico_ativos');

        with dm_Conexao.cds_HistoricoAtivos do
        begin

          append;
          FieldByname('id_historicoativos').AsInteger   := proxNum;
          FieldByname('cliente_id').AsInteger           := idCliente;
          FieldByname('vendedor_id').AsInteger          := IDOperador;
          FieldByname('id_venda').AsInteger             := idVenda;
          FieldByname('id_os').AsInteger                := NumOrcamentoSelecionado;
          FieldByname('vl_liquido').AsFloat             := totalpago - totalTroco;
          FieldByName('historico').AsString             := 'PAGAMENTO ORC. N : '+ Inttostr(NumOrcamentoSelecionado );
          FieldByName('flag_pagto').AsString            := 'PV';  //entra como PV para constar como ativo na meta
          mes_ano                                       := nomeMes + '/' +  IntToStr(YearOf(DataDoDia));
          FieldByName('mesano').AsString                := mes_ano;
          FieldByname('data').AsDateTime                := date;

          ApplyUpdates(0);

        end;

end;

procedure T_frmPagarOrcamento.AtualizarTabelaMovimentacaoCaixa;
begin
       valorTroco     := StrToFloat(edtTroco.Text);

       // ATUALIZANDO TABELA DE MOVIMENTACAO DO CAIXA COM ENTRADAS E SAIDAS
       proxNum := GerarProximoID('id_movimento','MOVIMENTACAOCAIXA');

        with dm_DadosSegundo.cds_MovCaixa do
        begin

            Append;
            FieldByName('id_movimento').AsInteger    := proxNum;
            FieldByName('valor').AsFloat             := valorTroco;
            FieldByName('historico').AsString        := 'MOVIMENTACAO GERADA POR TROCO DADO AO CLIENTE';
            FieldByName('tipo').AsString             := 'T'; //SAIDA TIPO TROCO
            FieldByName('data').AsDateTime           := date;
            ApplyUpdates(0);

        end;

end;

procedure T_frmPagarOrcamento.MovimentacaoComTroco;
var
  proxNumIdCaixa : integer;
begin

     valorTroco     := StrToFloat(edtTroco.Text);

     if valorTroco > 0 then
     begin

          //VERIFICAR O VALOR DO SALDO ANTERIOR (ULTIMO REGISTRO)

            _Sql := 'select id_caixa, saldo_atual from caixa WHERE '+
                    'id_caixa = (select max(id_caixa) from caixa)';


           With DM_Pesq.Qry_Auxiliar do
           begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              Open;

                  if not IsEmpty then begin

                       ValorSaldoAnterior := DM_Pesq.Qry_Auxiliar.Fields[1].Value;

                  end;

           end;    

           ValorSaldoAtualAposMovto := ( ValorSaldoAnterior - valorTroco );

           // ATUALIZANDO O CAIXA
           proxNumIdCaixa := GerarProximoID('id_caixa','caixa');

            with dm_Conexao.cds_Caixa do begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNumIdCaixa;
                FieldByName('id_venda').AsInteger        := IdVenda;
                FieldByName('saldo_anterior').AsFloat    := ValorSaldoAnterior;
                FieldByName('valor_movimento').AsFloat   := -valorTroco;
                FieldByName('saldo_atual').AsFloat       := ValorSaldoAtualAposMovto;
                FieldByName('data').AsDateTime           := date;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := 'TROCO DO ORC. N.'+IntToStr(NumOrcamentoSelecionado);

                ApplyUpdates(0);

            end;
            //ATUALIZANDO TABELA DE MOVIMENTACAO DO CAIXA COM O TROCO DADO
            AtualizarTabelaMovimentacaoCaixa;
     end;

      dm_Conexao.cds_Caixa.Active   := false;
      dm_Conexao.cds_Caixa.Active   := true;       
      close;

end;

procedure T_frmPagarOrcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     FecharTabelas;
end;

procedure T_frmPagarOrcamento.edtValorRecebidoEnter(Sender: TObject);
begin

      edtTotalCupom.Text := edtTotalpagar.Text;
      totalPago :=  subTotal;
      MostrarSubTotal;
      if(totalCupom <= totalPago) then valorDIFERENCA.Font.Color := clBlue;

end;

procedure T_frmPagarOrcamento.VerificarTotalDosPagamentos;
begin

     SomaDosPagtos := StrToFloat(valorDINHEIRO.Text) +  StrToFloat(valorDEBITO.Text) +  StrToFloat(valorCREDITO.Text) +  StrToFloat(valorPENDENCIA.Text);

     TotalDaCompra := StrToFloat(edtTotalpagar.Text);

     if ( SomaDosPagtos >= TotalDaCompra ) then
     begin

         edtValorRecebido.SetFocus;
         edtValorRecebido.Text := FloatToStr(SomaDosPagtos);
         RetiraPonto(edtValorRecebido.Text);
         btnPagarOrcamento.Enabled := true;

         //Calculando o valor do troco
         edtTroco.Text      := FloatToStr( strtofloat(edtValorRecebido.Text) - strtofloat(edtTotalpagar.Text ) );

     end
     else begin

          Application.MessageBox( 'O total do pagamento não confere com o valor do cupom !', 'Atenção verifique...',
                                MB_IconInformation + MB_OK);

          valorDINHEIRO.Text       := '0,00';
          valorDEBITO.Text         := '0,00';
          valorCREDITO.Text        := '0,00';
          valorPENDENCIA.Text      := '0,00';
          edtValorRecebido.Text    := '0,00';
          valorDINHEIRO.SetFocus;     

     end;

end;


procedure T_frmPagarOrcamento.valorCREDITOEnter(Sender: TObject);
begin

    pan_finalizar.Enabled     := true;
    btnPagarOrcamento.Enabled := false;
    
end;


procedure T_frmPagarOrcamento.valorDEBITOEnter(Sender: TObject);
begin


  btnPagarOrcamento.Enabled := false;

end;

procedure T_frmPagarOrcamento.valorDINHEIROExit(Sender: TObject);
begin

    retornarValorRecebido;
    retornarDiferenca;
    retornarPendencia;
    retornarValorTroco;
    DirecionarFocoAposDigitacaoDoValor;
end;

procedure T_frmPagarOrcamento.valorDEBITOExit(Sender: TObject);
begin
    retornarValorRecebido;
    retornarDiferenca;
    retornarPendencia;
    retornarValorTroco;

end;

procedure T_frmPagarOrcamento.valorCREDITOExit(Sender: TObject);
begin
    retornarValorRecebido;
    retornarDiferenca;
    retornarPendencia;
    retornarValorTroco;
    DirecionarFocoAposDigitacaoDoValor;

end;

procedure T_frmPagarOrcamento.MostrarTotalRecebidoETroco;
begin

    valorPago      := StrToFloat(edtValorRecebido.text);
    valorAPagar    := strtofloat(edtTotalpagar.text);

    RetiraPonto(edtValorRecebido.Text);
    RetiraPonto(edtTotalpagar.Text);

    if ( valorPago >= valorAPagar ) then
    begin

      valorTroco             := ( valorPago - valorAPagar );
      edtTroco.Text     := FloatToStr(valorTroco);
      RetiraPonto(edtTroco.Text);

    end;

end;

procedure T_frmPagarOrcamento.AbrirTabelas;
begin

    dm_Conexao.cds_Caixa.Active                  := true;
    dm_DadosSegundo.cds_Venda.Active             := true;
    dm_Conexao.cds_HistoricoAtivos.Active        := true;
    dm_DadosSegundo.cds_Orcamento.Active         := true;
    dm_DadosSegundo.cds_IOrcamento.Active        := true;
    dm_DadosSegundo.cds_TOrcamento.Active        := true;
    dm_Conexao.cds_DadosClientes.Active          := true;
    dm_DadosSegundo.cds_MovCaixa.Active          := true;
    dm_DadosSegundo.cds_TiposPgtos.Active        := true;
    GerouPendencia := false;

end;

procedure T_frmPagarOrcamento.FecharTabelas;
begin

    //nao fechar dm_DadosSegundo.cds_OS pra q se mudar de ideia e nao pagar o grid esteja populado
    dm_Conexao.cds_Caixa.Active                  := false;
    dm_DadosSegundo.cds_Venda.Active             := false;  
    dm_Conexao.cds_HistoricoAtivos.Active        := false;
    dm_Conexao.cds_DadosClientes.Active          := false;
    dm_DadosSegundo.cds_Orcamento.Active         := false;
    dm_DadosSegundo.cds_IOrcamento.Active        := false;
    dm_DadosSegundo.cds_TOrcamento.Active        := false;
    dm_Conexao.cds_DadosClientes.Active          := false;
    dm_DadosSegundo.cds_MovCaixa.Active          := false;
    dm_DadosSegundo.cds_TiposPgtos.Active        := false;

end;

procedure T_frmPagarOrcamento.FecharAbrirTabelas;
begin

   dm_Conexao.cds_Caixa.Active                := false;
   dm_Conexao.cds_Caixa.Active                := true;

   dm_DadosSegundo.cds_Venda.Active           := false;
   dm_DadosSegundo.cds_Venda.Active           := true;

   dm_Conexao.cds_HistoricoAtivos.Active      := false;
   dm_Conexao.cds_HistoricoAtivos.Active      := true;

   dm_DadosSegundo.cds_Orcamento.Active       := false;
   dm_DadosSegundo.cds_Orcamento.Active       := true;

   dm_DadosSegundo.cds_IOrcamento.Active      := false;
   dm_DadosSegundo.cds_IOrcamento.Active      := true;

   dm_DadosSegundo.cds_TOrcamento.Active      := false;
   dm_DadosSegundo.cds_TOrcamento.Active      := true;

   dm_Conexao.cds_DadosClientes.Active        := false;
   dm_Conexao.cds_DadosClientes.Active        := true;

   dm_DadosSegundo.cds_MovCaixa.Active        := false;
   dm_DadosSegundo.cds_MovCaixa.Active        := True;

   dm_DadosSegundo.cds_Ativos_Credito.Active  := false;
   dm_DadosSegundo.cds_Ativos_Credito.Active  := true;

   dm_DadosSegundo.cds_TiposPgtos.Active      := false;
   dm_DadosSegundo.cds_TiposPgtos.Active      := true;

end;

procedure T_frmPagarOrcamento.valorDINHEIROClick(Sender: TObject);
begin
      DeletarRegistro('ativos_credito','orc_id',IntToStr(NumOrcamentoSelecionado));
      edtTroco.Text:= '0,00';
      valorDINHEIRO.SelectAll;

end;

procedure T_frmPagarOrcamento.valorDEBITOClick(Sender: TObject);
begin
      valorDEBITO.SelectAll;
      DeletarRegistro('ativos_credito','orc_id',IntToStr(NumOrcamentoSelecionado));
      edtTroco.Text     := '0,00';

end;

procedure T_frmPagarOrcamento.valorCREDITOClick(Sender: TObject);
begin
      valorCREDITO.SelectAll;
      DeletarRegistro('ativos_credito','orc_id',IntToStr(NumOrcamentoSelecionado));
      edtTroco.Text     := '0,00';

end;

procedure T_frmPagarOrcamento.valorPENDENCIAClick(Sender: TObject);
begin 

     valorPENDENCIA.SelStart      := 0;
     valorPENDENCIA.SelLength     := Length(valorPENDENCIA.Text);
     edtTroco.Text     := '0,00';

end;

procedure T_frmPagarOrcamento.VerificarSeTemValorPendente;
var
  valorPendente:double;
begin

  //verifica se tem valor pendente para cadastro da pendência
  valorPendente := StrToFloat(valorPENDENCIA.Text);

  if(valorPendente > 0)then
  begin

    ShowMessage('Ficou uma parte do total como pendência, faça o tratamento do valor com o cliente!');
    pagandoOrcamento := true;
    GerarPendenciaDeCredito;
    pan_pagamentos.Enabled := false;
    edtValorRecebido.Text      := edtTotalpagar.Text;

  end;

end;

function T_frmPagarOrcamento.gerarValorPendencia:double;
begin
      valorSubTotal     :=  retornarTotalPagtos;
      valorAPagar       :=  retornarTotalCupom;
      edtValorRecebido.Text :=  FloatToStr(valorSubTotal + StrToFloat(valorPENDENCIA.Text));

      valorDePendencia  :=  -(valorSubTotal - valorAPagar);
      Result            := valorDePendencia;

end;


procedure T_frmPagarOrcamento.GerarPendenciaDeCredito;
begin

     NumOrcParaCreditos         := IntToStr(NumOrcamentoSelecionado);
     ValorPendenciaParaCreditos := FloatToStr(gerarValorPendencia);
     pagandoOrcamento           := true;
     GerouPendencia             := true;

     Application.CreateForm(T_frmGerarCreditosPorPendencia,  _frmGerarCreditosPorPendencia);
     _frmGerarCreditosPorPendencia.ShowModal;
     FreeAndNil(_frmGerarCreditosPorPendencia);

end;


procedure T_frmPagarOrcamento.TratarValorDePagamento(valorTotalPagtos: double);
var
   valorTotalCupom : double;
begin
    //Faz o tratamento do valor total dos pagamentos
    valorTotalCupom := StrToFloat(edtTotalpagar.Text);

    if (valorTotalPagtos > valorTotalCupom)then
    begin
        retornarValorTroco;
        btnPagarOrcamento.Enabled:= true;

    end else if (valorTotalPagtos = valorTotalCupom)then
    begin
        btnPagarOrcamento.Enabled:= true;
    end else if (valorTotalPagtos < valorTotalCupom)then
    begin
        valorPENDENCIA.Text := FloatToStr(gerarValorPendencia);
        valorDIFERENCA.Text := FloatToStr(-gerarValorPendencia);
        GerarPendenciaDeCredito;

    end;

    //GRAVANDO TIPOS DE PAGAMENTOS E SEUS VALORES
    gravatipo(valorDINHEIRO.Text,'1');
    gravatipo(valorCREDITO.Text,'2');
    gravatipo(valorDEBITO.Text,'3');
    gravatipo(valorPENDENCIA.Text,'4');

end;

procedure T_frmPagarOrcamento.gravatipo(EditNum,tipo:string);
var
   idTipos : integer;
begin

     idTipos := GerarProximoID('id_tipos','tipospgtos');

     if StrToFloat(EditNum) <> 0 then
     begin

         with dm_DadosSegundo.cds_TiposPgtos do
         begin

              append;
              FieldByName('id_tipos').AsInteger  := idTipos;
              FieldByName('id_orc').AsString     := IntToStr(NumOrcamentoSelecionado);
              FieldByName('data').AsDateTime     := now;
              FieldByName('tipo').AsString       := tipo;
              FieldByName('valor').AsString      := editnum;
              ApplyUpdates(0);

         end;

     end;
     FecharAbrirTabelas;
     
end;

procedure T_frmPagarOrcamento.edtTrocoEnter(Sender: TObject);
begin

     if(valorTroco>0)then
     begin
      valorPENDENCIA.Text:='0,00';
      valorDIFERENCA.Text:='0,00';
     end;

     btnPagarOrcamento.Enabled := true;
     pan_pagamentos.Enabled    := false;
     valorParcelado            := StrToFloat(valorPENDENCIA.Text);
     valorRecebido             := retornarTotalPagtos;
     edtTroco.SelectAll;
     TratarValorDePagamento(retornarTotalPagtos);

end;

procedure T_frmPagarOrcamento.valorDINHEIROEnter(Sender: TObject);
begin
    
    pan_cabecalho.Enabled       := false;
    pan_finalizar.Enabled       := false;
    btnPagarOrcamento.Enabled   := false;

    retornarValorRecebido;
    retornarDiferenca;
    retornarPendencia;
    retornarValorTroco;
    DirecionarFocoAposDigitacaoDoValor;

end;

procedure T_frmPagarOrcamento.valorCREDITOKeyPress(Sender: TObject;
  var Key: Char);
begin
    pan_finalizar.Enabled :=true;   
end;


procedure T_frmPagarOrcamento.MostrarSubTotal;
begin
     edtValorRecebido.Text := FloatToStr(StrToFloat(valorDINHEIRO.Text) +  StrToFloat(valorDEBITO.Text) +  StrToFloat(valorCREDITO.Text) + StrToFloat(valorPENDENCIA.Text)) ;
end;

procedure T_frmPagarOrcamento.edt_ValorDescontoClick(Sender: TObject);
begin
      edt_ValorDesconto.SelStart      := 0;
      edt_ValorDesconto.SelLength     := Length(valorDINHEIRO.Text);
      edt_ValorDesconto.Text          := '0,00';  
end;

function T_frmPagarOrcamento.retornarTotalPagtos: double;
begin
   //RETORNA A SOMA DOS VALORES PAGOS
   SomaDosPagtos := StrToFloat(valorDINHEIRO.Text) +  StrToFloat(valorDEBITO.Text) +  StrToFloat(valorCREDITO.Text);
   result        := SomaDosPagtos;

end;

function T_frmPagarOrcamento.retornarDiferenca: double;
begin
    //RETORNA A DIFERNCA ENTRE OS VALORES PAGOS E O VALOR TOTAL DA COMPRA
    totalCupom := StrToFloat(edtTotalpagar.text);
    subTotal   := retornarTotalPagtos - totalCupom;
    result     := subTotal;

    valorDIFERENCA.Text := FloatToStr(result);

end;

function T_frmPagarOrcamento.retornarPendencia: double;
begin
    //RETORNA A DIFERNCA ENTRE OS VALORES PAGOS E O VALOR TOTAL DA COMPRA
    totalCupom := StrToFloat(edtTotalpagar.text);
    subTotal   := totalCupom - retornarTotalPagtos;
    result     := subTotal;

    valorPENDENCIA.Text := FloatToStr(result);

end;


function T_frmPagarOrcamento.retornarTotalCupom: double;
begin

     totalCupom := StrToFloat(edt_ValorDebito.text) - StrToFloat(edt_ValorDesconto.text);
     result     := totalCupom;

     edtTotalCupom.Text := FloatToStr(totalCupom);
     edtTotalpagar.Text := FloatToStr(totalCupom);

end;

procedure T_frmPagarOrcamento.AplicarDescontoPorPercentualOrcamento;
begin

    // entrando com o valor da taxa de desconto para calculo

    TaxaDesconto := strtofloat(_frmDesconto.edtPorPercentual.Text);
    desconto     :=  ( strtofloat(edt_ValorDebito.Text) * TaxaDesconto ) / 100;

    if ( desconto > strtofloat(edtTotalpagar.text) ) then
    begin

          Application.MessageBox('Valor de desconto maior que o valor da venda!', 'Desconto inválido!', MB_OK + MB_ICONWARNING);
          exit;

    end else
    begin
         edtTotalpagar.Text       :=  FloatToStr( strtofloat(edtTotalpagar.text) - Desconto );
         edt_ValorDesconto.Text   :=  FloatToStr(desconto);
         retornarDiferenca;
         retornarPendencia;
         retornarTotalCupom;
         valorDINHEIRO.SetFocus;

    end;

end;

procedure T_frmPagarOrcamento.AplicarDescontoPorValorOrcamento;
begin

      // entrando com o valor do desconto para calculo

      desconto   :=  strtofloat(_frmDesconto.edtPorValor.Text);

      if ( desconto >   strtofloat(edtTotalpagar.text) ) then
      begin

            Application.MessageBox('Valor de desconto maior que o valor da venda!', 'Desconto inválido!', MB_OK + MB_ICONWARNING);
            exit;

      end else
      begin

            edtTotalpagar.Text       :=  FloatToStr( strtofloat(edtTotalpagar.text) - Desconto );
            edt_ValorDesconto.Text   :=  FloatToStr(desconto);
            valorDINHEIRO.SetFocus;

      end;

end;


function T_frmPagarOrcamento.retornarValorTroco: double;
begin

    valorTroco := retornarTotalPagtos - retornarTotalCupom ;
    result     := valorTroco;


    if(retornarTotalPagtos > retornarTotalCupom)then
       edtTroco.Text := FloatToStr(valorTroco);


end;

function T_frmPagarOrcamento.retornarValorRecebido: double;
begin

    valorRecebido         := retornarTotalPagtos;
    result                := valorRecebido;

    edtValorRecebido.Text := FloatToStr(result);

end;

function T_frmPagarOrcamento.totalPagtoGerouTroco: boolean;
begin

     totalPago :=  retornarValorTroco;

     if( totalPago > 0 )then
     begin
        result  := true;
     end else

         result  := false;

end;

procedure T_frmPagarOrcamento.valorDINHEIROKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

      if KEY = VK_F10 then
      begin
           pagandoOrcamento        := true;
           edt_ValorDesconto.Text  := '0,00';
           valorPENDENCIA.Text     := '0,00';
           edtValorRecebido.Text   := '0,00';
           edtTotalpagar.Text      := edt_ValorDebito.Text;

           Application.CreateForm(T_frmDesconto,  _frmDesconto);
           _frmDesconto.ShowModal;
           FreeAndNil(_frmDesconto);

      end;

end;

procedure T_frmPagarOrcamento.edtTrocoClick(Sender: TObject);
begin
    edtTroco.SelectAll;
end;


procedure T_frmPagarOrcamento.valorDINHEIROKeyPress(Sender: TObject;
  var Key: Char);
begin
  pan_finalizar.Enabled := true;
end;

procedure T_frmPagarOrcamento.valorDEBITOKeyPress(Sender: TObject;
  var Key: Char);
begin
    pan_finalizar.Enabled :=true;
end; 

procedure T_frmPagarOrcamento.DirecionarFocoAposDigitacaoDoValor;
begin

    TotalDaCompra   := retornarTotalCupom;
    vlPagtoDinheiro := StrToFloat(valorDINHEIRO.text);
    vlPagtoCredito  := StrToFloat(valorCREDITO.text);
    vlPagtoDebito   := StrToFloat(valorDEBITO.text);

    if(vlPagtoDinheiro >= TotalDaCompra)then  //saindo do valor em DINHEIRO
    begin
       valorCREDITO.Text   := '0,00';
       valorDEBITO.Text    := '0,00';
       valorPENDENCIA.Text := '0,00';
       valorDIFERENCA.Text := '0,00';
       edtTroco.SetFocus;
    end else  if((vlPagtoDinheiro + vlPagtoCredito) >= TotalDaCompra)then  //saindo do valor em CREDITO
    begin
       valorDEBITO.Text    := '0,00';
       valorPENDENCIA.Text := '0,00';
       valorDIFERENCA.Text := '0,00';
       edtTroco.SetFocus;
    end else  if((vlPagtoDinheiro + vlPagtoCredito + vlPagtoDebito) >= TotalDaCompra)then  //saindo do valor em DEBITO
    begin
       valorPENDENCIA.Text := '0,00';
       valorDIFERENCA.Text := '0,00';
       edtTroco.SetFocus;
    end;

end;

procedure T_frmPagarOrcamento.LimparCamposDePagamentos;
begin

      valorDINHEIRO.Text             := '0,00';
      valorDEBITO.Text               := '0,00';
      valorCREDITO.Text              := '0,00';
      edt_ValorDesconto.Text         := '0,00';
      edtValorRecebido.Text          := '0,00';
      edtTroco.Text                  := '0,00';
      pan_pagamentos.Enabled         := true;
      edtTotalpagar.Text             := edt_ValorDebito.Text;

      //LIMPANDO OS PARCELAMENTOS INICIALIZADOS
      DeletarRegistro('ativos_credito','orc_id',IntToStr(NumOrcamentoSelecionado));
      FecharAbrirTabelas;

      valorDINHEIRO.SetFocus;

end;


end.


