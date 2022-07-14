unit U_EscolhaParaCotacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaParaCotacoes = class(TForm)
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
  _frmEscolhaParaCotacoes: T_frmEscolhaParaCotacoes;

implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelAniversariantes, U_dmDadosSegundo,
  U_ConsTodosPedidos, U_ConsPedidosPorPeriodo, U_CadPedido, U_Cotacao,
  U_ConsultaCotacoesRealizadas, U_ConsCotacoesPeriodoGeral,
  U_ConsCotacoesPeriodo;

{$R *.dfm}

procedure T_frmEscolhaParaCotacoes.FormCreate(Sender: TObject);
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

procedure T_frmEscolhaParaCotacoes.lstOpcoesClick(
  Sender: TObject);
begin

     if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'ABERTURA DE COTAÇÕES' then
     begin

            dm_Conexao.cds_CadProduto.Active := true;

            if ( dm_Conexao.cds_CadProduto.Eof ) then
            begin

                   Application.MessageBox('A tabela de produtos esta vazia!',
                   'Atenção não há produtos cadastrados...', MB_OK + MB_ICONEXCLAMATION);
                   exit;

            end else begin

                 Application.CreateForm(T_frmCotacao,  _frmCotacao);
                 _frmCotacao.ShowModal;
                 FreeAndNil(_frmCotacao);

            end;
          close;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'CONSULTA  POR  CLIENTE' then
    begin

           dm_DadosSegundo.cds_cotacao.Active := true;

           if (dm_DadosSegundo.cds_cotacao.RecordCount = 0) then
           begin

               Application.MessageBox('A tabela de cotações encontra-se vazia no momento!','Informação do Sistema',MB_ICONEXCLAMATION);

           end else
           begin

              Application.CreateForm(T_frmConsCotacoesRealizadas,  _frmConsCotacoesRealizadas);
              _frmConsCotacoesRealizadas.ShowModal;
              FreeAndNil(_frmConsCotacoesRealizadas);
              LogOperacoes(NomeDoUsuarioLogado, 'acesso a consulta de cotações cadastradas');

           end;
          close;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'CONSULTA  POR PERIODO' then
    begin

              dm_DadosSegundo.cds_cotacao.Active := true;

             if (dm_DadosSegundo.cds_cotacao.RecordCount = 0) then
             begin

                 Application.MessageBox('A tabela de cotações encontra-se vazia no momento!','Informação do Sistema',MB_ICONEXCLAMATION);

             end else
             begin

                Application.CreateForm(T_frmConsCotacoesPeriodoGeral,  _frmConsCotacoesPeriodoGeral);
                _frmConsCotacoesPeriodoGeral.ShowModal;
                FreeAndNil(_frmConsCotacoesPeriodoGeral);
                LogOperacoes(NomeDoUsuarioLogado, 'acesso a consulta de cotações por período geral');

             end;
             close;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'ATUALIZAR     |      FECHAR' then
    begin

          dm_DadosSegundo.cds_cotacao.Active := true;

         if (dm_DadosSegundo.cds_cotacao.RecordCount = 0) then
         begin

             Application.MessageBox('A tabela de cotações encontra-se vazia no momento!','Informação do Sistema',MB_ICONEXCLAMATION);

         end else
         begin

            Application.CreateForm(T_frmConsCotacoesPeriodo,  _frmConsCotacoesPeriodo);
            _frmConsCotacoesPeriodo.ShowModal;
            FreeAndNil(_frmConsCotacoesPeriodo);

         end;
          close;
    end;
end;

procedure T_frmEscolhaParaCotacoes.pnl_rodapeClick(
  Sender: TObject);
begin

     close;
     Release;

end;

end.
