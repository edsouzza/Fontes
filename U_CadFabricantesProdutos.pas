unit U_CadFabricantesProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls,
  ExtDlgs;

type
  T_frmFabricantesProdutos = class(TForm)
    pnl_cabecalho: TPanel;
    panGridAlteraFabricantes: TPanel;
    GroupBox15: TGroupBox;
    GridProdutos: TDBGrid;
    GridFabricantes: TDBGrid;
    GroupBox17: TGroupBox;
    idProdAlterarFabricante: TDBEdit;
    idNovoFabricanteParaAlteracao: TDBEdit;
    btnSairAteracaoFabricantes: TSpeedButton;
    panGridProdsPorFabricantes: TPanel;
    GroupBox1: TGroupBox;
    dbg_fabricantes: TDBGrid;
    dbg_produtos: TDBGrid;
    btnConsPorFabricante: TSpeedButton;
    btnSairConsProdsPorFabricantes: TSpeedButton;
    btnImprimirPorFabricantes: TSpeedButton;
    GroupBox2: TGroupBox;
    edtDescricaoDaAtualFabricanteDoProduto: TStaticText;
    GroupBox9: TGroupBox;
    edtConsProduto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure AlterarFabricante;
    procedure PesquisarProdutoPorNome;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PesquisarAtualFabricanteProduto;
    procedure GridProdutosCellClick(Column: TColumn);
    procedure btnSairAteracaoFabricantesClick(Sender: TObject);
    procedure btnImprimirFabricantesClick(Sender: TObject);
    procedure btnConsPorFabricanteClick(Sender: TObject);
    procedure FiltrarProdutosDoFabricanteSelecionado;
    procedure dbg_fabricantesCellClick(Column: TColumn);
    procedure btnSairConsProdsPorFabricantesClick(Sender: TObject);
    procedure btnImprimirPorFabricantesClick(Sender: TObject);
    procedure edtConsProdutoChange(Sender: TObject);
    procedure edtConsProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MostrarProdutosEFabricantes;
    procedure edtConsProdutoClick(Sender: TObject);


  private
    { Private declarations }
    IDProdutoParaAlterarFab, IDNovoFabricante, IDProdutoParaPesquisa, IDFabricanteSelecionado : integer;

  public
    { Public declarations }

  end;

var
  _frmFabricantesProdutos: T_frmFabricantesProdutos;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, DB, U_principal, U_dmDadosSegundo,
  U_QRelCategorias, U_QRelFabricantes, DBClient, U_QRelPorFabricantes;

{$R *.dfm}



procedure T_frmFabricantesProdutos.FormCreate(Sender: TObject);
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

procedure T_frmFabricantesProdutos.FormShow(Sender: TObject);
begin

    AbrirTabelas;
    edtConsProduto.SetFocus;
    MostrarProdutosEFabricantes;

end;


procedure T_frmFabricantesProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      close;
      Release;
end;

procedure T_frmFabricantesProdutos.pnl_rodapeClick(Sender: TObject);
begin

   close;

end;

procedure T_frmFabricantesProdutos.AbrirTabelas;
begin

     dm_Conexao.cds_CadProduto.Active               := True; 
     DM_Pesq.cdsPesqProduto.Active                  := True;
     dm_Conexao.cds_Fabricante.Active               := True;

end;

procedure T_frmFabricantesProdutos.FecharTabelas;
begin

     dm_Conexao.cds_CadProduto.Active               := False;
     DM_Pesq.cdsPesqProduto.Active                  := False;
     dm_Conexao.cds_Fabricante.Active               := False;

end;


procedure T_frmFabricantesProdutos.FecharAbrirTabelas;
begin


     DM_Pesq.cdsPesqProduto.Active                  := False;
     DM_Pesq.cdsPesqProduto.Active                  := True;

     dm_Conexao.cds_CadProduto.Active               := false;
     dm_Conexao.cds_CadProduto.Active               := True;

     dm_Conexao.cds_Fabricante.Active               := False;
     dm_Conexao.cds_Fabricante.Active               := True;


end;


procedure T_frmFabricantesProdutos.AlterarFabricante;
begin

     IDProdutoParaAlterarFab    := StrToInt(idProdAlterarFabricante.Text);
     IDNovoFabricante           := StrToInt(idNovoFabricanteParaAlteracao.Text);

      With DM_Pesq.Qry_Geral do
      begin

             close;
             sql.Clear;
             sql.Add('UPDATE produtos SET fabricante_id = :pNovoFabricante WHERE id_produto = :pIdProdutoParaAlterarFabricante');
             Params.ParamByName('pNovoFabricante').AsInteger                    := IDNovoFabricante;
             Params.ParamByName('pIdProdutoParaAlterarFabricante').AsInteger    := IDProdutoParaAlterarFab;
             ExecSQL();

       end;

       FecharAbrirTabelas;
       dm_Conexao.cds_CadProduto.Next;
       FecharAbrirTabelas;
       Application.MessageBox('Fabricante alterado com sucesso!',
                                          'Informa��o do Sistema', MB_OK + MB_ICONINFORMATION);
       LogOperacoes(NomeDoUsuarioLogado, 'altera��o no cadastro de fabricante de produto');

end;

procedure T_frmFabricantesProdutos.MostrarProdutosEFabricantes;
begin

   if ( dm_Conexao.cds_CadProduto.RecordCount > 0 )then
   begin

      PesquisarAtualFabricanteProduto;
      GridFabricantes.Visible              := true;

      VerificaSeEProduto(IDProdutoParaPesquisa);

      if EProduto then
      begin

          edtDescricaoDaAtualFabricanteDoProduto.Font.Color := clBlue;

      end else begin

          edtDescricaoDaAtualFabricanteDoProduto.Caption    := 'SERVICOS';
          edtDescricaoDaAtualFabricanteDoProduto.Font.Color := clRed;

      end;

   end else begin

       exit;

   end;

