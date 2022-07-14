unit U_EscolhaDoFuncionarioParaReativacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaFuncionarioParaReativacao = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    Grid_FuncionariosReativacao: TDBGrid;
    db_Func_id: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure PopulandoGridFuncionariosParaReativacao;
    procedure pnl_rodapeClick(Sender: TObject);
    procedure Grid_FuncionariosReativacaoCellClick(Column: TColumn);
  private
    { Private declarations }
     NomeFuncionario, texto : string;
  public
    { Public declarations }

  end;

var
  _frmEscolhaFuncionarioParaReativacao: T_frmEscolhaFuncionarioParaReativacao;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas,
     DB, U_Funcionarios, U_principal, U_dmDadosSegundo;

{$R *.dfm}

procedure T_frmEscolhaFuncionarioParaReativacao.FormCreate(Sender: TObject);
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

  PopulandoGridFuncionariosParaReativacao;

end;

procedure T_frmEscolhaFuncionarioParaReativacao.PopulandoGridFuncionariosParaReativacao;
begin


          _Sql := 'SELECT * FROM funcionarios WHERE func_nome <> :pFuncNome AND func_status = :pStatus ORDER BY func_nome';


            with DM_Pesq.cdsPesqFuncionarios do begin

                Close;
                CommandText:=(_Sql);
                Params.ParamByName('pStatus').AsString   :=  'I';
                Params.ParamByName('pFuncNome').AsString  := 'ADMINISTRADOR';
                Open;

                if IsEmpty then begin

                   Grid_FuncionariosReativacao.Enabled := false;

                end;    


            end;

            db_Func_id.DataField         := 'FUNC_ID';
            db_Func_id.DataSource        :=  DM_Pesq.dsPesqFuncionarios;


            with Grid_FuncionariosReativacao do
            begin

              DataSource:=  DM_Pesq.dsPesqFuncionarios;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName       := 'FUNC_NOME';
              Columns[0].Width           := 540;
              Columns[0].Alignment       := taLeftJustify;

            end;

end;

procedure T_frmEscolhaFuncionarioParaReativacao.pnl_rodapeClick(Sender: TObject);
begin

   close;

end;

procedure T_frmEscolhaFuncionarioParaReativacao.Grid_FuncionariosReativacaoCellClick(
  Column: TColumn);
begin

      NomeFuncionario :=  DM_Pesq.cdsPesqFuncionarios.Fieldbyname('func_nome').asString;

      texto:= 'Confirma o desejo de reativar o Funcionário '+ NomeFuncionario + '?';

      if Application.MessageBox(PChar(texto),'Reativação de Funcionários',MB_YESNO + MB_ICONQUESTION) = IdYes then
      begin


             //REATIVANDO O FUNCIONARIO

              with DM_Pesq.Qry_Geral do
              begin

                  Close;
                  SQL.Clear;
                  SQL.add('Update funcionarios SET func_status = :pStatusFunc WHERE func_id = :pFuncId');
                  ParamByName('pStatusFunc').AsString    := 'A';
                  ParamByName('pFuncId').AsInteger       := StrToInt(db_Func_id.Text);
                  ExecSQL;

              end;


              //REATIVANDO USUARIO DO FUNCIONARIO
              with DM_Pesq.Qry_Geral do
              begin

                  Close;
                  SQL.Clear;
                  SQL.add('Update login SET status = :pStatus WHERE func_id = :pFuncId');
                  ParamByName('pStatus').AsString    := 'A';
                  ParamByName('pFuncId').AsInteger   := StrToInt(db_Func_id.Text);
                  ExecSQL;

              end;


                Application.MessageBox('O Funcionário foi reativado com sucesso!',
                'Reativado...', MB_OK);
                LogOperacoes(NomeDoUsuarioLogado, 'reativação de funcionário');

              end else begin

                  DM_Pesq.cdsPesqFuncionarios.CancelUpdates;

      end;

              _frmFuncionarios.Abrir_Fechar_Tabelas;
              PopulandoGridFuncionariosParaReativacao;

end;

end.
