unit U_AlteraPrecoDeCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit, DB;

type
  T_frmAlteraPrecoDeCompra = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    btn_Sair: TSpeedButton;
    pnl_DadosUsuario: TPanel;
    btn_GravarNovoPreco: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    pnl1: TPanel;
    grValoresAtuais: TGroupBox;
    lbl4: TLabel;
    edt_DESCRICAO: TDBEdit;
    Label2: TLabel;
    edt_PRECOVENDA: TDBEdit;
    Label3: TLabel;
    edt_PRECOCOMPRA: TDBEdit;
    edt_IDPRODUTO: TDBEdit;
    grNovosValores: TGroupBox;
    lblTipoAlteracao: TLabel;
    edt_ValorAlteracao: TCurrencyEdit;
    Label4: TLabel;
    edt_VALORLUCRO: TCurrencyEdit;
    txtStatus: TStaticText;
    procedure btn_SairClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure AbrirFecharTabelas;
    procedure calcularNovoPrecoVenda;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GravarAlteracaoDoPreco;
    procedure btn_GravarNovoPrecoClick(Sender: TObject);
    procedure CalcularNovoPrecoLucro;
    procedure edt_VALORLUCROEnter(Sender: TObject);
    procedure edt_ValorAlteracaoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ValorAlteracaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edt_ValorAlteracaoEnter(Sender: TObject);
    procedure edt_ValorAlteracaoClick(Sender: TObject);
    procedure edt_ValorAlteracaoExit(Sender: TObject);


  private
    { Private declarations }
    novoprecocompra, valorlucro, valorCompraAtual : double;
    idProduto : integer;

  public
    { Public declarations }


  end;

var
  _frmAlteraPrecoDeCompra: T_frmAlteraPrecoDeCompra;
  PrecoCusto, PrecoVenda, PercentualLucro : Currency;


implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo,
  U_principal, U_Produtos;

{$R *.dfm}


procedure T_frmAlteraPrecoDeCompra.FormCreate(Sender: TObject);
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
   idProduto           :=  StrToInt(edt_IDPRODUTO.Text);

end;


procedure T_frmAlteraPrecoDeCompra.AbrirTabelas;
begin

    dm_Conexao.cds_CadProduto.Active      := True;

end;

procedure T_frmAlteraPrecoDeCompra.AbrirFecharTabelas;
begin

    dm_Conexao.cds_CadProduto.Active      := False;
    dm_Conexao.cds_CadProduto.Active      := True;

end;

procedure T_frmAlteraPrecoDeCompra.btn_SairClick(Sender: TObject);
begin

    Close;
   
end;

procedure T_frmAlteraPrecoDeCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Release;

end;

procedure T_frmAlteraPrecoDeCompra.FormActivate(Sender: TObject);
begin

    AbrirTabelas;

end;

procedure T_frmAlteraPrecoDeCompra.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmAlteraPrecoDeCompra.btn_GravarNovoPrecoClick(Sender: TObject);
begin

    GravarAlteracaoDoPreco;

    AbrirFecharTabelas;
    btn_GravarNovoPreco.Enabled:= False;

end;

procedure T_frmAlteraPrecoDeCompra.CalcularNovoPrecoLucro;
begin

      precovenda           := strtofloat( edt_PRECOVENDA.text );
      novoprecocompra      := strtofloat( edt_ValorAlteracao.text );
      valorlucro           := ( precovenda - novoprecocompra  );
      edt_PRECOCOMPRA.text :=  floattostr( novoprecocompra );
      edt_VALORLUCRO.Text  := floattostr( valorlucro );

end;


procedure T_frmAlteraPrecoDeCompra.GravarAlteracaoDoPreco;
var  texto : string;
begin

    with DM_Pesq.Qry_Geral do
    begin

       Close;
       SQL.Clear;
       SQL.Add('Update Produtos Set PrecoCompra  = :pCompra, valordelucro=:pLucro Where id_produto = :pIDproduto');
       Params.ParamByName('pCompra').AsFloat       := StrToFloat(edt_ValorAlteracao.Text);
       Params.ParamByName('pLucro').AsFloat        := StrToFloat(edt_VALORLUCRO.Text);
       Params.ParamByName('pIDproduto').AsInteger := StrToInt(edt_IDPRODUTO.Text);
       ExecSQL();

    end;

    dm_Conexao.cds_CadProduto.ApplyUpdates(0);
    AbrirFecharTabelas;
    
    texto := 'O preço de compra do produto foi alterado com sucesso!';
    Application.MessageBox(PChar(texto),'Confirmação', MB_OK);
    LogOperacoes(NomeDoUsuarioLogado, 'alteração do preço de compra de um produto');
    _frmProdutos.dbedtQUANTIDADE.SetFocus;

    Close;

