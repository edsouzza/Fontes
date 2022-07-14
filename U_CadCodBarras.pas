unit U_CadCodBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls, DB, Inifiles;

type
  T_frmCadCodBarras = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    btnConfirmaInclusao: TSpeedButton;
    cod_barras: TImage;
    edt_CodigoProduto: TEdit;
    btnSair: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GravarCodigoBarras;
    procedure btnConfirmaInclusaoClick(Sender: TObject);
    procedure FecharAbrirTabelas;
    procedure edt_CodigoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure edt_CodigoProdutoChange(Sender: TObject);
    procedure RenomearFoto(cod_barra:string);
    procedure edt_CodigoProdutoEnter(Sender: TObject);

  private
    { Private declarations }
    IDProduto : integer;
  public
    { Public declarations }


  end;

var
  _frmCadCodBarras: T_frmCadCodBarras;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas,
   U_dmDadosSegundo, U_Produtos, SqlExpr;

{$R *.dfm}

procedure T_frmCadCodBarras.FormCreate(Sender: TObject);
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


procedure T_frmCadCodBarras.FormShow(Sender: TObject);
var
  config  : TIniFile;
  pathCodBarras : string;
begin

  IDProduto := StrToInt(_frmProdutos.dbedtID_PRODUTO.Text);

  config          := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'configuracoes.ini');
  pathCodBarras   := config.ReadString('caminho_das_imgs','imgcodbarras','');
  cod_barras.Picture.LoadFromFile(pathCodBarras);
  cod_barras.Transparent := true;

  //cod_barras.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\codigo_barras.gif');
  //cod_barras.Picture.LoadFromFile('C:\Arquivos de programas\SysPdv\imagens\codigo_barras.gif');
  //cod_barras.Transparent := true;

end;

procedure T_frmCadCodBarras.RenomearFoto(cod_barra: string);
var
 nomeAntigoFoto, novoNomeFoto : string;
begin

   //RENOMEAR A FOTO PARA O NOVO CODIGO DE BARRAS
   nomeAntigoFoto    := ExtractFilePath(Application.ExeName)+'Produtos\'+_frmProdutos.dbCodBarrasTelaInicial.Text+'.jpg';
   novoNomeFoto      := ExtractFilePath(Application.ExeName)+'Produtos\'+cod_barra+'.jpg';

   RenameFile(nomeAntigoFoto, novoNomeFoto);

end;

procedure T_frmCadCodBarras.GravarCodigoBarras;
begin

    if(TemDuplicidadeNoCampo('cod_barras','produtos',edt_CodigoProduto.text))then
    begin

        Application.MessageBox('Este código de barras esta cadastrado ou inativado verifique!', 'Atenção código de barras inválido!', MB_ICONWARNING);
        edt_CodigoProduto.Clear;
        exit;

    end else
    begin

      _Sql:= 'UPDATE produtos SET cod_barras = :pCodBarras WHERE id_produto = :pIDProduto';

      with DM_Pesq.Qry_Geral do
      begin

          close;
          sql.Clear;
          sql.Add(_sql);
          Params.ParamByName('pCodBarras').Value := edt_CodigoProduto.Text;
          Params.ParamByName('pIDProduto').Value := IDProduto;
          ExecSQL();

      end;
      RenomearFoto(edt_CodigoProduto.Text);
      FecharAbrirTabelas;
      _frmProdutos.Abrir_Fechar_Tabelas;
      _frmProdutos.FormatarValoresComoMoeda;
      AlterandoCodBarrasTelaIni := false;
      Application.MessageBox('Código de barras alterado com sucesso!', 'Ok', MB_OK);
      close;
    end;

end;

procedure T_frmCadCodBarras.btnConfirmaInclusaoClick(Sender: TObject);
begin

    GravarCodigoBarras;

end;

procedure T_frmCadCodBarras.FecharAbrirTabelas;
begin

   dm_Conexao.cds_CadProduto.Active := false;
   dm_Conexao.cds_CadProduto.Active := true;

   if(AlterandoCodBarrasTelaIni) then
     dm_Conexao.cds_CadProduto.Next

end;

procedure T_frmCadCodBarras.edt_CodigoProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

       if key = VK_RETURN then
       begin

           GravarCodigoBarras;

       end;

end;

procedure T_frmCadCodBarras.btnSairClick(Sender: TObject);
begin
    close;
end;

procedure T_frmCadCodBarras.edt_CodigoProdutoChange(Sender: TObject);
var
    vl_label : TLabel; //variável do tipo Label
begin
      //CENTRALIZANDO A DIGITAÇÃO DO EDIT DA SENHA
      vl_label := TLabel.Create(self); //criamos um label

      with vl_label do
      begin

          //pegamos a fonte usada no edit
          Font.Name := TEdit(sender).Font.Name;

          //pegamos o conteúdo do edit
          Caption   := TEdit(sender).Text;

         //centraliza no label e retorna para o edit
          SendMessage(TEdit(sender).Handle, EM_SETMARGINS, EC_LEFTMARGIN,
          (TEdit(sender).Width-vl_label.Width) div 2);

      end;

      vl_label.Free;

end;

procedure T_frmCadCodBarras.edt_CodigoProdutoEnter(Sender: TObject);
var
    vl_label : TLabel; //variável do tipo Label
begin
      //CENTRALIZANDO A DIGITAÇÃO DO EDIT DA SENHA
      vl_label := TLabel.Create(self); //criamos um label

      with vl_label do
      begin

          //pegamos a fonte usada no edit
          Font.Name := TEdit(sender).Font.Name;

          //pegamos o conteúdo do edit
          Caption   := TEdit(sender).Text;

         //centraliza no label e retorna para o edit
          SendMessage(TEdit(sender).Handle, EM_SETMARGINS, EC_LEFTMARGIN,
          (TEdit(sender).Width-vl_label.Width) div 2);

      end;

      vl_label.Free;        

end;

end.
