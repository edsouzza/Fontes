unit U_Balancete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ToolEdit, Mask, CurrEdit, ExtCtrls;

type
  T_frmBalancete = class(TForm)
    pnl_titulo: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    pnlReceitas: TPanel;
    grp1: TGroupBox;
    grp3: TGroupBox;
    lbl1: TLabel;
    grp4: TGroupBox;
    edt_Orcamentos: TCurrencyEdit;
    grp5: TGroupBox;
    edt_TotalReceitas: TCurrencyEdit;
    pnlDespesas: TPanel;
    grp2: TGroupBox;
    grp6: TGroupBox;
    lbl5: TLabel;
    grp7: TGroupBox;
    edt_PagtoBoletos: TCurrencyEdit;
    grp8: TGroupBox;
    edt_TotalDespesas: TCurrencyEdit;
    pnl_botoes: TPanel;
    pnl_Periodo: TPanel;
    grp9: TGroupBox;
    edt_ValorBalancoFinal: TCurrencyEdit;
    grp10: TGroupBox;
    lbl41: TLabel;
    lbl42: TLabel;
    edt_DataInicio: TDateEdit;
    edt_DataFim: TDateEdit;
    grp11: TGroupBox;
    rb_Filtrar: TRadioButton;
    rb_Sair: TRadioButton;
    Label1: TLabel;
    edt_RetiradasCaixa: TCurrencyEdit;
    Label2: TLabel;
    edt_Creditos: TCurrencyEdit;
    Label3: TLabel;
    edt_CreditosDiversos: TCurrencyEdit;
    Label4: TLabel;
    edt_Trocos: TCurrencyEdit;
    lblStatusLogoff: TLabel;
    procedure rb_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ValorCreditadoNoCaixaViaMovimentacao;
    procedure ValorOrcamentosFinalizados;
    procedure ValorTotalReceitas;
    procedure ValorPagamentoBoletos;
    procedure ValorRetiradoDoCaixaViaMovimentacao;
    procedure ValorRetiradoDoCaixaViaTroco;
    procedure ValorTotalDespesas;
    procedure ValorTotalCreditosRecebidos;
    procedure ProcederPesquisasDeValores;
    procedure CalcularMostrarValorBalancete;
    procedure rb_FiltrarClick(Sender: TObject);
    procedure edt_DataInicioButtonClick(Sender: TObject);
    procedure edt_DataInicioClick(Sender: TObject);
    procedure edt_DataInicioChange(Sender: TObject);
    procedure edt_DataFimButtonClick(Sender: TObject);
    procedure edt_DataFimChange(Sender: TObject);
    procedure edt_DataFimClick(Sender: TObject);
    procedure ZerarValoresDaPesquisa;
  private
    { Private declarations }
     TotalPagtoBoletos, TotalCreditos, TotalCreditosDiversos, TotalRetiradoViaTroco,
    TotalDespesas, TotalOrcamentos, TotalReceitas, TotalBalancete, TotalRetiradasCaixa : Extended;
  public
    { Public declarations }
  end;

var
  _frmBalancete: T_frmBalancete;

implementation

uses U_BiblioSysSalao, U_dmDados, U_dmDadosSegundo, U_dmPesquisas,
  U_QRelBalancete, U_principal;

{$R *.dfm}

procedure T_frmBalancete.rb_SairClick(Sender: TObject);
begin
     rb_Filtrar.Checked  := False;
     _frmPrincipal.logo.Visible := true;
     release;
     Close;
end;

procedure T_frmBalancete.FormCreate(Sender: TObject);
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
    lblStatusLogoff.Caption := IdentificarUsuarioLogado;
    edt_DataInicio.Date     := Date;
    edt_DataFim.Date        := date;
                                           
end;

procedure T_frmBalancete.FormShow(Sender: TObject);
begin

   edt_DataInicio.SetFocus;
   Caption := 'LOGADO POR '+NomeDoUsuarioLogado;

end;


procedure T_frmBalancete.ProcederPesquisasDeValores;
begin

      //RECEITAS
      ValorTotalCreditosRecebidos;
      ValorOrcamentosFinalizados;
      ValorCreditadoNoCaixaViaMovimentacao;
      ValorTotalReceitas;

      //DESPESAS
      ValorPagamentoBoletos;
      ValorRetiradoDoCaixaViaMovimentacao;
      ValorRetiradoDoCaixaViaTroco;
      ValorTotalDespesas;

end;

