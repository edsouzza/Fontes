unit U_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, EditNum, StdCtrls, ComCtrls, Menus, Mask, DBCtrls, Buttons,
  ToolEdit, CurrEdit, DateUtils, Printers, Inifiles, u_cadprodutos;

type
  T_frmCaixa = class(TForm)
    panel_cabecalho: TPanel;
    edtDescricao: TEdit;
    edtCodBarras: TEdit;
    edtQde: TEditNum;
    lblTotalItem: TLabel;
    lblQde: TLabel;
    lblItem: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    lblidProduto: TLabel;
    Label20: TLabel;
    panel_DebitosPendentes: TPanel;
    ListBox1: TListBox;
    panel_imagem: TPanel;
    grValorVenda: TGroupBox;
    lblMostraValorVenda: TEditNum;
    grNumVenda: TGroupBox;
    lbl_IdVenda: TLabel;
    lbltotalgeral: TLabel;
    btnSomar: TBitBtn;
    edtTotal: TEditNum;
    edtPrecoAlterado: TEditNum;
    edtPreco: TEditNum;
    lblIDCliente: TLabel;
    panel_boasvindas: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edtEstoque: TEditNum;
    img_produto: TImage;
    DBMemoHistorico: TDBMemo;
    panel_formaspagto: TPanel;
    pan_cabecalho: TPanel;
    Label21: TLabel;
    edtSubTotal: TEditNum;
    Label18: TLabel;
    edtDesconto: TEditNum;
    Label17: TLabel;
    edtTotalpagar: TEditNum;
    pan_pagamentos: TPanel;
    LabelPgto1: TLabel;
    LabelPgto2: TLabel;
    valorDINHEIRO: TEditNum;
    valorCREDITO: TEditNum;
    LabelPgto3: TLabel;
    valorDEBITO: TEditNum;
    LabelPgto4: TLabel;
    valorPENDENCIA: TEditNum;
    LabelPgto5: TLabel;
    valorDIFERENCA: TEditNum;
    pan_finalizar: TPanel;
    Label4: TLabel;
    edtTotalCupom: TEditNum;
    Label19: TLabel;
    edtValorRecebido: TEditNum;
    Label22: TLabel;
    edtTroco: TEditNum;
    lblTipoVenda: TLabel;

    //PROCEDIMENTOS
    procedure PagarVenda;
    procedure PesquisarProdutoNoEstoque;
    procedure MostrarTotaisNoListBox;
    procedure TotalDosPagamentos;
    procedure ExcluirVendaEItens;
    procedure AtualizarCaixaAposMovimento;
    procedure EscolherItemAserCancelado;
    procedure soma;
    procedure GravaItens;
    procedure LimpaCabecalho;
    procedure MostraIDVenda;
    procedure PesquisaIDProduto;
    procedure AbriTabelas;
    procedure FecharTabelas;
    procedure AbrirFecharTabelas;
    procedure BaixarQdeDoEstoque;
    procedure TotalPagarAposDesconto;
    procedure ConcederDescontoNaVenda;
    procedure AbrirNovaVenda;
    procedure gravatipo(EditNum, tipo:string);
    procedure ExcluirTiposPgtos;
    procedure ExcluirVendaAberta;
    procedure MostrarFotoProduto;
    procedure MostrarFotoPadrao;
    procedure ConfCaptionDosPagamentos;
    procedure MovimentacaoComTroco;
    procedure LimparTelaParaAbrirNovaVenda;
    procedure LimparTelaDaVendaExcluida;
    procedure AplicarDescontoPorPercentual;
    procedure AplicarDescontoPorValor;
    procedure GerarPendenciaDeCredito;
    procedure AtualizarHistoricoVP;
    procedure AtualizarHistoricoAtivos;
    procedure InserirItemDoProdutoNaVenda;
    procedure InserirServicoNaVenda;
    procedure ImprimirCupomJato;
    procedure ImprimirCupomMatricial;
    procedure ApagarTabelaDeItens;
    procedure GravarItemParaHistorico;
    procedure GravarItensNoHistorico;
    procedure MostrarValorFaltanteDePagto;
    procedure AtualizarCaixaComVendaRetroativa;
    procedure DirecionarFocoAposDigitacaoDoValor;
    procedure TratarValorDePagamento(valorTotalPagtos:double);
    procedure GravarTiposEValoresPagamentos;
    procedure AtualizarCuponsDeImpressao;
    procedure DesabilitarItensCabecalho;
    procedure MostraTotalRecebidoETroco;
    procedure CancelarItemDaVendaAtual;

    //FUNCOES
    function RetiraPonto(S: string) : double;
    function retornarTotalPagtos    : double;
    function retornarTotalCupom     : double;
    function retornarDiferenca      : double;
    function retornarValorRecebido  : double;
    function retornarValorTroco     : double;
    function retornarPendencia      : double;
    function gerarValorPendencia    : double;

    //PROCEDURES DEFAULT
    procedure Calculadora1Click(Sender: TObject);
    procedure Retoanr1Click(Sender: TObject);
    procedure edtQdeExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodBarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescontoChange(Sender: TObject);
    procedure edtDescontoEnter(Sender: TObject);
    procedure edtCodBarrasExit(Sender: TObject);
    procedure edtCodBarrasEnter(Sender: TObject);
    procedure edtQdeEnter(Sender: TObject);
    procedure valorDINHEIROExit(Sender: TObject);
    procedure valorDINHEIROKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure valorDINHEIROClick(Sender: TObject);
    procedure valorCREDITOClick(Sender: TObject);
    procedure valorDEBITOClick(Sender: TObject);
    procedure edtTrocoEnter(Sender: TObject);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure valorDEBITOKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescricaoClick(Sender: TObject);
    procedure valorCREDITOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure valorCREDITOExit(Sender: TObject);
    procedure valorDEBITOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescricaoEnter(Sender: TObject);
    procedure valorCREDITOEnter(Sender: TObject);
    procedure valorDEBITOEnter(Sender: TObject);
    procedure valorDEBITOExit(Sender: TObject);
    procedure valorDINHEIROEnter(Sender: TObject);
    procedure btnSomarClick(Sender: TObject);
    procedure valorDINHEIROKeyPress(Sender: TObject; var Key: Char);
    procedure valorCREDITOKeyPress(Sender: TObject; var Key: Char);
    procedure edtTrocoClick(Sender: TObject);
    procedure edtCodBarrasChange(Sender: TObject);
    procedure edtCodBarrasClick(Sender: TObject);
    procedure ListBox1Enter(Sender: TObject);    //esta função deverá me retornar o tipo de pagto(string 1) e o valor do pagto (double)

  private
    { Private declarations }

    desconto, totalpago, totalpagar, troco, ValorSaldoAnterior, ValorSaldoAtualAposMovto, ValorFaltantePagto, valorRecebido, valorTroco,valorSubTotal, valorAPagar,
    SomaDosPagtos, TotalDaCompra, TaxaDesconto, EstoqueAtual, QdeVendida, valorDePendencia, subTotal, totalCupom, vlPagtoDinheiro, vlPagtoCredito, vlPagtoDebito : double;

    jafoi, opc,  id_produto, id_produtoItem, idVendedor, proxNumHistorico, idDoCliente, Cancelado, IDProdutoCancelado, idVendaCupom  : integer;

    CodBarrasProduto, sNumeroItem, mes_ano, dataHistorico, horaHistorico, historicoVenda, precoProdutoVendido : string;

    pagar  : Boolean;

    umProduto : TProduto;

    {variavel jafoi refere-se ao item cancelado, se for zero nao foi cancelado, se for 1 ja foi cancelado
    variavel conf identifica se foi aberta uma venda = (1) ou nao = (0)
    variavel vendeu é para o sistema saber que deve habilitar o botao de impressao do cupom apos venda}

  public
    { Public declarations }
    idFormaPagto, item, Conf,  idVenda, contador  : integer;
    totalgeral, totalProdNaoCad, EstoqueAtualizado, QuantidadeVendida, Estoque_Atual, valorDoMovimento  : double;
    fechar, vaiPagarVenda : Boolean;

  end;

var
  _frmCaixa: T_frmCaixa;

  //StatusCursor array => os indices seguem o padrao dos <Fs> ex: 2=<F2>... COMEÇAM A CONTAR DO 2
  StatusCursor : array [2..18] of string = ('<F2>Calculadora', '<F3>Sair da venda',' <F4>Listar produtos', '<F5>Cancelar o Ítem', '<F6>Alterar data da venda ou valor do ítem',
                                            '<F7>Cancelar venda', '<F8>Fechar venda', '<F9> Concluir pagamento | <F7> Cancelar a venda', '<F10> Conceder desconto', '<F11>Prod. não cadastrado',
                                            'Digite o produto<Enter>', 'Quantidade vendida <Enter>', '<F5>Cancelar Ítem', '<F6>Alterar Data venda ou Vlr. ìtem','Valor de pagamento <Enter>',
                                            'Escolha o tipo de desconto entre com o valor e tecle <Enter>','<Enter> para finalizar...  |  <F7> para cancelar a venda');

implementation

uses U_dmDadosSegundo, U_dmDados, U_dmPesquisas, DBClient, U_BiblioSysSalao,  U_EscolhaDoProdutoParaVenda, DB, SqlExpr, U_EscolhaFormaDePagamento,
  U_Config, U_principal, U_VendaProdsNaoCads, U_ConsultaCotacoesRealizadas,  U_ConsCotacoesPeriodo, U_Clientes, U_ConsHistoricoClientes,
  U_QRelCupomVenda, U_ControlaDataDaVenda, U_GerarCreditosPorCartao,  U_EscolhaDoProdutoParaTroca, U_DescontoSobreVenda, U_GerarCreditosPorPendencia, U_FiltrandoProdutoParaVenda;


{$R *.dfm}


procedure T_frmCaixa.FormCreate(Sender: TObject);
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

  self.Caption               := 'CLIENTE : '+sNomeClienteVenda+' | '+'IMPRESSORA '+retornarTipoImpressora;;
  fechar                     := false;
  AbriTabelas;

end;

procedure T_frmCaixa.FormShow(Sender: TObject);
begin

    AbrirNovaVenda;
    MostraIDVenda;
    retornarTipoImpressora;
    MostrarFotoPadrao;

end;


procedure T_frmCaixa.Calculadora1Click(Sender: TObject);
begin

   WinExec('c:\windows\calc.exe',1);

end;

procedure T_frmCaixa.Retoanr1Click(Sender: TObject);
begin

	close;

end;

procedure T_frmCaixa.edtCodBarrasExit(Sender: TObject);
begin

  //TODA VEZ QUE SAIR DO CODIGO PRECISA VERIFICAR SE O MESMO JA ESTA INSERIDO OU NAO NA VENDA

  if not(fechar) then   // Ao sair do codigo verifica se fechar = false
  begin

          if ( edtCodBarras.Text = '0' )then
          begin

              edtDescricao.SetFocus;

          end else begin

                 PesquisarProdutoNoEstoque;

          end;

  end
  else begin

           edtCodBarras.Text          := '0';
           panel_cabecalho.Enabled    := false;
           valorDINHEIRO.SetFocus;

  end;

  if AlterouDataVenda then
  begin
      DataVenda := DataVendaAlterada;
  end else
      DataVenda := date;

end;


procedure T_frmCaixa.PesquisarProdutoNoEstoque;
var
   codigoBarras:string;
   idProduto:integer;
