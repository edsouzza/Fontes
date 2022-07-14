unit U_GerenciarSimilares;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  T_frmGerenciarSimilares = class(TForm)
    panGridAlteraFabricantes: TPanel;
    GroupBox17: TGroupBox;
    btnExcluirSimilar: TSpeedButton;
    btnSair: TSpeedButton;
    Panel1: TPanel;
    edtFiltraProduto: TEdit;
    GridProdutos: TDBGrid;
    GridSimilaresCadastrados: TDBGrid;
    Panel2: TPanel;
    edtFiltraSimilares: TEdit;
    GridSimilares: TDBGrid;
    btnSelecionarSimilar: TSpeedButton;
    GridSimilaresSelecionados: TDBGrid;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FiltraProdutoPeloNome;
    procedure FiltrarSimilaresPeloNome;
    procedure CadastrarSimilar;
    procedure PopularGridSimilaresSelecionados;
    procedure PopularGridSimilares;
    procedure MostrarProdutosSimilaresCadastrados;
    procedure edtFiltraProdutoChange(Sender: TObject);
    procedure edtFiltraProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridSimilaresCellClick(Column: TColumn);
    procedure btnSelecionarSimilarClick(Sender: TObject);
    procedure GridProdutosCellClick(Column: TColumn);
    procedure edtFiltraSimilaresChange(Sender: TObject);
    procedure edtFiltraSimilaresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridSimilaresCadastradosCellClick(Column: TColumn);
    procedure ExcluirSimilar;
    procedure btnExcluirSimilarClick(Sender: TObject);
    procedure edtFiltraProdutoEnter(Sender: TObject);


  private
    { Private declarations }
    IDProdutoSimilar, IDProdutoSelecionado, IDProdutoSimilarParaExclusao : integer;
  public
    { Public declarations }
  end;

var
  _frmGerenciarSimilares: T_frmGerenciarSimilares;

implementation

uses Q_RelImprimeEtiquetas, U_dmDados, U_dmDadosSegundo, U_dmPesquisas,
  U_BiblioSysSalao, DB, DBClient, SqlExpr;

{$R *.dfm}

procedure T_frmGerenciarSimilares.FormCreate(Sender: TObject);
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

     dm_Conexao.cds_Similares.Active  := true;

end;

procedure T_frmGerenciarSimilares.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

     dm_Conexao.cds_Similares.Active  := false;

end;

procedure T_frmGerenciarSimilares.btnSairClick(
  Sender: TObject);
begin

      edtFiltraProduto.Clear;
      edtFiltraSimilares.Clear;
      close;

end;


procedure T_frmGerenciarSimilares.FormShow(Sender: TObject);
begin

     IDProdutoSelecionado             := dm_Conexao.cds_CadProduto.FieldByname('ID_PRODUTO').AsInteger;
     dm_Conexao.cds_CadProduto.Active := true;
     MostrarProdutosSimilaresCadastrados;
     PopularGridSimilares;
     edtFiltraProduto.SetFocus;

end;

procedure T_frmGerenciarSimilares.FiltraProdutoPeloNome;
begin

      NomeDoProduto := edtFiltraProduto.Text;

      _Sql    := ('SELECT * FROM produtos WHERE descricao <> '+QuotedStr('PRODUTO NAO CADASTRADO')+' '+
                 'AND descricao LIKE ''%'+NomeDoProduto+'%'' AND status = '+QuotedStr('A')+' AND tipo = '+QuotedStr('P')+''+
                 'OR COD_ALT1 LIKE ''%'+NomeDoProduto+'%'' OR COD_ALT2 LIKE ''%'+NomeDoProduto+'%'' '+
                 'OR COD_ALT3 LIKE ''%'+NomeDoProduto+'%'' OR COD_ALT4 LIKE ''%'+NomeDoProduto+'%'' '+
                 'OR COD_BARRAS LIKE ''%'+NomeDoProduto+'%''ORDER BY descricao');


      with dm_Conexao.cds_CadProduto do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

       IDProdutoSelecionado  := dm_Conexao.cds_CadProduto.FieldByname('ID_PRODUTO').AsInteger;
       MostrarProdutosSimilaresCadastrados;

end;

procedure T_frmGerenciarSimilares.edtFiltraProdutoChange(Sender: TObject);
begin

    FiltraProdutoPeloNome;

end;

procedure T_frmGerenciarSimilares.edtFiltraProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

      if KEY = VK_RETURN then
      begin

          edtFiltraProduto.Clear;

      end;

end;

procedure T_frmGerenciarSimilares.GridSimilaresCellClick(Column: TColumn);
begin

    btnSelecionarSimilar.Enabled := true;
    IDProdutoSimilar             := DM_Pesq.cdsPesqGeral.FieldByname('ID_PRODUTO').AsInteger;

end;


