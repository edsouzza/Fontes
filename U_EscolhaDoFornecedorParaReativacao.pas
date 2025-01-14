unit U_EscolhaDoFornecedorParaReativacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaFornecedorParaReativacao = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    Grid_FornecedoresReativacao: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure PopulandoGridFornecedoresParaReativacao;
    procedure pnl_rodapeClick(Sender: TObject);
    procedure Grid_FornecedoresReativacaoCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     NomeFornecedor, texto : string;
  public
    { Public declarations }

  end;

var
  _frmEscolhaFornecedorParaReativacao: T_frmEscolhaFornecedorParaReativacao;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas,
    DB, U_Fornecedores;

{$R *.dfm}

procedure T_frmEscolhaFornecedorParaReativacao.FormCreate(Sender: TObject);
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

  PopulandoGridFornecedoresParaReativacao;

end;

procedure T_frmEscolhaFornecedorParaReativacao.PopulandoGridFornecedoresParaReativacao;
begin

          _Sql := 'SELECT * FROM fornecedores WHERE forne_status = :pStatus ORDER BY forne_nome';


            with DM_Pesq.cdsPesqFornecedor do begin

                Close;
                CommandText:=(_Sql);
                Params.ParamByName('pStatus').AsString  := 'I';
                Open;

                if IsEmpty then begin

                   Grid_FornecedoresReativacao.Enabled := false;

                end;    


            end;

            with Grid_FornecedoresReativacao do
            begin

              DataSource:=  DM_Pesq.dsPesqFornecedor;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName       := 'FORNE_NOME';
              Columns[0].Width           := 540;
              Columns[0].Alignment       := taLeftJustify;

            end;

end;

procedure T_frmEscolhaFornecedorParaReativacao.pnl_rodapeClick(Sender: TObject);
begin

   close;

end;

procedure T_frmEscolhaFornecedorParaReativacao.Grid_FornecedoresReativacaoCellClick(
  Column: TColumn);
begin

      NomeFornecedor :=  DM_Pesq.cdsPesqFornecedor.Fieldbyname('forne_nome').asString;

      texto:= 'Confirma o desejo de reativar o Fornecedor '+ NomeFornecedor + '?';

      if Application.MessageBox(PChar(texto),'Reativação de Fornecedores',MB_YESNO + MB_ICONQUESTION) = IdYes then
      begin

              with DM_Pesq.cdsPesqFornecedor do
              begin

                edit;
                Fieldbyname('forne_status').AsString := 'A';
                ApplyUpdates(0);

              end;

                Application.MessageBox('O Fornecedor foi reativado com sucesso!',
                'Reativado...', MB_OK);
                LogOperacoes(NomeDoUsuarioLogado, 'reativação de fornecedor');

              end else begin

                  DM_Pesq.cdsPesqFornecedor.CancelUpdates;

      end;

              _frmFornecedores.FecharAbrirTabelas;
              PopulandoGridFornecedoresParaReativacao;


end;

procedure T_frmEscolhaFornecedorParaReativacao.FormShow(Sender: TObject);
begin

       DM_Pesq.cdsPesqFornecedor.Active := true;

end;

end.
