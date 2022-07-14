unit U_Financeiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr, DateUtils,
  ToolEdit;

type
  T_frmFinanceiro = class(TForm)
    pan_titulo: TPanel;
    pangrid_visualizacao: TPanel;
    pan_botoes: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    lstTiposDeRelatorio: TListBox;
    pnl_Periodo: TPanel;
    lbl41: TLabel;
    edt_DataInicio: TDateEdit;
    lbl42: TLabel;
    edt_DataFim: TDateEdit;
    btnFecharFinanceiro: TSpeedButton;
    lblStatusLogoff: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharFinanceiroClick(Sender: TObject);
    procedure lstTiposDeRelatorioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_DataFimButtonClick(Sender: TObject);
    procedure edt_DataFimMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edt_DataInicioMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure edt_DataInicioButtonClick(Sender: TObject);
    procedure edt_DataFimChange(Sender: TObject);
    procedure edt_DataFimClick(Sender: TObject);
    procedure PesquisarPeriodoVendas;
    procedure MostrarQdeClientes;
    procedure destruirRelatorios;


  private
    { Private declarations }
  public
  QdeClientes : Integer;

    { Public declarations }
     DataInicioFormaPgto : TDate;
     DataFimFormaPgto    : TDate;

  end;

var
  _frmFinanceiro: T_frmFinanceiro;
  proxNum : Integer;


implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo,
  U_QRelLucroVendaProdutos, U_QRelDespesasCompras, U_QRelPagtoBoletos,
  U_QRelRetiradasDoCaixa, U_QRelVendasFechadas, U_ConsVendasPorClientes,
  U_Atendimentos, U_EscolhaFormaDePagamentoParaRelatorios,
  U_ConsultaVendas, U_QRelAtendimentos, U_QRelVendasComFormaPagamento,
  U_QRelSaidaProdutos, U_QRelClientesVendas, DB, DBClient,
  U_QRelDuplicatasFinalizadas, U_QRelCreditosRecebidos,
  U_QRelFaturamentoDiario, U_QRelMovimentoMensalCaixa,
  U_QRelPorTipoDePagamentoDinheiro,
  U_principal, U_QRelPorTipoDePagamentoCredito,
  U_QRelPorTipoDePagamentoDebito, U_QRelPorTipoDePagamentoParcelado;

{$R *.dfm}


procedure T_frmFinanceiro.FormCreate(Sender: TObject);
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

    lblDataDoDia.Caption    :=  DateToStr(now);
    lblHoraAtual.Caption    :=  timetoStr(time);
    lblStatusLogoff.Caption := NomeDoUsuarioLogado;
    edt_DataInicio.Date     := Date;
    edt_DataFim.Date        := date;

    DataInicio              := edt_DataInicio.Date ;
    DataFim                 := edt_DataFim.Date;

end;

procedure T_frmFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    destruirRelatorios;
    Caption := 'LOGADO POR '+NomeDoUsuarioLogado;
    Release;

end;


procedure T_frmFinanceiro.btnFecharFinanceiroClick(Sender: TObject);
begin
    _frmPrincipal.logo.Visible := true;
    release;
    Close;
end;

