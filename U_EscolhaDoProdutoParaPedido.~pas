unit U_EscolhaDoProdutoParaPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls, DB;

type
  T_frmEscolhaProdutoParaPedidos = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    grid_produtosPedidos: TDBGrid;
    GroupBox1: TGroupBox;
    edt_NomeProduto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure PopulandoGridProdutos;
    procedure PesquisaPeloNomeProduto;
    procedure edt_NomeProdutoChange(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure edt_NomeProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_produtosPedidosCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    NomeDoProduto : string;
  public
    { Public declarations }
    

  end;

var
  _frmEscolhaProdutoParaPedidos: T_frmEscolhaProdutoParaPedidos;

implementation

uses U_dmDadosSegundo, U_AddItensNoPedido, U_dmPesquisas, U_FecharCotacao,
  U_QdeFecharCotacao, U_BiblioSysSalao, DBClient;

{$R *.dfm}

procedure T_frmEscolhaProdutoParaPedidos.FormCreate(Sender: TObject);
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

procedure T_frmEscolhaProdutoParaPedidos.PopulandoGridProdutos;
begin

            _Sql := 'SELECT * FROM produtos WHERE status = '+QuotedStr('A')+' AND id_produto > 1 ORDER BY COD_ALT1';

            with DM_Pesq.cdsPesqProdutosPedido do begin

                Close;
                CommandText:= (_Sql);
                Open;

            end;


            //FORMATANDO O VALOR DO CAMPO VALOR_TOTAL COMO CURRENCY SE NAO RECONHECER COLOQUE DB EM USES DEPOIS DE INTERFACE
            TCurrencyField(DM_Pesq.cdsPesqProdutosPedido.FieldByName('PRECOVENDA')).DisplayFormat:= '###,##0.00';
         
            with grid_produtosPedidos do
            begin

              DataSource:=  DM_Pesq.dsPesqProdutosPedido;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName        := 'COD_ALT1';
              Columns[0].Width            := 280;
              Columns[0].Alignment        := taLeftJustify;
              Columns[0].Title.caption    := 'PRODUTO';
              Columns[0].Title.Font.Style := [fsBold];
              Columns[0].Title.Alignment  := taLeftJustify;


              Columns.Add;
              Columns[1].FieldName        := 'ESTOQUE_ATUAL';
              Columns[1].Width            := 110;
              Columns[1].Alignment        := taCenter;
              Columns[1].Title.caption    := 'ESTOQUE ATUAL';
              Columns[1].Title.Font.Style := [fsBold];
              Columns[1].Title.Alignment  := taCenter;


              Columns.Add;
              Columns[2].FieldName        := 'PRECOVENDA';
              Columns[2].Width            := 150;
              Columns[2].Alignment        := taRightJustify;
              Columns[2].Title.caption    := 'PREÇO UNITÁRIO';
              Columns[2].Title.Font.Style := [fsBold];
              Columns[2].Title.Alignment  := taRightJustify;

            end;

end;

procedure T_frmEscolhaProdutoParaPedidos.PesquisaPeloNomeProduto;
begin

      NomeDoProduto:= edt_NomeProduto.Text;

     _Sql:= ('SELECT * FROM produtos WHERE id_produto > 1 AND descricao LIKE ''%'+NomeDoProduto+'%'' '+
              'OR cod_barras LIKE ''%'+NomeDoProduto+'%'' OR COD_ALT1 LIKE ''%'+NomeDoProduto+'%'' '+
              'OR COD_ALT2 LIKE ''%'+NomeDoProduto+'%'' OR COD_ALT3 LIKE ''%'+NomeDoProduto+'%'' '+
              'OR COD_ALT4 LIKE ''%'+NomeDoProduto+'%'' ORDER BY COD_ALT1');

      with DM_Pesq.cdsPesqProdutosPedido do
      begin

            Close;
            CommandText:= _sql;
            Open;

      end;

end;


procedure T_frmEscolhaProdutoParaPedidos.edt_NomeProdutoChange(Sender: TObject);
begin

     PesquisaPeloNomeProduto;

end;

procedure T_frmEscolhaProdutoParaPedidos.pnl_rodapeClick(Sender: TObject);
begin

      _frmAddItensNoPedido.edt_IDProdutoPedido.Text := '0';
      _frmAddItensNoPedido.edtPrecoAtual.Text       := '0,00';

      close;

end;

procedure T_frmEscolhaProdutoParaPedidos.edt_NomeProdutoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
        //nao é necessario validar qdo saldo for zero
        if key=13 then begin

            _frmAddItensNoPedido.edt_DescProdutoPedido.text       :=  DM_Pesq.cdsPesqProdutosPedido.fieldbyname('COD_ALT1').AsString;
            _frmAddItensNoPedido.edt_IDProdutoPedido.Text         :=  IntToStr(DM_Pesq.cdsPesqProdutosPedido.fieldbyname('ID_PRODUTO').AsInteger);
            _frmAddItensNoPedido.edtPrecoAtual.Text               :=  FloatToStr(DM_Pesq.cdsPesqProdutosPedido.fieldbyname('PRECOVENDA').AsFloat);
            _frmAddItensNoPedido.edtEstoque.caption               :=  IntToStr(DM_Pesq.cdsPesqProdutosPedido.fieldbyname('ESTOQUE_ATUAL').AsInteger);
            _frmAddItensNoPedido.edt_PrecoProdutoPedido.SetFocus;
            close;

        end;    

         case Key of

           //serve para navegar atraves das setas no grid

           VK_UP  : DM_Pesq.cdsPesqProdutosPedido.Prior;
           VK_DOWN: DM_Pesq.cdsPesqProdutosPedido.Next;

         end;


end;

procedure T_frmEscolhaProdutoParaPedidos.grid_produtosPedidosCellClick(
  Column: TColumn);
begin
    //nao é necessario validar qdo saldo for zero
    _frmAddItensNoPedido.edt_DescProdutoPedido.text       :=  DM_Pesq.cdsPesqProdutosPedido.fieldbyname('COD_ALT1').AsString;
    _frmAddItensNoPedido.edt_IDProdutoPedido.Text         :=  IntToStr(DM_Pesq.cdsPesqProdutosPedido.fieldbyname('ID_PRODUTO').AsInteger);
    _frmAddItensNoPedido.edtPrecoAtual.Text               :=  FloatToStr(DM_Pesq.cdsPesqProdutosPedido.fieldbyname('PRECOVENDA').AsFloat);
    _frmAddItensNoPedido.edtEstoque.caption               :=  FloatToStr(DM_Pesq.cdsPesqProdutosPedido.fieldbyname('ESTOQUE_ATUAL').AsFloat);
    _frmAddItensNoPedido.edt_PrecoProdutoPedido.SetFocus;
    close;

end;

procedure T_frmEscolhaProdutoParaPedidos.FormShow(Sender: TObject);
begin

  edt_NomeProduto.SetFocus;
  
end;

end.
