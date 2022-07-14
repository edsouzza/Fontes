unit U_EscolhaDoClienteParaReativacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaClienteParaReativacao = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    Grid_ClientesReativacao: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure PopulandoGridClientesParaReativacao;
    procedure pnl_rodapeClick(Sender: TObject);
    procedure Grid_ClientesReativacaoCellClick(Column: TColumn);
    procedure ReativarCliente;

  private
    { Private declarations }
     NomeCliente, texto : string;
  public
    { Public declarations }

  end;

var
  _frmEscolhaClienteParaReativacao: T_frmEscolhaClienteParaReativacao;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas,
 DB, U_Clientes, U_principal;

{$R *.dfm}

procedure T_frmEscolhaClienteParaReativacao.FormCreate(Sender: TObject);
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

  PopulandoGridClientesParaReativacao;

end;

procedure T_frmEscolhaClienteParaReativacao.PopulandoGridClientesParaReativacao;
begin


          _Sql := 'SELECT * FROM clientes WHERE cli_status = '+QuotedStr('I')+'  ORDER BY cli_nome';


            with DM_Pesq.cdsPesqCliente do begin

                Close;
                CommandText:=(_Sql);
                Open;

                if IsEmpty then begin

                   Grid_ClientesReativacao.Enabled := false;

                end;


            end;

            with Grid_ClientesReativacao do
            begin

              DataSource:=  DM_Pesq.dsPesqCliente;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName       := 'CLI_NOME';
              Columns[0].Width           := 540;
              Columns[0].Alignment       := taLeftJustify;

            end;

end;

procedure T_frmEscolhaClienteParaReativacao.pnl_rodapeClick(Sender: TObject);
begin

   close;

end;

procedure T_frmEscolhaClienteParaReativacao.Grid_ClientesReativacaoCellClick(
  Column: TColumn);
begin

    ReativarCliente;

end;

procedure T_frmEscolhaClienteParaReativacao.ReativarCliente;
begin

      NomeCliente :=  DM_Pesq.cdsPesqCliente.Fieldbyname('cli_nome').asString;

      texto:= 'Confirma o desejo de reativar o Cliente '+ nomecliente + '?';

      if Application.MessageBox(PChar(texto),'Reativação de Clientes',MB_YESNO + MB_ICONQUESTION) = IdYes then
      begin

               _SQL := 'UPDATE CLIENTES SET CLI_STATUS = '+QuotedStr('A')+' WHERE CLI_ID = :pID';

                with DM_Pesq.Qry_Geral do
                begin

                   close;
                   sql.Clear;
                   sql.Add(_sql);
                   Params.ParamByName('pID').AsInteger := DM_Pesq.cdsPesqCliente.Fieldbyname('cli_id').AsInteger;
                   ExecSQL();

                end;

                Application.MessageBox('O Cliente foi reativado com sucesso!',
                'Reativado...', MB_OK);
                LogOperacoes(NomeDoUsuarioLogado, 'reativação de cliente');

              end else begin

                  DM_Pesq.cdsPesqCliente.CancelUpdates;

      end;

      PopulandoGridClientesParaReativacao;

end;

end.