begin

   codigoBarras := edtCodBarras.Text;

   //verifica se o produto existe no estoque
   with DM_Pesq.Qry_Auxiliar do
   begin

       close;
       SQL.Clear;
       SQL.Add('select p.* from produtos p where p.cod_barras=:pCodBarras');
       Params.ParamByName('pCodBarras').AsString := codigoBarras;
       open;

           If IsEmpty then      //se nao encontrou um produto com o codigo entrado...
           begin
                 Application.MessageBox('Atenção produto não encontrado no estoque, favor verificar!','Produto não encontrado!', MB_ICONEXCLAMATION);
                 edtCodBarras.Text :='0';
                 edtCodBarras.SetFocus;
           end
           else begin

                  //se encontrou um produto com o codigo entrado...

                  idProduto                 := DM_Pesq.Qry_Auxiliar.Fieldbyname('ID_PRODUTO').AsInteger;
                  edtDescricao.Text	       	:= DM_Pesq.Qry_Auxiliar.Fieldbyname('DESCRICAO').AsString;
                  edtEstoque.Text	         	:= FloatToStr(DM_Pesq.Qry_Auxiliar.Fieldbyname('ESTOQUE_ATUAL').AsFloat);
                  edtPreco.Text	            := FloatToStr(DM_Pesq.Qry_Auxiliar.Fieldbyname('PRECOVENDA').AsFloat);
                  lblidProduto.Caption      := IntToStr(idProduto);

                  {ShowMessage('id produto : '+IntToStr(idProduto));
                  ShowMessage('id venda   : '+IntToStr(idVenda)); }


                  //verificar se o item ja consta dessa venda
                  //ShowMessage(BoolToStr(ProdutoConstaDaVendaAtual(idProduto)));

                  if(ProdutoConstaDaVendaAtual(idProduto))then
                  begin

                       //Application.MessageBox('Este produto já foi adicionado a esta venda, se'#13'necessário  exclua  o  ítem com <F5> para  nova  entrada!','Duplicidade!', MB_ICONEXCLAMATION);
                       texto:= 'Esse produto já esta inserido nesta venda exclua o ítem com <F5> e insira o produto novamente com a nova quantidade!';
                       Application.MessageBox(PChar(texto),'Produto repetido!',MB_OK + MB_ICONEXCLAMATION);

                       edtQde.Text              := '0';
                       edtPreco.Text            := '0.00';
                       edtPrecoAlterado.Text    := '0.00';
                       edtTotal.Text            := '0.00';
                       edtEstoque.Text          := '0.00';
                       edtCodBarras.Text        := '0';
                       edtPrecoAlterado.Visible := false;
                       edtPreco.Visible         := true;
                       alterouPreco             := false;
                       MostrarFotoPadrao;
                       edtDescricao.Clear;
                       edtCodBarras.SetFocus;

                  end else
                  begin
                       MostrarFotoProduto;
                       edtQde.SetFocus;   //por aqui se da a sequencia da venda
                  end;

           end;
     end;

end;

procedure T_frmCaixa.edtQdeExit(Sender: TObject);
begin

 if edtQde.Tag = 0 then
 begin

    if ( edtQde.Text = '0' )then
    begin

          Application.MessageBox('Entre com a quantidade','Quantidade inválida!', MB_OK);
          edtQde.SetFocus;

    end else begin

           //verificando se é um produto ou serviço. Se for produto verifica estoque senao segue em frente
           VerificaSeEProduto(StrToInt(lblidProduto.Caption));

           if EProduto then begin

               InserirItemDoProdutoNaVenda;

           end else begin

               InserirServicoNaVenda;

           end;

        end;

   end;

end;

procedure T_frmCaixa.GravarItemParaHistorico;
begin

     //grava o nome dos itens da venda na tabela para inserir no historico depois de confirmado o pagamento

     _Sql := 'INSERT INTO t_itens ( id_produto,produto ) VALUES ( :pIdProd, :pProduto )';

     with DM_Pesq.Qry_Geral do
     begin

         close;
         sql.Clear;
         sql.Add(_Sql);
         Params.ParamByName('pIdProd').AsInteger   := StrToInt(lblidProduto.Caption);
         Params.ParamByName('pProduto').AsString   := edtDescricao.Text;
         ExecSQL();

     end;


end;

procedure T_frmCaixa.InserirServicoNaVenda;
begin

        //INSERINDO OS SERVIÇOS NA VENDA SEM A VERIFICACAO DE QUANTIDADE DE ESTOQUE

        if ( alterouPreco ) then
        begin

            edtTotal.Text        := FloatToStr(StrToFloat(edtPrecoAlterado.Text) * StrToFloat(edtQde.Text));
            precoProdutoVendido  := edtPrecoAlterado.Text;

        end else begin

            edtTotal.Text        := FloatToStr(StrToFloat(edtPreco.Text) * StrToFloat(edtQde.Text));
            precoProdutoVendido  := edtPreco.Text;

        end;


        lblTotalItem.caption := edtTotal.Text;        //total
        lblQde.Caption       := edtQde.Text;          //quantidade

        //inserindo itens no listbox
        inc(item);                                             //incrementa item(inteiro)
        lblItem.caption      := inttostr(item);                //item

        // (StringOfChar('determina o caracter a ser mostrado',se numero for 3-Length(inttostr(item))) mostra 2 zeros
        ListBox1.Items.Add(StringOfChar('0',3-Length(inttostr(item))) + inttostr(item) + ' ' + (StringOfChar('0',13-Length(edtCodBarras.Text)) + edtCodBarras.Text) + ' ' + Copy(edtDescricao.Text,1,18));
        ListBox1.Items.Add(StringOfChar(' ',5-Length(edtQde.Text)) + edtQde.Text + ' x ' + StringOfChar(' ',8-Length(precoProdutoVendido)) + precoProdutoVendido +  StringOfChar(' ',20-Length(edtTotal.Text)) + edtTotal.Text + ' + ');

        GravarItemParaHistorico;   //grava o nome do produto na tabela t_itens para gravação no historico

        Soma;

        historicoVenda := 'MAO DE OBRA';    //IDENTIFICANDO O HISTORICO DA VENDA
        GravaItens;

        LimpaCabecalho;

        conf   := 1;                        // significa que tem uma venda aberta e não será permitido com F3 para sair até que seja fechada
        jafoi  := 0;                        //variavel jafoi refere-se ao item cancelado, se for zero nao foi cancelado, se for 1 ja foi cancelado


end;

procedure T_frmCaixa.InserirItemDoProdutoNaVenda;
var
   cod_alt1 : string;
begin
      //INSERINDO OS PRODUTOS NA VENDA
      QdeVendida       :=  StrToFloat(edtQde.Text);
      CodBarrasProduto :=  edtCodBarras.Text;

       //Verifica a quantidade do produto no estoque e joga na variavel EstoqueAtual
       with DM_Pesq.Qry_Geral do
       begin

            close;
            sql.Clear;
            sql.Add('SELECT * FROM produtos WHERE cod_barras = :pCodigoBarra');
            ParamByName('pCodigoBarra').AsString := CodBarrasProduto;
            open;

            if not IsEmpty then begin

                 EstoqueAtual  :=  DM_Pesq.Qry_Geral.fieldbyname('estoque_atual').AsFloat;
                 cod_alt1      :=  DM_Pesq.Qry_Geral.fieldbyname('cod_alt1').asstring;
            end;

       end;

       if ( QdeVendida > EstoqueAtual ) then
       begin

           Application.MessageBox('Estoque insuficiente para esta transação, tecle <F4> e verifique o saldo disponível!','Estoque insuficiente!', MB_OK);
           LimpaCabecalho;

       end
       else begin

            //Se tiver quantidade suficiente para venda segue abaixo...

        if ( alterouPreco ) then
        begin

            edtTotal.Text        := FloatToStr(StrToFloat(edtPrecoAlterado.Text) * StrToFloat(edtQde.Text));
            precoProdutoVendido  := edtPrecoAlterado.Text;

        end else begin

            edtTotal.Text        := FloatToStr(StrToFloat(edtPreco.Text) * StrToFloat(edtQde.Text));
            precoProdutoVendido  := edtPreco.Text;

        end;

            lblTotalItem.caption := edtTotal.Text;        //total
            lblQde.Caption       := edtQde.Text;          //quantidade

            //inserindo itens no listbox
            inc(item);
            lblItem.caption      := inttostr(item);

            // (StringOfChar('determina o caracter a ser mostrado',se numero for 3-Length(inttostr(item))) mostra 2 zeros
            ListBox1.Items.Add(StringOfChar('0',3-Length(inttostr(item))) + inttostr(item) + ' ' + (StringOfChar('0',13-Length(edtCodBarras.Text)) + edtCodBarras.Text) + ' ' + Copy(edtDescricao.Text,1,18));
            ListBox1.Items.Add(StringOfChar(' ',5-Length(edtQde.Text)) + edtQde.Text + ' x ' + StringOfChar(' ',8-Length(precoProdutoVendido)) + precoProdutoVendido +  StringOfChar(' ',20-Length(edtTotal.Text)) + edtTotal.Text + ' + ');

            GravarItemParaHistorico;   //grava o nome do produto na tabela t_itens para gravação no historico
            
            Soma;

            historicoVenda := 'VENDA DE PRODUTO';    //IDENTIFICANDO O HISTORICO DA VENDA
            GravaItens;

            LimpaCabecalho;

            conf   := 1;                             // significa que tem uma venda aberta e não será permitido com F3 para sair até que seja fechada
            jafoi  := 0;                             //variavel jafoi refere-se ao item cancelado, se for zero nao foi cancelado, se for 1 ja foi cancelado
            
       end;

       edtDescricao.SetFocus;
       
       //<F7>Cancelar venda | <F4>Listar Produtos | Digite o Produto | <F8>Fechar venda | <F5>Cancelar ítem
       panel_boasvindas.Caption := StatusCursor[7]+' | '+StatusCursor[4]+' | '+StatusCursor[12]+' | '+StatusCursor[8]+' | '+StatusCursor[14];
       fechandoVenda := false;

end;


procedure T_frmCaixa.btnSomarClick(Sender: TObject);
begin

   soma;

end;

procedure T_frmCaixa.Soma;
begin

   //somando os itens e jogando nos labels

   totalgeral                     := totalgeral + StrToFloat(lblTotalItem.Caption);
   lblMostraValorVenda.Text       := FloatToStr(totalgeral);

   edtSubTotal.text               := FloatToStr(TotalGeral);
   edtTotalpagar.text             := FloatToStr(TotalGeral);

   lbltotalgeral.Caption          := FloatToStr(TotalGeral);

end;

procedure T_frmCaixa.LimpaCabecalho;
begin

     edtQde.Text              := '0';
     edtPreco.Text            := '0.00';
     edtPrecoAlterado.Text    := '0.00';
     edtEstoque.Text          := '0.00';
     edtTotal.Text            := '0.00';
     edtCodBarras.Text        := '0';
     edtPrecoAlterado.Visible := false;
     edtPreco.Visible         := true;
     alterouPreco             := false;
     MostrarFotoPadrao;
     edtDescricao.Clear;
     edtDescricao.SetFocus;

end;


procedure T_frmCaixa.GravaItens;
var
  vlUnitario : double;
begin

      //gravando o item na tabela de itens da venda

      if ( alterouPreco ) then
      begin

            vlUnitario    := StrToFloat(edtPrecoAlterado.Text);

        end else begin

            vlUnitario    := StrToFloat(edtPreco.Text);

        end;


       PesquisaIDProduto;

        //ATUALIZA A TABELA DE ITENS
        proxNum := GerarProximoID('id_itens','itens_vendas');

        with dm_DadosSegundo.cds_ItensVendas do
        begin

             Append;
             FieldByName('id_itens').AsInteger            := proxNum;
             FieldByName('id_venda').AsInteger            := IdVenda;
             FieldByName('id_produto').AsInteger          := id_produto;
             FieldByName('vl_unitario').AsFloat           := vlUnitario;
             FieldByName('quantidade').AsFloat            := StrToFloat(lblQde.caption);
             FieldByName('vl_totalitem').AsFloat          := StrToFloat(lblTotalItem.Caption);
             FieldByName('flag_devolucao').AsString       := 'A';              //LIBERADO PARA DEVOLVER AO ESTOQUE EM CASO DE CANCELAMENTO
             FieldByName('historico_venda').AsString      := historicoVenda;   //nao é utilizado aqui
             ApplyUpdates(0);

          end;

          historicoVenda := '';

          //======================================================================================================================

          IdDoUsuarioLogado := IdFuncionarioLogado(NomeDoUsuarioLogado);

