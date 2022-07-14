unit U_AlteraPrecoVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  EditNum;

type
  T_frmAlteracaoPrecoVenda = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl_DadosUsuario: TPanel;
    grp_CadastrarSenha: TGroupBox;
    GroupBox2: TGroupBox;
    edt_valorDireto: TEditNum;
    edt_PercentualDeAlteracao: TEditNum;
    rd_valordireto: TRadioButton;
    rd_porpercentual: TRadioButton;
    GroupBox3: TGroupBox;
    edt_DescricaoProduto: TStaticText;
    GroupBox4: TGroupBox;
    edtValorDeVendaAtual: TEditNum;
    btnGravarAlteracao: TSpeedButton;
    GroupBox1: TGroupBox;
    edtValorDeCompra: TEditNum;
    btnSair: TSpeedButton;
    lblPercentual: TLabel;
    GroupBox5: TGroupBox;
    edtValorDeLucro: TEditNum;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure rd_valordiretoClick(Sender: TObject);
    procedure rd_porpercentualClick(Sender: TObject);
    procedure PreencheDadosDoProduto;
    procedure GravarNovoValorDeVenda;
    procedure GravarPeloValorDireto;
    procedure GravarPeloPercentual;
    procedure btnGravarAlteracaoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edt_valorDiretoExit(Sender: TObject);
    procedure edt_PercentualDeAlteracaoExit(Sender: TObject);

  private
    { Private declarations }


  public
    { Public declarations }

      valorPorPercentual, valorOriginal, percentual, precoatual, valorLucro,
      precocompra, novoprecovenda, novoValorDeVenda  : double;
      idDoItem, idDoProduto  : integer;

  end;

var
  _frmAlteracaoPrecoVenda: T_frmAlteracaoPrecoVenda;

implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo,
  U_Cotacao, U_EscolhaDoProdutoParaCotacao, DateUtils, U_FecharPedido, DB;

{$R *.dfm}


procedure T_frmAlteracaoPrecoVenda.FormCreate(Sender: TObject);
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


procedure T_frmAlteracaoPrecoVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    _frmFecharPedido.AbrirFecharTabelas;
    Close;
    Release;

end;


procedure T_frmAlteracaoPrecoVenda.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure T_frmAlteracaoPrecoVenda.FormShow(Sender: TObject);
begin

     PreencheDadosDoProduto;

end;


procedure T_frmAlteracaoPrecoVenda.rd_valordiretoClick(Sender: TObject);
begin

      if rd_valordireto.Checked then
      begin

            edt_PercentualDeAlteracao.Visible  := false;

            with edt_valorDireto do
            begin

               Visible       := true;
               Left          := 201;
               Top           := 60;
               Width         := 177;
               SetFocus;

            end;

      end;

      lblPercentual.Visible := false;

end;

procedure T_frmAlteracaoPrecoVenda.rd_porpercentualClick(Sender: TObject);
begin

      if rd_porpercentual.Checked then
      begin

             edt_valorDireto.Visible      := false;

              with edt_PercentualDeAlteracao do
              begin

                  Visible := true;
                  Left    := 201;
                  Top     := 60;
                  Width   := 177;
                  SetFocus;

              end;

              lblPercentual.Visible := true;
      end;

end;

procedure T_frmAlteracaoPrecoVenda.PreencheDadosDoProduto;
begin

     idDoProduto :=  Strtoint(_frmFecharPedido.txt_ProdutoID.Text);

     _Sql :='SELECT id_produto, descricao, precovenda, valordelucro, precocompra FROM produtos WHERE id_produto = :pIDProduto';

     with DM_Pesq.Qry_Geral do
     begin

         close;
         sql.Clear;
         sql.Add(_Sql);
         params.ParamByName('pIDProduto').Value := idDoProduto;
         open;

         if not IsEmpty then
         begin

             edt_DescricaoProduto.Caption  := DM_Pesq.Qry_Geral.Fields[1].Value;
             edtValorDeVendaAtual.Text     := DM_Pesq.Qry_Geral.Fields[2].Value;
             edtValorDeLucro.Text          := DM_Pesq.Qry_Geral.Fields[3].Value;
             edtValorDeCompra.Text         := DM_Pesq.Qry_Geral.Fields[4].Value;

         end;

     end;

     //mostrando o valor de compra, descricao
     //  edtValorDeCompra.Text         := _frmFecharPedido.txt_ValorUnitarioDoItem.Text;
     //  edt_DescricaoProduto.Caption  := _frmFecharPedido.txt_Descricao.Text;
     valorOriginal                 :=  StrToFloat(edtValorDeCompra.Text);


