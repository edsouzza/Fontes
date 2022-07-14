unit U_QdeCotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls;

type
  T_frmQdeCotada = class(TForm)
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
  _frmQdeCotada: T_frmQdeCotada;

implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo,
  U_Cotacao, U_EscolhaDoProdutoParaCotacao, U_EscolhaProdutoFecharCotacao;


{$R *.dfm}


procedure T_frmQdeCotada.FormCreate(Sender: TObject);
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


procedure T_frmQdeCotada.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Close;
    Release;

end;


procedure T_frmQdeCotada.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmQdeCotada.btn_FecharClick(Sender: TObject);
begin

    Close;

end;



procedure T_frmQdeCotada.edt_qdeCotadaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if key = 13 then
   begin

        _frmCotacao.panel_itensCotacao.Visible        := true;
        _frmCotacao.edt_QuantidadeProdutoCotacao.Text := edt_qdeCotada.Text;
        _frmCotacao.btnInserirProdutoClick(Self);
        _frmEscolhaProdutoParaCotacao.Close;     

        close;

   end;
   
end;

procedure T_frmQdeCotada.pnl_rodapeClick(Sender: TObject);
begin
  close;
end;

procedure T_frmQdeCotada.edt_qdeCotadaKeyPress(Sender: TObject;
  var Key: Char);
begin

     // Só aceita digitação de números

     If NOT (Key in['0'..'9',#8,#13]) then begin Key:=#0;end;


end;

end.