procedure T_frmFinanceiro.lstTiposDeRelatorioClick(Sender: TObject);
begin

      DataInicio     := StrToDate(edt_DataInicio.text);
      DataFim        := StrToDate(edt_DataFim.text);
      periodo        := edt_DataInicio.Text+' a '+edt_DataFim.Text;

      if lstTiposDeRelatorio.Items[lstTiposDeRelatorio.ItemIndex] = 'DESPESAS COM PAGAMENTO     DE    BOLETOS' then
      begin

          Application.CreateForm(TQ_RelPagtoBoletos,  Q_RelPagtoBoletos);
          with Q_RelPagtoBoletos.cds_RelPagtoBoletos do
           begin

              Close;
              Params.ParamByName('datainicial').AsDate := DataInicio;
              Params.ParamByName('datafinal').AsDate   := DataFim;
              Open;

             if not IsEmpty then
             begin

                     Q_RelPagtoBoletos.cds_RelPagtoBoletos.Active:= True;
                     Q_RelPagtoBoletos.reporttitle := 'DESPESAS COM PAGAMENTO DE BOLETOS PERÍODO : '+periodo;
                     Q_RelPagtoBoletos.Preview;
                     lstTiposDeRelatorio.Enabled := False;
                     edt_DataInicio.Text := DateToStr(now);
                     edt_DataFim.Text    := DateToStr(now);
                     destruirRelatorios;

                end else
                begin
                     texto := 'A  pesquisa não encontrou valores de pagamento de boletos neste período : '+periodo;
                     Application.MessageBox(PChar(texto),'Pagamento de boletos!', MB_OK + MB_ICONWARNING);
                      lstTiposDeRelatorio.Enabled := False;
                     edt_DataInicio.Text := DateToStr(now);
                     edt_DataFim.Text    := DateToStr(now);
                     destruirRelatorios;

                end;
          end;

      end else

      if lstTiposDeRelatorio.Items[lstTiposDeRelatorio.ItemIndex] = 'DESPESAS PAGAS COM RETIRADAS  DO  CAIXA' then
      begin

          Application.CreateForm(TQ_RelRetiradasDoCaixa,  Q_RelRetiradasDoCaixa);
          with Q_RelRetiradasDoCaixa.cds_RetiradasDoCaixa do
           begin

              Close;
              Params.ParamByName('datainicial').AsDate := DataInicio;
              Params.ParamByName('datafinal').AsDate   := DataFim;
              Open;

             if not IsEmpty then
             begin

                     Q_RelRetiradasDoCaixa.cds_RetiradasDoCaixa.Active:= True;
                     Q_RelRetiradasDoCaixa.reporttitle := 'RELATÓRIO DE RETIRADAS DO CAIXA PERÍODO : '+periodo;
                     Q_RelRetiradasDoCaixa.Preview;
                     lstTiposDeRelatorio.Enabled := False;
                     edt_DataInicio.Text := DateToStr(now);
                     edt_DataFim.Text    := DateToStr(now);
                     destruirRelatorios;

                end else
                begin
                     texto := 'A pesquisa não encontrou valores com despesas retiradas do caixa neste período : '+periodo;
                     Application.MessageBox(PChar(texto),'Retiradas do caixa!', MB_OK + MB_ICONWARNING);
                      lstTiposDeRelatorio.Enabled := False;
                     edt_DataInicio.Text := DateToStr(now);
                     edt_DataFim.Text    := DateToStr(now);
                     destruirRelatorios;

                end;
          end;

      end else

      if lstTiposDeRelatorio.Items[lstTiposDeRelatorio.ItemIndex] = 'CRÉDITOS RECEBIDOS A TITULO  PENDENCIAS' then
      begin

           Application.CreateForm(TQ_RelCreditosRecebidos,  Q_RelCreditosRecebidos);
           with Q_RelCreditosRecebidos.cds_RelCreditosRecebidos do
           begin

              Close;
              Params.ParamByName('datainicial').AsDate := DataInicio;
              Params.ParamByName('datafinal').AsDate   := DataFim;
              Open;

            if not IsEmpty then
             begin

                     Q_RelCreditosRecebidos.cds_RelCreditosRecebidos.Active:= True;
                     Q_RelCreditosRecebidos.reporttitle := 'CRÉDITOS RECEBIDOS A TITULO PENDENCIAS PERÍODO : '+periodo;
                     Q_RelCreditosRecebidos.Preview;
                     lstTiposDeRelatorio.Enabled := False;
                     edt_DataInicio.Text := DateToStr(now);
                     edt_DataFim.Text    := DateToStr(now);
                     destruirRelatorios;

                end else
                begin
                     texto := 'A  pesquisa  não  encontrou  valores recbidos a título de pendências neste período : '+periodo;
                     Application.MessageBox(PChar(texto),'Recebimento de pendências!', MB_OK + MB_ICONWARNING);
                      lstTiposDeRelatorio.Enabled := False;
                     edt_DataInicio.Text := DateToStr(now);
                     edt_DataFim.Text    := DateToStr(now);
                     destruirRelatorios;

                end;
          end;

      end else

      if lstTiposDeRelatorio.Items[lstTiposDeRelatorio.ItemIndex] = 'CRÉDITOS RECEBIDOS   DE  VENDAS / ORÇAM.' then
      begin

           Application.CreateForm(TQ_RelMovimentoMensal,  Q_RelMovimentoMensal);
           with Q_RelMovimentoMensal.cds_RelMovimentosMensais do
           begin

              Close;
              Params.ParamByName('pdataini').AsDate   := DataInicio;
              Params.ParamByName('pdatafim').AsDate   := DataFim;
              Open;

           if not IsEmpty then
           begin

                   Q_RelMovimentoMensal.cds_RelMovimentosMensais.Active:= True;
                   Q_RelMovimentoMensal.reporttitle := 'CRÉDITOS RECEBIDOS DE VENDAS E ORÇAMENTOS PERÍODO : '+periodo;
                   Q_RelMovimentoMensal.Preview;
                   lstTiposDeRelatorio.Enabled := False;
                   edt_DataInicio.Text := DateToStr(now);
                   edt_DataFim.Text    := DateToStr(now);
                   destruirRelatorios;

              end else
              begin
                   texto := 'A  pesquisa  não  encontrou  valores recebidos a título de'#13'orçamento/venda neste período : '+periodo;
                   Application.MessageBox(PChar(texto),'Recebimento de orçamentos/vendas!', MB_OK + MB_ICONWARNING);
                   lstTiposDeRelatorio.Enabled := False;
                   edt_DataInicio.Text := DateToStr(now);
                   edt_DataFim.Text    := DateToStr(now);
                   destruirRelatorios;

              end;
          end;

       end else

      if lstTiposDeRelatorio.Items[lstTiposDeRelatorio.ItemIndex] = 'CRÉDITOS RECEBIDOS A TITULO DE DINHEIRO' then
      begin

           Application.CreateForm(TQ_RelPorTipoDePagamentoDinheiro,  Q_RelPorTipoDePagamentoDinheiro);
           with Q_RelPorTipoDePagamentoDinheiro.cds_RelTiposPagtos do
           begin

              Close;
              Params.ParamByName('pdataini').AsDate   := DataInicio;
              Params.ParamByName('pdatafim').AsDate   := DataFim;
              Open;

            if not IsEmpty then
              begin

                   Q_RelPorTipoDePagamentoDinheiro.cds_RelTiposPagtos.Active:= True;
                   Q_RelPorTipoDePagamentoDinheiro.reporttitle := 'CRÉDITOS RECEBIDOS EM DINHEIRO PERÍODO : '+periodo;
                   Q_RelPorTipoDePagamentoDinheiro.Preview;
                   lstTiposDeRelatorio.Enabled := False;
                   edt_DataInicio.Text         := DateToStr(now);
                   edt_DataFim.Text            := DateToStr(now);
                   edt_DataFim.Enabled         := False;
                   destruirRelatorios;

              end else
              begin
                   texto := 'A pesquisa não encontrou valores recebidos a título de dinheiro neste período : '+periodo;
                   Application.MessageBox(PChar(texto),'Recebimentos a dinheiro!', MB_OK + MB_ICONWARNING);
                   lstTiposDeRelatorio.Enabled := False;
                   edt_DataInicio.Text := DateToStr(now);
                   edt_DataFim.Text    := DateToStr(now);
                   edt_DataFim.Enabled         := False;
                   destruirRelatorios;

              end;
          end;
           
       end else

      if lstTiposDeRelatorio.Items[lstTiposDeRelatorio.ItemIndex] = 'CRÉDITOS  RECEBIDOS CARTÃO  DE  CRÉDITO' then
      begin

           Application.CreateForm(TQ_RelPorTipoDePagamentoCredito,  Q_RelPorTipoDePagamentoCredito);
           with Q_RelPorTipoDePagamentoCredito.cds_RelTiposPagtos do
           begin

              Close;
              Params.ParamByName('pdataini').AsDate   := DataInicio;
              Params.ParamByName('pdatafim').AsDate   := DataFim;
              Open;

              if not IsEmpty then
              begin

                   Q_RelPorTipoDePagamentoCredito.cds_RelTiposPagtos.Active:= True;
                   Q_RelPorTipoDePagamentoCredito.reporttitle := 'CRÉDITOS RECEBIDOS DE CARTÃO DE CRÉDITO PERÍODO : '+periodo;
                   Q_RelPorTipoDePagamentoCredito.Preview;
                   lstTiposDeRelatorio.Enabled := False;
                   edt_DataInicio.Text := DateToStr(now);
                   edt_DataFim.Text    := DateToStr(now);
                   destruirRelatorios;

              end else
              begin
                   texto := 'A  pesquisa  não  encontrou  valores recebidos a título de cartão de crédito neste período : '+periodo;
                   Application.MessageBox(PChar(texto),'Recebimentos com cartão de crédito!', MB_OK + MB_ICONWARNING);
                   lstTiposDeRelatorio.Enabled := False;
                   edt_DataInicio.Text := DateToStr(now);
                   edt_DataFim.Text    := DateToStr(now);
                   destruirRelatorios;

              end;
          end;
       end else

      if lstTiposDeRelatorio.Items[lstTiposDeRelatorio.ItemIndex] = 'CRÉDITOS  RECEBIDOS   CARTÃO   DE  DÉBITO' then
      begin

           Application.CreateForm(TQ_RelPorTipoDePagamentoDebito,  Q_RelPorTipoDePagamentoDebito);
           with Q_RelPorTipoDePagamentoDebito.cds_RelTiposPagtos do
           begin

              Close;
              Params.ParamByName('pdataini').AsDate   := DataInicio;
              Params.ParamByName('pdatafim').AsDate   := DataFim;
              Open;

             if not IsEmpty then
              begin

                   Q_RelPorTipoDePagamentoDebito.cds_RelTiposPagtos.Active:= True;
                   Q_RelPorTipoDePagamentoDebito.reporttitle := 'CRÉDITOS RECEBIDOS DE CARTÃO DE DÉBITO PERÍODO : '+periodo;
                   Q_RelPorTipoDePagamentoDebito.Preview;
                   lstTiposDeRelatorio.Enabled := False;
                   edt_DataInicio.Text := DateToStr(now);
                   edt_DataFim.Text    := DateToStr(now);
                   destruirRelatorios;

              end else
              begin
                   texto := 'A pesquisa não encontrou valores recebidos a título de cartão de débido neste período : '+periodo;
                   Application.MessageBox(PChar(texto),'Recebimentos com cartão de débido!', MB_OK + MB_ICONWARNING);
                    lstTiposDeRelatorio.Enabled := False;
                   edt_DataInicio.Text := DateToStr(now);
                   edt_DataFim.Text    := DateToStr(now);
                   destruirRelatorios;

              end;
          end;

      end else

      if lstTiposDeRelatorio.Items[lstTiposDeRelatorio.ItemIndex] = 'CRÉDITOS  RECEBIDOS   VIA   PARCELAMENTO' then
      begin

           Application.CreateForm(TQ_RelPorTipoDePagamentoParcelado,  Q_RelPorTipoDePagamentoParcelado);
           with Q_RelPorTipoDePagamentoParcelado.cds_RelTiposPagtos do
           begin

              Close;
              Params.ParamByName('pdataini').AsDate   := DataInicio;
              Params.ParamByName('pdatafim').AsDate   := DataFim;
              Open;

             if not IsEmpty then
              begin

                   Q_RelPorTipoDePagamentoParcelado.cds_RelTiposPagtos.Active:= True;
                   Q_RelPorTipoDePagamentoParcelado.reporttitle := 'CRÉDITOS RECEBIDOS DE PARCELAMENTOS PERÍODO : '+periodo;
                   Q_RelPorTipoDePagamentoParcelado.Preview;
                   lstTiposDeRelatorio.Enabled := False;
                   edt_DataInicio.Text := DateToStr(now);
                   edt_DataFim.Text    := DateToStr(now);
                   destruirRelatorios;

              end else
              begin
                   texto := 'A  pesquisa  não  encontrou  valores  recebidos  a  título  de'#13'parcelamento neste período : '+periodo;
                   Application.MessageBox(PChar(texto),'Rebebimentos de parcelamentos!', MB_OK + MB_ICONWARNING);
                   lstTiposDeRelatorio.Enabled := False;
                   edt_DataInicio.Text := DateToStr(now);
                   edt_DataFim.Text    := DateToStr(now);
                   destruirRelatorios;
              end;
          end;

      end;

