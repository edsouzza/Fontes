unit U_EscolhaProdutoFecharCotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls, DB;

type
  T_frmEscolhaProdutoParaFecharCotacao = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    grid_produtosCotacao: TDBGrid;
    GroupBox1: TGroupBox;
    edt_NomeProduto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure PopulandoGridProdutos;
    procedure PesquisaPeloNomeProduto;
    procedure edt_NomeProdutoChange(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure edt_NomeProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_produtosCotacaoCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    QdeProduto : string;

  end;

var
  _frmEscolhaProdutoParaFecharCotacao: T_frmEscolhaProdutoParaFecharCotacao;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas,
   U_dmDadosSegundo, U_Cotacao, U_QdeCotacao, U_FecharCotacao,
  U_QdeFecharCotacao;

{$R *.dfm}

procedure T_frmEscolhaProdutoParaFecharCotacao.FormCreate(Sender: TObject);
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

procedure T_frmEscolhaProdutoParaFecharCotacao.PopulandoGridProdutos;
begin

            _Sql := 'SELECT * FROM produtos WHERE status = '+QuotedStr('A')+' AND id_produto > 1 ORDER BY COD_ALT1';

            with DM_Pesq.cdsPesqProdutosCotacao do begin

                Close;
                CommandText:= (_Sql);
                Open;

            end;

            //FORMATANDO O VALOR DO CAMPO VALOR_TOTAL COMO CURRENCY SE NAO RECONHECER COLOQUE DB EM USES DEPOIS DE INTERFACE
            TCurrencyField(DM_Pesq.cdsPesqProdutosCotacao.FieldByName('PRECOVENDA')).DisplayFormat:= '###,##0.00';
         
            with grid_produtosCotacao do
            begin

              DataSource:=  DM_Pesq.dsPesqProdutosCotacao;
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

procedure T_frmEscolhaProdutoParaFecharCotacao.PesquisaPeloNomeProduto;
begin

       NomeDoProduto := edt_NomeProduto.Text;

      _Sql:= ('SELECT * FROM produtos WHERE id_produto > 1 AND descricao LIKE ''%'+NomeDoProduto+'%'' '+
              'OR cod_barras LIKE ''%'+NomeDoProduto+'%'' OR COD_ALT1 LIKE ''%'+NomeDoProduto+'%'' '+
              'OR COD_ALT2 LIKE ''%'+NomeDoProduto+'%'' OR COD_ALT3 LIKE ''%'+NomeDoProduto+'%'' '+
              'OR COD_ALT4 LIKE ''%'+NomeDoProduto+'%'' ORDER BY COD_ALT1');

      with DM_Pesq.cdsPesqProdutosCotacao do
      begin

            Close;
            CommandText:= _Sql;
            Open;

      end;  

end;


procedure T_frmEscolhaProdutoParaFecharCotacao.edt_NomeProdutoChange(Sender: TObject);
begin

     PesquisaPeloNomeProduto;

end;

procedure T_frmEscolhaProdutoParaFecharCotacao.pnl_rodapeClick(Sender: TObject);
begin
    close;
end;

procedure T_frmEscolhaProdutoParaFecharCotacao.edt_NomeProdutoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

         if( DM_Pesq.cdsPesqProdutosCotacao.fieldbyname('ESTOQUE_ATUAL').AsFloat) = 0 then
             begin

                  Application.MessageBox('Este produto não pode ser cotado, seu estoque esta zerado!', 'Estoque zerado', MB_ICONEXCLAMATION);
                  exit;

             end else begin

                _frmCotacao.txt_NomeProdutoCotacao.Caption   :=  DM_Pesq.cdsPesqProdutosCotacao.fieldbyname('COD_ALT1').AsString;
                _frmCotacao.edt_ProdutoCotacao.text          :=  DM_Pesq.cdsPesqProdutosCotacao.fieldbyname('COD_ALT1').AsString;
                _frmCotacao.edt_EstoqueCotacao.text          :=  IntToStr(DM_Pesq.cdsPesqProdutosCotacao.fieldbyname('ESTOQUE_ATUAL').AsInteger);
                _frmCotacao.edt_PrecoProdutoCotacao.text     :=  FloatToStr(DM_Pesq.cdsPesqProdutosCotacao.fieldbyname('PRECOVENDA').AsFloat);
                _frmCotacao.txt_IDPRODUTO.text               :=  IntToStr(DM_Pesq.cdsPesqProdutosCotacao.fieldbyname('ID_PRODUTO').AsInteger);
                _frmCotacao.EstoqueInicial                   :=  DM_Pesq.cdsPesqProdutosCotacao.fieldbyname('ESTOQUE_ATUAL').AsInteger;


                Application.CreateForm(T_frmQdeCotadaFecharCotacao,  _frmQdeCotadaFecharCotacao);
                _frmQdeCotadaFecharCotacao.ShowModal;
                FreeAndNil(_frmQdeCotadaFecharCotacao);

            end;

         case Key of

           //serve para navegar atraves das setas no grid

           VK_UP  : DM_Pesq.cdsPesqProdutosCotacao.Prior;
           VK_DOWN: DM_Pesq.cdsPesqProdutosCotacao.Next;

         end;


end;

procedure T_frmEscolhaProdutoParaFecharCotacao.grid_produtosCotacaoCellClick(
  Column: TColumn);
begin

            if( DM_Pesq.cdsPesqProdutosCotacao.fieldbyname('ESTOQUE_ATUAL').AsFloat) = 0 then
             begin

                  Application.MessageBox('Este produto não pode ser cotado, seu estoque esta zerado!', 'Estoque zerado', MB_ICONEXCLAMATION);
                  exit;

             end else begin

                _frmCotacao.txt_NomeProdutoCotacao.Caption   :=  DM_Pesq.cdsPesqProdutosCotacao.fieldbyname('COD_ALT1').AsString;
                _frmCotacao.edt_ProdutoCotacao.text          :=  DM_Pesq.cdsPesqProdutosCotacao.fieldbyname('COD_ALT1').AsString;
                _frmCotacao.edt_EstoqueCotacao.text          :=  IntToStr(DM_Pesq.cdsPesqProdutosCotacao.fieldbyname('ESTOQUE_ATUAL').AsInteger);
                _frmCotacao.edt_PrecoProdutoCotacao.text     :=  FloatToStr(DM_Pesq.cdsPesqProdutosCotacao.fieldbyname('PRECOVENDA').AsFloat);
                _frmCotacao.txt_IDPRODUTO.text               :=  IntToStr(DM_Pesq.cdsPesqProdutosCotacao.fieldbyname('ID_PRODUTO').AsInteger);
                _frmCotacao.EstoqueInicial                   :=  DM_Pesq.cdsPesqProdutosCotacao.fieldbyname('ESTOQUE_ATUAL').AsInteger;


                Application.CreateForm(T_frmQdeCotadaFecharCotacao,  _frmQdeCotadaFecharCotacao);
                _frmQdeCotadaFecharCotacao.ShowModal;
                FreeAndNil(_frmQdeCotadaFecharCotacao);

            end;         

end;

procedure T_frmEscolhaProdutoParaFecharCotacao.FormShow(Sender: TObject);
begin

  edt_NomeProduto.SetFocus;
  
end;

end.
