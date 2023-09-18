unit U_orcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,DateUtils, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus, Math, printers,ShellAPI;

type
  T_frmOrcamento = class(TForm)
    pan_titulo: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    pan_botoes: TPanel;
    btnSair: TSpeedButton;
    btnCancelarOrcamento: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnGravarOrcamento: TSpeedButton;
    gr_cliente: TGroupBox;
    txtNomeCliente: TStaticText;
    panel_detalhes: TPanel;
    Grid_DetalhesDoOrcamento: TDBGrid;
    panel_item: TPanel;
    Label5: TLabel;
    rd_exclusaodoitem: TRadioButton;
    rd_sair: TRadioButton;
    panel_total: TPanel;
    lbl37: TLabel;
    db_ValorTotal: TDBEdit;
    txtIdDoITEM: TEdit;
    txtValorItem: TEdit;
    edtquantidadeDoItem: TEdit;
    txt_IDCLIENTE: TEdit;
    txt_NumOrcamento: TEdit;
    subMenu: TPopupMenu;
    ExcluirItem: TMenuItem;
    chkAPROVADO: TCheckBox;
    lblStatusLogoff: TLabel;
    GroupBox2: TGroupBox;
    edtDescrMaoDeObra: TEdit;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtValorServico: TCurrencyEdit;
    edtDescontoServico: TCurrencyEdit;
    edtQdeServico: TEdit;
    btnInserirItem: TButton;
    btnImprimirOS: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure AbrirFecharTabelas;
    procedure ExcluirItemDoGrid;
    procedure edtDescontoServicoClick(Sender: TObject);
    procedure InserirServico;
    procedure edt_QuantidadeServicoComandaKeyPress(Sender: TObject;
      var Key: Char);
    procedure btnCancelarOrcamentoClick(Sender: TObject);
    procedure edt_QuantidadeProdutoCotacaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure LimparTabelaTOrcamento;
    procedure LimparCamposAposGravacao;
    procedure btnInserirItemClick(Sender: TObject);
    procedure Grid_DetalhesDoOrcamentoCellClick(Column: TColumn);
    procedure btnImprimirClick(Sender: TObject);
    procedure txtNomeClienteClick(Sender: TObject);
    procedure EncontrarProximoNumOrcamento;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AbreNovoOrcamento;
    procedure GravarOrcamento;
    procedure CancelarOrcamento;
    procedure btnGravarOrcamentoClick(Sender: TObject);     
    procedure DesabilitarBotoes;
    procedure HabilitarBotoes;
    procedure edtValorServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescontoServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtServicoEnter(Sender: TObject);
    procedure DescontoMaiorQueItemServico;
    procedure edtDescontoServicoExit(Sender: TObject);
    procedure edtValorServicoEnter(Sender: TObject);
    procedure edtProdutoClick(Sender: TObject);
    procedure edtQdeServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQdeProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescrMaoDeObra1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorPecasChange(Sender: TObject);
    procedure edtQdePecasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescrMaoDeObra1Exit(Sender: TObject);
    procedure GravarItem;
    procedure memoDescricaoChange(Sender: TObject);
    procedure db_ValorTotalEnter(Sender: TObject);
    procedure edtQdeServicoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQdePecasKeyPress(Sender: TObject; var Key: Char);
    procedure edtQdeProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure ExcluirItemClick(Sender: TObject);
    procedure edtDescrMaoDeObraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AtualizarItemAposExclusao;
    procedure CopiarItemsGravarNoBanco;
    procedure FormShow(Sender: TObject);
    procedure btnImprimirOSClick(Sender: TObject);
    procedure edtDescrMaoDeObraExit(Sender: TObject);
    procedure criarArquivoTXT;
    procedure imprimirArquivoTXT(caminhoArq:String);


  private
    { Private declarations }
    sServico : string;
    OrcamentoAberto, InseriuPeca  : Boolean;
    arq_impress : TextFile;

  public
    { Public declarations }

    ValorDescontoItemOrcamento, ValorTotalItemOrcamento,
    ValorLiquidoItemOrcamento, ValorItemOrcamento,ValorItemDeletado, QuantidadeItemOrcamento, EstoqueAtual,
    EstoqueInicial, Qde_estornada, Qde_deletada, QdeAtualNoEstoque, ValorPecas, ValorDescontoPecas, QuantidadePeca, ValorLiquidoPecas , ValorTotalItemPeca,
    QuantidadeItemProduto, ValorProduto, ValorDescontoProduto, ValorLiquidoItemProduto, ValorTotalItemProduto : Double;

    proxNumeDetalhe, proxNumItens, proxNumConsCotacao, proxNumDetalhe, proxNumOrcamento, IdVenda, idExcluido, itemExcluido,
    NumeroDaOrcamentoAberto, NumOrcamento, IdOperador, proxNumIDetalhe, proxNumIOrcamento, novoID   : integer;

    ValorTotalInicial, ValorTotalConvertido, ValorItemPraDeletarNaExclusao : Extended; 

  end;

