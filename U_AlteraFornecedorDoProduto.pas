unit U_AlteraFornecedorDoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  T_frmAssociaProdutoFornecedor = class(TForm)
    panGridAlteraFabricantes: TPanel;
    GroupBox15: TGroupBox;
    GridFornecedores: TDBGrid;
    GridProdutos: TDBGrid;
    grSituacao: TGroupBox;
    edtDescricaoDaAtualFornecedorDoProduto: TStaticText;
    GroupBox17: TGroupBox;
    btnGravarAteracaoFornecedores: TSpeedButton;
    btnSairAteracaoFornecedores: TSpeedButton;
    GroupBox9: TGroupBox;
    edtConsProdutoForne: TEdit;
    btnAlterar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnSairAteracaoFornecedoresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridFornecedoresCellClick(Column: TColumn);
    procedure GridProdutosCellClick(Column: TColumn);
    procedure MostrarFornecedorDoProduto;
    procedure MostrarTodosFornecedores;
    procedure MostrarTodosProdutos;
    procedure PesquisarProdutoPorNome;
    procedure GravarAlteracao;
    procedure Limpar;
    procedure edtConsProdutoForneChange(Sender: TObject);
    procedure edtConsProdutoForneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarAteracaoFornecedoresClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);


  private
    { Private declarations }
    idFornecedorParaAlterar, idProdutoParaAlterarFornecedor : integer;
    nomeFornecedorParaAlterar : string;
  public
    { Public declarations }
  end;

var
  _frmAssociaProdutoFornecedor: T_frmAssociaProdutoFornecedor;

implementation

uses Q_RelImprimeEtiquetas, U_dmDados, U_dmDadosSegundo, U_dmPesquisas,
  U_BiblioSysSalao, DB, DBClient;

{$R *.dfm}

procedure T_frmAssociaProdutoFornecedor.btnSairAteracaoFornecedoresClick(
  Sender: TObject);
begin

    if ( DM_Pesq.cdsPesqGeral.State in [dsEdit, dsInsert] )then
     begin

         Application.MessageBox('Cancele ou grave as alterações para sair!',
                'Registro aberto!', MB_OK + MB_ICONEXCLAMATION);

     end else begin

        edtConsProdutoForne.Clear;
        Close;

     end;
        
end;

procedure T_frmAssociaProdutoFornecedor.FormCreate(Sender: TObject);
begin

     dm_Conexao.cds_CadProduto.Active := true;
     dm_Conexao.cds_Fornecedor.Active := true;

end;

procedure T_frmAssociaProdutoFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

     dm_Conexao.cds_CadProduto.Active := false;
     dm_Conexao.cds_Fornecedor.Active := false;

end;

procedure T_frmAssociaProdutoFornecedor.GridFornecedoresCellClick(
  Column: TColumn);
begin

    btnGravarAteracaoFornecedores.Enabled             := true;
    btnAlterar.Enabled                                := false;
    idFornecedorParaAlterar                           := DM_Pesq.cdsPesqGeral.Fields[0].AsInteger;
    nomeFornecedorParaAlterar                         := DM_Pesq.cdsPesqGeral.Fields[1].AsString;
    edtDescricaoDaAtualFornecedorDoProduto.Caption    := nomeFornecedorParaAlterar;
    edtDescricaoDaAtualFornecedorDoProduto.font.Color :=  clBlue;

end;

procedure T_frmAssociaProdutoFornecedor.GridProdutosCellClick(
  Column: TColumn);
begin

    idProdutoParaAlterarFornecedor := dm_Conexao.cds_CadProduto.Fields[0].AsInteger;
    GridFornecedores.Enabled       := true;
    btnAlterar.Enabled             := true;
    edtConsProdutoForne.SetFocus;
    MostrarFornecedorDoProduto;

end;

procedure T_frmAssociaProdutoFornecedor.MostrarFornecedorDoProduto;
begin

       // Mostra o atual fornecedor do produto selecionado

       _Sql := 'SELECT f.*, p.* FROM fornecedores f, produtos p WHERE '+
               'p.id_produto = :pIDProduto AND p.fornecedor_id = f.forne_id';

       with DM_Pesq.cdsPesqGeral do
       begin

           close;
           CommandText := (_Sql);
           Params.ParamByName('pIDProduto').AsInteger := idProdutoParaAlterarFornecedor;
           open;

           if not IsEmpty then
           begin

                edtDescricaoDaAtualFornecedorDoProduto.Caption      :=  DM_Pesq.cdsPesqGeral.fieldbyname('FORNE_NOME').asstring;
                edtDescricaoDaAtualFornecedorDoProduto.font.Color   :=  clBlue;

                with GridFornecedores do
                begin

                  DataSource :=  DM_Pesq.dsPesqGeral;
                  Columns.Clear;

                  Columns.Add;
                  Columns[0].FieldName         := 'FORNE_NOME';
                  Columns[0].Width             := 395;
                  Columns[0].Alignment         := taLeftJustify;
                  Columns[0].Title.caption     := 'FORNECEDOR DO PRODUTO';
                  Columns[0].Title.Font.Style  := [fsBold];
                  Columns[0].Title.Font.color  := clRed;
                  Columns[0].Title.Alignment   := taCenter;

                end;

           end else
           begin

                edtDescricaoDaAtualFornecedorDoProduto.Caption      := 'Nenhum fornecedor cadastrado no momento para este produto';
                edtDescricaoDaAtualFornecedorDoProduto.font.Color   := clRed;

           end;

       end;

     btnSairAteracaoFornecedores.Enabled := true;