procedure T_frmBalancete.ValorRetiradoDoCaixaViaTroco;
begin

    _Sql:= 'select SUM(valor) as TotalRetirado from movimentacaocaixa '+
            'where tipo='+QuotedStr('T')+' AND data between :datainicial '+
            'and :datafinal GROUP BY tipo';

      with DM_Pesq.Qry_Geral do
      begin

        Close;
        SQL.Clear;
        SQL.Add(_Sql);
        Params.ParamByName('datainicial').AsDate := edt_DataInicio.Date;
        Params.ParamByName('datafinal').AsDate   := edt_DataFim.Date;
        Open;

         if not IsEmpty then begin

             edt_Trocos.Text := FloatToStr(DM_Pesq.Qry_Geral.FieldByName('TotalRetirado').AsFloat);

         end;

      end;

end;

procedure T_frmBalancete.ValorCreditadoNoCaixaViaMovimentacao;
begin

    _Sql:= 'select SUM(valor) as TotalCreditado from movimentacaocaixa '+
            'where tipo='+QuotedStr('C')+' AND data between :datainicial '+
            'and :datafinal GROUP BY tipo';

      with DM_Pesq.Qry_Geral do
      begin

        Close;
        SQL.Clear;
        SQL.Add(_Sql);
        Params.ParamByName('datainicial').AsDate := edt_DataInicio.Date;
        Params.ParamByName('datafinal').AsDate   := edt_DataFim.Date;
        Open;

         if not IsEmpty then begin

             edt_CreditosDiversos.Text := FloatToStr(DM_Pesq.Qry_Geral.FieldByName('TotalCreditado').AsFloat);

         end;

      end;

end;

procedure T_frmBalancete.ValorRetiradoDoCaixaViaMovimentacao;
begin

    _Sql:= 'select SUM(valor) as TotalRetirado from movimentacaocaixa '+
            'where tipo='+QuotedStr('D')+' AND data between :datainicial '+
            'and :datafinal GROUP BY tipo';

      with DM_Pesq.Qry_Geral do
      begin

        Close;
        SQL.Clear;
        SQL.Add(_Sql);
        Params.ParamByName('datainicial').AsDate := edt_DataInicio.Date;
        Params.ParamByName('datafinal').AsDate   := edt_DataFim.Date;
        Open;

         if not IsEmpty then begin

             edt_RetiradasCaixa.Text := FloatToStr(DM_Pesq.Qry_Geral.FieldByName('TotalRetirado').AsFloat);

         end;

      end;

end;

procedure T_frmBalancete.ValorTotalCreditosRecebidos;
begin
      //VALORES RECEBIDOS A TITULO DE PENDENCIAS
      _Sql:= 'select SUM(valor) as TotalValor from ativos_credito '+
             'where status='+QuotedStr('FINALIZADO')+' AND dtrecebimento between :datainicial and :datafinal '+
             'GROUP BY status';

      with DM_Pesq.Qry_Geral do
      begin

        Close;
        SQL.Clear;
        SQL.Add(_Sql);
        Params.ParamByName('datainicial').AsDate := edt_DataInicio.Date;
        Params.ParamByName('datafinal').AsDate   := edt_DataFim.Date;
        Open;

         if not IsEmpty then begin

             edt_Creditos.Text := FloatToStr(DM_Pesq.Qry_Geral.FieldByName('TotalValor').AsFloat);

         end;

      end;

end;



procedure T_frmBalancete.ValorOrcamentosFinalizados;
begin

      //VALORES RECEBIDOS DE SERVICOS EXECUTADOS FINALIZADOS E PAGOS INTEGRALMENTE

      _Sql:= 'select SUM(vl_liquido) as TotalValor from venda '+
             'where status='+QuotedStr('F')+' AND data_venda '+
             'between :datainicial and :datafinal '+
             'GROUP BY status';

      with DM_Pesq.Qry_Geral do
      begin

        Close;
        SQL.Clear;
        SQL.Add(_Sql);
        Params.ParamByName('datainicial').AsDate := edt_DataInicio.Date;
        Params.ParamByName('datafinal').AsDate   := edt_DataFim.Date;
        Open;

         if not IsEmpty then begin

             edt_Orcamentos.Text := FloatToStr(DM_Pesq.Qry_Geral.FieldByName('TotalValor').AsFloat);

         end;

      end;

end;

