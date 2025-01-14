unit U_PagamentoDeCotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls, DB,
  EditNum, DateUtils;

type
  T_frmPagarCotacao = class(TForm)
    pan_cabecalho: TPanel;
    pnl1: TPanel;
    Panel1: TPanel;
    LabelPgto1: TLabel;
    LabelPgto2: TLabel;
    LabelPgto3: TLabel;
    LabelPgto4: TLabel;
    LabelPgto5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    EditNum2: TEditNum;
    EditNum3: TEditNum;
    EditNum4: TEditNum;
    EditNum5: TEditNum;
    EditNum6: TEditNum;
    edt_ValorDebito: TEditNum;
    edtTotalpagar: TEditNum;
    edt_ValorDesconto: TEditNum;
    edtValorpago: TEditNum;
    edtvalorTroco: TEditNum;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    btnPagarCotacao: TSpeedButton;
    btnCancelarPagtoCotacao: TSpeedButton;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    txtNomeClienteCotacao: TStaticText;
    pan_rodape: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CancelarPagtoClick(Sender: TObject);
    procedure CalcularValorAPagar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure AtualizaCaixaAposMovimento;
    procedure MovimentacaoComTroco;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPagarCotacaoClick(Sender: TObject);
    procedure VerificarTotalDosPagamentos;
    procedure edtValorpagoEnter(Sender: TObject);
    procedure ExcluirTiposPgtos;
    procedure gravatipo(EditNum,tipo:string);
    procedure EditNum6Enter(Sender: TObject);
    procedure EditNum3Enter(Sender: TObject);
    procedure EditNum4Enter(Sender: TObject);
    procedure EditNum2Exit(Sender: TObject);
    procedure EditNum3Exit(Sender: TObject);
    procedure EditNum4Exit(Sender: TObject);
    procedure MostrarTotalRecebidoETroco;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure LimparTodosOsCampos;
    procedure ConfCaptionDosPagamentos;
    procedure EditNum5Enter(Sender: TObject);
    procedure EditNum5Exit(Sender: TObject);
    procedure EditNum6Exit(Sender: TObject);
    procedure PagarCotacao;
    procedure BaixarQdeDoEstoque;
    procedure GravandoItensDaVenda;
    procedure AtualizarHistoricoVP;
    procedure AtualizaHistoricoAtivos;
    procedure ImpressaoDoCupom;
    procedure EditNum2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_ValorDescontoEnter(Sender: TObject);
    procedure EditNum2Click(Sender: TObject);
    procedure EditNum3Click(Sender: TObject);
    procedure EditNum4Click(Sender: TObject);
    procedure EditNum5Click(Sender: TObject);
    procedure EditNum6Click(Sender: TObject);
    procedure edtvalorTrocoEnter(Sender: TObject);
    procedure EditNum2Enter(Sender: TObject);


  private
    { Private declarations }
    valorServico, valorDesconto, valorAPagar, valorPago, valorTroco,
    ValorSaldoAnterior, ValorSaldoAtualAposMovto, SomaDosPagtos, TotalDaCompra, vl_totalItem,
    subtotal,desconto,totalTroco,totalCupom,totalPago  : double;
    numCotacao, idDoCliente, id_produtoItem, vl_unitarioItem, quantidadeItem, IdVenda,
    EstoqueAtualizado,Estoque_Atual,QuantidadeVendida, proxNumHistorico : integer;

  public
    { Public declarations }


  end;

var

  _frmPagarCotacao: T_frmPagarCotacao;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas,
   U_dmDadosSegundo, U_Cotacao, U_QdeCotacao, U_OrdemDeServico, U_Caixa,
  U_FecharCotacao, U_QRelCupomVendaCotacao;

{$R *.dfm}

procedure T_frmPagarCotacao.FormCreate(Sender: TObject);
//DESABILITA O BOTAO FECHAR DO FORMUL�RIO
var
  hwndHandle : THANDLE;
  hMenuHandle : HMenu;
begin
//Impede movimenta��o do formul�rio
 DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  hwndHandle := Self.Handle;
  if (hwndHandle <> 0) then
    begin
      hMenuHandle := GetSystemMenu(hwndHandle, FALSE);
        if (hMenuHandle <> 0) then
          DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);

  end;

end;

