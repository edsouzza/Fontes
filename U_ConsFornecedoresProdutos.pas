unit U_ConsFornecedoresProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls,
  ExtDlgs;

type
  T_frmFornecedoresProdutos = class(TForm)
    pnl_cabecalho: TPanel;
    panGridAlteraFornecedores: TPanel;
    GroupBox15: TGroupBox;
    GridProdutos: TDBGrid;
    GridCategorias: TDBGrid;
    GroupBox25: TGroupBox;
    GroupBox17: TGroupBox;
    idProdAlterarFornecedor: TDBEdit;
    idNovoFornecedorParaAlteracao: TDBEdit;
    btnSairAteracaoCategoria: TSpeedButton;
    panGridProdsPorFornecedores: TPanel;
    GroupBox1: TGroupBox;
    btnSairConsProdsPorCategorias: TSpeedButton;
    btnImprimir: TSpeedButton;
    dbg_produtos: TDBGrid;
    dbg_fornecedores: TDBGrid;
    btnConsPorFornecedor: TSpeedButton;
    edtNomeFornecedor: TStaticText;
    GroupBox9: TGroupBox;
    edtConsProduto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure AlterarFornecedor;
    procedure PesquisarProdutoPorNome;
    procedure PopularGridFornecedores;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PesquisarAtualFornecedorProduto;
    procedure GridProdutosCellClick(Column: TColumn);
    procedure btnSairAteracaoCategoriaClick(Sender: TObject);
    procedure btnImprimirCategoriasClick(Sender: TObject);
    procedure FiltrarProdutosDoFornecedorSelecionado;
    procedure dbg_fornecedoresCellClick(Column: TColumn);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnConsPorFornecedorClick(Sender: TObject);
    procedure btnSairConsProdsPorCategoriasClick(Sender: TObject);
    procedure edtConsProdutoChange(Sender: TObject);
    procedure edtConsProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MostrarProdutoEFornecedor;
    procedure edtConsProdutoClick(Sender: TObject);


  private
    { Private declarations }
    IDProdutoParaPesquisa, IDFornecedorSelecionado : integer;
  public
    { Public declarations }

  end;

var
  _frmFornecedoresProdutos: T_frmFornecedoresProdutos;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, DB, U_principal, U_dmDadosSegundo,
  U_QRelCategorias, U_QRelPorCategoria, DBClient, U_QRelPorFornecedores;

{$R *.dfm}



procedure T_frmFornecedoresProdutos.FormCreate(Sender: TObject);
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

end;

procedure T_frmFornecedoresProdutos.FormShow(Sender: TObject);
begin

    AbrirTabelas;
    edtConsProduto.SetFocus;
    PopularGridFornecedores;
    MostrarProdutoEFornecedor;
    FreeAndNil(Q_RelPorFornecedores);

end;

procedure T_frmFornecedoresProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      close;
      Release;
end;

procedure T_frmFornecedoresProdutos.pnl_rodapeClick(Sender: TObject);
begin

   close;

end;

procedure T_frmFornecedoresProdutos.AbrirTabelas;
begin

     dm_Conexao.cds_CadProduto.Active               := True; 
     DM_Pesq.cdsPesqProduto.Active                  := True;
     dm_Conexao.cds_Fornecedor.Active               := True;
     DM_Pesq.cdsPesqConsulta.Active                 := true;

end;

procedure T_frmFornecedoresProdutos.FecharTabelas;
begin

     dm_Conexao.cds_CadProduto.Active               := False;
     DM_Pesq.cdsPesqProduto.Active                  := False;
     dm_Conexao.cds_Fornecedor.Active          := False;
     DM_Pesq.cdsPesqConsulta.Active                 := false;

end;


procedure T_frmFornecedoresProdutos.FecharAbrirTabelas;
begin


     DM_Pesq.cdsPesqProduto.Active                  := False;
     DM_Pesq.cdsPesqProduto.Active                  := True;

     dm_Conexao.cds_CadProduto.Active               := false;
     dm_Conexao.cds_CadProduto.Active               := True;

     dm_Conexao.cds_Fornecedor.Active               := False;
     dm_Conexao.cds_Fornecedor.Active               := True;

     DM_Pesq.cdsPesqConsulta.Active                 := false;
     DM_Pesq.cdsPesqConsulta.Active                 := true;


end;


procedure T_frmFornecedoresProdutos.AlterarFornecedor;
var
  IDProdutoParaAlterarForne, IDNovoFornecedor : integer;
begin

     IDProdutoParaAlterarForne    := StrToInt(idProdAlterarFornecedor.Text);
     IDNovoFornecedor           := StrToInt(idNovoFornecedorParaAlteracao.Text);

      With DM_Pesq.Qry_Geral do
      begin

             close;
             sql.Clear;
             sql.Add('UPDATE produtos SET fornecedor_id = :pNovoFornecedor WHERE id_produto = :pIdProdutoParaAlterarFornecedor');
             Params.ParamByName('pNovoFornecedor').AsInteger                    := IDNovoFornecedor;
             Params.ParamByName('pIdProdutoParaAlterarFornecedor').AsInteger    := IDProdutoParaAlterarForne;
             ExecSQL();

       end;

       FecharAbrirTabelas;
       dm_Conexao.cds_CadProduto.Next;
       FecharAbrirTabelas;
       Application.MessageBox('Fornecedor alterado com sucesso!',
                                          'Informa��o do Sistema', MB_OK + MB_ICONINFORMATION);
       LogOperacoes(NomeDoUsuarioLogado, 'altera��o no cadastro de fornecedores de produto');


end;

