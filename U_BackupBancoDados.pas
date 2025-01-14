unit U_BackupBancoDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellApi, ExtCtrls, Buttons;

type
  T_frmBackupBanco = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    lblHoraAtual: TLabel;
    lblStatusLogoff: TLabel;
    lblDataDoDia: TLabel;
    lbl45: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    edt_origem: TEdit;
    edt_destino: TEdit;
    btnSetarPastaDestino: TButton;
    Panel2: TPanel;
    btnGravarConfs: TSpeedButton;
    btnExecutar_backup: TSpeedButton;
    btnSair: TSpeedButton;
    CaminhoDoBackup: TOpenDialog;
    procedure btnExecutar_backupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AbrirTabelas;
    procedure btnSetarPastaDestinoClick(Sender: TObject);
    procedure btnGravarConfsClick(Sender: TObject);
    procedure MostrarConfigGravada;
    procedure FormShow(Sender: TObject);
    procedure LimparPastaDeBackup;
    procedure GerarLogBackup(acesso : string);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmBackupBanco: T_frmBackupBanco;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, U_dmPesqDados;

{$R *.dfm}

procedure T_frmBackupBanco.FormCreate(Sender: TObject);
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

  lblDataDoDia.Caption           := DateToStr(date);
  lblHoraAtual.Caption           := timetoStr(time);
  lblStatusLogoff.Caption        := NomeDoUsuarioLogado;
  Caption                        := 'LOGADO POR '+NomeDoUsuarioLogado;
  AbrirTabelas;

end;


procedure T_frmBackupBanco.btnExecutar_backupClick(Sender: TObject);
var
  Origem, Destino: string;
begin

    Origem  := edt_origem.Text;
    Destino := edt_destino.Text+'SYSPDV.FDB';

    LimparPastaDeBackup; // PRIMEIRO LIMPA A PASTA E DEPOIS GRAVA O NOVO BACKUP
    {GerarLogBackup('�ltimo backup realizado: '+ DateToStr(date) + ' �s ' + TimeToStr(time) );

    if CopyFile(PChar(Origem), PChar(Destino), False) then
    begin
       ShowMessage('Backup executado com sucesso, verifique na pasta se foi adicionado o arquivo SYSPDV.FDB com data corrente!')
    end else
    begin
     //ShowMessage('#Aten��o# - Problema ao copiar o arquivo!');
    end;  }

end;


procedure T_frmBackupBanco.btnSairClick(Sender: TObject);
begin

  close;

end;

procedure T_frmBackupBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    DM_PESQDADOS.cdsPesqConfiguracoes.Active      := false;
    Release;
    
end;

procedure T_frmBackupBanco.AbrirTabelas;
begin

   DM_PESQDADOS.cdsPesqConfiguracoes.Active      := True;

end;

procedure T_frmBackupBanco.btnSetarPastaDestinoClick(Sender: TObject);
begin

     if CaminhoDoBackup.Execute then
      begin

           edt_destino.Text  :=  CaminhoDoBackup.FileName;

      end;

      //COM O EXTRACTFILEPATH O TXT MOSTRARA APENAS A PASTA E N�O O ARQUIVO
      edt_destino.Text :=  ExtractFilePath(CaminhoDoBackup.FileName);
      btnExecutar_backup.Enabled := false;
      btnGravarConfs.Enabled     := true;

end;

procedure T_frmBackupBanco.btnGravarConfsClick(Sender: TObject);
begin

    if not (edt_origem.Text = edt_destino.Text) then
    begin

           if not TabelaEstaVazia('configuracoes') then
           begin

                With DM_Pesq.Qry_Geral do
                begin

                     close;
                     sql.Clear;
                     sql.Add('UPDATE configuracoes SET config_backup_origem = :pOrigem, config_backup_destino = :pDestino');
                     Params.ParamByName('pOrigem').AsString   :=  edt_origem.Text ;
                     Params.ParamByName('pDestino').AsString  :=  edt_destino.Text ;
                     ExecSQL();

                end;

                 Application.MessageBox('Backup configurado com sucesso!', 'OK!', MB_OK);
                 LogOperacoes(NomeDoUsuarioLogado, 'alteracao na configuracao de backup');
                 btnExecutar_backup.Enabled := true;
                 btnGravarConfs.Enabled     := false;        

           end;

    end else begin

         Application.MessageBox('A pasta de destino n�o pode a mesma da origem!',
                   'Aten��o pasta inv�lida', MB_OK + MB_ICONERROR);
         edt_destino.Clear;
         exit;

    end;

end;

procedure T_frmBackupBanco.MostrarConfigGravada;
begin

       with DM_PESQDADOS.cdsPesqConfiguracoes do
       begin

         close;
         CommandText := 'SELECT config_backup_destino FROM configuracoes WHERE config_id = 1' ;
         open;

             if not IsEmpty then
             begin

                 edt_destino.Text  := DM_PESQDADOS.cdsPesqConfiguracoes.Fields[0].AsString;

             end;

       end;

end;

procedure T_frmBackupBanco.FormShow(Sender: TObject);
begin

    MostrarConfigGravada;

end;

procedure T_frmBackupBanco.LimparPastaDeBackup;
var
caminho : string;
SR: TSearchRec;
I: integer;

begin

  //APAGA TODOS OS ARQUIVOS DA PASTA DE BACKUP

  caminho := edt_destino.Text+'*.*';
  ShowMessage('pasta a ser apagada '+caminho);
  I := FindFirst(caminho, faAnyFile, SR);

  while I = 0 do
  begin

      if (SR.Attr and faDirectory) <> faDirectory then
       begin

          caminho:= ExtractFilePath(edt_destino.Text) + SR.Name;

          if not DeleteFile(caminho) then
            ShowMessage('Erro ao deletar  ' + caminho);

       end;

      I := FindNext(SR);

   end;

end;


procedure T_frmBackupBanco.GerarLogBackup(acesso: string);
var
Arq : TextFile;
begin

  AssignFile(Arq, ExtractFilePath(edt_destino.Text)+'Log backup.log');
  if not FileExists(ExtractFilePath(edt_destino.Text)+'Log backup.log') then Rewrite(arq,ExtractFilePath(edt_destino.Text)+'Log backup.log');
  Append(arq);
  Writeln(Arq, acesso);
  Writeln(Arq, '');
  CloseFile(Arq);

end;

end.
