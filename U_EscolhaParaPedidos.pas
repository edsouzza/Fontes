unit U_EscolhaParaPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaParaPedidos = class(TForm)
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
  _frmEscolhaParaPedidos: T_frmEscolhaParaPedidos;

implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelAniversariantes, U_dmDadosSegundo,
  U_ConsTodosPedidos, U_ConsPedidosPorPeriodo, U_CadPedido;

{$R *.dfm}

procedure T_frmEscolhaParaPedidos.FormCreate(Sender: TObject);
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

procedure T_frmEscolhaParaPedidos.lstOpcoesClick(
  Sender: TObject);
begin

     if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'ABERTURA DE PEDIDOS' then
     begin

           dm_Conexao.cds_Fornecedor.Active := true;

          if ( dm_Conexao.cds_Fornecedor.Eof ) then
          begin

                 Application.MessageBox('A tabela de fornecedores esta vazia!',
                 'Atenção não há fornecedores cadastrados...', MB_OK + MB_ICONEXCLAMATION);
                 exit;

          end else begin

               Application.CreateForm(T_frmCadPedido, _frmCadPedido);
               _frmCadPedido.ShowModal;
               FreeAndNil(_frmCadPedido);

          end;
          close;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'CONSULTAR     PEDIDOS' then
    begin

          dm_DadosSegundo.cds_CPedido.Active := true;
    
          if ( dm_DadosSegundo.cds_CPedido.Eof ) then
          begin

                 Application.MessageBox('Não foram encontrados pedidos cadastrados no momento!',
                 'Atenção não há pedidos cadastrados...', MB_OK + MB_ICONEXCLAMATION);
                 exit;

          end else begin

               Application.CreateForm(T_frmConsTodosPedidos,  _frmConsTodosPedidos);
               _frmConsTodosPedidos.ShowModal;
               FreeAndNil(_frmConsTodosPedidos);

          end;
          close;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'ATUALIZAR  |  GERAR NF' then
    begin


            dm_DadosSegundo.cds_CPedido.Active := true;
            dm_Conexao.cds_Prazos.Active       := true;

            if ( dm_DadosSegundo.cds_CPedido.Eof ) or (  dm_Conexao.cds_Prazos.Eof ) then
            begin

                   Application.MessageBox('Não foram encontrados pedidos ou prazos cadastrados!',
                   'Atenção verifique os prazos ou pedidos...', MB_OK + MB_ICONEXCLAMATION);
                   exit;

            end else begin

                 Application.CreateForm(T_frmConsPedidosPeriodo,  _frmConsPedidosPeriodo);
                 _frmConsPedidosPeriodo.ShowModal;
                 FreeAndNil(_frmConsPedidosPeriodo);

             end;
             close;

    end;

end;

procedure T_frmEscolhaParaPedidos.pnl_rodapeClick(
  Sender: TObject);
begin

     close;
     Release;

end;

end.
