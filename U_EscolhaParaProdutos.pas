unit U_EscolhaParaProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaParaProdutos = class(TForm)
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
  _frmEscolhaParaProdutos: T_frmEscolhaParaProdutos;

implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelAniversariantes, U_dmDadosSegundo,
  U_ConsTodosPedidos, U_ConsPedidosPorPeriodo, U_CadPedido, U_orcamento,
  U_ConsOrcamentosPorCliente, U_ConsOrcamentosPeriodo, U_Produtos,
  U_AlteraFornecedorDoProduto, U_AlteraFotoDoProduto,
  U_CadCategoriasProdutos, U_CadFabricantesProdutos, U_ConsSimilares,
  U_GerenciarSimilares;

{$R *.dfm}

procedure T_frmEscolhaParaProdutos.FormCreate(Sender: TObject);
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

procedure T_frmEscolhaParaProdutos.lstOpcoesClick(
  Sender: TObject);
begin

     if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'GERENCIAR  CADASTRO   DE   PRODUTOS' then
     begin

          dm_Conexao.cds_CadProduto.Active := false;

          Application.CreateForm(T_frmProdutos,  _frmProdutos);
          _frmProdutos.ShowModal;
          FreeAndNil(_frmProdutos);

          close;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'GERENCIAR FORNECEDOR DE PRODUTOS' then
    begin

           dm_Conexao.cds_CadProduto.Active := true;

            if ( dm_Conexao.cds_CadProduto.Eof ) then
            begin

                   Application.MessageBox('A tabela de produtos esta vazia!',
                   'Atenção não há produtos cadastrados...', MB_OK + MB_ICONEXCLAMATION);
                   exit;

            end  else begin


              Application.CreateForm(T_frmAssociaProdutoFornecedor,  _frmAssociaProdutoFornecedor);
              _frmAssociaProdutoFornecedor.ShowModal;
              FreeAndNil(_frmAssociaProdutoFornecedor);

              close;

            end;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'GERENCIAR      FOTOS    DE      PRODUTOS' then
    begin

            dm_Conexao.cds_CadProduto.Active := True;

            if ( dm_Conexao.cds_CadProduto.Eof ) then
            begin

                   Application.MessageBox('A tabela de produtos esta vazia!',
                   'Atenção não há produtos cadastrados...', MB_OK + MB_ICONEXCLAMATION);
                   exit;

            end else begin

                Application.CreateForm(T_frmAlteraFotoDosProdutos,  _frmAlteraFotoDosProdutos);
                _frmAlteraFotoDosProdutos.ShowModal;
                FreeAndNil(_frmAlteraFotoDosProdutos);

                 close;

            end;    


    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'GERENCIAR  CATEGORIAS  DE PRODUTOS' then
    begin

            dm_Conexao.cds_CadProduto.Active := true;

            if ( dm_Conexao.cds_CadProduto.Eof ) then
            begin

                   Application.MessageBox('A tabela de produtos esta vazia!',
                   'Atenção não há produtos cadastrados...', MB_OK + MB_ICONEXCLAMATION);
                   exit;

            end  else begin

                Application.CreateForm(T_frmCategoriasProdutos,  _frmCategoriasProdutos);
                _frmCategoriasProdutos.ShowModal;
                FreeAndNil(_frmCategoriasProdutos);

                close;

            end;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'GERENCIAR FABRICANTES DE PRODUTOS' then
    begin

            dm_Conexao.cds_CadProduto.Active := true;

            if ( dm_Conexao.cds_CadProduto.Eof ) then
            begin

                   Application.MessageBox('A tabela de produtos esta vazia!',
                   'Atenção não há produtos cadastrados...', MB_OK + MB_ICONEXCLAMATION);
                   exit;

            end  else begin

                 Application.CreateForm(T_frmFabricantesProdutos,  _frmFabricantesProdutos);
                 _frmFabricantesProdutos.ShowModal;
                 FreeAndNil(_frmFabricantesProdutos);

                 close;

            end;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'GERENCIAR    CADASTRO   DE   SIMILARES' then
    begin

             dm_Conexao.cds_CadProduto.Active := true;

              if ( dm_Conexao.cds_CadProduto.Eof ) then
              begin

                     Application.MessageBox('A tabela de produtos esta vazia!',
                     'Atenção não há produtos cadastrados...', MB_OK + MB_ICONEXCLAMATION);
                     exit;

              end  else begin

                   Application.CreateForm(T_frmGerenciarSimilares,  _frmGerenciarSimilares);
                   _frmGerenciarSimilares.ShowModal;
                   FreeAndNil(_frmGerenciarSimilares);

                   close;

              end;

    end;

end;

procedure T_frmEscolhaParaProdutos.pnl_rodapeClick(
  Sender: TObject);
begin

     close;
     Release;

end;

end.