end;

procedure T_frmFinanceiro.MostrarQdeClientes;
begin

   {O objetivo é de mostrar a quantidade de clientes que foram atendidos no período não levando em conta os nomes repetidos}

           _Sql:= 'SELECT DISTINCT v.cliente_id, c.cli_id, c.cli_nome, v.data_venda FROM '+
                  'clientes c, venda v WHERE v.data_venda '+
                  'BETWEEN :datainicial AND :datafinal    '+
                  'AND                                    '+
                  'v.cliente_id = c.cli_id                '+
                  'AND                                    '+
                  'c.cli_nome <> :pNome                   '+
                  'ORDER BY v.data_venda, c.cli_nome';

           with DM_Pesq.cdsPesqGeral do
           begin

               close;
               CommandText :=(_Sql);
               Params.ParamByName('pNome').AsString      := 'VENDA BALCAO';
               Params.ParamByName('datainicial').AsDate  := DataInicio;
               Params.ParamByName('datafinal').AsDate    := DataFim;
               open;
               
               if not IsEmpty then
               begin

                  QdeClientes := DM_Pesq.cdsPesqGeral.RecordCount;
                  Q_RelClientesVendas.lblQdeClientes.Caption := IntToStr(QdeClientes);

               end;

           end;          

end;


procedure T_frmFinanceiro.PesquisarPeriodoVendas;
var
  DataInicio, DataFim : TDate;
