unit U_EscolhaParaFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaParaFuncionarios = class(TForm)
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
  _frmEscolhaParaFuncionarios: T_frmEscolhaParaFuncionarios;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmDadosSegundo, U_ReiniciarSenhaUsuario, U_Funcionarios;

{$R *.dfm}

procedure T_frmEscolhaParaFuncionarios.FormCreate(Sender: TObject);
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

procedure T_frmEscolhaParaFuncionarios.lstOpcoesClick(
  Sender: TObject);
begin

     if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'GERENCIAR  CADASTRO  DE  FUNCIONARIOS' then
     begin

           Application.CreateForm(T_frmFuncionarios,  _frmFuncionarios);
           _frmFuncionarios.ShowModal;
           FreeAndNil(_frmFuncionarios);
           close;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'GERENCIAR  CADASTRO  DE  SENHAS' then
    begin

         if (dm_DadosSegundo.cds_Login.FieldByName('id_usuario').AsInteger > 1 )then
         begin

            Application.CreateForm(T_frmReiniciarSenhaUsuario,  _frmReiniciarSenhaUsuario);
            _frmReiniciarSenhaUsuario.ShowModal;
            FreeAndNil(_frmReiniciarSenhaUsuario);
            close;

         end else begin

             Application.MessageBox('No momento não existem funcionários cadastrados!', 'Tabela vazia!',
             MB_OK + MB_ICONWARNING);

         end;

    end;

end;

procedure T_frmEscolhaParaFuncionarios.pnl_rodapeClick(
  Sender: TObject);
begin

     close;
     Release;

end;

end.