procedure T_frmGerenciarSimilares.btnSelecionarSimilarClick(Sender: TObject);
begin

    CadastrarSimilar;    

end;

procedure T_frmGerenciarSimilares.CadastrarSimilar;
var
  proxNumSimilar : integer;
begin

         proxNumSimilar := 0; 

         _Sql := 'SELECT produto_id, id_produtosimilar FROM similares WHERE produto_id = :pIDProd AND '+
                 'id_produtosimilar = :pIDSimilar';

         with dm_Conexao.cds_Similares do
         begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pIDProd').AsInteger     := IDProdutoSelecionado;
            Params.ParamByName('pIDSimilar').AsInteger  := IDProdutoSimilar;
            Open;

                if not IsEmpty then
                begin

                      Application.MessageBox('O similar selecionado já esta cadastrado para este produto!',
                       'Atenção duplicidade!', MB_OK + MB_ICONEXCLAMATION);
                       edtFiltraSimilares.Clear;
                       exit;

                 end else begin

                       With DM_Pesq.qry_Cod do
                       begin

                            Close;
                            SQL.Clear;
                            SQL.Add('select max(ID_SIMILAR) from SIMILARES');
                            Open;

                            if not IsEmpty then begin

                               proxNumSimilar := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

                            end;

                       end;


                       _Sql := 'INSERT INTO similares (id_similar, produto_id, usuario_id, id_produtosimilar, datacad) '+
                               'VALUES (:pIDSimilar, :pIDProdSelecionado, :pUser, :pIDProdSimilar, :pData)';

                       with DM_Pesq.Qry_Geral do
                       begin

                           Close;
                           sql.Clear;
                           sql.Add(_Sql);
                           Params.ParamByName('pIDSimilar').AsInteger         := proxNumSimilar;
                           Params.ParamByName('pIDProdSelecionado').AsInteger := IDProdutoSelecionado;
                           Params.ParamByName('pUser').AsInteger              := IdDoUsuarioLogado;
                           Params.ParamByName('pIDProdSimilar').AsInteger     := IDProdutoSimilar;
                           Params.ParamByName('pData').AsDateTime             := TDateTime(now);
                           ExecSQL();

                       end;

                       PopularGridSimilaresSelecionados;

                       DM_Pesq.cdsPesqConsulta.Active := false;
                       DM_Pesq.cdsPesqConsulta.Active := true;
                       MostrarProdutosSimilaresCadastrados;   
                       edtFiltraSimilares.Clear;
                       edtFiltraProduto.SetFocus;

               end;
         end;
end;


procedure T_frmGerenciarSimilares.PopularGridSimilaresSelecionados;
begin

     _Sql := 'SELECT s.produto_id, p.id_produto, p.descricao FROM similares s, produtos p '+
             'WHERE s.id_produtosimilar = p.id_produto AND s.produto_id = :pProdutoID';

     with DM_Pesq.cdsPesqAuxiliar do
     begin

         close;
         CommandText:= (_Sql);
         Params.ParamByName('pProdutoID').AsInteger  := IDProdutoSelecionado;
         Open;

          if not IsEmpty then
          begin

                  with GridSimilaresSelecionados do
                  begin

                    DataSource:=  DM_Pesq.dsPesqAuxiliar;
                    Columns.Clear;

                    Columns.Add;
                    Columns[0].FieldName         := 'DESCRICAO';
                    Columns[0].Width             := 380;
                    Columns[0].Alignment         := taLeftJustify;
                    Columns[0].Title.caption     := 'SIMILARES';
                    Columns[0].Title.Font.Style  := [fsBold];
                    Columns[0].Title.Font.Color  := clBlack;
                    Columns[0].Title.Alignment   := taCenter;

                  end;

          end;

           Application.MessageBox('Similar associado ao produto com sucesso!', 'Gravado!', MB_OK + MB_ICONINFORMATION);

     end;
end;

procedure T_frmGerenciarSimilares.GridProdutosCellClick(Column: TColumn);
begin

    IDProdutoSelecionado  := dm_Conexao.cds_CadProduto.FieldByname('ID_PRODUTO').AsInteger;
    MostrarProdutosSimilaresCadastrados;
    btnExcluirSimilar.Enabled    := false;
    btnSelecionarSimilar.Enabled := false;

end;

procedure T_frmGerenciarSimilares.PopularGridSimilares;
begin

    _Sql := 'SELECT * FROM produtos ORDER BY descricao';

     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText:= (_Sql);
         Open;

          if not IsEmpty then
          begin

                  with GridSimilares do
                  begin

                    DataSource:=  DM_Pesq.dsPesqGeral;
                    Columns.Clear;

                    Columns.Add;
                    Columns[0].FieldName         := 'COD_ALT1';
                    Columns[0].Width             := 380;
                    Columns[0].Alignment         := taLeftJustify;
                    Columns[0].Title.caption     := 'ESCOLHA O NOVO SIMILAR';
                    Columns[0].Title.Font.Style  := [fsBold];
                    Columns[0].Title.Font.Color  := clBlack;
                    Columns[0].Title.Alignment   := taCenter;

                  end;

          end;

     end;

