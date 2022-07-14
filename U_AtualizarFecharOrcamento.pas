unit U_AtualizarFecharOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,DateUtils, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus, Math;

type
  T_frmAtualizarFecharOrcamento = class(TForm)
    pan_titulo: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    pan_botoes: TPanel;
    panel_itensOrcamento: TPanel;
    btnImprimir: TSpeedButton;
    btnGravarOrcamento: TSpeedButton;
    panel_total: TPanel;
    lbl37: TLabel;
    db_ValorTotal: TDBEdit;
    txt_IdDoITEM: TEdit;
    txt_ValorItem: TEdit;
    txt_IDPRODUTODEL: TEdit;
    edt_quantidadeDoItem: TEdit;
    panel_itens: TPanel;
    Grid_DetalhesDoOrcamento: TDBGrid;
    panel_item: TPanel;
    Label5: TLabel;
    rd_exclusaodoitem: TRadioButton;
    rd_sair: TRadioButton;
    panel_totalOrc: TPanel;
    Label1: TLabel;
    db_ValorTotal_2: TDBEdit;
    txtIdDoITEM: TEdit;
    txt_orc_id: TEdit;
    DBMemoHistorico: TDBMemo;
    btnCancelar: TSpeedButton;
    txtValorItem: TEdit;
    edtquantidadeDoItem: TEdit;
    gr_cliente: TGroupBox;
    txtNomeCliente: TStaticText;
    btnAbrirOrcamento: TButton;
    txtNumOrcamentoParaAbrir: TStaticText;
    txtIDCliente: TEdit;
    txtNumOrcamento: TStaticText;
    subMenu: TPopupMenu;
    ExcluirItem: TMenuItem;
    btnAprovarOrcamento: TSpeedButton;
    btnCancelarOrcamento: TSpeedButton;
    grDespesas: TGroupBox;
    btnInserirItem: TButton;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtValorServico: TCurrencyEdit;
    edtDescontoServico: TCurrencyEdit;
    edtQdeServico: TEdit;
    GroupBox2: TGroupBox;
    edtDescricao: TEdit;
    lblStatusLogoff: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure GravarAtualizacaoDoOrcamento;
    procedure rd_sairClick(Sender: TObject);
    procedure MostrarOsItens;
    procedure ExcluirItemDoGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MostrarDadosDoCliente;
    procedure LimparOrcamentoDaTela;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure AbrirFecharTabelas;
    procedure LimparTabelaTOrcamento;
    procedure DesabilitarBotoesInicial;
    procedure AprovarOrcamento;
    procedure CancelarOrcamentoNaoAprovado;
    procedure HabilitarBotoesInicial;
    procedure btnGravarOrcamentoClick(Sender: TObject);
    procedure DesabilitarBotoes;
    procedure HabilitarBotoes;
    procedure FormShow(Sender: TObject);
    procedure btnAbrirOrcamentoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnInserirItemClick(Sender: TObject);
    procedure Grid_DetalhesDoOrcamentoCellClick(Column: TColumn);
    procedure edtServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InserirServico;
    procedure DescontoMaiorQueItemServico;
    procedure edtDescontoServicoClick(Sender: TObject);
    procedure edtDescontoServicoExit(Sender: TObject);
    procedure edtQdeServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescontoServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQdeProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VerificarSeItemConstaDoOrcamentoAtual;
    procedure btnCancelarClick(Sender: TObject);
    procedure edtQdePecasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure ExcluirItemClick(Sender: TObject);
    procedure btnAprovarOrcamentoClick(Sender: TObject);
    procedure btnCancelarOrcamentoClick(Sender: TObject);
    procedure AtualizarItemAposExclusao;
    procedure CopiarItemsGravarNoBanco;
    procedure DeletarTodosItensDoOrcamento(idOrc:integer);
    procedure edtValorServicoEnter(Sender: TObject);

  private

    { Private declarations }               


  public
    { Public declarations }
     NumOrcamento , cont, IDOperador, proxNumOrcamento, proxNumDetalhe, proxNumTOrcamento,
     proxNumIOrcamento, proxNumIDetalhe,proxNumIDParaAtualizar, ProxNumIdItem, QdeItensDoMesmoOrc, idExcluido : integer;
     OrcamentoAberto, InseriuPeca, naoAprovado : Boolean;
     QuantidadeItemOrcamento, ValorItemOrcamento, ValorDescontoItemOrcamento, ValorPecas, EstoqueAtual, totalpecas,
     ValorDescontoPecas, QuantidadePeca, ValorLiquidoPecas , ValorTotalItemPeca,QuantidadeItemProduto, ValorProduto,
     ValorDescontoProduto, ValorLiquidoItemProduto, ValorTotalItemProduto, ValorLiquidoItemOrcamento, ValorTotalItemOrcamento : double;
     dataHistorico, horaHistorico : string;

  end;