begin

        DataInicio     := StrToDate(edt_DataInicio.text);
        DataFim        := StrToDate(edt_DataFim.text);
         
        if flag = 100 then
        begin

             DataInicioFormaPgto     := StrToDate(edt_DataInicio.text);
             DataFimFormaPgto        := StrToDate(edt_DataFim.text);

             Application.CreateForm(TQ_RelVendasFechadas,  Q_RelVendasFechadas);
             with Q_RelVendasFechadas.cds_RelVendasFechadas do
             begin

                Close;
                Params.ParamByName('datainicio').AsDate := DataInicio;
                Params.ParamByName('datafim').AsDate    := DataFim;
                Open;

              if IsEmpty then
                 begin

                         Application.MessageBox('Não foram encontrados registros no período selecionado!',
                         'Atenção...', MB_OK + MB_ICONWARNING);
                         lstTiposDeRelatorio.Enabled  := false;
                         exit;

               end else begin

                     Q_RelVendasFechadas.cds_RelVendasFechadas.Active:= True;
                     Q_RelVendasFechadas.Preview;
                     lstTiposDeRelatorio.Enabled  := false;
                     edt_datainicio.text   := '  /  /    ';
                     edt_DataFim.Date      := date;
                     destruirRelatorios;
                end;

              end;

        end;

        if flag = 200 then
        begin

             DataInicio     := StrToDate(edt_DataInicio.text);
             DataFim        := StrToDate(edt_DataFim.text);

             dm_DadosSegundo.cds_Venda.Active := true;

             with Q_RelVendasComFormaPagto.cds_RelVendaEFormaPagto do
             begin

                Close;
                Params.ParamByName('datainicio').AsDate      := DataInicio;
                Params.ParamByName('datafim').AsDate         := DataFim;
                Open;

             if IsEmpty then
             begin

                     Application.MessageBox('Não foram encontrados registros no período selecionado!',
                     'Atenção...', MB_OK + MB_ICONWARNING);
                     lstTiposDeRelatorio.Enabled  := false;
                     exit;

            end else begin

                   Application.CreateForm(TQ_RelVendasComFormaPagto,  Q_RelVendasComFormaPagto);
                   Q_RelVendasComFormaPagto.cds_RelVendaEFormaPagto.Active:= True;
                   Q_RelVendasComFormaPagto.Preview;
                   lstTiposDeRelatorio.Enabled  := false;
                   destruirRelatorios;
            end;

          end;

        end;