procedure T_frmPagarCotacao.FormShow(Sender: TObject);
begin

     NumCotacao                    := _frmFecharCotacao.NumCotacao;
     pan_cabecalho.Caption         := 'Pagamento da Cota��o de Pre�o N� : '+ IntToStr(NumCotacao);
     idDoCliente                   := StrToInt(_frmFecharCotacao.txtIDCliente.text);
     txtNomeClienteCotacao.Caption := _frmFecharCotacao.txt_NomeClienteCotacao.Caption;
     edt_ValorDebito.Text          := _frmFecharCotacao.db_ValorTotal.Text;
     IDOperador                    := _frmFecharCotacao.IDOperador;
     AbrirTabelas;
     ConfCaptionDosPagamentos;


end;

procedure T_frmPagarCotacao.ConfCaptionDosPagamentos;
begin

     if dm_DadosSegundo.cds_ConfigP1.AsString <> '' then
     begin
          LabelPgto1.Caption := '1 - '  +  dm_DadosSegundo.cds_ConfigP1.AsString
     end
     else begin
          LabelPgto1.Caption    := '1 - Sem Uso';
          LabelPgto1.Font.Color := clWhite;
          EditNum2.Enabled      := false;
     end;

      if dm_DadosSegundo.cds_ConfigP2.AsString <> '' then
     begin
          LabelPgto2.Caption := '2 - '  +  dm_DadosSegundo.cds_ConfigP2.AsString
     end
     else begin
          LabelPgto2.Caption    := '2 - Sem Uso';
          LabelPgto2.Font.Color := clWhite;
          EditNum3.Enabled      := false;
     end;

     if dm_DadosSegundo.cds_ConfigP3.AsString <> '' then
     begin
          LabelPgto3.Caption := '3 - '  +  dm_DadosSegundo.cds_ConfigP3.AsString
     end
     else begin
          LabelPgto3.Caption    := '3 - Sem Uso';
          LabelPgto3.Font.Color := clWhite;
          EditNum4.Enabled      := false;
     end;

     if dm_DadosSegundo.cds_ConfigP4.AsString <> '' then
     begin
          LabelPgto4.Caption := '4 - '  +  dm_DadosSegundo.cds_ConfigP4.AsString
     end
     else begin
          LabelPgto4.Caption    := '4 - Sem Uso';
          LabelPgto4.Font.Color := clWhite;
          EditNum5.Enabled      := false;
     end;

     if dm_DadosSegundo.cds_ConfigP5.AsString <> '' then
     begin
          LabelPgto5.Caption := '5 - '  +  dm_DadosSegundo.cds_ConfigP5.AsString
     end
     else begin
          LabelPgto5.Caption    := '5 - Sem Uso';
          LabelPgto5.Font.Color := clWhite;
          EditNum6.Enabled      := false;
     end;   

end;


procedure T_frmPagarCotacao.btn_CancelarPagtoClick(Sender: TObject);
begin

    close;
    LimparTodosOsCampos;

end;

procedure T_frmPagarCotacao.CalcularValorAPagar;
begin

     valorServico        := StrToFloat(edt_ValorDebito.text);
     valorDesconto       := StrToFloat(edt_ValorDesconto.Text);

     valorAPagar         := ( valorServico - valorDesconto );

     edtTotalpagar.Text := FloatToStr(valorAPagar);

end;

procedure T_frmPagarCotacao.FormKeyPress(Sender: TObject; var Key: Char);
begin

  // Enter por Tab
  //verifica se a tecla pressionada � a tecla ENTER, conhecida pelo Delphi como #13
  If key = #13 then
  Begin
  //se for, passa o foco para o pr�ximo campo, zerando o valor da vari�vel Key
  Key:= #0;
  Perform(Wm_NextDlgCtl,0,0);
  end;

end;


