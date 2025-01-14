unit U_BloquearModuloFrenteCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  T_frmBloquearModuloFrenteCaixa = class(TForm)
    pnl_Desbloqueio: TPanel;
    grp2: TGroupBox;
    grp1: TGroupBox;
    grp4: TGroupBox;
    lbl1: TLabel;
    btn_BloquearModulo: TSpeedButton;
    grp3: TGroupBox;
    btn_Sair: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_BloquearModuloClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmBloquearModuloFrenteCaixa: T_frmBloquearModuloFrenteCaixa;

implementation

uses U_BiblioSysSalao, U_principal;

{$R *.dfm}

procedure T_frmBloquearModuloFrenteCaixa.FormCreate(Sender: TObject);
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

end;

procedure T_frmBloquearModuloFrenteCaixa.btn_BloquearModuloClick(
  Sender: TObject);
begin

    texto := 'Confirma o desejo de bloquear o m�dulo frente de caixa?';
    if Application.MessageBox(PChar(texto),'Bloqueando M�dulo Frente de Caixa!',MB_YESNO + MB_ICONWARNING) = IdYes then
    begin

       BloquearFrenteDeCaixa;
       close;

    end;

end;

procedure T_frmBloquearModuloFrenteCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    _frmPrincipal.logo.Visible := true;
end;

procedure T_frmBloquearModuloFrenteCaixa.btn_SairClick(Sender: TObject);
begin
  close;
end;

end.
