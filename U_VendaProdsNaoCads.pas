unit U_VendaProdsNaoCads;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit, DateUtils, EditNum;

type
  T_frmVendaProdsNaoCads = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    btn_Sair: TSpeedButton;
    pnl_DadosUsuario: TPanel;
    btn_Gravar: TSpeedButton;
    lblDataDoDia: TLabel;
    pnl1: TPanel;
    lbl2: TLabel;
    edtValorVenda: TEditNum;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edt_totalmovimento: TEditNum;
    lblHoraAtual: TLabel;
    edt_qde: TEdit;
    edtCodigoProdNaoCad: TEdit;
    Label1: TLabel;
    edtDescricao: TEdit;
    Label5: TLabel;
    edtValorCompra: TEditNum;
    Label6: TLabel;
    edtValorLucro: TEditNum;
    Label7: TLabel;
    edtPercentualLucro: TEditNum;
    procedure btn_SairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorMovimentoCaixaKeyPress(Sender: TObject; var Key: Char);
    procedure btn_GravarClick(Sender: TObject);
    procedure CalcularValorTotal;
    procedure edt_qdeExit(Sender: TObject);
    procedure Gravar;
    procedure GravarItens;
    procedure GravarItemParaHistorico;
    procedure CalcularValorPorPercentual;
    procedure VerificarSeCodigoExiste;
    procedure ZerosNoCodigoDeBarras;
    procedure edt_qdeChange(Sender: TObject);
    procedure edtCodigoProdNaoCadExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_qdeEnter(Sender: TObject);
    procedure edtValorCompraExit(Sender: TObject);
    procedure edtValorLucroExit(Sender: TObject);
    procedure edtPercentualLucroExit(Sender: TObject);



  private
    { Private declarations }


  public
    { Public declarations }
    valorEntrada, qde, totalMovNaoCad, percentualLucro, valorPorPercentual, valorCompra, valorVenda, percentLucro, valorLucro  : double;

  end;

var
  _frmVendaProdsNaoCads : T_frmVendaProdsNaoCads;
  proxNumCaixa : Integer;

implementation

uses U_BiblioSysSalao, U_dmDadosSegundo, U_principal, U_dmDados,
  U_dmPesquisas, U_Caixa, DB;

{$R *.dfm}


procedure T_frmVendaProdsNaoCads.FormCreate(Sender: TObject);
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

   IdVenda := _frmCaixa.idVenda;

end;

procedure T_frmVendaProdsNaoCads.FormShow(Sender: TObject);
begin

    ZerosNoCodigoDeBarras;
    valorCompraProdNaoCad     := 0;
    valorLucroProdNaocad      := 0;
    valorVendaProdNaoCad      := 0;

end;

procedure T_frmVendaProdsNaoCads.edt_qdeExit(Sender: TObject);
begin

     if ( edt_qde.Text = '0' ) or ( edt_qde.Text = '' ) then
     begin

          edt_qde.SetFocus;

     end else begin

       CalcularValorTotal;

     end;

end;

procedure T_frmVendaProdsNaoCads.CalcularValorTotal;
begin

     valorEntrada            := StrToFloat(edtValorVenda.Text);
     qde                     := StrToFloat(edt_qde.Text);
     totalMovNaoCad          := (valorEntrada * qde);

     edt_totalmovimento.Text := FloatToStr(totalMovNaoCad);

     edt_qde.SelStart  := 0;
     edt_qde.SelLength := Length(edt_qde.Text);

     edt_qde.SetFocus;

end;


procedure T_frmVendaProdsNaoCads.btn_GravarClick(Sender: TObject);
begin

     if (edtValorVenda.Text = '') or (edtValorVenda.Text = '0,00') then
     begin

           Application.MessageBox('O valor de entrada não pode estar vazio ou zerado!','Valor do produto inválido',Mb_IconInformation);

     end  else if (edt_qde.Text = '') or (edt_qde.Text = '0') then begin

            Application.MessageBox('A quantidade de entrada não pode estar vazia ou zerada!','Valor inválido',Mb_IconInformation);

     end else

          Gravar;


end;


procedure T_frmVendaProdsNaoCads.btn_SairClick(Sender: TObject);
begin

    Close;

end;


procedure T_frmVendaProdsNaoCads.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Release;

end;

