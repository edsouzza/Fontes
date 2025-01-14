unit U_EscolhaServicoParaReativacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaServicoParaReativacao = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    Grid_ServicosReativacao: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure PopulandoGridServicosParaReativacao;
    procedure pnl_rodapeClick(Sender: TObject);
    procedure Grid_ServicosReativacaoCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     NomeServico, texto : string;
  public
    { Public declarations }

  end;

var
  _frmEscolhaServicoParaReativacao: T_frmEscolhaServicoParaReativacao;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas,
    DB, U_Fornecedores, U_Servicos;

{$R *.dfm}

procedure T_frmEscolhaServicoParaReativacao.FormCreate(Sender: TObject);
//DESABILITA O BOTAO FECHAR DO FORMUL�RIO
var
  hwndHandle : THANDLE;
  hMenuHandle : HMenu;
begin
//Impede movimenta��o do formul�rio
 DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  hwndHandle := Self.Handle;
  if (hwndHandle <> 0) then
    begin
      hMenuHandle := GetSystemMenu(hwndHandle, FALSE);
        if (hMenuHandle <> 0) then
          DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);

  end;

  PopulandoGridServicosParaReativacao;

end;

procedure T_frmEscolhaServicoParaReativacao.PopulandoGridServicosParaReativacao;
begin

          _Sql := 'SELECT * FROM servicos WHERE status = :pStatus ORDER BY descricao';


            with DM_Pesq.cdsPesqGeral do begin

                Close;
                CommandText:=(_Sql);
                Params.ParamByName('pStatus').AsString  := 'I';
                Open;

                if IsEmpty then begin

                   Grid_ServicosReativacao.Enabled := false;

                end;    


            end;

            with Grid_ServicosReativacao do
            begin

              DataSource:=  DM_Pesq.dsPesqGeral;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName       := 'DESCRICAO';
              Columns[0].Width           := 540;
              Columns[0].Alignment       := taLeftJustify;

            end;

end;

procedure T_frmEscolhaServicoParaReativacao.pnl_rodapeClick(Sender: TObject);
begin

   close;

end;

procedure T_frmEscolhaServicoParaReativacao.Grid_ServicosReativacaoCellClick(
  Column: TColumn);
begin

      NomeServico :=  DM_Pesq.cdsPesqGeral.Fieldbyname('descricao').asString;

      texto:= 'Confirma o desejo de reativar o Servi�o '+ NomeServico + '?';

      if Application.MessageBox(PChar(texto),'Reativa��o de Servi�os',MB_YESNO + MB_ICONQUESTION) = IdYes then
      begin

              with DM_Pesq.cdsPesqGeral do
              begin

                edit;
                Fieldbyname('status').AsString := 'A';
                ApplyUpdates(0);

              end;

                Application.MessageBox('O Servi�o foi reativado com sucesso!',
                'Reativado...', MB_OK);
                LogOperacoes(NomeDoUsuarioLogado, 'reativa��o de servi�o');

              end else begin

                  DM_Pesq.cdsPesqGeral.CancelUpdates;

      end;

              _frmServicos.FecharAbrirTabelas;
              PopulandoGridServicosParaReativacao;


end;

procedure T_frmEscolhaServicoParaReativacao.FormShow(Sender: TObject);
begin

       DM_Pesq.cdsPesqGeral.Active := true;

end;

end.