end;


procedure T_frmFabricantesProdutos.GridProdutosCellClick(Column: TColumn);
begin

    MostrarProdutosEFabricantes;

end;

procedure T_frmFabricantesProdutos.btnSairAteracaoFabricantesClick(
  Sender: TObject);
begin
      close;
      pnl_cabecalho.Caption := 'Altera��o de fabricantes de produtos cadastrados';
end;

procedure T_frmFabricantesProdutos.btnImprimirFabricantesClick(
  Sender: TObject);
begin

      Q_RelFabricantes.cds_RelFabricantes.Active := false;
      Q_RelFabricantes.cds_RelFabricantes.Active := true;
      Q_RelFabricantes.Preview;

end;

procedure T_frmFabricantesProdutos.btnConsPorFabricanteClick(
  Sender: TObject);
begin

    panGridProdsPorFabricantes.BringToFront;
    pnl_cabecalho.Caption :='Consulta Produtos dos Fabricantes';

end;

procedure T_frmFabricantesProdutos.FiltrarProdutosDoFabricanteSelecionado;
begin

       _Sql := 'SELECT f.id_fabricante, p.id_produto, p.fabricante_id, p.descricao '+
               'FROM fabricantes f, produtos p WHERE f.id_fabricante = :pIDFabricante '+
               'AND f.id_fabricante = p.fabricante_id  ORDER BY p.descricao';

        With DM_Pesq.cdsPesqGeral do
        begin

             close;
             CommandText :=(_Sql);
             Params.ParamByName('pIDFabricante').Value := IDFabricanteSelecionado;
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


procedure T_frmFabricantesProdutos.dbg_fabricantesCellClick(
  Column: TColumn);
begin

    IDFabricanteSelecionado := dm_Conexao.cds_Fabricante.Fields[0].Value;
    FiltrarProdutosDoFabricanteSelecionado;

end;

procedure T_frmFabricantesProdutos.btnSairConsProdsPorFabricantesClick(
  Sender: TObject);
begin

     panGridAlteraFabricantes.BringToFront;
     pnl_cabecalho.Caption :='Consulta Fabricantes dos Produtos';

end;

procedure T_frmFabricantesProdutos.btnImprimirPorFabricantesClick(Sender: TObject);
begin

     Application.CreateForm(TQ_RelPorFabricantes,  Q_RelPorFabricantes);
     Q_RelPorFabricantes.cds_RelPorFabricantes.Active := true;
     Q_RelPorFabricantes.Preview;
     FreeAndNil(Q_RelPorFabricantes);

end;

procedure T_frmFabricantesProdutos.PesquisarProdutoPorNome;
var
  nome : string;
begin

       nome := edtConsProduto.Text;   //AND descricao <> '+QuotedStr('PRODUTO NAO CADASTRADO')+'

       _Sql  := 'SELECT * FROM produtos WHERE descricao LIKE (''%'+nome+'%'') AND id_produto > 1 AND status = '+QuotedStr('A')+' ORDER BY descricao';

      with dm_Conexao.cds_CadProduto do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

      if (idProdAlterarFabricante.Text = '') then
              edtDescricaoDaAtualFabricanteDoProduto.Caption:= 'PRODUTO N�O LOCALIZADO'
      else
      edtDescricaoDaAtualFabricanteDoProduto.Caption:= 'CLIQUE NO PRODUTO ACIMA PARA VER A CATEGORIA DO MESMO';


end;


procedure T_frmFabricantesProdutos.PesquisarAtualFabricanteProduto;
begin

     IDProdutoParaPesquisa   := StrToInt(idProdAlterarFabricante.Text);

     _Sql := 'SELECT f.id_fabricante, f.nome_fabricante, p.id_produto, p.fabricante_id  FROM '+
             'fabricantes f, produtos p WHERE p.id_produto = :pIdProdutoPesquisa '+
             'AND f.id_fabricante = p.fabricante_id AND p.status = '+QuotedStr('A')+'';

      With DM_Pesq.Qry_Geral do
      begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             Params.ParamByName('pIdProdutoPesquisa').AsInteger  := IDProdutoParaPesquisa;
             Open;

             if not IsEmpty then
             begin

                 edtDescricaoDaAtualFabricanteDoProduto.Caption :=  DM_Pesq.Qry_Geral.Fields[1].Value;

             end else
             begin

                  edtDescricaoDaAtualFabricanteDoProduto.Caption := '';

             end;

       end;

end;

procedure T_frmFabricantesProdutos.edtConsProdutoChange(Sender: TObject);
begin

      PesquisarProdutoPorNome;
      GridFabricantes.Visible     := true;

      VerificaSeEProduto(IDProdutoParaPesquisa);

      if EProduto then
      begin
          edtDescricaoDaAtualFabricanteDoProduto.Font.Color := clBlue;

      end else begin

          edtDescricaoDaAtualFabricanteDoProduto.Caption    := 'SERVICOS';
          edtDescricaoDaAtualFabricanteDoProduto.Font.Color := clRed;

      end;
      
end;

procedure T_frmFabricantesProdutos.edtConsProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if KEY = VK_RETURN then
      begin

          edtConsProduto.Clear;
          PesquisarAtualFabricanteProduto;

      end;

end;


procedure T_frmFabricantesProdutos.edtConsProdutoClick(Sender: TObject);
begin

    edtConsProduto.Clear;
    PesquisarAtualFabricanteProduto;

end;

end.