var
  _frmAtualizarFecharOrcamento: T_frmAtualizarFecharOrcamento;


implementation

uses U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo, DB, U_EscolhaDoProdutoParaCotacao,
   U_EscolhaProdutoFecharCotacao, U_ValorDescontoCotacao,U_Caixa,
   U_DescontoFechamentoCotacao, U_PagamentoDeCotacao,
  U_ConsCotacoesPeriodo, U_principal, U_QRelImprimeCotacao,
  U_QRelCotacaoPeriodoGeral, DBClient, U_ConsOrcamentosPeriodo,
  U_DescontoOrcamentos, U_QRelOrcamento, U_DescontoAtualizandoOrcamento,
  U_PagtoDoOrcamento, SqlExpr, U_dmDados, U_ConsHistoricoClientes,
  U_EscolhaProdutoParaOrcamento, U_orcamento;


{$R *.dfm}

procedure T_frmAtualizarFecharOrcamento.FormCreate(Sender: TObject);
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
    pan_titulo.Caption           := 'Atualizar orçamento N° '+ IntToStr( NumOrcamento );
    IDOperador                   := IdFuncionarioLogado(lblStatusLogoff.Caption);
    DesabilitarBotoes;
    AbrirTabelas;
   
end;

procedure T_frmAtualizarFecharOrcamento.FormShow(Sender: TObject);
begin

     txtNumOrcamentoParaAbrir.Caption := IntToStr(_frmConsOrcamentosPeriodo.NumOrcamentoSelecionado);
     txtNumOrcamento.Caption          := IntToStr(_frmConsOrcamentosPeriodo.NumOrcamentoSelecionado);
     txtIDCliente.Text                := IntToStr(_frmConsOrcamentosPeriodo.IDCliente);
     _frmOrcamento.LimparTabelaTOrcamento;
     Caption := 'LOGADO POR '+NomeDoUsuarioLogado;
     _frmConsOrcamentosPeriodo.Close;
     OrcamentoAberto := true;
     btnAbrirOrcamentoClick(self);
     DesabilitarBotoesInicial;
     edtDescricao.SetFocus;
     controleNumerico := 0;
     
end;

procedure T_frmAtualizarFecharOrcamento.btnAbrirOrcamentoClick(Sender: TObject);
begin

    MostrarOsItens;

end;

procedure T_frmAtualizarFecharOrcamento.MostrarOsItens;
begin

          //COPIANDO OS ITENS DA TABELA I_ORCAMENTO PARA TABELA T_ORCAMENTO ATRAVES DO ID DO ORCAMENTO E MOSTRANDO NO GRID
          NumOrcamento   := StrToInt(txtNumOrcamentoParaAbrir.Caption);

          _Sql := 'INSERT INTO t_orcamento (id_detalhesorc, orc_id, item_id, descricao, valor_item, '+
                   'quantidade, total, flag, valor_pecas) select * FROM i_orcamento WHERE orc_id = :pNumOrcamento ORDER BY id_detalhesorc';

           with DM_Pesq.Qry_Geral do
           begin

               close;
               sql.Clear;
               sql.Add(_Sql);
               Params.ParamByName('pNumOrcamento').AsInteger := NumOrcamento;
               ExecSQL();

           end;

           txt_orc_id.Text      := IntToStr( NumOrcamento );
           MostrarDadosDoCliente;
           AbrirFecharTabelas;
           pan_titulo.Caption   := 'Atualizar orçamento N° '+ IntToStr(NumOrcamento );
           HabilitarBotoes;

           //ABRE A TABELA DO GRID
           dm_DadosSegundo.cds_TOrcamento.open;