procedure T_frmBalancete.ValorPagamentoBoletos;
begin

     _Sql:= 'select SUM(valor) as ValorTotalBoletos from pagamentos '+
            'where status='+QuotedStr('FINALIZADO')+' AND dtpagto between :datainicial '+
            'and :datafinal GROUP BY status';

      with DM_Pesq.Qry_Geral do
      begin

        Close;
        SQL.Clear;
        SQL.Add(_Sql);
        Params.ParamByName('datainicial').AsDate := edt_DataInicio.Date;
        Params.ParamByName('datafinal').AsDate   := edt_DataFim.Date;
        Open;

         if not IsEmpty then begin

             edt_PagtoBoletos.Text := FloatToStr(DM_Pesq.Qry_Geral.FieldByName('ValorTotalBoletos').AsFloat);

         end;

      end;

end;



procedure T_frmBalancete.rb_FiltrarClick(Sender: TObject);
begin

    if edt_DataFim.Date >= edt_DataInicio.Date then
    begin

       if rb_Filtrar.Checked then
       begin

          ProcederPesquisasDeValores;
          CalcularMostrarValorBalancete;   

       end;

    end else begin

       Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
       edt_DataInicio.SetFocus;

    end;

end;


procedure T_frmBalancete.ValorTotalReceitas;
begin

     TotalOrcamentos         := 0;
     TotalCreditos           := 0;
     TotalCreditosDiversos   := 0;
     TotalReceitas           := 0;

     TotalOrcamentos         := StrToFloat(edt_Orcamentos.text);
     TotalCreditos           := StrToFloat(edt_Creditos.text);
     TotalCreditosDiversos   := StrToFloat(edt_CreditosDiversos.text);

     TotalReceitas           := ( TotalOrcamentos + TotalCreditos + TotalCreditosDiversos );
     edt_TotalReceitas.Text  := FloatToStr(TotalReceitas);

end;


procedure T_frmBalancete.ValorTotalDespesas;
begin

     TotalPagtoBoletos        := 0;
     TotalRetiradasCaixa      := 0;
     TotalRetiradoViaTroco    := 0;
     TotalDespesas            := 0;

     TotalPagtoBoletos        := StrToFloat(edt_PagtoBoletos.text);
     TotalRetiradasCaixa      := StrToFloat(edt_RetiradasCaixa.text);
     TotalRetiradoViaTroco    := StrToFloat(edt_Trocos.text);

     TotalDespesas            := ((TotalPagtoBoletos) + (TotalRetiradasCaixa) + (TotalRetiradoViaTroco));
     edt_TotalDespesas.Text   := FloatToStr(TotalDespesas);

end;


procedure T_frmBalancete.CalcularMostrarValorBalancete;
begin

      TotalBalancete := (TotalReceitas - TotalDespesas);
      edt_ValorBalancoFinal.Text := FloatToStr(TotalBalancete);

      if TotalBalancete > 0 then
      begin

         edt_ValorBalancoFinal.Font.Color := clBlue;

      end else
      if TotalBalancete < 0 then
      begin

        edt_ValorBalancoFinal.Font.Color := clRed;

      end;

end;



procedure T_frmBalancete.edt_DataInicioButtonClick(Sender: TObject);
begin

    rb_Filtrar.Checked:= False;
    ZerarValoresDaPesquisa;

end;

procedure T_frmBalancete.edt_DataInicioClick(Sender: TObject);
begin

    rb_Filtrar.Checked:= False;
    ZerarValoresDaPesquisa;

end;

procedure T_frmBalancete.edt_DataInicioChange(Sender: TObject);
begin

    rb_Filtrar.Checked:= False;
    ZerarValoresDaPesquisa;

end;

procedure T_frmBalancete.edt_DataFimButtonClick(Sender: TObject);
begin

    rb_Filtrar.Checked:= False;
    ZerarValoresDaPesquisa;

end;

procedure T_frmBalancete.edt_DataFimChange(Sender: TObject);
begin

    rb_Filtrar.Checked:= False;
    ZerarValoresDaPesquisa;

end;

procedure T_frmBalancete.edt_DataFimClick(Sender: TObject);
begin

    rb_Filtrar.Checked:= False;
    ZerarValoresDaPesquisa;

end;


procedure T_frmBalancete.ZerarValoresDaPesquisa;
begin

     edt_Orcamentos.Text        := '0,00';
     edt_Creditos.Text          := '0,00';
     edt_TotalReceitas.Text     := '0,00';
     edt_CreditosDiversos.Text  := '0,00';
     edt_TotalReceitas.Text     := '0,00';

     edt_PagtoBoletos.Text      := '0,00';
     edt_RetiradasCaixa.Text    := '0,00';
     edt_Trocos.Text            := '0,00';
     edt_TotalDespesas.Text     := '0,00';
     
     edt_ValorBalancoFinal.Text := '0,00';

end;

end.