procedure T_frmPagarCotacao.GravandoItensDaVenda;
begin

     //obtendo os valores necessarios para gravar os itens da cotacao na tabela de itens de vendas

    _Sql := 'SELECT cotacao_id, produto_id, unitario, quantidade, totalitem '+
            'FROM i_cotacao WHERE cotacao_id = :pIDCotacao';

    with DM_Pesq.Qry_Geral do
    begin
          close;
          sql.Clear;
          sql.Add(_Sql);
          Params.ParamByName('pIDCotacao').AsInteger := NumCotacao;
          open;

          while not Eof do
          begin

              id_produtoItem  :=  DM_Pesq.Qry_Geral.Fields[1].Value;
              vl_unitarioItem :=  DM_Pesq.Qry_Geral.Fields[2].Value;
              quantidadeItem  :=  DM_Pesq.Qry_Geral.Fields[3].Value;
              vl_totalItem    :=  DM_Pesq.Qry_Geral.Fields[4].Value;

              With DM_Pesq.qry_Cod do
              begin
                  Close;
                  SQL.Clear;
                  SQL.Add('select max(id_itens) from itens_vendas');
                  Open;

                  if not IsEmpty then

                      proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

                      with dm_DadosSegundo.cds_ItensVendas do
                      begin

                          Append;
                          FieldByName('id_itens').AsInteger            := proxNum;
                          FieldByName('id_venda').AsInteger            := IdVenda;
                          FieldByName('id_produto').AsInteger          := id_produtoItem;
                          FieldByName('vl_unitario').AsFloat           := vl_unitarioItem;
                          FieldByName('quantidade').AsInteger          := quantidadeItem;
                          FieldByName('vl_totalitem').AsFloat          := vl_totalItem;
                          FieldByName('flag_devolucao').AsString       := 'F';    //FECHADO PARA DEVOLUCAO
                          ApplyUpdates(0);

                      end;
                  end;
              Next;
            end;
        end;
end;


procedure T_frmPagarCotacao.BaixarQdeDoEstoque;
begin

        _Sql := 'SELECT p.estoque_atual, p.id_produto, i.id_produto, i.id_venda, i.quantidade FROM produtos p, '+
                'itens_vendas i WHERE p.id_produto = i.id_produto AND i.id_venda = :pIDVenda AND p.tipo='+QuotedStr('P')+'';

        with DM_Pesq.Qry_Auxiliar do
        begin

            close;
            sql.Clear;
            sql.Add(_Sql);
            Params.ParamByName('pIDVenda').AsInteger   := idVenda;
            open;

            while not eof do
            begin

                 Estoque_Atual     :=  DM_Pesq.Qry_Auxiliar.Fields[0].Value;
                 id_produtoItem    :=  DM_Pesq.Qry_Auxiliar.Fields[1].Value;
                 QuantidadeVendida :=  DM_Pesq.Qry_Auxiliar.Fields[4].Value;

                 EstoqueAtualizado :=  (Estoque_Atual - QuantidadeVendida);

                 //ATUALIZANDO O ESTOQUE NA TABELA PRODUTOS
                 with DM_Pesq.Qry_Geral do
                 begin

                      close;
                      sql.Clear;
                      sql.Add('UPDATE produtos SET Estoque_atual = :pEstoqueAtual WHERE id_produto = :pIdProduto');
                      Params.ParamByName('pEstoqueAtual').AsInteger  := EstoqueAtualizado;
                      Params.ParamByName('pIdProduto').AsInteger     := id_produtoItem;
                      ExecSQL();

                 end;
             next;
           end;
     end;
end;


procedure T_frmPagarCotacao.btnPagarCotacaoClick(Sender: TObject);
begin

          texto:= 'Confirma o pagamento da Cota��o atual?';
          opc := Application.MessageBox(PChar(texto),'Pagamento de Cota��o',MB_YESNO + MB_ICONQUESTION);

          if opc = IdYes then
          begin

               PagarCotacao;

          end else begin

             exit;

          end;

end;


