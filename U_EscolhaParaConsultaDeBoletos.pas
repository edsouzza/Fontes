unit U_EscolhaParaConsultaDeBoletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls,
  ToolEdit, ComCtrls, RXDBCtrl;

type
  T_frmEscolhaParaConsultaDeBoletos = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    lstOpcoes: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure lstOpcoesClick(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    
  end;

var
  _frmEscolhaParaConsultaDeBoletos: T_frmEscolhaParaConsultaDeBoletos;

implementation

uses U_dmDados, U_BiblioSysSalao, DB, U_ContasPagar,
  U_EscolhaMesAnoParaPesquisarBoleto, U_EscolhaCredorParaFiltrarBoletos;

{$R *.dfm}

procedure T_frmEscolhaParaConsultaDeBoletos.FormCreate(Sender: TObject);
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

procedure T_frmEscolhaParaConsultaDeBoletos.lstOpcoesClick(
  Sender: TObject);
begin

     if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'BOLETOS TODOS CADASTRADOS' then
     begin

        _frmContasPagar.btnExcluirBoleto.Enabled := false;
        _frmContasPagar.btnBaixarBoleto.Enabled  := false;
        _frmContasPagar.Tag                      := 100;
        _frmContasPagar.MostrarTodosBoletos;

     end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'BOLETOS VENCIDOS PENDENTES' then
     begin

        _frmContasPagar.btnExcluirBoleto.Enabled := false;
        _frmContasPagar.btnBaixarBoleto.Enabled  := false;
        _frmContasPagar.Tag                      := 200;
        _frmContasPagar.MostrarBoletosVencidosPendentes;


     end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'BOLETOS VENCIDOS FINALIZADOS' then
     begin

        _frmContasPagar.btnExcluirBoleto.Enabled := false;
        _frmContasPagar.btnBaixarBoleto.Enabled  := false;
        _frmContasPagar.Tag                      := 300;
        _frmContasPagar.MostrarBoletosVencidosFinalizados;

     end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'BOLETOS A VENCER' then
     begin

        _frmContasPagar.btnExcluirBoleto.Enabled := false;
        _frmContasPagar.btnBaixarBoleto.Enabled  := false;
        _frmContasPagar.Tag                      := 400;
        _frmContasPagar.MostrarBoletosNaoVencidos;

     end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'BOLETOS POR MES E ANO SELECIONADO' then
     begin

           Application.CreateForm(T_frmEscolhaMesAnoParaPesquisarBoleto, _frmEscolhaMesAnoParaPesquisarBoleto);
           _frmEscolhaMesAnoParaPesquisarBoleto.ShowModal;
           _frmContasPagar.Tag                      := 900;
           FreeAndNil(_frmEscolhaMesAnoParaPesquisarBoleto);

     end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'BOLETOS POR CREDOR' then
     begin

           PorCredor := true;
           Application.CreateForm(T_frmEscolhaCredorParaFiltrarBoletos, _frmEscolhaCredorParaFiltrarBoletos);
           _frmEscolhaCredorParaFiltrarBoletos.ShowModal;
           _frmContasPagar.Tag                      := 500;
           FreeAndNil(_frmEscolhaCredorParaFiltrarBoletos);


     end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'BOLETOS POR CREDOR VENCIDOS  PENDENTES' then
     begin

           PorCredorVencidosPendentes := true;
           Application.CreateForm(T_frmEscolhaCredorParaFiltrarBoletos, _frmEscolhaCredorParaFiltrarBoletos);
           _frmEscolhaCredorParaFiltrarBoletos.ShowModal;
           _frmContasPagar.Tag                      := 600;
           FreeAndNil(_frmEscolhaCredorParaFiltrarBoletos);


     end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'BOLETOS POR CREDOR VENCIDOS FINALIZADOS' then
     begin

           PorCredorVencidosFinalizados := true;
           Application.CreateForm(T_frmEscolhaCredorParaFiltrarBoletos, _frmEscolhaCredorParaFiltrarBoletos);
           _frmEscolhaCredorParaFiltrarBoletos.ShowModal;
           _frmContasPagar.Tag                      := 700;
           FreeAndNil(_frmEscolhaCredorParaFiltrarBoletos);


     end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'BOLETOS POR CREDOR A VENCER' then
     begin

           PorCredorNaoVencidos := true;
           Application.CreateForm(T_frmEscolhaCredorParaFiltrarBoletos, _frmEscolhaCredorParaFiltrarBoletos);
           _frmEscolhaCredorParaFiltrarBoletos.ShowModal;
           _frmContasPagar.Tag                      := 800;
           FreeAndNil(_frmEscolhaCredorParaFiltrarBoletos);

     end;

     close;

end;

procedure T_frmEscolhaParaConsultaDeBoletos.pnl_rodapeClick(
  Sender: TObject);
begin
     
      close;

end;

end.
