unit U_EscolhaDoFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  T_frmEscolhaDoFinanceiro = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    btnImprimirRelatorios: TSpeedButton;
    btnConsultarBalancete: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure btnImprimirRelatoriosClick(Sender: TObject);
    procedure btnConsultarBalanceteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmEscolhaDoFinanceiro: T_frmEscolhaDoFinanceiro;

implementation

uses U_Balancete, U_Financeiro, U_BiblioSysSalao, U_principal;

{$R *.dfm}

procedure T_frmEscolhaDoFinanceiro.FormCreate(Sender: TObject);
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


    //Recebe a data atual por padrão

    lblDataDoDia.Caption    :=  DateToStr(now);
    lblHoraAtual.Caption    :=  timetoStr(time);


end;

procedure T_frmEscolhaDoFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

     Close;
     Release;

end;

procedure T_frmEscolhaDoFinanceiro.pnl_rodapeClick(Sender: TObject);
begin
     _frmPrincipal.logo.Visible := true;
     close;
     Release;

end;

procedure T_frmEscolhaDoFinanceiro.btnImprimirRelatoriosClick(
  Sender: TObject);
begin

      Application.CreateForm(T_frmFinanceiro,  _frmFinanceiro);
      _frmFinanceiro.ShowModal;
      FreeAndNil(_frmFinanceiro);

      Close;
      Release;

end;

procedure T_frmEscolhaDoFinanceiro.btnConsultarBalanceteClick(
  Sender: TObject);
begin


    Application.CreateForm(T_frmBalancete,  _frmBalancete);
    _frmBalancete.ShowModal;
    FreeAndNil(_frmBalancete);

    Close;
    Release;

end;

end.
