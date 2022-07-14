unit U_AlteraPrecoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit, DB;

type
  T_frmAlteraPreco = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    btn_Sair: TSpeedButton;
    pnl_DadosUsuario: TPanel;
    btn_GravarNovoPreco: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    panGridPrincipal: TPanel;
    grValorAtual: TGroupBox;
    lbl4: TLabel;
    edt_DESCRICAO: TDBEdit;
    Label2: TLabel;
    edt_PRECOVENDA: TDBEdit;
    Label3: TLabel;
    edt_PRECOCOMPRA: TDBEdit;
    grNovosValores: TGroupBox;
    lblTipoAlteracao: TLabel;
    edt_ValorAlteracao: TCurrencyEdit;
    Label4: TLabel;
    edt_IDPRODUTO: TDBEdit;
    grOpcoesAtualizacao: TGroupBox;
    rd_valordireto: TRadioButton;
    rd_Percentual: TRadioButton;
    Label1: TLabel;
    edt_VALORLUCRO: TCurrencyEdit;
    txtStatus: TStaticText;
    Label5: TLabel;
    edt_NovoValorVenda: TCurrencyEdit;
    edt_ValorPercentual: TEdit;
    procedure btn_SairClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure AbrirFecharTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GravarAlteracaoDoPreco;
    procedure btn_GravarNovoPrecoClick(Sender: TObject);
    procedure CalcularNovoPrecoVenda;
    procedure rd_valordiretoClick(Sender: TObject);
    procedure rd_PercentualClick(Sender: TObject);
    procedure edt_ValorAlteracaoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ValorAlteracaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_VALORLUCROEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_ValorAlteracaoEnter(Sender: TObject);
    procedure edt_ValorAlteracaoClick(Sender: TObject);
    procedure edt_ValorPercentualKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_ValorPercentualClick(Sender: TObject);
    procedure edt_ValorPercentualEnter(Sender: TObject);


  private
    { Private declarations }
    novoprecovenda, percentual, precocompra, valorlucro : double;
  public
    { Public declarations }      

  end;

var
  _frmAlteraPreco: T_frmAlteraPreco;
  PrecoCusto, PrecoVenda, PercentualLucro,novoprecovenda : Currency;


implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo, U_principal, U_Produtos;

{$R *.dfm}


procedure T_frmAlteraPreco.FormCreate(Sender: TObject);
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


procedure T_frmAlteraPreco.AbrirTabelas;
begin

    dm_Conexao.cds_CadProduto.Active      := True;

end;


procedure T_frmAlteraPreco.AbrirFecharTabelas;
begin

    dm_Conexao.cds_CadProduto.Active      := False;
    dm_Conexao.cds_CadProduto.Active      := True;

end;


procedure T_frmAlteraPreco.btn_SairClick(Sender: TObject);
begin

    Close;
   
end;


procedure T_frmAlteraPreco.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Release;

end;

procedure T_frmAlteraPreco.FormActivate(Sender: TObject);
begin

    AbrirTabelas;

end;

procedure T_frmAlteraPreco.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmAlteraPreco.btn_GravarNovoPrecoClick(Sender: TObject);
begin
       GravarAlteracaoDoPreco;
       AbrirFecharTabelas;
       btn_GravarNovoPreco.Enabled:= False;

end;

procedure T_frmAlteraPreco.CalcularNovoPrecoVenda;
begin
      PrecoVenda          := strtofloat( edt_PRECOVENDA.text );
      precocompra         := strtofloat( edt_PRECOCOMPRA.text );
      novoprecovenda      := strtofloat( edt_ValorAlteracao.text );
      valorlucro          := ( novoprecovenda - precocompra  );
      edt_PRECOVENDA.Text := floattostr( novoprecovenda );
      edt_VALORLUCRO.Text := floattostr( valorlucro );

end;


procedure T_frmAlteraPreco.GravarAlteracaoDoPreco;
var  texto : string;
begin

    with DM_Pesq.Qry_Geral do
    begin

       Close;
       SQL.Clear;
       SQL.Add('Update Produtos Set PrecoVenda  = :pVenda, valordelucro=:pLucro Where id_produto = :pIDproduto');
       Params.ParamByName('pVenda').AsFloat       := StrToFloat(edt_PRECOVENDA.Text);
       Params.ParamByName('pLucro').AsFloat       := StrToFloat(edt_VALORLUCRO.Text);
       Params.ParamByName('pIDproduto').AsInteger := StrToInt(edt_IDPRODUTO.Text);
       ExecSQL();

    end;

    dm_Conexao.cds_CadProduto.ApplyUpdates(0);
    AbrirFecharTabelas;

    texto := 'O preço de venda do produto foi alterado com sucesso!';
    Application.MessageBox(PChar(texto),'Confirmação', MB_OK);
    LogOperacoes(NomeDoUsuarioLogado, 'alteração de preço de um produto');

    _frmProdutos.dbedtQUANTIDADE.SetFocus;
    rd_valordireto.Checked := false;
    rd_Percentual.Checked  := false;
    
    Close;

end;

procedure T_frmAlteraPreco.rd_valordiretoClick(Sender: TObject);
begin

      if ( rd_valordireto.Checked ) then
      begin 

          lblTipoAlteracao.Caption    := 'Valor direto';
          edt_ValorAlteracao.ReadOnly := false;
          grNovosValores.Enabled      := true;
          edt_ValorPercentual.Visible := false; 
          edt_ValorAlteracao.SetFocus;
      end;

end;