end;


procedure T_frmCaixa.AtualizarHistoricoVP;
var
   ValorDeLucro, PrecoCompra, PrecoVenda, LucroSobreItem : double;
begin
       //ATUALIZA A TABELA HISTORICO_PRODUTOS

       _Sql := 'SELECT * FROM itens_vendas WHERE id_venda = :pIDVenda';

        with DM_Pesq.Qry_Auxiliar do
        begin

            close;
            sql.Clear;
            sql.Add(_Sql);
            Params.ParamByName('pIDVenda').AsInteger   := idVenda;
            open;

            while not eof do
            begin

                 id_produtoItem    :=  DM_Pesq.Qry_Auxiliar.Fields[2].AsInteger;
                 QuantidadeVendida :=  DM_Pesq.Qry_Auxiliar.Fields[4].AsFloat;
                 historicoVenda    :=  DM_Pesq.Qry_Auxiliar.Fields[7].AsString;
                 PrecoCompra       := 0;
                 PrecoVenda        := 0;
                 LucroSobreItem    := 0;

                  //buscando o valor de lucro do produto
                  _Sql := 'SELECT id_produto, precocompra, precovenda, valordelucro FROM produtos WHERE id_produto = :pIDProdutoVenda';
                  with DM_Pesq.Qry_Geral do
                  begin

                      close;
                      sql.Clear;
                      sql.Add(_Sql);
                      Params.ParamByName('pIDProdutoVenda').AsInteger   := id_produtoItem;
                      open;

                      if not IsEmpty then
                      begin

                            //se for venda de Produto Cadastrado
                            ValorDeLucro    := DM_Pesq.Qry_Geral.Fields[3].AsFloat;
                            PrecoCompra     := DM_Pesq.Qry_Geral.Fields[1].AsFloat;
                            PrecoVenda      := DM_Pesq.Qry_Geral.Fields[2].AsFloat;
                            LucroSobreItem  := ( ValorDeLucro * QuantidadeVendida );

                      end;

                  end;

                  //ATUALIZAR HISTORICO DE PRODUTOS NA VENDA
                  proxNumHistorico := GerarProximoID('id_historico','historico_produtos');

                   // Abrindo um registro novo e gravando no bd
                   with dm_DadosSegundo.cds_HistoricoProdutos do begin

                      Append;

                      FieldByName('id_historico').AsInteger     := proxNumHistorico;
                      FieldByName('produto_id').AsInteger       := id_produtoItem;
                      FieldByName('pedido_id').AsInteger        := 0;
                      FieldByName('numnf').AsString             := '0';
                      FieldByName('fornecedor_id').AsInteger    := 0;
                      FieldByName('venda_id').AsInteger         := idVenda;
                      FieldByName('cliente_id').AsInteger       := idDoCliente;
                      FieldByname('operador_id').AsInteger      := idVendedor;
                      FieldByname('valordelucro').AsFloat       := LucroSobreItem;
                      FieldByname('precocompra').AsFloat        := PrecoCompra;
                      FieldByname('precovenda').AsFloat         := PrecoVenda;
                      FieldByname('codmov').AsString            := 'VP';         //Venda de produto
                      FieldByname('quantidade').AsFloat         := QuantidadeVendida;
                      FieldByname('datamov').AsDateTime         := date;
                      FieldByname('historico').AsString         := historicoVenda;
                      mes_ano                                   := nomeMes + '/' +  IntToStr(YearOf(DataDoDia));
                      FieldByName('mesano').AsString            := mes_ano;
                      ApplyUpdates(0);

                   end;
             next;
         end;
   end;

end;

procedure T_frmCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin

    // Enter por Tab verifica se a tecla pressionada é a tecla ENTER, conhecida pelo Delphi como #13
    If key = #13 then
    Begin
        //se for, passa o foco para o próximo campo, zerando o valor da variável Key
        Key:= #0;
        Perform(Wm_NextDlgCtl,0,0);
    end;

end;