end;

procedure T_frmAlteraPrecoDeCompra.edt_VALORLUCROEnter(Sender: TObject);
begin

    btn_GravarNovoPreco.Enabled := true;
    txtStatus.Caption           := 'Grave a alteração clicando no botão abaixo!';
    CalcularNovoPrecoLucro;

end;

procedure T_frmAlteraPrecoDeCompra.edt_ValorAlteracaoKeyPress(
  Sender: TObject; var Key: Char);
begin

    grValoresAtuais.Enabled := false;

end;

procedure T_frmAlteraPrecoDeCompra.calcularNovoPrecoVenda;
var
   novoValorPrecoVenda, valorPercentual, novoValorPrecoCompra : double;
begin

    novoValorPrecoCompra := StrToFloat(edt_PRECOCOMPRA.Text);

    ShowMessage('id do produto : '+intToStr(idProduto));
    ShowMessage('percentual de lucro : ' +FloatToStr(retornaValorPercentualDeLucro(idProduto)));

    valorPercentual        := retornaValorPercentualDeLucro(idProduto);

    novoValorPrecoVenda    := (novoValorPrecoCompra+(novoValorPrecoCompra * valorPercentual)/100);
    edt_PRECOVENDA.Text    := FloatToStr(novoValorPrecoVenda);

    //GRAVAR NOVO PREÇO DE VENDA

    _Sql := 'UPDATE produtos SET precovenda = :pPrecoVenda WHERE id_produto = :pID';

    with DM_Pesq.cdsPesqGeral do
    begin

         close;
         CommandText := _Sql;
         Params.ParamByName('pPrecoVenda').AsFloat   := novoValorPrecoVenda;
         Params.ParamByName('pID').AsInteger         := idProduto;
         execute;

    end;

end;

procedure T_frmAlteraPrecoDeCompra.edt_ValorAlteracaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

     if key=13 then
     begin

         edt_VALORLUCRO.Enabled := true;

         if ( StrToFloat(edt_ValorAlteracao.text) = 0 ) then
         begin
              texto := 'Zero não é um valor válido, digite um valor de compra';
              Application.MessageBox(Pchar(texto), 'Valor inválido!',MB_OK + MB_ICONEXCLAMATION);
              edt_ValorAlteracao.Text     := FloatToStr(valorCompraAtual);
              edt_PRECOCOMPRA.Text        := FloatToStr(valorCompraAtual);
              btn_GravarNovoPreco.Enabled := false;
              edt_ValorAlteracao.SetFocus;

         end else
         begin

              novoprecocompra             := StrToFloat(edt_ValorAlteracao.Text);
              edt_ValorAlteracao.Text     := FloatToStr(novoprecocompra);
              edt_PRECOCOMPRA.Text        := FloatToStr(novoprecocompra);

         end;

     end;

end;

procedure T_frmAlteraPrecoDeCompra.FormShow(Sender: TObject);
begin
    edt_ValorAlteracao.Text := edt_PRECOCOMPRA.Text;
    valorCompraAtual        := StrToFloat(edt_PRECOCOMPRA.text)
end;

procedure T_frmAlteraPrecoDeCompra.edt_ValorAlteracaoEnter(
  Sender: TObject);
begin
    txtStatus.Caption := 'Entre com o novo valor e tecle enter';
end;

procedure T_frmAlteraPrecoDeCompra.edt_ValorAlteracaoClick(
  Sender: TObject);
begin
    edt_ValorAlteracao.SelStart  := 0;
    edt_ValorAlteracao.SelLength := length(edt_ValorAlteracao.Text);
end;

procedure T_frmAlteraPrecoDeCompra.edt_ValorAlteracaoExit(Sender: TObject);
begin
  calcularNovoPrecoVenda;
end;

end.


