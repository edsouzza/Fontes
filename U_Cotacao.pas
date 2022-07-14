unit U_Cotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,DateUtils, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus, Math;

type
  T_frmCotacao = class(TForm)
    pan_titulo: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    lbl45: TLabel;
    lblStatusLogoff: TLabel;
    pan_botoes: TPanel;
    btnSairDaCotacao: TSpeedButton;
    panel_itensCotacao: TPanel;
    panel_Produtos: TPanel;
    lbl14: TLabel;
    lbl33: TLabel;
    lbl38: TLabel;
    lbl40: TLabel;
    lbl52: TLabel;
    edt_QuantidadeProdutoCotacao: TEdit;
    edt_PrecoProdutoCotacao: TCurrencyEdit;
    edt_EstoqueCotacao: TEdit;
    edt_PrecoDescontoProdutoCotacao: TCurrencyEdit;
    edt_ProdutoCotacao: TEdit;
    Grid_DetalhesDaCotacao: TDBGrid;
    btnInserirProduto: TButton;
    btnCancelarGravacaoDaCotacao: TSpeedButton;
    panel_CabecalhoCotacao: TPanel;
    Label3: TLabel;
    txt_IDPRODUTO: TEdit;
    txt_NomeProdutoCotacao: TStaticText;
    btnImprimirCotacao: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    txt_IDCLIENTE: TEdit;
    Label8: TLabel;
    txt_NumCotacao: TEdit;
    btnCadCliente: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    txt_NomeClienteCotacao: TStaticText;
    btnGravarCotacao: TSpeedButton;
    panel_item: TPanel;
    Label5: TLabel;
    rd_desconto: TRadioButton;
    rd_exclusaodoitem: TRadioButton;
    rd_sair: TRadioButton;
    panel_total: TPanel;
    lbl37: TLabel;
    db_ValorTotal: TDBEdit;
    txt_IdDoITEM: TEdit;
    txt_ValorItem: TEdit;
    txt_IDPRODUTODEL: TEdit;
    edt_quantidadeDoItem: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnSairDaCotacaoClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure AbrirFecharTabelas;
    procedure edt_PrecoDescontoProdutoCotacaoClick(Sender: TObject);
    procedure InserirProduto;
    procedure edt_QuantidadeServicoComandaKeyPress(Sender: TObject;
      var Key: Char);
    procedure btnCancelarGravacaoDaCotacaoClick(Sender: TObject);
    procedure edt_QuantidadeProdutoCotacaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure LimparTabelaTCotacao;
    procedure LimparCamposProdutosAposGravacao;
    procedure btnInserirProdutoClick(Sender: TObject);
    procedure Grid_DetalhesDaCotacaoCellClick(Column: TColumn);
    procedure txt_NomeProdutoCotacaoClick(Sender: TObject);
    procedure btnImprimirCotacaoClick(Sender: TObject);
    procedure txt_NomeClienteCotacaoClick(Sender: TObject);
    procedure EncontrarProximoNumCotacao;
    procedure edt_QuantidadeProdutoCotacaoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure btnCadClienteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AbrirCotacao;
    procedure GravarCotacao;
    procedure CancelarCotacao;
    procedure btnGravarCotacaoClick(Sender: TObject);
    procedure rd_exclusaodoitemClick(Sender: TObject);
    procedure rd_sairClick(Sender: TObject);
    procedure DesabilitarBotoes;
    procedure HabilitarBotoes;
    procedure rd_descontoClick(Sender: TObject);
    procedure VerificaEstoqueAntesDeInserirProduto;



  private
    { Private declarations }
    CotacaoAberta : Boolean;


  public
    { Public declarations }

    ValorUnitarioItemProdutoCotacao, ValorDescontoItemProdutoCotacao,
    ValorLiquidoItemProdutoCotacao, ValorTotalItemProdutoCotacao,ValorItemDeletado, QuantidadeItemProdutoCotacao,
    EstoqueInicial, Qde_estornada, Qde_deletada, QdeAtualNoEstoque : Double;

    proxNumeDetalhe, proxNumItens,proxNumConsCotacao, proxNumDetalhe, proxNumCotacao,
    NumeroDaCotacaoAberta, NumCotacao, IdOperador  : integer;

    ValorTotalInicial, ValorTotalConvertido, ValorItemPraDeletarNaExclusao : Extended;

  end;

var
  _frmCotacao: T_frmCotacao;


implementation

