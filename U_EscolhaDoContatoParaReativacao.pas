unit U_EscolhaDoContatoParaReativacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaContatoParaReativacao = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    GridContatosReativacao: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure PopulandoGridContatosParaReativacao;
    procedure pnl_rodapeClick(Sender: TObject);
    procedure GridContatosReativacaoCellClick(Column: TColumn);
    procedure ReativarContato;

  private
    { Private declarations }
     NomeContato : string;
  public
    { Public declarations }

  end;

var
  _frmEscolhaContatoParaReativacao: T_frmEscolhaContatoParaReativacao;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas,
     DB, U_Produtos, U_CadContatosFornecedores;

{$R *.dfm}

procedure T_frmEscolhaContatoParaReativacao.FormCreate(Sender: TObject);
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

  PopulandoGridContatosParaReativacao;

end;

procedure T_frmEscolhaContatoParaReativacao.PopulandoGridContatosParaReativacao;
begin

          _Sql := 'SELECT * FROM contatos_fornecedores WHERE status = '+QuotedStr('I')+' ORDER BY nome';

            with DM_Pesq.cdsPesqContatos do begin

                Close;
                CommandText:=(_Sql);
                Open;

                if IsEmpty then begin

                   GridContatosReativacao.Enabled := false;

                end;


            end;

            with GridContatosReativacao do
            begin

              DataSource:=  DM_Pesq.dsPesqContatos;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName       := 'NOME';
              Columns[0].Width           := 540;
              Columns[0].Alignment       := taLeftJustify;

            end;

end;

procedure T_frmEscolhaContatoParaReativacao.pnl_rodapeClick(Sender: TObject);
begin

   close;

end;

procedure T_frmEscolhaContatoParaReativacao.GridContatosReativacaoCellClick(
  Column: TColumn);
begin

   ReativarContato;

end;

procedure T_frmEscolhaContatoParaReativacao.ReativarContato;
begin

      NomeContato :=  DM_Pesq.cdsPesqContatos.Fieldbyname('nome').asString;

      texto:= 'Confirma o desejo de reativar o contato '+ NomeContato + '?';

      if Application.MessageBox(PChar(texto),'Reativação de Contatos',MB_YESNO + MB_ICONQUESTION) = IdYes then
      begin

              with DM_Pesq.cdsPesqContatos do
              begin

                edit;
                Fieldbyname('status').AsString := 'A';
                ApplyUpdates(0);

              end;

                Application.MessageBox('O Contato foi reativado com sucesso!',
                'Reativado...', MB_OK);
                LogOperacoes(NomeDoUsuarioLogado, 'reativação de contato de fornecedor');

              end else begin

                  DM_Pesq.cdsPesqContatos.CancelUpdates;

      end;

              _frmCadContatoFornecedores.FecharAbrirTabelas;
              PopulandoGridContatosParaReativacao;

end;

end.