procedure T_frmVendaProdsNaoCads.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmVendaProdsNaoCads.edtValorMovimentoCaixaKeyPress(Sender: TObject;
  var Key: Char);
begin

    btn_Gravar.Enabled    := True;

    // PARA DBEDIT ACEITAR APENAS NUMEROS
    If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;
 

end;


procedure T_frmVendaProdsNaoCads.GravarItemParaHistorico;
begin

     //grava o nome dos itens da venda na tabela para inserir no historico depois de confirmado o pagamento

     _Sql := 'INSERT INTO t_itens ( produto ) VALUES ( :pProduto )';

     with DM_Pesq.Qry_Geral do
     begin

         close;
         sql.Clear;
         sql.Add(_Sql);
         Params.ParamByName('pProduto').AsString   := edtDescricao.Text;
         ExecSQL();

     end;

end;


procedure T_frmVendaProdsNaoCads.Gravar;
var
  sCodigo, sQtde, sValor : string;
begin

      if edtValorVenda.Text = '0,00' then begin

       Application.MessageBox('Entre com o valor do produto ou cancele para sair!','Valor do produto inválido',Mb_IconInformation);
       edtValorVenda.SetFocus;

   end else begin

    _frmCaixa.edtSubTotal.Text         := FloatToStr(totalMovNaoCad);
    _frmCaixa.edtTotalpagar.Text       := FloatToStr(totalMovNaoCad);
    _frmCaixa.lblMostraValorVenda.Text := FloatToStr(totalMovNaoCad);
    _frmCaixa.lblTotalItem.Caption     := FloatToStr(totalMovNaoCad);
    _frmCaixa.totalProdNaoCad          := totalMovNaoCad;


    sCodigo    := edtCodigoProdNaoCad.Text;
    sQtde      := edt_qde.Text;
    sValor     := FormatFloat('##,##0.00',(StrToFloat(edtValorVenda.Text)));


    //inserindo itens no listbox
     inc(_frmCaixa.item);                                             //incrementa item(inteiro)
    _frmCaixa.lblItem.caption      := inttostr(_frmCaixa.item);       //item

     // (StringOfChar('determina o caracter a ser mostrado',se numero for 3-Length(inttostr(item))) mostra 2 zeros
    _frmCaixa.ListBox1.Items.Add(StringOfChar('0',3-Length(inttostr(_frmCaixa.item))) + inttostr(_frmCaixa.item) + ' ' +(StringOfChar('0',13-Length(sCodigo)) + sCodigo) + ' ' +  ( edtDescricao.Text ));
    _frmCaixa.ListBox1.Items.Add(StringOfChar(' ',5-Length(sQtde)) + sQtde + ' x ' + StringOfChar(' ',8-Length(sValor)) + sValor +  StringOfChar(' ',20-Length(edt_totalmovimento.Text)) + edt_totalmovimento.Text + ' + ');

     _frmCaixa.btnSomarClick(self);

     _frmCaixa.conf := 1;

    close;

   end;

   GravarItemParaHistorico;
   GravarItens;
   LogOperacoes(NomeDoUsuarioLogado, 'inclusão de produto não cadastrado na venda '+ IntToStr(idvenda));    

end;


procedure T_frmVendaProdsNaoCads.GravarItens;
begin

      //gravando o item na tabela de itens da venda

      With DM_Pesq.qry_Cod do
      begin

          Close;
          SQL.Clear;
          SQL.Add('select max(id_itens) from itens_vendas');
          Open;

          if not IsEmpty then begin

             proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

          end;

        end;


        with dm_DadosSegundo.cds_ItensVendas do
        begin

             Append;
             FieldByName('id_itens').AsInteger            := proxNum;
             FieldByName('id_venda').AsInteger            := IdVenda;
             FieldByName('id_produto').AsInteger          := 1;  //ID de um produto nao cadastrado
             FieldByName('vl_unitario').AsFloat           := StrToFloat(edtValorVenda.Text);
             FieldByName('quantidade').AsFloat            := StrToFloat(edt_qde.Text);
             FieldByName('vl_totalitem').AsFloat          := StrToFloat(edt_totalmovimento.Text);
             FieldByName('flag_devolucao').AsString       := 'A';    //LIBERADO PARA DEVOLVER AO ESTOQUE EM CASO DE CANCELAMENTO
             FieldByName('historico_venda').AsString      := 'VENDA DE PRODUTO NAO CADASTRADO';   //nao é utilizado aqui
             ApplyUpdates(0);

          end;