uses U_dmDados, U_Clientes, U_Funcionarios,U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo,
  SqlExpr, DBClient, DB, U_LoginDeAcessos, U_EscolhaDoProdutoParaCotacao,
  U_QRelCotacao, U_EscolhaDoClienteParaCotacao,  U_EscolhaDoFuncionarioParaCotacao,
  U_CadClientesParaCotacao, U_ValorDescontoCotacao;


{$R *.dfm}

procedure T_frmCotacao.FormCreate(Sender: TObject);
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
    AbrirTabelas;
    lblDataDoDia.Caption         := DateToStr(now);
    lblHoraAtual.Caption         := timetoStr(time);
    lblStatusLogoff.Caption      := IdentificarUsuarioLogado;
    panel_total.Top              := 422;
    LimparTabelaTCotacao;
    EncontrarProximoNumCotacao;
    pan_titulo.Caption           := 'Abrindo Cotação de Preços N° '+ IntToStr(NumCotacao);
    idOperador                   := (IdFuncionarioLogado('status'));


end;

procedure T_frmCotacao.btnSairDaCotacaoClick(
  Sender: TObject);
begin

  //controla abertura ou nao de uma nova cotação
  if CotacaoAberta then
  begin

       Application.MessageBox('Existe uma cotação em andamento, cancele ou grave para sair!', 'Operação Negada!', MB_OK);

  end else begin

      close;
      release;

  end;

end;

procedure T_frmCotacao.edt_PrecoDescontoProdutoCotacaoClick(
  Sender: TObject);
begin

     edt_PrecoDescontoProdutoCotacao.SelStart:=0;
     edt_PrecoDescontoProdutoCotacao.SelLength :=  length(edt_PrecoDescontoProdutoCotacao.Text);


end;

procedure T_frmCotacao.AbrirTabelas;
begin

    dm_Conexao.cds_DadosClientes.Active                 := true;
    dm_Conexao.cds_DadosFuncionarios.Active             := true;
    dm_Conexao.cds_CadProduto.Active                    := true;
    dm_DadosSegundo.cds_ICotacao.Active                 := true;
    dm_DadosSegundo.cds_cotacao.Active                  := true;
    dm_DadosSegundo.cds_TCotacao.Active                 := true;

end;

procedure T_frmCotacao.FecharTabelas;
begin

    dm_Conexao.cds_DadosClientes.Active                 := false;
    dm_Conexao.cds_DadosFuncionarios.Active             := false;
    dm_Conexao.cds_CadProduto.Active                    := false;
    dm_DadosSegundo.cds_ICotacao.Active                 := false;
    dm_DadosSegundo.cds_cotacao.Active                  := false;
    dm_DadosSegundo.cds_TCotacao.Active                 := false;

end;

procedure T_frmCotacao.AbrirFecharTabelas;
begin

    dm_Conexao.cds_DadosClientes.Active                 := false;
    dm_Conexao.cds_DadosFuncionarios.Active             := false;
    dm_Conexao.cds_CadProduto.Active                    := false;
    dm_DadosSegundo.cds_ICotacao.Active                 := false;
    dm_DadosSegundo.cds_cotacao.Active                  := false;
    dm_DadosSegundo.cds_TCotacao.Active                 := false;


    dm_Conexao.cds_DadosClientes.Active                 := true;
    dm_Conexao.cds_DadosFuncionarios.Active             := true;
    dm_Conexao.cds_CadProduto.Active                    := true;
    dm_DadosSegundo.cds_ICotacao.Active                 := true;
    dm_DadosSegundo.cds_cotacao.Active                  := true;
    dm_DadosSegundo.cds_TCotacao.Active                 := true;


end;


procedure T_frmCotacao.edt_QuantidadeServicoComandaKeyPress(
  Sender: TObject; var Key: Char);
begin

   // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmCotacao.edt_QuantidadeProdutoCotacaoKeyPress(
  Sender: TObject; var Key: Char);
begin

        // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;    


procedure T_frmCotacao.LimparTabelaTCotacao;
begin

     With DM_Pesq.Qry_Geral do begin

        Close;
        SQL.Clear;
        SQL.Add('Delete FROM t_cotacao');
        ExecSQL;

     end;

     AbrirFecharTabelas;

end;

procedure T_frmCotacao.btnInserirProdutoClick(Sender: TObject);
begin

    VerificaEstoqueAntesDeInserirProduto;

end;