procedure T_frmAlteraPreco.rd_PercentualClick(Sender: TObject);
begin

      if ( rd_Percentual.Checked ) then
      begin

          edt_ValorPercentual.BringToFront;
          lblTipoAlteracao.Caption     := 'Percentual %';
          edt_ValorPercentual.Visible  := true;   
          grNovosValores.Enabled       := true;
          grNovosValores.Caption       :=' Base para cálculo: percentual(%) sobre o valor de compra ';
          edt_ValorPercentual.SetFocus;

      end;

end;

procedure T_frmAlteraPreco.edt_ValorAlteracaoKeyPress(Sender: TObject;
  var Key: Char);
begin

    grValorAtual.Enabled        := false;
    grOpcoesAtualizacao.Enabled := false;

end;

procedure T_frmAlteraPreco.edt_ValorAlteracaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    //VALOR DIRETO
    if key=13 then
     begin
          edt_VALORLUCRO.Enabled := true;

          if( rd_valordireto.Checked ) then
          begin
               if ( StrToFloat(edt_ValorAlteracao.text) = 0 ) or (StrToFloat(edt_ValorAlteracao.text) <= StrToFloat(edt_PRECOCOMPRA.text)) then
               begin
                    texto := 'Valor deve ser maior que '+edt_PRECOCOMPRA.text+'.';
                    Application.MessageBox(Pchar(texto), 'Valor inválido!',MB_OK + MB_ICONEXCLAMATION);

                    edt_PRECOVENDA.Text         := FloatToStr(PrecoVenda);
                    edt_ValorAlteracao.Text     := FloatToStr(PrecoVenda);
                    edt_VALORLUCRO.Text         := '0,00';
                    btn_GravarNovoPreco.Enabled := false;
                    edt_ValorAlteracao.SetFocus;

               end else
               begin
                    novoprecovenda              := StrToFloat(edt_ValorAlteracao.Text);
                    edt_ValorAlteracao.Text     := FloatToStr(novoprecovenda);
                    edt_PRECOVENDA.Text         := FloatToStr(novoprecovenda);
                    edt_NovoValorVenda.Text     := FloatToStr(novoprecovenda);
                    edt_VALORLUCRO.Enabled      := true;
                    edt_VALORLUCRO.SetFocus;
                    panGridPrincipal.Enabled    := false;
               end;
          end;
 end;

end;

procedure T_frmAlteraPreco.edt_VALORLUCROEnter(Sender: TObject);
begin

      if(rd_valordireto.Checked)then begin CalcularNovoPrecoVenda; end;
      txtStatus.Caption           := 'Grave a alteração clicando no botão abaixo!';
      edt_VALORLUCRO.SelStart     :=0;
      edt_VALORLUCRO.SelLength    := length(edt_VALORLUCRO.Text);
      btn_GravarNovoPreco.Enabled := true;

end;

procedure T_frmAlteraPreco.FormShow(Sender: TObject);
begin
    PrecoVenda              := StrToFloat(edt_PRECOVENDA.Text);
    edt_ValorAlteracao.Text := edt_PRECOVENDA.Text;
    txtStatus.Caption       := 'Escolha uma opção de atualização do preço de venda!';
end;

procedure T_frmAlteraPreco.edt_ValorAlteracaoEnter(Sender: TObject);
begin

  if rd_valordireto.Checked then
     txtStatus.Caption := 'Entre com o novo valor e tecle enter...'
  else
     txtStatus.Caption := 'Entre com o valor de percentual e tecle enter...'

end;

procedure T_frmAlteraPreco.edt_ValorAlteracaoClick(Sender: TObject);
begin
    edt_ValorAlteracao.SelStart  := 0;
    edt_ValorAlteracao.SelLength := length(edt_ValorAlteracao.Text);
end;

procedure T_frmAlteraPreco.edt_ValorPercentualKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if key=13 then
     begin

       if ( StrToFloat(edt_ValorPercentual.text) = 0 ) or (StrToFloat(edt_ValorPercentual.text) > 100) then
       begin
            texto := 'Valor digitado deve estar entre 1 e 100 %';
            Application.MessageBox(Pchar(texto), 'Valor inválido!',MB_OK + MB_ICONEXCLAMATION);
            edt_ValorPercentual.Text     := '0,00';
            edt_VALORLUCRO.Text          := '0,00';
            edt_PRECOVENDA.Text          := floattostr( PrecoVenda );
            btn_GravarNovoPreco.Enabled  := false;
            edt_ValorPercentual.SetFocus;

       end else
       begin
             //calcular novo valor de venda ( valor de compra / 100 * percentual digitado
             precocompra                 := strtofloat( edt_PRECOCOMPRA.text );
             percentual                  := strtofloat(edt_ValorPercentual.text);
             novoprecovenda              := precocompra +(( precocompra * percentual )/100);
             edt_NovoValorVenda.Text     := FloatToStr(novoprecovenda);
             edt_PRECOVENDA.Text         := edt_NovoValorVenda.Text;

             valorlucro                  := ( novoprecovenda - precocompra  );
             edt_VALORLUCRO.Text         := floattostr( valorlucro );
             edt_VALORLUCRO.Enabled      := true;
             edt_VALORLUCRO.SetFocus;
             panGridPrincipal.Enabled    := false;
             
       end;
     end;
end;

procedure T_frmAlteraPreco.edt_ValorPercentualClick(Sender: TObject);
begin
    edt_ValorPercentual.SelStart  := 0;
    edt_ValorPercentual.SelLength := length(edt_ValorPercentual.Text);
end;

procedure T_frmAlteraPreco.edt_ValorPercentualEnter(Sender: TObject);
begin
 if rd_valordireto.Checked then
     txtStatus.Caption := 'Entre com o novo valor e tecle enter...'
  else
     txtStatus.Caption := 'Entre com o valor de percentual e tecle enter...'
end;

end.


