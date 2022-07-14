unit U_ListaPadraoComUmCampoReativar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmListaPadraoReativacao = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    GridDados: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure GridDadosCellClick(Column: TColumn);

    //procedures personalizadas
    procedure Reativar;
    procedure GerarColunasDoGrid;
    procedure PopularGrid;
    procedure GerarTitulosFormulario;


  private
    { Private declarations }
    Nome : string;
    id : integer;
  public
    { Public declarations }

  end;

var
  _frmListaPadraoReativacao: T_frmListaPadraoReativacao;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas,
 DB, U_Clientes, U_principal, DBClient, U_EscolhaParaReativacao;

{$R *.dfm}

procedure T_frmListaPadraoReativacao.FormCreate(Sender: TObject);
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

procedure T_frmListaPadraoReativacao.GerarColunasDoGrid;
begin

  with DM_Pesq.cdsPesqGeral do
  begin
        Close;
        CommandText:=(_Sql);
        Open;

        if IsEmpty then
        begin

           GridDados.Enabled := false;

        end else
        begin

            with GridDados do
            begin

              DataSource:=  DM_Pesq.dsPesqGeral;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName       := campoNome;
              Columns[0].Width           := 540;
              Columns[0].Alignment       := taLeftJustify;

            end;
        end;

    end;

end;

procedure T_frmListaPadraoReativacao.FormShow(Sender: TObject);
begin

  PopularGrid;
  
end;

procedure T_frmListaPadraoReativacao.GerarTitulosFormulario;
begin

    pnl_cabecalho.Caption             := 'REATIVAÇÃO DE '+nomeTabela;
    _frmListaPadraoReativacao.Caption := nomeTabela;

end;

procedure T_frmListaPadraoReativacao.PopularGrid;
begin

   if not(TabelaEstaVazia(nomeTabela))then
   begin
         _Sql := 'SELECT * FROM '+nomeTabela+' WHERE '+campoStatus+' = '+QuotedStr('I')+' ORDER BY '+campoNome+'';
         GerarColunasDoGrid;

    end else begin

        GridDados.DataSource:= nil;

    end;
    GerarTitulosFormulario;
end;

procedure T_frmListaPadraoReativacao.pnl_rodapeClick(Sender: TObject);
begin

   close;

end;

procedure T_frmListaPadraoReativacao.GridDadosCellClick(
  Column: TColumn);
begin
    id := DM_Pesq.cdsPesqGeral.Fields[0].AsInteger;
    Reativar;

end;

procedure T_frmListaPadraoReativacao.Reativar;
begin

      Nome :=  DM_Pesq.cdsPesqGeral.Fieldbyname(campoNome).asString;

      texto:= 'Confirma o desejo de reativacao de '+ Nome + '?';

      if Application.MessageBox(PChar(texto),'Reativando',MB_YESNO + MB_ICONQUESTION) = IdYes then
      begin

               _SQL := 'UPDATE '+nomeTabela+' SET '+campoStatus+' = '+QuotedStr('A')+' WHERE '+campoID+' = :pID';

                with DM_Pesq.cdsPesqGeral do
                begin

                   Close;
                   CommandText:=(_Sql);
                   Params.ParamByName('pID').AsInteger := id;
                   Execute;

                end;

                Application.MessageBox('Reativação procedida com sucesso, verifique!',
                'Reativado...', MB_OK);
                LogOperacoes(NomeDoUsuarioLogado, 'reativação de '+nomeTabela+'');
                

      end else
      begin

          DM_Pesq.cdsPesqGeral.CancelUpdates;

      end;

      if(reativandoFuncionario)then
      begin
          ReativarLoginFuncionarioInativado(id);
      end;


      if(TemInativos(nomeTabela,campoStatus))then
      begin
         PopularGrid;
      end else
      begin
          reativandoFuncionario :=false;    
          close;
      end;

end;

end.