end;


procedure T_frmVendaProdsNaoCads.edt_qdeChange(Sender: TObject);
begin

    btn_Gravar.Enabled := true;

end;

procedure T_frmVendaProdsNaoCads.VerificarSeCodigoExiste;
var
  nomeProduto : string;
begin

   with DM_Pesq.Qry_Auxiliar do
   begin

       close;
       SQL.Clear;
       SQL.Add('select * from produtos where cod_barras = '+chr(39)+edtCodigoProdNaoCad.Text+chr(39));
       open;

           If not IsEmpty then      //se encontrou um produto com o codigo entrado...
           begin

               nomeProduto := DM_Pesq.Qry_Auxiliar.fieldbyname('descricao').AsString;

               texto:= 'Atenção este código já esta cadastrado como '+ nomeProduto +' verifique. Será gerado com zeros!';
               Application.MessageBox(PChar(texto),'Duplicidade de código',mb_OK);

               ZerosNoCodigoDeBarras;
               edtDescricao.SetFocus;

           end;
   end;

end;

procedure T_frmVendaProdsNaoCads.edtCodigoProdNaoCadExit(Sender: TObject);
begin

     VerificarSeCodigoExiste;

end;

procedure T_frmVendaProdsNaoCads.ZerosNoCodigoDeBarras;
begin


   //gera codigo de barras do produto nao cadastrado como 0000000000000

    with DM_Pesq.Qry_Geral do
    begin

           close;
           sql.Clear;
           sql.Add('UPDATE produtos SET cod_barras  = :pNovoCod Where id_produto = :pIDProduto');
           Params.ParamByName('pNovoCod').AsString    := edtCodigoProdNaoCad.Text;
           Params.ParamByName('pIDProduto').AsInteger := 1 ;
           ExecSQL;

     end;

end;

procedure T_frmVendaProdsNaoCads.edt_qdeEnter(Sender: TObject);
begin

      valorCompraProdNaoCad  := StrToFloat(edtValorCompra.Text);
      valorLucroProdNaocad   := StrToFloat(edtValorLucro.Text);
      valorVendaProdNaoCad   :=  ( valorCompraProdNaoCad + valorLucroProdNaocad );   
      edtValorVenda.Text     := FloatToStr(valorVendaProdNaoCad);

end;

procedure T_frmVendaProdsNaoCads.edtValorCompraExit(Sender: TObject);
begin

     if edtValorCompra.Text = '0,00' then
     begin
        texto:= 'O valor de compra é inválido, deseja cancelar?';
        opc := Application.MessageBox(PChar(texto),'Valor inválido',MB_YESNO + MB_ICONEXCLAMATION);

        if opc = IdYes then
        begin

             close;

        end else begin

           edtValorCompra.SetFocus;

        end;
    end;

end;

procedure T_frmVendaProdsNaoCads.edtValorLucroExit(Sender: TObject);
begin

     if edtValorLucro.Text = '0,00' then
     begin
        texto:= 'O valor de lucro é inválido, deseja cancelar?';
        opc := Application.MessageBox(PChar(texto),'Valor inválido',MB_YESNO + MB_ICONEXCLAMATION);

        if opc = IdYes then
        begin

             close;

        end else begin

           edtPercentualLucro.Enabled:= false;
           edt_qde.SetFocus;
          
        end;
    end;

end;

procedure T_frmVendaProdsNaoCads.edtPercentualLucroExit(Sender: TObject);
begin
    percentualLucro := StrToFloat(edtPercentualLucro.Text);

    if (percentualLucro > 0) then
    begin

         CalcularValorPorPercentual;
         edtValorLucro.Enabled := false;
         edt_qde.SetFocus;

    end;

end;

procedure T_frmVendaProdsNaoCads.CalcularValorPorPercentual;
begin

   valorCompra        := StrToFloat(edtValorCompra.Text);
   valorPorPercentual := StrToFloat(edtPercentualLucro.Text);

   valorLucro         := (valorCompra * valorPorPercentual)/100;  

   edtValorLucro.Text := FloatToStr(valorLucro);

   valorVenda         := (valorCompra * percentLucro)+valorCompra;

   edtValorVenda.Text := FloatToStr(valorVenda);

end;

end.
