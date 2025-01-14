unit U_QdeFecharCotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls;

type
  T_frmQdeCotadaFecharCotacao = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl_DadosUsuario: TPanel;
    grp_CadastrarSenha: TGroupBox;
    edt_qdeCotada: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_FecharClick(Sender: TObject);
    procedure edt_qdeCotadaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure edt_qdeCotadaKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  _frmQdeCotadaFecharCotacao: T_frmQdeCotadaFecharCotacao;

implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo,
  U_Cotacao, U_EscolhaDoProdutoParaCotacao, U_EscolhaProdutoFecharCotacao,
  U_FecharCotacao;


{$R *.dfm}


procedure T_frmQdeCotadaFecharCotacao.FormCreate(Sender: TObject);
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


procedure T_frmQdeCotadaFecharCotacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Close;
    Release;

end;


procedure T_frmQdeCotadaFecharCotacao.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmQdeCotadaFecharCotacao.btn_FecharClick(Sender: TObject);
begin

    Close;

end;



procedure T_frmQdeCotadaFecharCotacao.edt_qdeCotadaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if key = 13 then
   begin

        _frmFecharCotacao.panel_itensCotacao.Visible        := true;
        _frmFecharCotacao.edt_QuantidadeProdutoCotacao.Text := edt_qdeCotada.Text;
        _frmFecharCotacao.btnInserirProdutoClick(Self);
        _frmEscolhaProdutoParaFecharCotacao.Close;

        close;

   end;
   
end;

procedure T_frmQdeCotadaFecharCotacao.pnl_rodapeClick(Sender: TObject);
begin
  close;
end;

procedure T_frmQdeCotadaFecharCotacao.edt_qdeCotadaKeyPress(Sender: TObject;
  var Key: Char);
begin

     // S� aceita digita��o de n�meros

     If NOT (Key in['0'..'9',#8,#13]) then begin Key:=#0;end;


end;

end.
