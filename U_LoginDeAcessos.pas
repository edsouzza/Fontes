unit U_LoginDeAcessos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles;

type
  T_frmLoginDeAcessos = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl_EscolhaUsuario: TPanel;
    btn_Entrar: TSpeedButton;
    btn_Sair: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    pnl_DadosUsuario: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edt_Senha: TEdit;
    edt_Usuario: TStaticText;
    procedure btn_SairClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edt_SenhaChange(Sender: TObject);
    procedure btn_EntrarClick(Sender: TObject);
    procedure Autenticar;
    procedure Descriptografar;
    procedure edt_SenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);

 
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  _frmLoginDeAcessos: T_frmLoginDeAcessos;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmDadosSegundo, U_principal,
  U_dmPesquisas, U_MovimentaCaixa, DB;

{$R *.dfm}


procedure T_frmLoginDeAcessos.FormCreate(Sender: TObject);
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

end;


procedure T_frmLoginDeAcessos.AbrirTabelas;
begin

    dm_DadosSegundo.cds_Login.Active             := True;
    dm_Conexao.cds_acessos.Active                := True;

end;


procedure T_frmLoginDeAcessos.FecharTabelas;
begin

    dm_DadosSegundo.cds_Login.Active             := False;
    dm_Conexao.cds_acessos.Active                := False;

end;


procedure T_frmLoginDeAcessos.btn_SairClick(Sender: TObject);
begin

    close;
    TemAcesso := false;

end;


procedure T_frmLoginDeAcessos.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    close;
    Release;

end;

procedure T_frmLoginDeAcessos.FormActivate(Sender: TObject);
begin

    AbrirTabelas;

end;

procedure T_frmLoginDeAcessos.edt_SenhaChange(Sender: TObject);
begin

    btn_Entrar.Enabled:= true;

end;


procedure T_frmLoginDeAcessos.btn_EntrarClick(Sender: TObject);
begin

    Autenticar;

end;



procedure T_frmLoginDeAcessos.Autenticar;
begin

      btn_Sair.Enabled     := True;
      btn_Entrar.Enabled   := False;


      if (dm_DadosSegundo.cds_Login.Locate('usuario', edt_Usuario.Caption,[])) then
      begin

           Descriptografar;

           if (edt_Senha.Text = dm_DadosSegundo.criptografa.Output) then
           begin

                Application.MessageBox('Acesso Liberado para esta operação!', 'Informação de Sistema!',
                                       MB_OK + MB_ICONINFORMATION);
                Tentativas  := 0;
                TemAcesso   := true;
                Close;

           end  else
           begin

              if Tentativas <= 1 then
              begin

                  Application.MessageBox('Senha Incorreta!', 'Erro de Autenticação!',
                                         MB_OK + MB_ICONWARNING);
                  TemAcesso := false;
                  edt_Senha.Clear;
                  edt_Senha.SetFocus;
                  btn_Entrar.Enabled:= False;
                  Inc(Tentativas);

              end else if Tentativas = 2 then
              begin

                 Application.MessageBox('Desculpe você não tem permissão para esse tipo de operação!', 'Usuário sem permissão!',
                                        MB_OK + MB_ICONWARNING);
                 TemAcesso := false;
                 Tentativas:= 0;
                 close;

              end;

           end;
      end
      else begin

           Application.MessageBox('Usuário não encontrado, verifique!', 'Erro de Autenticação!',
                                         MB_OK + MB_ICONWARNING);
           edt_Senha.Clear;
           btn_Entrar.Enabled := false;
           exit;

      end;

end;


procedure T_frmLoginDeAcessos.Descriptografar;
begin

      with dm_DadosSegundo.criptografa do
      begin

        Action := atDecryption;
        Input  := dm_DadosSegundo.cds_Login.fieldByname('senha').AsString;
        Execute;

      end;

end;


procedure T_frmLoginDeAcessos.edt_SenhaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

       if key = 13 then
       begin

           Autenticar;

       end;

end;

procedure T_frmLoginDeAcessos.FormShow(Sender: TObject);
begin
    Descriptografar;
end;

end.

