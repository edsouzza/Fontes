unit U_FecharPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,DateUtils, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus;

type
  T_frmFecharPedido = class(TForm)
    pan_titulo: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    lbl45: TLabel;
    lblStatusLogoff: TLabel;
    panel_Produtos: TPanel;
    panel_total: TPanel;
    lbl37: TLabel;
    db_ValorTotal: TDBEdit;
    txt_IDITEM: TEdit;
    Grid_DetalhesDoPedido: TDBGrid;
    pan_botoes: TPanel;
    btnCancelarPedido: TSpeedButton;
    btnGravarPedido: TSpeedButton;
    GroupBox1: TGroupBox;
    edt_pedido: TLabel;
    btnEmitirNF: TSpeedButton;
    btnSair: TSpeedButton;
    btnMostrarItens: TButton;
    panel_item: TPanel;
    rd_exclusaodoitem: TRadioButton;
    rd_sair: TRadioButton;
    txt_ProdutoID: TEdit;
    grCabecalho: TGroupBox;
    lbl52: TLabel;
    lbl33: TLabel;
    lbl14: TLabel;
    Label1: TLabel;
    edt_IDPedidoAberto: TEdit;
    edt_PrecoProdutoPedido: TCurrencyEdit;
    edt_QuantidadeProdutoPedido: TEdit;
    edt_IDProdutoPedido: TEdit;
    edtPrecoAtual: TCurrencyEdit;
    txt_ValorTotalDoItem: TEdit;
    txt_ValorUnitarioDoItem: TEdit;
    rd_alterarPrecoVenda: TRadioButton;
    txt_Descricao: TEdit;
    btnAlterarValoresDeVenda: TSpeedButton;
    Label2: TLabel;
    txt_quantidadeDoItem: TEdit;
    btnImprimirPedido: TSpeedButton;
    Label3: TLabel;
    edtEstoque: TStaticText;
    edt_DescProdutoPedido: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure InserirProduto;
    procedure LimparTabelaPedidoTemp;
    procedure LimparCampos;
    procedure AbrirFecharTabelas;
    procedure btnGravarPedidoClick(Sender: TObject);
    procedure edt_QuantidadeProdutoPedidoKeyPress(Sender: TObject;
      var Key: Char);
    procedure ConverterValorTotalParaFloatValido;
    procedure edt_QuantidadeProdutoPedidoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_DetalhesDoPedidoCellClick(Column: TColumn);
    procedure edt_QuantidadeProdutoPedidoClick(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMostrarItensClick(Sender: TObject);
    procedure MostrarOsItensDoPedido;
    procedure btnEmitirNFClick(Sender: TObject);
    procedure ExcluirItemDoPedido;
    procedure rd_exclusaodoitemClick(Sender: TObject);
    procedure rd_sairClick(Sender: TObject);
    procedure DesabilitarBotoes;
    procedure HabilitarBotoes;
    procedure edt_DescProdutoPedidoClick(Sender: TObject);
    procedure edt_PrecoProdutoPedidoClick(Sender: TObject);
    procedure edt_QuantidadeProdutoPedidoChange(Sender: TObject);
    procedure GerarNF;
    procedure CancelarPedido;
    procedure EnviarQdesAoEstoque;
    procedure AtualizarHistoricoEP;
    procedure VerificarSePedidoTemItens;
    procedure rd_alterarPrecoVendaClick(Sender: TObject);
    procedure MostrarPrecoDeVendaAtualDoProduto;
    procedure btnAlterarValoresDeVendaClick(Sender: TObject);
    procedure btnImprimirPedidoClick(Sender: TObject);
    procedure edt_DescProdutoPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure db_ValorTotalEnter(Sender: TObject);


  private
    { Private declarations }
    NumPedidoSelecionado : string;

  public
    { Public declarations }

    ValorUnitarioItemProdutoPedido, ValorAtualizadoAposCadastro,ValorTotalPedido, PrecoVendaAtual, PrecoVendaAtualizado,
    ValorAtualizadoAposDelecao, ValorLiquidoItemProdutoPedido, ValorTotalItemProdutoPedido,ValorTotalItemDeletado,
    Qde_deletada, QuantidadeItemProdutoPedido, ValorTotalInicial, ValorTotalConvertido,ValorItemPraDeletarNaExclusao  : double;

    proxNumeDetalhe, proxNumItens, NumeroDaComandaAberta, proxNumComanda,Id_Produto, idDoProduto, Id_FuncLogado,
    id_produtoItem, Id_Pedido, QuantidadeEntrada,Estoque_atual, EstoqueAtualizado : integer;
    DataDoDia         : TDate;
    PedidoSemItens    : Boolean;
    NumNF             : String;

  end;

var
  _frmFecharPedido: T_frmFecharPedido;
            

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo,
  SqlExpr,DBClient, U_principal, DB, U_EscolhaDoProdutoParaPedido,
  U_ConsPedidosPorPeriodo, U_EscolhaProdutoParaAtualizarPedido,
  U_AlteraPrecoVenda, U_AlteraPrecosVendaDoPedidoPorPercentual,
  U_CancelarOuSairDoPedido, U_QRelImprimePedido, U_AddItensNoPedido,
  U_GerarDuplicatas;


{$R *.dfm}

procedure T_frmFecharPedido.FormCreate(Sender: TObject);
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

    lblDataDoDia.Caption         := DateToStr(now);
    lblHoraAtual.Caption         := timetoStr(time);
    lblStatusLogoff.Caption      := IdentificarUsuarioLogado;
    panel_item.Top               := 541;
    LimparTabelaPedidoTemp;
    AbrirTabelas;

end;

procedure T_frmFecharPedido.FormShow(Sender: TObject);
begin

    LimparTabelaPedidoTemp;
    NomeFornecedorGerarDuplicata := _frmConsPedidosPeriodo.NomeDoFornecedor;
    edt_pedido.Caption           := _frmConsPedidosPeriodo.NumPedidoSelecionado;
    pan_titulo.Caption           := 'Atualizando | Gerando N.F. para '+(_frmConsPedidosPeriodo.NomeDoFornecedor);
    edt_DescProdutoPedido.SetFocus;
    btnMostrarItensClick(self);

    if not( PedidoTemItens(StrToInt(edt_pedido.Caption)) ) then
    begin
        btnEmitirNF.Enabled              := false;
        btnAlterarValoresDeVenda.Enabled := false;
        btnImprimirPedido.Enabled        := false;
    end;

end;

procedure T_frmFecharPedido.LimparTabelaPedidoTemp;
begin  

     With DM_Pesq.Qry_Geral do begin

        Close;
        SQL.Clear;
        SQL.Add('Delete FROM t_pedido');
        ExecSQL;

     end;

end;


procedure T_frmFecharPedido.btnGravarPedidoClick(Sender: TObject);
begin

     ValorAtualizadoAposCadastro := StrToFloat(db_ValorTotal.Text);

     with DM_Pesq.Qry_Geral do
     begin

          close;
          sql.Clear;
          sql.Add('UPDATE c_pedido SET vl_totalpedido = :pNovoTotal  WHERE id_pedido = :pIdPedido');
          Params.ParamByName('pIdPedido').AsInteger   := StrToInt(edt_IDPedidoAberto.Text);
          Params.ParamByName('pNovoTotal').AsFloat    := ValorAtualizadoAposCadastro;
          ExecSQL();

     end;

     LimparTabelaPedidoTemp;
     AbrirFecharTabelas;
      btnSair.Enabled := true;
     Grid_DetalhesDoPedido.Refresh;
     Application.MessageBox('Pedido atualizado com sucesso!', 'OK!', MB_OK);
     LogOperacoes(NomeDoUsuarioLogado, 'alteração no cadastro de pedido');
     close;
    
end;


procedure T_frmFecharPedido.AbrirTabelas;
begin

    dm_DadosSegundo.cds_IPedido.Active               := true;
    dm_DadosSegundo.cds_TPedido.Active               := true;
    dm_DadosSegundo.cds_HistoricoProdutos.Active     := true;

end;

procedure T_frmFecharPedido.FecharTabelas;
begin

    dm_DadosSegundo.cds_IPedido.Active               := false;
    dm_DadosSegundo.cds_TPedido.Active               := false;
    dm_DadosSegundo.cds_HistoricoProdutos.Active     := false;  

end;


procedure T_frmFecharPedido.AbrirFecharTabelas;
begin

    dm_DadosSegundo.cds_IPedido.Active               := false;
    dm_DadosSegundo.cds_IPedido.Active               := true;

    dm_DadosSegundo.cds_TPedido.Active               := false;
    dm_DadosSegundo.cds_TPedido.Active               := true;

    dm_DadosSegundo.cds_HistoricoProdutos.Active     := false;
    dm_DadosSegundo.cds_HistoricoProdutos.Active     := true;

end;



procedure T_frmFecharPedido.edt_QuantidadeProdutoPedidoKeyPress(
  Sender: TObject; var Key: Char);
begin

     // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;


procedure T_frmFecharPedido.edt_QuantidadeProdutoPedidoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

      if key = 13 then
      begin

           if ( edt_QuantidadeProdutoPedido.Text = '' ) or ( edt_PrecoProdutoPedido.Text = '' ) then
            begin

                  Application.MessageBox('Os campos: Preço, Quantidade não podem estar vazios!', 'Verifique', MB_OK);
                  edt_DescProdutoPedido.SetFocus;

            end else begin

                  InserirProduto;

            end;

      end;

end;


procedure T_frmFecharPedido.InserirProduto;
begin

        proxNumeDetalhe := 0;
        proxNumItens    := 0;

        QuantidadeItemProdutoPedido       := StrToFloat(edt_QuantidadeProdutoPedido.Text);
        ValorUnitarioItemProdutoPedido    := StrToFloat(edt_PrecoProdutoPedido.Text);
        ValorLiquidoItemProdutoPedido     := ValorUnitarioItemProdutoPedido;

        ValorTotalItemProdutoPedido       := (ValorLiquidoItemProdutoPedido * QuantidadeItemProdutoPedido);


         // inserindo itens na tabela id_pedidotemp e no grid de visualização
         With DM_Pesq.qry_Cod do begin

          Close;
          SQL.Clear;
          SQL.Add('select max(id_pedidotemp) from t_pedido');
          Open;

          if not IsEmpty then begin

             proxNumeDetalhe := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

          end;

        end;


        with dm_DadosSegundo.cds_TPedido do
        begin

             Append;
             FieldByName('id_pedidotemp').AsInteger   := proxNumeDetalhe;
             FieldByName('pedido_id').AsInteger       := StrToInt(edt_IDPedidoAberto.text);
             FieldByName('produto_id').AsInteger      := StrToInt(edt_IDProdutoPedido.text);
             FieldByName('vl_unitario').AsFloat       := ValorLiquidoItemProdutoPedido;
             FieldByName('qde').AsFloat               := QuantidadeItemProdutoPedido;
             FieldByName('vl_totalitem').AsFloat      := ValorTotalItemProdutoPedido;

             ApplyUpdates(0);

        end;


         // gravando os itens na tabela i_pedido

          With DM_Pesq.qry_Cod do begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_itenspedido) from i_pedido');
              Open;

              if not IsEmpty then begin

                 proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;


          with  dm_DadosSegundo.cds_IPedido do
          begin

              Append;

              FieldByName('id_itenspedido').AsInteger  := proxnum;
              FieldByName('pedido_id').AsInteger       := StrToInt(edt_IDPedidoAberto.text);
              FieldByName('produto_id').AsInteger      := StrToInt(edt_IDProdutoPedido.text);
              FieldByName('vl_unitario').AsFloat       := ValorLiquidoItemProdutoPedido;
              FieldByName('qde').AsFloat               := QuantidadeItemProdutoPedido;
              FieldByName('vl_totalitem').AsFloat      := ValorTotalItemProdutoPedido;

              ApplyUpdates(0);   

          end;   

          btnGravarPedido.Enabled := true;
          LimparCampos;

