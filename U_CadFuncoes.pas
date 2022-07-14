unit U_CadFuncoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls;

type
  T_frmCadFuncoes = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_Inclusao_funcao: TPanel;
    grp7: TGroupBox;
    btnRetornarDaInclusaoFuncao: TSpeedButton;
    btnConfirmaInclusaoFuncao: TSpeedButton;
    btnExcluirFuncao: TSpeedButton;
    btnIncluirFuncao: TSpeedButton;
    btnEditarFuncao: TSpeedButton;
    grid_Funcoes: TDBGrid;
    edtFuncao: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnIncluirFuncaoClick(Sender: TObject);
    procedure btnEditarFuncaoClick(Sender: TObject);
    procedure btnConfirmaInclusaoFuncaoClick(Sender: TObject);
    procedure btnExcluirFuncaoClick(Sender: TObject);
    procedure btnRetornarDaInclusaoFuncaoClick(Sender: TObject);
    procedure grid_FuncoesCellClick(Column: TColumn);
    procedure grid_FuncoesKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FecharAbrirTabelas;
    procedure GravarNovaFuncao;
    procedure AlteraFuncao;

  private
    { Private declarations }
      gravando : Boolean;
  public
    { Public declarations }

  end;

var
  _frmCadFuncoes: T_frmCadFuncoes;

implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo,
  U_principal, DB, SqlExpr;

{$R *.dfm}


procedure T_frmCadFuncoes.FormCreate(Sender: TObject);
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

procedure T_frmCadFuncoes.FormShow(Sender: TObject);
begin

     dm_DadosSegundo.cds_CadFuncoes.Active := true;
     gravando  := false;

end;


procedure T_frmCadFuncoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    dm_DadosSegundo.cds_CadFuncoes.Active := false;
    Close;
    Release;

end;


procedure T_frmCadFuncoes.FormKeyPress(Sender: TObject; var Key: Char);
begin

  // Enter por Tab
  //verifica se a tecla pressionada é a tecla ENTER, conhecida pelo Delphi como #13
  If key = #13 then
  Begin

    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);

  end;
end;


procedure T_frmCadFuncoes.btnIncluirFuncaoClick(Sender: TObject);
begin

     gravando            := true;
     grid_Funcoes.Height := 280;
     edtFuncao.Visible   := true;
     edtFuncao.SetFocus;   
     btnIncluirFuncao.Enabled            := False;     //novo registro
     btnEditarFuncao.Enabled             := False;
     btnConfirmaInclusaoFuncao.Enabled   := True;
     btnExcluirFuncao.Enabled            := False;
     btnRetornarDaInclusaoFuncao.Enabled := False;
     btnConfirmaInclusaoFuncao.Caption   := 'Gravar Inclusão';
     pnl_cabecalho.Caption               := 'Entre com o nome da nova função';
     LogOperacoes(NomeDoUsuarioLogado, 'alteracao ou incluisao a uma nova funcao de usuarios do sistema');

end;

procedure T_frmCadFuncoes.btnEditarFuncaoClick(Sender: TObject);
begin

     grid_Funcoes.Height                 := 280;
     edtFuncao.Visible                   := true;
     edtFuncao.SetFocus;
     btnIncluirFuncao.Enabled            := False;     //novo registro
     btnEditarFuncao.Enabled             := False;
     btnConfirmaInclusaoFuncao.Enabled   := true;
     btnExcluirFuncao.Enabled            := False;
     btnRetornarDaInclusaoFuncao.Enabled := False;
     btnConfirmaInclusaoFuncao.Caption   := 'Gravar Alteração';
     pnl_cabecalho.Caption               := 'Alterando o nome da função';


end;

procedure T_frmCadFuncoes.btnConfirmaInclusaoFuncaoClick(Sender: TObject);
begin

    if gravando then
    begin

        GravarNovaFuncao;
        LogOperacoes(NomeDoUsuarioLogado, 'cadastro de nova função de acesso');

    end else begin

       AlteraFuncao;
       LogOperacoes(NomeDoUsuarioLogado, 'alteração de função de acesso');

    end;

     grid_Funcoes.ReadOnly                := True;    //desabilita grid
     btnIncluirFuncao.Enabled             := True;    //novo registro
     btnEditarFuncao.Enabled              := false;
     btnConfirmaInclusaoFuncao.Enabled    := False;
     btnExcluirFuncao.Enabled             := false;
     btnRetornarDaInclusaoFuncao.Enabled  := True;

     dm_DadosSegundo.cds_CadFuncoes.Next;
     dm_DadosSegundo.cds_CadFuncoes.ApplyUpdates(0);

     btnConfirmaInclusaoFuncao.Caption   := 'Gravar';

     grid_Funcoes.Height := 310;
     edtFuncao.Visible   := false;


end;

