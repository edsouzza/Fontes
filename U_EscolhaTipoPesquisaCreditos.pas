unit U_EscolhaTipoPesquisaCreditos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaTipoDePesquisaCreditos = class(TForm)
    pnl_cabecalho: TPanel;
    pnl1: TPanel;
    pnl_rodape: TPanel;
    lstOpcoes: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure lstOpcoesClick(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MesEscolhido, nomeDoMes : string;
  end;

var
  _frmEscolhaTipoDePesquisaCreditos: T_frmEscolhaTipoDePesquisaCreditos;

implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelAniversariantes, U_dmDadosSegundo,
  U_ConsTodosPedidos, U_ConsPedidosPorPeriodo, U_CadPedido, U_orcamento,
  U_ConsOrcamentosPorCliente, U_ConsOrcamentosPeriodo, U_Produtos,
  U_AlteraFornecedorDoProduto, U_AlteraFotoDoProduto,
  U_CadCategoriasProdutos, U_CadFabricantesProdutos, U_ConsSimilares,
  U_GerenciarSimilares, U_GerenciarCreditosPagamentosComCartao;

{$R *.dfm}

procedure T_frmEscolhaTipoDePesquisaCreditos.FormCreate(Sender: TObject);
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

end;

procedure T_frmEscolhaTipoDePesquisaCreditos.lstOpcoesClick(
  Sender: TObject);
begin

     if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'TODOS    CREDITOS    VENCIDOS    NO    GERAL' then
     begin

          //MOSTRAR TODOS OS CREDITOS VENCIDOS
          _frmGerenciarCreditosPagosComCartao.MostrarTodosCreditosVencidos;
          close;


     end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'CREDITOS  BAIXADOS  DO  MES  SELECIONADO' then
     begin

          //MOSTRAR TODOS OS CREDITOS PG NO MES E ANO SELECIONADOS
          _frmGerenciarCreditosPagosComCartao.MostrarCreditosPagosPeloMesAnoSelecionado;
          close;

     end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'TODOS  OS  CREDITOS   BAIXADOS  NO  GERAL' then
     begin

            //MOSTRAR TODOS OS CREDITOS DO TIPO ORÇAMENTO NO MES E ANO SELECIONADO
          _frmGerenciarCreditosPagosComCartao.MostrarTodosCreditosBaixados;
          close;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'CREDITOS EM ABERTO DO MES  SELECIONADO' then
    begin

            //MOSTRAR TODOS OS CREDITOS AB NO MES E ANO SELECIONADOS
          _frmGerenciarCreditosPagosComCartao.MostrarCreditosAbertosPeloMesAnoSelecionado;
          close;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'TODOS  OS  CREDITOS DO  MES SELECIONADO' then
    begin

             //MOSTRAR TODOS OS CREDITOS PG E AB NO MES E ANO SELECIONADOS
          _frmGerenciarCreditosPagosComCartao.MostrarCreditosPeloMesAnoSelecionado;
          close;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'CREDITOS  VENCIDOS DO  MES  SELECIONADO' then
    begin

             //MOSTRAR TODOS OS CREDITOS PG NO MES E ANO SELECIONADOS
          _frmGerenciarCreditosPagosComCartao.MostrarCreditosVencidosPeloMesAnoSelecionado;
          close;
          
    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'TODOS   OS  CREDITOS  ABERTOS   NO  GERAL' then
    begin

            //MOSTRAR TODOS OS CREDITOS PG NO MES E ANO SELECIONADOS
          _frmGerenciarCreditosPagosComCartao.MostrarTodosCreditosAbertos;
          close;

    end;
    _frmGerenciarCreditosPagosComCartao.OcultarDadosBarra;
end;

procedure T_frmEscolhaTipoDePesquisaCreditos.pnl_rodapeClick(
  Sender: TObject);
begin

     close;
     Release;

end;

end.
