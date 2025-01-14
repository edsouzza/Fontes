unit U_Config;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Mask, Buttons, ImgList, Menus,
  ExtDlgs, ShlObj, ShellApi ;

type
  T_frmConfig = class(TForm)
    Panel1: TPanel;
    PanGrid: TPanel;
    PanProcura: TPanel;
    BitBtn10: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox1: TGroupBox;
    DBEdit7: TDBEdit;
    btnCaminhoDasFotos: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    edit_aux: TEdit;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCaminhoDasFotosClick(Sender: TObject);
    function  EscolhePastaDasFotos(const Title: string; const Flag: integer): string;
    procedure DesabilitaEdits;
    procedure GravaFormaPagto;
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmConfig: T_frmConfig;

implementation

uses U_dmDadosSegundo, U_Caixa, U_dmDados, U_dmPesquisas, U_BiblioSysSalao;

{$R *.dfm}

procedure T_frmConfig.FormCreate(Sender: TObject);
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


function T_frmConfig.EscolhePastaDasFotos(const Title: string;
  const Flag: integer): string;
var
  lpItemID    : PItemIDList;
  BrowseInfo  : TBrowseInfo;
  DisplayName : array[0..MAX_PATH] of char;
  TempPath    : array[0..MAX_PATH] of char;
begin

  {COM ESTA FUN��O UTILIZANDO O OPENDIALOG VOCE PODE ENTRAR COM UM DIRETORIO
  EM UM EDIT AO INVES DE UM NOME DE ARQUIVO}

  Result:='';
  FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);

  with BrowseInfo do begin

    hwndOwner := Application.Handle;
    pszDisplayName := @DisplayName;
    lpszTitle := PChar(Title);
    ulFlags := Flag;

  end;

  lpItemID := SHBrowseForFolder(BrowseInfo);

  if lpItemId <> nil then begin

    SHGetPathFromIDList(lpItemID, TempPath);
    Result := TempPath;
    GlobalFreePtr(lpItemID);

  end;

   { Exemplo:  BrowseDialog(Titulo,Flag);
  Flags:
  BIF_RETURNONLYFSDIRS   = Mostra pastas
  BIF_BROWSEINCLUDEFILES = Mostra pastas e arquivos
  BIF_BROWSEFORCOMPUTER  = Mostra Computadores
  BIF_BROWSEFORPRINTER   = Mostra Impressoras
  }

end;

procedure T_frmConfig.BitBtn4Click(Sender: TObject);
begin

   if ( dm_DadosSegundo.cds_Config.RecordCount = 0 ) OR ( dm_DadosSegundo.cds_ConfigP1.Value = '' )  then
   begin

       Application.MessageBox('Configure a pasta de fotos e os tipos de pagamento para prosseguir !','Informa��o do Sistema',Mb_IconInformation);
       exit;

   end else begin

      edit_aux.Visible := true;
      edit_aux.SetFocus;
      GravaFormaPagto;      //apenas abrindo um registro vazio
      dm_DadosSegundo.cds_Config.ApplyUpdates(0);
      Application.MessageBox('Configura��es efetuadas com sucesso!','Informa��o do Sistema',Mb_IconInformation);
      LogOperacoes(NomeDoUsuarioLogado, 'Altera��o nas configura��es do sistema, na tela de confi');
      Close;

   end;

end;

procedure T_frmConfig.GravaFormaPagto;
begin

        With DM_Pesq.qry_Cod do begin

          Close;
          SQL.Clear;
          SQL.Add('select max(forma_id) from formapagto');
          Open;

              if not IsEmpty then begin

                 proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

         end;


          with dm_Conexao.cds_FormaPagtos do
          begin

               Append;
               FieldByName('forma_id').AsInteger  := proxNum;

          end;

end;


procedure T_frmConfig.BitBtn10Click(Sender: TObject);
begin

   if dm_DadosSegundo.cds_Config.RecordCount = 0 then
   begin

       Application.MessageBox('Configure a pasta de fotos e os tipos de pagamento para prosseguir !','Informa��o do Sistema',Mb_IconInformation);
       exit;

   end else begin

	   close;

   end;

end;

procedure T_frmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin

	release;

end;

procedure T_frmConfig.FormActivate(Sender: TObject);
begin

	dm_DadosSegundo.cds_Config.Active := True;

end;


procedure T_frmConfig.btnCaminhoDasFotosClick(Sender: TObject);
begin

    dm_DadosSegundo.cds_Config.Edit;
    dbedit7.Text := EscolhePastaDasFotos('Selecione o diret�rio das fotos',BIF_RETURNONLYFSDIRS);

end;


procedure T_frmConfig.DesabilitaEdits;
begin

     if dbedit1.Text <> '' then begin
      dbedit1.Enabled := false
    end;

    if dbedit2.Text <> '' then begin
      dbedit2.Enabled := false
    end;

    if dbedit3.Text <> '' then begin
      dbedit3.Enabled := false
    end;

    if dbedit4.Text <> '' then begin
      dbedit4.Enabled := false
    end;

    if dbedit5.Text <> '' then begin
      dbedit5.Enabled := false
    end;


end;


procedure T_frmConfig.DBEdit1Exit(Sender: TObject);
begin

    GravaFormaPagto;

    with dm_Conexao.cds_FormaPagtos do
    begin

        edit;
        FieldByName('forma_descricao').AsString  := DBEdit1.Text;
        ApplyUpdates(0);

    end;

end;

procedure T_frmConfig.FormKeyPress(Sender: TObject; var Key: Char);
begin

    // Enter por Tab
    //verifica se a tecla pressionada � a tecla ENTER, conhecida pelo Delphi como #13
    If key = #13 then
    Begin
    //se for, passa o foco para o pr�ximo campo, zerando o valor da vari�vel Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
    end;

end;

procedure T_frmConfig.DBEdit7Exit(Sender: TObject);
begin

    //grava o caminho das fotos ao sair do edit
    dm_DadosSegundo.cds_Config.ApplyUpdates(0);

end;

procedure T_frmConfig.DBEdit2Exit(Sender: TObject);
begin

    GravaFormaPagto;

    with dm_Conexao.cds_FormaPagtos do
    begin

        edit;
        FieldByName('forma_descricao').AsString  := DBEdit2.Text;
        ApplyUpdates(0);

    end;

end;

procedure T_frmConfig.FormShow(Sender: TObject);
begin
    DesabilitaEdits;
end;

procedure T_frmConfig.DBEdit3Exit(Sender: TObject);
begin

    GravaFormaPagto;

    with dm_Conexao.cds_FormaPagtos do
    begin

        edit;
        FieldByName('forma_descricao').AsString  := DBEdit3.Text;
        ApplyUpdates(0);

    end;

end;

procedure T_frmConfig.DBEdit4Exit(Sender: TObject);
begin

    GravaFormaPagto;

    with dm_Conexao.cds_FormaPagtos do
    begin

        edit;
        FieldByName('forma_descricao').AsString  := DBEdit4.Text;
        ApplyUpdates(0);

    end;

end;

procedure T_frmConfig.DBEdit5Exit(Sender: TObject);
begin

    GravaFormaPagto;

    with dm_Conexao.cds_FormaPagtos do
    begin

        edit;
        FieldByName('forma_descricao').AsString  := DBEdit5.Text;
        ApplyUpdates(0);

    end;

end;

procedure T_frmConfig.DBEdit1Change(Sender: TObject);
begin

    DBEdit2.Enabled := true;
    DBEdit3.Enabled := true;
    DBEdit4.Enabled := true;
    DBEdit5.Enabled := true;


end;

end.