procedure T_frmPagarCotacao.PagarCotacao;
begin

      //PAGAMENTO DE COTA��O SAI COMO UMA VENDA POIS OS PRODUTOS SAO VENDIDOS
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

       //gravar a venda, ou abre nova venda


       With DM_Pesq.qry_Cod do begin

          Close;
          SQL.Clear;
          SQL.Add('select max(id_venda) from venda');
          Open;

          if not IsEmpty then begin

             idVenda  := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

          end;

        end;

        subTotal     :=  StrToFloat(edt_ValorDebito.Text);
        desconto     :=  StrToFloat(edt_ValorDesconto.Text);
        totalCupom   :=  StrToFloat(edtTotalpagar.Text);
        totalTroco   :=  StrToFloat(edtvalorTroco.Text);
        totalPago    :=  StrToFloat(edtValorpago.Text); 

        with dm_DadosSegundo.cds_Venda do
        begin

             Append;

             FieldByName('id_venda').AsInteger             := idVenda;
             FieldByName('id_vendedor').AsInteger          := IDOperador;
             FieldByName('cliente_id').AsInteger           := idDoCliente;
             FieldByName('data_venda').AsDateTime          := date;
             FieldByName('hora_venda').AsString            := timeToStr(time);
             FieldByName('status').AsString                := 'A';
             FieldByname('id_Vendedor').AsInteger          := (IdFuncionarioLogado('status'));
             FieldByname('vl_bruto').AsFloat               := subTotal;
             FieldByname('vl_desconto').AsFloat            := desconto;
             FieldByname('vl_totalpagar').AsFloat          := totalCupom;
             FieldByname('vl_troco').AsFloat               := totalTroco;
             FieldByname('vl_recebido').AsFloat            := totalpago;
             FieldByname('vl_liquido').AsFloat             := totalpago - totalTroco;
             FieldByname('status').AsString                := 'F';
             mes_ano                                       := nomeMes + '/' +  IntToStr(YearOf(DataDoDia));
             FieldByName('mesano').AsString                := mes_ano;
             FieldByName('nummes').AsInteger               := numMes;

             ApplyUpdates(0);

          end;

           //IDENTIFICANDO A QUE VENDA PERTENCE A COTA��O E MUDANDO O STATUS PARA FC OU SEJA A COTA��O N�O DEVER� SER UTILIZADA MAIS PARA FINS DE VENDA
           //ACHO QUE AT� PODERIAMOS SE O CLIENTE DESEJASSE, GERAR UMA NOVA VENDA COM A MESMA COTA��O

           _Sql:= 'UPDATE cotacao SET status = '+QuotedStr('FC')+', id_venda = :pIDVenda, total = :pTotal where id_cotacao = :pIDCotacao';

           With DM_Pesq.Qry_Geral do begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              ParamByName('pIDVenda').AsInteger      := idVenda;
              ParamByName('pIDCotacao').AsInteger    := NumCotacao;
              ParamByName('pTotal').AsFloat          := totalCupom;
              ExecSQL();

            end;

          GravandoItensDaVenda;

          //baixa as quantidade dos produtos no estoque
          BaixarQdeDoEstoque;

          AtualizaCaixaAposMovimento;
          LogOperacoes(NomeDoUsuarioLogado, 'pagamento de cota��o');
          ImpressaoDoCupom;

end;


procedure T_frmPagarCotacao.ImpressaoDoCupom;
begin


      Application.MessageBox('Imprimindo cupom...', 'Imprimindo', MB_OK);

      with Q_RelCupomVendaCotacao.cds_RelCupomVendaCotacao do
      begin

        Close;
        Params.ParamByName('pIDCotacao').value  :=  NumCotacao;
        Open;

        Q_RelCupomVendaCotacao.cds_RelCupomVendaCotacao.Active := True;
        Q_RelCupomVendaCotacao.QryEmpresa.Active               := true;
        Q_RelCupomVendaCotacao.lblNomeUsuarioLogado.Caption    := NomeFuncionarioLogado(IDOperador);
        Q_RelCupomVendaCotacao.Preview;
        Q_RelCupomVendaCotacao.ReportTitle := 'Cupom de Venda';

      end;


end;



procedure T_frmPagarCotacao.AtualizaCaixaAposMovimento;
var
  proxNumIdCaixa  : integer;
begin

           //ATUALIZANDO O CAIXA APOS PAGAMENTO DA COTA��O

           proxNumIdCaixa := 0;

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

           valorPago                := StrToFloat(edtValorpago.Text);
           ValorSaldoAtualAposMovto := ( ValorSaldoAnterior + valorPago );

           // ATUALIZANDO O CAIXA
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
                FieldByName('id_venda').AsInteger        := idVenda;
                FieldByName('saldo_anterior').AsFloat    := ValorSaldoAnterior;
                FieldByName('valor_movimento').AsFloat   := valorPago;
                FieldByName('saldo_atual').AsFloat       := ValorSaldoAtualAposMovto;
                FieldByName('data').AsDateTime           := date;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := 'PAGAMENTO DA VENDA N :' +Inttostr(idVenda)+ '  PELA COTACAO N : '+ Inttostr(numCotacao);

                ApplyUpdates(0);

            end;


            MovimentacaoComTroco;
            AtualizarHistoricoVP;
            AtualizaHistoricoAtivos;

end;