procedure T_frmCotacao.VerificaEstoqueAntesDeInserirProduto;
begin

          //verificando se é um produto ou serviço. Se for produto verifica estoque senao segue em frente
          VerificaSeEProduto(StrToInt(txt_IDPRODUTO.Text));

          if EProduto then
          begin

              //essa verificacao nao deve servir para servicos

              if StrToInt(edt_QuantidadeProdutoCotacao.Text) > StrToInt(edt_EstoqueCotacao.Text) then
               begin

                      Application.MessageBox('Estoque insuficiente para esta transação.Verifique!', 'Estoque Insuficiente', MB_OK);
                      edt_QuantidadeProdutoCotacao.Clear;
                      txt_NomeProdutoCotacao.Caption := '';
                      Exit;

              end else begin


                    if dm_DadosSegundo.cds_TCotacao.Locate('produto_id',txt_IDPRODUTO.Text,[]) then
                     begin

                       Application.MessageBox('Esse produto já foi inserido, delete o ítem anterior e insira novamente com a nova quantidade!', 'Duplicidade', MB_OK);
                       txt_NomeProdutoCotacao.Caption := '';
                       exit;

                     end
                     else begin

                        InserirProduto;

                        btnGravarCotacao.Enabled             := true;
                        btnCancelarGravacaoDaCotacao.Enabled := true;
                        Grid_DetalhesDaCotacao.Enabled       := true;
                        btnImprimirCotacao.Enabled           := true;

                     end;
              end;
          end else begin

                     //mesmo procedimento de insercao mas sem a verificacao de estoque para os serviços
                     if dm_DadosSegundo.cds_TCotacao.Locate('produto_id',txt_IDPRODUTO.Text,[]) then
                     begin

                       Application.MessageBox('Esse produto já foi inserido, delete o ítem anterior e insira novamente com a nova quantidade!', 'Duplicidade', MB_OK);
                       txt_NomeProdutoCotacao.Caption := '';
                       exit;

                     end
                     else begin

                        InserirProduto;

                        btnGravarCotacao.Enabled             := true;
                        btnCancelarGravacaoDaCotacao.Enabled := true;
                        Grid_DetalhesDaCotacao.Enabled       := true;
                        btnImprimirCotacao.Enabled           := true;

                     end;    
          end;

end;


procedure T_frmCotacao.InserirProduto;
begin

        Grid_DetalhesDaCotacao.Enabled := true;

        QuantidadeItemProdutoCotacao      := StrToFloat(edt_QuantidadeProdutoCotacao.Text);
        ValorUnitarioItemProdutoCotacao   := StrToFloat(edt_PrecoProdutoCotacao.Text);
        ValorDescontoItemProdutoCotacao   := StrToFloat(edt_PrecoDescontoProdutoCotacao.text);
        ValorLiquidoItemProdutoCotacao    := (ValorUnitarioItemProdutoCotacao - ValorDescontoItemProdutoCotacao );

        ValorTotalItemProdutoCotacao      := (ValorLiquidoItemProdutoCotacao * QuantidadeItemProdutoCotacao);

        //aqui estamos gravando todos os itens da cotacao
        with DM_Pesq.qry_Cod do begin

          Close;
          SQL.Clear;
          SQL.Add('select max(id_detalhescotacao) from i_cotacao');
          Open;

              if not IsEmpty then begin

                 proxNumDetalhe := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

         end;


        with dm_DadosSegundo.cds_ICotacao do
        begin

             Append;

             FieldByName('id_detalhescotacao').AsInteger   := proxNumDetalhe;
             FieldByName('cotacao_id').AsInteger           := NumCotacao;
             FieldByName('produto_id').AsInteger           := strtoint(txt_IDPRODUTO.text);
             FieldByName('unitario').AsCurrency            := ValorLiquidoItemProdutoCotacao;
             FieldByName('quantidade').AsFloat             := QuantidadeItemProdutoCotacao;
             FieldByName('totalitem').AsFloat              := ValorTotalItemProdutoCotacao;
             FieldByName('flag').AsString                  := 'N';         //significa comitar o item ou seja gravar itens acrescentados em i_cotacao
             
             ApplyUpdates(0);

        end;

        //aqui estamos gravando todos os itens da cotacao para mostrar temporariamente no grid, depois apagamos a tabela t_cotacao
       With DM_Pesq.qry_Cod do begin

          Close;
          SQL.Clear;
          SQL.Add('select max(id_detalhescotacao) from t_cotacao');
          Open;

              if not IsEmpty then begin

                 proxNumCotacao := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

         end;


        with dm_DadosSegundo.cds_TCotacao do
        begin

             Append;
             FieldByName('id_detalhescotacao').AsInteger   := proxNumCotacao;
             FieldByName('cotacao_id').AsInteger           := NumCotacao;
             FieldByName('produto_id').AsInteger           := strtoint(txt_IDPRODUTO.text);
             FieldByName('produto').AsString               := edt_ProdutoCotacao.text;
             FieldByName('unitario').AsCurrency            := ValorLiquidoItemProdutoCotacao;
             FieldByName('quantidade').AsFloat             := QuantidadeItemProdutoCotacao;
             FieldByName('totalitem').AsFloat              := ValorTotalItemProdutoCotacao;
             FieldByName('flag').AsString                  := 'N';         //significa comitar o item ou seja gravar itens acrescentados em i_cotacao

             ApplyUpdates(0);

        end;


        AbrirFecharTabelas;

       // LimparCampos apos a escolha do produto
       edt_QuantidadeProdutoCotacao.Clear;
       edt_PrecoDescontoProdutoCotacao.Clear;
       edt_ProdutoCotacao.Clear;
       edt_PrecoProdutoCotacao.Clear;
       edt_EstoqueCotacao.Clear;
       panel_Produtos.Enabled         := false;
       txt_NomeProdutoCotacao.Caption := '';