end;

procedure T_frmGerenciarSimilares.FiltrarSimilaresPeloNome;
begin

      NomeDoProduto := edtFiltraSimilares.Text;

      _Sql    := ('SELECT * FROM produtos WHERE descricao <> '+QuotedStr('PRODUTO NAO CADASTRADO')+' '+
                 'AND descricao LIKE ''%'+NomeDoProduto+'%'' AND status = '+QuotedStr('A')+' AND tipo = '+QuotedStr('P')+''+
                 'OR COD_ALT1 LIKE ''%'+NomeDoProduto+'%'' OR COD_ALT2 LIKE ''%'+NomeDoProduto+'%'' '+
                 'OR COD_ALT3 LIKE ''%'+NomeDoProduto+'%'' OR COD_ALT4 LIKE ''%'+NomeDoProduto+'%'' '+
                 'OR COD_BARRAS LIKE ''%'+NomeDoProduto+'%''ORDER BY descricao');


      with DM_Pesq.cdsPesqGeral do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

      IDProdutoSimilar  := DM_Pesq.cdsPesqGeral.FieldByname('ID_PRODUTO').AsInteger;

end;

procedure T_frmGerenciarSimilares.edtFiltraSimilaresChange(
  Sender: TObject);
begin

    FiltrarSimilaresPeloNome;
    btnSelecionarSimilar.Enabled := true;

end;

procedure T_frmGerenciarSimilares.edtFiltraSimilaresKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

     if KEY = VK_RETURN then
      begin

          edtFiltraSimilares.Clear;

      end;

end;

procedure T_frmGerenciarSimilares.MostrarProdutosSimilaresCadastrados;
begin

     //mostrando os similares do produto selecionado

     _Sql := 'SELECT s.id_produtosimilar, s.produto_id, p.id_produto, p.cod_alt1, p.obs FROM similares s, produtos p '+
             'WHERE s.produto_id = :pProdutoID AND s.id_produtosimilar = p.id_produto';

     with DM_Pesq.cdsPesqConsulta do
     begin

         close;
         CommandText:= (_Sql);
         Params.ParamByName('pProdutoID').AsInteger  := IDProdutoSelecionado;
         Open;

          if not IsEmpty then
          begin

              with GridSimilaresCadastrados do
              begin

                DataSource:=  DM_Pesq.dsPesqConsulta;
                Columns.Clear;

                Columns.Add;
                Columns[0].FieldName         := 'COD_ALT1';
                Columns[0].Width             := 380;
                Columns[0].Alignment         := taLeftJustify;
                Columns[0].Title.caption     := 'SIMILARES CADASTRADOS';
                Columns[0].Title.Font.Style  := [fsBold];
                Columns[0].Title.Font.Color  := clBlack;
                Columns[0].Title.Alignment   := taCenter;

              end;

          end;

     end;
end;

procedure T_frmGerenciarSimilares.GridSimilaresCadastradosCellClick(
  Column: TColumn);
begin

    btnExcluirSimilar.Enabled    := true;
    IDProdutoSimilarParaExclusao :=  DM_Pesq.cdsPesqConsulta.FieldByname('ID_PRODUTOSIMILAR').asinteger;

end;

procedure T_frmGerenciarSimilares.ExcluirSimilar;
begin

      _Sql:= 'Delete FROM similares WHERE id_produtosimilar = :pIDProdutoSimilar';

      with DM_Pesq.Qry_Geral do
      begin

        Close;
        SQL.Clear;
        SQL.Add(_Sql);
        ParamByName('pIDProdutoSimilar').AsInteger := IDProdutoSimilarParaExclusao;
        ExecSQL();

     end;

     DM_Pesq.cdsPesqConsulta.Active := false;
     DM_Pesq.cdsPesqConsulta.Active := true;

     Application.MessageBox('O similar selecionado foi excluído com sucesso!',
           'Excluído!', MB_OK + MB_ICONINFORMATION);

     btnExcluirSimilar.Enabled := false;

end;

procedure T_frmGerenciarSimilares.btnExcluirSimilarClick(Sender: TObject);
begin

      if Application.MessageBox('Confirma a exclusão do produto similar?',
            'Excluindo Produto Similar', MB_YESNO +
            MB_ICONQUESTION) = IDYES then begin

            ExcluirSimilar;

      end else begin

          btnExcluirSimilar.Enabled := false;
          exit;

      end;

end;

procedure T_frmGerenciarSimilares.edtFiltraProdutoEnter(Sender: TObject);
begin

    DM_Pesq.cdsPesqAuxiliar.Close;
    btnSelecionarSimilar.Enabled   := false;
        
end;   

end.
