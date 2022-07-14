unit U_CadCredores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit;

type
  T_frmCadCredores = class(TForm)
    pnl_cabecalho: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    panGridCadCategorias: TPanel;
    gr_CadCategorias: TGroupBox;
    GroupBox14: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    gr_EditarNovo: TGroupBox;
    btnAlterar: TSpeedButton;
    btnNovo: TSpeedButton;
    btnGravar: TSpeedButton;
    btnSair: TSpeedButton;
    btnCancelar: TSpeedButton;
    gridCredores: TDBGrid;
    btnExcluir: TSpeedButton;
    procedure btn_SairClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DesabilitarBotoesCredores;
    procedure gridCredoresCellClick(Column: TColumn);
    procedure btnSairClick(Sender: TObject);
    procedure FecharAbrirTabelas;
    procedure RetornaEstadoInicialDosBotoes;
    procedure FormShow(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure ExcluirCredor;


  private
    { Private declarations }


  public
    { Public declarations }


  end;

var
  _frmCadCredores : T_frmCadCredores;
  proxNumCaixa : Integer;

implementation

uses U_BiblioSysSalao, U_dmDadosSegundo, U_principal, U_dmDados,
  U_dmPesquisas, SqlExpr;

{$R *.dfm}


procedure T_frmCadCredores.FormCreate(Sender: TObject);
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

   lblDataDoDia.Caption:=  DateToStr(date);
   lblHoraAtual.Caption:=  timetoStr(time);

   AbrirTabelas;

end;

procedure T_frmCadCredores.FormShow(Sender: TObject);
begin

    RetornaEstadoInicialDosBotoes;

end;


procedure T_frmCadCredores.AbrirTabelas;
begin

    dm_Conexao.cds_Credores.Active      := True;

end;


procedure T_frmCadCredores.FecharTabelas;
begin

    dm_Conexao.cds_Credores.Active       := False;

end;


procedure T_frmCadCredores.FecharAbrirTabelas;
begin

    dm_Conexao.cds_Credores.Active       := False;
    dm_Conexao.cds_Credores.Active       := True;

end;


procedure T_frmCadCredores.btn_SairClick(Sender: TObject);
begin

     close;

end;


procedure T_frmCadCredores.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Release;

end;

procedure T_frmCadCredores.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmCadCredores.edt_nomeKeyPress(Sender: TObject;
  var Key: Char);
begin

    // PARA DBEDIT ACEITAR APENAS NUMEROS
    If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmCadCredores.btnGravarClick(Sender: TObject);
begin

    if (DBEdit2.Text = '') then
    begin

       Application.MessageBox('Preencha os campos corretamente para continuar o cadastro!',
                                    'Informação do Sistema', MB_OK + MB_ICONINFORMATION);

    end else begin

        With DM_Pesq.Qry_Geral do
        begin

            Close;
            SQL.Clear;
            SQL.Add('select CREDOR from CREDORES WHERE credor = :pCredor');
            ParamByName('pCredor').AsString := DBEdit2.Text;
            Open;

            if not IsEmpty then begin

                  Application.MessageBox('Esse credor já esta cadastrado!',
                                          'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
                  btnCancelarClick(Self);
                  exit;

              end else begin

                  //dm_conexao.cds_credores.Next;
                  dm_conexao.cds_credores.Post;
                  //dm_conexao.cds_credores.ApplyUpdates(0);

                  LogOperacoes(NomeDoUsuarioLogado, 'cadastro ou alteração de credor');
                  FecharAbrirTabelas;
                  RetornaEstadoInicialDosBotoes;
                  DBEdit2.ReadOnly  := true;
                  DBEdit1.SetFocus;

              end;
          end;
    end;

end;

procedure T_frmCadCredores.btnNovoClick(Sender: TObject);
begin

      DBEdit2.ReadOnly := false;
      DBEdit2.SetFocus;

        With DM_Pesq.qry_Cod do
        begin

            Close;
            SQL.Clear;
            SQL.Add('select max(ID_CREDOR) from CREDORES');
            Open;

            if not IsEmpty then begin

               proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

            end;

      end;


      with dm_Conexao.cds_Credores do
      begin

          append;
          DBEdit1.Text := InttoStr(proxNum);

      end;

end;

procedure T_frmCadCredores.btnAlterarClick(Sender: TObject);
begin

     dm_Conexao.cds_Credores.Edit;
     DBEdit2.ReadOnly     := false;
     DBEdit2.SetFocus;
     btnCancelar.Enabled  := true;
     btnGravar.Enabled    := true;

end;

procedure T_frmCadCredores.btnCancelarClick(Sender: TObject);
begin

    dm_Conexao.cds_Credores.CancelUpdates;
    dm_Conexao.cds_Credores.Prior;

    FecharAbrirTabelas;
    RetornaEstadoInicialDosBotoes;
    DBEdit2.ReadOnly  := true;
    DBEdit1.SetFocus;

end;

procedure T_frmCadCredores.DesabilitarBotoesCredores;
begin

     btnGravar.Enabled    := false;
     btnNovo.Enabled      := false;
     btnAlterar.Enabled   := false;
     btnSair.Enabled      := false;
     btnCancelar.Enabled  := true;

end;

procedure T_frmCadCredores.RetornaEstadoInicialDosBotoes;
begin

     btnGravar.Enabled    := false;
     btnNovo.Enabled      := true;
     btnCancelar.Enabled  := false;
     btnSair.Enabled      := true;
     btnExcluir.Enabled   := false;

     if ( dm_Conexao.cds_Credores.Eof ) then
     begin

         btnAlterar.Enabled   := false;

     end else begin

          btnAlterar.Enabled   := true;

     end;

end;


procedure T_frmCadCredores.gridCredoresCellClick(Column: TColumn);
begin

    RetornaEstadoInicialDosBotoes;
    btnNovo.Enabled     := false;
    btnCancelar.Enabled := true;
    btnExcluir.Enabled  := true;
    
end;

procedure T_frmCadCredores.btnSairClick(Sender: TObject);
begin
    FecharTabelas;
    close;

end;



procedure T_frmCadCredores.DBEdit1Enter(Sender: TObject);
begin

     btnGravar.Enabled := false;

end;

procedure T_frmCadCredores.DBEdit2Enter(Sender: TObject);
begin

    DesabilitarBotoesCredores;

end;

procedure T_frmCadCredores.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin

    btnGravar.Enabled    := true;

end;

procedure T_frmCadCredores.btnExcluirClick(Sender: TObject);
begin

      //verifica primeiro se não tem algum pagamento com o id deste credor

      _Sql := 'SELECT * FROM pagamentos WHERE credor_id = :pIDCredor';

       with DM_Pesq.Qry_Geral do
       begin

           close;
           sql.Clear;
           sql.Add(_Sql);
           Params.ParamByName('pIDCredor').AsInteger := StrToInt(DBEdit1.Text);
           open;

           if not IsEmpty then
           begin

               Application.MessageBox('Este credor tem pagamentos cadastrados e não pode ser excluído!',
               'Exclusão não permitida!', MB_OK + MB_ICONINFORMATION);
               RetornaEstadoInicialDosBotoes;
               exit;

           end else begin

              ExcluirCredor;

           end;

       end;

end;

procedure T_frmCadCredores.ExcluirCredor;
begin

      texto:= 'Confirma a exclusão do ítem selecionado?';

       if Application.MessageBox(PChar(texto),'Excluíndo ítem',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

           _Sql:= 'Delete FROM credores WHERE id_credor = :pIDcredor';

            with DM_Pesq.Qry_Geral do begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              ParamByName('pIDcredor').AsInteger := StrToInt(DBEdit1.Text);
              ExecSQL();

           end;

           Application.MessageBox('Credor excluído com sucesso!',
           'Exclusão', MB_OK + MB_ICONINFORMATION);
           LogOperacoes(NomeDoUsuarioLogado, 'exclusão de credor');

           FecharAbrirTabelas;
           RetornaEstadoInicialDosBotoes;

      end else begin

          RetornaEstadoInicialDosBotoes;
          exit;

      end;

end;

end.