end;



procedure T_frmCotacao.Grid_DetalhesDaCotacaoCellClick(
  Column: TColumn);
begin

     txt_IdDoITEM.Text          := IntToStr(dm_DadosSegundo.cds_TCotacao.FieldByName('id_detalhescotacao').AsInteger);
     txt_ValorItem.Text         := FloatToStr(dm_DadosSegundo.cds_TCotacao.FieldByName('unitario').AsFloat);
     txt_IDPRODUTODEL.Text      := IntToStr(dm_DadosSegundo.cds_TCotacao.FieldByName('produto_id').AsInteger);
     edt_quantidadeDoItem.text  := FloatToStr(dm_DadosSegundo.cds_TCotacao.FieldByName('quantidade').AsFloat);

     DesabilitarBotoes;

end;

procedure T_frmCotacao.DesabilitarBotoes;
begin

      panel_item.Visible                   := true;
      panel_total.Visible                  := false;

      btnGravarCotacao.Enabled             := false;
      btnCancelarGravacaoDaCotacao.Enabled := false;
      btnImprimirCotacao.Enabled           := false;
      btnCadCliente.Enabled                := false;
      btnSairDaCotacao.Enabled             := false;

      rd_desconto.Checked                  := false;
      rd_exclusaodoitem.Checked            := false;
      rd_sair.Checked                      := false;

end;


procedure T_frmCotacao.HabilitarBotoes;
begin

      panel_item.Visible                   := false;
      panel_total.Visible                  := true;

      btnGravarCotacao.Enabled             := true;
      btnCancelarGravacaoDaCotacao.Enabled := true;
      btnImprimirCotacao.Enabled           := true;
      btnCadCliente.Enabled                := true;
      btnSairDaCotacao.Enabled             := true;


end;


procedure T_frmCotacao.txt_NomeProdutoCotacaoClick(Sender: TObject);
begin

     Application.CreateForm(T_frmEscolhaProdutoParaCotacao, _frmEscolhaProdutoParaCotacao);
     _frmEscolhaProdutoParaCotacao.ShowModal;
     FreeAndNil(_frmEscolhaProdutoParaCotacao);

    if CotacaoAberta then
    begin
       //se ja tiver uma cotação aberta nao faz nada
       exit

    end else
       //se nao tiver uma cotação aberta, abre uma nova
       AbrirCotacao;

end;


procedure T_frmCotacao.AbrirCotacao;
begin

      proxNumCotacao     := 0;
      CotacaoAberta      := true;


      With DM_Pesq.qry_Cod do begin

          Close;
          SQL.Clear;
          SQL.Add('select max(id_cotacao) from cotacao');
          Open;

          if not IsEmpty then begin

             proxNumCotacao := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

          end;

        end;


        with dm_DadosSegundo.cds_cotacao do
        begin

             Append;
             FieldByName('id_cotacao').AsInteger        := proxNumCotacao;
             FieldByName('id_cliente').AsInteger        := strtoint(txt_IDCLIENTE.text);
             FieldByName('id_operador').AsInteger       := IdOperador;
             FieldByName('total').AsFloat               := 0;
             FieldByName('data').AsDateTime             := date;
             FieldByName('status').AsString             := 'AB';

             ApplyUpdates(0);

        end;

        btnSairDaCotacao.Enabled := false;
        btnCadCliente.Enabled    := false;
       
        
