unit USobre;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg;

type
  T_frmSobre = class(TForm)
    Panel1: TPanel;
    ImgDaEmpresa: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    btnSair: TSpeedButton;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmSobre: T_frmSobre;

implementation

uses u_Principal;

{$R *.dfm}

procedure T_frmSobre.FormCreate(Sender: TObject);

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

procedure T_frmSobre.btnSairClick(Sender: TObject);
begin
    _frmPrincipal.logo.Visible := true;
    Close;
end;

end.