var
  _frmOrcamento: T_frmOrcamento;


implementation

uses U_dmDados, U_Clientes, U_Funcionarios,U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo,
  SqlExpr, DBClient, DB, U_LoginDeAcessos, U_EscolhaDoProdutoParaCotacao,
  U_QRelCotacao, U_EscolhaDoClienteParaCotacao, U_CadClientesParaCotacao,
  U_ValorDescontoCotacao, U_EscolhaClienteParaOrcamento,
  U_DescontoOrcamentos, U_QRelOrcamento, U_EscolhaProdutoParaOrcamento,
  U_CadClientesParaOrcamento, U_principal;


{$R *.dfm}

procedure T_frmOrcamento.FormCreate(Sender: TObject);
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
    lblStatusLogoff.Caption      := NomeDoUsuarioLogado;
    LimparTabelaTOrcamento;
    EncontrarProximoNumOrcamento;
    pan_titulo.Caption           := 'Abrindo Orçamento N° '+ IntToStr(NumOrcamento);
    idOperador                   := (IdFuncionarioLogado('status'));

end;

procedure T_frmOrcamento.EncontrarProximoNumOrcamento;
begin

       AbrirFecharTabelas;
       proxNumOrcamento      := GerarProximoID('id_orcamento','orcamento');
       NumOrcamento          := GerarProximoID('id_orcamento','orcamento');
       txt_NumOrcamento.Text := IntToStr(NumOrcamento);
       
end;


procedure T_frmOrcamento.btnSairClick(
  Sender: TObject);
begin

  //controla abertura ou nao de uma nova cotação
  if OrcamentoAberto then
  begin

       Application.MessageBox('Existe um orçamento em andamento, cancele ou grave para sair!', 'Operação Negada!', MB_OK);

  end else begin
        //se estiver abrindo orçamento atraves do cadastro de clientes
        if abrindoOrcamento then
        begin
         _frmPrincipal.Show;
         abrindoOrcamento := false;
         close;
         release;
        end else
        begin
         abrindoOrcamento:=false;
         close;
         release;
        end;

  end;

end;

procedure T_frmOrcamento.edtDescontoServicoClick(
  Sender: TObject);
begin

     edtDescontoServico.SelStart:=0;
     edtDescontoServico.SelLength :=  length(edtDescontoServico.Text);

end;

procedure T_frmOrcamento.AbrirTabelas;
begin

    dm_Conexao.cds_DadosClientes.Active                 := true;
    dm_Conexao.cds_DadosFuncionarios.Active             := true;
    dm_DadosSegundo.cds_IOrcamento.Active               := true;
    dm_DadosSegundo.cds_Orcamento.Active                := true;
    dm_DadosSegundo.cds_TOrcamento.Active               := true;
    dm_DadosSegundo.cds_Empresa.Active                  := true;

end;

procedure T_frmOrcamento.FecharTabelas;
begin

    dm_Conexao.cds_DadosClientes.Active                 := false;
    dm_Conexao.cds_DadosFuncionarios.Active             := false;
    dm_DadosSegundo.cds_IOrcamento.Active               := false;
    dm_DadosSegundo.cds_Orcamento.Active                := false;
    dm_DadosSegundo.cds_TOrcamento.Active               := false;
    dm_DadosSegundo.cds_Empresa.Active                  := false;

end;