end;

procedure T_frmCotacao.btnImprimirCotacaoClick(Sender: TObject);
begin

     Q_RelCotacao.qrb_titulo.Caption   := 'Cotação de Preços N° '+ IntToStr(NumCotacao);

     with Q_RelCotacao.cds_RelCotacao do
     begin

          close;
          Params.ParamByName('pNumCotacao').AsInteger  := NumCotacao;
          Params.ParamByName('pIdCliente').AsInteger   := StrToInt(txt_IDCLIENTE.Text);
          open;

     end;

     Q_RelCotacao.Preview;
     btnCancelarGravacaoDaCotacao.Enabled := true;
     LogOperacoes(NomeDoUsuarioLogado, 'acesso a impressão de cotação');

end;

procedure T_frmCotacao.txt_NomeClienteCotacaoClick(Sender: TObject);
begin

     Application.CreateForm(T_frmEscolhaClienteParaCotacao, _frmEscolhaClienteParaCotacao);
     _frmEscolhaClienteParaCotacao.ShowModal;
     FreeAndNil(_frmEscolhaClienteParaCotacao);

end;

procedure T_frmCotacao.EncontrarProximoNumCotacao;
begin

       AbrirFecharTabelas;

       With DM_Pesq.qry_Cod do begin

          Close;
          SQL.Clear;
          SQL.Add('select max(id_cotacao) from cotacao');
          Open;

          if not IsEmpty then begin

             proxNumCotacao      := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;
             NumCotacao          := proxNumCotacao;
             txt_NumCotacao.Text := IntToStr(NumCotacao);

          end;

          AbrirFecharTabelas;

        end;

end;

procedure T_frmCotacao.edt_QuantidadeProdutoCotacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if key = 13 then
      begin

          btnInserirProdutoClick(Self);

      end;

end;

procedure T_frmCotacao.btnCadClienteClick(Sender: TObject);
begin

          Application.CreateForm(T_frmCadastraClientesParaCotacao,  _frmCadastraClientesParaCotacao);
          _frmCadastraClientesParaCotacao.ShowModal;
          FreeAndNil(_frmCadastraClientesParaCotacao);

end;

procedure T_frmCotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

      LimparTabelaTCotacao;

end;


procedure T_frmCotacao.btnGravarCotacaoClick(Sender: TObject);
var
  texto : string;
