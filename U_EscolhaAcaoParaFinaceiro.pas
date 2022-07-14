unit U_EscolhaAcaoParaFinaceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaParaFinanceiro = class(TForm)
    pnl_cabecalho: TPanel;
    pnl1: TPanel;
    pnl_rodape: TPanel;
    btnConsCaixa: TSpeedButton;
    btnConsultarBoletos: TSpeedButton;
    btnConsultarCreditos: TSpeedButton;
    btnConsultarGrafico: TSpeedButton;
    btnImprimirRelatorios: TSpeedButton;
    btnSair: TSpeedButton;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsCaixaClick(Sender: TObject);
    procedure btnConsultarBoletosClick(Sender: TObject);
    procedure btnConsultarCreditosClick(Sender: TObject);
    procedure btnConsultarGraficoClick(Sender: TObject);
    procedure btnImprimirRelatoriosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MesEscolhido, nomeDoMes : string;
  end;

var
  _frmEscolhaParaFinanceiro: T_frmEscolhaParaFinanceiro;

implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelAniversariantes, U_dmDadosSegundo,
  U_ConsTodosPedidos, U_ConsPedidosPorPeriodo, U_CadPedido, U_orcamento,
  U_ConsOrcamentosPorCliente, U_ConsOrcamentosPeriodo,
  U_ConsOrcamentosParaPagamento, U_dmPesquisas,
  U_OrcamentosParaImpressaoDeRecibos, U_principal, U_Graficos;

{$R *.dfm}

procedure T_frmEscolhaParaFinanceiro.FormCreate(Sender: TObject);
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

  lblDataDoDia.Caption      := DateToStr(date);
  lblHoraAtual.Caption      := timetoStr(time);

end;

procedure T_frmEscolhaParaFinanceiro.btnSairClick(Sender: TObject);
begin
  _frmPrincipal.logo.Visible := true;
  close;
end;

procedure T_frmEscolhaParaFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     _frmPrincipal.logo.Visible := true;
end;

procedure T_frmEscolhaParaFinanceiro.btnConsCaixaClick(Sender: TObject);
begin
  _frmPrincipal.btnCaixaClick(self);
end;

procedure T_frmEscolhaParaFinanceiro.btnConsultarBoletosClick(
  Sender: TObject);
begin
   _frmPrincipal.btnPagamentosClick(self);
end;

procedure T_frmEscolhaParaFinanceiro.btnConsultarCreditosClick(
  Sender: TObject);
begin
  _frmPrincipal.btnCreditosReceberClick(self);
end;

procedure T_frmEscolhaParaFinanceiro.btnConsultarGraficoClick(
  Sender: TObject);
begin
     if (temImpressoraPadrao)then
      begin

         _Sql := 'SELECT * FROM venda WHERE id_venda > 0';

          with DM_Pesq.cdsPesqVenda do begin

              Close;
              CommandText:=(_Sql);
              Open;

              if IsEmpty then begin

                  Application.MessageBox('Sem movimentações cadastradas até o momento!',
                  'Informação do Sistema!', MB_OK + MB_ICONWARNING);

              end
              else begin

                     Application.CreateForm(T_frmGraficos,  _frmGraficos);
                     _frmGraficos.ShowModal;
                     FreeAndNil(_frmGraficos);

              end;

          end;
    end;
end;

procedure T_frmEscolhaParaFinanceiro.btnImprimirRelatoriosClick(
  Sender: TObject);
begin
   _frmPrincipal.btnFinanceiroClick(self);
end;

end.
