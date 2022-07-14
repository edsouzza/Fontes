unit U_EscolhaDoProdutoParaTroca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls, DB;

type
  T_frmEscolhaDoProdutoParaTroca = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    grid_produtosComanda: TDBGrid;
    GroupBox1: TGroupBox;
    edt_NomeProduto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure grid_produtosComandaCellClick(Column: TColumn);
    procedure PesquisaPeloNomeProduto;
    procedure edt_NomeProdutoChange(Sender: TObject);
    procedure PopulandoGridProdutos;
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
  _frmEscolhaDoProdutoParaTroca: T_frmEscolhaDoProdutoParaTroca;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, U_Caixa, U_TrocaDeProduto;

{$R *.dfm}

procedure T_frmEscolhaDoProdutoParaTroca.FormCreate(Sender: TObject);
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

procedure T_frmEscolhaDoProdutoParaTroca.PopulandoGridProdutos;
begin

           _Sql := 'SELECT * FROM produtos WHERE status = '+QuotedStr('A')+' AND id_produto > 1 ORDER BY COD_ALT1';

           with DM_Pesq.cdsPesqProduto do
           begin

                Close;
                CommandText:= (_Sql);
                Open;

            end;


            //FORMATANDO O VALOR DO CAMPO VALOR_TOTAL COMO CURRENCY SE NAO RECONHECER COLOQUE DB EM USES DEPOIS DE INTERFACE
            TCurrencyField(DM_Pesq.cdsPesqProduto.FieldByName('PRECOVENDA')).DisplayFormat:= '###,##0.00';


            with grid_produtosComanda do
            begin

              DataSource:=  DM_Pesq.dsPesqProduto;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName        := 'COD_BARRAS';
              Columns[0].Width            := 100;
              Columns[0].Alignment        := taLeftJustify;
              Columns[0].Title.caption    := 'CÓDIGO';
              Columns[0].Title.Font.Style := [fsBold];
              Columns[0].Title.Alignment  := taLeftJustify;


              Columns.Add;
              Columns[1].FieldName        := 'COD_ALT1';
              Columns[1].Width            := 265;
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

procedure T_frmEscolhaDoProdutoParaTroca.pnl_rodapeClick(Sender: TObject);
begin

    close;

end;

procedure T_frmEscolhaDoProdutoParaTroca.grid_produtosComandaCellClick(
  Column: TColumn);
begin

   if( DM_Pesq.cdsPesqProduto.fieldbyname('ESTOQUE_ATUAL').AsFloat) = 0 then
   begin

        Application.MessageBox('Este produto não pode ser utilizado, seu estoque esta zerado!', 'Estoque zerado', MB_ICONEXCLAMATION);
        exit;

   end else begin

      _frmTrocaDeProduto.txtCodigoProdTrocado.Caption         :=  DM_Pesq.cdsPesqProduto.fieldbyname('COD_BARRAS').AsString;
      _frmTrocaDeProduto.edt_CodBarProdutoDeSaida.text        :=  DM_Pesq.cdsPesqProduto.fieldbyname('COD_BARRAS').AsString;
      _frmTrocaDeProduto.txtDescricaoProdTrocado.Caption      :=  DM_Pesq.cdsPesqProduto.fieldbyname('COD_ALT1').AsString;
      _frmTrocaDeProduto.txtEstoqueProdTrocado.Caption        :=  IntToStr(DM_Pesq.cdsPesqProduto.fieldbyname('ESTOQUE_ATUAL').AsInteger);
      _frmTrocaDeProduto.txtUnitarioProdTrocado.Caption       :=  FloatToStrF(DM_Pesq.cdsPesqProduto.fieldbyname('PRECOVENDA').AsFloat,ffNumber,4,2);
      _frmTrocaDeProduto.edtQdeTrocada.SetFocus;
      close;

   end;

end;

procedure T_frmEscolhaDoProdutoParaTroca.PesquisaPeloNomeProduto;
begin

       NomeDoProduto := edt_NomeProduto.Text;

      _Sql:= ('SELECT * FROM produtos WHERE id_produto > 1 AND descricao LIKE ''%'+NomeDoProduto+'%'' '+
              'OR cod_barras LIKE ''%'+NomeDoProduto+'%'' OR COD_ALT1 LIKE ''%'+NomeDoProduto+'%'' '+
              'OR COD_ALT2 LIKE ''%'+NomeDoProduto+'%'' OR COD_ALT3 LIKE ''%'+NomeDoProduto+'%'' '+
              'OR COD_ALT4 LIKE ''%'+NomeDoProduto+'%'' ORDER BY COD_ALT1');

      with DM_Pesq.cdsPesqProduto do begin

          Close;
          CommandText:= _Sql;
          Open;

      end;
end;


procedure T_frmEscolhaDoProdutoParaTroca.edt_NomeProdutoChange(
  Sender: TObject);
begin

    PesquisaPeloNomeProduto;

end;

procedure T_frmEscolhaDoProdutoParaTroca.edt_NomeProdutoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

        if key=13 then begin

               if( DM_Pesq.cdsPesqProduto.fieldbyname('ESTOQUE_ATUAL').AsFloat) = 0 then
               begin

                    Application.MessageBox('Este produto não pode ser utilizado, seu estoque esta zerado!', 'Estoque zerado', MB_ICONEXCLAMATION);
                    exit;

               end else begin

                  _frmTrocaDeProduto.txtCodigoProdTrocado.Caption         :=  DM_Pesq.cdsPesqProduto.fieldbyname('COD_BARRAS').AsString;
                  _frmTrocaDeProduto.edt_CodBarProdutoDeSaida.text        :=  DM_Pesq.cdsPesqProduto.fieldbyname('COD_BARRAS').AsString;
                  _frmTrocaDeProduto.txtDescricaoProdTrocado.Caption      :=  DM_Pesq.cdsPesqProduto.fieldbyname('COD_ALT1').AsString;
                  _frmTrocaDeProduto.txtEstoqueProdTrocado.Caption        :=  IntToStr(DM_Pesq.cdsPesqProduto.fieldbyname('ESTOQUE_ATUAL').AsInteger);
                  _frmTrocaDeProduto.txtUnitarioProdTrocado.Caption       :=  FloatToStrF(DM_Pesq.cdsPesqProduto.fieldbyname('PRECOVENDA').AsFloat,ffNumber,4,2);
                  _frmTrocaDeProduto.edtQdeTrocada.SetFocus;
                  close;

               end;       

        end;

        case Key of

          VK_UP  : DM_Pesq.cdsPesqProduto.Prior;
          VK_DOWN: DM_Pesq.cdsPesqProduto.Next;

        end;


end;

procedure T_frmEscolhaDoProdutoParaTroca.FormShow(Sender: TObject);
begin
  edt_NomeProduto.SetFocus;
end;

end.
