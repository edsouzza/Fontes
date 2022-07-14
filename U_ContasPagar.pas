unit U_ContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,DateUtils, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus, EditNum;

type
  T_frmContasPagar = class(TForm)
    pan_titulo: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    panel_total: TPanel;
    lbl37: TLabel;
    GridContas: TDBGrid;
    pan_botoes: TPanel;
    btnExcluirBoleto: TSpeedButton;
    btnSair: TSpeedButton;
    btnCadCredor: TSpeedButton;
    edtValorTotal: TStaticText;
    btnBaixarBoleto: TSpeedButton;
    txtMsg: TStaticText;
    btnConsultarBoletos: TSpeedButton;
    grCabecalho: TGroupBox;
    lbl52: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtIDCredor: TEdit;
    edtCredor: TStaticText;
    edtValorConta: TCurrencyEdit;
    edtIDContaSelecionada: TEdit;
    edtVencimento: TDateEdit;
    btnGravarBoleto: TButton;
    lblStatusLogoff: TLabel;
    btnImprimir: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure LimparCampos;
    procedure FecharAbrirTabelas;
    procedure edt_QuantidadeProdutoPedidoKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GridContasCellClick(Column: TColumn);
    procedure edtCredorClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnCadCredorClick(Sender: TObject);
    procedure edtValorContaClick(Sender: TObject);
    procedure ExcluirBoleto;
    procedure GravarBoleto;
    procedure edtValorContaChange(Sender: TObject);
    procedure btnGravarBoletoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBaixarBoletoClick(Sender: TObject);
    procedure VerificarContaProximaDoVencimento;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    //procedure CalcularValorTotal;
    Function CalcularValorToral:double;
    procedure btnExcluirBoletoClick(Sender: TObject);
    procedure MostrarBoletosVencidosPendentes;
    procedure MostrarBoletosVencidosFinalizados;
    procedure FiltrarPorCredorVencidosFinalizados;
    procedure MostrarBoletosNaoVencidos;
    procedure MostrarTodosBoletos;
    procedure MostrarBoletosPeloMesAnoSelecionado;
    procedure MostrarTodosBoletosDoMesCorrente;
    procedure BaixarBoleto;
    procedure FiltrarPorCredor;
    procedure FiltrarPorCredorVencidosPendentes;
    procedure FiltrarPorCredorNaoVencidos;
    procedure SelecionarUltimoBoletoCad;
    procedure AtualizarCaixaAposMovimento;
    procedure MostrarTotalDeRegistrosRetornados;
    procedure LimparPesquisa;
    procedure PopularGridContas;
    procedure LimparGridContas;
    procedure CamposGridContas;
    procedure RetornarStatusAposConsulta;
    procedure edtValorContaKeyPress(Sender: TObject; var Key: Char);
    procedure cmbMesesKeyPress(Sender: TObject; var Key: Char);
    procedure cmbAnosKeyPress(Sender: TObject; var Key: Char);
    procedure btnConsultarBoletosClick(Sender: TObject);
    procedure GridContasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtFitrarCredorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
                               
  private
    { Private declarations }
    NomeCredor, mesVigente : string;
    boletoPendente : boolean;
    TotalRegs      : integer;
    TotalValores   : double;
  public
    { Public declarations }

    ValorUnitarioItemProdutoPedido, ValorAtualizadoAposCadastro,ValorTotalPedido,ValorSaldoAtualAposMovto,ValorSaldoAnterior,ValorMovimento,
    ValorAtualizadoAposDelecao, ValorLiquidoItemProdutoPedido, ValorTotalItemProdutoPedido,ValorTotalItemDeletado,
    Qde_deletada, QuantidadeItemProdutoPedido, ValorTotalInicial, ValorTotalConvertido,ValorItemPraDeletarNaExclusao  : double;

    proxNumeDetalhe, proxNumItens, NumeroDaComandaAberta, proxNumComanda,Id_Produto, Id_FuncLogado, IDCredor : integer;
    AtualizandoPedido : Boolean;

  end;

var
  _frmContasPagar: T_frmContasPagar;
            

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo,
  SqlExpr,DBClient, U_principal, DB,
  U_CadCredores, U_EscolhaDoCredorParaPagamento,
  U_EscolhaParaConsultaDeBoletos, U_CadastroPadraoUmCampo,
  U_QRelPagtoCredores, U_QRelVencidosPendentes, U_QRelPagtosFinalizados,
  U_QRelPagtosVencer, U_QRelPagamentosPorCredores,
  U_QRelPagtosVencidosPendentesCredor,
  U_QRelPagtosVencidosFinalizadosCredor, U_QRelPagtosVencerPendentesCredor,
  U_QRelMesAnoSelecionado;


{$R *.dfm}

procedure T_frmContasPagar.FormCreate(Sender: TObject);
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
    lblStatusLogoff.Caption      := NomeDoUsuarioLogado;

    AbrirTabelas;

end;

procedure T_frmContasPagar.FormShow(Sender: TObject);
begin     

      VerificarContaProximaDoVencimento;
      TotalRegs := 0;
      Caption   := 'LOGADO POR '+NomeDoUsuarioLogado;

      if(TabelaEstaVazia('PAGAMENTOS'))then
      begin
            btnConsultarBoletos.Enabled := false;
      end;

end;

procedure T_frmContasPagar.VerificarContaProximaDoVencimento;
var
  Dia_Atual, Trez_Proximos_Dias, Mes_Atual  : string;
