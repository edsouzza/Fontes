unit U_AddItensNoPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,DateUtils, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus;

type
  T_frmAddItensNoPedido = class(TForm)
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
    txt_ValorTotalDoItem: TEdit;
    Grid_DetalhesDoPedido: TDBGrid;
    pan_botoes: TPanel;
    btnCancelarPedido: TSpeedButton;
    btnGravarPedido: TSpeedButton;
    GroupBox1: TGroupBox;
    edt_pedido: TLabel;
    GroupBox2: TGroupBox;
    lbl52: TLabel;
    edt_IDPedidoAberto: TEdit;
    lbl33: TLabel;
    edt_PrecoProdutoPedido: TCurrencyEdit;
    lbl14: TLabel;
    edt_QuantidadeProdutoPedido: TEdit;
    btnSair: TSpeedButton;
    edt_IDProdutoPedido: TEdit;
    btnCadProduto: TSpeedButton;
    Label1: TLabel;
    edtPrecoAtual: TCurrencyEdit;
    panel_item: TPanel;
    Label5: TLabel;
    rd_exclusaodoitem: TRadioButton;
    rd_sair: TRadioButton;
    Label2: TLabel;
    edtEstoque: TStaticText;
    edt_DescProdutoPedido: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure InserirProduto;
    procedure LimparTabelaPedidoTemp;
    procedure LimparCampos;
    procedure AbrirFecharTabelas;
    procedure DesabilitarBotoes;
    procedure HabilitarBotoes;
    procedure ExcluirPedido; 
    procedure btnGravarPedidoClick(Sender: TObject);
    procedure edt_QuantidadeProdutoPedidoKeyPress(Sender: TObject;
      var Key: Char);
    procedure ConverterValorTotalParaFloatValido;
    procedure edt_QuantidadeProdutoPedidoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_DetalhesDoPedidoCellClick(Column: TColumn);
    procedure edt_DescProdutoPedidoClick(Sender: TObject);
    procedure edt_PrecoProdutoPedidoClick(Sender: TObject);
    procedure edt_QuantidadeProdutoPedidoClick(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_DescProdutoPedidoKeyPress(Sender: TObject;
      var Key: Char);
    procedure btnCadProdutoClick(Sender: TObject);
    procedure edtPrecoAtualClick(Sender: TObject);
    procedure rd_sairClick(Sender: TObject);
    procedure rd_exclusaodoitemClick(Sender: TObject);
    procedure ExcluirItemDoPedido;
    procedure edt_DescProdutoPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    { Private declarations }

  public
    { Public declarations }

    ValorUnitarioItemProdutoPedido, ValorAtualizadoAposCadastro,ValorTotalPedido,
    ValorAtualizadoAposDelecao, ValorLiquidoItemProdutoPedido, ValorTotalItemProdutoPedido,ValorTotalItemDeletado,
    Qde_deletada, QuantidadeItemProdutoPedido, ValorTotalInicial, ValorTotalConvertido,ValorItemPraDeletarNaExclusao  : double;

    proxNumeDetalhe, proxNumItens, NumeroDaComandaAberta, proxNumComanda,Id_Produto, Id_FuncLogado : integer;
    AtualizandoPedido, PedidoSemItens : Boolean;
    DataDoDia   : TDate;

  end;

var
  _frmAddItensNoPedido: T_frmAddItensNoPedido;
            

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo,
  SqlExpr,DBClient, U_principal, DB, U_EscolhaDoProdutoParaPedido,
  U_CadPedido, U_CadProdutoPedidos, U_EscolhaProdutoParaAtualizarPedido;


{$R *.dfm}

procedure T_frmAddItensNoPedido.FormCreate(Sender: TObject);
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
    AbrirTabelas;
    LimparTabelaPedidoTemp;

end;

procedure T_frmAddItensNoPedido.LimparTabelaPedidoTemp;
begin  

     With DM_Pesq.Qry_Geral do
     begin

        Close;
        SQL.Clear;
        SQL.Add('Delete FROM t_pedido');
        ExecSQL;

     end;

     AbrirFecharTabelas;

end;



procedure T_frmAddItensNoPedido.btnGravarPedidoClick(Sender: TObject);
begin

     ValorAtualizadoAposCadastro := StrToFloat(db_ValorTotal.Text);

     with DM_Pesq.Qry_Geral do
     begin

          close;
          sql.Clear;
          sql.Add('UPDATE c_pedido SET vl_totalpedido = :pNovoTotal WHERE id_pedido = :pIdPedido');
          Params.ParamByName('pIdPedido').AsInteger  := StrToInt(edt_IDPedidoAberto.Text);
          Params.ParamByName('pNovoTotal').AsFloat    := ValorAtualizadoAposCadastro;
          ExecSQL();

     end;

     LimparTabelaPedidoTemp;
     AbrirFecharTabelas;
     btnsair.Enabled := true;
     Grid_DetalhesDoPedido.Refresh;
     Application.MessageBox('Pedido gravado com sucesso!', 'OK!', MB_OK);
     LogOperacoes(NomeDoUsuarioLogado, 'atualização de pedido');
     close;
    
end;


procedure T_frmAddItensNoPedido.AbrirTabelas;
begin

    dm_DadosSegundo.cds_IPedido.Active               := true;
    dm_DadosSegundo.cds_TPedido.Active               := true;

end;

procedure T_frmAddItensNoPedido.FecharTabelas;
begin

    dm_DadosSegundo.cds_IPedido.Active               := false;
    dm_DadosSegundo.cds_TPedido.Active               := false;


end;


procedure T_frmAddItensNoPedido.AbrirFecharTabelas;
begin

    dm_DadosSegundo.cds_IPedido.Active               := false;
    dm_DadosSegundo.cds_TPedido.Active               := false;

    dm_DadosSegundo.cds_IPedido.Active               := true;
    dm_DadosSegundo.cds_TPedido.Active               := true;


end;



procedure T_frmAddItensNoPedido.edt_QuantidadeProdutoPedidoKeyPress(
  Sender: TObject; var Key: Char);
begin

     // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;


procedure T_frmAddItensNoPedido.edt_QuantidadeProdutoPedidoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

      if key = 13 then
      begin

           if ( edt_QuantidadeProdutoPedido.Text = '' ) or ( edt_PrecoProdutoPedido.Text = '' )  then
            begin

                  Application.MessageBox('Os campos: Preço, Quantidade não podem estar vazios!', 'Verifique', MB_OK);
                  edt_DescProdutoPedido.SetFocus;

            end else begin

                  InserirProduto;

            end;

      end;

end;


procedure T_frmAddItensNoPedido.InserirProduto;
begin

        proxNumeDetalhe := 0;
        proxNumItens    := 0;

        QuantidadeItemProdutoPedido       := StrToFloat(edt_QuantidadeProdutoPedido.Text);
        ValorUnitarioItemProdutoPedido    := StrToFloat(edt_PrecoProdutoPedido.Text);
        ValorLiquidoItemProdutoPedido     := ValorUnitarioItemProdutoPedido;

        ValorTotalItemProdutoPedido       := (ValorLiquidoItemProdutoPedido * QuantidadeItemProdutoPedido);


         // inserindo itens na tabela t_pedido que alimenta o grid de visualização
         With DM_Pesq.qry_Cod do
         begin

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


procedure T_frmAddItensNoPedido.LimparCampos;
begin

     edt_DescProdutoPedido.text := '';
     edt_PrecoProdutoPedido.Clear;
     edt_QuantidadeProdutoPedido.Clear;
     edtPrecoAtual.Text := '0,00';
     Grid_DetalhesDoPedido.SetFocus;
     edtEstoque.Caption := '';

end;


procedure T_frmAddItensNoPedido.ConverterValorTotalParaFloatValido;
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


procedure T_frmAddItensNoPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    release;

end;

procedure T_frmAddItensNoPedido.FormKeyPress(Sender: TObject;
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

          

procedure T_frmAddItensNoPedido.edt_DescProdutoPedidoClick(Sender: TObject);
begin

     Application.CreateForm(T_frmEscolhaProdutoParaPedidos, _frmEscolhaProdutoParaPedidos);
     _frmEscolhaProdutoParaPedidos.ShowModal;
     FreeAndNil(_frmEscolhaProdutoParaPedidos);

     if dm_DadosSegundo.cds_TPedido.Locate('produto_id',StrToInt(edt_IDProdutoPedido.Text),[]) then
     begin

            Application.MessageBox('Este produto já consta nesse pedido, delete-o e reentre com a quantidade desejada!', 'Duplicidade', MB_OK);
            edt_DescProdutoPedido.text    := '';
            edtPrecoAtual.Text            := '0,00';
            edtEstoque.Caption            := '';
            edt_DescProdutoPedido.Clear;
            edt_DescProdutoPedido.SetFocus;

     end;

     btnSair.Enabled := false;

end;

procedure T_frmAddItensNoPedido.edt_PrecoProdutoPedidoClick(
  Sender: TObject);
begin

     edt_PrecoProdutoPedido.SelStart  := 0;
     edt_PrecoProdutoPedido.SelLength := Length(edt_PrecoProdutoPedido.Text);

end;

procedure T_frmAddItensNoPedido.edt_QuantidadeProdutoPedidoClick(
  Sender: TObject);
begin

     edt_QuantidadeProdutoPedido.SelStart  := 0;
     edt_QuantidadeProdutoPedido.SelLength := Length(edt_QuantidadeProdutoPedido.Text);

end;

procedure T_frmAddItensNoPedido.btnCancelarPedidoClick(Sender: TObject);
var
  texto : string;
begin
      if not( PedidoTemItens(StrToInt(edt_pedido.Caption))) then
      begin
             texto:= 'Confirma o cancelamento deste pedido?';   
             if Application.MessageBox(PChar(texto),'Cancelando o corrente pedido',MB_YESNO + MB_ICONQUESTION) = IdYes then
             begin

                     ExcluirPedido;
                     Application.MessageBox('O pedido foi cancelado com sucesso!', 'Cancelamento de pedido', MB_OK);
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
                          sql.Add('DELETE FROM c_pedido WHERE id_pedido = :pIdPedido AND status='+QuotedStr('A')+'');
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

                 exit;

             end;

       end;

end;

procedure T_frmAddItensNoPedido.Grid_DetalhesDoPedidoCellClick(
  Column: TColumn);
begin

    txt_IDITEM.Text           := IntToStr(dm_DadosSegundo.cds_TPedido.FieldByName('id_pedidotemp').AsInteger);
    txt_ValorTotalDoItem.Text := FloatToStr(dm_DadosSegundo.cds_TPedido.FieldByName('vl_totalitem').AsFloat);

    panel_item.Visible        := true;
    panel_total.Visible       := false;

    DesabilitarBotoes;

end;

procedure T_frmAddItensNoPedido.ExcluirPedido;
begin
     //EXCLUINDO O PEDIDO EM TELA
     with DM_Pesq.Qry_Geral do
     begin

          close;
          sql.Clear;
          sql.Add('DELETE FROM c_pedido WHERE id_pedido = :pIdPedido AND status='+QuotedStr('A')+'');
          Params.ParamByName('pIdPedido').AsInteger  := StrToInt(edt_pedido.Caption);
          ExecSQL();

     end;

end;

procedure T_frmAddItensNoPedido.btnSairClick(Sender: TObject);
begin
    if not( PedidoTemItens(StrToInt(edt_pedido.Caption))) then
    begin
        texto:= 'Pedido gerado, mas não contém itens, deseja mantê-lo?';
        if Application.MessageBox(PChar(texto),'Pedido sem ítens...',MB_YESNO + MB_ICONQUESTION) = IdYes then
        begin
          close;
          release;
        end else begin
           ExcluirPedido;
           Application.MessageBox('O pedido foi cancelado com sucesso!', 'Cancelamento de pedido', MB_OK);
           LimparTabelaPedidoTemp;
           AbrirFecharTabelas;
           close;

        end;
    end;

end;

procedure T_frmAddItensNoPedido.FormShow(Sender: TObject);
begin

   edt_pedido.Caption      := _frmCadPedido.NumPedidoAtual;
   edt_IDPedidoAberto.Text := _frmCadPedido.idPedidoAberto;
   edt_DescProdutoPedido.SetFocus;
   LimparTabelaPedidoTemp;

end;

procedure T_frmAddItensNoPedido.edt_DescProdutoPedidoKeyPress(
  Sender: TObject; var Key: Char);
begin

    edt_IDProdutoPedido.Text := '0';

end;

procedure T_frmAddItensNoPedido.btnCadProdutoClick(Sender: TObject);
begin

     Application.CreateForm(T_frmCadProdutoPedidos, _frmCadProdutoPedidos);
     _frmCadProdutoPedidos.ShowModal;
     FreeAndNil(_frmCadProdutoPedidos);

end;

procedure T_frmAddItensNoPedido.edtPrecoAtualClick(Sender: TObject);
begin

    Application.MessageBox('Este valor é para simples conferência!', 'Operação não permitida', MB_OK);
    edtPrecoAtual.Text := '0,00';
    edt_PrecoProdutoPedido.SetFocus;

end;

procedure T_frmAddItensNoPedido.rd_sairClick(Sender: TObject);
begin

      rd_sair.Checked  := false;
      HabilitarBotoes;    

end;

procedure T_frmAddItensNoPedido.rd_exclusaodoitemClick(Sender: TObject);
begin

     if rd_exclusaodoitem.Checked then
     begin

          ExcluirItemDoPedido;
          rd_exclusaodoitem.Checked := false;

     end;
  
end;

procedure T_frmAddItensNoPedido.ExcluirItemDoPedido;
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


           AbrirFecharTabelas;
           Grid_DetalhesDoPedido.Refresh;  // ATUALIZANDO O GRID APOS A DELEÇÃO

           btnGravarPedido.Enabled   := true;
           rd_exclusaodoitem.Checked := false;
           panel_item.Visible        := false;
           panel_total.Visible       := true;
           btnSair.Enabled           := false;
           HabilitarBotoes;

       end else begin  

         rd_exclusaodoitem.Checked := false;
         panel_item.Visible        := false;
         panel_total.Visible       := true;
         HabilitarBotoes;
         
       end;

end;

procedure T_frmAddItensNoPedido.DesabilitarBotoes;
begin

      panel_item.Visible                   := true;
      panel_total.Visible                  := false;
      pan_botoes.Enabled                   := false;

end;

procedure T_frmAddItensNoPedido.HabilitarBotoes;
begin

      panel_item.Visible                   := false;
      panel_total.Visible                  := true;   
      pan_botoes.Enabled                   := true;

end;

procedure T_frmAddItensNoPedido.edt_DescProdutoPedidoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

     Application.CreateForm(T_frmEscolhaProdutoParaPedidos, _frmEscolhaProdutoParaPedidos);
     _frmEscolhaProdutoParaPedidos.ShowModal;
     FreeAndNil(_frmEscolhaProdutoParaPedidos);

     if dm_DadosSegundo.cds_TPedido.Locate('produto_id',StrToInt(edt_IDProdutoPedido.Text),[]) then
     begin

            Application.MessageBox('Este produto já consta nesse pedido, delete-o e reentre com a quantidade desejada!', 'Duplicidade', MB_OK);
            edt_DescProdutoPedido.text    := '';
            edtPrecoAtual.Text            := '0,00';
            edtEstoque.Caption            := '';
            edt_DescProdutoPedido.Clear;
            edt_DescProdutoPedido.SetFocus;

     end;

     btnSair.Enabled := false;
     btnCancelarPedido.Enabled := true;   

end;

end.