end;


procedure T_frmFecharPedido.LimparCampos;
begin

     edt_PrecoProdutoPedido.Clear;
     edt_QuantidadeProdutoPedido.Clear;
     edtPrecoAtual.Text          := '0,00';
     edtPrecoAtual.Text          := '0,00';
     edt_PrecoProdutoPedido.Text :=  '0,00';
     edtEstoque.Caption          := '';
     edt_DescProdutoPedido.Clear;
     edt_DescProdutoPedido.SetFocus;

end;


procedure T_frmFecharPedido.ConverterValorTotalParaFloatValido;
var ValorTotalPedido : string;
begin

     ThousandSeparator:= '.';
     DecimalSeparator := ',';
     CurrencyDecimals := 2;

     ValorTotalPedido := db_ValorTotal.Text;

     While pos('.',ValorTotalPedido) > 0 do //REMOVE TODOS OS "."
     Delete(ValorTotalPedido, pos('.',ValorTotalPedido), 1);

     ValorTotalConvertido  := StrToFloat(ValorTotalPedido);

end;


procedure T_frmFecharPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    release;

end;

procedure T_frmFecharPedido.FormKeyPress(Sender: TObject;
  var Key: Char);
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

          

procedure T_frmFecharPedido.edt_QuantidadeProdutoPedidoClick(
  Sender: TObject);