procedure T_frmOrcamento.AbrirFecharTabelas;
begin

    dm_Conexao.cds_DadosClientes.Active                 := false;
    dm_Conexao.cds_DadosFuncionarios.Active             := false;
    dm_DadosSegundo.cds_IOrcamento.Active               := false;
    dm_DadosSegundo.cds_Orcamento.Active                := false;
    dm_DadosSegundo.cds_TOrcamento.Active               := false;
    dm_DadosSegundo.cds_Empresa.Active                  := false;

    dm_Conexao.cds_DadosClientes.Active                 := true;
    dm_Conexao.cds_DadosFuncionarios.Active             := true;
    dm_DadosSegundo.cds_IOrcamento.Active               := true;
    dm_DadosSegundo.cds_Orcamento.Active                := true;
    dm_DadosSegundo.cds_TOrcamento.Active               := true;
    dm_DadosSegundo.cds_Empresa.Active                  := true;


end;


procedure T_frmOrcamento.edt_QuantidadeServicoComandaKeyPress(
  Sender: TObject; var Key: Char);
begin

        // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmOrcamento.edt_QuantidadeProdutoCotacaoKeyPress(
  Sender: TObject; var Key: Char);
begin

        // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;    


procedure T_frmOrcamento.LimparTabelaTOrcamento;
begin

     ApagarTabela('t_orcamento');
     AbrirFecharTabelas;

end;    


procedure T_frmOrcamento.Grid_DetalhesDoOrcamentoCellClick(
  Column: TColumn);
begin

     panel_item.Visible         := true;
     btnGravarOrcamento.Enabled := true;

     //valores retornados ao clicar no grid
     txtIdDoITEM.Text           := IntToStr(dm_DadosSegundo.cds_TOrcamento.FieldByName('item_id').AsInteger);
     idExcluido                 := dm_DadosSegundo.cds_TOrcamento.FieldByName('item_id').AsInteger;
     txtValorItem.Text          := FloatToStr(dm_DadosSegundo.cds_TOrcamento.FieldByName('valor_item').AsFloat);
     edtquantidadeDoItem.text   := FloatToStr(dm_DadosSegundo.cds_TOrcamento.FieldByName('quantidade').AsFloat);

     DesabilitarBotoes;
     btnGravarOrcamento.Enabled           := true;
     btnCancelarOrcamento.Enabled         := true;

end;

procedure T_frmOrcamento.DesabilitarBotoes;
begin

      panel_item.Visible                   := true;
      btnGravarOrcamento.Enabled           := false;
      btnCancelarOrcamento.Enabled         := false;
      btnImprimir.Enabled                  := false;
      btnImprimirOS.Enabled                := false;
      btnSair.Enabled                      := false;

      rd_exclusaodoitem.Checked            := false;
      rd_sair.Checked                      := false;

end;


procedure T_frmOrcamento.HabilitarBotoes;
begin

      panel_item.Visible                   := false;

      btnGravarOrcamento.Enabled           := true;
      btnCancelarOrcamento.Enabled         := true;
      btnImprimir.Enabled                  := true;
      btnImprimirOS.Enabled                := true;
      btnSair.Enabled                      := true;    

end;


procedure T_frmOrcamento.AbreNovoOrcamento;
begin

      OrcamentoAberto      := true;
      proxNumOrcamento     := 0;

      proxNumOrcamento  := GerarProximoID('id_orcamento','orcamento');

      with dm_DadosSegundo.cds_orcamento do
      begin

           Append;
           FieldByName('id_orcamento').AsInteger      := proxNumOrcamento;
           FieldByName('id_cliente').AsInteger        := strtoint(txt_IDCLIENTE.text);
           FieldByName('id_operador').AsInteger       := IdOperador;
           FieldByName('id_venda').AsInteger          := 0;
           FieldByName('total').AsFloat               := 0;
           FieldByName('data').AsDateTime             := date;
           FieldByName('status').AsString             := 'PENDENTE';

           ApplyUpdates(0);

      end;

      btnSair.Enabled        := false;

end;

procedure T_frmOrcamento.btnImprimirClick(Sender: TObject);
begin
     Application.CreateForm(TQ_RelOrcamento,  Q_RelOrcamento);
     with Q_RelOrcamento.cds_RelOrcamento do
     begin

          close;
          Params.ParamByName('pIDOrcamento').AsInteger  := NumOrcamento;
          open;

     end;

     Q_RelOrcamento.Preview;
     FreeAndNil(Q_RelOrcamento);
     btnCancelarOrcamento.Enabled := true;
     LogOperacoes(NomeDoUsuarioLogado, 'acesso a impressão do novo orçamento');

