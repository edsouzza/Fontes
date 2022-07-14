unit U_ConsSimilares;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  T_frmConsSimilares = class(TForm)
    panGridAlteraFabricantes: TPanel;
    GroupBox15: TGroupBox;
    GroupBox17: TGroupBox;
    GroupBox9: TGroupBox;
    GridProdutos: TDBGrid;
    btnSair: TSpeedButton;
    GroupBox2: TGroupBox;
    memoProduto: TDBMemo;
    edtFiltraProduto: TEdit;
    btnLimpar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FiltraProdutoPeloNome;
    procedure LimparFiltro;
    procedure edtFiltraProdutoChange(Sender: TObject);
    procedure edtFiltraProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);


  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  _frmConsSimilares: T_frmConsSimilares;

implementation

uses Q_RelImprimeEtiquetas, U_dmDados, U_dmDadosSegundo, U_dmPesquisas,
  U_BiblioSysSalao, DB, DBClient, SqlExpr;

{$R *.dfm}

procedure T_frmConsSimilares.FormCreate(Sender: TObject);
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

procedure T_frmConsSimilares.FormShow(Sender: TObject);
begin

     edtFiltraProduto.SetFocus;
     dm_Conexao.cds_CadProduto.Active := true;

end;

procedure T_frmConsSimilares.FiltraProdutoPeloNome;
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

procedure T_frmConsSimilares.edtFiltraProdutoChange(Sender: TObject);
begin

    FiltraProdutoPeloNome;

end;

procedure T_frmConsSimilares.edtFiltraProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

      if KEY = VK_RETURN then
      begin

          btnLimparClick(self);

      end;

end;

procedure T_frmConsSimilares.btnSairClick(Sender: TObject);
begin

      btnLimparClick(self);
      Close;

end;

procedure T_frmConsSimilares.btnLimparClick(Sender: TObject);
begin
edtFiltraProduto.Clear;
LimparFiltro;
end;

procedure T_frmConsSimilares.LimparFiltro;
begin
     _Sql    := ('SELECT * FROM produtos WHERE ID_PRODUTO > 1 AND STATUS = '+QuotedStr('A')+' ORDER BY DESCRICAO');

      with dm_Conexao.cds_CadProduto do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

end;

end.
