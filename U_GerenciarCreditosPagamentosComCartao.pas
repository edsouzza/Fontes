unit U_GerenciarCreditosPagamentosComCartao;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,DateUtils, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus, EditNum;

type                                                                                          
  T_frmGerenciarCreditosPagosComCartao = class(TForm)
    pan_titulo: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    panel_total: TPanel;
    lbl37: TLabel;
    GridContas: TDBGrid;
    pan_botoes: TPanel;
    btnExcluir: TSpeedButton;
    btnSair: TSpeedButton;
    edtValorTotal: TStaticText;
    btnBaixar: TSpeedButton;
    cmbMeses: TComboBox;
    cmbAnos: TComboBox;
    imgPrimeiroReg: TImage;
    imgUltimoReg: TImage;
    rbPesquisar: TRadioButton;
    txtMsg: TStaticText;
    btnVoltarContinuar: TSpeedButton;
    lblStatusLogoff: TLabel;
    edtPesquisa: TEdit;

    //PROCEDIMENTOS PERSO
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure ExcluirCredito;
    procedure CalcularValorTotal;
    procedure PopularGridContasPagtosPendentesTresDias;
    procedure PopularGridContasMesAnoSelecionado;
    procedure MostrarTodosCreditosVencidos;
    procedure BaixarCredito;
    procedure PreencherComboAnos;
    procedure AtualizarCaixaAposMovimento;
    procedure AtualizarHistoricoAtivos;
    procedure PopularGridContas;
    procedure DesabilitarRadios;
    procedure Pesquisar;
    procedure ExecutarPesquisar;
    procedure VerificarContaProximaDoVencimento;
    procedure OcultarDadosBarra;
    procedure MostrarDadosBarra;

    //PROCEDIMENTOS PADRAO
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GridContasCellClick(Column: TColumn);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure imgPrimeiroRegClick(Sender: TObject);
    procedure imgUltimoRegClick(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
    procedure rbPesquisarClick(Sender: TObject);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnVoltarContinuarClick(Sender: TObject);
    procedure edtPesquisaClick(Sender: TObject);


  private
    { Private declarations }
    mesSelecionado, anoSelecionado, mesAnoSelecionado, motivoPagto, sParamFiltro: string;
    idVendaPagaNoCredito : integer;

  public
    { Public declarations }

    ValorSaldoAtualAposMovto,ValorSaldoAnterior,ValorMovimento,valorParcela    : double;
    NumParcela, NomeClienteGerarCredito : string;
    IDContaSelecionada : integer;

     procedure MostrarCreditosAbertosPeloMesAnoSelecionado;
     procedure MostrarCreditosPagosPeloMesAnoSelecionado;
     procedure MostrarCreditosPeloMesAnoSelecionado;
     procedure MostrarCreditosVencidosPeloMesAnoSelecionado;
     procedure MostrarCreditosNaoVencidosPeloMesAnoSelecionado;
     procedure MostrarCreditosVendaNaoVencidosPeloMesAnoSelecionado;
     procedure MostrarCreditosOrcsNaoVencidosPeloMesAnoSelecionado;
     procedure MostrarTodosCreditosBaixados;
     procedure MostrarTodosCreditosAbertos;

  end;

var
  _frmGerenciarCreditosPagosComCartao: T_frmGerenciarCreditosPagosComCartao;
            

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo, SqlExpr,DBClient, U_principal, DB, U_FecharPedido,
  U_EscolhaTipoPesquisaCreditos, U_ValorPagamentoDePendencia,
  U_EscolhaDeOpcaoParaPesquisarAtivosCreditos;


{$R *.dfm}

procedure T_frmGerenciarCreditosPagosComCartao.FormCreate(Sender: TObject);
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
    AbrirTabelas;

end;

procedure T_frmGerenciarCreditosPagosComCartao.FormShow(Sender: TObject);
begin     

      PreencherComboAnos;
      Caption := 'LOGADO POR '+NomeDoUsuarioLogado;
      VerificarContaProximaDoVencimento;

end;


procedure T_frmGerenciarCreditosPagosComCartao.PopularGridContasMesAnoSelecionado;
begin

        //popular o grid com as contas pendentes do mes e ano selecionados ou seja do mes em curso com data de vencimento >= data do dia

       _Sql := 'SELECT a.id_credito, a.cliente_id, a.orc_id, a.venda_id, a.parcela, a.doc, a.aut, a.valor, a.qde_parcelas, a.dtvencimento, a.datacad, a.mesano, a.status, '+
               'c.cli_id, c.cli_nome, '+
               'EXTRACT(DAY FROM a.dtvencimento), EXTRACT(MONTH FROM a.dtvencimento) '+
               'FROM ativos_credito a, clientes c '+
               'WHERE a.dtvencimento >= :pDtVencto '+
               'AND a.cliente_id = c.cli_id '+
               'AND a.status = '+QuotedStr('PENDENTE')+' '+
               'ORDER BY c.cli_nome, a.dtvencimento';

       with DM_Pesq.cdsPesqGeral do
       begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pDtVencto').AsDateTime := DataDoDia;
            Open;

       end;

      PreencherComboAnos;
      PopularGridContas;
      pan_titulo.Caption := inttostr(TotalRegs)+' créditos abertos/pendentes com vencimentos futuros';
      CalcularValorTotal;
      
end;


procedure T_frmGerenciarCreditosPagosComCartao.VerificarContaProximaDoVencimento;
var
  Dia_Atual, Trez_Proximos_Dias, Mes_Atual  : string;
begin

          // ESSE PROCEDIMENTO MOSTRARÁ NA TELA INICIAL AS PENDÊNCIAS COM VENCIMENTO DO DIA E DOS TRES PROXIMOS

          DataDoDia           := date;
          Trez_Proximos_Dias  := IntToStr(DayOf(DataDoDia)+3);
          Dia_Atual           := IntToStr(DayOf(DataDoDia));
          Mes_Atual           := IntToStr(MonthOf(DataDoDia));

         _Sql := 'SELECT a.id_credito, a.cliente_id, a.orc_id, a.venda_id, a.parcela, a.doc, a.aut, a.valor, a.qde_parcelas, a.dtvencimento, a.datacad, a.mesano, a.status, c.cli_nome, '+
                 'EXTRACT(DAY FROM a.dtvencimento), EXTRACT(MONTH FROM a.dtvencimento) '+
                 'FROM ativos_credito a, clientes c '+
                 'WHERE EXTRACT(DAY FROM a.dtvencimento) BETWEEN :pDia AND :pDiasProximos AND '+
                 'EXTRACT(MONTH FROM a.dtvencimento) = :pMes '+
                 'AND a.cliente_id = c.cli_id '+
                 'AND a.status = '+QuotedStr('PENDENTE')+' '+
                 'ORDER BY c.cli_nome, a.dtvencimento';

         with DM_Pesq.cdsPesqGeral do
         begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pDia').AsString          := Dia_Atual;
            Params.ParamByName('pDiasProximos').AsString := Trez_Proximos_Dias;
            Params.ParamByName('pMes').AsString          := Mes_Atual;
            Open;
            TotalRegs          := DM_Pesq.cdsPesqGeral.RecordCount;

             //se encontrar CREDITOS com vencimento de hoje a trez dias
             if not IsEmpty then
             begin

                  with txtMsg do
                  begin

                    Width   := 991;
                    Caption := 'Créditos com vencimento do dia e/ou dos três próximos requerem sua atenção. Clique em continuar...';
                    Visible := True;

                  end;

                  PopularGridContasPagtosPendentesTresDias;
                  CalcularValorTotal;

                  GridContas.Enabled         := false;
                  btnVoltarContinuar.Enabled := true;
                  btnVoltarContinuar.Caption := 'Continuar';
                  btnSair.Enabled            := false;
                  pan_titulo.Caption         := 'Créditos com vencimento do dia e/ou dos três próximos';

             end else
             begin

                 PopularGridContasMesAnoSelecionado;

             end;

         end;

end;

procedure T_frmGerenciarCreditosPagosComCartao.PopularGridContasPagtosPendentesTresDias;
begin

        TFloatField(DM_Pesq.cdsPesqGeral.FieldByName('valor')).DisplayFormat := '##0.00';

        with GridContas do
        begin

              DataSource:=  DM_Pesq.dsPesqGeral;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName         := 'CLI_NOME';
              Columns[0].Width             := 300;
              Columns[0].Font.color        := clblue;
              Columns[0].Font.Style        := [fsBold];
              Columns[0].Alignment         := taLeftJustify;
              Columns[0].Title.caption     := 'CLIENTE';
              Columns[0].Title.Font.Style  := [fsBold];
              Columns[0].Title.Alignment   := taLeftJustify;

              Columns.Add;
              Columns[1].FieldName         := 'PARCELA';
              Columns[1].Width             := 80;
              Columns[1].Font.color        := clblue;
              Columns[1].Font.Style        := [fsBold];
              Columns[1].Alignment         := taCenter;
              Columns[1].Title.caption     := 'PARCELA';
              Columns[1].Title.Font.Style  := [fsBold];
              Columns[1].Title.Alignment   := taCenter;

              Columns.Add;
              Columns[2].FieldName         := 'ORC_ID';
              Columns[2].Width             := 50;
              Columns[2].Font.color        := clblue;
              Columns[2].Font.Style        := [fsBold];
              Columns[2].Alignment         := taCenter;
              Columns[2].Title.caption     := 'ORC.';
              Columns[2].Title.Font.Style  := [fsBold];
              Columns[2].Title.Alignment   := taCenter;

               Columns.Add;
              Columns[3].FieldName         := 'VENDA_ID';
              Columns[3].Width             := 50;
              Columns[3].Font.color        := clblue;
              Columns[3].Font.Style        := [fsBold];
              Columns[3].Alignment         := taCenter;
              Columns[3].Title.caption     := 'VENDA';
              Columns[3].Title.Font.Style  := [fsBold];
              Columns[3].Title.Alignment   := taCenter;

              Columns.Add;
              Columns[4].FieldName         := 'AUT';
              Columns[4].Width             := 100;
              Columns[4].Font.color        := clblue;
              Columns[4].Font.Style        := [fsBold];
              Columns[4].Alignment         := taCenter;
              Columns[4].Title.caption     := 'TIPO';
              Columns[4].Title.Font.Style  := [fsBold];
              Columns[4].Title.Alignment   := taCenter;

              Columns.Add;
              Columns[5].FieldName         := 'VALOR';
              Columns[5].Width             := 100;
              Columns[5].Font.color        := clblue;
              Columns[5].Font.Style        := [fsBold];
              Columns[5].Alignment         := taRightJustify;
              Columns[5].Title.caption     := 'VALOR';
              Columns[5].Title.Font.Style  := [fsBold];
              Columns[5].Title.Alignment   := taRightJustify;

              Columns.Add;
              Columns[6].FieldName         := 'DTVENCIMENTO';
              Columns[6].Width             := 100;
              Columns[6].Font.color        := clblue;
              Columns[6].Font.Style        := [fsBold];
              Columns[6].Alignment         := taCenter;
              Columns[6].Title.caption     := 'VENCIMENTO';
              Columns[6].Title.Font.Style  := [fsBold];
              Columns[6].Title.Alignment   := taCenter;

              Columns.Add;
              Columns[7].FieldName         := 'MESANO';
              Columns[7].Width             := 80;
              Columns[7].Font.color        := clblue;
              Columns[7].Font.Style        := [fsBold];
              Columns[7].Alignment         := taCenter;
              Columns[7].Title.caption     := 'MES';
              Columns[7].Title.Font.Style  := [fsBold];
              Columns[7].Title.Alignment   := taCenter;

              Columns.Add;
              Columns[8].FieldName         := 'STATUS';
              Columns[8].Width             := 100;
              Columns[8].Font.color        := clblue;
              Columns[8].Font.Style        := [fsBold];
              Columns[8].Alignment         := taCenter;
              Columns[8].Title.caption     := 'STATUS';
              Columns[8].Title.Font.Style  := [fsBold];
              Columns[8].Title.Alignment   := taCenter;

        end;

        CalcularValorTotal;

end;

procedure T_frmGerenciarCreditosPagosComCartao.PopularGridContas;
begin

        TotalRegs          := DM_Pesq.cdsPesqGeral.RecordCount;
        TFloatField(DM_Pesq.cdsPesqGeral.FieldByName('valor')).DisplayFormat := '#,##0.00';

        with GridContas do
        begin

              DataSource:=  DM_Pesq.dsPesqGeral;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName         := 'CLI_NOME';
              Columns[0].Width             := 300;
              Columns[0].Font.color        := clblue;
              Columns[0].Font.Style        := [fsBold];
              Columns[0].Alignment         := taLeftJustify;
              Columns[0].Title.caption     := 'CLIENTE';
              Columns[0].Title.Font.Style  := [fsBold];
              Columns[0].Title.Alignment   := taLeftJustify;

              Columns.Add;
              Columns[1].FieldName         := 'PARCELA';
              Columns[1].Width             := 80;
              Columns[1].Font.color        := clblue;
              Columns[1].Font.Style        := [fsBold];
              Columns[1].Alignment         := taCenter;
              Columns[1].Title.caption     := 'PARCELA';  //'PARCELA/VENDA'
              Columns[1].Title.Font.Style  := [fsBold];
              Columns[1].Title.Alignment   := taCenter;

             Columns.Add;
              Columns[2].FieldName         := 'ORC_ID';
              Columns[2].Width             := 50;
              Columns[2].Font.color        := clblue;
              Columns[2].Font.Style        := [fsBold];
              Columns[2].Alignment         := taCenter;
              Columns[2].Title.caption     := 'ORC.';
              Columns[2].Title.Font.Style  := [fsBold];
              Columns[2].Title.Alignment   := taCenter;

               Columns.Add;
              Columns[3].FieldName         := 'VENDA_ID';
              Columns[3].Width             := 50;
              Columns[3].Font.color        := clblue;
              Columns[3].Font.Style        := [fsBold];
              Columns[3].Alignment         := taCenter;
              Columns[3].Title.caption     := 'VENDA';
              Columns[3].Title.Font.Style  := [fsBold];
              Columns[3].Title.Alignment   := taCenter;

              Columns.Add;
              Columns[4].FieldName         := 'AUT';
              Columns[4].Width             := 100;
              Columns[4].Font.color        := clblue;
              Columns[4].Font.Style        := [fsBold];
              Columns[4].Alignment         := taCenter;
              Columns[4].Title.caption     := 'TIPO';
              Columns[4].Title.Font.Style  := [fsBold];
              Columns[4].Title.Alignment   := taCenter;

              Columns.Add;
              Columns[5].FieldName         := 'VALOR';
              Columns[5].Width             := 100;
              Columns[5].Font.color        := clblue;
              Columns[5].Font.Style        := [fsBold];
              Columns[5].Alignment         := taRightJustify;
              Columns[5].Title.caption     := 'VALOR';
              Columns[5].Title.Font.Style  := [fsBold];
              Columns[5].Title.Alignment   := taRightJustify;

              Columns.Add;
              Columns[6].FieldName         := 'DTVENCIMENTO';
              Columns[6].Width             := 100;
              Columns[6].Font.color        := clblue;
              Columns[6].Font.Style        := [fsBold];
              Columns[6].Alignment         := taCenter;
              Columns[6].Title.caption     := 'VENCIMENTO';
              Columns[6].Title.Font.Style  := [fsBold];
              Columns[6].Title.Alignment   := taCenter;

              Columns.Add;
              Columns[7].FieldName         := 'MESANO';
              Columns[7].Width             := 80;
              Columns[7].Font.color        := clblue;
              Columns[7].Font.Style        := [fsBold];
              Columns[7].Alignment         := taCenter;
              Columns[7].Title.caption     := 'MES';
              Columns[7].Title.Font.Style  := [fsBold];
              Columns[7].Title.Alignment   := taCenter;

              Columns.Add;
              Columns[8].FieldName         := 'STATUS';
              Columns[8].Width             := 100;
              Columns[8].Font.color        := clblue;
              Columns[8].Font.Style        := [fsBold];
              Columns[8].Alignment         := taCenter;
              Columns[8].Title.caption     := 'STATUS';
              Columns[8].Title.Font.Style  := [fsBold];
              Columns[8].Title.Alignment   := taCenter;

              Options := [dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection];

        end;
end;


procedure T_frmGerenciarCreditosPagosComCartao.PreencherComboAnos;
var
  i : integer;
  AnoAtual, mesAtual : string;
begin

     //populando a comboano com os anos
     for i := 2000 to 3000 do
     begin

          cmbAnos.Items.Add(inttostr(i));

     end;

     DataDoDia    := date;

      //setando o ano vigente na comboano
     AnoAtual            := IntToStr(YearOf(DataDoDia));
     cmbAnos.ItemIndex   := Integer( cmbAnos.Items.IndexOf(AnoAtual) );


      //setando o mes vigente na combomes
      mesAtual           := IntToStr(MonthOf(DataDoDia));
      cmbMeses.ItemIndex := StrToInt(mesAtual)-1;

end;

procedure T_frmGerenciarCreditosPagosComCartao.AbrirTabelas;
begin

    dm_Conexao.cds_Caixa.Active        := true;

end;

procedure T_frmGerenciarCreditosPagosComCartao.FecharTabelas;
begin

    dm_Conexao.cds_Caixa.Active        := false;

end;

procedure T_frmGerenciarCreditosPagosComCartao.FecharAbrirTabelas;
begin
    dm_Conexao.cds_Caixa.Active       := false;
    dm_Conexao.cds_Caixa.Active       := true;

end;

procedure T_frmGerenciarCreditosPagosComCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    dm_Conexao.cds_HistoricoAtivos.Active := false;
    dm_Conexao.cds_Caixa.Active           := false;
    release;

end;

procedure T_frmGerenciarCreditosPagosComCartao.FormKeyPress(Sender: TObject;
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

procedure T_frmGerenciarCreditosPagosComCartao.GridContasCellClick(
  Column: TColumn);
begin

    IDContaSelecionada           := DM_Pesq.cdsPesqGeral.FieldByName('ID_CREDITO').AsInteger;   //ID_CREDITO
    idCreditoSelecionado         := DM_Pesq.cdsPesqGeral.FieldByName('ID_CREDITO').AsInteger;
    NomeClienteGerarCredito      := DM_Pesq.cdsPesqGeral.FieldByName('CLI_NOME').AsString;
    NumParcela                   := DM_Pesq.cdsPesqGeral.FieldByName('PARCELA').AsString;
    idcliente                    := DM_Pesq.cdsPesqGeral.FieldByName('CLI_ID').AsInteger;
    idVendaPagaNoCredito         := DM_Pesq.cdsPesqGeral.FieldByName('VENDA_ID').AsInteger;
    idOrcamentoSelecionado       := DM_Pesq.cdsPesqGeral.FieldByName('ORC_ID').AsInteger;

    if((TotalRegs > 0) and (DM_Pesq.cdsPesqGeral.FieldByName('status').AsString = 'PENDENTE'))then
    begin
      btnExcluir.Enabled           := true;
      btnBaixar.Enabled            := true;
    end else
    begin
      btnExcluir.Enabled           := false;
      btnBaixar.Enabled            := false;
    end;

    btnVoltarContinuar.Enabled   := true;
    panel_total.Enabled          := false;
    btnSair.Enabled              := false;
    motivoPagto:=  ifthen(DM_Pesq.cdsPesqGeral.FieldByName('DOC').AsString = 'PENDENCIA' , 'PAGAMENTO DE PENDENCIA', 'PAGAMENTO PARCELA DE CARTAO');

end;

procedure T_frmGerenciarCreditosPagosComCartao.btnBaixarClick(Sender: TObject);
begin

     With DM_Pesq.Qry_Geral do
      begin

          Close;
          SQL.Clear;
          SQL.Add('SELECT id_credito,status FROM ativos_credito WHERE id_credito = :pIDCredito AND status = '+QuotedStr('PENDENTE'));
          Params.ParamByName('pIDCredito').AsInteger :=  IDContaSelecionada;
          Open;

              if not IsEmpty then begin

                  BaixarCredito;
                  AtualizarCaixaAposMovimento;
                  AtualizarHistoricoAtivos;

              end else begin

                  Application.MessageBox('O crédito selecionado já esta finalizado!', 'Atenção verifique...!', MB_OK);

              end;

       end;

       DesabilitarRadios;

       if DM_Pesq.cdsPesqGeral.RecordCount = 0 then
       begin

           edtValorTotal.Caption := '0,00';

       end else begin

          CalcularValorTotal;

       end;

end;

procedure T_frmGerenciarCreditosPagosComCartao.BaixarCredito;
begin

       //baixar duplicata significa que o operador esta pagando-a e o valor deve ser creditado no caixa
       
       texto:= 'Confirma a baixa do crédito selecionado?';

       if Application.MessageBox(PChar(texto),'Recebendo o crédito',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

           //ABRE O FORMULARIO DE PAGAMENTO DE PENDENCIAS
           Application.CreateForm(T_frmValorCreditoPago,  _frmValorCreditoPago);
           _frmValorCreditoPago.ShowModal;
           FreeAndNil(_frmValorCreditoPago);
           
       end else begin

           DesabilitarRadios;

       end;

       VerificarContaProximaDoVencimento;
       CalcularValorTotal;
       panel_total.Enabled  := true;


end;

procedure T_frmGerenciarCreditosPagosComCartao.AtualizarCaixaAposMovimento;
begin

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

           ValorSaldoAtualAposMovto := ( ValorSaldoAnterior + valorDoPagamento );

           // ATUALIZANDO O CAIXA
           proxNum := GerarProximoID('id_caixa','caixa');

            with dm_Conexao.cds_Caixa do
            begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNum;
                FieldByName('id_venda').AsInteger        := idVendaPagaNoCredito;
                FieldByName('saldo_anterior').AsFloat    := ValorSaldoAnterior;
                FieldByName('valor_movimento').AsFloat   := valorDoPagamento;
                FieldByName('saldo_atual').AsFloat       := ValorSaldoAtualAposMovto;
                FieldByName('data').AsDateTime           := date;
                FieldByName('status').AsString           := 'A';

                FieldByName('historico').AsString :=  ifthen( motivoPagto = 'PAGAMENTO DE PENDENCIA' , 'PAGAMENTO PENDENCIA/ORC.'+IntToStr(idOrcamentoSelecionado)+' PARC.'+NumParcela, 'PAGAMENTO CARTÃO/PARCELA '+NumParcela);

                ApplyUpdates(0);

            end;

            FecharAbrirTabelas;

end;

procedure T_frmGerenciarCreditosPagosComCartao.AtualizarHistoricoAtivos;
begin

      // ATUALIZANDO O HISTORICO DE ATIVOS COM PAGAMENTO DO CREDITO ORIGINADO DA VENDA  
      proxNum := GerarProximoID('id_historicoativos','historico_ativos');

      dm_Conexao.cds_HistoricoAtivos.Active := TRUE;

      with dm_Conexao.cds_HistoricoAtivos do
       begin

        append;
        FieldByname('id_historicoativos').AsInteger   := proxNum;
        FieldByname('cliente_id').AsInteger           := idCliente;
        FieldByname('vendedor_id').AsInteger          := IdFuncionarioLogado(lblStatusLogoff.Caption);
        FieldByname('id_venda').AsInteger             := idVendaPagaNoCredito;
        FieldByname('vl_liquido').AsFloat             := ValorMovimento;
        FieldByName('historico').AsString             := 'PAGAMENTO DO ORC.N.'+ Inttostr(idVendaPagaNoCredito);
        FieldByName('flag_pagto').AsString            := 'PV';    //PAGAMENTO DE CREDITO REFERENTE A VENDA
        FieldByName('mesano').AsString                := gerarMesAno;
        FieldByname('data').AsDateTime                := date;

        ApplyUpdates(0);

      end;     

end;

procedure T_frmGerenciarCreditosPagosComCartao.btnSairClick(Sender: TObject);
begin

    GridContas.DataSource      := nil;
    close;
    release;

end;

procedure T_frmGerenciarCreditosPagosComCartao.btnExcluirClick(Sender: TObject);
begin

    ExcluirCredito;
    CalcularValorTotal;

end;

procedure T_frmGerenciarCreditosPagosComCartao.ExcluirCredito;
var
  texto : string;
begin

       texto:= 'Confirma a exclusão do crédito selecionado?';

       if Application.MessageBox(PChar(texto),'Exclusão de créditos',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

           with DM_Pesq.Qry_Geral do
           begin

                close;
                sql.Clear;
                sql.Add('DELETE FROM ativos_credito WHERE id_credito = :pIDCredito');
                Params.ParamByName('pIDCredito').AsInteger := IDContaSelecionada;
                ExecSQL();

           end;

           Application.MessageBox('O crédito foi excluído com sucesso!', 'OK!', MB_OK);
           LogOperacoes(NomeDoUsuarioLogado, 'exclusão de crédito cadastrado');
           DesabilitarRadios;
           VerificarContaProximaDoVencimento;

       end else
       begin

          btnExcluir.Enabled := false;
          FecharAbrirTabelas;
          DesabilitarRadios;

      end;

      DesabilitarRadios;
      panel_total.Enabled  := true;
      
end;

procedure T_frmGerenciarCreditosPagosComCartao.CalcularValorTotal;
var
   Total : double;
begin

      Total := 0;

      while not DM_Pesq.cdsPesqGeral.eof do
      begin

           Total := ( Total + DM_Pesq.cdsPesqGeral.fieldbyname('valor').asFloat );
           DM_Pesq.cdsPesqGeral.Next;
           edtValorTotal.Caption := Transform(Total);

      end;

end;

procedure T_frmGerenciarCreditosPagosComCartao.imgPrimeiroRegClick(Sender: TObject);
begin

    DM_Pesq.cdsPesqGeral.First;
    btnVoltarContinuar.Enabled := true;

end;

procedure T_frmGerenciarCreditosPagosComCartao.imgUltimoRegClick(Sender: TObject);
begin

    DM_Pesq.cdsPesqGeral.last;
    btnVoltarContinuar.Enabled := true;

end;

procedure T_frmGerenciarCreditosPagosComCartao.rbPesquisarClick(Sender: TObject);
begin

   Application.CreateForm(T_frmEscolhaTipoDePesquisaCreditos,  _frmEscolhaTipoDePesquisaCreditos);
   _frmEscolhaTipoDePesquisaCreditos.ShowModal;
   FreeAndNil(_frmEscolhaTipoDePesquisaCreditos);

   DesabilitarRadios;
   btnVoltarContinuar.Enabled   := true;
   panel_total.Enabled          := false;
   rbPesquisar.Checked          := false;
   btnSair.Enabled              := false;

end;

procedure T_frmGerenciarCreditosPagosComCartao.DesabilitarRadios;
begin

    btnExcluir.Enabled    := false;
    btnBaixar.Enabled     := false;

end;


procedure T_frmGerenciarCreditosPagosComCartao.edtNomeKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

     if KEY = VK_RETURN then
     begin

        btnSair.Enabled := true;
        TFloatField(DM_Pesq.cdsPesqGeral.FieldByName('valor')).DisplayFormat := '#,##0.00';

     end;

end;

procedure T_frmGerenciarCreditosPagosComCartao.MostrarCreditosPeloMesAnoSelecionado;
begin

      mesSelecionado    := cmbMeses.Text;
      anoSelecionado    := cmbAnos.Text;
      mesAnoSelecionado := mesSelecionado +'/'+ anoSelecionado;    // se refere a data de cadastramento


     _Sql := 'SELECT a.id_credito, a.cliente_id, a.orc_id, a.venda_id, a.parcela, a.doc, a.aut, a.valor, a.qde_parcelas, a.dtvencimento, a.datacad, a.mesano, a.status, '+
             'c.cli_id, c.cli_nome, '+
             'EXTRACT(DAY FROM a.dtvencimento), EXTRACT(MONTH FROM a.dtvencimento) '+
             'FROM ativos_credito a, clientes c '+
             'WHERE a.mesano = :pMesAno '+
             'AND a.cliente_id = c.cli_id '+
             'ORDER BY c.cli_nome, a.dtvencimento';


     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText := _Sql;
         Params.ParamByName('pMesAno').AsString := mesAnoSelecionado;
         open;
         TotalRegs          := DM_Pesq.cdsPesqGeral.RecordCount;

        if not IsEmpty then
        begin

              PopularGridContasPagtosPendentesTresDias;
              pan_titulo.Caption := inttostr(TotalRegs)+' créditos encontrados de '+ mesAnoSelecionado;

        end else begin

            GridContas.DataSource      := nil;
            GridContas.Enabled         := false;
            edtValorTotal.Caption      := '0,00';
            btnVoltarContinuar.Enabled := true;
            btnVoltarContinuar.Caption := 'Voltar';
            btnSair.Enabled            := false;
            PreencherComboAnos;

            with txtMsg do
            begin

              Width   := 991;
              Caption := 'A consulta não retornou resultados de créditos de '+ mesAnoSelecionado;
              Visible := True;

            end;

            pan_titulo.Caption := inttostr(TotalRegs)+' créditos encontrados de '+ mesAnoSelecionado;

       end;

     end;

end;

procedure T_frmGerenciarCreditosPagosComCartao.MostrarTodosCreditosVencidos;
begin    

     _Sql := 'SELECT a.id_credito, a.cliente_id, a.orc_id, a.venda_id, a.parcela, a.doc, a.aut, a.valor, a.qde_parcelas, a.dtvencimento, a.datacad, a.mesano, a.status, '+
             'c.cli_id, c.cli_nome, '+
             'EXTRACT(DAY FROM a.dtvencimento), EXTRACT(MONTH FROM a.dtvencimento) '+
             'FROM ativos_credito a, clientes c '+
             'WHERE a.dtvencimento < :pDtVencto '+
             'AND a.cliente_id = c.cli_id '+
             'AND a.status = '+QuotedStr('PENDENTE')+' '+
             'ORDER BY c.cli_nome, a.dtvencimento';

     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText := _Sql;
         Params.ParamByName('pDtVencto').AsDateTime := DataDoDia;
         open;
         TotalRegs          := DM_Pesq.cdsPesqGeral.RecordCount;
         if not IsEmpty then
         begin

              PopularGridContasPagtosPendentesTresDias;
              pan_titulo.Caption := 'Encontrados '+inttostr(TotalRegs)+' créditos vencidos/pendentes';

        end else begin

            GridContas.DataSource      := nil;
            GridContas.Enabled         := false;
            edtValorTotal.Caption      := '0,00';
            btnVoltarContinuar.Enabled := true;
            btnVoltarContinuar.Caption := 'Voltar';
            btnSair.Enabled            := false;
            PreencherComboAnos;

            with txtMsg do
            begin

              Width   := 991;
              Caption := 'A consulta não encontrou créditos vencidos até o momento';
              Visible := True;

            end;

            pan_titulo.Caption := 'A consulta não encontrou créditos vencidos até o momento';

       end;

     end;

end;

procedure T_frmGerenciarCreditosPagosComCartao.MostrarTodosCreditosAbertos;
begin

       //MOSTRA TODOS OS CREDITOS ABERTOS NO GERAL

     _Sql := 'SELECT a.id_credito, a.cliente_id, a.orc_id, a.venda_id, a.parcela, a.doc, a.aut, a.valor, a.qde_parcelas, a.dtvencimento, a.datacad, a.mesano, a.status, '+
             'c.cli_id, c.cli_nome, '+
             'EXTRACT(DAY FROM a.dtvencimento), EXTRACT(MONTH FROM a.dtvencimento) '+
             'FROM ativos_credito a, clientes c '+
             'WHERE a.cliente_id = c.cli_id '+
             'AND a.status = '+QuotedStr('PENDENTE')+' '+
             'ORDER BY c.cli_nome, a.dtvencimento';

     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText := _Sql;
         open;
         TotalRegs          := DM_Pesq.cdsPesqGeral.RecordCount;

        if not IsEmpty then
        begin

              PopularGridContasPagtosPendentesTresDias;
              pan_titulo.Caption := 'Encontrados '+inttostr(TotalRegs)+' créditos abertos e pendentes';

        end else begin

            GridContas.DataSource      := nil;
            GridContas.Enabled         := false;
            edtValorTotal.Caption      := '0,00';
            btnVoltarContinuar.Enabled := true;
            btnVoltarContinuar.Caption := 'Voltar';
            btnSair.Enabled            := false;
            PreencherComboAnos;

            with txtMsg do
            begin

              Width   := 991;
              Caption := 'A consulta não retornou resultados de créditos abertos e pendentes';
              Visible := True;

            end;

            pan_titulo.Caption := 'Encontrados '+inttostr(TotalRegs)+' créditos abertos e pendentes';

       end;

     end;


end;

procedure T_frmGerenciarCreditosPagosComCartao.MostrarCreditosVencidosPeloMesAnoSelecionado;
begin

      mesSelecionado    := cmbMeses.Text;
      anoSelecionado    := cmbAnos.Text;
      mesAnoSelecionado := mesSelecionado +'/'+ anoSelecionado;    // se refere a data de cadastramento


     _Sql := 'SELECT a.id_credito, a.cliente_id, a.orc_id, a.venda_id, a.parcela, a.doc, a.aut, a.valor, a.qde_parcelas, a.dtvencimento, a.datacad, a.mesano, a.status, '+
             'c.cli_id, c.cli_nome, '+
             'EXTRACT(DAY FROM a.dtvencimento), EXTRACT(MONTH FROM a.dtvencimento) '+
             'FROM ativos_credito a, clientes c '+
             'WHERE a.mesano = :pMesAno '+
             'AND a.dtvencimento < :pDtVencto '+
             'AND a.cliente_id = c.cli_id '+
             'AND a.status = '+QuotedStr('PENDENTE')+' '+
             'ORDER BY c.cli_nome, a.dtvencimento';

     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText := _Sql;
         Params.ParamByName('pDtVencto').AsDateTime := DataDoDia;
         Params.ParamByName('pMesAno').AsString     := mesAnoSelecionado;
         open;
         TotalRegs          := DM_Pesq.cdsPesqGeral.RecordCount;
         if not IsEmpty then
         begin

              PopularGridContasPagtosPendentesTresDias;
              pan_titulo.Caption := 'Encontrados '+inttostr(TotalRegs)+' créditos vencidos/pendentes de '+ mesAnoSelecionado;

        end else begin

            GridContas.DataSource      := nil;
            GridContas.Enabled         := false;
            edtValorTotal.Caption      := '0,00';
            btnVoltarContinuar.Enabled := true;
            btnVoltarContinuar.Caption := 'Voltar';
            btnSair.Enabled            := false;
            PreencherComboAnos;

            with txtMsg do
            begin

              Width   := 991;
              Caption := 'A consulta não retornou resultados de créditos vencidos/pendentes de '+ mesAnoSelecionado;
              Visible := True;

            end;

            pan_titulo.Caption := 'Encontrados '+inttostr(TotalRegs)+' créditos vencidos/pendentes de '+ mesAnoSelecionado;

       end;

     end;

end;

procedure T_frmGerenciarCreditosPagosComCartao.MostrarCreditosNaoVencidosPeloMesAnoSelecionado;
begin


     _Sql := 'SELECT a.id_credito, a.orc_id, a.venda_id, a.parcela, a.doc, a.aut, a.valor, a.qde_parcelas, a.dtvencimento, a.datacad, a.mesano, a.status, '+
             'v.id_venda, v.cliente_id, c.cli_id, c.cli_nome FROM ativos_credito a, venda v, clientes c WHERE dtvencimento >= :dataAtual AND '+
             'a.status = '+QuotedStr('PENDENTE')+' AND a.mesano = :pMesAno AND c.cli_id = v.cliente_id AND a.orc_id = v.orcamento_id ORDER BY c.cli_nome, a.parcela, a.dtvencimento';


     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText := _Sql;
         Params.ParamByName('pMesAno').AsString     := mesAnoSelecionado;
         Params.ParamByName('dataAtual').AsDateTime := DataDoDia;
         open;
         TotalRegs          := DM_Pesq.cdsPesqGeral.RecordCount;

        if not IsEmpty then
        begin

              PopularGridContasPagtosPendentesTresDias;
              pan_titulo.Caption := inttostr(TotalRegs)+' créditos não vencidos do mês e ano selecionados';

        end else begin

            GridContas.DataSource      := nil;
            GridContas.Enabled         := false;
            edtValorTotal.Caption      := '0,00';
            btnVoltarContinuar.Enabled := true;
            btnVoltarContinuar.Caption := 'Voltar';
            btnSair.Enabled            := false;
            PreencherComboAnos;

            with txtMsg do
            begin

              Width   := 991;
              Caption := 'A consulta não retornou resultados de créditos não vencidos e cadastrados em '+ mesAnoSelecionado;
              Visible := True;

            end;

            pan_titulo.Caption := inttostr(TotalRegs)+' créditos em aberto do mês e ano selecionados';

       end;

     end;

end;

procedure T_frmGerenciarCreditosPagosComCartao.MostrarCreditosPagosPeloMesAnoSelecionado;
begin

     //MOSTRA TODOS OS CREDITOS BAIXADOS DO MES/ANO SELECIONADO
     mesSelecionado    := cmbMeses.Text;
     anoSelecionado    := cmbAnos.Text;
     mesAnoSelecionado := mesSelecionado +'/'+ anoSelecionado;    // se refere a data de cadastramento

     _Sql := 'SELECT a.id_credito, a.cliente_id, a.orc_id, a.venda_id, a.parcela, a.doc, a.aut, a.valor, a.qde_parcelas, a.dtvencimento, a.datacad, a.mesano, a.status, '+
             'c.cli_id, c.cli_nome, '+
             'EXTRACT(DAY FROM a.dtvencimento), EXTRACT(MONTH FROM a.dtvencimento) '+
             'FROM ativos_credito a, clientes c '+
             'WHERE a.mesano = :pMesAno '+
             'AND a.cliente_id = c.cli_id '+
             'AND a.status = '+QuotedStr('FINALIZADO')+' '+
             'ORDER BY c.cli_nome, a.dtvencimento';

     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText := _Sql;
         Params.ParamByName('pMesAno').AsString := mesAnoSelecionado;
         open;
         TotalRegs          := DM_Pesq.cdsPesqGeral.RecordCount;

        if not IsEmpty then
        begin

              PopularGridContasPagtosPendentesTresDias;
              pan_titulo.Caption := inttostr(TotalRegs)+' créditos baixados/quitados em '+mesAnoSelecionado;

        end else begin

            GridContas.DataSource      := nil;
            GridContas.Enabled         := false;
            edtValorTotal.Caption      := '0,00';
            btnVoltarContinuar.Enabled := true;
            btnVoltarContinuar.Caption := 'Voltar';
            btnSair.Enabled            := false;
            PreencherComboAnos;

            with txtMsg do
            begin

              Width   := 991;
              Caption := 'A consulta não retornou resultados de créditos baixados/quitados em '+ mesAnoSelecionado;
              Visible := True;

            end;

            pan_titulo.Caption := inttostr(TotalRegs)+' créditos baixados/quitados em '+mesAnoSelecionado;

       end;

     end;

end;

procedure T_frmGerenciarCreditosPagosComCartao.MostrarCreditosAbertosPeloMesAnoSelecionado;
begin

     mesSelecionado    := cmbMeses.Text;
     anoSelecionado    := cmbAnos.Text;
     mesAnoSelecionado := mesSelecionado +'/'+ anoSelecionado;    // se refere ao mes da data de cadastramento

     _Sql := 'SELECT a.id_credito, a.cliente_id, a.orc_id, a.venda_id, a.parcela, a.doc, a.aut, a.valor, a.qde_parcelas, a.dtvencimento, a.datacad, a.mesano, a.status, '+
             'c.cli_id, c.cli_nome, '+
             'EXTRACT(DAY FROM a.dtvencimento), EXTRACT(MONTH FROM a.dtvencimento) '+
             'FROM ativos_credito a, clientes c '+
             'WHERE a.mesano = :pMesAno '+
             'AND a.cliente_id = c.cli_id '+
             'AND a.status = '+QuotedStr('PENDENTE')+' '+
             'ORDER BY c.cli_nome, a.dtvencimento';

     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText := _Sql;
         Params.ParamByName('pMesAno').AsString := mesAnoSelecionado;
         open;
         TotalRegs          := DM_Pesq.cdsPesqGeral.RecordCount;

        if not IsEmpty then
        begin

              PopularGridContasPagtosPendentesTresDias;
              pan_titulo.Caption := inttostr(TotalRegs)+' créditos abertos/pendentes de '+ mesAnoSelecionado;


        end else begin

            GridContas.DataSource      := nil;
            GridContas.Enabled         := false;
            edtValorTotal.Caption      := '0,00';
            btnVoltarContinuar.Enabled := true;
            btnVoltarContinuar.Caption := 'Voltar';
            btnSair.Enabled            := false;
            PreencherComboAnos;

            with txtMsg do
            begin

              Width   := 991;
              Caption := 'A consulta não retornou resultados de créditos abertos/pendentes de '+ mesAnoSelecionado;
              Visible := True;

            end;

            pan_titulo.Caption := inttostr(TotalRegs)+' créditos abertos/pendentes de '+ mesAnoSelecionado;

       end;

     end;

end;


procedure T_frmGerenciarCreditosPagosComCartao.btnVoltarContinuarClick(
  Sender: TObject);
begin

     GridContas.Enabled         := true;
     txtMsg.Visible             := false;
     pan_botoes.Enabled         := true;
     btnSair.Enabled            := true;
     btnExcluir.Enabled         := false;
     btnBaixar.Enabled          := false;
     panel_total.Enabled        := true;
     escolheuPesquisarPorNome   := false;
     escolheuPesquisarPorOrc    := false;
     escolheuPesquisarPorVenda  := false;
     btnVoltarContinuar.Caption := 'Voltar';
     btnVoltarContinuar.Enabled := false;
     MostrarDadosBarra;
     PopularGridContasMesAnoSelecionado;

end;

procedure T_frmGerenciarCreditosPagosComCartao.MostrarCreditosOrcsNaoVencidosPeloMesAnoSelecionado;
begin

     mesSelecionado    := cmbMeses.Text;
     anoSelecionado    := cmbAnos.Text;
     mesAnoSelecionado := mesSelecionado +'/'+ anoSelecionado;    // se refere ao mes da data de cadastramento

     _Sql := 'SELECT distinct a.id_credito, a.orc_id, a.venda_id, a.parcela, a.doc, a.aut, a.valor, a.qde_parcelas, a.dtvencimento, a.datacad, a.mesano, a.status, '+
             'v.id_venda, v.cliente_id, v.orcamento_id, c.cli_id, c.cli_nome FROM ativos_credito a, venda v, clientes c WHERE a.status = '+QuotedStr('PENDENTE')+' '+
             'AND a.mesano = :pMesAno AND c.cli_id = v.cliente_id AND a.orc_id = v.orcamento_id AND v.orcamento_id <> 0 ORDER BY c.cli_nome, a.parcela, a.dtvencimento';

     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText := _Sql;
         Params.ParamByName('pMesAno').AsString := mesAnoSelecionado;
         open;
         TotalRegs          := DM_Pesq.cdsPesqGeral.RecordCount;

        if not IsEmpty then
        begin

              PopularGridContasPagtosPendentesTresDias;
              pan_titulo.Caption := inttostr(TotalRegs)+' créditos em aberto do mês e ano selecionados';

        end else begin

            GridContas.DataSource      := nil;
            GridContas.Enabled         := false;
            edtValorTotal.Caption      := '0,00';
            btnVoltarContinuar.Enabled := true;
            btnVoltarContinuar.Caption := 'Voltar';
            btnSair.Enabled            := false;
            PreencherComboAnos;

            with txtMsg do
            begin

              Width   := 991;
              Caption := 'A consulta não retornou resultados de créditos em aberto e cadastrados em '+ mesAnoSelecionado;
              Visible := True;

            end;

            pan_titulo.Caption := inttostr(TotalRegs)+' créditos em aberto do mês e ano selecionados';

       end;

     end;

end;

procedure T_frmGerenciarCreditosPagosComCartao.MostrarCreditosVendaNaoVencidosPeloMesAnoSelecionado;
begin

     mesSelecionado    := cmbMeses.Text;
     anoSelecionado    := cmbAnos.Text;
     mesAnoSelecionado := mesSelecionado +'/'+ anoSelecionado;    // se refere ao mes da data de cadastramento

     _Sql := 'SELECT a.id_credito, a.orc_id, a.venda_id, a.parcela, a.doc, a.aut, a.valor, a.qde_parcelas, a.dtvencimento, a.datacad, a.mesano, a.status, '+
             'v.id_venda, v.cliente_id, v.orcamento_id, c.cli_id, c.cli_nome FROM ativos_credito a, venda v, clientes c WHERE a.status = '+QuotedStr('PENDENTE')+' '+
             'AND a.mesano = :pMesAno AND c.cli_id = v.cliente_id AND a.orc_id = v.orcamento_id AND v.orcamento_id = 0 ORDER BY c.cli_nome, a.parcela, a.dtvencimento';

     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText := _Sql;
         Params.ParamByName('pMesAno').AsString := mesAnoSelecionado;
         open;
         TotalRegs          := DM_Pesq.cdsPesqGeral.RecordCount;

        if not IsEmpty then
        begin

              PopularGridContasPagtosPendentesTresDias;
              pan_titulo.Caption := inttostr(TotalRegs)+' créditos em aberto do mês e ano selecionados';

        end else begin

            GridContas.DataSource      := nil;
            GridContas.Enabled         := false;
            edtValorTotal.Caption      := '0,00';
            btnVoltarContinuar.Enabled := true;
            btnVoltarContinuar.Caption := 'Voltar';
            btnSair.Enabled            := false;
            PreencherComboAnos;

            with txtMsg do
            begin

              Width   := 991;
              Caption := 'A consulta não retornou resultados de créditos em aberto e cadastrados em '+ mesAnoSelecionado;
              Visible := True;

            end;

            pan_titulo.Caption := inttostr(TotalRegs)+' créditos em aberto de '+mesAnoSelecionado;

       end;

     end;

end;

procedure T_frmGerenciarCreditosPagosComCartao.MostrarTodosCreditosBaixados;
begin

     //MOSTRA TODOS OS CREDITOS BAIXADOS NO GERAL

     _Sql := 'SELECT a.id_credito, a.cliente_id, a.orc_id, a.venda_id, a.parcela, a.doc, a.aut, a.valor, a.qde_parcelas, a.dtvencimento, a.datacad, a.mesano, a.status, '+
             'c.cli_id, c.cli_nome, '+
             'EXTRACT(DAY FROM a.dtvencimento), EXTRACT(MONTH FROM a.dtvencimento) '+
             'FROM ativos_credito a, clientes c '+
             'WHERE a.cliente_id = c.cli_id '+
             'AND a.status = '+QuotedStr('FINALIZADO')+' '+
             'ORDER BY c.cli_nome, a.dtvencimento';

     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText := _Sql;
         open;
         TotalRegs          := DM_Pesq.cdsPesqGeral.RecordCount;

        if not IsEmpty then
        begin

              PopularGridContasPagtosPendentesTresDias;
              pan_titulo.Caption := 'Encontrados '+inttostr(TotalRegs)+' créditos baixados/quitados';

        end else begin

            GridContas.DataSource      := nil;
            GridContas.Enabled         := false;
            edtValorTotal.Caption      := '0,00';
            btnVoltarContinuar.Enabled := true;
            btnVoltarContinuar.Caption := 'Voltar';
            btnSair.Enabled            := false;
            PreencherComboAnos;

            with txtMsg do
            begin

              Width   := 991;
              Caption := 'A consulta não retornou resultados de créditos baixados/quitados';
              Visible := True;

            end;

            pan_titulo.Caption := 'Encontrados '+inttostr(TotalRegs)+' créditos baixados/quitados';

       end;

     end;

end;


procedure T_frmGerenciarCreditosPagosComCartao.OcultarDadosBarra;
begin

    cmbMeses.Visible       :=false;
    cmbAnos.Visible        :=false;
    rbPesquisar.Visible    :=false;
    imgPrimeiroReg.Visible :=false;
    imgUltimoReg.Visible   :=false;
    edtPesquisa.Enabled    :=false;
    edtPesquisa.Clear;

end;

procedure T_frmGerenciarCreditosPagosComCartao.MostrarDadosBarra;
begin

    cmbMeses.Visible       :=true;
    cmbAnos.Visible        :=true;
    rbPesquisar.Visible    :=true;
    imgPrimeiroReg.Visible :=true;
    imgUltimoReg.Visible   :=true;
    edtPesquisa.Enabled    :=true;
    edtPesquisa.Text       :='Pesquisar';

end;

procedure T_frmGerenciarCreditosPagosComCartao.edtPesquisaClick(
  Sender: TObject);
begin

     Application.CreateForm(T_frmPesquisarOpcaoAtivoCredito,  _frmPesquisarOpcaoAtivoCredito);
     _frmPesquisarOpcaoAtivoCredito.ShowModal;
     FreeAndNil(_frmPesquisarOpcaoAtivoCredito);

     OcultarDadosBarra;

end;

procedure T_frmGerenciarCreditosPagosComCartao.ExecutarPesquisar;
begin
  //POR NOME DO CLIENTE
  if(escolheuPesquisarPorNome)then
  begin

     _Sql := 'SELECT a.id_credito, a.cliente_id, a.orc_id, a.venda_id, a.parcela, a.doc, a.aut, a.valor, a.qde_parcelas, a.dtvencimento, a.datacad, a.mesano, a.status, '+
             'c.cli_id, c.cli_nome, '+
             'EXTRACT(DAY FROM a.dtvencimento), EXTRACT(MONTH FROM a.dtvencimento) '+
             'FROM ativos_credito a, clientes c '+
             'WHERE a.cliente_id = c.cli_id '+
             'AND a.status = '+QuotedStr('PENDENTE')+' '+
             'AND  c.cli_nome LIKE ''%'+UpperCase(sParamFiltro)+'%'' '+
             'ORDER BY c.cli_nome, a.dtvencimento';

      with DM_Pesq.cdsPesqGeral do
      begin

            Close;
            CommandText:= (_Sql);
            Open;
            TotalRegs  := DM_Pesq.cdsPesqGeral.RecordCount;

            if not IsEmpty then
            begin

              pan_titulo.Caption := 'Encontrados '+inttostr(TotalRegs)+' créditos pendentes para '+LetrasIniciaisMaiusculas(DM_Pesq.cdsPesqGeral.fieldbyname('cli_nome').asstring);
              TFloatField(DM_Pesq.cdsPesqGeral.FieldByName('valor')).DisplayFormat := '#,##0.00';
              CalcularValorTotal;
              btnVoltarContinuar.Enabled := true;
              btnSair.Enabled            := false;

            end else
            begin

                  GridContas.DataSource      := nil;
                  GridContas.Enabled         := false;
                  edtValorTotal.Caption      := '0,00';
                  btnVoltarContinuar.Enabled := true;
                  btnVoltarContinuar.Caption := 'Voltar';
                  btnSair.Enabled            := false;
                  PreencherComboAnos;

                  with txtMsg do
                  begin

                    Width   := 991;
                    Caption := 'Não foram encontrados registros em relação ao nome digitado';
                    Visible := True;

                  end;
                    pan_titulo.Caption := 'Não foram encontrados registros em relação ao nome digitado';
                end;

            end;

  end else //PELO NUMERO DA VENDA
  if(escolheuPesquisarPorVenda)then
  begin

         _Sql :=  'SELECT a.id_credito, a.cliente_id, a.orc_id, a.venda_id, a.parcela, a.doc, a.aut, a.valor, a.qde_parcelas, a.dtvencimento, a.datacad, a.mesano, a.status, '+
                 'c.cli_id, c.cli_nome, '+
                 'EXTRACT(DAY FROM a.dtvencimento), EXTRACT(MONTH FROM a.dtvencimento) '+
                 'FROM ativos_credito a, clientes c '+
                 'WHERE a.cliente_id = c.cli_id '+
                 'AND a.status = '+QuotedStr('PENDENTE')+' '+
                 'AND a.venda_id LIKE  ''%'+( sParamFiltro )+'%'' '+
                 'ORDER BY c.cli_nome, a.dtvencimento';

          with DM_Pesq.cdsPesqGeral do
          begin

                Close;
                CommandText:= (_Sql);
                Open;
                TotalRegs := DM_Pesq.cdsPesqGeral.RecordCount;

                if not IsEmpty then
                begin

                  pan_titulo.Caption := 'Encontrados '+inttostr(TotalRegs)+' créditos pendentes para a venda nº. '+sParamFiltro;
                  TFloatField(DM_Pesq.cdsPesqGeral.FieldByName('valor')).DisplayFormat := '#,##0.00';
                  CalcularValorTotal;
                  btnVoltarContinuar.Enabled := true;
                  btnSair.Enabled            := false;

               end else
               begin

                  GridContas.DataSource      := nil;
                  GridContas.Enabled         := false;
                  edtValorTotal.Caption      := '0,00';
                  btnVoltarContinuar.Enabled := true;
                  btnVoltarContinuar.Caption := 'Voltar';
                  btnSair.Enabled            := false;
                  PreencherComboAnos;

                  with txtMsg do
                  begin

                    Width   := 991;
                    Caption := 'Não foram encontrados registros em relação a venda n.'+sParamFiltro;
                    Visible := True;

                  end;
                    pan_titulo.Caption := 'Não foram encontrados registros em relação a venda n.'+sParamFiltro;
                end;

            end;

    end else  //PELO NUMERO DO ORÇAMENTO
    if(escolheuPesquisarPorOrc)then
    begin

           _Sql := 'SELECT a.id_credito, a.cliente_id, a.orc_id, a.venda_id, a.parcela, a.doc, a.aut, a.valor, a.qde_parcelas, a.dtvencimento, a.datacad, a.mesano, a.status, '+
                   'c.cli_id, c.cli_nome, EXTRACT(DAY FROM a.dtvencimento), EXTRACT(MONTH FROM a.dtvencimento) '+
                   'FROM ativos_credito a, clientes c '+
                   'WHERE a.cliente_id = c.cli_id '+
                   'AND a.status = '+QuotedStr('PENDENTE')+' '+
                   'AND a.orc_id LIKE  ''%'+( sParamFiltro )+'%'' '+
                   'ORDER BY c.cli_nome, a.dtvencimento';

            with DM_Pesq.cdsPesqGeral do
            begin

                  Close;
                  CommandText:= (_Sql);
                  Open;
                  TotalRegs := DM_Pesq.cdsPesqGeral.RecordCount;

                  if not IsEmpty then
                  begin

                      pan_titulo.Caption := 'Encontrados '+inttostr(TotalRegs)+' créditos pendentes para o orçamento nº. '+sParamFiltro;
                      TFloatField(DM_Pesq.cdsPesqGeral.FieldByName('valor')).DisplayFormat := '#,##0.00';
                      CalcularValorTotal;
                      btnVoltarContinuar.Enabled := true;
                      btnSair.Enabled            := false;

                  end else
                  begin

                      GridContas.DataSource      := nil;
                      GridContas.Enabled         := false;
                      edtValorTotal.Caption      := '0,00';
                      btnVoltarContinuar.Enabled := true;
                      btnVoltarContinuar.Caption := 'Voltar';
                      btnSair.Enabled            := false;
                      PreencherComboAnos;

                      with txtMsg do
                      begin

                        Width   := 991;
                        Caption := 'Não foram encontrados registros em relação ao orçamento n.'+sParamFiltro;
                        Visible := True;

                      end;
                        pan_titulo.Caption := 'Não foram encontrados registros em relação ao orçamento n.'+sParamFiltro;
                    end;

                end;
        end;

end;


procedure T_frmGerenciarCreditosPagosComCartao.Pesquisar;
begin

    OcultarDadosBarra;

    repeat
    if(escolheuPesquisarPorNome)then
    begin
      sParamFiltro := InputBox('Entre com parte do nome', 'Digite o nome do cliente', '');
    end else if(escolheuPesquisarPorOrc)then
    begin
      sParamFiltro := InputBox('Entre com o número do orçamento', 'Digite o número do orçamento', '');
    end else if(escolheuPesquisarPorVenda)then
    begin
      sParamFiltro := InputBox('Entre com o número da venda', 'Digite o número da venda', '');
    end else
    until (sParamFiltro <> '');              //nao sai da tela enquanto nao digitar um valor

    if( sParamFiltro <>'0')then
    begin
        ExecutarPesquisar;
    end else
    begin
        Application.MessageBox('Digite um valor válido para pesquisa!', 'Valor inválido!', MB_OK + MB_ICONWARNING);
        btnVoltarContinuarClick(self);
        btnVoltarContinuar.Enabled :=true;
        btnSair.Enabled            :=false;
        GridContas.Enabled         :=false;
        GridContas.DataSource      :=nil;
        edtValorTotal.Caption      := '0,00';
        pan_titulo.Caption         := 'Valor de pesquisa inválido';
    end;

end;

end.