begin

     edt_QuantidadeProdutoPedido.SelStart  := 0;
     edt_QuantidadeProdutoPedido.SelLength := Length(edt_QuantidadeProdutoPedido.Text);

end;

procedure T_frmFecharPedido.CancelarPedido;
var
  texto : string;
begin

       // perguntar se deseja cancelar o pedidos e os ítens destinados a ele, se sim excluir pedido e ítens

       texto:= 'Confirma o cancelamento do pedido e todos os seus ítens?';

       if Application.MessageBox(PChar(texto),'Cancelando o Pedido',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin


           //APAGANDO A TABELA PEDIDO_TEMP
           LimparTabelaPedidoTemp;


           //MUDANDO O STATUS PARA C (CANCELADO)
           with DM_Pesq.Qry_Geral do
           begin

                close;
                sql.Clear;
                sql.Add('UPDATE c_pedido SET status = '+QuotedStr('C')+' WHERE id_pedido = :pIDPedido AND status = '+QuotedStr('A')+' ');
                Params.ParamByName('pIDPedido').Value := Id_Pedido;
                ExecSQL();

           end;


           //DELETANDO OS ÍTENS DA TABELA I_PEDIDO
           with DM_Pesq.Qry_Geral do
           begin

                close;
                sql.Clear;
                sql.Add('DELETE FROM i_pedido WHERE pedido_id = :pIdPedido');
                Params.ParamByName('pIdPedido').AsInteger  := StrToInt(edt_IDPedidoAberto.text);
                ExecSQL();

           end;

           Application.MessageBox('O pedido e seus ítens foram excluídos com sucesso!', 'Exclusão do pedido', MB_OK);
           AbrirFecharTabelas;
           close;

       end
       else begin

           exit;

       end;

end;

procedure T_frmFecharPedido.VerificarSePedidoTemItens;
begin

     with DM_Pesq.Qry_Geral do
     begin

          close;
          sql.Clear;
          sql.Add('SELECT pedido_id FROM i_pedido WHERE pedido_id = :pIDPedido');
          Params.ParamByName('pIDPedido').AsInteger := StrToInt(edt_Pedido.Caption);
          open;

          if IsEmpty then
          begin

              PedidoSemItens := true;

          end else begin

              PedidoSemItens := false;

          end;

     end;

end;        


procedure T_frmFecharPedido.btnCancelarPedidoClick(Sender: TObject);
var
  texto : string;
begin

       VerificarSePedidoTemItens;

       if ( PedidoSemItens )then
       begin

             texto:= 'Confirma o cancelamento deste pedido?';

             if Application.MessageBox(PChar(texto),'Cancelando o corrente pedido',MB_YESNO + MB_ICONQUESTION) = IdYes then
             begin

                     //DELETANDO O PEDIDO ATUAL QUE ESTA SEM ITENS
                     with DM_Pesq.Qry_Geral do
                     begin

                          close;
                          sql.Clear;
                          sql.Add('DELETE FROM c_pedido WHERE id_pedido = :pIdPedido');
                          Params.ParamByName('pIdPedido').AsInteger  := StrToInt(edt_pedido.Caption);
                          ExecSQL();

                     end;

                     Application.MessageBox('O pedido foi cancelado com sucesso!', 'Cancelamento de pedido', MB_OK);
                     LogOperacoes(NomeDoUsuarioLogado, 'cancelamento de pedido');
                     LimparTabelaPedidoTemp;
                     AbrirFecharTabelas;
                     close;

             end else begin

                 exit;

             end;

        end else begin

             // perguntar se deseja cancelar o pedidos e os ítens destinados a ele, se sim excluir pedido e ítens

             texto:= 'Confirma o cancelamento do pedido corrente e seus ítens?';

             if Application.MessageBox(PChar(texto),'Cancelando o Pedido',MB_YESNO + MB_ICONQUESTION) = IdYes then
             begin

                  //DELETANDO O PEDIDO ATUAL QUE ESTA SEM ITENS
                     with DM_Pesq.Qry_Geral do
                     begin

                          close;
                          sql.Clear;
                          sql.Add('DELETE FROM c_pedido WHERE id_pedido = :pIdPedido');
                          Params.ParamByName('pIdPedido').AsInteger  := StrToInt(edt_pedido.Caption);
                          ExecSQL();

                     end;

                 //DELETANDO OS ÍTENS DA TABELA I_PEDIDO
                 with DM_Pesq.Qry_Geral do
                 begin

                      close;
                      sql.Clear;
                      sql.Add('DELETE FROM i_pedido WHERE pedido_id = :pIdPedido');
                      Params.ParamByName('pIdPedido').AsInteger  := StrToInt(edt_pedido.Caption);
                      ExecSQL();

                 end;

                 Application.MessageBox('O pedido e seus ítens foram cancelados com sucesso!', 'Cancelamento de pedido', MB_OK);
                 LimparTabelaPedidoTemp;
                 AbrirFecharTabelas;
                 close;

             end
             else begin

                 AbrirFecharTabelas;
                 close;

             end;

       end;
   
end;

procedure T_frmFecharPedido.Grid_DetalhesDoPedidoCellClick(
  Column: TColumn);
begin

    txt_IDITEM.Text                  := IntToStr(dm_DadosSegundo.cds_TPedido.FieldByName('id_pedidotemp').AsInteger);
    txt_ValorTotalDoItem.Text        := FloatToStr(dm_DadosSegundo.cds_TPedido.FieldByName('vl_totalitem').AsFloat);
    txt_ValorUnitarioDoItem.Text     := FloatToStr(dm_DadosSegundo.cds_TPedido.FieldByName('vl_unitario').AsFloat);
    txt_ProdutoID.Text               := IntToStr(dm_DadosSegundo.cds_TPedido.FieldByName('produto_id').AsInteger);
    txt_Descricao.Text               := dm_DadosSegundo.cds_TPedido.FieldByName('produto').AsString;
    edt_DescProdutoPedido.text       := dm_DadosSegundo.cds_TPedido.FieldByName('produto').AsString;
    edt_PrecoProdutoPedido.Text      := FloatToStr(dm_DadosSegundo.cds_TPedido.FieldByName('vl_unitario').AsFloat);
    txt_quantidadeDoItem.Text        := Inttostr(dm_DadosSegundo.cds_TPedido.FieldByName('qde').AsInteger);

    grCabecalho.Enabled              := false;
    MostrarPrecoDeVendaAtualDoProduto;
    DesabilitarBotoes;

end;

procedure T_frmFecharPedido.btnSairClick(Sender: TObject);
begin
    close;
    release;
    LimparTabelaPedidoTemp;
end;


procedure T_frmFecharPedido.btnMostrarItensClick(Sender: TObject);
begin

     MostrarOsItensDoPedido;

end;


procedure T_frmFecharPedido.MostrarOsItensDoPedido;
begin

          //IDENTIFICANDO O PEDIDO A SER MOSTRADO

          NumPedidoSelecionado  := edt_pedido.Caption;

          with DM_Pesq.Qry_Geral do begin

              close;
              sql.Clear;
              sql.Add('SELECT id_pedido, numpedido FROM c_pedido WHERE numpedido = :pIDPedido');
              Params.ParamByName('pIDPedido').Value := NumPedidoSelecionado;
              open;

              if not IsEmpty then begin

                  Id_Pedido               := DM_Pesq.Qry_Geral.Fields[0].Value;
                  edt_IDPedidoAberto.Text := IntToStr(Id_Pedido);

              end;


          end;


         //COPIANDO OS ITENS DA TABELA I_PEDIDO PARA TABELA T_PEDIDO
         dm_DadosSegundo.cds_CPedido.Active := true;
         
         if dm_DadosSegundo.cds_CPedido.Locate('numpedido',NumPedidoSelecionado,[]) then
         begin

                _Sql := 'INSERT INTO t_pedido (id_pedidotemp, pedido_id, produto_id, vl_unitario, qde, '+
                        'vl_totalitem) select * FROM i_pedido WHERE pedido_id = :pNumPedido';

                 with DM_Pesq.Qry_Geral do
                 begin

                     close;
                     sql.Clear;
                     sql.Add(_Sql);
                     Params.ParamByName('pNumPedido').AsInteger := Id_Pedido;
                     ExecSQL();

                 end;

                 AbrirFecharTabelas;
         end;


end;


procedure T_frmFecharPedido.btnEmitirNFClick(Sender: TObject);
begin

   if dm_DadosSegundo.cds_TPedido.Eof then
   begin

       Application.MessageBox('Não é possível gerar N.F. sem que o pedido contenha ítens!', 'Pedido vazio, verifique!', MB_OK);
       exit;

   end else begin

      GerarNF;

   end;

end;


procedure T_frmFecharPedido.GerarNF;
begin

       IDPedidoGerarDuplicatas := StrToInt(edt_IDPedidoAberto.Text);

       texto  := 'Confirma a emissão da N.F. para este pedido?';

       if Application.MessageBox(PChar(texto),'Gerando N.F.',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

             NumNFGerarDuplicatas  := InputBox('Entre com o número da N.F.', 'N.F.', '');

             texto := 'A N.F. nº '+ NumNFGerarDuplicatas +' foi gerada com sucesso, passe agora para geração das duplicatas!';
             LogOperacoes(NomeDoUsuarioLogado, 'geração de N.F.');
             {atualiza o estoque com as quantidades dos produtos do pedido apos a geraçao das duplicatas
             EnviarQdesAoEstoque;
             AtualizarHistoricoEP;
             LimparTabelaPedidoTemp;}

             ValorDuplicata := db_ValorTotal.Text;

             Application.CreateForm(T_frmGerarDuplicatas, _frmGerarDuplicatas);
             _frmGerarDuplicatas.ShowModal;
             FreeAndNil(_frmGerarDuplicatas);

             close;

       end else
       begin

            exit;

       end;

       panel_Produtos.Enabled        := false;
       Grid_DetalhesDoPedido.Enabled := false;
       panel_total.Enabled           := false;
       pan_botoes.Enabled            := false;

end;

procedure T_frmFecharPedido.AtualizarHistoricoEP;
var
  proxNumHistorico, IDFornecedor, IDPedido : integer;

begin

     dtDataDoDia      := TDateEdit.Create(self);
     dtDataDoDia.Date := date;
     MostrarMesEAno(dtDataDoDia.Text);


       _Sql := 'SELECT i.pedido_id, i.produto_id, i.qde, c.id_pedido, c.fornecedor_id FROM i_pedido i, '+
               'c_pedido c WHERE i.pedido_id = c.id_pedido and i.pedido_id = :pIDPedido';

        with DM_Pesq.Qry_Auxiliar do
        begin

            close;
            sql.Clear;
            sql.Add(_Sql);
            Params.ParamByName('pIDPedido').AsInteger   := StrToInt(edt_IDPedidoAberto.Text);
            open;

            while not eof do
            begin

                 id_produtoItem    :=  DM_Pesq.Qry_Auxiliar.Fields[1].Value;
                 QuantidadeEntrada :=  DM_Pesq.Qry_Auxiliar.Fields[2].Value;
                 IDFornecedor      :=  DM_Pesq.Qry_Auxiliar.Fields[4].Value;
                 IDPedido          :=  DM_Pesq.Qry_Auxiliar.Fields[0].Value;

                 IDFornecedorGerarDuplicata := DM_Pesq.Qry_Auxiliar.Fields[4].Value;
                 proxNumHistorico  := 0;                      

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
                      FieldByName('pedido_id').AsInteger        := IDPedido;
                      FieldByName('numnf').AsString             := NumNF;
                      FieldByName('fornecedor_id').AsInteger    := IDFornecedor;
                      FieldByName('venda_id').AsInteger         := 0;
                      FieldByName('cliente_id').AsInteger       := 0;
                      FieldByname('operador_id').AsInteger      := IdFuncionarioLogado(lblStatusLogoff.Caption);
                      FieldByname('codmov').AsString            := 'EP';  //entrada de produto
                      FieldByname('quantidade').AsFloat         := QuantidadeEntrada;
                      FieldByname('datamov').AsDateTime         := TDateTime(now);
                      FieldByname('historico').AsString         := 'ENTRADA DE PRODUTO';
                      FieldByName('mesano').AsString            := mes_ano;
                      ApplyUpdates(0);

                   end;
             next;
         end;
   end;

end;


procedure T_frmFecharPedido.EnviarQdesAoEstoque;
begin

       _Sql := 'SELECT p.estoque_atual, p.id_produto, t.produto_id, t.pedido_id, t.qde FROM produtos p, '+
                't_pedido t WHERE p.id_produto = t.produto_id AND t.pedido_id = :pIDPedido';

        with DM_Pesq.Qry_Auxiliar do
        begin

            close;
            sql.Clear;
            sql.Add(_Sql);
            Params.ParamByName('pIDPedido').AsInteger   := StrToInt(edt_IDPedidoAberto.Text);
            open;

            while not eof do
            begin

                 Estoque_Atual     :=  DM_Pesq.Qry_Auxiliar.Fields[0].Value;
                 id_produtoItem    :=  DM_Pesq.Qry_Auxiliar.Fields[1].Value;
                 QuantidadeEntrada :=  DM_Pesq.Qry_Auxiliar.Fields[4].Value;

                 EstoqueAtualizado :=  (Estoque_Atual + QuantidadeEntrada);

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




procedure T_frmFecharPedido.rd_exclusaodoitemClick(Sender: TObject);
begin

     if rd_exclusaodoitem.Checked then
     begin

          ExcluirItemDoPedido;
          rd_exclusaodoitem.Checked := false;

     end;

end;


procedure T_frmFecharPedido.ExcluirItemDoPedido;
var
  texto : string;
begin

       btnGravarPedido.Enabled := false;

       ValorTotalItemDeletado := StrToFloat(txt_ValorTotalDoItem.text);

       texto:= 'Confirma a exclusão do ítem selecionado?';

       if Application.MessageBox(PChar(texto),'Excluíndo ítem',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

            //DELETANDO O ÍTEM DA TABELA T_PEDIDO (TEMPORARIA)
           with DM_Pesq.Qry_Geral do
           begin

                close;
                sql.Clear;
                sql.Add('DELETE FROM t_pedido WHERE vl_totalitem = :pValor');
                Params.ParamByName('pValor').AsFloat        := ValorTotalItemDeletado;
                ExecSQL();

           end;


           //DELETANDO O ÍTEM DA TABELA I_PEDIDO (TABELA QUE FICARA COM OS ITENS EM DEFINITIVO)
           with DM_Pesq.Qry_Geral do
           begin

                close;
                sql.Clear;
                sql.Add('DELETE FROM i_pedido WHERE pedido_id = :pIdPedido AND vl_totalitem = :pValor');
                Params.ParamByName('pIdPedido').AsInteger  := StrToInt(edt_IDPedidoAberto.text);
                Params.ParamByName('pValor').AsFloat       := ValorTotalItemDeletado;
                ExecSQL();

           end;

             //ATUALIZANDO A TABELA C_PEDIDO APOS DELEÇÃO
             ValorAtualizadoAposCadastro := StrToFloat(db_ValorTotal.Text);

             with DM_Pesq.Qry_Geral do
             begin

                  close;
                  sql.Clear;
                  sql.Add('UPDATE c_pedido SET vl_totalpedido = :pNovoTotal  WHERE id_pedido = :pIdPedido');
                  Params.ParamByName('pIdPedido').AsInteger   := StrToInt(edt_IDPedidoAberto.Text);
                  Params.ParamByName('pNovoTotal').AsFloat    := ValorAtualizadoAposCadastro;
                  ExecSQL();

             end;

              //ATUALIZANDO A TABELA C_PEDIDO APOS DELEÇÃO
             ValorAtualizadoAposCadastro := StrToFloat(db_ValorTotal.Text);

             with DM_Pesq.Qry_Geral do
             begin

                  close;
                  sql.Clear;
                  sql.Add('UPDATE c_pedido SET vl_totalpedido = :pNovoTotal  WHERE id_pedido = :pIdPedido');
                  Params.ParamByName('pIdPedido').AsInteger   := StrToInt(edt_IDPedidoAberto.Text);
                  Params.ParamByName('pNovoTotal').AsFloat    := ValorAtualizadoAposCadastro;
                  ExecSQL();

             end;


           AbrirFecharTabelas;
           Grid_DetalhesDoPedido.Refresh;  // ATUALIZANDO O GRID APOS A DELEÇÃO

           btnGravarPedido.Enabled         := true;
           rd_exclusaodoitem.Checked       := false;
           panel_item.Visible              := false;
           panel_total.Visible             := true;
           btnSair.Enabled                 := false;
           grCabecalho.Enabled             := true;
           edt_DescProdutoPedido.text      := '';
           HabilitarBotoes;

       end else begin

         rd_exclusaodoitem.Checked         := false;
         panel_item.Visible                := false;
         panel_total.Visible               := true;
         edtPrecoAtual.ReadOnly            := false;
         edt_PrecoProdutoPedido.ReadOnly   := false;
         edt_PrecoProdutoPedido.Text       := '0,00';
         edtPrecoAtual.Text                := '0,00';
         edt_DescProdutoPedido.text        := '';
         grCabecalho.Enabled               := true;
         HabilitarBotoes;

       end;

end;


procedure T_frmFecharPedido.rd_sairClick(Sender: TObject);
begin

     rd_sair.Checked  := false;
     HabilitarBotoes;
     edt_PrecoProdutoPedido.Text       := '0,00';
     edtPrecoAtual.Text                := '0,00';
     edt_DescProdutoPedido.text        := '';
     grCabecalho.Enabled               := true;

end;

procedure T_frmFecharPedido.DesabilitarBotoes;
begin

      panel_item.Visible                   := true;
      panel_total.Visible                  := false;
      pan_botoes.Enabled                   := false;

end;

procedure T_frmFecharPedido.HabilitarBotoes;
begin

      panel_item.Visible                   := false;
      panel_total.Visible                  := true;   
      pan_botoes.Enabled                   := true; 
     
end;


procedure T_frmFecharPedido.edt_DescProdutoPedidoClick(Sender: TObject);
begin  

      Application.CreateForm(T_frmEscolhaProdutoParaAtualizarPedido, _frmEscolhaProdutoParaAtualizarPedido);
     _frmEscolhaProdutoParaAtualizarPedido.ShowModal;
     FreeAndNil(_frmEscolhaProdutoParaAtualizarPedido);

     if dm_DadosSegundo.cds_TPedido.Locate('produto_id',StrToInt(edt_IDProdutoPedido.Text),[]) then
     begin

            Application.MessageBox('Este produto já consta deste pedido, delete-o e reentre com a quantidade desejada!', 'Duplicidade', MB_OK);
            edt_DescProdutoPedido.text    := '';
            edtPrecoAtual.Text            := '0,00';
            edtEstoque.Caption            := '';
            edt_DescProdutoPedido.Clear;
            edt_DescProdutoPedido.SetFocus;

     end;

     btnSair.Enabled           := false;
     btnCancelarPedido.Enabled := true;

end;

procedure T_frmFecharPedido.edt_PrecoProdutoPedidoClick(Sender: TObject);
begin

    edt_PrecoProdutoPedido.SelStart  := 0;
    edt_PrecoProdutoPedido.SelLength := Length(edt_PrecoProdutoPedido.Text);    

end;

procedure T_frmFecharPedido.edt_QuantidadeProdutoPedidoChange(
  Sender: TObject);
begin

    btnSair.Enabled := false;

end;
     

procedure T_frmFecharPedido.rd_alterarPrecoVendaClick(Sender: TObject);
begin

     Application.CreateForm(T_frmAlteracaoPrecoVenda, _frmAlteracaoPrecoVenda);
     _frmAlteracaoPrecoVenda.ShowModal;
     FreeAndNil(_frmAlteracaoPrecoVenda);

     rd_alterarPrecoVenda.Checked := false;

end;

procedure T_frmFecharPedido.MostrarPrecoDeVendaAtualDoProduto;
begin


     _Sql :='SELECT id_produto, precovenda FROM produtos WHERE id_produto = :pIDProduto';

     with DM_Pesq.Qry_Geral do
     begin

         close;
         sql.Clear;
         sql.Add(_Sql);
         params.ParamByName('pIDProduto').Value :=  strtoint(txt_ProdutoID.Text);
         open;

         if not IsEmpty then
         begin

             edtPrecoAtual.Text := DM_Pesq.Qry_Geral.Fields[1].Value;

         end;

     end;

     edtPrecoAtual.ReadOnly          := true;
     edt_PrecoProdutoPedido.ReadOnly := true;


end;

procedure T_frmFecharPedido.btnAlterarValoresDeVendaClick(Sender: TObject);
begin

     //altera todos os valores de venda dos itens do pedido atraves de um percentual

     Application.CreateForm(T_frmAlteraPrecosDeVendaDoPedidoPorPercentual, _frmAlteraPrecosDeVendaDoPedidoPorPercentual);
     _frmAlteraPrecosDeVendaDoPedidoPorPercentual.ShowModal;
     FreeAndNil(_frmAlteraPrecosDeVendaDoPedidoPorPercentual);


end;


procedure T_frmFecharPedido.btnImprimirPedidoClick(Sender: TObject);
begin 

         with Q_RelImprimePedido.cds_RelImprimePedido do
         begin

            Close;
            Params.ParamByName('pIDPedido').value  :=  StrToInt(edt_IDPedidoAberto.Text);
            Open;

            with Q_RelImprimePedido do
            begin

              LogOperacoes(NomeDoUsuarioLogado, 'acesso a impressão de pedido');
              cds_RelImprimePedido.Active := True;
              lblNomeUsuarioLogado.Caption := lblStatusLogoff.Caption;
              Preview;

            end;

         end;

end;

procedure T_frmFecharPedido.edt_DescProdutoPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

      Application.CreateForm(T_frmEscolhaProdutoParaAtualizarPedido, _frmEscolhaProdutoParaAtualizarPedido);
     _frmEscolhaProdutoParaAtualizarPedido.ShowModal;
     FreeAndNil(_frmEscolhaProdutoParaAtualizarPedido);

     if dm_DadosSegundo.cds_TPedido.Locate('produto_id',StrToInt(edt_IDProdutoPedido.Text),[]) then
     begin

            Application.MessageBox('Este produto já consta deste pedido, delete-o e reentre com a quantidade desejada!', 'Duplicidade', MB_OK);
            edt_DescProdutoPedido.text    := '';
            edtPrecoAtual.Text            := '0,00';
            edtEstoque.Caption            := '';
            edt_DescProdutoPedido.Clear;
            edt_DescProdutoPedido.SetFocus;

     end;

     btnSair.Enabled           := false;
     btnCancelarPedido.Enabled := true;

end;

procedure T_frmFecharPedido.db_ValorTotalEnter(Sender: TObject);
begin

    edt_DescProdutoPedido.SetFocus;

end;


end.