procedure T_frmFornecedoresProdutos.MostrarProdutoEFornecedor;
begin

   if ( dm_Conexao.cds_CadProduto.RecordCount > 0 )then
   begin


      PesquisarAtualFornecedorProduto;
      gridCategorias.Visible    := true;

      VerificaSeEProduto(IDProdutoParaPesquisa);

      if EProduto then
      begin

          edtNomeFornecedor.Font.Color  := clBlue;

      end else begin


          edtNomeFornecedor.Font.Color  := clRed;

      end;

   end else begin

      exit;

   end;   

end;


procedure T_frmFornecedoresProdutos.GridProdutosCellClick(Column: TColumn);
begin

    MostrarProdutoEFornecedor;

end;

procedure T_frmFornecedoresProdutos.btnSairAteracaoCategoriaClick(
  Sender: TObject);
begin
      close;
      pnl_cabecalho.Caption := 'Altera��o de fornecedores de produtos cadastrados';
end;

procedure T_frmFornecedoresProdutos.btnImprimirCategoriasClick(
  Sender: TObject);
begin

     Q_RelCategorias.cds_RelCategorias.Active := false;
     Q_RelCategorias.cds_RelCategorias.Active := true;
     Q_RelCategorias.Preview;
     FreeAndNil(Q_RelCategorias);

end;

procedure T_frmFornecedoresProdutos.FiltrarProdutosDoFornecedorSelecionado;
begin

       _Sql := 'SELECT f.forne_id, p.id_produto, p.fornecedor_id, p.descricao '+
               'FROM fornecedores f, produtos p WHERE f.forne_id = :pIDForne '+
               'AND f.forne_id = p.fornecedor_id ORDER BY p.descricao';

        With DM_Pesq.cdsPesqGeral do
        begin

             close;
             CommandText :=(_Sql);
             Params.ParamByName('pIDForne').Value := IDFornecedorSelecionado;
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


procedure T_frmFornecedoresProdutos.dbg_fornecedoresCellClick(Column: TColumn);
begin

    IDFornecedorSelecionado := dm_Conexao.cds_Fornecedor.Fields[0].Value;
    FiltrarProdutosDoFornecedorSelecionado;

end;


procedure T_frmFornecedoresProdutos.btnImprimirClick(
  Sender: TObject);
begin

     Application.CreateForm(TQ_RelPorFornecedores,  Q_RelPorFornecedores);
     Q_RelPorFornecedores.cds_RelFornecedores.Active := true;
     Q_RelPorFornecedores.Preview;
     FreeAndNil(Q_RelPorFornecedores);

end;

procedure T_frmFornecedoresProdutos.btnConsPorFornecedorClick(
  Sender: TObject);
begin

     panGridProdsPorFornecedores.BringToFront;
     pnl_cabecalho.Caption :='Consulta Produtos dos Fornecedores';
     
end;

procedure T_frmFornecedoresProdutos.btnSairConsProdsPorCategoriasClick(
  Sender: TObject);
begin

     panGridAlteraFornecedores.BringToFront;
     pnl_cabecalho.Caption :='Consulta Fornecedor dos Produtos';

end;

procedure T_frmFornecedoresProdutos.PesquisarProdutoPorNome;
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

      if (idProdAlterarFornecedor.Text = '') then
              edtNomeFornecedor.Caption:= 'PRODUTO N�O LOCALIZADO'
      else
      edtNomeFornecedor.Caption:= 'CLIQUE NO PRODUTO ACIMA PARA VER O FORNECEDOR DO MESMO';


end;


procedure T_frmFornecedoresProdutos.PesquisarAtualFornecedorProduto;
begin

       IDProdutoParaPesquisa   := StrToInt(idProdAlterarFornecedor.Text);

       _Sql := 'SELECT f.forne_id, f.forne_nome, p.id_produto, p.fornecedor_id  FROM '+
               'fornecedores f, produtos p WHERE p.id_produto = :pIdProdutoPesquisaCat '+
               'AND f.forne_id = p.fornecedor_id AND p.status = '+QuotedStr('A')+'';

      With DM_Pesq.Qry_Geral do
      begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             Params.ParamByName('pIdProdutoPesquisaCat').AsInteger  := IDProdutoParaPesquisa;
             Open;

             if not IsEmpty then
             begin

                 edtNomeFornecedor.Caption :=  DM_Pesq.Qry_Geral.Fields[1].Value;

             end else
             begin

                  edtNomeFornecedor.Caption := '';

             end;

       end;     

end;

procedure T_frmFornecedoresProdutos.edtConsProdutoChange(Sender: TObject);
begin

      PesquisarProdutoPorNome;
      gridCategorias.Visible    := true;

      VerificaSeEProduto(IDProdutoParaPesquisa);

      if EProduto then
      begin


          edtNomeFornecedor.Font.Color  := clBlue;

      end else begin

          
          edtNomeFornecedor.Font.Color  := clRed;

      end;

end;

procedure T_frmFornecedoresProdutos.edtConsProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

      if KEY = VK_RETURN then
      begin

          edtConsProduto.Clear;
          PopularGridFornecedores;
          PesquisarAtualFornecedorProduto;

      end;

end;

procedure T_frmFornecedoresProdutos.PopularGridFornecedores;
begin

           with DM_Pesq.cdsPesqConsulta do
           begin

               close;
               CommandText := 'SELECT * FROM produtos WHERE STATUS = '+QuotedStr('A')+' ORDER BY descricao';
               open;

            end;

            idProdAlterarFornecedor.DataSource:= DM_Pesq.dsPesqConsulta;
            idProdAlterarFornecedor.DataField := 'ID_PRODUTO';

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

procedure T_frmFornecedoresProdutos.edtConsProdutoClick(Sender: TObject);
begin

     edtConsProduto.Clear;
     PopularGridFornecedores;
     PesquisarAtualFornecedorProduto;

end;

end.