end;

procedure T_frmAtualizarFecharOrcamento.ExcluirItemClick(Sender: TObject);
begin
  
   if(idExcluido>0)then
      begin

        ExcluirItemDoGrid;
        AtualizarItemAposExclusao;

      end else begin

        Application.MessageBox('Primeiro selecione o Ítem a ser excluído com botão esquerdo!', 'Ítem não selecionado!', MB_ICONEXCLAMATION);

   end;


end;

procedure T_frmAtualizarFecharOrcamento.ExcluirItemDoGrid;
var
  texto : string;
begin

        //MARCANDO O CAMPO VALOR_PECAS COM 1 PARA SABER QUAIS REGS SERÃO ALTERADOS O ID DEPOIS DA EXCLUSÃO OU SEJA TODOS QUE TEM VALOR 1 NESSE CAMPO
       _Sql2:= 'UPDATE t_orcamento set valor_pecas=1 where item_id > '+IntToStr(idExcluido);

        with DM_Pesq.Qry_Geral do
        begin

          Close;
          SQL.Clear;
          SQL.Add(_Sql2);
          ExecSQL;

        end;              


       texto:= 'Confirma a exclusão do ítem selecionado?';

       if Application.MessageBox(PChar(texto),'Excluíndo ítem',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

           //EXCLUINDO OS ÍTENS SELECIONADOS DA TABELA t_orcamento  (itens que aparecem no grid)

           _Sql:= 'Delete FROM t_orcamento WHERE item_id = :pIDItem';

            with DM_Pesq.Qry_Geral do
            begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              ParamByName('pIDItem').AsInteger := idExcluido;
              ExecSQL();

           end;

           AbrirFecharTabelas;
           txtIdDoITEM.Text  := '0';
           controleNumerico := 0;
           txtValorItem.Clear;
           Application.MessageBox('Ítem excluído com sucesso!', 'Excluindo ítem!', MB_OK);
           btnGravarOrcamento.Enabled:=true;
           btnCancelar.Enabled:=false;

       end
       else begin

           btnGravarOrcamento.Enabled:=false;
           btnCancelar.Enabled:=true;
           
       end;          

       dm_DadosSegundo.cds_TOrcamento.Open;

end;

procedure T_frmAtualizarFecharOrcamento.AtualizarItemAposExclusao;
begin

      //ATUALIZA A NUMERAÇÃO DOS ÍTENS LOGO APÓS A EXCLUSÃO DE ALGUM DELES
      _Sql:= 'UPDATE t_orcamento set item_id = item_id-1 where valor_pecas=1';

      with DM_Pesq.Qry_Geral do
      begin

        Close;
        SQL.Clear;
        SQL.Add(_Sql);
        ExecSQL;

      end;

      //DEPOIS DE UTILIZADO O VALOR 1 PRA ATUALIZAÇÃO VOLTO TUDO COM VALOR 0
      _Sql1:= 'UPDATE t_orcamento set valor_pecas=0 where valor_pecas=1';

      with DM_Pesq.Qry_Geral do
      begin

        Close;
        SQL.Clear;
        SQL.Add(_Sql1);
        ExecSQL;

      end;

     //ATUALIZANDO A TABELA
     dm_DadosSegundo.cds_TOrcamento.Active  := false;
     dm_DadosSegundo.cds_TOrcamento.Active  := true;

     //COLOCANDO NA ORDEM DO ID
     OrdenarRecordSet(dm_DadosSegundo.cds_TOrcamento,'t_orcamento','id_detalhesorc');
     
end;

procedure T_frmAtualizarFecharOrcamento.rd_sairClick(Sender: TObject);
begin

     panel_item.Visible       := false;
     HabilitarBotoes;

end;


procedure T_frmAtualizarFecharOrcamento.LimparOrcamentoDaTela;
begin

   //LIMPA OS ITENS DO ORÇAMENTO DA TELA
   dm_DadosSegundo.cds_TOrcamento.Close;
   txtNumOrcamentoParaAbrir.Caption:= '';
   txtNumOrcamentoParaAbrir.Left   := 429;
   pan_titulo.Caption              := 'Atualizar Orçamento N° '+ IntToStr(NumOrcamento);
   txtNomeCliente.Caption := '';
   edtDescricao.Clear;
   panel_itens.Visible    := false;
   txtIDCLIENTE.Text := '0';
   LimparTabelaTOrcamento;
   close;


end;

procedure T_frmAtualizarFecharOrcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  close;
  release;
    
end;


procedure T_frmAtualizarFecharOrcamento.AbrirTabelas;
begin

    dm_DadosSegundo.cds_IOrcamento.Active                 := true;
    dm_DadosSegundo.cds_Orcamento.Active                  := true;
    dm_DadosSegundo.cds_TOrcamento.Active                 := true;
    
end;

procedure T_frmAtualizarFecharOrcamento.FecharTabelas;
begin

    dm_DadosSegundo.cds_IOrcamento.Active                 := false;
    dm_DadosSegundo.cds_Orcamento.Active                  := false;
    dm_DadosSegundo.cds_TOrcamento.Active                 := false;

end;


procedure T_frmAtualizarFecharOrcamento.AbrirFecharTabelas;
begin

    dm_DadosSegundo.cds_IOrcamento.Active                 := true;
    dm_DadosSegundo.cds_Orcamento.Active                  := true;
    dm_DadosSegundo.cds_TOrcamento.Active                 := true;

    dm_DadosSegundo.cds_IOrcamento.Active                 := false;
    dm_DadosSegundo.cds_Orcamento.Active                  := false;
    dm_DadosSegundo.cds_TOrcamento.Active                 := false;

end;

procedure T_frmAtualizarFecharOrcamento.MostrarDadosDoCliente;
begin

     _Sql:='SELECT o.id_cliente, o.id_orcamento, cl.cli_id, cl.cli_nome, cl.cli_endereco, cl.cli_fone FROM orcamento o, clientes cl '+
           'WHERE o.id_cliente = cl.cli_id AND o.id_orcamento = :pNumOrcamento ';

     with DM_Pesq.Qry_Geral do
     begin

         Close;
         SQL.Clear;
         sql.Add(_Sql);
         Params.ParamByName('pNumOrcamento').AsInteger := StrToInt(txtNumOrcamentoParaAbrir.Caption);
         open;

         if not IsEmpty then
         begin

             txtNomeCliente.Caption     := ' '+DM_Pesq.Qry_Geral.Fields[3].AsString;

         end;

     end;

     txtNomeCliente.Visible := true;

end;


procedure T_frmAtualizarFecharOrcamento.LimparTabelaTOrcamento;
begin

    ApagarTabela('t_orcamento');
    AbrirFecharTabelas;

end;


procedure T_frmAtualizarFecharOrcamento.btnGravarOrcamentoClick(Sender: TObject);
begin

    //ANTES DE GRAVAR A ATUALIZAÇÃO EU EXCLUO TODOS OS ITENS DA TABELA I_ORCAMENTO
    DeletarTodosItensDoOrcamento(StrToInt(txt_orc_id.Text));
    GravarAtualizacaoDoOrcamento;

end;

procedure T_frmAtualizarFecharOrcamento.GravarAtualizacaoDoOrcamento;
var totalgeral : double;
begin

            totalgeral := 0;
            cont       := 0;

            //SOMANDO OS VALORES E TOTALIZANDO O VALOR DO ORCAMENTO PARA ATUALIZACAO

           _Sql:= 'SELECT orc_id, sum(total) FROM t_orcamento GROUP BY orc_id';

            With DM_Pesq.Qry_Auxiliar do begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              open;

                if not IsEmpty then
                begin

                     totalgeral :=  DM_Pesq.Qry_Auxiliar.Fields[1].Value;

                end;

            end;

           //ATUALIZANDO O VALOR DO ORCAMENTO APOS INSERÇÃO DE NOVOS ITENS
           _Sql:= 'UPDATE orcamento SET total = :pTotal where id_orcamento = :pIDOrcamento';

           With DM_Pesq.Qry_Geral do begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              ParamByName('pTotal').Value          := totalgeral;
              ParamByName('pIDOrcamento').Value    := NumOrcamento ;
              ExecSQL();

            end;

            //COPIANDO TODOS OS ÍTEMS DA TABELA T_ORCAMENTO QUE ESTA NA TELA PARA TABELA FINAL I_ORCAMENTO
            CopiarItemsGravarNoBanco;
            AbrirFecharTabelas;

            Application.MessageBox('Orçamento atualizado com sucesso!', 'Gravando orçamento...', MB_OK);
            LogOperacoes(NomeDoUsuarioLogado, 'atualização de orçamento');
            OrcamentoAberto  := false;
            controleNumerico := 0;

            DesabilitarBotoes;
            LimparOrcamentoDaTela;


end;

procedure T_frmAtualizarFecharOrcamento.DesabilitarBotoes;
begin        

      panel_item.Visible                   := true;
      btnGravarOrcamento.Enabled           := false;
      btnImprimir.Enabled                  := false;

end;

procedure T_frmAtualizarFecharOrcamento.HabilitarBotoes;
begin

      panel_item.Visible                   := false;
      btnGravarOrcamento.Enabled           := true;
      btnImprimir.Enabled                  := true;

end;

procedure T_frmAtualizarFecharOrcamento.btnImprimirClick(Sender: TObject);
begin
     Application.CreateForm(TQ_RelOrcamento,  Q_RelOrcamento);
     with Q_RelOrcamento.cds_RelOrcamento do
     begin

          close;
          Params.ParamByName('pIDOrcamento').AsInteger  := StrToInt(txtNumOrcamentoParaAbrir.Caption);
          open;

     end;

     Q_RelOrcamento.Preview;
     FreeAndNil(Q_RelOrcamento);
     LogOperacoes(NomeDoUsuarioLogado, 'impressão de orçamento');

end;

procedure T_frmAtualizarFecharOrcamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if ((ssAlt in Shift) and (Key = VK_RETURN)) then 
          Key := 0;


end;

procedure T_frmAtualizarFecharOrcamento.btnInserirItemClick(
  Sender: TObject);
begin

        if ( edtDescricao.Text = '' ) then
         begin

             Application.MessageBox('Atenção o campo Descrição é de preenchimento obrigatório!', 'Informação de Sistema!', MB_OK);
             edtDescricao.SetFocus;

         end else begin

             InserirServico;

         end;
         
end;

procedure T_frmAtualizarFecharOrcamento.InserirServico;
begin

        Grid_DetalhesDoOrcamento.Visible  := true;
        btnGravarOrcamento.Enabled        := true;
        ValorPecas                        := 0;
        QuantidadeItemOrcamento           := StrToFloat(edtQdeServico.Text);
        ValorItemOrcamento                := StrToFloat(edtValorServico.Text);
        ValorDescontoItemOrcamento        := StrToFloat(edtDescontoServico.text);
        ValorLiquidoItemOrcamento         := ( ValorItemOrcamento - ValorDescontoItemOrcamento );
        ValorTotalItemOrcamento           := ( ValorLiquidoItemOrcamento * QuantidadeItemOrcamento );
      

        //aqui estamos gravando todos os itens do orcamento para mostrar temporariamente no grid, depois apagamos a tabela t_orcamento
        if(controleNumerico = 0)then
        begin
            proxNumIOrcamento := GerarProximoID('id_detalhesorc','i_orcamento');   //entrando com o proximo numero de i_orcamento para não haver duplicidade na hora da gravação
        end else begin
            proxNumIOrcamento := GerarProximoID('id_detalhesorc','t_orcamento');   //entrando com o proximo numero de t_orcamento para não haver duplicidade na hora da gravação
        end;


         ProxNumIdItem      := GerarProximoID('item_id','t_orcamento');

         with dm_DadosSegundo.cds_TOrcamento do
          begin

               Append;

               FieldByName('id_detalhesorc').AsInteger       := proxNumIOrcamento;
               FieldByName('orc_id').AsInteger               := NumOrcamento;
               FieldByName('item_id').AsInteger              := ProxNumIdItem;
               FieldByName('descricao').AsString             := edtDescricao.Text;
               FieldByName('valor_item').AsFloat             := ValorLiquidoItemOrcamento;
               FieldByName('quantidade').AsFloat             := QuantidadeItemOrcamento;
               FieldByName('total').AsFloat                  := ValorTotalItemOrcamento;
               FieldByName('flag').AsString                  := 'N';         //itens q serao comitados ou seja gravados posteriormente em I_ORCAMENTO
               FieldByName('valor_pecas').AsFloat            := 0;

               ApplyUpdates(0);

          end;


            while dm_DadosSegundo.cds_TOrcamento.Eof do
            begin

                  proxNumIDParaAtualizar :=  proxNumIOrcamento + 1;

                  //alterando os registro que foram gravados com flag = C em t_orcamento para flag = N

                   _Sql:= 'UPDATE t_orcamento SET id_detalhesorc = :proxNumID  WHERE  flag = '+QuotedStr('N')+'';

                   With DM_Pesq.Qry_Geral do
                   begin

                      Close;
                      SQL.Clear;
                      SQL.Add(_Sql);
                      Params.ParamByName('proxNumID').AsInteger := proxNumIDParaAtualizar;
                      ExecSQL();

                    end;
            next;

        end;

           // LimparCampos apos a escolha do produto
           edtDescricao.Clear;
           inc(controleNumerico);
           edtValorServico.Text        := '0,00';
           edtDescontoServico.Text     := '0,00';
           edtQdeServico.Text          := '1';
           ValorPecas                  := 0;
           QuantidadeItemOrcamento     := 0;
           ValorItemOrcamento          := 0;
           ValorDescontoItemOrcamento  := 0;
           ValorLiquidoItemOrcamento   := 0;
           ValorTotalItemOrcamento     := 0;
           inseriuServico              := false;
           btnGravarOrcamento.Enabled  := true;
           edtDescricao.Clear;
           edtDescricao.SetFocus;

end;


procedure T_frmAtualizarFecharOrcamento.VerificarSeItemConstaDoOrcamentoAtual;
begin

          //Verifica se o produto não consta da venda atual
          _Sql := ('SELECT * FROM i_orcamento WHERE orc_id = :pIdOrc');

          with DM_Pesq.Qry_Geral do
          begin

               close;
               sql.Clear;
               sql.Add(_Sql);
               ParamByName('pIdOrc').AsInteger     := StrToInt(txtNumOrcamento.Caption);
               open;

               if not IsEmpty then
               begin

                   Application.MessageBox('Este Ítem já foi adicionado a este orçamento verifique!','Duplicidade!', MB_OK);
                   InseriuProduto                  := false;

               end;

          end;

end;


procedure T_frmAtualizarFecharOrcamento.Grid_DetalhesDoOrcamentoCellClick(
  Column: TColumn);
begin

     panel_item.Visible         := true;
     btnGravarOrcamento.Enabled := true;

     txtIdDoITEM.Text           := IntToStr(dm_DadosSegundo.cds_TOrcamento.FieldByName('item_id').AsInteger);
     idExcluido                 := dm_DadosSegundo.cds_TOrcamento.FieldByName('item_id').AsInteger;
     txtValorItem.Text          := FloatToStr(dm_DadosSegundo.cds_TOrcamento.FieldByName('valor_item').AsFloat);
     edtquantidadeDoItem.text   := FloatToStr(dm_DadosSegundo.cds_TOrcamento.FieldByName('quantidade').AsFloat);
     txt_orc_id.Text            := IntToStr(dm_DadosSegundo.cds_TOrcamento.FieldByName('orc_id').AsInteger);
     DesabilitarBotoes;
     btnAprovarOrcamento.Enabled:= false;

end;

procedure T_frmAtualizarFecharOrcamento.edtServicoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if key = 13 then
     begin

          edtDescricao.SetFocus;

      end;

end;

procedure T_frmAtualizarFecharOrcamento.edtDescricaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

     if key = 13 then
      begin

          edtValorServico.SetFocus;

      end;

end;

procedure T_frmAtualizarFecharOrcamento.edtValorServicoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

      if key = 13 then
      begin

          if ( edtValorServico.Value = 0 ) then
          begin

              Application.MessageBox('Atenção o valor do serviço não pode estar zerado!', 'Informação de Sistema!', MB_OK);
              edtValorServico.SetFocus;

          end else begin

               edtDescontoServico.SetFocus;

          end;

    end;

end;

procedure T_frmAtualizarFecharOrcamento.edtQdeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

      if key = 13 then
      begin

          btnInserirItemClick(Self);

      end;

end;

procedure T_frmAtualizarFecharOrcamento.edtDescontoServicoClick(
  Sender: TObject);
begin

      edtDescontoServico.SelStart:=0;
      edtDescontoServico.SelLength :=  length(edtDescontoServico.Text);    

end;

procedure T_frmAtualizarFecharOrcamento.edtDescontoServicoExit(
  Sender: TObject);
begin

     DescontoMaiorQueItemServico;

end;

procedure T_frmAtualizarFecharOrcamento.DescontoMaiorQueItemServico;
begin

      if( StrToFloat(edtValorServico.Text) < StrToFloat(edtDescontoServico.Text) ) then
      begin

          Application.MessageBox('Atenção o valor do desconto não pode ser maior que o valor do ítem!', 'Informação de Sistema!', MB_OK);
          edtDescontoServico.Text := '0,00';
          edtDescontoServico.SetFocus;

      end;

end;

procedure T_frmAtualizarFecharOrcamento.edtQdeServicoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

     if key = 13 then
     begin

         inseriuServico := true;
         btnInserirItemClick(self);

     end;

end;

procedure T_frmAtualizarFecharOrcamento.edtDescontoServicoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

      if key = 13 then
      begin

          edtQdeServico.SetFocus;

      end;

end;

procedure T_frmAtualizarFecharOrcamento.edtQdeProdutoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

     if key = 13 then
     begin

        inseriuProduto := true;
        inseriuServico := false;

        btnInserirItemClick(self);

     end;     

end;


procedure T_frmAtualizarFecharOrcamento.btnCancelarClick(Sender: TObject);
begin

   Application.MessageBox('As alterações não salvas serão perdidas!','Cancelando ou saindo!', MB_OK);
   LimparOrcamentoDaTela;
   OrcamentoAberto := false;

end;

procedure T_frmAtualizarFecharOrcamento.edtQdePecasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if key = 13 then
     begin

         inseriuServico := false;
         inseriuProduto := false;
         InseriuPeca    := true;

         btnInserirItemClick(self);

     end;

end;

procedure T_frmAtualizarFecharOrcamento.edtDescricaoKeyPress(
  Sender: TObject; var Key: Char);
begin

    if Length(edtDescricao.text) > 90 then
    begin

        Application.MessageBox('Este campo aceita apenas 90 caracteres!','Tamanho do campo excedido!', MB_OK);
        edtDescricao.Text := copy(edtDescricao.Text,1,100-10);
        edtDescricao.SelStart := 89;

    end;
    btnAprovarOrcamento.Enabled:= false;
    btnImprimir.Enabled:=false;
end;

procedure T_frmAtualizarFecharOrcamento.DesabilitarBotoesInicial;
begin

  btnGravarOrcamento.Enabled:= false;

end;

procedure T_frmAtualizarFecharOrcamento.HabilitarBotoesInicial;
begin
   btnGravarOrcamento.Enabled:= false;
end;


procedure T_frmAtualizarFecharOrcamento.AprovarOrcamento;
begin

     //ATUALIZANDO STATUS DO ORÇAMENTO PARA APROVADO
     With DM_Pesq.Qry_Geral do begin

        Close;
        SQL.Clear;
        SQL.Add('UPDATE orcamento SET status = '+QuotedStr('APROVADO')+' where id_orcamento = :pIDORC');
        ParamByName('pIDORC').AsInteger := NumOrcamento;
        ExecSQL();

      end;

      Application.MessageBox('Orçamento aprovado execute o serviço para posterior pagamento!','Orçamento aprovado!', MB_OK);
      close;

end;

procedure T_frmAtualizarFecharOrcamento.CancelarOrcamentoNaoAprovado;
begin

     //ATUALIZANDO STATUS DO ORÇAMENTO PARA NÃO APROVADO
    With DM_Pesq.Qry_Geral do begin

        Close;
        SQL.Clear;
        SQL.Add('UPDATE orcamento SET status = '+QuotedStr('DESAPROVADO')+', datapagto = :pdataCancelamento where id_orcamento = :pIDCANCELADO');
        ParamByName('pIDCANCELADO').AsInteger := NumOrcamento;
        ParamByName('pdataCancelamento').AsDateTime := date;
        ExecSQL();

      end;

     //ATUALIZANDO STATUS DOS ITENS DO ORÇAMENTO NÃO APROVADO PARA 'D' SIGNIFICANDO QUE OS ITENS ASSIM COMO O ORÇAMENTO FORAM DESAPROVADOS
     With DM_Pesq.Qry_Geral do begin

        Close;
        SQL.Clear;
        SQL.Add('UPDATE i_orcamento SET flag = '+QuotedStr('D')+' where orc_id = :pIDORC');
        ParamByName('pIDORC').AsInteger := NumOrcamento;
        ExecSQL();

      end;
     
      if(naoAprovado)then
        Application.MessageBox('Orçamento cancelado por desaprovação do cliente,'#13'caso   seja   necessário  você  poderá   reativá-lo  no'#13'menu  reativações e dar prosseguimento no mesmo!','Orçamento não aprovado pelo cliente!', MB_ICONINFORMATION)
      else
        //Application.MessageBox('Orçamento cancelado com sucesso!','Cancelamento do orçamento!', MB_OK);
        Application.MessageBox('Orçamento cancelado pelo usuário!, se desejar você poderá reativá-lo  no  menu  reativações  e  dar prosseguimento no mesmo!','Orçamento não aprovado pelo cliente!', MB_ICONINFORMATION);
        naoAprovado := false;
      close;

end;

procedure T_frmAtualizarFecharOrcamento.btnAprovarOrcamentoClick(Sender: TObject);
begin
     //CONFIRMANDO APROVAÇÃO DO CLIENTE
     texto:= 'Confirma aprovação para execução e posterior pagamento?';

     if Application.MessageBox(PChar(texto),'Aprovação de orçamento para execução e pagamento!',MB_YESNO + MB_ICONQUESTION) = IdYes then
     begin

        AprovarOrcamento;

     end else begin

        naoAprovado := true;
        CancelarOrcamentoNaoAprovado;

     end;

end;

procedure T_frmAtualizarFecharOrcamento.btnCancelarOrcamentoClick(
  Sender: TObject);
begin
   texto:= 'Confirma o cancelamento deste orçamento?';

   if Application.MessageBox(PChar(texto),'Cancelamento do orçamento corrente!',MB_YESNO + MB_ICONQUESTION) = IdYes then
     begin

        CancelarOrcamentoNaoAprovado;

     end else begin

        exit;

     end;
end;

procedure T_frmAtualizarFecharOrcamento.CopiarItemsGravarNoBanco;
begin

      //COPIANDO OS ITENS DA TABELA T_ORCAMENTO PARA I_ORCAMENTO PARA GRAVAÇÃO FINAL NO BANCO DE DADOS   

      _Sql := 'INSERT INTO i_orcamento (id_detalhesorc,orc_id,item_id,descricao,valor_item,quantidade,total,flag,valor_pecas) select * FROM t_orcamento';

       with DM_Pesq.Qry_Geral do
       begin

           close;
           sql.Clear;
           sql.Add(_Sql);
           ExecSQL();

       end;

end;

procedure T_frmAtualizarFecharOrcamento.DeletarTodosItensDoOrcamento(
  idOrc: integer);
begin

    _Sql:= 'Delete FROM i_orcamento WHERE orc_id = '+IntToStr(idOrc);

    with DM_Pesq.Qry_Geral do begin

      Close;
      SQL.Clear;
      SQL.Add(_Sql);
      ExecSQL();

   end;

end;

procedure T_frmAtualizarFecharOrcamento.edtValorServicoEnter(
  Sender: TObject);
  var
     alterado:string;
begin

     if ( edtDescricao.Text = '' ) then
     begin

         Application.MessageBox('Atenção o campo Descrição é de preenchimento obrigatório!', 'Informação de Sistema!', MB_OK);
         edtDescricao.SetFocus;

     end else begin

         alterado := LetrasIniciaisMaiusculas(edtDescricao.Text);
         edtDescricao.Text := alterado;

     end;
     edtQdeServico.Text := '1';
end;

end.




