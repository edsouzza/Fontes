unit U_CadSimilares;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  T_frmCadSimilares = class(TForm)
    panGridAlteraFabricantes: TPanel;
    GroupBox15: TGroupBox;
    GroupBox17: TGroupBox;
    btnSair: TSpeedButton;
    GroupBox9: TGroupBox;
    GridSimilares: TDBGrid;
    GridProdutos: TDBGrid;
    btnCadastraSimilar: TSpeedButton;
    lblProdutoPrincipal: TStaticText;
    edtFiltraProduto: TEdit;
    btnGravar: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FiltraProdutoPeloNome;
    procedure CadastrarSimilar;
    procedure PopularGridSimilares;
    procedure ExcluirSimilar;
    procedure edtFiltraProdutoChange(Sender: TObject);
    procedure edtFiltraProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridProdutosCellClick(Column: TColumn);
    procedure btnCadastraSimilarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);


  private
    { Private declarations }
    IDProdutoSimilar : integer;
  public
    { Public declarations }
  end;

var
  _frmCadSimilares: T_frmCadSimilares;

implementation

uses Q_RelImprimeEtiquetas, U_dmDados, U_dmDadosSegundo, U_dmPesquisas,
  U_BiblioSysSalao, DB, DBClient, SqlExpr;

{$R *.dfm}

procedure T_frmCadSimilares.FormCreate(Sender: TObject);
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

procedure T_frmCadSimilares.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

     dm_Conexao.cds_Similares.Active  := false;

end;

procedure T_frmCadSimilares.ExcluirSimilar;
begin

      _Sql:= 'Delete FROM similares WHERE produto_id = :pIDProdutoSimilar';

      with DM_Pesq.Qry_Geral do
      begin

        Close;
        SQL.Clear;
        SQL.Add(_Sql);
        ParamByName('pIDProdutoSimilar').AsInteger := IDProdutoGeral;
        ExecSQL();

     end;

end;

procedure T_frmCadSimilares.btnSairClick(
  Sender: TObject);
begin   

    ExcluirSimilar;
    Application.MessageBox('O cadastro dos similares foi cancelado com sucesso!',
           'Cancelamento da operação!', MB_OK + MB_ICONINFORMATION);
    LogOperacoes(NomeDoUsuarioLogado, 'cadastro de similar');
    edtFiltraProduto.Clear;
    Close;

end;


procedure T_frmCadSimilares.FormShow(Sender: TObject);
begin

     lblProdutoPrincipal.Caption := DescProdutoGeral;
     edtFiltraProduto.SetFocus;

end;

procedure T_frmCadSimilares.FiltraProdutoPeloNome;
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

end;

procedure T_frmCadSimilares.edtFiltraProdutoChange(Sender: TObject);
begin

    FiltraProdutoPeloNome;

end;

procedure T_frmCadSimilares.edtFiltraProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

      if KEY = VK_RETURN then
      begin

          edtFiltraProduto.Clear;

      end;

end;

procedure T_frmCadSimilares.GridProdutosCellClick(Column: TColumn);
begin

    IDProdutoSimilar           := dm_Conexao.cds_CadProduto.Fields[0].AsInteger;
    btnCadastraSimilar.Enabled := true;

end;


procedure T_frmCadSimilares.btnCadastraSimilarClick(Sender: TObject);
begin

    CadastrarSimilar;

end;

procedure T_frmCadSimilares.CadastrarSimilar;
begin

  {   With DM_Pesq.qry_Cod do
     begin

          Close;
          SQL.Clear;
          SQL.Add('select max(ID_SIMILAR) from SIMILARES');
          Open;

          if not IsEmpty then begin

             proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

          end;

     end;   }

     GerarProximoID('id_similar','similares');

     // Abrindo um registro novo e gravando no bd
     with dm_Conexao.cds_Similares do
     begin

        Append;   
        FieldByName('id_similar').AsInteger         := proxNum;
        FieldByname('produto_id').AsInteger         := IDProdutoGeral;
        FieldByname('usuario_id').AsInteger         := IdDoUsuarioLogado;
        FieldByName('id_produtosimilar').AsInteger  := IDProdutoSimilar;
        FieldByname('datacad').AsDateTime           := TDateTime(now);
        ApplyUpdates(0);
        
     end;

     PopularGridSimilares;
     btnGravar.Enabled := true;

end;

procedure T_frmCadSimilares.PopularGridSimilares;
begin

     _Sql := 'SELECT s.produto_id, p.id_produto, p.descricao, p.cod_alt1 FROM similares s, produtos p '+
             'WHERE s.id_produtosimilar = p.id_produto AND s.produto_id = :pProdutoID';

     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText:= (_Sql);
         Params.ParamByName('pProdutoID').AsInteger  := IDProdutoGeral;
         Open;

          if not IsEmpty then
          begin

                  with GridSimilares do
                  begin

                    DataSource:=  DM_Pesq.dsPesqGeral;
                    Columns.Clear;

                    Columns.Add;
                    Columns[0].FieldName         := 'COD_ALT1';
                    Columns[0].Width             := 350;
                    Columns[0].Alignment         := taLeftJustify;
                    Columns[0].Title.caption     := 'SIMILARES';
                    Columns[0].Title.Font.Style  := [fsBold];
                    Columns[0].Title.Font.Color  := clBlack;
                    Columns[0].Title.Alignment   := taCenter;

                  end;

          end;

     end;
end;

procedure T_frmCadSimilares.btnGravarClick(Sender: TObject);
begin
    Application.MessageBox('Os similares selecionados foram gravados com sucesso!',
           'Gravados!', MB_OK + MB_ICONINFORMATION);
    LogOperacoes(NomeDoUsuarioLogado, 'cadastro de similar');

    edtFiltraProduto.Clear;
    Close;
end;

end.
