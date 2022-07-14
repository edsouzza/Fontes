unit U_EscolhaDoProdutoParaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls, DB;

type
  T_frmEscolhaDoProdutoParaVenda = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    grid_produtos: TDBGrid;
    GroupBox1: TGroupBox;
    edt_NomeProduto: TEdit;
    //procedimentos perso
    procedure PopulandoGridProdutos;
    procedure PesquisaPeloNomeProduto;

    //funcoes
    

    //procedimentos padrao
    procedure FormCreate(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure grid_produtosCellClick(Column: TColumn);

    procedure edt_NomeProdutoChange(Sender: TObject);
    procedure edt_NomeProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);


  private
    { Private declarations }

  public
    { Public declarations }
    MesEscolhido, QdeProduto : string;
  end;

var
  _frmEscolhaDoProdutoParaVenda: T_frmEscolhaDoProdutoParaVenda;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, U_Caixa, U_TrocaDeProduto,
  U_Produtos;

{$R *.dfm}

procedure T_frmEscolhaDoProdutoParaVenda.FormCreate(Sender: TObject);
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
  
  PopulandoGridProdutos;

end;

procedure T_frmEscolhaDoProdutoParaVenda.FormShow(Sender: TObject);
begin

    edt_NomeProduto.SetFocus;
   
end;

procedure T_frmEscolhaDoProdutoParaVenda.PopulandoGridProdutos;
begin

           _Sql := 'SELECT * FROM produtos WHERE status = '+QuotedStr('A')+' ORDER BY DESCRICAO';

           with DM_Pesq.cdsPesqProduto do
           begin

                Close;
                CommandText:= (_Sql);
                Open;

            end;


            //FORMATANDO O VALOR DO CAMPO VALOR_TOTAL COMO CURRENCY SE NAO RECONHECER COLOQUE DB EM USES DEPOIS DE INTERFACE
            TCurrencyField(DM_Pesq.cdsPesqProduto.FieldByName('PRECOVENDA')).DisplayFormat:= '###,##0.00';
            TCurrencyField(DM_Pesq.cdsPesqProduto.FieldByName('ESTOQUE_ATUAL')).DisplayFormat:= '###,##0.00';


            with grid_produtos do
            begin

              DataSource:=  DM_Pesq.dsPesqProduto;
              Columns.Clear;

              Columns.Add;
                Columns[0].FieldName        := 'COD_BARRAS';
                Columns[0].Width            := 140;
                Columns[0].Alignment        := taLeftJustify;
                Columns[0].Title.caption    := 'CÓDIGO DE BARRAS';
                Columns[0].Title.Font.Style := [fsBold];
                Columns[0].Title.Alignment  := taLeftJustify;


                Columns.Add;
                Columns[1].FieldName        := 'DESCRICAO';
                Columns[1].Width            := 225;
                Columns[1].Alignment        := taLeftJustify;
                Columns[1].Title.caption    := 'PRODUTO';
                Columns[1].Title.Font.Style := [fsBold];
                Columns[1].Title.Alignment  := taLeftJustify;


                Columns.Add;
                Columns[2].FieldName        := 'ESTOQUE_ATUAL';
                Columns[2].Width            := 110;
                Columns[2].Alignment        := taCenter;
                Columns[2].Title.caption    := 'ESTOQUE ATUAL';
                Columns[2].Title.Font.Style := [fsBold];
                Columns[2].Title.Alignment  := taCenter;


                Columns.Add;
                Columns[3].FieldName        := 'PRECOVENDA';
                Columns[3].Width            := 120;
                Columns[3].Alignment        := taRightJustify;
                Columns[3].Title.caption    := 'PREÇO UNITÁRIO';
                Columns[3].Title.Font.Style := [fsBold];
                Columns[3].Title.Alignment  := taRightJustify;


            end;


end;

procedure T_frmEscolhaDoProdutoParaVenda.pnl_rodapeClick(Sender: TObject);
begin

    _frmCaixa.edtDescricao.Clear;
    _frmCaixa.edtCodBarras.SetFocus;
    close;

end;

procedure T_frmEscolhaDoProdutoParaVenda.grid_produtosCellClick(
  Column: TColumn);
var
  pDesc : string;
