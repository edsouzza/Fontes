unit U_ConsProdutosFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  T_frmConsProdutosFornecedores = class(TForm)
    panGridAlteraFabricantes: TPanel;
    GroupBox15: TGroupBox;
    GroupBox17: TGroupBox;
    btnSairAteracaoFornecedores: TSpeedButton;
    GroupBox9: TGroupBox;
    edtFiltraFornecedor: TEdit;
    GridFornecedores: TDBGrid;
    txtMSG: TStaticText;
    GridProdutos: TDBGrid;
    procedure btnSairAteracaoFornecedoresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtFiltraFornecedorChange(Sender: TObject);
    procedure GridFornecedoresCellClick(Column: TColumn);
    procedure MostrarProdutosDoFornecedor;
    procedure PesquisarPorNome;
    procedure edtFiltraFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    { Private declarations }
    IDFornecedor : integer;
  public
    { Public declarations }
  end;

var
  _frmConsProdutosFornecedores: T_frmConsProdutosFornecedores;

implementation

uses Q_RelImprimeEtiquetas, U_dmDados, U_dmDadosSegundo, U_dmPesquisas,
  U_BiblioSysSalao, DB, DBClient;

{$R *.dfm}

procedure T_frmConsProdutosFornecedores.btnSairAteracaoFornecedoresClick(
  Sender: TObject);
begin

    edtFiltraFornecedor.Clear;
    Close;
        
end;

procedure T_frmConsProdutosFornecedores.FormCreate(Sender: TObject);
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

     dm_Conexao.cds_Fornecedor.Active := true;

end;

procedure T_frmConsProdutosFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

     dm_Conexao.cds_Fornecedor.Active := false;

end;

procedure T_frmConsProdutosFornecedores.edtFiltraFornecedorChange(
  Sender: TObject);
begin

   PesquisarPorNome;

end;

procedure T_frmConsProdutosFornecedores.GridFornecedoresCellClick(
  Column: TColumn);
begin

    IDFornecedor :=  dm_Conexao.cds_Fornecedor.Fields[0].AsInteger;
    MostrarProdutosDoFornecedor;

end;

procedure T_frmConsProdutosFornecedores.PesquisarPorNome;
var
  nome : string;
begin

      nome := edtFiltraFornecedor.Text;

      _Sql  := 'SELECT * FROM fornecedores WHERE forne_status = '+QuotedStr('A')+' '+
                'AND forne_nome LIKE (''%'+nome+'%'') ORDER BY forne_nome';

      with dm_Conexao.cds_Fornecedor do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

            if not IsEmpty then
            begin

                 IDFornecedor :=  dm_Conexao.cds_Fornecedor.Fields[0].AsInteger;
                 MostrarProdutosDoFornecedor;

            end;

      end;

end;

procedure T_frmConsProdutosFornecedores.edtFiltraFornecedorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

    if KEY = VK_RETURN then
      begin

          edtFiltraFornecedor.Clear;

      end;

end;

procedure T_frmConsProdutosFornecedores.MostrarProdutosDoFornecedor;
begin

     // Mostra todos os produtos do fornecedor selecionado

       _Sql := 'SELECT * FROM produtos WHERE fornecedor_id = :pIDForne AND status = '+QuotedStr('A')+'';

       with dm_Conexao.cds_CadProduto do
       begin

           close;
           CommandText:= _Sql;
           Params.ParamByName('pIDForne').AsInteger := IDFornecedor;
           open;

           if not IsEmpty then
           begin

               with GridProdutos do
                begin

                  DataSource :=  dm_Conexao.ds_CadProduto;
                  Columns.Clear;

                  Columns.Add;
                  Columns[0].FieldName         := 'COD_ALT1';
                  Columns[0].Width             := 462;
                  Columns[0].Alignment         := taLeftJustify;
                  Columns[0].Title.caption     := 'SEUS PRODUTOS';
                  Columns[0].Title.Font.Style  := [fsBold];
                  Columns[0].Title.Alignment   := taCenter;

                   if ( dm_Conexao.cds_CadProduto.RecordCount = 1 )then
                  begin

                      txtMSG.Caption     := IntToStr(dm_Conexao.cds_CadProduto.RecordCount)+' produto cadastrado e ativo';
                      txtMSG.font.Color  := clBlue;

                  end else begin

                      txtMSG.Caption     := IntToStr(dm_Conexao.cds_CadProduto.RecordCount)+' produtos cadastrados e ativos';
                      txtMSG.font.Color  := clBlue;

                 end;

              end

           end else
           begin

                txtMSG.Caption      := 'No momento não existem produtos cadastrados e ativos com esse fornecedor';
                txtMSG.font.Color   := clRed;

           end;

       end;

end;

end.