procedure T_frmPagarCotacao.AtualizaHistoricoAtivos;
begin

                  // ATUALIZANDO O HISTORICO DE ATIVOS

                  With DM_Pesq.qry_Cod do begin

                    Close;
                    SQL.Clear;
                    SQL.Add('select max(id_historicoativos) from historico_ativos');
                    Open;

                    if not IsEmpty then begin

                       proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

                    end;

                  end;
                  with dm_Conexao.cds_HistoricoAtivos do begin

                    append;
                    FieldByname('id_historicoativos').AsInteger   := proxNum;
                    FieldByname('cliente_id').AsInteger           := idDoCliente;
                    FieldByname('vendedor_id').AsInteger          := IDOperador;
                    FieldByname('id_venda').AsInteger             := idVenda;
                    FieldByname('vl_liquido').AsFloat             := totalpago - totalTroco;
                    FieldByName('historico').AsString             := 'PAGAMENTO DA VENDA N :' +Inttostr(idVenda)+ '  PELA COTACAO N : '+ Inttostr(numCotacao);
                    FieldByName('flag_pagto').AsString            := 'PV';  //entra como PV para constar como ativo na meta
                    mes_ano                                       := nomeMes + '/' +  IntToStr(YearOf(DataDoDia));
                    FieldByName('mesano').AsString                := mes_ano;
                    FieldByname('data').AsDateTime                := date;

                    ApplyUpdates(0);

                  end;

end;



procedure T_frmPagarCotacao.AtualizarHistoricoVP;
begin

       _Sql := 'SELECT id_venda, id_produto, quantidade FROM itens_vendas WHERE id_venda = :pIDVenda';

        with DM_Pesq.Qry_Auxiliar do
        begin

            close;
            sql.Clear;
            sql.Add(_Sql);
            Params.ParamByName('pIDVenda').AsInteger   := idVenda;
            open;

            while not eof do
            begin

                 id_produtoItem    :=  DM_Pesq.Qry_Auxiliar.Fields[1].Value;
                 QuantidadeVendida :=  DM_Pesq.Qry_Auxiliar.Fields[2].Value;

                  //ATUALIZAR HISTORICO DE PRODUTOS NA VENDA
                  With DM_Pesq.qry_Cod do begin

                    Close;
                    SQL.Clear;
                    SQL.Add('select max(id_historico) from historico_produtos');
                    Open;

                    if not IsEmpty then begin

                       proxNumHistorico := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

                    end;

                  end;

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
                      FieldByname('operador_id').AsInteger      := IDOperador;
                      FieldByname('codmov').AsString            := 'VP';  //Venda de produto
                      FieldByname('quantidade').AsFloat         := QuantidadeVendida;
                      FieldByname('datamov').AsDateTime         := TDateTime(now);
                      FieldByname('historico').AsString         := 'VENDA DE PRODUTO POR COTACAO N : '+ IntToStr(numCotacao);
                      DataDoDia                                 := date;
                      mes_ano:= IntToStr(MonthOf(DataDoDia)) + '/' +  IntToStr(YearOf(DataDoDia));
                      FieldByName('mesano').AsString            := mes_ano;
                      ApplyUpdates(0);

                   end;
             next;
         end;
   end;

end;



procedure T_frmPagarCotacao.MovimentacaoComTroco;
var
  proxNumIdCaixa : integer;
begin

     proxNumIdCaixa :=0;

     valorTroco     := StrToFloat(edtvalorTroco.Text);

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
                FieldByName('id_venda').AsInteger        := IdVenda;
                FieldByName('saldo_anterior').AsFloat    := ValorSaldoAnterior;
                FieldByName('valor_movimento').AsFloat   := -valorTroco;
                FieldByName('saldo_atual').AsFloat       := ValorSaldoAtualAposMovto;
                FieldByName('data').AsDateTime           := date;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := 'TROCO';

                ApplyUpdates(0);

            end;
     end;

      dm_Conexao.cds_Caixa.Active   := false;
      dm_Conexao.cds_Caixa.Active   := true;
      dm_DadosSegundo.cds_OS.Active := false;
      dm_DadosSegundo.cds_OS.Active := true;
      close;

end;

procedure T_frmPagarCotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

     FecharTabelas;     

end;

procedure T_frmPagarCotacao.edtValorpagoEnter(Sender: TObject);
begin

      VerificarTotalDosPagamentos;

