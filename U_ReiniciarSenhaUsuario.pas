unit U_ReiniciarSenhaUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls;

type
  T_frmReiniciarSenhaUsuario = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl_DadosUsuario: TPanel;
    btn_ReiniciarSenha: TSpeedButton;
    grp_ReiniciarSenha: TGroupBox;
    dbgrd_Usuarios: TDBGrid;
    btn_Fechar: TSpeedButton;
    lbl49: TLabel;
    lblStatusLogoff: TLabel;
    lblHoraAtual: TLabel;
    edt_PrimeiraSenha: TEdit;
    txtNomeUsuarioReiniciarSenha: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_PrimeiraSenhaChange(Sender: TObject);
    procedure btn_FecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Criptografar;
    procedure btn_ReiniciarSenhaClick(Sender: TObject);
    procedure dbgrd_UsuariosCellClick(Column: TColumn);
    procedure edt_PrimeiraSenhaEnter(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure PopularGridUsuarios;

  private
    { Private declarations }
    IDUsuario : integer;
    nomeFunc  : string;
  public
    { Public declarations }

  end;

var
  _frmReiniciarSenhaUsuario: T_frmReiniciarSenhaUsuario;

implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo,
  U_principal, U_Login, U_Funcionarios, DB, U_CadSenhaUsuario;

{$R *.dfm}


procedure T_frmReiniciarSenhaUsuario.FormCreate(Sender: TObject);
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

  lblHoraAtual.Caption    := timetoStr(time);
  lblStatusLogoff.Caption := NomeDoUsuarioLogado;

  AbrirTabelas;

end;

procedure T_frmReiniciarSenhaUsuario.FormShow(Sender: TObject);
begin

   PopularGridUsuarios;

end;


procedure T_frmReiniciarSenhaUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Close;
    Release;

end;


procedure T_frmReiniciarSenhaUsuario.FormKeyPress(Sender: TObject; var Key: Char);
begin

  // Enter por Tab
  //verifica se a tecla pressionada � a tecla ENTER, conhecida pelo Delphi como #13
  If key = #13 then
  Begin

    //se for, passa o foco para o pr�ximo campo, zerando o valor da vari�vel Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);

  end;
end;


procedure T_frmReiniciarSenhaUsuario.edt_PrimeiraSenhaChange(Sender: TObject);
begin

      btn_Fechar.Enabled := false;

end;


procedure T_frmReiniciarSenhaUsuario.btn_FecharClick(Sender: TObject);
begin

    Close;

end;

procedure T_frmReiniciarSenhaUsuario.Criptografar;
begin

    with dm_DadosSegundo.criptografa do
     begin

        Action := atEncryption;
        Input  := edt_PrimeiraSenha.Text;
        Execute;

     end;

end;


procedure T_frmReiniciarSenhaUsuario.btn_ReiniciarSenhaClick(Sender: TObject);
var
    texto : string;
begin

    texto:= 'Confirma o desejo de reiniciar a senha de '+#13+nomeFunc+'?';

    if Application.MessageBox(PChar(texto),'Reinicializa��o de Senha',MB_YESNO + MB_ICONQUESTION) = IdYes then
    begin

         with dm_DadosSegundo.cds_Login do
         begin

             CommandText:= 'update login set senha = :pSenha where id_usuario = :pIDUsuario';
             Params.ParamByName('pSenha').AsString:= '';
             Params.ParamByName('pIDUsuario').AsInteger:= idUsuarioSelecionado;
             Execute;

         end;

          messagedlg('Senha reiniciada com sucesso, cadastre a nova senha e/ou a provis�ria!',mtwarning,[mbyes],0);

          NomeUsuarioParaNovaSenha := txtNomeUsuarioReiniciarSenha.Caption;

          Application.CreateForm(T_frmCadSenhaUsuario,  _frmCadSenhaUsuario);
          _frmCadSenhaUsuario.ShowModal;
          FreeAndNil(_frmCadSenhaUsuario);

          Close;

    end
    else begin btn_ReiniciarSenha.Enabled := false; Exit; end;

end;


procedure T_frmReiniciarSenhaUsuario.dbgrd_UsuariosCellClick(Column: TColumn);
begin

   IDUsuario                            := DM_Pesq.cdsPesqCliente.FieldByName('id_usuario').AsInteger;
   txtNomeUsuarioReiniciarSenha.Caption := DM_Pesq.cdsPesqCliente.FieldByName('usuario').AsString;
   btn_ReiniciarSenha.Enabled           := true;
   btn_Fechar.Enabled                   := true;

end;

procedure T_frmReiniciarSenhaUsuario.edt_PrimeiraSenhaEnter(Sender: TObject);
begin

    grp_ReiniciarSenha.Enabled:= false;

end;

procedure T_frmReiniciarSenhaUsuario.AbrirTabelas;
begin

    dm_Conexao.cds_DadosFuncionarios.Active      := True;
    dm_DadosSegundo.cds_Login.Active             := True;

end;

procedure T_frmReiniciarSenhaUsuario.FecharTabelas;
begin

    dm_Conexao.cds_DadosFuncionarios.Active      := false;
    dm_DadosSegundo.cds_Login.Active             := false;

end;

procedure T_frmReiniciarSenhaUsuario.PopularGridUsuarios;
begin

      with DM_Pesq.cdsPesqCliente do
      begin

            Close;
            CommandText:= ('SELECT f.func_id, f.func_nome, f.func_login FROM funcionarios f, login l WHERE f.func_id = l.func_id and f.func_id = :pIDFunc');
            params.ParamByName('pIDFunc').AsInteger := idUsuarioSelecionado;
            Open;

            if not DM_Pesq.cdsPesqCliente.IsEmpty then
            begin
                nomeFunc                             := DM_Pesq.cdsPesqCliente.fieldbyname('func_nome').AsString;
                txtNomeUsuarioReiniciarSenha.Caption := nomeFunc;
                LoginUsuarioParaNovaSenha            := DM_Pesq.cdsPesqCliente.fieldbyname('func_login').AsString;

                with dbgrd_Usuarios do
                begin

                  DataSource:=  DM_Pesq.dsPesqCliente;
                  Columns.Clear;

                  Columns.Add;
                  Columns[0].FieldName         := 'func_nome';
                  Columns[0].Width             := 450;
                  Columns[0].Alignment         := taLeftJustify;

                end;

            end;
        end;    
end;

end.