end;

procedure T_frmOrcamento.txtNomeClienteClick(Sender: TObject);
begin
  if(dm_Conexao.cds_DadosClientes.RecordCount > 0)then
  begin

     Application.CreateForm(T_frmEscolhaClienteParaOrcamento, _frmEscolhaClienteParaOrcamento);
     _frmEscolhaClienteParaOrcamento.ShowModal;
     FreeAndNil(_frmEscolhaClienteParaOrcamento);
     edtDescrMaoDeObra.SetFocus;
     
  end else begin
     Application.MessageBox('A tabela de clientes encontra-se vazia no momento!','Informação do Sistema',MB_ICONEXCLAMATION);
     exit;
  end;

end;


procedure T_frmOrcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

      LimparTabelaTOrcamento;

end;


procedure T_frmOrcamento.btnGravarOrcamentoClick(Sender: TObject);
var
  texto : string;
begin

       texto:= 'Confirma a gravação deste orçamento?';

       if Application.MessageBox(PChar(texto),'Gravando orçamento!',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin   

          GravarOrcamento;

       end else begin

            exit;

       end;

end;

procedure T_frmOrcamento.GravarOrcamento;
begin

        //COPIANDO TODOS OS ÍTEMS DA TABELA T_ORCAMENTO QUE ESTA NA TELA PARA TABELA FINAL I_ORCAMENTO
        CopiarItemsGravarNoBanco;

        // o orçamento foi aberto no inicio sem o valor total, agora vamos salvar e fechar com o valor total
       _Sql:= 'UPDATE orcamento SET total = :pTotal, id_cliente = :pIDCliente where id_orcamento = :pID';

       With DM_Pesq.Qry_Geral do begin

          Close;
          SQL.Clear;
          SQL.Add(_Sql);
          ParamByName('pTotal').Value        := StrToFloat(db_ValorTotal.Text);
          ParamByName('pID').Value           := NumOrcamento;
          ParamByName('pIDCliente').Value    := strtoint(txt_IDCLIENTE.Text);

          ExecSQL();

        end;

        if(chkAPROVADO.Checked) then
        begin

            With DM_Pesq.Qry_Geral do begin

              Close;
              SQL.Clear;
              SQL.Add('UPDATE orcamento SET status = :pAprovado where id_orcamento = :pID');
              ParamByName('pID').Value           := NumOrcamento;
              ParamByName('pAprovado').Value     := 'APROVADO';
              ExecSQL();

            end;

        end;

        Application.MessageBox('Orçamento gravado com sucesso!', 'Gravando orçamento...', MB_OK);
        LogOperacoes(NomeDoUsuarioLogado, 'cadastro de novo orçamento');

        LimparCamposAposGravacao;
        OrcamentoAberto     := false;
        panel_total.Enabled := false;
        controleNumerico    := 0;

end;



procedure T_frmOrcamento.LimparCamposAposGravacao;
begin
        //se orçamento foi aberto atraves do cadastro de clientes
        if abrindoOrcamento then
        begin

          LimparTabelaTOrcamento;
          EncontrarProximoNumOrcamento;
          txtNomeCliente.Caption                 := '';
          btnGravarOrcamento.Enabled             := false;
          btnCancelarOrcamento.Enabled           := false;
          btnImprimir.Enabled                    := false;
          btnImprimirOS.Enabled                  := false;
          btnSair.Enabled                        := true;
          inseriuServico                         := false;
          inseriuProduto                         := false;
          edtDescrMaoDeObra.Clear;
          txt_IDCLIENTE.Text := '0';
          pan_titulo.Caption                     := 'Orçamento de Preços N° '+ IntToStr(NumOrcamento);
          close;

        end else
        begin

          abrindoOrcamento:=false;
          close;
          LimparTabelaTOrcamento;
          EncontrarProximoNumOrcamento;
          txtNomeCliente.Caption                 := '';
          btnGravarOrcamento.Enabled             := false;
          btnCancelarOrcamento.Enabled           := false;
          btnImprimir.Enabled                    := false;
          btnImprimirOS.Enabled                  := false;
          btnSair.Enabled                        := true;
          inseriuServico                         := false;
          inseriuProduto                         := false;
          edtDescrMaoDeObra.Clear;
          txt_IDCLIENTE.Text := '0';
          pan_titulo.Caption                     := 'Orçamento de Preços N° '+ IntToStr(NumOrcamento);

        end;

end;

procedure T_frmOrcamento.btnCancelarOrcamentoClick(Sender: TObject);
begin

  CancelarOrcamento;

end;

procedure T_frmOrcamento.CancelarOrcamento;
var texto : string;
begin

         texto:= 'Deseja cancelar o orçamento atual?';

         if Application.MessageBox(PChar(texto),'Cancelando o orçamento',MB_YESNO + MB_ICONQUESTION) = IdYes then
         begin

              LimparCamposAposGravacao;

              //deletando o orcamento
              With DM_Pesq.Qry_Geral do begin

                Close;
                SQL.Clear;
                SQL.Add('Delete FROM orcamento WHERE id_orcamento = :pID');
                ParamByName('pID').Value := NumOrcamento-1;
                ExecSQL;

              end;

              //deletando os itens da tabela i_Orcamento
              With DM_Pesq.Qry_Geral do begin

                Close;
                SQL.Clear;
                SQL.Add('Delete FROM i_Orcamento WHERE orc_id = :pIDOrc');
                ParamByName('pIDOrc').Value := NumOrcamento-1;
                ExecSQL;

              end;

              pan_titulo.Caption  := 'Orçamento de Preços N° '+ IntToStr(NumOrcamento-1);
              Application.MessageBox('Orçamento cancelado com sucesso!', 'Cancelando orçamento...', MB_OK);

         end
         else begin

                exit;

         end;

         AbrirFecharTabelas;

         //ATUALIZANDO O PROXIMO NUMERO DO ORCAMENTO
         EncontrarProximoNumOrcamento;

         OrcamentoAberto    := false;

end;     


procedure T_frmOrcamento.edtValorServicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure T_frmOrcamento.edtDescontoServicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

      if key = 13 then
      begin

          edtQdeServico.SetFocus;

      end;

end;

procedure T_frmOrcamento.edtServicoEnter(Sender: TObject);
begin

    btnCancelarOrcamento.Enabled := true;
    
end;

procedure T_frmOrcamento.DescontoMaiorQueItemServico;
begin

      if( StrToFloat(edtValorServico.Text) < StrToFloat(edtDescontoServico.Text) ) then
      begin

          Application.MessageBox('Atenção o valor do desconto não pode ser maior que o valor do ítem!', 'Informação de Sistema!', MB_OK);
          edtDescontoServico.Text := '0,00';
          edtDescontoServico.SetFocus;

      end;

end;

procedure T_frmOrcamento.edtDescontoServicoExit(Sender: TObject);
begin

      DescontoMaiorQueItemServico;  

end;

procedure T_frmOrcamento.edtValorServicoEnter(Sender: TObject);
var
   alterado:string;
begin

     if ( edtDescrMaoDeObra.Text = '' ) then
     begin

         Application.MessageBox('Atenção o campo Descrição é de preenchimento obrigatório!', 'Informação de Sistema!', MB_OK);
         edtDescrMaoDeObra.SetFocus;

     end else begin

         alterado := LetrasIniciaisMaiusculas(edtDescrMaoDeObra.Text);
         edtDescrMaoDeObra.Text := alterado;

     end;
     edtQdeServico.Text := '1';
end;

procedure T_frmOrcamento.edtProdutoClick(Sender: TObject);
begin

     Application.CreateForm(T_frmEscolhaDoProdutoParaOrcamento, _frmEscolhaDoProdutoParaOrcamento);
     _frmEscolhaDoProdutoParaOrcamento.ShowModal;
     FreeAndNil(_frmEscolhaDoProdutoParaOrcamento);

end;

procedure T_frmOrcamento.btnInserirItemClick(Sender: TObject);
begin

    if ( InseriuServico ) then
    begin

          InserirServico;

    end;

end;

procedure T_frmOrcamento.InserirServico;
var
   proxNumItem : integer;
begin

        Grid_DetalhesDoOrcamento.Visible  := true;
        btnGravarOrcamento.Enabled        := true;
        QuantidadeItemOrcamento           := StrToFloat(edtQdeServico.Text);
        ValorItemOrcamento                := StrToFloat(edtValorServico.Text);
        ValorDescontoItemOrcamento        := StrToFloat(edtDescontoServico.text);
        ValorLiquidoItemOrcamento         := ( ValorItemOrcamento - ValorDescontoItemOrcamento );
        ValorTotalItemOrcamento           := ( ValorLiquidoItemOrcamento * QuantidadeItemOrcamento );


        //aqui estamos gravando todos os itens do orcamento para mostrar temporariamente no grid, depois apagamos a tabela t_orcamento
        if(controleNumerico = 0)then
        begin
            proxNumOrcamento := GerarProximoID('id_detalhesorc','i_orcamento');   //entrando com o proximo numero de i_orcamento para não haver duplicidade na hora da gravação
        end else begin
            proxNumOrcamento := GerarProximoID('id_detalhesorc','t_orcamento');   //entrando com o proximo numero de t_orcamento para não haver duplicidade na hora da gravação
        end;


        proxNumItem      := GerarProximoID('item_id','t_orcamento');

        with dm_DadosSegundo.cds_TOrcamento do
        begin

             Append;

             FieldByName('id_detalhesorc').AsInteger       := proxNumOrcamento;
             FieldByName('orc_id').AsInteger               := NumOrcamento;
             FieldByName('item_id').AsInteger              := proxNumItem;
             FieldByName('descricao').AsString             := LetrasIniciaisMaiusculas(edtDescrMaoDeObra.Text);
             FieldByName('valor_item').AsFloat             := ValorLiquidoItemOrcamento;
             FieldByName('quantidade').AsFloat             := QuantidadeItemOrcamento;
             FieldByName('total').AsFloat                  := ValorTotalItemOrcamento;
             FieldByName('flag').AsString                  := 'N';         //significa comitar o item ou seja gravar itens acrescentados em i_Orcamento
             FieldByName('valor_pecas').AsFloat            := ValorPecas;

             ApplyUpdates(0);

        end;

        AbrirFecharTabelas;

       // LimparCampos 
       edtDescrMaoDeObra.Clear;
       inc(controleNumerico);
       edtQdeServico.Text            := '1';
       edtValorServico.Text          := '0,00';
       edtDescontoServico.Text       := '0,00';
       inseriuServico                := false;
       btnImprimir.Enabled           := true;
       btnImprimirOS.Enabled         := true;
       panel_total.Enabled           := True;
       chkAPROVADO.Visible           := true;
       btnCancelarOrcamento.Enabled  := true;
       edtDescrMaoDeObra.SetFocus;

end;

procedure T_frmOrcamento.GravarItem;
begin

       proxNum := GerarProximoID('id_itens','itens_vendas');
       IdVenda := GerarProximoID('id_venda','venda');

        dm_DadosSegundo.cds_ItensVendas.Active := true;
        with dm_DadosSegundo.cds_ItensVendas do
        begin

             Append;
             FieldByName('id_itens').AsInteger            := proxNum;
             FieldByName('id_venda').AsInteger            := IdVenda;
             FieldByName('id_produto').AsInteger          := 0;
             FieldByName('vl_unitario').AsFloat           := ValorLiquidoItemProduto;
             FieldByName('quantidade').AsFloat            := QuantidadeItemProduto;
             FieldByName('vl_totalitem').AsFloat          := ValorTotalItemProduto;
             FieldByName('flag_devolucao').AsString       := 'A';    //LIBERADO PARA DEVOLVER AO ESTOQUE EM CASO DE CANCELAMENTO
             FieldByName('historico_venda').AsString      := 'VENDA DE PRODUTO';   //nao é utilizado aqui
             ApplyUpdates(0);

          end;

end;

procedure T_frmOrcamento.edtQdeServicoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if key = 13 then
     begin

         inseriuServico := true;
         btnInserirItemClick(self);

     end;

end;

procedure T_frmOrcamento.edtQdeProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if key = 13 then
     begin

        inseriuServico := false;
        btnInserirItemClick(self);

     end;

end;

procedure T_frmOrcamento.edtDescrMaoDeObra1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if key = 13 then
      begin

           edtValorServico.SetFocus;

      end;

end;

procedure T_frmOrcamento.edtValorPecasChange(Sender: TObject);
begin

    InseriuPeca := true;

end;

procedure T_frmOrcamento.edtQdePecasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if key = 13 then
     begin

         inseriuServico := false;
         btnInserirItemClick(self);

     end;

end;

procedure T_frmOrcamento.edtDescrMaoDeObra1Exit(Sender: TObject);
begin

     edtValorServico.SetFocus;

end;

procedure T_frmOrcamento.memoDescricaoChange(Sender: TObject);
begin
    
    Grid_DetalhesDoOrcamento.Enabled := true;
    panel_total.Enabled              := true;

end;

procedure T_frmOrcamento.db_ValorTotalEnter(Sender: TObject);
begin

    edtDescrMaoDeObra.SetFocus;

end;

procedure T_frmOrcamento.edtQdeServicoKeyPress(Sender: TObject;
  var Key: Char);
begin
       If NOT (Key in['0'..'9',#8,#13]) then begin Key:=#0;end;
end;

procedure T_frmOrcamento.edtQdePecasKeyPress(Sender: TObject;
  var Key: Char);
begin
       If NOT (Key in['0'..'9',#8,#13]) then begin Key:=#0;end;
end;

procedure T_frmOrcamento.edtQdeProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
       If NOT (Key in['0'..'9',#8,#13]) then begin Key:=#0;end;
end;

procedure T_frmOrcamento.ExcluirItemClick(Sender: TObject);
begin

      if(idExcluido>0)then
      begin

        ExcluirItemDoGrid;
        AtualizarItemAposExclusao;

      end else begin

        Application.MessageBox('Primeiro selecione o Ítem a ser excluído com botão esquerdo!', 'Ítem não selecionado!', MB_ICONEXCLAMATION);

      end;

end;

procedure T_frmOrcamento.ExcluirItemDoGrid;
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
           idExcluido        :=  0;
           txtValorItem.Clear;
           Application.MessageBox('Ítem excluído com sucesso!', 'Excluindo ítem!', MB_OK);

       end
       else begin

           btnGravarOrcamento.Enabled:=false;
           btnCancelarOrcamento.Enabled:=true;

       end;

end;

procedure T_frmOrcamento.AtualizarItemAposExclusao;
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


procedure T_frmOrcamento.edtDescrMaoDeObraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if key = 13 then
      begin

           edtValorServico.SetFocus;

      end;

end;

procedure T_frmOrcamento.CopiarItemsGravarNoBanco;
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

procedure T_frmOrcamento.FormShow(Sender: TObject);
begin
  Caption := 'LOGADO POR '+NomeDoUsuarioLogado;

       if abrindoOrcamento then
       begin
          edtDescrMaoDeObra.Enabled := true;
          edtDescrMaoDeObra.SetFocus;
       end;

end;

procedure T_frmOrcamento.edtDescrMaoDeObraExit(Sender: TObject);
begin
   sServico   := edtDescrMaoDeObra.Text;
end;

procedure T_frmOrcamento.btnImprimirOSClick(Sender: TObject);
begin

    criarArquivoTXT;
    imprimirArquivoTXT(ExtractFilePath(Application.ExeName)+'OrdemServico.txt');


end;

procedure T_frmOrcamento.criarArquivoTXT;
var caminhoArq,sEmpresa,sEnd,sBairro,sCidade,sUF,sCNPJ,sCPF,sIE,sNomeCliente,sEndCliente,sData,sHora : string;
    iCodigoCliente : integer;
begin

     //Ou diricionar direto para impressora ou cria um arquivo txt
     caminhoArq :=  ExtractFilePath(Application.ExeName)+'OrdemServico.txt';

     //=============DADOS DA EMPRESA ============//
     _Sql := 'SELECT * FROM EMPRESA';

     with dm_DadosSegundo.cds_Empresa do
     begin

       close;
       CommandText:= _Sql;
       open;

     end;

     sEmpresa := dm_DadosSegundo.cds_Empresa.FieldByName('razaosocial') .AsString;
     sEnd     := dm_DadosSegundo.cds_Empresa.FieldByName('endereco')    .AsString;
     sBairro  := dm_DadosSegundo.cds_Empresa.FieldByName('bairro')      .AsString;
     sCidade  := dm_DadosSegundo.cds_Empresa.FieldByName('cidade')      .AsString;
     sUF      := dm_DadosSegundo.cds_Empresa.FieldByName('uf')          .AsString;
     sCNPJ    := dm_DadosSegundo.cds_Empresa.FieldByName('cnpj')        .AsString;
     sCPF     := dm_DadosSegundo.cds_Empresa.FieldByName('cpf')         .AsString;
     sIE      := dm_DadosSegundo.cds_Empresa.FieldByName('ie')          .AsString;

     //=============DADOS DO CLIENTE ============//
     iCodigoCliente := strtoint(txt_IDCLIENTE.text);

     _Sql := 'SELECT * FROM CLIENTES WHERE cli_id = :cli_id';

     with dm_Conexao.cds_DadosClientes do
     begin

       close;
       CommandText:= _Sql;
       Params.ParamByName('cli_id').AsInteger  := iCodigoCliente;
       open;

     end;

     sNomeCliente   := txtNomeCliente.caption;
     sEndCliente    := dm_Conexao.cds_DadosClientes.fieldByName('cli_endereco').AsString;
     sData          := lblDataDoDia.caption;
     sHora          := lblHoraAtual.caption;
     
     //para ir direto a impressora
     //AssignPrn(arq_impress);

     //para gravar arquivo txt
     AssignFile(arq_impress, caminhoArq);

     Rewrite(arq_impress);

     Printer.Canvas.Font.Name  := 'Courier new';
     Printer.Canvas.Font.Size  := 11;  

     Writeln(arq_impress, '     ==================================================================');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '     '+sEmpresa+'                                                      ');
     Writeln(arq_impress, '     '+sEnd+'  '+sBairro+'  '+sCidade+'  '+sUF+'                       ');
     Writeln(arq_impress, '     CNPJ:'+sCNPJ+'  CPF:'+sCPF+'  I.E.:'+sIE+'                        ');
     Writeln(arq_impress, '     ==================================================================');
     Writeln(arq_impress, '                                 O.S. Nº '+inttostr(NumOrcamento)+'    ');
     Writeln(arq_impress, '     ==================================================================');
     Writeln(arq_impress, '     CÓDIGO   : '+intToStr(iCodigoCliente)+'                           ');
     Writeln(arq_impress, '     CLIENTE  : '+trim(sNomeCliente)+'                                 ');
     Writeln(arq_impress, '     ENDEREÇO : '+sEndCliente+'');
     Writeln(arq_impress, '     ATENDIDO : '+NomeDoUsuarioLogado+'                                ');
     Writeln(arq_impress, '     ==================================================================');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '     DEFEITO/CLIENTE : '+sServico+' ');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '     PARECER/TECNICO :                                                 ');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '     VIA LOJA                             SÃO PAULO,'+sData+' '+sHora+'');
     Writeln(arq_impress, '     ==================================================================');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '     ==================================================================');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '     '+sEmpresa+'                                                      ');
     Writeln(arq_impress, '     '+sEnd+'  '+sBairro+'  '+sCidade+'  '+sUF+'                       ');
     Writeln(arq_impress, '     CNPJ:'+sCNPJ+'  CPF:'+sCPF+'  I.E.:'+sIE+'                        ');
     Writeln(arq_impress, '     ==================================================================');
     Writeln(arq_impress, '                                 O.S. Nº '+inttostr(NumOrcamento)+'    ');
     Writeln(arq_impress, '     ==================================================================');
     Writeln(arq_impress, '     CÓDIGO   : '+intToStr(iCodigoCliente)+'                           ');
     Writeln(arq_impress, '     CLIENTE  : '+trim(sNomeCliente)+'                                 ');
     Writeln(arq_impress, '     ENDEREÇO : '+sEndCliente+'');
     Writeln(arq_impress, '     ATENDIDO : '+NomeDoUsuarioLogado+'                                ');
     Writeln(arq_impress, '     ==================================================================');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '     DEFEITO/CLIENTE : '+sServico+' ');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '     PARECER/TECNICO :                                                 ');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '                                                                       ');
     Writeln(arq_impress, '     VIA CLIENTE                          SÃO PAULO,'+sData+' '+sHora+'');
     Writeln(arq_impress, '     ==================================================================');

     System.CloseFile(arq_impress);

end;


procedure T_frmOrcamento.imprimirArquivoTXT(caminhoArq : string);
begin

   //Imprime o arquivo TXT diretamente na impressora padrão do windows

   ShellExecute(Handle, 'print', PChar(caminhoArq), nil, nil, SW_HIDE);
   Application.MessageBox('Impressão iniciada...', 'Imprimindo', MB_OK);

   
end;

end.