begin

          // ESSE PROCEDIMENTO MOSTRARÁ NA TELA INICIAL OS BOLETOS COM VENCIMENTO DO DIA E DOS TRES PROXIMOS

          DataDoDia           := date;
          Trez_Proximos_Dias  := IntToStr(DayOf(DataDoDia)+3);
          Dia_Atual           := IntToStr(DayOf(DataDoDia));
          Mes_Atual           := IntToStr(MonthOf(DataDoDia));   


         _Sql := 'SELECT p.id_pagto, p.credor_id, p.valor, p.dtvencto, p.dtpagto, p.mesano, p.dtcad, p.status, EXTRACT(DAY FROM p.dtvencto), '+
                 'EXTRACT(MONTH FROM p.dtvencto), c.id_credor, c.credor FROM pagamentos p, credores c WHERE p.credor_id = c.id_credor AND '+
                 'EXTRACT(DAY FROM p.dtvencto) BETWEEN :pDia AND :pDiasProximos AND EXTRACT(MONTH FROM p.dtvencto) = :pMes '+
                 'AND p.status = '+QuotedStr('PENDENTE')+' ORDER BY EXTRACT(DAY FROM p.dtvencto) DESC';


         with dm_Conexao.cds_Pagamentos do
         begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pDia').AsString          := Dia_Atual;
            Params.ParamByName('pDiasProximos').AsString := Trez_Proximos_Dias;
            Params.ParamByName('pMes').AsString          := Mes_Atual;
            Open;

             //se encontrar boletos com vencimento de hoje a trez dias
             if not IsEmpty then
             begin

                  with txtMsg do
                  begin

                    Width     := 993;
                    Caption   := 'Boletos com vencimento do dia e/ou dos três próximos requerem sua atenção. Clique em F5 para continuar.';
                    Font.Size := 10;
                    Visible   := True;

                  end;

                  grCabecalho.Enabled          := false;
                  GridContas.Enabled           := false;
                  pan_botoes.Enabled           := false;
                  btnCadCredor.Enabled         := false;
                  btnSair.Enabled              := false;
                  CamposGridContas;
                  CalcularValorToral;

             end else
             begin

                PopularGridContas;
                CalcularValorToral;

             end;

         end;

end;


procedure T_frmContasPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

        if key= vk_F5 then
        begin

           GridContas.Enabled   := true;
           GridContas.Options   := [dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection];  //seleciona toda a linha
           txtMsg.Visible       := false;
           grCabecalho.Enabled  := true;
           pan_botoes.Enabled   := true;
           btnCadCredor.Enabled := true;
           btnSair.Enabled      := true;
           MostrarTodosBoletosDoMesCorrente;

       end;

end;


procedure T_frmContasPagar.AbrirTabelas;
begin

    dm_Conexao.cds_Pagamentos.Active   := true;
    dm_Conexao.cds_Caixa.Active        := true;
    dm_Conexao.cds_Credores.Active     := true;

end;

procedure T_frmContasPagar.FecharTabelas;
begin

    dm_Conexao.cds_Pagamentos.Active   := false;
    dm_Conexao.cds_Caixa.Active        := false;
    dm_Conexao.cds_Credores.Active     := false;

end;

procedure T_frmContasPagar.FecharAbrirTabelas;
begin

    dm_Conexao.cds_Pagamentos.Active  := false;
    dm_Conexao.cds_Pagamentos.Active  := true;

    dm_Conexao.cds_Caixa.Active       := false;
    dm_Conexao.cds_Caixa.Active       := true;

end;

procedure T_frmContasPagar.edt_QuantidadeProdutoPedidoKeyPress(
  Sender: TObject; var Key: Char);
begin

     // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    release;

end;