end;

procedure T_frmPagarCotacao.VerificarTotalDosPagamentos;
begin

     SomaDosPagtos := StrToFloat(editnum2.Text) +  StrToFloat(editnum3.Text) +  StrToFloat(editnum4.Text);

     TotalDaCompra := StrToFloat(edtTotalpagar.Text);

     if SomaDosPagtos >= TotalDaCompra then
     begin

         edtValorpago.SetFocus;
         edtValorpago.Text := FloatToStr(SomaDosPagtos);
         RetiraPonto(edtValorpago.Text);
         btnPagarCotacao.Enabled := true;

         //Calculando o valor do troco
         edtvalorTroco.Text      := FloatToStr( strtofloat(edtValorpago.Text) - strtofloat(edtTotalpagar.Text ) );

         //grava dados na tipospagtos
         gravatipo(EditNum2.Text,'1');
         gravatipo(EditNum3.Text,'2');
         gravatipo(EditNum4.Text,'3');
         gravatipo(EditNum5.Text,'4');
         gravatipo(EditNum6.Text,'5');

         pan_rodape.Caption      := 'CONFIRME O PAGAMENTO NO BOT�O ACIMA, OBRIGADO!';
         pan_rodape.Font.Color   :=  clYellow;

         
     end
     else begin

          Application.MessageBox( 'O total do pagamento n�o confere com o valor do cupom !', 'Aten��o verifique...',
                                MB_IconInformation + MB_OK);

          EditNum2.Text       := '0,00';
          EditNum3.Text       := '0,00';
          EditNum4.Text       := '0,00';
          EditNum5.Text       := '0,00';
          EditNum6.Text       := '0,00';

          edtValorpago.Text   := '0,00';   
          editnum2.SetFocus;     

     end;

end;


procedure T_frmPagarCotacao.gravatipo(EditNum,tipo:string);
begin

     if StrToFloat(EditNum) <> 0 then
     begin

         with dm_DadosSegundo.cds_TiposPgtos do
         begin

              append;
              FieldByName('id_cotacao').AsString := IntToStr(numCotacao);
              FieldByName('data').AsDateTime     := date;
              FieldByName('tipo').AsString       := tipo;
              FieldByName('valor').AsString      := editnum;
              ApplyUpdates(0);

         end;


     end;

end;

procedure T_frmPagarCotacao.ExcluirTiposPgtos;
begin


     // se passou direto sem problemas com a soma dos valores j� gravou em tipos mas se o valor nao bateu,
     //exclui os tipos gravados para gravar novamente ate bater o valor do total

     with DM_Pesq.Qry_Geral do
     begin

         close;
         sql.Clear;
         sql.Add('DELETE FROM tipospgtos WHERE id_os = :pIDOS');
         Params.ParamByName('pIDOS').AsString          := IntToStr(IdVenda);
         ExecSQL();

     end;


end;

procedure T_frmPagarCotacao.EditNum4Enter(Sender: TObject);
begin

    CalcularValorAPagar;

    ExcluirTiposPgtos;
    pan_rodape.Caption      := 'ENTRE COM O VALOR PAGO EM '+dm_DadosSegundo.cds_ConfigP3.Value;
    pan_rodape.Font.Color   :=  clYellow;

end;

procedure T_frmPagarCotacao.EditNum3Enter(Sender: TObject);
begin

  ExcluirTiposPgtos;
  pan_rodape.Caption      := 'ENTRE COM O VALOR PAGO COM '+dm_DadosSegundo.cds_ConfigP2.Value;
  pan_rodape.Font.Color   :=  clYellow; 

end;

procedure T_frmPagarCotacao.EditNum6Enter(Sender: TObject);
begin

    ExcluirTiposPgtos;
    pan_rodape.Caption      := 'ENTRE COM O VALOR PAGO EM '+dm_DadosSegundo.cds_ConfigP1.Value;
    pan_rodape.Font.Color   :=  clYellow;


end;

procedure T_frmPagarCotacao.EditNum5Enter(Sender: TObject);
begin

  ExcluirTiposPgtos;
  pan_rodape.Caption      := 'ENTRE COM O VALOR PAGO COM '+dm_DadosSegundo.cds_ConfigP1.Value;
  pan_rodape.Font.Color   :=  clYellow;

end;