end;


procedure T_frmFinanceiro.FormShow(Sender: TObject);
begin

    lstTiposDeRelatorio.Enabled:= False;
    edt_DataFim.Enabled:= False;

end;


procedure T_frmFinanceiro.edt_DataFimButtonClick(Sender: TObject);
begin

    if edt_DataFim.Date >= edt_DataInicio.Date then
    begin

        lstTiposDeRelatorio.Enabled:= true;

    end else begin

       Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
       edt_DataInicio.SetFocus;
       lstTiposDeRelatorio.Enabled:= False;

    end;

end;

procedure T_frmFinanceiro.edt_DataFimMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

     if edt_DataFim.Date >= edt_DataInicio.Date then
     begin

              lstTiposDeRelatorio.Enabled:= true;

     end else begin

             Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
             edt_DataInicio.SetFocus;
             lstTiposDeRelatorio.Enabled:= False;

     end;

end;

procedure T_frmFinanceiro.edt_DataInicioMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
edt_DataFim.Enabled:= True;
end;

procedure T_frmFinanceiro.edt_DataInicioButtonClick(Sender: TObject);
begin
edt_DataFim.Enabled:= True;
end;

procedure T_frmFinanceiro.edt_DataFimChange(Sender: TObject);
begin

    if edt_DataFim.Date >= edt_DataInicio.Date then
    begin

        lstTiposDeRelatorio.Enabled:= true;

    end else begin

       Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
       edt_DataInicio.SetFocus;
       lstTiposDeRelatorio.Enabled:= False;

    end;

end;

procedure T_frmFinanceiro.edt_DataFimClick(Sender: TObject);
begin

    if edt_DataFim.Date >= edt_DataInicio.Date then
    begin

        lstTiposDeRelatorio.Enabled:= true;

    end else begin

       Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
       edt_DataInicio.SetFocus;
       lstTiposDeRelatorio.Enabled:= False;

    end;       

end;

procedure T_frmFinanceiro.destruirRelatorios;
begin
      FreeAndNil(Q_RelPagtoBoletos);
      FreeAndNil(Q_RelRetiradasDoCaixa);
      FreeAndNil(Q_RelCreditosRecebidos);
      FreeAndNil(Q_RelMovimentoMensal);
      FreeAndNil(Q_RelClientesVendas);
      FreeAndNil(Q_RelVendasFechadas);
      FreeAndNil(Q_RelVendasComFormaPagto);
      FreeAndNil(Q_RelPorTipoDePagamentoDinheiro);
      FreeAndNil(Q_RelPorTipoDePagamentoCredito);
      FreeAndNil(Q_RelPorTipoDePagamentoDebito);
      FreeAndNil(Q_RelPorTipoDePagamentoParcelado);

end;

end.