procedure T_frmCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

      if Key = VK_F2 then begin

          //abre calculadore do windows   F2
          WinExec('c:\windows\system32\calc.exe',1);

      end else
      if Key = VK_F3 then begin

           if Conf = 1 then
           begin
                //se uma venda estiver aberta nao deixa sair sem fechar ou cancelar   F3
                Application.MessageBox('No  momento  você  esta  com  uma  venda  em  andamento,'#13'cancele  com  <F7>  ou  feche  com  <F8>  para  continuar!','Venda aberta!',MB_ICONEXCLAMATION)

           end
           else begin
                // se sair sem ítens exclui a venda aberta
                ExcluirVendaAberta;
                close;
           end;

      end else
      if Key = VK_F7 then begin

         if Conf = 0 then

            Application.MessageBox('No momento não existe uma venda aberta para cancelar!','Informação do Sistema',Mb_IconInformation)

          else

            //cancela a venda em andamento 
            ExcluirVendaEItens;

      end else
       if Key = VK_F9 then begin

           //pagar a venda em andamento    F9
           if Conf = 0 then begin

              Application.MessageBox('No momento não existe uma venda aberta para efetuar o pagamento!','Informação do Sistema',Mb_IconInformation);
              exit;

            end else begin

               if not(pagar) then  //pagar = false
               begin

                   Application.MessageBox('Você deve fechar a venda primeiro!','Informação do Sistema',Mb_IconInformation);

               end
               else if (edtValorRecebido.Text = '0,00') then  // se pagar = true
               begin

                       Application.MessageBox('Entre com o valor de pagamento!','Informação do Sistema',Mb_IconInformation);
                       edtValorRecebido.SetFocus;

               end
               else begin

                    PagarVenda;
                    
              end;

            end;

        end else    
        if key = vk_F4 then
        begin

           if not ( fechar ) then
           begin

              Application.CreateForm(T_frmEscolhaDoProdutoParaVenda, _frmEscolhaDoProdutoParaVenda);
              _frmEscolhaDoProdutoParaVenda.ShowModal;
              FreeAndNil(_frmEscolhaDoProdutoParaVenda);

           end else begin

              exit;

           end;

        end else
       if Key = VK_F6 then
       begin

                if not ( fechar ) and ( edtPreco.Text <> '0,00' ) then
                begin

                      IDVendaParaAlterarData :=  idVenda;
                      valorDoItem :=  StrToFloat(edtPreco.Text);

                      //abre tela de alteração da data da venda
                      Application.CreateForm(T_frmControlaDataDaVenda, _frmControlaDataDaVenda);
                      _frmControlaDataDaVenda.ShowModal;
                      FreeAndNil(_frmControlaDataDaVenda);


                end;

      end else
      if Key = VK_F8 then
      begin
            //a variavel vaiPagarVenda será usada para bloquear a tecla F8 quando estiver no edtTroco, ela deve funcionar apenas para fechar a venda
            if not(vaiPagarVenda)then
            begin
                 // ao clicar o F8 o usuario expressa a vontade de fechar a venda
                 if conf = 1 then    //verifica se tem uma venda aberta - conf = 1 significa que tem venda aberta
                 begin

                       //se tiver venda aberta...
                       panel_formaspagto.Visible := true;
                       panel_formaspagto.Enabled := true;
                       grNumVenda  .top          := 2;
                       grValorVenda.top          := 2;
                       ListBox1.top              := 10;
                       ListBox1.Height           := 498;
                       fechar                    := true;  //apontando para o fechamento com a variavel fechar e confirmando o desejo de fechar
                       fechandoVenda             := true;  //a variavel fechandoVenda será usada para bloquear a tecla ENTER quando estiver no edtTroco

                       retornarTotalCupom;

                       DesabilitarItensCabecalho;

                       panel_DebitosPendentes.Enabled:=true;

                       pan_cabecalho.Enabled     := false;
                       pan_finalizar.Enabled     := false;
                       pan_pagamentos.Enabled    := true;

                       valorDINHEIRO.Enabled:=true;
                       valorCREDITO.Enabled :=true;
                       valorDEBITO.Enabled  :=true;
                       valorDINHEIRO.SetFocus;

                 end
                 else begin

                       // se nao tiver venda aberta...

                       Application.MessageBox('No momento não existe uma venda aberta para fechar!','Informação do Sistema',Mb_IconInformation);
                       fechar := false;
                       edtCodBarras.Text := '0';
                       edtCodBarras.SetFocus;

                 end;
            end;

         end else
         if Key = VK_F5 then
         begin

             if (Conf = 0) then  // se nao tiver venda aberta (conf = 1)
                  Application.MessageBox('Impossível cancelar ítens no momento a venda'#13'não  foi  inicializada com pelo menos um ítem!','Informação do Sistema',MB_ICONEXCLAMATION)
             else

             //cancela um item escolhido pelo usuario    F5
             EscolherItemAserCancelado;    

         end;
           
end;


procedure T_frmCaixa.edtCodBarrasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

        if KEY = VK_ESCAPE then    // 27 ESC
        begin

           edtCodBarras.Clear;

        end;

end;


procedure T_frmCaixa.ExcluirVendaEItens;
begin
          // F7  excluindo a venda e tambem os itens da mesma

          texto:= 'Confirma o cancelamento da venda atual?';

          if Application.MessageBox(PChar(texto),'Cancelamento da Venda',MB_YESNO + MB_ICONQUESTION) = IdYes then
          begin

                   with DM_Pesq.Qry_Geral do
                   begin

                       close;
                       sql.Clear;
                       sql.Add('DELETE FROM itens_vendas WHERE id_venda = :pIDVenda');
                       Params.ParamByName('pIDVenda').AsInteger           := idVenda;
                       ExecSQL();

                   end;

                   //excluindo creditos referentes a venda  

                   with DM_Pesq.Qry_Auxiliar do
                   begin

                       close;
                       sql.Clear;
                       sql.Add('DELETE FROM ativos_credito WHERE venda_id = :pIDVenda');
                       Params.ParamByName('pIDVenda').AsInteger           := idVenda;
                       ExecSQL();

                   end;

                   //excluindo a venda
                   with DM_Pesq.Qry_Auxiliar do
                   begin

                       close;
                       sql.Clear;
                       sql.Add('DELETE FROM venda WHERE id_venda = :pIDVenda');
                       Params.ParamByName('pIDVenda').AsInteger    := idVenda;
                       ExecSQL();

                   end;

                    //excluindo a venda
                   with DM_Pesq.Qry_Auxiliar do
                   begin

                       close;
                       sql.Clear;
                       sql.Add('DELETE FROM tipospgtos WHERE id_venda = :pIDVenda');
                       Params.ParamByName('pIDVenda').AsInteger    := idVenda;
                       ExecSQL();

                   end;


                   //Excluindo os tipos na tabela tipospgtos da venda atual
                   ExcluirTiposPgtos;

                    dm_DadosSegundo.cds_ItensVendas.Active := false;
                    dm_DadosSegundo.cds_ItensVendas.Active := true;

                    Application.MessageBox('A venda atual foi cancelada com sucesso!', 'Obrigado volte sempre!', MB_OK);
                    LogOperacoes(NomeDoUsuarioLogado, 'cancelamento de uma venda');
                    LimparTelaDaVendaExcluida;
                    totalProdNaoCad := 0;

          end
          else begin
              exit;
          end;

          AbrirFecharTabelas;

end;

procedure T_frmCaixa.ExcluirVendaAberta;
begin

       with DM_Pesq.Qry_Geral do
       begin

           close;
           sql.Clear;
           sql.Add('DELETE FROM venda WHERE status = :pStatus');
           Params.ParamByName('pStatus').AsString    := 'A';
           ExecSQL();

       end;

       AbrirFecharTabelas;

end;


procedure T_frmCaixa.ExcluirTiposPgtos;
begin

     with DM_Pesq.Qry_Geral do
     begin

         close;
         sql.Clear;
         sql.Add('DELETE FROM tipospgtos WHERE id_venda = :pIDVenda');
         Params.ParamByName('pIDVenda').AsString          := IntToStr(idVenda) ;
         ExecSQL();

     end;

     AbrirFecharTabelas;

end;

procedure T_frmCaixa.EscolherItemAserCancelado;
var itemCancelar: string;
    tamanho : integer;
begin

       repeat
          sNumeroItem  := InputBox('Entre com o ítem a ser cancelado' , 'Cancelando Ítem!','');

          //Para o caso do usuário digitar o numero do ítem com os dois zeros na frente
          tamanho      := length(sNumeroItem);
          if(tamanho = 3)then
          begin
             sNumeroItem  := copy(sNumeroItem,3,1);       //001 -> 1
          end else if(tamanho = 4)then
          begin
             sNumeroItem  := copy(sNumeroItem,3,2);       //0010 -> 10
          end;
      until (sNumeroItem <> '') and (sNumeroItem <> '0'); //nao aceitar zero nem vazio como entrada

      itemCancelar := '00'+sNumeroItem+' ';   //EX  '001 ' ->Para ser encontrado dentro do ListBox

      //se encontrar a string dentro do ListBox cancelar ítem senão msg
      if(ItemEncontradoNoListBox(ListBox1,itemCancelar))then
       begin
         CancelarItemDaVendaAtual;

        end else
       begin
        Application.MessageBox('Atenção ítem não encontrado, entre novamente'#13'com   o   ítem  a  ser  excluído   da  venda  atual.','Item não encontrado!',MB_ICONEXCLAMATION);
        exit;
       end;

end;

procedure T_frmCaixa.CancelarItemDaVendaAtual;
begin

        opc := Application.MessageBox('Deseja Mesmo Cancelar o Item Informado?','Pergunta do Sistema',Mb_YesNo + Mb_IconQuestion);

        If opc = IdYes then
        begin

            Cancelado     := StrToInt(sNumeroItem) * 2 - 2;

            //mostrando na tela o cancelamento
            ListBox1.Items.Add(StringOfChar('*',38));
            ListBox1.Items.Add(ListBox1.Items[Cancelado]);
            ListBox1.Items.Add('ITEM CANCELADO');
            ListBox1.Items.Add(StringOfChar('*',38));

            lblTotalItem.caption := Copy(ListBox1.items[Cancelado+1],26,11);    // mostrando o total do ítem cancelado

             //acertando os totais apos o cancelamento e mostrando o total restante da venda no lblMostraValorVenda e no labeltotalvenda
             totalgeral                   := totalgeral - StrToFloat(lblTotalItem.Caption);

             lblMostraValorVenda.text     := FloatToStr(TotalGeral);
             edtTotalpagar.text           := FloatToStr(TotalGeral);
             edtSubTotal.text             := FloatToStr(TotalGeral);

             // Na query abaixo esta procurando '+#39+trim(Copy(ListBox1.items[Cancelado],5,13))+#39) = valor do cod_barras
             // ou seja do ítem que foi cancelado se encontrou devolve a quantidade ao estoque atual

             //Devolvendo a qde do ítem cancelo para tabela produtos
             with DM_Pesq.cdsPesqVendaProduto do begin

                close;
                CommandText := ('select * from produtos where cod_barras ='+#39+trim(Copy(ListBox1.items[Cancelado],5,13))+#39);
                open;

                lblQde.Caption      := Copy(ListBox1.items[Cancelado+1],1,5);            // quantidade
                IDProdutoCancelado  := DM_Pesq.cdsPesqVendaProdutoID_PRODUTO.Value;      // peguei o id do produto cancelado

                if not IsEmpty then
                begin

                  Edit;
                  DM_Pesq.cdsPesqVendaProdutoEstoque_Atual.asFloat := DM_Pesq.cdsPesqVendaProdutoEstoque_Atual.asFloat + StrToFloat(lblQde.Caption);
                  DM_Pesq.cdsPesqVendaProduto.ApplyUpdates(0);

                end;

                {PRECISO DO ID DO PRODUTO PARA NAO DEVOLVER A QDE CASO CANCELE A VENDA COM (F7) POSTERIORMENTE,
                POIS O ITEM JA FOI DEVOLVIDO ACIMA, RESOLVI ISSO COLOCANDO 'C' NO FLAG POIS
                NO CANCELAMENTO(F7) DA VENDA SÓ É DEVOLVIDO AO ESTOQUE QUEM TIVER FLAG 'A' }

                with DM_Pesq.cdsPesqItensVendas do begin

                    close;
                    CommandText := ('select * from itens_vendas where id_produto = :pIDProduto AND flag_devolucao = '+QuotedStr('A')+' ');
                    Params.ParamByName('pIDProduto').AsInteger := IDProdutoCancelado;
                    open;

                    if not IsEmpty then
                    begin

                      DM_Pesq.cdsPesqItensVendas.Edit;
                      DM_Pesq.cdsPesqItensVendasFLAG_DEVOLUCAO.Value := 'C';
                      DM_Pesq.cdsPesqItensVendas.ApplyUpdates(0);

                    end;

                end;
                //ShowMessage('ID PRODUTO CANCELADO : '+IntToStr(IDProdutoCancelado));
                DeletarRegistroPeloID('t_itens',IDProdutoCancelado);

                DM_Pesq.cdsPesqGeral.Active:=false;
                DM_Pesq.cdsPesqGeral.Active:=true;
                IDProdutoCancelado := 0;
                
          end;

           edtCodBarras.SetFocus;

      end;

end;


procedure T_frmCaixa.LimparTelaDaVendaExcluida;
begin

     close;

end;


procedure T_frmCaixa.LimparTelaParaAbrirNovaVenda;
begin

      ListBox1.Clear;
      MostrarFotoPadrao;
      TotalGeral                  := 0;
      lblMostraValorVenda.text    := '0,00';
      edtSubTotal.Text            := '0,00';
      edtDesconto.Text            := '0,00';
      edtTotalpagar.Text          := '0,00';
      edtValorRecebido.Text       := '0,00';
      edtTroco.Text               := '0,00';
      valorDINHEIRO.Text          := '0,00';
      valorCREDITO.Text           := '0,00';
      valorDEBITO.Text            := '0,00';
      valorPENDENCIA.Text         := '0,00';
      valorDIFERENCA.Text         := '0,00';
      lblMostraValorVenda.text    := '0,00';
      lbl_IdVenda.Caption         :=  IntToStr(idVenda+1);
      lbl_IdVenda.Caption         :=  StringOfChar('0',10-Length(lbl_IdVenda.Caption))+lbl_IdVenda.Caption;
      panel_cabecalho.Enabled     := true;
      edtCodBarras.SetFocus;
      item                        := 0;  //zerando o item para nova
      panel_boasvindas.Caption    := 'Entre com o código do produto';
    
end;

procedure T_frmCaixa.BaixarQdeDoEstoque;
begin

      _Sql := 'SELECT p.estoque_atual, p.id_produto, p.tipo, i.id_produto, i.id_venda, i.quantidade FROM produtos p, '+
              'itens_vendas i WHERE p.id_produto = i.id_produto AND i.id_venda = :pIDVenda AND p.tipo = '+QuotedStr('P')+'';

        with DM_Pesq.Qry_Auxiliar do
        begin

            close;
            sql.Clear;
            sql.Add(_Sql);
            Params.ParamByName('pIDVenda').AsInteger   := idVenda;
            open;

            while not eof do
            begin

                 Estoque_Atual     :=  DM_Pesq.Qry_Auxiliar.FieldByName('ESTOQUE_ATUAL').AsFloat;
                 id_produtoItem    :=  DM_Pesq.Qry_Auxiliar.FieldByName('ID_PRODUTO').AsInteger;
                 QuantidadeVendida :=  DM_Pesq.Qry_Auxiliar.FieldByName('QUANTIDADE').AsFloat;

                 EstoqueAtualizado :=  (Estoque_Atual - QuantidadeVendida);

                     //ATUALIZANDO O ESTOQUE NA TABELA PRODUTOS
                     with DM_Pesq.Qry_Geral do
                     begin

                          close;
                          sql.Clear;
                          sql.Add('UPDATE produtos SET Estoque_atual = :pEstoqueAtual WHERE id_produto = :pIdProduto');
                          Params.ParamByName('pEstoqueAtual').AsFloat    := EstoqueAtualizado;
                          Params.ParamByName('pIdProduto').AsInteger     := id_produtoItem;
                          ExecSQL();

                     end;
             next;

           end;
     end;
end;

procedure T_frmCaixa.PagarVenda;
begin

              // PAGANDO A VENDA

              panel_boasvindas.Caption    := 'Pagamento aceito, Obrigado!';
              panel_boasvindas.Font.Color := clinfobk;

              if dm_DadosSegundo.cds_Venda.Locate('id_venda',idVenda,[]) then
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


                  with dm_DadosSegundo.cds_Venda do
                  begin

                    Edit;
                    FieldByname('status').AsString                := 'F';
                    FieldByname('vl_bruto').AsFloat               := totalgeral;
                    FieldByname('vl_desconto').AsFloat            := desconto;
                    FieldByname('vl_totalpagar').AsFloat          := StrToFloat(edtTotalCupom.Text);
                    FieldByname('vl_recebido').AsFloat            := retornarTotalPagtos;
                    FieldByname('vl_parcelado').AsFloat           := valorParcelado;
                    FieldByname('vl_troco').AsFloat               := StrToFloat(edtTroco.Text);
                    FieldByname('vl_liquido').AsFloat             := StrToFloat(edtTotalCupom.Text);
                    FieldByname('id_Vendedor').AsInteger          := (IdFuncionarioLogado('status'));
                    mes_ano                                       := nomeMes + '/' +  IntToStr(YearOf(DataDoDia));
                    FieldByName('mesano').AsString                := mes_ano;
                    FieldByName('nummes').AsInteger               := numMes;
                    FieldByname('tipo').AsString                  := 'V';

                    ApplyUpdates(0);

                  end;


                  // Localizar qual registro sera alterado para F (FECHADO) na tabela de ítens

                  with DM_Pesq.Qry_Geral do
                  begin

                       close;
                       sql.Clear;
                       sql.Add('UPDATE itens_vendas SET flag_devolucao = :pNovoFlag Where flag_devolucao = :pFlagAtual');
                       Params.ParamByName('pNovoFlag').AsString  := 'F';
                       Params.ParamByName('pFlagAtual').AsString := 'A';
                       ExecSQL;

                  end;


                  AbrirFecharTabelas;
                  conf := 0;

              end;

              GravarTiposEValoresPagamentos;
              AtualizarCaixaAposMovimento;
              AtualizarHistoricoAtivos;
              AtualizarHistoricoVP;
              
              BaixarQdeDoEstoque;

              LimparTelaParaAbrirNovaVenda;


             vendeu := true;
             GravarItensNoHistorico;
             LogOperacoes(NomeDoUsuarioLogado, 'crédito por venda de produto no crédito ou pendência');

             {  RESOLVI NAO MOSTRAR O HISTORICO APOS A VENDA DE PRODUTOS AOS CLIENTES
             if (vendaCliente)then
             begin

               //abre o formulario de historico auto, se for cliente cadastrado
               _frmConsHistorico := T_frmConsHistorico.Create(Self);
               _frmConsHistorico.ShowModal;
               FreeAndNil(_frmConsHistorico);

             end;
             }

            //se for cliente BALCAO imprime cupom
            LogOperacoes(NomeDoUsuarioLogado, 'crédito por venda de produto a dinheiro ou débito');
            edtValorRecebido.Text :='0,00';
            edtTotalCupom.Text    :='0,00';

            //Direciona a impressao do cupom
            if(imprimirJato)then
            begin
               ImprimirCupomJato;
            end else if (imprimirMatricial)then
            begin
               ImprimirCupomMatricial;
            end;

            AtualizarCuponsDeImpressao;

            vendaCredito    := false;
            GerouPendencia  := false;
            valorParcelado  := 0;
            close;

end;


procedure T_frmCaixa.AtualizarHistoricoAtivos;
begin

      // ATUALIZANDO O HISTORICO DE ATIVOS COM VENDA DE PRODUTO
      proxNum := GerarProximoID('id_historicoativos','historico_ativos');

      with dm_Conexao.cds_HistoricoAtivos do
       begin

        append;
        FieldByname('id_historicoativos').AsInteger   := proxNum;
        FieldByname('cliente_id').AsInteger           := idCliente;
        FieldByname('vendedor_id').AsInteger          := IdFuncionarioLogado(NomeDoUsuarioLogado);
        FieldByname('id_venda').AsInteger             := idVenda;
        FieldByname('vl_liquido').AsFloat             := totalpago - troco;
        FieldByName('historico').AsString             := 'PAGAMENTO DA VENDA N.'+ Inttostr(idVenda);
        FieldByName('flag_pagto').AsString            := 'PV';    //PAGAMENTO DE VENDA
        mes_ano                                       := nomeMes + '/' +  IntToStr(YearOf(DataDoDia));
        FieldByName('mesano').AsString                := mes_ano;
        FieldByname('data').AsDateTime                := DataVenda;

        ApplyUpdates(0);

      end;     

end;


procedure T_frmCaixa.AtualizarCaixaAposMovimento;
var
  proxNumIdCaixa  : integer;
begin

           //VERIFICAR O VALOR DO SALDO ANTERIOR (ULTIMO REGISTRO)

            _Sql := 'select id_caixa, saldo_atual from caixa WHERE '+
                    'id_caixa = (select max(id_caixa) from caixa)';

           With DM_Pesq.qry_Cod do
           begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              Open;

                  if not IsEmpty then begin

                       ValorSaldoAnterior := DM_Pesq.qry_Cod.Fields[1].Value;

                  end;

           end;

           // ATUALIZANDO O CAIXA
           proxNumIdCaixa := GerarProximoID('id_caixa','caixa');

             if ( vendaCredito ) OR ( GerouPendencia ) then
             begin

                 historicoDaVendaParaCaixa := 'PAGAMENTO PARCIAL DA VENDA N.'+ Inttostr(idVenda);

                 if ( SomaDosPagtos = 0 )  then
                 begin
                        valorDoMovimento         :=  0;
                        ValorSaldoAtualAposMovto := ( ValorSaldoAnterior );

                 end else begin

                   // so vai mostrar o movimento sem acrescentar o valor no caixa pois a movimentação se dara qdo do pagto das duplicatas
                   valorDoMovimento         :=  (  (StrToFloat(valorDINHEIRO.Text) +  StrToFloat(valorCREDITO.Text)) );
                   ValorSaldoAtualAposMovto := ( ValorSaldoAnterior + valorDoMovimento );

                 end;

             end else if not( vendaCredito ) OR not ( GerouPendencia ) then
             begin

                    //venda normal sem pagto a credito
                    historicoDaVendaParaCaixa := 'PAGAMENTO DA VENDA N.'+ Inttostr(idVenda);

                    valorDoMovimento          := StrToFloat(valorDINHEIRO.Text) +  StrToFloat(valorCREDITO.Text) +  +  StrToFloat(valorDEBITO.Text);
                    ValorSaldoAtualAposMovto  := ( ValorSaldoAnterior + valorDoMovimento );

             end;


            with  dm_Conexao.cds_Caixa do
            begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNumIdCaixa;
                FieldByName('id_venda').AsInteger        := idVenda;
                FieldByName('saldo_anterior').AsFloat    := ValorSaldoAnterior;
                FieldByName('valor_movimento').AsFloat   := valorDoMovimento;
                FieldByName('saldo_atual').AsFloat       := ValorSaldoAtualAposMovto;
                FieldByName('data').AsDateTime           := DataVenda;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := historicoDaVendaParaCaixa;

                ApplyUpdates(0);

            end;

            AbrirFecharTabelas;
            fechar                     := false;
            pagar                      := false;   // ate aqui pagar era = true desde que foi inserido um produto no listbox, ao pagar volta a ser false


            MovimentacaoComTroco;

            if ( AlterouDataVenda )then
            begin

                AtualizarCaixaComVendaRetroativa;

            end;

end;


procedure T_frmCaixa.MovimentacaoComTroco;
var
  proxNumIdCaixa : integer;
begin

     Troco     := StrToFloat(edtTroco.Text);

     if Troco <> 0 then
     begin

          //VERIFICAR O VALOR DO SALDO ANTERIOR (ULTIMO REGISTRO)

            _Sql := 'select id_caixa, saldo_atual from caixa WHERE '+
                    'id_caixa = (select max(id_caixa) from caixa)';


           With DM_Pesq.qry_Cod do
           begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              Open;

                  if not IsEmpty then begin

                       ValorSaldoAnterior := DM_Pesq.qry_Cod.Fields[1].Value;

                  end;

           end;

           ValorSaldoAtualAposMovto := ( ValorSaldoAnterior - Troco );

           // ATUALIZANDO O CAIXA
           proxNumIdCaixa := GerarProximoID('id_caixa','caixa');

            with  dm_Conexao.cds_Caixa do
            begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNumIdCaixa;
                FieldByName('id_venda').AsInteger        := idVenda;
                FieldByName('saldo_anterior').AsFloat    := ValorSaldoAnterior;
                FieldByName('valor_movimento').AsFloat   := -Troco;
                FieldByName('saldo_atual').AsFloat       := ValorSaldoAtualAposMovto;
                FieldByName('data').AsDateTime           := DataVenda;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := 'TROCO DA VENDA N.'+IntToStr(idVenda);

                ApplyUpdates(0);

            end;

            AbrirFecharTabelas;

     end;

end;


procedure T_frmCaixa.AtualizarCaixaComVendaRetroativa;
var
  proxNumIdCaixa  : integer;
begin
      
           //VERIFICAR O VALOR DO SALDO ANTERIOR (ULTIMO REGISTRO)

            _Sql := 'select id_caixa, saldo_atual from caixa WHERE '+
                    'id_caixa = (select max(id_caixa) from caixa)';

           With DM_Pesq.qry_Cod do
           begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              Open;

                  if not IsEmpty then begin

                       ValorSaldoAnterior := DM_Pesq.qry_Cod.Fields[1].Value;

                  end;

           end;

             // ATUALIZANDO O CAIXA
             proxNumIdCaixa := GerarProximoID('id_caixa','caixa');

             if ( vendaCredito ) then
             begin

                 historicoDaVendaParaCaixa := 'PAGAMENTO PARCIAL DA VENDA N.'+ Inttostr(idVenda);

                 if ( SomaDosPagtos = 0 ) then
                 begin

                    valorDoMovimento         :=  _frmGerarCreditosPorCartao.valorTotalDaVenda;
                    ValorSaldoAtualAposMovto := ( ValorSaldoAnterior + valorDoMovimento );

                 end else begin

                   // so vai mostrar o movimento sem acrescentar o valor no caixa pois a movimentação se dara qdo do pagto das duplicatas
                   valorDoMovimento         :=  StrToFloat(valorDINHEIRO.Text) +  StrToFloat(valorCREDITO.Text);
                   ValorSaldoAtualAposMovto := ( ValorSaldoAnterior  );

                 end;

             end else if not( vendaCredito ) then
             begin

                 historicoDaVendaParaCaixa := 'PAGAMENTO DA VENDA N : '+ Inttostr(idVenda);
                 valorDoMovimento          := 0;
                 ValorSaldoAtualAposMovto  := ( ValorSaldoAnterior );

             end;


            with  dm_Conexao.cds_Caixa do
            begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNumIdCaixa;
                FieldByName('id_venda').AsInteger        := idVenda;
                FieldByName('saldo_anterior').AsFloat    := ValorSaldoAnterior;
                FieldByName('valor_movimento').AsFloat   := valorDoMovimento;
                FieldByName('saldo_atual').AsFloat       := ValorSaldoAtualAposMovto;
                FieldByName('data').AsDateTime           := date;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := 'ACERTO VENDA RETROATIVA N.' +IntToStr(idVenda)+ ' DE '+ DateToStr(DataVendaAlterada);

                ApplyUpdates(0);

            end;

            AbrirFecharTabelas;
            fechar                     := false;
            pagar                      := false;   // ate aqui pagar era = true desde que foi inserido um produto no listbox, ao pagar volta a ser false
            AlterouDataVenda           := false;

end;


procedure T_frmCaixa.TotalPagarAposDesconto;
begin

   desconto       := StrToFloat(edtDesconto.Text);
   totalpagar     := (totalgeral - desconto);
   totalpago      := StrToFloat(edtValorRecebido.Text);

end;


procedure T_frmCaixa.GravarItensNoHistorico;
var
  servRealizado, conteudoAtual, ItemProduto   : string;
  posicaoAtual    : integer;
begin

        with DM_Pesq.cdsPesqCliente do
        begin

            Close;
            CommandText:= ('SELECT * FROM clientes WHERE cli_status = '+QuotedStr('A')+' AND cli_id > 1');
            Open;

            if not IsEmpty then
            begin

                 DBMemoHistorico.DataSource :=  DM_Pesq.dsPesqCliente;
                 DBMemoHistorico.DataField  :=  'CLI_HISTORICO';

            end;

        end;


         With DM_Pesq.Qry_Geral do
         begin

              Close;
              SQL.Clear;
              SQL.Add('SELECT * FROM t_itens');
              Open;

              while not eof do
              begin

                     ItemProduto := DM_Pesq.Qry_Geral.FieldByName('PRODUTO').AsString;

                     if ( DM_Pesq.cdsPesqCliente.Locate('CLI_ID',StrToInt(lblIDCliente.Caption),[]) )then
                     begin

                          DM_Pesq.cdsPesqCliente.Edit;

                          //passando a dataAtual e horaAtual
                          horaHistorico := TimeToStr(time);
                          dataHistorico := DateToStr(DataVenda);

                          // Armazena a coluna atual em que se encontra o no dbMemo
                          posicaoAtual :=  DBMemoHistorico.SelStart;

                          // Armazena o texto contido anteriormente no dbMemo - Copy(objeto,inicio,fim);
                          conteudoAtual := Copy(DBMemoHistorico.Text,0,posicaoAtual);

                          //Preenchendo o dbMemo com o conteudo
                          DBMemoHistorico.SelStart := Length(conteudoAtual);

                          //adiciona o item vendido no historico do cliente
                          servRealizado := dataHistorico + ' ' + horaHistorico + ' ..: ' + ' PRODUTO : ' + ItemProduto + ' , ' + ' REF. VENDA. N. '+ Inttostr(IdVenda);

                          //Entrando com o serviço inserido na venda
                          DBMemoHistorico.Lines.Add(servRealizado);

                          DM_Pesq.cdsPesqCliente.ApplyUpdates(0);

                    end;

                    next;

               end;
       end;
end;

procedure T_frmCaixa.ImprimirCupomJato;
begin

    if(getTipoImpressoraDefinida = 'JATOTINTA')then
    begin

      {Aqui o Sistema deveria verificar qual impressora esta setada como padrão, se for a impressora de cupom
      imprime nela caso contrario imprime o relatorio tido como cupom abaixo}

      //Application.MessageBox('Imprimindo cupom...', 'Imprimindo', MB_OK);
      AvisoTemporario('Imprimindo cupom...');

      Application.CreateForm(TQ_RelCupomVenda,  Q_RelCupomVenda);
      with Q_RelCupomVenda.cds_RelCupomVenda do
      begin

          Close;
          Params.ParamByName('pIDVenda').value  :=  idVenda;
          Open;

          Q_RelCupomVenda.cds_RelCupomVenda.Active        := True;
          Q_RelCupomVenda.QryEmpresa.Active               := true;
          Q_RelCupomVenda.lblNomeUsuarioLogado.Caption    := sUsuarioLogado;
          Q_RelCupomVenda.ReportTitle                     := 'Cupom de Venda';
          Q_RelCupomVenda.Preview;

      end;
    end;
    
end;
                  

procedure T_frmCaixa.ImprimirCupomMatricial;
begin

    if(getTipoImpressoraDefinida = 'MATRICIAL')then
    begin

        AvisoTemporario('Imprimindo cupom...');

        //GERA O CUPOM COM AS DEFINIÇÕES
        GerarCupomMatricial(idVendaCupom);
    end;

end;

procedure T_frmCaixa.PesquisaIDProduto;
begin

  if dm_Conexao.cds_CadProduto.Locate('cod_barras',edtCodBarras.Text, []) then
  begin
       id_produto :=  dm_Conexao.cds_CadProduto.fieldbyname('id_produto').AsInteger;

  end;

end;

procedure T_frmCaixa.AbriTabelas;
begin

    dm_Conexao.cds_CadProduto.Active               := true;
    dm_DadosSegundo.cds_ItensVendas.Active         := true;
    dm_DadosSegundo.cds_Venda.Active               := true;
    DM_Pesq.cdsPesqVendaProduto.Active             := true;
    DM_Pesq.cdsPesqItensVendas.Active              := true;
    dm_DadosSegundo.cds_TiposPgtos.Active          := true;
    dm_Conexao.cds_Caixa.Active                    := true;
    dm_DadosSegundo.cds_Config.Active              := true;
    dm_Conexao.cds_FormaPagtos.Active              := true;
    dm_DadosSegundo.cds_HistoricoProdutos.Active   := True;
    dm_Conexao.cds_HistoricoAtivos.Active          := true;
    
end;

procedure T_frmCaixa.FecharTabelas;
begin

    dm_DadosSegundo.cds_Config.Active              := false;
    dm_DadosSegundo.cds_ItensVendas.Active         := false;
    dm_DadosSegundo.cds_TiposPgtos.Active          := false;
    dm_DadosSegundo.cds_Venda.Active               := false;
    DM_Pesq.cdsPesqVendaProduto.Active             := false;
    DM_Pesq.cdsPesqItensVendas.Active              := false;
    dm_Conexao.cds_Caixa.Active                    := false;
    dm_DadosSegundo.cds_HistoricoProdutos.Active   := False;
    dm_Conexao.cds_HistoricoAtivos.Active          := False;
    DM_Pesq.cdsPesqGeral.Active                    := False;

end;


procedure T_frmCaixa.AbrirFecharTabelas;
begin

    dm_Conexao.cds_CadProduto.Active               := false;
    dm_DadosSegundo.cds_ItensVendas.Active         := false;
    dm_DadosSegundo.cds_Venda.Active               := false;
    dm_DadosSegundo.cds_TiposPgtos.Active          := false;
    DM_Pesq.cdsPesqVendaProduto.Active             := false;
    DM_Pesq.cdsPesqItensVendas.Active              := false;
    dm_Conexao.cds_Caixa.Active                    := false;
    dm_DadosSegundo.cds_Config.Active              := false;
    dm_DadosSegundo.cds_HistoricoProdutos.Active   := False;
    dm_Conexao.cds_HistoricoAtivos.Active          := False;

    dm_Conexao.cds_CadProduto.Active               := true;
    dm_DadosSegundo.cds_TiposPgtos.Active          := true;
    dm_DadosSegundo.cds_ItensVendas.Active         := true;
    dm_DadosSegundo.cds_Venda.Active               := true;
    DM_Pesq.cdsPesqVendaProduto.Active             := true;
    DM_Pesq.cdsPesqItensVendas.Active              := true;
    dm_Conexao.cds_Caixa.Active                    := true;
    dm_DadosSegundo.cds_Config.Active              := true;
    dm_DadosSegundo.cds_HistoricoProdutos.Active   := True;
    dm_Conexao.cds_HistoricoAtivos.Active          := true;


end;

procedure T_frmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     umProduto.Free;
     clienteNovo  := false;
     vendaCliente := false;
     gravarValoresPadraoDoClienteBalcao;
     FreeAndNil(Q_RelCupomVenda);
     FecharTabelas;
     Release;

end;

procedure T_frmCaixa.edtQdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

      if KEY = VK_ESCAPE then    // 27 ESC
      begin

           edtQde.Tag := 100;
           LimpaCabecalho;

      end;

      if key=13 then
      begin
          edtDescricao.SetFocus;
      end;

end;


procedure T_frmCaixa.MostrarTotaisNoListBox;
begin

      ListBox1.Items.Add(StringOfChar(' ',38));              //linha em branco
      ListBox1.Items.Add(StringOfChar(' ',38));              //linha em branco
      ListBox1.Items.Add(StringOfChar('*',38));

      //MOSTRA VALOR TOTAL DA COMPRA
      if totalgeral < 1000 then
      begin

          ListBox1.Items.Add('VL.COMPRA    : ' + (StringOfChar(' ',23-Length(edtTotalpagar.Text))+ FormatFloat('##,##0.00',totalgeral)));

      end else if totalgeral >= 1000 then

          ListBox1.Items.Add('VL.COMPRA    : ' + (StringOfChar(' ',22-Length(edtTotalpagar.Text))+ FormatFloat('##,##0.00',totalgeral)));       


      //MOSTRA VALOR DO DESCONTO
      if desconto = 0 then
      begin

          ListBox1.Items.Add('VL.DESCONTO  : ' + (StringOfChar(' ',23-Length(edtDesconto.Text))+ FormatFloat('##,##0.00',desconto)));


      end else if desconto <= 1000 then
      begin

          ListBox1.Items.Add('VL.DESCONTO  : ' + (StringOfChar(' ',23-Length(edtDesconto.Text))+ FormatFloat('##,##0.00',desconto)));

      end else if desconto > 1000 then
      begin

          ListBox1.Items.Add('VL.DESCONTO  : ' + (StringOfChar(' ',19-Length(edtDesconto.Text))+ FormatFloat('##,##0.00',desconto)));

      end;


      //MOSTRA VALOR DO CUPOM A PAGAR
      if totalpagar < 1000 then
      begin

          ListBox1.Items.Add('VL.CUPOM     : ' + (StringOfChar(' ',23-Length(edtTotalpagar.Text))+ FormatFloat('##,##0.00',totalpagar)));

      end else

          ListBox1.Items.Add('VL.CUPOM     : ' + (StringOfChar(' ',22-Length(edtTotalpagar.Text))+ FormatFloat('##,##0.00',totalpagar)));


end;


procedure T_frmCaixa.MostraTotalRecebidoETroco;
begin

    totalpago     := StrToFloat(edtValorRecebido.text);
    totalpagar    := strtofloat(edtTotalpagar.text);

    RetiraPonto(edtValorRecebido.Text);
    RetiraPonto(edtTotalpagar.Text);

    if ( totalpago >= totalpagar ) then
    begin

      troco                  := ( totalpago - totalpagar );
      edtTroco.Text          := FloatToStr(troco);
      RetiraPonto(edtTroco.Text);

      MostrarTotaisNoListBox;

      //ajustando as casas decimais
      if totalpago < 1000 then
      begin

          ListBox1.Items.Add('VL.PAGO      : ' + (StringOfChar(' ',23-Length(edtValorRecebido.Text))+ FormatFloat('##,##0.00',totalpago)));

      end else

          ListBox1.Items.Add('VL.PAGO      : ' + (StringOfChar(' ',22-Length(edtValorRecebido.Text))+ FormatFloat('##,##0.00',totalpago)));

      //=========================================================================================================================

      // colocando o valor do troco no listbox
      ListBox1.Items.Add(StringOfChar(' ',36));              //linha em branco

      //ajustando as casas decimais
      if troco < 1000 then
      begin

          ListBox1.Items.Add('TROCO        : ' + (StringOfChar(' ',23-Length(edtTroco.Text))+ FormatFloat('##,##0.00',troco)));

      end else

          ListBox1.Items.Add('TROCO        : ' + (StringOfChar(' ',26-Length(edtTroco.Text))+ FormatFloat('##,##0.00',troco)));

          ListBox1.Items.Add(StringOfChar('*',38));
          ListBox1.Items.Add(StringOfChar(' ',8)  +' Gratos pela preferência ');
          ListBox1.Items.Add(StringOfChar(' ',13) +' Volte sempre! ');
          ListBox1.Items.Add(StringOfChar('*',38));
          ListBox1.Items.Add('Venda N° : '+ lbl_IdVenda.Caption);
          ListBox1.Items.Add('Operador : '+ NomeDoUsuarioLogado);
          ListBox1.Items.Add('Data     : '+ DateToStr(DataVenda));
          ListBox1.Items.Add('Hora     : '+ TimeToStr(time));

          //Clique <F9> Pagar a venda | <F7> para cancelar a venda
          panel_boasvindas.Caption :=  StatusCursor[9];


      end;

      pagar := true;  // liberando venda para pagamento
      edtTroco.SelectAll;

end;

procedure T_frmCaixa.TratarValorDePagamento(valorTotalPagtos: double);
var
   valorTotalCupom : double;
begin
    //Faz o tratamento do valor total dos pagamentos
    valorTotalCupom := StrToFloat(edtTotalpagar.Text);

    if (valorTotalPagtos > valorTotalCupom)then
    begin
        retornarValorTroco;
    end else
    if ( (valorTotalPagtos < valorTotalCupom) and (not(clienteBalcao)) )then  //se for cliente cadastrado
    begin

        valorPENDENCIA.Text := FloatToStr(gerarValorPendencia);
        valorDIFERENCA.Text := FloatToStr(-gerarValorPendencia);

        //gerar pendencia de credito possibilitar parcelamento
        GerarPendenciaDeCredito;

     end else if ( (valorTotalPagtos < valorTotalCupom) and (clienteBalcao) )then
     begin

         GerouPendencia         := false;
         Application.MessageBox('Total do pagamento menor que o valor do cupom, verifique!', 'Valor total de pagamento inválido!', MB_ICONEXCLAMATION);
         pan_pagamentos.Enabled := true;
         valorDINHEIRO.SetFocus;
         
     end;

end;

procedure T_frmCaixa.edtTrocoEnter(Sender: TObject);
begin
         //ShowMessage(Screen.ActiveControl.Name); //identifica qual componente recebeu o foco nesse instante

         //Clique <Enter> para finalizar a venda | <F7> para cancelar a venda
         panel_boasvindas.Caption :=  StatusCursor[9];

         valorParcelado               := StrToFloat(valorPENDENCIA.Text);
         valorRecebido                := retornarTotalPagtos;
         pan_pagamentos.Enabled       := false;
         edtTotalCupom.Enabled        := false;
         edtValorRecebido.Enabled     := false;
         edtTroco.SelectAll;

         if(GerouPendencia)then
         begin
           //ShowMessage(BoolToStr(GerouPendencia));
           ListBox1.SetFocus;
           //ShowMessage(Screen.ActiveControl.Name);
         end else
         begin
            TratarValorDePagamento(retornarTotalPagtos);
         end;

         pagar := true;   //libera o pagamento da venda   
         vaiPagarVenda := true;

end;

procedure T_frmCaixa.GravarTiposEValoresPagamentos;
begin

     //GRAVANDO TIPOS DE PAGAMENTOS E SEUS VALORES
    gravatipo(valorDINHEIRO.Text,'1');
    gravatipo(valorCREDITO.Text,'2');
    gravatipo(valorDEBITO.Text,'3');
    gravatipo(valorPENDENCIA.Text,'4');

end;

procedure T_frmCaixa.gravatipo(EditNum,tipo:string);
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
              FieldByName('id_venda').AsString   := IntToStr(idVenda);
              FieldByName('data').AsDateTime     := DataVenda;
              FieldByName('tipo').AsString       := tipo;
              FieldByName('valor').AsString      := editnum;
              ApplyUpdates(0);

         end;

     end;
     AbrirFecharTabelas;
     
end;


procedure T_frmCaixa.edtDescontoChange(Sender: TObject);
begin

    edtValorRecebido.Visible := true;
    edtValorRecebido.Text    := '0,00';
    edtTroco.text            := '0,00';

end;


procedure T_frmCaixa.MostraIDVenda;
begin

     lbl_IdVenda.Caption       :=  IntToStr(idVenda);
     lbl_IdVenda.Caption       :=  StringOfChar('0',10-Length(lbl_IdVenda.Caption))+lbl_IdVenda.Caption;

end;

procedure T_frmCaixa.AbrirNovaVenda;
begin

           {idCliente traz o id do cliente selecionado, se idCliente = 1 significa se tratar de uma venda balcao, caso
           contrario de um cliente cadastrado no sistema}

           vendaCredito := false;

          // MostrarNomeDoCliente;
          if not(vendaCliente)then
          begin

             idDoCliente          := 1;
             lblIDCliente.Caption := '1';

          end else
          begin

             idDoCliente          := idClienteVenda;
             //ShowMessage('id do cliente selecinado : '+IntToStr(idClienteVenda) +'Nome do cliente selecionado : '+NomeDoClienteDaVenda);
             lblIDCliente.Caption := IntToStr(idClienteVenda);

          end;

           clienteBalcao :=  EClienteBalcao(idDoCliente);
           dm_DadosSegundo.cds_Venda.Active := true;

           //gravar a venda, ou abre nova venda

           idVendedor   := (IdFuncionarioLogado('status'));
           idVenda      := GerarProximoID('id_venda','venda');
           idVendaCupom := idVenda;

           with dm_DadosSegundo.cds_Venda do
           begin

                 Append;
                 FieldByName('id_venda').AsInteger             := idVenda;
                 FieldByName('id_vendedor').AsInteger          := idVendedor;
                 FieldByName('cliente_id').AsInteger           := idDoCliente;
                 FieldByName('data_venda').AsDateTime          := date;   //abrindo com a data do dia
                 FieldByName('hora_venda').AsString            := timeToStr(time);
                 FieldByName('status').AsString                := 'A';
                 ApplyUpdates(0);

           end;

           // limpando a tabela de itens para nova inserção
           ApagarTabelaDeItens;
              

end;

procedure T_frmCaixa.edtDescontoEnter(Sender: TObject);
begin

    panel_cabecalho.Enabled := false;
    panel_boasvindas.Caption := 'Entre com o desconto da venda';

end;

procedure T_frmCaixa.edtCodBarrasEnter(Sender: TObject);
begin
   
    if (lblTotalItem.Caption = 'lblTotalItem') then
    begin
      //<F2>Calculadora' | '<F3>Sair da Venda' | <F4>Listar de produtos   -   VENDA FECHADA
      panel_boasvindas.Caption := StatusCursor[2]+' | '+StatusCursor[3]+' | '+StatusCursor[4];
      edtQde.Tag  := 0;

    end else
    begin
      //<F4>Listar Produtos | <F5>Cancelar ítem | <F7>Cancelar venda | <F8>Fechar venda  -  VENDA ABERTA
      panel_boasvindas.Caption := StatusCursor[4]+' | '+StatusCursor[14]+' | '+StatusCursor[7]+' | '+StatusCursor[8];
      edtQde.Tag  := 0;

    end;
    edtCodBarras.SelectAll;
end;

procedure T_frmCaixa.edtQdeEnter(Sender: TObject);
begin

   if conf = 0 then    //verifica se tem uma venda aberta - conf = 1 significa que tem venda aberta
   begin
      //'<F3>Sair' | Entre com a quantidade <Enter> | Estoque atual : | <F6>Alterar Data venda ou Vl.ìtem'
      panel_boasvindas.Caption :=  StatusCursor[3]+' | '+StatusCursor[13]+' | '+StatusCursor[15];

   end else
   begin
      //'<F3>Sair' | Entre com a quantidade <Enter> | Estoque atual : | <F6>Alterar Data venda ou Vl.ìtem'
      panel_boasvindas.Caption :=  StatusCursor[7]+' | '+StatusCursor[13]+' | '+StatusCursor[15];

   end;

   MostrarFotoProduto;

end;

procedure T_frmCaixa.TotalDosPagamentos;
begin

     SomaDosPagtos := StrToFloat(valorDINHEIRO.Text) +  StrToFloat(valorCREDITO.Text) +  StrToFloat(valorDEBITO.Text) +  StrToFloat(valorPENDENCIA.Text);

     TotalDaCompra := StrToFloat(edtTotalpagar.Text);


     if SomaDosPagtos >= TotalDaCompra then
     begin

         edtValorRecebido.SetFocus;
         edtValorRecebido.Text := FloatToStr(SomaDosPagtos);
         RetiraPonto(edtValorRecebido.Text);
         edtTroco.Text            := FloatToStr( strtofloat(edtValorRecebido.Text) - strtofloat(edtTotalpagar.Text ) );

     end
     else begin

          Application.MessageBox( 'O total do pagamento não confere com o valor do cupom !', 'Atenção verifique...',
                                MB_IconInformation + MB_OK);

          edtValorRecebido.Text := FloatToStr(SomaDosPagtos);
          exit;
          valorDINHEIRO.SetFocus;

     end;

end;


procedure T_frmCaixa.valorDINHEIROExit(Sender: TObject);
begin

    retornarValorRecebido;
    retornarDiferenca;
    retornarPendencia;
    retornarValorTroco;
    DirecionarFocoAposDigitacaoDoValor;
     
end;

procedure T_frmCaixa.AplicarDescontoPorPercentual;
begin

        // entrando com o valor da taxa de desconto para calculo

        TaxaDesconto := strtofloat(_frmDesconto.edtPorPercentual.Text);
        desconto     :=  ( strtofloat(edtSubTotal.Text) * TaxaDesconto ) / 100;

        if ( desconto > strtofloat(edtTotalpagar.text) ) then
        begin

              Application.MessageBox('Valor de desconto maior que o valor da venda!', 'Desconto inválido!', MB_OK + MB_ICONWARNING);
              exit;

        end else
        begin
             edtTotalpagar.Text       :=  FloatToStr( strtofloat(edtTotalpagar.text) - Desconto );
             edtDesconto.Text         :=  FloatToStr(desconto);
             valorDINHEIRO.SetFocus;

        end;

end;

procedure T_frmCaixa.AplicarDescontoPorValor;
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
            edtDesconto.Text         :=  FloatToStr(desconto);
            valorDINHEIRO.SetFocus;
      end;

end;


function T_frmCaixa.RetiraPonto(S: string): Double;
begin

    S := StringReplace(S, ThousandSeparator,'' , [rfReplaceAll]);
    S := StringReplace(S, CurrencyString, '', [rfReplaceAll]);
    Result := StrToFloat(S);

end;

procedure T_frmCaixa.valorDINHEIROClick(Sender: TObject);
begin

      valorDINHEIRO.SelStart  := 0;
      valorDINHEIRO.SelLength := Length(valorDINHEIRO.Text);    

end;

procedure T_frmCaixa.valorCREDITOClick(Sender: TObject);
begin

     valorCREDITO.SelStart      := 0;
     valorCREDITO.SelLength     := Length(valorCREDITO.Text);

end;

procedure T_frmCaixa.valorDEBITOKeyPress(Sender: TObject; var Key: Char);
begin 

    pan_finalizar.Enabled :=true;

end;

procedure T_frmCaixa.valorDEBITOClick(Sender: TObject);
begin

     valorDEBITO.SelStart      := 0;
     valorDEBITO.SelLength     := Length(valorDEBITO.Text);

end;

procedure T_frmCaixa.GerarPendenciaDeCredito;
begin

     ShowMessage('Parte do total da compra ficou pendente, faça o tratamento do valor com o cliente!');
     NumVendaParaCreditos   := IntToStr(idVenda);
     ValorVendaParaCreditos := valorPENDENCIA.text;
     valorParcelado         := StrToFloat(ValorVendaParaCreditos);
     pagandoVenda           := true;
     GerouPendencia         := false;

     Application.CreateForm(T_frmGerarCreditosPorPendencia,  _frmGerarCreditosPorPendencia);
     _frmGerarCreditosPorPendencia.ShowModal;
     FreeAndNil(_frmGerarCreditosPorPendencia);

end;

procedure T_frmCaixa.valorDINHEIROEnter(Sender: TObject);
begin  

    ExcluirTiposPgtos;

   //GUIA => VALOR DE PAGTO | CANCELAR VENDA | CONCEDER DESCONTO  
    panel_boasvindas.Caption := StatusCursor[16]+' | '+StatusCursor[7]+' | '+StatusCursor[10];

    retornarValorRecebido;
    retornarDiferenca;
    retornarPendencia;
    retornarValorTroco;
    DirecionarFocoAposDigitacaoDoValor;

end;

procedure T_frmCaixa.MostrarFotoProduto;
begin

  if(edtCodBarras.Text <> '0')then
  begin  

     FotoDoProduto := ExtractFilePath(Application.ExeName)+'Produtos\'+edtCodBarras.Text+'.jpg';
     if(FileExists(FotoDoProduto))then
     begin
          img_produto.Picture.LoadFromFile(FotoDoProduto);
     end else
     begin
         texto:= 'A Imagem '+FotoDoProduto+', correspondente á imagem desse produto não foi encontrada, verifique se na pasta de fotos dos produtos tem uma foto com o código de barra referente a este produto, foi setada a imagem padrão!';
         Application.MessageBox(PChar(texto),'Imagem não encontrada!',MB_OK + MB_SYSTEMMODAL);
         MostrarFotoPadrao;
     end;

  end else
  begin  
       MostrarFotoPadrao;
  end;
              
end;

procedure T_frmCaixa.MostrarFotoPadrao;
var
  pathImgPadrao : string;
begin

       pathImgPadrao   := ExtractFilePath(Application.ExeName)+'Produtos\padrao.jpg';

      if FileExists(pathImgPadrao) then
      begin
            //verifica se a imagem da tela principal existe
            img_produto.Picture.LoadFromFile(pathImgPadrao);
            img_produto.Transparent := true;

      end else
      begin
            texto:= 'A Imagem '+pathImgPadrao+', correspondente á imagem padrão não foi encontrada!';
            Application.MessageBox(PChar(texto),'Imagem não encontrada!',MB_OK + MB_SYSTEMMODAL);

      end;

end;


procedure T_frmCaixa.ConfCaptionDosPagamentos;
begin

     if dm_DadosSegundo.cds_ConfigP1.AsString <> '' then
     begin
          LabelPgto1.Caption := '1 - '  +  dm_DadosSegundo.cds_ConfigP1.AsString
     end
     else begin
          LabelPgto1.Caption    := '1 - Sem Uso';
          LabelPgto1.Font.Color := clWhite;
          valorDINHEIRO.Enabled      := false;
     end;

      if dm_DadosSegundo.cds_ConfigP2.AsString <> '' then
     begin
          LabelPgto2.Caption := '2 - '  +  dm_DadosSegundo.cds_ConfigP2.AsString
     end
     else begin
          LabelPgto2.Caption    := '2 - Sem Uso';
          LabelPgto2.Font.Color := clWhite;
          valorCREDITO.Enabled      := false;
     end;

     if dm_DadosSegundo.cds_ConfigP3.AsString <> '' then
     begin
          LabelPgto3.Caption := '3 - '  +  dm_DadosSegundo.cds_ConfigP3.AsString
     end
     else begin
          LabelPgto3.Caption    := '3 - Sem Uso';
          LabelPgto3.Font.Color := clWhite;
          valorDEBITO.Enabled      := false;
     end;

     if dm_DadosSegundo.cds_ConfigP4.AsString <> '' then
     begin
          LabelPgto4.Caption := '4 - '  +  dm_DadosSegundo.cds_ConfigP4.AsString
     end
     else begin
          LabelPgto4.Caption    := '4 - Sem Uso';
          LabelPgto4.Font.Color := clWhite;
          valorPENDENCIA.Enabled      := false;
     end;

     if dm_DadosSegundo.cds_ConfigP5.AsString <> '' then
     begin
          LabelPgto5.Caption := '5 - '  +  dm_DadosSegundo.cds_ConfigP5.AsString
     end
     else begin
          LabelPgto5.Caption    := '5 - Sem Uso';
          LabelPgto5.Font.Color := clWhite;
          valorDIFERENCA.Enabled      := false;
     end;

end;

procedure T_frmCaixa.ApagarTabelaDeItens;
begin

     with DM_Pesq.Qry_Geral do
       begin

           close;
           sql.Clear;
           sql.Add('DELETE FROM t_itens');
           ExecSQL();

       end;

end;

procedure T_frmCaixa.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

      if KEY = VK_ESCAPE then    // 27 ESC
      begin

           edtDescricao.Clear;

      end;

     if ( key = 13 ) then
     begin

               //verifica se foi encontrado algo a respeito do que foi digitado se encontrar abre o grid de escolha caso contrario nao abre
               NomeDoProdutoParaVenda:= edtDescricao.Text;

               with DM_Pesq.cdsPesqProduto do
               begin

                     Close;
                     CommandText  := ('SELECT * FROM produtos WHERE descricao <> '+QuotedStr('PRODUTO NAO CADASTRADO')+' '+
                     'AND descricao LIKE ''%'+NomeDoProdutoParaVenda+'%'' AND status = '+QuotedStr('A')+' AND tipo = '+QuotedStr('P')+''+
                     'OR COD_ALT1 LIKE ''%'+NomeDoProdutoParaVenda+'%'' OR COD_ALT2 LIKE ''%'+NomeDoProdutoParaVenda+'%'' '+
                     'OR COD_ALT3 LIKE ''%'+NomeDoProdutoParaVenda+'%'' OR COD_ALT4 LIKE ''%'+NomeDoProdutoParaVenda+'%'' '+
                     'OR COD_BARRAS LIKE ''%'+NomeDoProdutoParaVenda+'%''ORDER BY descricao');

                     Open;


                    if not isEmpty then
                    begin

                         Application.CreateForm(T_frmFiltrandoProdutoParaVenda, _frmFiltrandoProdutoParaVenda);
                         _frmFiltrandoProdutoParaVenda.ShowModal;
                         FreeAndNil(_frmFiltrandoProdutoParaVenda);

                    end else begin

                        Application.MessageBox('A pesquisa atual não retornou resultados, verifique  se o nome do produto esta correto e tente com outro escopo!',
                             'Atenção nenhum produto encontrado!', MB_OK + MB_ICONINFORMATION);
                        close;
                        edtDescricao.Clear;
                        edtDescricao.SetFocus;

                    end;

               end;
     end;

end;


procedure T_frmCaixa.edtDescricaoClick(Sender: TObject);
begin
    edtDescricao.Clear;
end;

procedure T_frmCaixa.ConcederDescontoNaVenda;
begin

     //retornarTotalCupom;

     valorDINHEIRO.Text      := '0.00';
     valorCREDITO.Text       := '0.00';
     valorDEBITO.Text        := '0.00';
     valorPENDENCIA.Text     := '0.00';
     valorDIFERENCA.Text     := '0.00';
     edtDesconto.Text        := '0,00';
     edtTotalCupom.Text      := '0,00';
     desconto                := 0;
     edtTotalpagar.text      := FloatToStr(totalgeral);   
     pagandoVenda:=true;

     Application.CreateForm(T_frmDesconto,  _frmDesconto);
     _frmDesconto.ShowModal;
     FreeAndNil(_frmDesconto);

     retornarTotalCupom;

end;

procedure T_frmCaixa.valorDINHEIROKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

    if key = vk_F10 then
    begin
        ConcederDescontoNaVenda;
    end;

end;

procedure T_frmCaixa.valorCREDITOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if key = vk_F10 then
     begin
        ConcederDescontoNaVenda;
    end;

end;

procedure T_frmCaixa.valorDEBITOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

    if key = vk_F10 then
    begin
        ConcederDescontoNaVenda;
    end;

end;

procedure T_frmCaixa.valorCREDITOExit(Sender: TObject);
begin

    retornarValorRecebido;
    retornarDiferenca;
    retornarPendencia;
    retornarValorTroco;
    DirecionarFocoAposDigitacaoDoValor;     

end;

procedure T_frmCaixa.edtDescricaoEnter(Sender: TObject);
begin

  if conf = 0 then    //verifica se tem uma venda aberta -> conf = 1 significa que tem venda aberta
   begin
      //Calculadora | Sair da venda | Listar produtos
      panel_boasvindas.Caption := StatusCursor[12]+' | '+StatusCursor[2]+' | '+StatusCursor[3]+' | '+StatusCursor[4];

   end else
   begin
      //F4>Listar Produtos | <F5>Cancelar ítem | <F7>Cancelar venda | <F8>Fechar venda
      panel_boasvindas.Caption := StatusCursor[12]+' | '+StatusCursor[4]+' | '+StatusCursor[14]+' | '+StatusCursor[7]+' | '+StatusCursor[8];

   end;

end;

procedure T_frmCaixa.valorCREDITOEnter(Sender: TObject);
begin

  //GUIA => VALOR DE PAGTO | CANCELAR VENDA | CONCEDER DESCONTO
    panel_boasvindas.Caption := StatusCursor[16]+' | '+StatusCursor[7]+' | '+StatusCursor[10];

end;

procedure T_frmCaixa.valorDEBITOEnter(Sender: TObject);
begin

    //GUIA => VALOR DE PAGTO | CANCELAR VENDA | CONCEDER DESCONTO
    panel_boasvindas.Caption := StatusCursor[16]+' | '+StatusCursor[7]+' | '+StatusCursor[10];

end;

procedure T_frmCaixa.valorDEBITOExit(Sender: TObject);
begin

    retornarValorRecebido;
    retornarDiferenca;
    retornarPendencia;
    retornarValorTroco;
    DirecionarFocoAposDigitacaoDoValor;

    edtTotalCupom.Enabled        := false;
    edtValorRecebido.Enabled     := false;
    pan_finalizar.Enabled        := true;

    //identifica pra qual componente o foco esta indo
    //ShowMessage(Screen.ActiveControl.Name);

end;

procedure T_frmCaixa.MostrarValorFaltanteDePagto;
begin
     //AO SAIR DOS CAMPOS O valorDIFERENCA DEVERA MOSTRAR QTO FALTA PRA ATINGIR O VALOR TOTAL DA VENDA
     TotalDaCompra             := StrToFloat(edtTotalpagar.Text);
     ValorFaltantePagto        := (retornarTotalPagtos - TotalDaCompra);
     valorDIFERENCA.Text       := FloatToStr(retornarTotalPagtos - retornarTotalCupom);  //DIFERENÇA
     valorPENDENCIA.Text       := FloatToStr(-retornarDiferenca);  //PENDENCIA
     edtValorRecebido.Text     := FloatToStr(retornarTotalPagtos);
end;

function T_frmCaixa.retornarTotalCupom: double;
begin

     totalpagar := StrToFloat(edtTotalpagar.Text);
     result     := totalpagar;

     edtTotalCupom.Text := FloatToStr(result);

end;

function T_frmCaixa.gerarValorPendencia:double;
begin
      valorSubTotal         :=  retornarTotalPagtos;
      valorAPagar           :=  retornarTotalCupom;
      edtValorRecebido.Text :=  FloatToStr(valorSubTotal + StrToFloat(valorPENDENCIA.Text));

      valorDePendencia      :=  -(valorSubTotal - valorAPagar);
      Result                := valorDePendencia;

end;

function T_frmCaixa.retornarTotalPagtos: double;
begin
   //RETORNA A SOMA DOS VALORES PAGOS
   SomaDosPagtos := StrToFloat(valorDINHEIRO.Text) +  StrToFloat(valorCREDITO.Text) +  StrToFloat(valorDEBITO.Text);
   result        := SomaDosPagtos;

end;

function T_frmCaixa.retornarDiferenca: double;
begin
    //RETORNA A DIFERNCA ENTRE OS VALORES PAGOS E O VALOR TOTAL DA COMPRA
    totalpagar := retornarTotalCupom;
    subTotal   := retornarTotalPagtos - totalpagar;
    result     := subTotal;

    valorDIFERENCA.Text := FloatToStr(result);

end;


function T_frmCaixa.retornarValorRecebido: double;
begin

    valorRecebido         := retornarTotalPagtos;
    result                := valorRecebido;

    edtValorRecebido.Text := FloatToStr(result);

end;

function T_frmCaixa.retornarValorTroco: double;
begin

    valorTroco := retornarTotalPagtos - retornarTotalCupom ;
    result     := valorTroco;


    if(retornarTotalPagtos > retornarTotalCupom)then
       edtTroco.Text := FloatToStr(valorTroco);

end;

function T_frmCaixa.retornarPendencia: double;
begin
    //RETORNA A DIFERNCA ENTRE OS VALORES PAGOS E O VALOR TOTAL DA COMPRA
    totalCupom := StrToFloat(edtTotalpagar.text);
    subTotal   := totalCupom - retornarTotalPagtos;
    result     := subTotal;

    valorPENDENCIA.Text := FloatToStr(result);

end;

procedure T_frmCaixa.DirecionarFocoAposDigitacaoDoValor;
begin

    TotalDaCompra   := retornarTotalCupom;
    vlPagtoDinheiro := StrToFloat(valorDINHEIRO.text);
    vlPagtoCredito  := StrToFloat(valorCREDITO.text);
    vlPagtoDebito   := StrToFloat(valorDEBITO.text);

    if(vlPagtoDinheiro >= TotalDaCompra)then  //saindo do valor em DINHEIRO TUDO OK!
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

procedure T_frmCaixa.valorDINHEIROKeyPress(Sender: TObject; var Key: Char);
begin
  pan_finalizar.Enabled := true;
end;

procedure T_frmCaixa.valorCREDITOKeyPress(Sender: TObject; var Key: Char);
begin
   pan_finalizar.Enabled :=true;
end;

procedure T_frmCaixa.edtTrocoClick(Sender: TObject);
begin
    edtTroco.SelectAll;
end;

procedure T_frmCaixa.AtualizarCuponsDeImpressao;
begin

     _Sql := 'insert into relcupons (id_codigo, venda_id, cliente, cpf, cnpj, data_venda, mesano) '+
             'values (:id_codigo, :venda_id, :cliente, :cpf, :cnpj, :data_venda, :mesano)';

     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText:=(_Sql);
         Params.ParamByName('id_codigo').AsInteger     := GerarProximoID('id_codigo','relcupons');
         Params.ParamByName('venda_id').AsInteger      := idVenda;
         Params.ParamByName('cliente').AsString        := sNomeClienteVenda;
         Params.ParamByName('cpf').AsString            := cpf;
         Params.ParamByName('cnpj').AsString           := cnpj;
         Params.ParamByName('data_venda').AsDateTime   := now;
         mes_ano                                       := nomeMes + '/' +  IntToStr(YearOf(DataDoDia));
         Params.ParamByName('mesano').AsString         := mes_ano;
         execute;

    end;

end;

procedure T_frmCaixa.DesabilitarItensCabecalho;
begin

    edtCodBarras.ReadOnly     :=true;
    edtDescricao.ReadOnly     :=true;
    edtEstoque.ReadOnly       :=true;
    edtPreco.ReadOnly         :=true;
    edtQde.ReadOnly           :=true;

end;      

procedure T_frmCaixa.edtCodBarrasChange(Sender: TObject);
begin
      if Length(Trim(edtCodBarras.Text)) = 13 then  edtDescricao.setfocus;
end;

procedure T_frmCaixa.edtCodBarrasClick(Sender: TObject);
begin

     edtCodBarras.SelStart := 0;
     edtCodBarras.SelLength:= Length(edtCodBarras.Text);

end;

procedure T_frmCaixa.ListBox1Enter(Sender: TObject);
begin   

    if not(fechandoVenda)then
      edtCodBarras.SetFocus
    else
      edtTroco.SetFocus;

end;


end.