procedure T_frmCadFuncoes.btnExcluirFuncaoClick(Sender: TObject);
begin

     pnl_cabecalho.Caption    := 'Excluindo funções!';

     Try

         if messagedlg ('ATENÇÃO! Você está prestes a excluir o registro. '+
                                       'Deseja prosseguir?', mtWarning, [mbYes, mbNo], 0) = mrYes then begin

              dm_DadosSegundo.cds_CadFuncoes.Delete;
              dm_DadosSegundo.cds_CadFuncoes.ApplyUpdates(0);
              LogOperacoes(NomeDoUsuarioLogado, 'exclusão de função de acesso');
              FecharAbrirTabelas;
              grid_Funcoes.Refresh;
              pnl_cabecalho.Caption    := 'Funções';

         end else begin

          btnEditarFuncao.Enabled  := false;
          pnl_cabecalho.Caption    := 'Funções';

         end;

      Except

              Application.MessageBox('Este registro não pode ser excluído pois esta sendo utilizado por outra tabela!', 'Erro ao excluir:', MB_OK);
              grid_Funcoes.Refresh;
              btnEditarFuncao.Enabled  := false;
              
      End;


       grid_Funcoes.ReadOnly                := True;    //desabilita grid
       btnIncluirFuncao.Enabled             := True;    //novo registro
       btnEditarFuncao.Enabled              := false;
       btnConfirmaInclusaoFuncao.Enabled    := False;
       btnExcluirFuncao.Enabled             := false;
       btnRetornarDaInclusaoFuncao.Enabled  := True;
       edtFuncao.Clear;

end;

procedure T_frmCadFuncoes.btnRetornarDaInclusaoFuncaoClick(
  Sender: TObject);
begin

     close;

end;

procedure T_frmCadFuncoes.grid_FuncoesCellClick(Column: TColumn);
begin

      btnIncluirFuncao.Enabled            := False;
      btnEditarFuncao.Enabled             := true;
      btnConfirmaInclusaoFuncao.Enabled   := False;
      btnExcluirFuncao.Enabled            := true;
      btnRetornarDaInclusaoFuncao.Enabled := true;

      edtFuncao.Text                      := dm_DadosSegundo.cds_CadFuncoes.Fields[1].Value;

end;

procedure T_frmCadFuncoes.grid_FuncoesKeyPress(Sender: TObject;
  var Key: Char);
begin

     if Key = #13 then begin

        dm_DadosSegundo.cds_CadFuncoes.Prior;
        btnConfirmaInclusaoFuncao.Enabled:= True;

     end;


    Key:= Upcase(Key); //GARANTINDO DIGITAÇÃO DE LETRAS MAIUSCULAS NO GRID
    btnConfirmaInclusaoFuncao.Enabled   := True;

end;

procedure T_frmCadFuncoes.FecharAbrirTabelas;
begin

    dm_DadosSegundo.cds_CadFuncoes.Active := false;
    dm_DadosSegundo.cds_CadFuncoes.Active := true;

end;

procedure T_frmCadFuncoes.GravarNovaFuncao;
begin

     if dm_DadosSegundo.cds_CadFuncoes.Locate('funcao_descricao',edtfuncao.text,[]) then
     begin

          Application.MessageBox('Esta função já esta cadastrada!',
            'Duplicidade!', MB_OK + MB_ICONWARNING);
          dm_DadosSegundo.cds_CadFuncoes.Cancel;
          pnl_cabecalho.Caption := 'Este já esta cadastrado!';
          exit;

     end else begin


           if edtFuncao.Text = '' then
           begin

               Application.MessageBox('Entre com o nome!', 'Campo vazio', MB_OK);
               grid_Funcoes.Height := 280;
               edtFuncao.Visible   := true;
               edtFuncao.SetFocus;
               exit;

           end else begin

                With DM_Pesq.qry_Cod do begin

                  Close;
                  SQL.Clear;
                  SQL.Add('select max(FUNCAO_ID) from FUNCOES');
                  Open;

                  if not IsEmpty then begin

                     proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

                     with dm_DadosSegundo.cds_CadFuncoes do
                     begin

                         Append;
                         FieldByName('FUNCAO_ID').AsInteger       :=  proxNum;
                         FieldByName('FUNCAO_DESCRICAO').AsString :=  edtFuncao.Text;
                         ApplyUpdates(0);

                     end;
                       edtFuncao.Clear;
                       gravando := false;
                       pnl_cabecalho.Caption    := 'Funções';
                end;
               end;
            end;
         end;
end;

procedure T_frmCadFuncoes.AlteraFuncao;
begin

    with DM_Pesq.Qry_Geral do
    begin

        close;
        sql.Clear;
        sql.Add('UPDATE funcoes SET funcao_descricao = :pFuncao WHERE funcao_id = :pIDFuncao');
        params.ParamByName('pfuncao').Value   := edtFuncao.Text;
        params.ParamByName('pIDFuncao').Value := dm_DadosSegundo.cds_CadFuncoes.Fields[0].Value;
        ExecSQL();

    end;

    btnEditarFuncao.Enabled  := true;
    gravando                 := false;
    FecharAbrirTabelas;
    pnl_cabecalho.Caption    := 'Funções';
    
end;

end.
