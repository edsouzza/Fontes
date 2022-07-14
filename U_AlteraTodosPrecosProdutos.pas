unit U_AlteraTodosPrecosProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit;

type
  T_frmAlteraTodosPrecos = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    btn_SairDaAlteracaoDosPrecos: TSpeedButton;
    pnl_DadosUsuario: TPanel;
    btn_GravarAlteracaoDosPrecos: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    grp1: TGroupBox;
    pnl1: TPanel;
    lbl2: TLabel;
    lbl5: TLabel;
    edt_PercentualDeAlteracao: TEdit;
    procedure AbrirTabelas;
    procedure AbrirFecharTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GravarAlteracaoDosPrecos;
    procedure btn_GravarAlteracaoDosPrecosClick(Sender: TObject);
    procedure btn_SairDaAlteracaoDosPrecosClick(Sender: TObject);
    procedure edt_PercentualDeAlteracaoKeyPress(Sender: TObject;
      var Key: Char);


  private
    { Private declarations }


  public
    { Public declarations }


  end;

var
  _frmAlteraTodosPrecos: T_frmAlteraTodosPrecos;
  PrecoCusto, PrecoVenda, PercentualLucro : Currency;

implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo,
  U_principal, U_Produtos;

{$R *.dfm}


procedure T_frmAlteraTodosPrecos.FormCreate(Sender: TObject);
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


procedure T_frmAlteraTodosPrecos.AbrirTabelas;
begin

    dm_Conexao.cds_CadProduto.Active      := True;

end;


procedure T_frmAlteraTodosPrecos.AbrirFecharTabelas;
begin

    dm_Conexao.cds_CadProduto.Active      := False;
    dm_Conexao.cds_CadProduto.Active      := True;

end;


procedure T_frmAlteraTodosPrecos.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Release;

end;

procedure T_frmAlteraTodosPrecos.FormActivate(Sender: TObject);
begin

    AbrirTabelas;

end;

procedure T_frmAlteraTodosPrecos.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure T_frmAlteraTodosPrecos.GravarAlteracaoDosPrecos;
begin

     texto := 'Os preços dos produtos cadastrados foram aumentados em ' +(edt_PercentualDeAlteracao.Text)+ '%';

    //grava o aumento dos preços de acordo com o percentual digitado

    with DM_Pesq.Qry_Geral do
    begin

       Close;
       SQL.Clear;
       SQL.Add('Update Produtos Set PrecoVenda = ((PrecoVenda * (:pPercent))/100)+PrecoVenda');
       Params.ParamByName('pPercent').AsInteger := StrToInt(edt_PercentualDeAlteracao.Text);
       ExecSQL();

    end;


    //altera todos os valores de lucro utilizando-se dos valores de ( precovenda e precocompra )

    with DM_Pesq.Qry_Auxiliar do
    begin

       Close;
       SQL.Clear;
       SQL.Add('Update Produtos Set valordelucro=(precovenda-precocompra)');
       ExecSQL();

    end;

    AbrirFecharTabelas;
    Application.MessageBox(PChar(texto),'Confirmação', MB_OK);
    LogOperacoes(NomeDoUsuarioLogado, 'alterado preço dos produtos por percentual');
    Close;

end;

procedure T_frmAlteraTodosPrecos.btn_GravarAlteracaoDosPrecosClick(
  Sender: TObject);
begin

    //altera o valor dos precos e dos lucros de acordo com o percentual escolhido
    GravarAlteracaoDosPrecos;

end;

procedure T_frmAlteraTodosPrecos.btn_SairDaAlteracaoDosPrecosClick(
  Sender: TObject);
begin

   Close;

end;

procedure T_frmAlteraTodosPrecos.edt_PercentualDeAlteracaoKeyPress(
  Sender: TObject; var Key: Char);
begin

    btn_GravarAlteracaoDosPrecos.Enabled   := true;      

end;



end.