procedure T_frmPagarCotacao.EditNum2Exit(Sender: TObject);
begin

    //AO SAIR DOS EDITS MOSTRA O TOTAL DOS PAGAMENTOS

    SomaDosPagtos := StrToFloat(editnum2.Text) +  StrToFloat(editnum3.Text) +  StrToFloat(editnum4.Text) +
    StrToFloat(editnum5.Text) +  StrToFloat(editnum6.Text);

    TotalDaCompra := StrToFloat(edtTotalpagar.Text);

    RetiraPonto(edtvalorpago.Text);
    edtValorpago.Text := FloatToStr(SomaDosPagtos);


end;

procedure T_frmPagarCotacao.EditNum3Exit(Sender: TObject);
begin

    //AO SAIR DOS EDITS MOSTRA O TOTAL DOS PAGAMENTOS

     SomaDosPagtos := StrToFloat(editnum2.Text) +  StrToFloat(editnum3.Text) +  StrToFloat(editnum4.Text) +
    StrToFloat(editnum5.Text) +  StrToFloat(editnum6.Text);

    TotalDaCompra := StrToFloat(edtTotalpagar.Text);

    RetiraPonto(edtvalorpago.Text);
    edtValorpago.Text := FloatToStr(SomaDosPagtos);


end;

procedure T_frmPagarCotacao.EditNum4Exit(Sender: TObject);
begin

    //AO SAIR DOS EDITS MOSTRA O TOTAL DOS PAGAMENTOS

    SomaDosPagtos := StrToFloat(editnum2.Text) +  StrToFloat(editnum3.Text) +  StrToFloat(editnum4.Text) +
    StrToFloat(editnum5.Text) +  StrToFloat(editnum6.Text);

    TotalDaCompra := StrToFloat(edtTotalpagar.Text);

    RetiraPonto(edtvalorpago.Text);
    edtValorpago.Text := FloatToStr(SomaDosPagtos);


end;

procedure T_frmPagarCotacao.EditNum5Exit(Sender: TObject);
begin

    //AO SAIR DOS EDITS MOSTRA O TOTAL DOS PAGAMENTOS

    SomaDosPagtos := StrToFloat(editnum2.Text) +  StrToFloat(editnum3.Text) +  StrToFloat(editnum4.Text) +
    StrToFloat(editnum5.Text) +  StrToFloat(editnum6.Text);

    TotalDaCompra := StrToFloat(edtTotalpagar.Text);

    RetiraPonto(edtvalorpago.Text);
    edtValorpago.Text := FloatToStr(SomaDosPagtos);

end;

procedure T_frmPagarCotacao.EditNum6Exit(Sender: TObject);
begin

    //AO SAIR DOS EDITS MOSTRA O TOTAL DOS PAGAMENTOS

    SomaDosPagtos := StrToFloat(editnum2.Text) +  StrToFloat(editnum3.Text) +  StrToFloat(editnum4.Text) +
    StrToFloat(editnum5.Text) +  StrToFloat(editnum6.Text);

    TotalDaCompra := StrToFloat(edtTotalpagar.Text);

    RetiraPonto(edtvalorpago.Text);
    edtValorpago.Text := FloatToStr(SomaDosPagtos);


end;


procedure T_frmPagarCotacao.MostrarTotalRecebidoETroco;
begin

    valorPago      := StrToFloat(edtValorpago.text);
    valorAPagar    := strtofloat(edtTotalpagar.text);

    RetiraPonto(edtValorpago.Text);
    RetiraPonto(edtTotalpagar.Text);

    if ( valorPago >= valorAPagar ) then
    begin

      valorTroco             := ( valorPago - valorAPagar );
      edtvalorTroco.Text     := FloatToStr(valorTroco);
      RetiraPonto(edtvalorTroco.Text);

    end;


end;

procedure T_frmPagarCotacao.AbrirTabelas;
begin

    dm_DadosSegundo.cds_TiposPgtos.Active        := true;
    dm_Conexao.cds_Caixa.Active                  := true;
    dm_DadosSegundo.cds_OS.Active                := true;
    dm_DadosSegundo.cds_Config.Active            := true;
    dm_DadosSegundo.cds_ItensVendas.Active       := true;
    dm_DadosSegundo.cds_Venda.Active             := true;
    dm_DadosSegundo.cds_HistoricoProdutos.Active := true;
    dm_Conexao.cds_HistoricoAtivos.Active        := true;

end;

