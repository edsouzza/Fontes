unit U_AlteraFotoDoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls,
  ExtDlgs, Inifiles;

type
  T_frmAlteraFotoDosProdutos = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    abrefoto: TOpenPictureDialog;
    pangrid_visualizacao: TPanel;
    grid_VisualizaProdutos: TDBGrid;
    edt_CodBarrasDoProduto: TDBEdit;
    GroupBox8: TGroupBox;
    img_MostraProdutoParaAlteracao: TImage;
    GroupBox9: TGroupBox;
    edtConsProduto: TEdit;
    GroupBox1: TGroupBox;
    btnAlterarFotoProduto: TSpeedButton;
    txtInformacao: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure AlterarFoto;
    procedure btnAlterarFotoProdutoClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure MostraProduto;
    procedure MostrarFotoPadrao;
    procedure PesquisarProdutoPorNome;
    procedure grid_VisualizaProdutosCellClick(Column: TColumn);
    procedure edtConsProdutoChange(Sender: TObject);
    procedure edtConsProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  _frmAlteraFotoDosProdutos: T_frmAlteraFotoDosProdutos;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, DB, U_principal, U_dmDadosSegundo;

{$R *.dfm}



procedure T_frmAlteraFotoDosProdutos.FormCreate(Sender: TObject);
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

procedure T_frmAlteraFotoDosProdutos.FormShow(Sender: TObject);
begin

    AbrirTabelas;
    abrefoto.InitialDir :=  ExtractFilePath(Application.ExeName)+'fotos';
    MostraProduto;

end;

procedure T_frmAlteraFotoDosProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      FecharTabelas;
      close;
      Release;
end;


procedure T_frmAlteraFotoDosProdutos.AlterarFoto;
var
  NomeDoArqDaFoto, NovoNomeArqDaFoto, FotoProduto : string;
begin

   FotoProduto := ExtractFilePath(Application.ExeName) + 'Fotos\'+edt_CodBarrasDoProduto.Text+'.jpg';

   //if FileExists( dm_DadosSegundo.cds_ConfigFOTOS.AsString+'\'+edt_CodBarrasDoProduto.Text+'.jpg' ) then
 {  if FileExists( FotoProduto ) then
   begin

      Application.MessageBox('Este produto encontra-se com a foto cadastrada no diretório de fotos, verifique!', 'Informação do Sistema', MB_OK);
      exit;

   end else
   begin
   }
     if ( abrefoto.Execute ) then
     begin

           NomeDoArqDaFoto     :=  abrefoto.FileName;
           NovoNomeArqDaFoto   :=  edt_CodBarrasDoProduto.Text;

           //renomeia o nome da foto para o codigo do produto
           RenameFile(NomeDoArqDaFoto, NovoNomeArqDaFoto+'.jpg');

     end;

      Application.MessageBox('A foto do produto foi alterada com sucesso!', 'Informação do Sistema', MB_OK);
      LogOperacoes(NomeDoUsuarioLogado, 'alterado de foto de produto');
      dm_Conexao.cds_CadProduto.Next;
      btnAlterarFotoProduto.Enabled := false;

   //end;

end;


procedure T_frmAlteraFotoDosProdutos.pnl_rodapeClick(Sender: TObject);
begin

   edtConsProduto.Clear;
   close;

end;

procedure T_frmAlteraFotoDosProdutos.btnAlterarFotoProdutoClick(
  Sender: TObject);
begin

   AlterarFoto;

end;

procedure T_frmAlteraFotoDosProdutos.AbrirTabelas;
begin

     dm_Conexao.cds_CadProduto.Active               := True; 
     DM_Pesq.cdsPesqProduto.Active                  := True;
     dm_DadosSegundo.cds_Config.Active              := True;

end;

procedure T_frmAlteraFotoDosProdutos.FecharTabelas;
begin

     dm_Conexao.cds_CadProduto.Active               := False;
     DM_Pesq.cdsPesqProduto.Active                  := False;
     dm_DadosSegundo.cds_Config.Active              := False;

end;


procedure T_frmAlteraFotoDosProdutos.FecharAbrirTabelas;
begin

     DM_Pesq.cdsPesqProduto.Active                  := False;
     DM_Pesq.cdsPesqProduto.Active                  := True;

     dm_Conexao.cds_CadProduto.Active               := false;
     dm_Conexao.cds_CadProduto.Active               := True;

     dm_DadosSegundo.cds_Config.Active              := False;
     dm_DadosSegundo.cds_Config.Active              := True;

end;

procedure T_frmAlteraFotoDosProdutos.MostrarFotoPadrao;
var
  config  : TIniFile;
  pathImgPadrao : string;
begin

      //fazendo a leitura das imagens padrao do formulario

      //se o arquivo config.ini existir leia-o
      config  := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'configuracoes.ini');

     if FileExists(ExtractFilePath(Application.ExeName)+ 'configuracoes.ini') then
     begin

            pathImgPadrao   := config.ReadString('caminho_das_imgs','IMGPADRAO','');

            if FileExists(pathImgPadrao) then
            begin
                  //verifica se a imagem da tela principal existe
                  img_MostraProdutoParaAlteracao.Picture.LoadFromFile(pathImgPadrao);
                  img_MostraProdutoParaAlteracao.Transparent := true;

            end else begin

                  texto:= 'A Imagem '+pathImgPadrao+', correspondente á imagem padrão não foi encontrada!';
                  Application.MessageBox(PChar(texto),'Imagem não encontrada!',MB_OK + MB_SYSTEMMODAL);

            end;

            config.Free;

     end;

end;



procedure T_frmAlteraFotoDosProdutos.grid_VisualizaProdutosCellClick(
  Column: TColumn);
begin

     MostraProduto;
     btnAlterarFotoProduto.Enabled := true;

end;

procedure T_frmAlteraFotoDosProdutos.MostraProduto;
begin

     FotoDoProduto := ExtractFilePath(Application.ExeName)+'Fotos\'+edt_CodBarrasDoProduto.Text+'.jpg';
     //ShowMessage(FotoDoProduto);

     if FileExists(FotoDoProduto) then
     begin
          img_MostraProdutoParaAlteracao.Picture.LoadFromFile(FotoDoProduto)
      end else
          MostrarFotoPadrao;
          edtConsProduto.SetFocus;

end;



procedure T_frmAlteraFotoDosProdutos.PesquisarProdutoPorNome;
var
  nome : string;
begin

      nome := edtConsProduto.Text;

      _Sql  := 'SELECT * FROM produtos WHERE DESCRICAO LIKE (''%'+nome+'%'') AND id_produto > 1 '+
               'AND status = '+QuotedStr('A')+' ORDER BY COD_ALT1';

      with dm_Conexao.cds_CadProduto do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

            if not IsEmpty then
            begin

                MostraProduto;

            end;

      end;

end;

procedure T_frmAlteraFotoDosProdutos.edtConsProdutoChange(Sender: TObject);
begin

     PesquisarProdutoPorNome;

end;

procedure T_frmAlteraFotoDosProdutos.edtConsProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

      if KEY = VK_RETURN then
      begin

          edtConsProduto.Clear;

      end;


end;

procedure T_frmAlteraFotoDosProdutos.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

      //se deslocando com as setinhas dentro do grid
      
      if  (KEY=38) then
      begin
          dm_Conexao.cds_CadProduto.Prior;
          MostraProduto;
      end;

      if  (KEY=40) then
      begin
           dm_Conexao.cds_CadProduto.next;
           MostraProduto;
      end;

end;

end.