begin

       texto:= 'Confirma a gravação dessa cotação?';

       if Application.MessageBox(PChar(texto),'Gravando cotação!',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

          GravarCotacao;

       end else begin

            exit;

       end;

end;

procedure T_frmCotacao.GravarCotacao;
begin
     
        // a cotação foi aberta no inicio sem o valor total, agora vamos salvar e fechar com o valor total

       _Sql:= 'UPDATE cotacao SET total = :pTotalCotacao where id_cotacao = :pIDCotacao';

       With DM_Pesq.Qry_Geral do begin

          Close;
          SQL.Clear;
          SQL.Add(_Sql);
          ParamByName('pTotalCotacao').Value := StrToFloat(db_ValorTotal.Text);
          ParamByName('pIDCotacao').Value    := NumCotacao;
          ExecSQL();

        end;


        Application.MessageBox('Cotação gravada com sucesso!', 'Gravando cotação...', MB_OK);
        LogOperacoes(NomeDoUsuarioLogado, 'cadastro de nova cotação');
        EncontrarProximoNumCotacao;
        LimparCamposProdutosAposGravacao;

        CotacaoAberta := false;

end;



procedure T_frmCotacao.LimparCamposProdutosAposGravacao;
begin

        LimparTabelaTCotacao;
        Grid_DetalhesDaCotacao.Enabled       := false;
        txt_NomeClienteCotacao.Caption       := '';
        btnGravarCotacao.Enabled             := false;
        btnCancelarGravacaoDaCotacao.Enabled := false;
        btnImprimirCotacao.Enabled           := false;
        panel_itensCotacao.Visible           := false;
        btnSairDaCotacao.Enabled             := true;
        btnCadCliente.Enabled                := true;
        txt_NomeProdutoCotacao.Enabled       := false;
        pan_titulo.Caption                   := 'Cotação de Preços N° '+ IntToStr(NumCotacao);

end;

procedure T_frmCotacao.btnCancelarGravacaoDaCotacaoClick(Sender: TObject);
begin

  CancelarCotacao;

end;

procedure T_frmCotacao.CancelarCotacao;
var texto : string;
begin

         texto:= 'Deseja cancelar a atual cotação?';

         if Application.MessageBox(PChar(texto),'Cancelando a cotação',MB_YESNO + MB_ICONQUESTION) = IdYes then
         begin

              LimparCamposProdutosAposGravacao;
              Grid_DetalhesDaCotacao.Enabled := false;


              //deletando a cotacao
              With DM_Pesq.Qry_Geral do begin

                Close;
                SQL.Clear;
                SQL.Add('Delete FROM cotacao WHERE id_cotacao = :pIDCotacao');
                ParamByName('pIDCotacao').Value := NumCotacao;
                ExecSQL;

              end;

              //deletando os itens da tabela i_cotacao
              With DM_Pesq.Qry_Geral do begin

                Close;
                SQL.Clear;
                SQL.Add('Delete FROM i_cotacao WHERE cotacao_id = :pIDCotacao');
                ParamByName('pIDCotacao').Value := NumCotacao;
                ExecSQL;

              end;

              pan_titulo.Caption  := 'Cotação de Preços N° '+ IntToStr(NumCotacao);
              LogOperacoes(NomeDoUsuarioLogado, 'cancelamento de cotação');

         end
         else begin

                exit;

         end;

         AbrirFecharTabelas;

         //ATUALIZANDO O PROXIMO NUMERO DA COTAÇÃO
         EncontrarProximoNumCotacao;   

         CotacaoAberta := false;

end;     


procedure T_frmCotacao.rd_exclusaodoitemClick(Sender: TObject);
var
  texto : string;
begin

       texto:= 'Confirma a exclusão do ítem selecionado?';

       if Application.MessageBox(PChar(texto),'Excluíndo ítem',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin
              
            //EXCLUINDO OS ÍTENS SELECIONADOS DA TABELA i_cotacao

           _Sql:= 'Delete FROM i_cotacao WHERE cotacao_id = :pCotacao AND produto_id = :pIDProduto';

           with DM_Pesq.Qry_Geral do begin

            Close;
            SQL.Clear;
            SQL.Add(_Sql);
            ParamByName('pCotacao').AsInteger  := NumCotacao;
            ParamByName('pIDProduto').AsInteger:= StrToInt(txt_IDPRODUTODEL.Text);
            ExecSQL();

          end;

           //EXCLUINDO OS ÍTENS SELECIONADOS DA TABELA t_cotacao  (itens do grid)

           _Sql:= 'Delete FROM t_cotacao WHERE id_detalhescotacao = :pCodigo';

            with DM_Pesq.Qry_Geral do begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              ParamByName('pCodigo').AsInteger:= StrToInt(txt_IdDoITEM.Text);
              ExecSQL();

           end;


           AbrirFecharTabelas;

           btnCancelarGravacaoDaCotacao.Enabled   := false;
           txt_IdDoITEM.Text                      := '0';
           txt_ValorItem.Clear;

           Application.MessageBox('Ítem excluído com sucesso!', 'Excluindo ítem!', MB_OK);

       end
       else begin

           exit;

       end;          

       rd_exclusaodoitem.Checked := false;
       panel_item.Visible        := false;
       panel_total.Visible       := true;
       HabilitarBotoes;
       
       
end;

procedure T_frmCotacao.rd_sairClick(Sender: TObject);
begin

     HabilitarBotoes;
     btnSairDaCotacao.Enabled := false;
     rd_sair.Checked          := false;

end;


procedure T_frmCotacao.rd_descontoClick(Sender: TObject);
begin

     Application.CreateForm(T_frmDescontoCotacao,  _frmDescontoCotacao);
     _frmDescontoCotacao.ShowModal;
     FreeAndNil(_frmDescontoCotacao);

     rd_desconto.Checked       := false;
     panel_item.Visible        := false;
     panel_total.Visible       := true;
     btnSairDaCotacao.Enabled  := false;
     btnCadCliente.Enabled     := false;

     HabilitarBotoes;

end;



end.




