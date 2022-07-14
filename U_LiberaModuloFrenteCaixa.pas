unit U_LiberaModuloFrenteCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  T_frmLiberarModuloFrenteCaixa = class(TForm)
    pnl_Desbloqueio: TPanel;
    grp2: TGroupBox;
    grp1: TGroupBox;
    edt_Chave: TEdit;
    grp3: TGroupBox;
    btn_LiberarModulo: TSpeedButton;
    btn_Sair: TSpeedButton;
    grp4: TGroupBox;
    lbl1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_LiberarModuloClick(Sender: TObject);
    procedure edt_ChaveChange(Sender: TObject);
    procedure edt_ChaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    chave : string;
   
  public
    { Public declarations }
  end;

var
  _frmLiberarModuloFrenteCaixa: T_frmLiberarModuloFrenteCaixa;

implementation

uses U_BiblioSysSalao, U_principal, U_BloquearModuloFrenteCaixa;

{$R *.dfm}

procedure T_frmLiberarModuloFrenteCaixa.FormCreate(Sender: TObject);
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

procedure T_frmLiberarModuloFrenteCaixa.btn_SairClick(Sender: TObject);
begin  
  close;
end;

procedure T_frmLiberarModuloFrenteCaixa.btn_LiberarModuloClick(
  Sender: TObject);
begin

    chave := trim(edt_Chave.Text);            //chave = '872D598132A438A1B29578532'
    if ( chave = CHAVEFRENTECAIXA )then
    begin
         LiberarFrenteDeCaixa;   
         _frmPrincipal.ReiniciarComMensagemTemporizada;
         close;
    end else
    begin
         Application.MessageBox('Chave  inválida  por  favor  entre  em  contato  com  o  suporte'#13'para   obter  uma  chave  válida  para  liberação deste módulo!', 'Chave de liberação inválida!', MB_OK + MB_ICONWARNING);
         edt_Chave.Clear;            
    end;

end;

procedure T_frmLiberarModuloFrenteCaixa.edt_ChaveChange(Sender: TObject);
begin
      btn_LiberarModulo.Enabled := true;   
end;

procedure T_frmLiberarModuloFrenteCaixa.edt_ChaveKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);     
begin

    if (KEY=VK_F1)then
    begin
          if (NivelFuncao=1)then
          begin
              LiberarFrenteDeCaixa;
              _frmPrincipal.ReiniciarComMensagemTemporizada;
              close;
          end;
    end;      

end;

procedure T_frmLiberarModuloFrenteCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    _frmPrincipal.logo.Visible := true;   
end;

end.
