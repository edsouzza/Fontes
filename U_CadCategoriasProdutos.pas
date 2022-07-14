unit U_CadCategoriasProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls,
  ExtDlgs;

type
  T_frmCategoriasProdutos = class(TForm)
    pnl_cabecalho: TPanel;
    panGridAlteraCategorias: TPanel;
    GroupBox15: TGroupBox;
    GridProdutos: TDBGrid;
    GridCategorias: TDBGrid;
    GroupBox25: TGroupBox;
    GroupBox17: TGroupBox;
    idProdAlterarCategoria: TDBEdit;
    idNovaCategoriaParaAlteracao: TDBEdit;
    btnSairAteracaoCategoria: TSpeedButton;
    panGridProdsPorCategorias: TPanel;
    GroupBox1: TGroupBox;
    btnSairConsProdsPorCategorias: TSpeedButton;
    btnImprimirPorCategorias: TSpeedButton;
    dbg_produtos: TDBGrid;
    dbg_categorias: TDBGrid;
    btnConsPorCategoria: TSpeedButton;
    edtDescricaoDaAtualCategoriaDoProduto: TStaticText;
    GroupBox9: TGroupBox;
    edtConsProduto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure AlterarCategoria;
    procedure PesquisarProdutoPorNome;
    procedure PopularGridCategorias;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PesquisarAtualCategoriaProduto;
    procedure GridProdutosCellClick(Column: TColumn);
    procedure btnSairAteracaoCategoriaClick(Sender: TObject);
    procedure btnImprimirCategoriasClick(Sender: TObject);
    procedure FiltrarProdutosDaCategoriaSelecionada;
    procedure dbg_categoriasCellClick(Column: TColumn);
    procedure btnImprimirPorCategoriasClick(Sender: TObject);
    procedure btnConsPorCategoriaClick(Sender: TObject);
    procedure btnSairConsProdsPorCategoriasClick(Sender: TObject);
    procedure edtConsProdutoChange(Sender: TObject);
    procedure edtConsProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MostrarProdutoECategoria;
    procedure edtConsProdutoClick(Sender: TObject);


  private
    { Private declarations }
    IDProdutoParaPesquisa, IDCategoriaSelecionada : integer;
  public
    { Public declarations }

  end;

var
  _frmCategoriasProdutos: T_frmCategoriasProdutos;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, DB, U_principal, U_dmDadosSegundo,
  U_QRelCategorias, U_QRelPorCategoria, DBClient;

{$R *.dfm}



procedure T_frmCategoriasProdutos.FormCreate(Sender: TObject);
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

procedure T_frmCategoriasProdutos.FormShow(Sender: TObject);
begin

    AbrirTabelas;
    edtConsProduto.SetFocus;
    PopularGridCategorias;
    MostrarProdutoECategoria;

end;

procedure T_frmCategoriasProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      close;
      Release;
end;

procedure T_frmCategoriasProdutos.pnl_rodapeClick(Sender: TObject);
begin

   close;

end;

procedure T_frmCategoriasProdutos.AbrirTabelas;
begin

     dm_Conexao.cds_CadProduto.Active               := True; 
     DM_Pesq.cdsPesqProduto.Active                  := True;
     dm_DadosSegundo.cds_Categorias.Active          := True;
     DM_Pesq.cdsPesqConsulta.Active                 := true;

end;

procedure T_frmCategoriasProdutos.FecharTabelas;
begin

     dm_Conexao.cds_CadProduto.Active               := False;
     DM_Pesq.cdsPesqProduto.Active                  := False;
     dm_DadosSegundo.cds_Categorias.Active          := False;
     DM_Pesq.cdsPesqConsulta.Active                 := false;

end;


procedure T_frmCategoriasProdutos.FecharAbrirTabelas;
begin


     DM_Pesq.cdsPesqProduto.Active                  := False;
     DM_Pesq.cdsPesqProduto.Active                  := True;

     dm_Conexao.cds_CadProduto.Active               := false;
     dm_Conexao.cds_CadProduto.Active               := True;

     dm_DadosSegundo.cds_Categorias.Active          := False;
     dm_DadosSegundo.cds_Categorias.Active          := True;

     DM_Pesq.cdsPesqConsulta.Active                 := false;
     DM_Pesq.cdsPesqConsulta.Active                 := true;


