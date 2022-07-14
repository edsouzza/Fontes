unit U_CancelarOuSairDoPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit;

type
  T_frmCancelarOuSairDoPedido = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl_DadosUsuario: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    btnCancelar: TSpeedButton;
    rdCancelarOuSair: TRadioGroup;
    procedure AbrirTabelas;
    procedure AbrirFecharTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);


  private
    { Private declarations }


  public
    { Public declarations }


  end;

var
  _frmCancelarOuSairDoPedido: T_frmCancelarOuSairDoPedido;


implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo,
  U_FecharPedido;

{$R *.dfm}


procedure T_frmCancelarOuSairDoPedido.FormCreate(Sender: TObject);
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


procedure T_frmCancelarOuSairDoPedido.AbrirTabelas;
begin

    dm_Conexao.cds_CadProduto.Active      := True;

end;


procedure T_frmCancelarOuSairDoPedido.AbrirFecharTabelas;
begin

    dm_Conexao.cds_CadProduto.Active      := False;
    dm_Conexao.cds_CadProduto.Active      := True;

end;


procedure T_frmCancelarOuSairDoPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Release;

end;

procedure T_frmCancelarOuSairDoPedido.FormActivate(Sender: TObject);
begin

    AbrirTabelas;

end;

procedure T_frmCancelarOuSairDoPedido.FormKeyPress(Sender: TObject; var Key: Char);
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



procedure T_frmCancelarOuSairDoPedido.btnCancelarClick(
  Sender: TObject);
begin

   Case rdCancelarOuSair.ItemIndex Of

      0: _frmFecharPedido.CancelarPedido;
      1: _frmFecharPedido.close;

   end;

   close;

end;

end.