begin
   pDesc := DM_Pesq.cdsPesqProduto.fieldbyname('DESCRICAO').AsString;

  if(ItemDuplicadoNaVenda(pDesc))then
  begin
     texto:= 'Esse produto já esta inserido nesta venda exclua o ítem com <F5> e insira o produto novamente com a nova quantidade!';
     Application.MessageBox(PChar(texto),'Produto repetido!',MB_OK + MB_ICONEXCLAMATION);
     _frmCaixa.edtCodBarras.SetFocus;
     close;

  end else
  begin

       if( DM_Pesq.cdsPesqProduto.fieldbyname('ESTOQUE_ATUAL').AsFloat) = 0 then
       begin

            Application.MessageBox('Este produto não pode ser adicionado a venda porque seu  estoque  esta  zerado,  favor  verificar   e  repor  o  estoque!', 'Produto com estoque zerado', MB_ICONEXCLAMATION);
            _frmCaixa.edtDescricao.Clear;
            _frmCaixa.edtCodBarras.text  := '0';
            _frmCaixa.edtCodBarras.SetFocus;
            close;

       end else begin
          estoqueProduto                   :=  DM_Pesq.cdsPesqProduto                     .fieldbyname('ESTOQUE_ATUAL').AsFloat;
          _frmCaixa.lblidProduto.Caption   :=  IntToStr(DM_Pesq.cdsPesqProduto            .fieldbyname('ID_PRODUTO').AsInteger);
          _frmCaixa.edtestoque.text        :=  FloatToStr(DM_Pesq.cdsPesqProduto          .fieldbyname('ESTOQUE_ATUAL').AsFloat);
          _frmCaixa.edtCodBarras.text      :=  DM_Pesq.cdsPesqProduto                     .fieldbyname('COD_BARRAS').AsString;
          _frmCaixa.edtDescricao.text      :=  DM_Pesq.cdsPesqProduto                     .fieldbyname('DESCRICAO').AsString;
          _frmCaixa.edtPreco.text          :=  FloatToStr(DM_Pesq.cdsPesqProduto          .fieldbyname('PRECOVENDA').AsFloat);
          _frmCaixa.edtQde.SetFocus;
          LogOperacoes(NomeDoUsuarioLogado, 'Escolha de produto para venda');
          close;

       end;

  end;

end;

procedure T_frmEscolhaDoProdutoParaVenda.PesquisaPeloNomeProduto;
begin

      NomeDoProduto := edt_NomeProduto.Text;

      _Sql:= ('SELECT * FROM produtos WHERE descricao LIKE ''%'+NomeDoProduto+'%'' '+
              'OR cod_barras LIKE ''%'+NomeDoProduto+'%'' OR COD_ALT1 LIKE ''%'+NomeDoProduto+'%'' '+
              'OR COD_ALT2 LIKE ''%'+NomeDoProduto+'%'' OR COD_ALT3 LIKE ''%'+NomeDoProduto+'%'' '+
              'OR COD_ALT4 LIKE ''%'+NomeDoProduto+'%'' ORDER BY COD_ALT1');

      with DM_Pesq.cdsPesqProduto do
      begin

          Close;
          CommandText:= _Sql;
          Open;

          //FORMATANDO O VALOR DO CAMPO VALOR_TOTAL COMO CURRENCY SE NAO RECONHECER COLOQUE DB EM USES DEPOIS DE INTERFACE
            TCurrencyField(DM_Pesq.cdsPesqProduto.FieldByName('PRECOVENDA')).DisplayFormat:= '###,##0.00';
            TCurrencyField(DM_Pesq.cdsPesqProduto.FieldByName('ESTOQUE_ATUAL')).DisplayFormat:= '###,##0.00';

      end;       

end;


procedure T_frmEscolhaDoProdutoParaVenda.edt_NomeProdutoChange(
  Sender: TObject);
begin

    PesquisaPeloNomeProduto;

end;

procedure T_frmEscolhaDoProdutoParaVenda.edt_NomeProdutoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

        if key=13 then
        begin
             //como é pesquisa pra venda, avisar se o estoque estiver zerado
             if( DM_Pesq.cdsPesqProduto.fieldbyname('ESTOQUE_ATUAL').AsFloat) = 0 then
             begin

                  Application.MessageBox('Este produto não pode ser adicionado a venda, seu estoque esta zerado!', 'Estoque zerado', MB_ICONEXCLAMATION);
                  exit;

             end else begin
                estoqueProduto                   :=  DM_Pesq.cdsPesqProduto                    .fieldbyname('ESTOQUE_ATUAL').AsFloat;
                _frmCaixa.lblidProduto.Caption   :=  IntToStr(DM_Pesq.cdsPesqProduto           .fieldbyname('ID_PRODUTO').AsInteger);
                _frmCaixa.edtestoque.text        :=  FloatToStr(DM_Pesq.cdsPesqProduto         .fieldbyname('ESTOQUE_ATUAL').AsFloat);
                _frmCaixa.edtCodBarras.text      :=  DM_Pesq.cdsPesqProduto                    .fieldbyname('COD_BARRAS').AsString;
                _frmCaixa.edtDescricao.text      :=  DM_Pesq.cdsPesqProduto                    .fieldbyname('DESCRICAO').AsString;
                _frmCaixa.edtPreco.text          :=  FloatToStr(DM_Pesq.cdsPesqProduto         .fieldbyname('PRECOVENDA').AsFloat);
                _frmCaixa.edtQde.SetFocus;
                LogOperacoes(NomeDoUsuarioLogado, 'Escolha de produto para venda');
                close;

             end;

        end;

         case Key of
          //permitindo andar com as setas do teclado
          VK_UP  : DM_Pesq.cdsPesqProduto.Prior;
          VK_DOWN: DM_Pesq.cdsPesqProduto.Next;

        end;

end;

end.



