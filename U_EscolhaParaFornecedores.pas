unit U_EscolhaParaFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaParaFornecedores = class(TForm)
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

  end;

var
  _frmEscolhaParaFornecedores: T_frmEscolhaParaFornecedores;

implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelAniversariantes, U_dmDadosSegundo,
  U_ConsTodosPedidos, U_ConsPedidosPorPeriodo, U_CadPedido,
  U_ConsProdutosFornecedores, U_ConsContatosFornecedores, U_Fornecedores;
{$R *.dfm}

procedure T_frmEscolhaParaFornecedores.FormCreate(Sender: TObject);
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

procedure T_frmEscolhaParaFornecedores.lstOpcoesClick(
  Sender: TObject);
begin

     if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'CADASTRAR  FORNECEDOR' then
     begin

           Application.CreateForm(T_frmFornecedores, _frmFornecedores);
           _frmFornecedores.ShowModal;
            FreeAndNil(_frmFornecedores);
           close;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'CONSULTAR OS PRODUTOS' then
    begin

         dm_Conexao.cds_CadProduto.Active := true;

         if dm_Conexao.cds_CadProduto.RecordCount > 0 then
         begin

            Application.CreateForm(T_frmConsProdutosFornecedores,  _frmConsProdutosFornecedores);
            _frmConsProdutosFornecedores.ShowModal;
            FreeAndNil(_frmConsProdutosFornecedores);
            close;

         end
         else begin

               Application.MessageBox('Não foram encontrados produtos cadastrados!',
                  'Tabela de produtos vazia!', MB_OK + MB_ICONWARNING);

         end;


    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'CONSULTAR OS  CONTATOS' then
    begin

              dm_Conexao.cds_Fornecedor.Active := true;

              if ( dm_Conexao.cds_Fornecedor.Eof ) then
              begin

                     Application.MessageBox('A tabela de fornecedores esta vazia!',
                     'Atenção não há fornecedores cadastrados...', MB_OK + MB_ICONEXCLAMATION);
                     exit;

              end else begin

                    Application.CreateForm(T_frmConsContatosFornecedores,  _frmConsContatosFornecedores);
                    _frmConsContatosFornecedores.ShowModal;
                    FreeAndNil(_frmConsContatosFornecedores);
                    close;

              end;  

    end;

end;

procedure T_frmEscolhaParaFornecedores.pnl_rodapeClick(
  Sender: TObject);
begin

     close;
     Release;

end;

end.