end;

procedure T_frmAlteracaoPrecoVenda.GravarNovoValorDeVenda;
begin

    if rd_valordireto.Checked then
    begin

          GravarPeloValorDireto;

    end else begin

          GravarPeloPercentual;

    end;

    Application.MessageBox('O valor de venda deste produto foi alterado com sucesso!', 'Alterando o valor de venda', MB_OK);
    _frmFecharPedido.panel_item.Visible            := false;
    _frmFecharPedido.panel_total.Visible           := true;
    _frmFecharPedido.edt_PrecoProdutoPedido.Text   := '0,00';
    _frmFecharPedido.edtPrecoAtual.Text            := '0,00';
    _frmFecharPedido.grCabecalho.Enabled           := true;
    _frmFecharPedido.edt_DescProdutoPedido.text    := '';
    _frmFecharPedido.rd_alterarPrecoVenda.Checked  := false;
    _frmFecharPedido.HabilitarBotoes;
    close;

end;

procedure T_frmAlteracaoPrecoVenda.GravarPeloValorDireto;
begin

        _Sql:= 'UPDATE produtos SET precovenda = :pNovoPrecoVenda, valordelucro=:pLucro WHERE id_produto = :pIDProduto';

         With DM_Pesq.Qry_Geral do begin

            Close;
            SQL.Clear;
            SQL.Add(_Sql);
            ParamByName('pNovoPrecoVenda').Value  := Strtofloat(edt_valorDireto.Text);
            ParamByName('pLucro').Value           := Strtofloat(edtValorDeLucro.Text);
            ParamByName('pIDProduto').Value       := idDoProduto;
            ExecSQL();

          end;

        _frmFecharPedido.AbrirFecharTabelas;


end;

procedure T_frmAlteracaoPrecoVenda.GravarPeloPercentual;
begin   

        _Sql:= 'UPDATE produtos SET precovenda = :pNovoPrecoVenda, valordelucro=:pLucro WHERE id_produto = :pIDProduto';

         With DM_Pesq.Qry_Geral do begin

            Close;
            SQL.Clear;
            SQL.Add(_Sql);
            ParamByName('pNovoPrecoVenda').Value  := novoprecovenda;
            ParamByName('pLucro').Value           := valorlucro;
            ParamByName('pIDProduto').Value       := idDoProduto;
            ExecSQL();

          end;
          
          lblPercentual.Visible := false;
          _frmFecharPedido.AbrirFecharTabelas;
         

end;

procedure T_frmAlteracaoPrecoVenda.btnGravarAlteracaoClick(
  Sender: TObject);
begin

    GravarNovoValorDeVenda;

end;

procedure T_frmAlteracaoPrecoVenda.btnSairClick(Sender: TObject);
begin

    close;
    release;

end;

procedure T_frmAlteracaoPrecoVenda.edt_valorDiretoExit(Sender: TObject);
begin

    //calculando mostrando novos valores

    if ( rd_valordireto.Checked ) then
    begin

      precocompra               := strtofloat( edtValorDeCompra.text );
      novoprecovenda            := strtofloat( edt_valorDireto.text );
      valorlucro                := ( novoprecovenda - precocompra  );
      edtValorDeVendaAtual.Text := floattostr( novoprecovenda );
      edtValorDeLucro.Text      := floattostr( valorlucro );

    end;

end;

procedure T_frmAlteracaoPrecoVenda.edt_PercentualDeAlteracaoExit(
  Sender: TObject);
begin

    //calculando mostrando novos valores

    if ( rd_porpercentual.Checked ) then
    begin

         precocompra               := strtofloat( edtValorDeCompra.text );
         precoatual                := strtofloat( edtValorDeVendaAtual.text );
         percentual                := strtofloat(edt_PercentualDeAlteracao.text);
         novoprecovenda            := precoatual +(( precoatual * percentual )/100);
         valorlucro                := ( novoprecovenda - precocompra  );
         edtValorDeVendaAtual.Text := floattostr( novoprecovenda );
         edtValorDeLucro.Text      := floattostr( valorlucro );

    end;

end;

end.