procedure T_frmContasPagar.FormKeyPress(Sender: TObject;
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

procedure T_frmContasPagar.edtCredorClick(Sender: TObject);
begin

   dm_Conexao.cds_Credores.Active := true;
   TotalRegs := ListaQdeRegs(dm_Conexao.cds_Credores);
   btnCadCredor.Enabled           := false;
   btnConsultarBoletos.Enabled    := false;

   if ( TotalRegs > 0 ) then
   begin

       Application.CreateForm(T_frmEscolhaCredorParaPagamento, _frmEscolhaCredorParaPagamento);
       _frmEscolhaCredorParaPagamento.ShowModal;
       FreeAndNil(_frmEscolhaCredorParaPagamento);

       btnExcluirBoleto.Enabled := false;
       btnBaixarBoleto.Enabled  := false;
       pan_titulo.Caption       := 'Cadastrando boleto para : '+LetrasIniciaisMaiusculas(nomeDoCredorParaFiltrarBoletos);
       btnSair.Caption          := 'Cancelar';
       btnSair.Hint             := 'Cancelar';

   end else begin

      Application.MessageBox('No momento não foram encontrados credores cadastrados!',
              'Cadastre os credores primeiro!', MB_OK + MB_ICONWARNING);
      exit;

   end;

   LimparGridContas;

end;

procedure T_frmContasPagar.GridContasCellClick(
  Column: TColumn);
begin

    edtIDContaSelecionada.Text  := IntToStr(dm_Conexao.cds_Pagamentos.Fields[0].Value);   //ID_PAGTO
    ValorMovimento              := dm_Conexao.cds_Pagamentos.Fields[2].Value;
    IDCredor                    := dm_Conexao.cds_Pagamentos.Fields[1].Value;
    btnExcluirBoleto.Enabled    := true;
    btnBaixarBoleto.Enabled     := true;
    btnCadCredor.Enabled        := False;
    txtMsg.Visible              := false;

    //verificação feita para nao ocorrer a tentativa de pagar um boleto ja finalizado
    if (dm_Conexao.cds_Pagamentos.FieldByName('STATUS').Value = 'PENDENTE')then
          boletoPendente := true;

    if (dm_Conexao.cds_Pagamentos.FieldByName('STATUS').Value = 'FINALIZADO')then
          btnBaixarBoleto.Enabled := false;

end;

procedure T_frmContasPagar.btnBaixarBoletoClick(Sender: TObject);
begin

   //primeiro verificar se o boleto esta PENDENTE para baixa senao informar

   if ( boletoPendente ) then
   begin

     BaixarBoleto;
     AtualizarCaixaAposMovimento;
     boletoPendente           := false;
     btnBaixarBoleto.Enabled  := false;
     btnExcluirBoleto.Enabled := false;
     btnCadCredor.Enabled     := true;

   end else begin

       Application.MessageBox('Este boleto já foi baixado!', 'Baixa indisponível verifique!', MB_ICONEXCLAMATION);
       boletoPendente           := false;
       btnBaixarBoleto.Enabled  := false;
       btnExcluirBoleto.Enabled := false;
       btnCadCredor.Enabled     := true;
       exit;

   end;         

end;

procedure T_frmContasPagar.BaixarBoleto;
begin

       //baixar boleto significa que o operador esta pagando o boleto e o valor deve ser debitado no caixa
       
       texto:= 'Confirma a baixa do boleto selecionado?';

       if Application.MessageBox(PChar(texto),'Pagando a conta',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

           with DM_Pesq.Qry_Geral do
           begin

                close;
                sql.Clear;
                sql.Add('UPDATE pagamentos SET dtpagto = :datapagto, status = '+QuotedStr('FINALIZADO')+' WHERE id_pagto = :pIDPagto');
                Params.ParamByName('datapagto').AsDate      := date;
                Params.ParamByName('pIDPagto').AsInteger    := StrToInt(edtIDContaSelecionada.Text);
                ExecSQL();

           end;
           Application.MessageBox('O boleto foi baixado com sucesso!', 'OK!', MB_OK);
           LogOperacoes(NomeDoUsuarioLogado, 'baixa de boleto');
           FecharAbrirTabelas;
           LimparCampos;
           
       end;

end;

procedure T_frmContasPagar.AtualizarCaixaAposMovimento;
begin

        //IDENTIFICA O CREDOR DO BOLETO

         _Sql := 'SELECT p.credor_id, c.id_credor, c.credor FROM pagamentos p, credores c WHERE '+
                 'p.credor_id = c.id_credor AND p.credor_id = :pIDCredor';

           With DM_Pesq.Qry_Geral do
           begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              Params.ParamByName('pIDCredor').AsInteger := IDCredor;
              Open;

                  if not IsEmpty then
                  begin

                       NomeCredor := DM_Pesq.Qry_Geral.Fields[2].AsString;

                  end;

           end;


          //VERIFICAR O VALOR DO SALDO ANTERIOR (ULTIMO REGISTRO)

            _Sql := 'select id_caixa, saldo_atual from caixa WHERE '+
                    'id_caixa = (select max(id_caixa) from caixa)';


           With DM_Pesq.Qry_Geral do
           begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              Open;

                  if not IsEmpty then begin

                       ValorSaldoAnterior := DM_Pesq.Qry_Geral.Fields[1].Value;

                  end;

           end;

           ValorSaldoAtualAposMovto := ( ValorSaldoAnterior - ValorMovimento );

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


            with dm_Conexao.cds_Caixa do
            begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNum;
                FieldByName('id_venda').AsInteger        := 0;
                FieldByName('saldo_anterior').AsFloat    := ValorSaldoAnterior;
                FieldByName('valor_movimento').AsFloat   := -ValorMovimento;
                FieldByName('saldo_atual').AsFloat       := ValorSaldoAtualAposMovto;
                FieldByName('data').AsDateTime           := date;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := 'PAGTO/BOLETO/CREDOR '+NomeCredor;

                ApplyUpdates(0);

            end;

            // cadastra a despesa na tabela de movimento
            // MovimentacaoComDespesa; OBS: este procedimento não foi feito aqui esta em _FRMMOVIMENTOCAIXA
            FecharAbrirTabelas;

end;

procedure T_frmContasPagar.LimparPesquisa;
begin

     txtMsg.Visible                    := false;
     btnSair.Caption                   := 'Sair';
     btnSair.Hint                      := 'Sair';
     btnCadCredor.Enabled              := true;
     grCabecalho.Enabled               := true;
     btnConsultarBoletos.Enabled       := true;
     btnExcluirBoleto.Enabled          := false;
     btnBaixarBoleto.Enabled           := false;
     btnImprimir.Enabled               := false;

     MostrarTodosBoletosDoMesCorrente;

end;

procedure T_frmContasPagar.LimparCampos;
begin
    
    edtValorConta.Text            := '0,00';
    btnSair.Enabled               :=  true;
    btnExcluirBoleto.Enabled      :=  false;
    btnBaixarBoleto.Enabled       :=  false;
    edtValorConta.Enabled         :=  false;
    edtVencimento.Enabled         :=  false;
    btnGravarBoleto.Enabled       :=  false;
    btnCadCredor.Enabled          :=  true;
    btnConsultarBoletos.Enabled   :=  true;
    btnImprimir.Enabled           := false;
    edtCredor.Caption             :=  '';
    edtVencimento.Clear;

end;


procedure T_frmContasPagar.btnSairClick(Sender: TObject);
begin

   if (btnSair.Caption = 'Sair')then
   begin
   
       close;

   end else if (btnSair.Caption = 'Limpar/Voltar') or (btnSair.Caption = 'Cancelar')then
   begin

       LimparPesquisa;
       LimparCampos;

   end;

   if(TabelaEstaVazia('PAGAMENTOS'))then
   begin
          btnConsultarBoletos.Enabled := false;
   end;
   _frmPrincipal.logo.Visible := true;

end;

procedure T_frmContasPagar.btnCadCredorClick(Sender: TObject);
begin

       //dados necessários para acessar cadastro em tabela com apenas um campo
       nomeTabela    := 'CREDORES';
       campoNome     := 'CREDOR';
       campoID       := 'ID_CREDOR';
       cdsTable      := dm_Conexao.cds_Credores;
       dsTable       := dm_Conexao.ds_Credores;

       Application.CreateForm(T_frmCadastroPadraoUmCampo,  _frmCadastroPadraoUmCampo);
       _frmCadastroPadraoUmCampo.ShowModal;
       FreeAndNil(_frmCadastroPadraoUmCampo);

end;

procedure T_frmContasPagar.edtValorContaClick(Sender: TObject);
begin

    edtValorConta.SelStart  := 0;
    edtValorConta.SelLength := Length(edtValorConta.Text);

end;

procedure T_frmContasPagar.ExcluirBoleto;
var
  texto : string;
begin

       texto:= 'Confirma a exclusão do boleto selecionado?';

       if Application.MessageBox(PChar(texto),'Exclusão de boletos',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

           with DM_Pesq.Qry_Geral do
           begin

                close;
                sql.Clear;
                sql.Add('DELETE FROM pagamentos WHERE id_pagto = :pIDPagto');
                Params.ParamByName('pIDPagto').AsInteger         := StrToInt(edtIDContaSelecionada.Text);
                ExecSQL();

           end;

           Application.MessageBox('O boleto foi excluído com sucesso!', 'OK!', MB_OK);
           LogOperacoes(NomeDoUsuarioLogado, 'exclusão de boleto');
           FecharAbrirTabelas;
           CalcularValorToral;
           LimparCampos;

       end else
       begin

          btnExcluirBoleto.Enabled := false;
          FecharAbrirTabelas;
          CalcularValorToral;
          LimparCampos;

      end;

end;

procedure T_frmContasPagar.edtValorContaChange(Sender: TObject);
begin

  btnGravarBoleto.Enabled := true;

end;

procedure T_frmContasPagar.GravarBoleto;
begin

   if ( edtValorConta.Text = '') then
   begin

      Application.MessageBox('Entre com o valor do boleto!', 'Valor inválido!', MB_OK);
      edtValorConta.SetFocus;

   end else begin

     //esta função retorna o mes e o ano da data solicitada ex: 06/2013 para JUN/2013
     MostrarMesEAno(DateToStr(edtVencimento.Date));

      With DM_Pesq.qry_Cod do
        begin

            Close;
            SQL.Clear;
            SQL.Add('select max(id_pagto) from pagamentos');
            Open;

            if not IsEmpty then begin

               proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

            end;

         end;

         //para gravar a data de pagamento vazia é só não declarar o campo com seu parametro

         _Sql := 'INSERT INTO pagamentos (id_pagto, credor_id, valor, dtvencto,  mesano, dtcad, status) '+
                 'VALUES (:pID, :pCredor, :pValor, :pVencto, :Mesano, :pDataCad, :pStatus)';

         with DM_Pesq.Qry_Geral do
         begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             Params.ParamByName('pID').AsInteger            := proxNum;
             Params.ParamByName('pCredor').AsInteger        := StrToInt(edtIDCredor.Text);;
             Params.ParamByName('pValor').AsFloat           := StrToFloat(edtValorConta.Text);
             Params.ParamByName('pVencto').AsDateTime       := edtVencimento.Date;
             Params.ParamByName('Mesano').AsString          := mes_ano;
             Params.ParamByName('pDataCad').AsDateTime      := Date;
             Params.ParamByName('pStatus').AsString         := 'PENDENTE';
             ExecSQL();

         end;

        Application.MessageBox('Boleto gravado com sucesso!', 'OK!', MB_OK);
        LogOperacoes(NomeDoUsuarioLogado, 'cadastro de boleto');
        FecharAbrirTabelas;
        LimparCampos;
        SelecionarUltimoBoletoCad;
        
  end;

end;

procedure T_frmContasPagar.btnGravarBoletoClick(Sender: TObject);
begin

    GravarBoleto;
    CalcularValorToral;
    btnImprimir.Enabled:=false;

end;

procedure T_frmContasPagar.btnExcluirBoletoClick(Sender: TObject);
begin

    ExcluirBoleto;

end;

procedure T_frmContasPagar.MostrarTotalDeRegistrosRetornados;
begin

    TotalRegs := dm_Conexao.cds_Pagamentos.RecordCount;

    with txtMsg do
    begin

      Width      := 770;
      Caption    := 'Total de ocorrências encontradas = '+inttostr(TotalRegs);
      Visible    := True;
      Color      := clWhite;
      Font.Color := clBlack;
      Font.Size  := 11;

    end;

    btnSair.Caption             := 'Limpar/Voltar';
    btnSair.Hint                := 'Limpar pesquisa';
    btnCadCredor.Enabled        := false;
    btnConsultarBoletos.Enabled := false;
    btnImprimir.Enabled         := true;
    grCabecalho.Enabled         := false;

end;

function T_frmContasPagar.CalcularValorToral : double;
begin

      //Calcula e retorna o valor total encontrado na variável TotalValores
      TotalValores := 0;

      while not dm_Conexao.cds_Pagamentos.eof do
      begin

           TotalValores := ( TotalValores + dm_Conexao.cds_Pagamentos.fieldbyname('valor').asFloat );
           dm_Conexao.cds_Pagamentos.Next;

      end;
      edtValorTotal.Caption := Transform(TotalValores);
      Result :=  TotalValores;


      //ShowMessage(FloatToStr(TotalValores));

end;

procedure T_frmContasPagar.RetornarStatusAposConsulta;
begin

      CalcularValorToral;

      if(TotalValores = 0)then
       begin
          Application.MessageBox('Nenhuma ocorrência encontrada para esta consulta!', 'Nada encontrado!', MB_OK);

          MostrarTodosBoletosDoMesCorrente;

       end else begin
           MostrarTotalDeRegistrosRetornados;

       end;
       exit;

end;

procedure T_frmContasPagar.MostrarTodosBoletos;
begin

         //Mostra todos os boletos gerados e cadastrados no sistema até o momento
         with dm_Conexao.cds_Pagamentos do
         begin

             close;
             CommandText := 'SELECT p.*, c.* FROM pagamentos p, credores c WHERE p.credor_id = c.id_credor '+
                            'ORDER BY p.dtvencto';
             open;

            if not IsEmpty then
            begin
                 //Mostrando os valores no grid
                 CamposGridContas;
                 GridContas.Enabled := true;
                 pan_titulo.Caption := 'Todos os boletos cadastrados';

            end else
            begin
                btnImprimir.Enabled   := false;
            end;

            RetornarStatusAposConsulta;

         end;

end;

procedure T_frmContasPagar.MostrarBoletosVencidosPendentes;
begin

     with dm_Conexao.cds_Pagamentos do
     begin

         close;
         CommandText := 'SELECT p.*, c.* FROM pagamentos p, credores c WHERE c.id_credor = p.credor_id AND '+
         'p.dtvencto < :dataAtual AND p.status = '+QuotedStr('PENDENTE')+' ORDER BY p.dtvencto';
         Params.ParamByName('dataAtual').AsDate := date;
         open;

         if not IsEmpty then
         begin
               //Mostrando os valores no grid
               CamposGridContas;
               GridContas.Enabled := true;
               pan_titulo.Caption := 'Boletos vencidos e pendentes';

         end else
         begin
            btnImprimir.Enabled   := false;
         end;

         RetornarStatusAposConsulta;

     end;

end;

procedure T_frmContasPagar.MostrarBoletosVencidosFinalizados;
begin

     with dm_Conexao.cds_Pagamentos do
     begin

         close;
         CommandText := 'SELECT p.*, c.* FROM pagamentos p, credores c WHERE c.id_credor = p.credor_id AND '+
         'p.dtvencto < :dataAtual AND p.status = '+QuotedStr('FINALIZADO')+' ORDER BY p.dtvencto';
         Params.ParamByName('dataAtual').AsDate := date;
         open;

         if not IsEmpty then
         begin
               //Mostrando os valores no grid
               CamposGridContas;
               GridContas.Enabled   := true;
               pan_titulo.Caption   := 'Boletos vencidos e finalizados';
               btnImprimir.Enabled  := true;
         end else
         begin
            btnImprimir.Enabled   := false;
         end;

         RetornarStatusAposConsulta;

     end;

end;


procedure T_frmContasPagar.MostrarBoletosNaoVencidos;
begin

     with dm_Conexao.cds_Pagamentos do
     begin

         close;
         CommandText := 'SELECT p.*, c.* FROM pagamentos p, credores c WHERE c.id_credor = p.credor_id AND '+
         'p.status='+QuotedStr('PENDENTE')+' AND p.dtvencto >= :dataAtual ORDER BY p.dtvencto';
         Params.ParamByName('dataAtual').AsDate := date;
         open;

         if not IsEmpty then
         begin
               //Mostrando os valores no grid
               CamposGridContas;
               GridContas.Enabled := true;
               pan_titulo.Caption := 'Boletos não vencidos';
               btnImprimir.Enabled  := true;
         end else
         begin
            btnImprimir.Enabled   := false;
         end;

         RetornarStatusAposConsulta;

      end;

end;

procedure T_frmContasPagar.MostrarTodosBoletosDoMesCorrente;
begin

     mesVigente := MostrarMesEAno(lblDataDoDia.Caption);

     with dm_Conexao.cds_Pagamentos do
     begin

         close;
         CommandText := 'SELECT p.*, c.* FROM pagamentos p, credores c WHERE p.credor_id = c.id_credor '+
         'AND mesano = :pMesAno ORDER BY dtvencto';
         Params.ParamByName('pMesAno').AsString := mesVigente;
         open;

           if not IsEmpty then
            begin
                 //se encontrou valores mostra os campos com valores
                 CamposGridContas;
                 GridContas.Enabled := true;
                 btnImprimir.Enabled  := true;
            end else begin
                 //se não encontrou valores
                 GridContas.Enabled := false;
                 edtValorTotal.Caption := '0,00';
                 btnImprimir.Enabled   := false;
            end;

            CalcularValorToral;

     end;
     pan_titulo.Caption := 'Boletos do mês de : '+LetrasIniciaisMaiusculas(mesVigente);

end;

procedure T_frmContasPagar.MostrarBoletosPeloMesAnoSelecionado;
begin

     with dm_Conexao.cds_Pagamentos do
     begin

         close;
         CommandText := 'SELECT p.*, c.* FROM pagamentos p, credores c WHERE c.id_credor = p.credor_id '+
         'AND p.mesano = :pMesAno ORDER BY p.dtvencto';
         Params.ParamByName('pMesAno').AsString := mesAnoSelecionado;
         open;

        if not IsEmpty then
        begin

             CamposGridContas;
             GridContas.Enabled   := true;
             btnImprimir.Enabled  := true;
             MostrarTotalDeRegistrosRetornados;
             pan_titulo.Caption := 'Boletos do mês de : '+ LetrasIniciaisMaiusculas(mesAnoSelecionado);

        end else begin

             GridContas.Enabled    := false;
             btnImprimir.Enabled   := false;
             Application.MessageBox('Nenhuma ocorrência encontrada para esta consulta!', 'Nada encontrado!', MB_OK);
             MostrarTodosBoletosDoMesCorrente;
             exit;

        end;

         RetornarStatusAposConsulta;

     end;

end;

procedure T_frmContasPagar.FiltrarPorCredor;
begin

      _Sql := 'SELECT p.*, c.* FROM pagamentos p, credores c WHERE c.id_credor = p.credor_id and '+
              'c.credor = :pCredor ORDER BY p.dtvencto';

      with dm_Conexao.cds_Pagamentos do
      begin

           close;
           CommandText := (_Sql);
           Params.ParamByName('pCredor').AsString := nomeDoCredorParaFiltrarBoletos;
           open;

        if not IsEmpty then
        begin

             CamposGridContas;
             btnImprimir.Enabled  := true;
             RetornarStatusAposConsulta;
             pan_titulo.Caption := 'Boletos do credor : '+LetrasIniciaisMaiusculas(nomeDoCredorParaFiltrarBoletos);

        end else begin

             GridContas.Enabled    := false;
             btnImprimir.Enabled   := false;
             Application.MessageBox('Nenhuma ocorrência encontrada para esta consulta!', 'Nada encontrado!', MB_OK);
             MostrarTodosBoletosDoMesCorrente;
             exit;

        end;

     end;
end;

procedure T_frmContasPagar.FiltrarPorCredorVencidosPendentes;
begin

      _Sql := 'SELECT p.*, c.* FROM pagamentos p, credores c WHERE c.id_credor = p.credor_id AND '+
              'c.credor = :pCredor AND p.dtvencto < :dataAtual AND p.status = '+QuotedStr('PENDENTE')+' ORDER BY p.dtvencto';

      with dm_Conexao.cds_Pagamentos do
      begin

           close;
           CommandText := (_Sql);
           Params.ParamByName('dataAtual').AsDate := date;
           Params.ParamByName('pCredor').AsString := nomeDoCredorParaFiltrarBoletos;
           open;

        if not IsEmpty then
        begin

             CamposGridContas;
             RetornarStatusAposConsulta;
             btnImprimir.Enabled  := true;
             pan_titulo.Caption := 'Boletos vencidos e pendentes do credor : '+LetrasIniciaisMaiusculas(nomeDoCredorParaFiltrarBoletos);

        end else begin

             GridContas.Enabled    := false;
             btnImprimir.Enabled   := false;
             Application.MessageBox('Nenhuma ocorrência encontrada para esta consulta!', 'Nada encontrado!', MB_OK);
             MostrarTodosBoletosDoMesCorrente;
             exit;

        end;

    end;

end;


procedure T_frmContasPagar.FiltrarPorCredorVencidosFinalizados;
begin

      _Sql := 'SELECT p.*, c.* FROM pagamentos p, credores c WHERE c.id_credor = p.credor_id AND '+
              'c.credor = :pCredor AND p.dtvencto < :dataAtual AND p.status = '+QuotedStr('FINALIZADO')+' ORDER BY p.dtvencto';

      with dm_Conexao.cds_Pagamentos do
      begin

           close;
           CommandText := (_Sql);
           Params.ParamByName('dataAtual').AsDate := date;
           Params.ParamByName('pCredor').AsString := nomeDoCredorParaFiltrarBoletos;
           open;

       if not IsEmpty then
        begin

             CamposGridContas;
             RetornarStatusAposConsulta;
             btnImprimir.Enabled  := true;
             pan_titulo.Caption := 'Boletos finalizados do credor : '+LetrasIniciaisMaiusculas(nomeDoCredorParaFiltrarBoletos);

        end else begin

             GridContas.Enabled    := false;
             btnImprimir.Enabled   := false;
             Application.MessageBox('Nenhuma ocorrência encontrada para esta consulta!', 'Nada encontrado!', MB_OK);
             MostrarTodosBoletosDoMesCorrente;
             exit;

        end;

    end;

end;

procedure T_frmContasPagar.FiltrarPorCredorNaoVencidos;
begin

      _Sql := 'SELECT p.*, c.* FROM pagamentos p, credores c WHERE c.id_credor = p.credor_id AND '+
              'c.credor = :pCredor AND p.dtvencto >= :dataAtual AND p.status = '+QuotedStr('PENDENTE')+' ORDER BY p.dtvencto';

      with dm_Conexao.cds_Pagamentos do
      begin

           close;
           CommandText := (_Sql);
           Params.ParamByName('dataAtual').AsDate := date;
           Params.ParamByName('pCredor').AsString := nomeDoCredorParaFiltrarBoletos;
           open;

       if not IsEmpty then
        begin

             CamposGridContas;
             btnImprimir.Enabled  := true;
             RetornarStatusAposConsulta;
             pan_titulo.Caption := 'Boletos não vencidos do credor : '+LetrasIniciaisMaiusculas(nomeDoCredorParaFiltrarBoletos);

        end else begin

             GridContas.Enabled    := false;
             btnImprimir.Enabled   := false;
             Application.MessageBox('Nenhuma ocorrência encontrada para esta consulta!', 'Nada encontrado!', MB_OK);
             MostrarTodosBoletosDoMesCorrente;
             exit;

        end;

    end;

end;

procedure T_frmContasPagar.SelecionarUltimoBoletoCad;
begin

     //selecionando o ultimo registro, ou seja o que acabou de ser cadastrado
     with dm_Conexao.cds_Pagamentos do
     begin

         close;
         CommandText := 'SELECT p.*, c.* FROM pagamentos p, credores c WHERE c.id_credor = p.credor_id '+
         'AND id_pagto=(select max(id_pagto) from pagamentos) ORDER BY p.dtvencto';
         open;

        if not IsEmpty then
        begin

             CamposGridContas;
             GridContas.Enabled := true;
             MostrarTotalDeRegistrosRetornados;
             txtMsg.Caption     := 'Boleto cadastrado com sucesso!';
             pan_titulo.Caption := 'Boleto cadastrado com sucesso';

        end;

     end;

end;

procedure T_frmContasPagar.edtValorContaKeyPress(Sender: TObject;
  var Key: Char);
begin

     edtVencimento.Date :=  date + 30;

end;

procedure T_frmContasPagar.cmbMesesKeyPress(Sender: TObject;
  var Key: Char);
begin

    KEY := #0; // inibindo a edição

end;

procedure T_frmContasPagar.cmbAnosKeyPress(Sender: TObject; var Key: Char);
begin

    KEY := #0; // inibindo a edição

end;


procedure T_frmContasPagar.btnConsultarBoletosClick(Sender: TObject);
begin
     if(TabelaEstaVazia('PAGAMENTOS'))then
     begin
            Application.MessageBox('A tabela de pagamentos esta vazia no momento!',
        'Nenhum boleto cadastrado!', MB_OK + MB_ICONWARNING);
        exit;

     end else begin

        Application.CreateForm(T_frmEscolhaParaConsultaDeBoletos, _frmEscolhaParaConsultaDeBoletos);
        _frmEscolhaParaConsultaDeBoletos.ShowModal;
        FreeAndNil(_frmEscolhaParaConsultaDeBoletos);
        LogOperacoes(NomeDoUsuarioLogado, 'consulta a boletos');

     end;

end;


procedure T_frmContasPagar.GridContasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

     with GridContas do
     begin
        if DataSource.DataSet.FieldByName('status').AsString = 'FINALIZADO' then
        begin

              //caso o status seja 'FINALIZADO' as letras estarão na cor AZUL
              Canvas.Font.Style  := [fsBold];
              Canvas.Font.Color  := clBlue;

         end else begin

             //caso o status seja 'PENDENTE' as letras estarão na cor VERMELHA
             Canvas.Font.Style  := [fsBold];
             Canvas.Font.Color  := clRed;

         end;

         //dando cor á linha selecionada
         if gdSelected in State then
         begin

              if DataSource.DataSet.FieldByName('status').AsString = 'PENDENTE' then
              begin

                   Canvas.Brush.Color := clSkyBlue;   //cor de fundo da linha
                   Canvas.Font.Color  := clred;     //cor da letra

              end else begin

                    Canvas.Brush.Color := clSkyBlue;   //cor de fundo da linha
                    Canvas.Font.Color  := clblue;     //cor da letra

              end;
         end;

         Canvas.FillRect(Rect);
         DefaultDrawColumnCell(Rect,DataCol,Column,State);

     end;          

end;

procedure T_frmContasPagar.PopularGridContas;
begin

           mesVigente        := MostrarMesEAno(lblDataDoDia.Caption);

           with dm_Conexao.cds_Pagamentos do
           begin

               close;
               CommandText := 'SELECT p.*, c.* FROM pagamentos p, credores c WHERE c.id_credor = p.credor_id '+
               'AND p.mesano = :pMesAno ORDER BY dtvencto';
               Params.ParamByName('pMesAno').AsString := mesVigente;
               open;

            end;

            pan_titulo.Caption := 'Boletos do mês de '+LetrasIniciaisMaiusculas(mesVigente);
            CamposGridContas;

end;

procedure T_frmContasPagar.LimparGridContas;
begin

           with dm_Conexao.cds_Pagamentos do
           begin

               close;
               CommandText := 'SELECT * FROM pagamentos WHERE id_pagto = 0';
               open;

           end;

           CamposGridContas;
           edtValorTotal.Caption := '0,00';

end;

procedure T_frmContasPagar.CamposGridContas;
begin

        TFloatField(dm_Conexao.cds_Pagamentos.FieldByName('valor')).DisplayFormat := '#,##0.00';

        with GridContas do
        begin

            DataSource:=  dm_Conexao.ds_Pagamentos;
            Columns.Clear;

            Columns.Add;
            Columns[0].FieldName         := 'CREDOR';
            Columns[0].Title.caption     := 'CREDOR';
            Columns[0].Width             := 445;
            Columns[0].Alignment         := taLeftJustify;
            Columns[0].Title.Font.Style  := [fsBold];
            Columns[0].Title.Alignment   := taLeftJustify;

            Columns.Add;
            Columns[1].FieldName         := 'MESANO';
            Columns[1].Title.caption     := 'MES';
            Columns[1].Width             := 100;
            Columns[1].Alignment         := taCenter;
            Columns[1].Title.Font.Style  := [fsBold];
            Columns[1].Title.Alignment   := taCenter;

            Columns.Add;
            Columns[2].FieldName         := 'DTVENCTO';
            Columns[2].Title.caption     := 'VENCIMENTO';
            Columns[2].Width             := 120;
            Columns[2].Alignment         := taCenter;
            Columns[2].Title.Font.Style  := [fsBold];
            Columns[2].Title.Alignment   := taCenter;

            Columns.Add;
            Columns[3].FieldName         := 'DTPAGTO';
            Columns[3].Title.caption     := 'PAGAMENTO';
            Columns[3].Width             := 120;
            Columns[3].Alignment         := taCenter;
            Columns[3].Title.Font.Style  := [fsBold];
            Columns[3].Title.Alignment   := taCenter;

            Columns.Add;
            Columns[4].FieldName         := 'STATUS';
            Columns[4].Title.caption     := 'STATUS';
            Columns[4].Width             := 100;
            Columns[4].Alignment         := taCenter;
            Columns[4].Title.Font.Style  := [fsBold];
            Columns[4].Title.Alignment   := taCenter;

            Columns.Add;
            Columns[5].FieldName         := 'VALOR';
            Columns[5].Title.caption     := 'VALOR';
            Columns[5].Width             := 80;
            Columns[5].Alignment         := taRightJustify;
            Columns[5].Title.Font.Style  := [fsBold];
            Columns[5].Title.Alignment   := taRightJustify;

        end;


end;

procedure T_frmContasPagar.edtFitrarCredorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if key=13 then
     begin

        FiltrarPorCredor;

     end;

end;    

procedure T_frmContasPagar.btnImprimirClick(Sender: TObject);
begin

      AvisoTemporario('Imprimindo pagamentos do cliente...');

      if self.tag = 100 then
      begin

          Application.CreateForm(TQ_RelPagamentosCredores,  Q_RelPagamentosCredores);
          with Q_RelPagamentosCredores.cds_RelPagtoCredores do
          begin

            Close;
            Open;

          end;

          with Q_RelPagamentosCredores do
          begin

            qryEmpresa.Active           := true;
            cds_RelPagtoCredores.Active := True;
            ReportTitle                 := 'Todos os pagamentos cadastrados';
            Preview;

          end;

          FreeAndNil(Q_RelPagamentosCredores);


      end else if self.tag = 200 then
      begin

            Application.CreateForm(TQ_RelVencidosPendentes,  Q_RelVencidosPendentes);
            with Q_RelVencidosPendentes.cds_RelVencidosPendentes do
            begin

              Close;
              Params.ParamByName('dataatual').AsDate := now;
              Open;

            end;

            with Q_RelVencidosPendentes do
            begin

              qryEmpresa.Active := true;
              ReportTitle       := 'Pagamentos vencidos e pendentes';
              Preview;

            end;

            FreeAndNil(Q_RelVencidosPendentes);

      end else if self.tag = 300 then
      begin

            Application.CreateForm(TQ_RelPagtosFinalizados,  Q_RelPagtosFinalizados);
            with Q_RelPagtosFinalizados.cds_RelPagtosFinalizados do
            begin

              Close;
              Params.ParamByName('dataatual').AsDate := now;
              Open;

            end;

            with Q_RelPagtosFinalizados do
            begin

              qryEmpresa.Active   := true;
              ReportTitle         := 'Pagamentos finalizados';
              Preview;

            end;

            FreeAndNil(Q_RelPagtosFinalizados);

      end else if self.tag = 400 then
      begin

            Application.CreateForm(TQ_RelPagtosVencer,  Q_RelPagtosVencer);
            with Q_RelPagtosVencer.cds_RelPagtosVencer do
            begin

              Close;
              Params.ParamByName('dataatual').AsDate := now;
              Open;

            end;

            with Q_RelPagtosVencer do
            begin

              qryEmpresa.Active   := true;
              ReportTitle         := 'Pagamentos a vencer';
              Preview;

            end;

            FreeAndNil(Q_RelPagtosVencer);

       end else if self.tag = 500 then
       begin

            Application.CreateForm(TQ_RelPagamentosPorCredores,  Q_RelPagamentosPorCredores);
            with Q_RelPagamentosPorCredores.cds_RelPagamentosPorCredores do
            begin

              Close;
              Params.ParamByName('pCredor').AsString := nomeDoCredorParaFiltrarBoletos;
              Open;

            end;

            with Q_RelPagamentosPorCredores do
            begin

              qryEmpresa.Active   := true;
              ReportTitle         := 'Pagamentos do credor';
              Preview;

            end;

            FreeAndNil(Q_RelPagamentosPorCredores);

       end else if self.tag = 600 then
       begin

            Application.CreateForm(TQ_RelPagtosVencidosPendentesCredor,  Q_RelPagtosVencidosPendentesCredor);
            with Q_RelPagtosVencidosPendentesCredor.cds_RelPagtosVencidosPendentesCredor do
            begin

              Close;
              Params.ParamByName('dataatual').AsDate := now;
              Params.ParamByName('pCredor').AsString := nomeDoCredorParaFiltrarBoletos;
              Open;

            end;

            with Q_RelPagtosVencidosPendentesCredor do
            begin

              qryEmpresa.Active   := true;
              ReportTitle         := 'Pagamentos pendentes do credor';
              Preview;

            end;

            FreeAndNil(Q_RelPagtosVencidosPendentesCredor);

      end else if self.tag = 700 then
       begin

            Application.CreateForm(TQ_RelPagtosVencidosFinalizadosCredor,  Q_RelPagtosVencidosFinalizadosCredor);
            with Q_RelPagtosVencidosFinalizadosCredor.cds_RelPagtosVencidosFinalizadosCredor do
            begin

              Close;
              Params.ParamByName('dataatual').AsDate := now;
              Params.ParamByName('pCredor').AsString := nomeDoCredorParaFiltrarBoletos;
              Open;

            end;

            with Q_RelPagtosVencidosFinalizadosCredor do
            begin

              qryEmpresa.Active   := true;
              ReportTitle         := 'Pagamentos pendentes do credor';
              Preview;

            end;

            FreeAndNil(Q_RelPagtosVencidosFinalizadosCredor);

       end else if self.tag = 800 then
       begin

            Application.CreateForm(TQ_RelPagtosVencerPendentesCredor,  Q_RelPagtosVencerPendentesCredor);
            with Q_RelPagtosVencerPendentesCredor.cds_RelPagtosVencerPendentesCredor do
            begin

              Close;
              Params.ParamByName('dataatual').AsDate := now;
              Params.ParamByName('pCredor').AsString := nomeDoCredorParaFiltrarBoletos;
              Open;

            end;

            with Q_RelPagtosVencerPendentesCredor do
            begin

              qryEmpresa.Active   := true;
              ReportTitle         := 'Pagamentos não vencidos e pendentes do credor';
              Preview;

            end;

            FreeAndNil(Q_RelPagtosVencerPendentesCredor);

       end else if self.tag = 900 then
       begin

            Application.CreateForm(TQ_RelMesAnoSelecionado,  Q_RelMesAnoSelecionado);
            with Q_RelMesAnoSelecionado.cds_RelMesAnoSelecionado do
            begin

              Close;
              Params.ParamByName('pMesAno').AsString := mesAnoSelecionado;
              Open;

            end;

            with Q_RelMesAnoSelecionado do
            begin

              qryEmpresa.Active   := true;
              ReportTitle         := 'Pagamentos não vencidos e pendentes do credor';
              Preview;

            end;

            FreeAndNil(Q_RelMesAnoSelecionado);

      end;


end;

end.



