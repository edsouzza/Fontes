unit U_CadSenhaUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls;

type
  T_frmCadSenhaUsuario = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl_DadosUsuario: TPanel;
    btn_GravarSenha: TSpeedButton;
    grp_CadastrarSenha: TGroupBox;
    lbl1: TLabel;
    txt_NomeUsuario: TStaticText;
    lbl3: TLabel;
    edt_PrimeiraSenha: TEdit;
    txtLogin: TStaticText;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_PrimeiraSenhaChange(Sender: TObject);
    procedure GravarSenhaInicial;
    procedure btn_GravarSenhaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Criptografar;
    procedure AbrirTabelas;
    procedure FecharTabelas;

  private
    { Private declarations }

  public
    { Public declarations }


  end;

var
  _frmCadSenhaUsuario: T_frmCadSenhaUsuario;

implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo,
  U_principal, U_Login, U_Funcionarios, DB, U_CadFuncionarios;

{$R *.dfm}


procedure T_frmCadSenhaUsuario.FormCreate(Sender: TObject);
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

  AbrirTabelas;

end;

procedure T_frmCadSenhaUsuario.FormShow(Sender: TObject);
begin

     txt_NomeUsuario.Caption := NomeUsuarioParaNovaSenha;
     txtLogin.Caption        := LoginUsuarioParaNovaSenha;

end;

procedure T_frmCadSenhaUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Close;
    Release;

end;

procedure T_frmCadSenhaUsuario.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmCadSenhaUsuario.edt_PrimeiraSenhaChange(Sender: TObject);
var
    vl_label : TLabel; //variável do tipo Label
begin

      btn_GravarSenha.Enabled    := True;

      vl_label := TLabel.Create(self); //criamos um label

      with vl_label do
      begin

          //pegamos a fonte usada no edit
          Font.Name := TEdit(sender).Font.Name;

          //pegamos o conteúdo do edit
          Caption   := TEdit(sender).Text;

         //centraliza no label e retorna para o edit
          SendMessage(TEdit(sender).Handle, EM_SETMARGINS, EC_LEFTMARGIN,
          (TEdit(sender).Width-vl_label.Width) div 2);

      end;

      vl_label.Free;      

end;


procedure T_frmCadSenhaUsuario.btn_GravarSenhaClick(Sender: TObject);
begin

    //GRAVANDO UMA SENHA INICIAL PARA O NOVO FUNCIONARIO

    if not( edt_PrimeiraSenha.Text = '') then
         GravarSenhaInicial
    else
        Application.MessageBox('Digite uma senha para continuar!', 'Senha inválida', MB_OK);

end;

procedure T_frmCadSenhaUsuario.GravarSenhaInicial;
var
  Senha : string;
begin

    Criptografar;

    //GRAVANDO UMA SENHA INICIAL PARA O NOVO FUNCIONARIO

    Senha   := dm_DadosSegundo.criptografa.Output;

    with  DM_Pesq.Qry_Geral do
    begin

        Close;
        SQL.Clear;
        SQL.Add('Update login SET senha = :pSenha WHERE id_usuario =:pIdUsuario');
        Params.ParamByName('pSenha').AsString       := Senha;
        Params.ParamByName('pIdUsuario').AsInteger  := idUsuarioSelecionado;
        ExecSQL();

    end;

    dm_DadosSegundo.cds_Login.ApplyUpdates(0);

    Application.MessageBox('Senha cadastrada com Sucesso!', 'OK', MB_OK);
    Close;

end;   

procedure T_frmCadSenhaUsuario.Criptografar;
begin

    with dm_DadosSegundo.criptografa do
     begin

        Action := atEncryption;
        Input  := edt_PrimeiraSenha.Text;
        Execute;

     end;

end;


procedure T_frmCadSenhaUsuario.AbrirTabelas;
begin

    dm_Conexao.cds_DadosFuncionarios.Active      := True;
    dm_DadosSegundo.cds_Login.Active             := True;

end;

procedure T_frmCadSenhaUsuario.FecharTabelas;
begin

    dm_Conexao.cds_DadosFuncionarios.Active      := false;
    dm_DadosSegundo.cds_Login.Active             := false;

end;

end.