procedure T_frmPagarCotacao.FecharTabelas;
begin

    //nao fechar dm_DadosSegundo.cds_OS pra q se mudar de ideia e nao pagar o grid esteja populado
    dm_DadosSegundo.cds_TiposPgtos.Active        := false;
    dm_Conexao.cds_Caixa.Active                  := false;
    dm_DadosSegundo.cds_Config.Active            := false;
    dm_DadosSegundo.cds_ItensVendas.Active       := false;
    dm_DadosSegundo.cds_Venda.Active             := false;
    dm_DadosSegundo.cds_HistoricoProdutos.Active := false;
    dm_Conexao.cds_HistoricoAtivos.Active        := false;
    dm_Conexao.cds_DadosClientes.Active          := false;

end;

procedure T_frmPagarCotacao.FecharAbrirTabelas;
begin

   dm_DadosSegundo.cds_TiposPgtos.Active  := false;
   dm_DadosSegundo.cds_TiposPgtos.Active  := true;

   dm_Conexao.cds_Caixa.Active            := false;
   dm_Conexao.cds_Caixa.Active            := true;

   dm_DadosSegundo.cds_ItensVendas.Active := false;
   dm_DadosSegundo.cds_ItensVendas.Active := true;

   dm_DadosSegundo.cds_Venda.Active       := false;
   dm_DadosSegundo.cds_Venda.Active       := true;

   dm_Conexao.cds_HistoricoAtivos.Active  := false;
   dm_Conexao.cds_HistoricoAtivos.Active  := true;


end;

procedure T_frmPagarCotacao.LimparTodosOsCampos;
begin

      txtNomeClienteCotacao.Caption  := '';
      edt_ValorDebito.Text           := '0,00';
      edt_ValorDesconto.Text         := '0,00';
      edtTotalpagar.Text             := '0,00';
      EditNum2.Text                  := '0,00';
      EditNum3.Text                  := '0,00';
      EditNum4.Text                  := '0,00';
      edtValorpago.Text              := '0,00';
      edtvalorTroco.Text             := '0,00';

end;    
         



procedure T_frmPagarCotacao.EditNum2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

    if key = vk_F8 then
    begin

        edtValorpago.SetFocus;

    end;


end;



procedure T_frmPagarCotacao.edt_ValorDescontoEnter(Sender: TObject);
begin
     pan_rodape.Caption := 'ENTRE COM O VALOR DO DESCONTO OU ENTER PARA PROSSEGUIR';
     pan_rodape.Font.Color   :=  clYellow;
end;

procedure T_frmPagarCotacao.EditNum2Click(Sender: TObject);
begin
      EditNum2.SelStart      := 0;
      EditNum2.SelLength     := Length(EditNum2.Text);
      edtvalorTroco.Text     := '0,00';
end;

procedure T_frmPagarCotacao.EditNum3Click(Sender: TObject);
begin

      EditNum3.SelStart      := 0;
      EditNum3.SelLength     := Length(EditNum3.Text);
      edtvalorTroco.Text     := '0,00';

end;

procedure T_frmPagarCotacao.EditNum4Click(Sender: TObject);
begin

      EditNum4.SelStart      := 0;
      EditNum4.SelLength     := Length(EditNum4.Text);
      edtvalorTroco.Text     := '0,00';

end;

procedure T_frmPagarCotacao.EditNum5Click(Sender: TObject);
begin 
    
     EditNum5.SelStart      := 0;
     EditNum5.SelLength     := Length(EditNum5.Text);
     edtvalorTroco.Text     := '0,00';

end;

procedure T_frmPagarCotacao.EditNum6Click(Sender: TObject);
begin

     EditNum6.SelStart      := 0;
     EditNum6.SelLength     := Length(EditNum6.Text);
     edtvalorTroco.Text     := '0,00';

end;

procedure T_frmPagarCotacao.edtvalorTrocoEnter(Sender: TObject);
begin

     btnPagarCotacao.Enabled := true;

     MostrarTotalRecebidoETroco;

end;



procedure T_frmPagarCotacao.EditNum2Enter(Sender: TObject);
begin

    pan_rodape.Caption      := 'ENTRE COM O VALOR PAGO EM '+dm_DadosSegundo.cds_ConfigP1.Value;
    pan_rodape.Font.Color   :=  clYellow;

    CalcularValorAPagar;

end;

end.


