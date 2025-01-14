unit U_EscolhaProdutoParaOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls, DB;

type
  T_frmEscolhaDoProdutoParaOrcamento = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    grid_produtos: TDBGrid;
    GroupBox1: TGroupBox;
    edt_NomeProduto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure grid_produtosCellClick(Column: TColumn);
    procedure PesquisaPeloNomeProduto;
    procedure PopulandoGridProdutos;
    procedure edt_NomeProdutoChange(Sender: TObject);
    procedure edt_NomeProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MesEscolhido, QdeProduto : string;
  end;

var
  _frmEscolhaDoProdutoParaOrcamento: T_frmEscolhaDoProdutoParaOrcamento;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, U_orcamento,
  U_AtualizarFecharOrcamento;

{$R *.dfm}

procedure T_frmEscolhaDoProdutoParaOrcamento.FormCreate(Sender: TObject);
//DESABILITA O BOTAO FECHAR DO FORMUL�RIO
var
  hwndHandle : THANDLE;
  hMenuHandle : HMenu;
begin
//Impede movimenta��o do formul�rio
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

procedure T_frmEscolhaDoProdutoParaOrcamento.PopulandoGridProdutos;
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
            TCurrencyField(DM_Pesq.cdsPesqProduto.FieldByName('ESTOQUE_ATUAL')).DisplayFormat:= '###,##0.00';


            with grid_produtos do
            begin

              DataSource:=  DM_Pesq.dsPesqProduto;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName        := 'COD_BARRAS';
              Columns[0].Width            := 100;
              Columns[0].Alignment        := taLeftJustify;
              Columns[0].Title.caption    := 'C�DIGO';
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
              Columns[3].Title.caption    := 'PRE�O UNIT�RIO';
              Columns[3].Title.Font.Style := [fsBold];
              Columns[3].Title.Alignment  := taRightJustify;

            end;      

end;

procedure T_frmEscolhaDoProdutoParaOrcamento.pnl_rodapeClick(Sender: TObject);
begin  
  close;
end;

procedure T_frmEscolhaDoProdutoParaOrcamento.PesquisaPeloNomeProduto;
begin

       NomeDoProduto := edt_NomeProduto.Text;

       _Sql:= ('SELECT * FROM produtos WHERE id_produto > 1 AND descricao LIKE ''%'+NomeDoProduto+'%'' '+
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

procedure T_frmEscolhaDoProdutoParaOrcamento.grid_produtosCellClick(
  Column: TColumn);
begin

     if ( AtualizandoOrcamento ) then
      begin

             if (DM_Pesq.cdsPesqProduto.FieldByName('ESTOQUE_ATUAL').AsFloat=0) then
             begin

                  Application.MessageBox('Este produto n�o pode ser utilizado, seu estoque esta zerado!', 'Estoque zerado', MB_ICONEXCLAMATION);
                  exit;

              end else begin

                close;

              end;

     end;

end;


procedure T_frmEscolhaDoProdutoParaOrcamento.edt_NomeProdutoChange(
  Sender: TObject);
begin

    PesquisaPeloNomeProduto;

end;

procedure T_frmEscolhaDoProdutoParaOrcamento.edt_NomeProdutoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

        if key=13 then
        begin

               if ( AtualizandoOrcamento ) then
                begin

                       if (DM_Pesq.cdsPesqProduto.FieldByName('ESTOQUE_ATUAL').AsFloat=0) then
                       begin

                            Application.MessageBox('Este produto n�o pode ser utilizado, seu estoque esta zerado!', 'Estoque zerado', MB_ICONEXCLAMATION);
                            exit;

                        end else begin

                          close;

                        end;

                end else begin

                       if (DM_Pesq.cdsPesqProduto.FieldByName('ESTOQUE_ATUAL').AsFloat=0) then
                       begin

                            Application.MessageBox('Este produto n�o pode ser utilizado, seu estoque esta zerado!', 'Estoque zerado', MB_ICONEXCLAMATION);
                            exit;

                        end else begin

                        
                        close;

                        end;
               end;  

        end;

         case Key of

          VK_UP  : DM_Pesq.cdsPesqProduto.Prior;
          VK_DOWN: DM_Pesq.cdsPesqProduto.Next;

        end;

end;

procedure T_frmEscolhaDoProdutoParaOrcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    AtualizandoOrcamento := false;

end;

procedure T_frmEscolhaDoProdutoParaOrcamento.FormShow(Sender: TObject);
begin

    edt_NomeProduto.SetFocus;

end;

end.





