unit U_EscolhaParaPagamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaParaPagamentos = class(TForm)
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
  _frmEscolhaParaPagamentos: T_frmEscolhaParaPagamentos;

implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelAniversariantes, U_dmDadosSegundo,
  U_ConsTodosPedidos, U_ConsPedidosPorPeriodo, U_CadPedido, U_ContasPagar,
  U_CadCredores, U_Principal;

{$R *.dfm}

procedure T_frmEscolhaParaPagamentos.FormCreate(Sender: TObject);
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

procedure T_frmEscolhaParaPagamentos.lstOpcoesClick(
  Sender: TObject);
begin

     if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'CADASTRAR / BAIXAR / VISUALIZAR BOLETOS' then
     begin
             if(TabelaEstaVazia('credores'))then
             begin
                    Application.MessageBox('Cadastre os credores primeiro!',
                    'Informação do Sistema!', MB_OK + MB_ICONWARNING);
                    exit;
             end else
             begin

                    Application.CreateForm(T_frmContasPagar,  _frmContasPagar);
                    _frmContasPagar.ShowModal;
                    FreeAndNil(_frmContasPagar);

             end;
            close;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'CADASTRAR  CREDORES' then
    begin

           _frmPrincipal.btnCredoresClick(self);
           
    end;

end;

procedure T_frmEscolhaParaPagamentos.pnl_rodapeClick(
  Sender: TObject);
begin
     _frmPrincipal.logo.Visible := true;
     close;
     Release;

end;

end.