end;


procedure T_frmCategoriasProdutos.AlterarCategoria;
var
  IDProdutoParaAlterarCat, IDNovaCategoria : integer;
begin

     IDProdutoParaAlterarCat   := StrToInt(idProdAlterarCategoria.Text);
     IDNovaCategoria           := StrToInt(idNovaCategoriaParaAlteracao.Text);

      With DM_Pesq.Qry_Geral do
      begin

             close;
             sql.Clear;
             sql.Add('UPDATE produtos SET categoria_id = :pNovaCategoria WHERE id_produto = :pIdProdutoParaAlterarCategoria');
             Params.ParamByName('pNovaCategoria').AsInteger                    := IDNovaCategoria;
             Params.ParamByName('pIdProdutoParaAlterarCategoria').AsInteger    := IDProdutoParaAlterarCat;
             ExecSQL();

       end;

       FecharAbrirTabelas;
       dm_Conexao.cds_CadProduto.Next;
       FecharAbrirTabelas;
       Application.MessageBox('Categoria alterada com sucesso!',
                                          'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
       LogOperacoes(NomeDoUsuarioLogado, 'alteração no cadastro de categoria de produto');


end;

procedure T_frmCategoriasProdutos.MostrarProdutoECategoria;
begin

   if ( dm_Conexao.cds_CadProduto.RecordCount > 0 )then
   begin


      PesquisarAtualCategoriaProduto;
      gridCategorias.Visible    := true;

      VerificaSeEProduto(IDProdutoParaPesquisa);

      if EProduto then
      begin

          edtDescricaoDaAtualCategoriaDoProduto.Font.Color  := clBlue;

      end else begin


          edtDescricaoDaAtualCategoriaDoProduto.Font.Color  := clRed;

      end;

   end else begin

      exit;

   end;   

end;


procedure T_frmCategoriasProdutos.GridProdutosCellClick(Column: TColumn);
begin

    MostrarProdutoECategoria;

end;

procedure T_frmCategoriasProdutos.btnSairAteracaoCategoriaClick(
  Sender: TObject);
begin
      close;
      pnl_cabecalho.Caption := 'Alteração de categorias de produtos cadastrados';
end;

procedure T_frmCategoriasProdutos.btnImprimirCategoriasClick(
  Sender: TObject);
begin

     Q_RelCategorias.cds_RelCategorias.Active := false;
     Q_RelCategorias.cds_RelCategorias.Active := true;
     Q_RelCategorias.Preview;
     FreeAndNil(Q_RelCategorias);

end;

procedure T_frmCategoriasProdutos.FiltrarProdutosDaCategoriaSelecionada;
begin

       _Sql := 'SELECT c.id_categoria, p.id_produto, p.categoria_id, p.descricao '+
               'FROM categorias c, produtos p WHERE c.id_categoria = :pIDCategoria '+
               'AND c.id_categoria = p.categoria_id ORDER BY p.descricao';

        With DM_Pesq.cdsPesqGeral do
        begin

             close;
             CommandText :=(_Sql);
             Params.ParamByName('pIDCategoria').Value := IDCategoriaSelecionada;
             Open;

        end;

        with dbg_produtos do
        begin

          DataSource :=  DM_Pesq.dsPesqGeral;
          Columns.Clear;

          Columns.Add;
          Columns[0].FieldName         := 'DESCRICAO';
          Columns[0].Width             :=  375;
          Columns[0].Alignment         := taLeftJustify;
          Columns[0].Title.caption     := 'SEUS PRODUTOS';
          Columns[0].Title.Font.Style  := [fsBold];
          Columns[0].Title.Alignment   := taCenter;

        end;

end;


procedure T_frmCategoriasProdutos.dbg_categoriasCellClick(Column: TColumn);
begin

    IDCategoriaSelecionada := dm_DadosSegundo.cds_Categorias.Fields[0].Value;
    FiltrarProdutosDaCategoriaSelecionada;

end;


procedure T_frmCategoriasProdutos.btnImprimirPorCategoriasClick(
  Sender: TObject);
begin

     Application.CreateForm(TQ_RelPorCategorias,  Q_RelPorCategorias);
     Q_RelPorCategorias.cds_RelCategorias.Active := true;
     Q_RelPorCategorias.Preview;
     FreeAndNil(Q_RelPorCategorias);

end;

procedure T_frmCategoriasProdutos.btnConsPorCategoriaClick(
  Sender: TObject);
begin

     panGridProdsPorCategorias.BringToFront;
     pnl_cabecalho.Caption :='Consulta Produtos das Categorias';
     
end;

procedure T_frmCategoriasProdutos.btnSairConsProdsPorCategoriasClick(
  Sender: TObject);
begin

     panGridAlteraCategorias.BringToFront;
     pnl_cabecalho.Caption :='Consulta Categoria dos Produtos';

end;

procedure T_frmCategoriasProdutos.PesquisarProdutoPorNome;
var
  nome : string;
begin

      nome := edtConsProduto.Text;  

      _Sql  := 'SELECT * FROM produtos WHERE descricao LIKE (''%'+nome+'%'') AND  status = '+QuotedStr('A')+' ORDER BY descricao';

      with DM_Pesq.cdsPesqConsulta do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

      if (idProdAlterarCategoria.Text = '') then
              edtDescricaoDaAtualCategoriaDoProduto.Caption:= 'PRODUTO NÃO LOCALIZADO'
      else
      edtDescricaoDaAtualCategoriaDoProduto.Caption:= 'CLIQUE NO PRODUTO ACIMA PARA VER A CATEGORIA DO MESMO';


end;


procedure T_frmCategoriasProdutos.PesquisarAtualCategoriaProduto;
begin

       IDProdutoParaPesquisa   := StrToInt(idProdAlterarCategoria.Text);

       _Sql := 'SELECT c.id_categoria, c.categoria, p.id_produto, p.categoria_id  FROM '+
               'categorias c, produtos p WHERE p.id_produto = :pIdProdutoPesquisaCat '+
               'AND c.id_categoria = p.categoria_id AND p.status = '+QuotedStr('A')+'';

      With DM_Pesq.Qry_Geral do
      begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             Params.ParamByName('pIdProdutoPesquisaCat').AsInteger  := IDProdutoParaPesquisa;
             Open;

             if not IsEmpty then
             begin

                 edtDescricaoDaAtualCategoriaDoProduto.Caption :=  DM_Pesq.Qry_Geral.Fields[1].Value;

             end else
             begin

                  edtDescricaoDaAtualCategoriaDoProduto.Caption := '';

             end;

       end;     

end;

procedure T_frmCategoriasProdutos.edtConsProdutoChange(Sender: TObject);
begin

      PesquisarProdutoPorNome;
      gridCategorias.Visible    := true;

      VerificaSeEProduto(IDProdutoParaPesquisa);

      if EProduto then
      begin


          edtDescricaoDaAtualCategoriaDoProduto.Font.Color  := clBlue;

      end else begin

          
          edtDescricaoDaAtualCategoriaDoProduto.Font.Color  := clRed;

      end;


end;

procedure T_frmCategoriasProdutos.edtConsProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

      if KEY = VK_RETURN then
      begin

          edtConsProduto.Clear;
          PopularGridCategorias;
          PesquisarAtualCategoriaProduto;

      end;

end;



procedure T_frmCategoriasProdutos.PopularGridCategorias;
begin

           with DM_Pesq.cdsPesqConsulta do
           begin

               close;
               CommandText := 'SELECT * FROM produtos WHERE STATUS = '+QuotedStr('A')+' ORDER BY descricao';
               open;

            end;

            idProdAlterarCategoria.DataSource:= DM_Pesq.dsPesqConsulta;
            idProdAlterarCategoria.DataField := 'ID_PRODUTO';

          with GridProdutos do
          begin

            DataSource:=  DM_Pesq.dsPesqConsulta;
            Columns.Clear;

            Columns.Add;
            Columns[0].FieldName         := 'DESCRICAO';
            Columns[0].Title.caption     := 'PRODUTOS';
            Columns[0].Width             := 785;
            Columns[0].Alignment         := taLeftJustify;
            Columns[0].Title.Font.Style  := [fsBold];
            Columns[0].Title.Alignment   := taCenter;

          end;


end;

procedure T_frmCategoriasProdutos.edtConsProdutoClick(Sender: TObject);
begin

     edtConsProduto.Clear;
     PopularGridCategorias;
     PesquisarAtualCategoriaProduto;

end;

end.