end;

procedure T_frmAssociaProdutoFornecedor.PesquisarProdutoPorNome;
var
  nome : string;
begin

      nome := edtConsProdutoForne.Text;

      _Sql  := 'SELECT * FROM produtos WHERE descricao LIKE (''%'+nome+'%'') AND id_produto > 1 AND status = '+QuotedStr('A')+' ORDER BY descricao';

      with dm_Conexao.cds_CadProduto do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

            if not IsEmpty then
            begin

                idProdutoParaAlterarFornecedor := dm_Conexao.cds_CadProduto.Fields[0].AsInteger;
                MostrarFornecedorDoProduto;

            end;

      end;

end;


procedure T_frmAssociaProdutoFornecedor.edtConsProdutoForneChange(
  Sender: TObject);
begin

   PesquisarProdutoPorNome;

end;

procedure T_frmAssociaProdutoFornecedor.edtConsProdutoForneKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

      if KEY = VK_RETURN then
      begin

          edtConsProdutoForne.Clear;

      end;

end;

procedure T_frmAssociaProdutoFornecedor.FormShow(Sender: TObject);
begin

     edtConsProdutoForne.SetFocus;
     idProdutoParaAlterarFornecedor := dm_Conexao.cds_CadProduto.Fields[0].AsInteger;
     MostrarFornecedorDoProduto;
     
end;

procedure T_frmAssociaProdutoFornecedor.btnAlterarClick(Sender: TObject);
begin

    MostrarTodosFornecedores;
    edtDescricaoDaAtualFornecedorDoProduto.Caption      := 'ESCOLHA O NOME DO NOVO FORNECEDOR';
    edtDescricaoDaAtualFornecedorDoProduto.font.Color   := clTeal;
    grSituacao.Caption  := 'ALTERANDO PARA:';
    btnCancelar.Enabled := true;
    btnAlterar.Enabled  := false;
    DM_Pesq.cdsPesqGeral.Edit;

end;

procedure T_frmAssociaProdutoFornecedor.btnGravarAteracaoFornecedoresClick(
  Sender: TObject);
begin

    btnAlterar.Enabled := true;
    GravarAlteracao;

end;

procedure T_frmAssociaProdutoFornecedor.MostrarTodosFornecedores;
begin

     with DM_Pesq.cdsPesqGeral do
     begin

           close;
           CommandText := ('SELECT * FROM fornecedores ORDER BY forne_nome');
           open;

           if not IsEmpty then
           begin

              with GridFornecedores do
              begin

                DataSource :=  DM_Pesq.dsPesqGeral;
                Columns.Clear;

                Columns.Add;
                Columns[0].FieldName         := 'FORNE_NOME';
                Columns[0].Width             := 540;
                Columns[0].Alignment         := taLeftJustify;
                Columns[0].Title.caption     := 'FORNECEDOR DO PRODUTO';
                Columns[0].Title.Font.Style  := [fsBold];
                Columns[0].Title.Font.color  := clRed;
                Columns[0].Title.Alignment   := taCenter;

              end;

           end;
     end;

end;

procedure T_frmAssociaProdutoFornecedor.btnCancelarClick(Sender: TObject);
begin

    DM_Pesq.cdsPesqGeral.CancelUpdates;
    Limpar;
    
end;

procedure T_frmAssociaProdutoFornecedor.MostrarTodosProdutos;
begin

      _Sql  := 'SELECT * FROM produtos ORDER BY descricao';

      with dm_Conexao.cds_CadProduto do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

      edtConsProdutoForne.Clear;
      edtConsProdutoForne.SetFocus;
      btnGravarAteracaoFornecedores.Enabled          := false;
      edtDescricaoDaAtualFornecedorDoProduto.Caption := '';

end;

procedure T_frmAssociaProdutoFornecedor.Limpar;
begin

   grSituacao.Caption  := 'FORNECEDOR ATUAL :';
   btnGravarAteracaoFornecedores.Enabled          := false;
   btnCancelar.Enabled                            := false;
   btnAlterar.Enabled                             := false;
   edtDescricaoDaAtualFornecedorDoProduto.Caption := '';
   GridFornecedores.DataSource.DataSet.Close;
   MostrarTodosProdutos;
   edtConsProdutoForne.Clear;
   edtConsProdutoForne.SetFocus;         

end;

procedure T_frmAssociaProdutoFornecedor.GravarAlteracao;
begin

     With DM_Pesq.Qry_Geral do
      begin

         close;
         sql.Clear;
         sql.Add('UPDATE  produtos SET fornecedor_id = :pIDForne WHERE id_produto = :pIdProduto');
         Params.ParamByName('pIDForne').AsInteger      := idFornecedorParaAlterar;
         Params.ParamByName('pIdProduto').AsInteger    := idProdutoParaAlterarFornecedor;
         ExecSQL();

      end;

      Limpar;

       Application.MessageBox('O fornecedor deste produto foi alterado com sucesso!',
                'Êxito!', MB_OK + MB_ICONINFORMATION);
       LogOperacoes(NomeDoUsuarioLogado, 'alteração no cadastro de fornecedor do produto');

end;

end.
