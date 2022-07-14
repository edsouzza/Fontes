unit U_ESCOLHAPARAVIDEO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, idhttp, Grids, DBGrids, Mask, DBCtrls,
  MPlayer, OleCtrls, ShellAPI;

type
  TF_ESCOLHAPARAVIDEO = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    Panel1: TPanel;
    btnVideoClientes: TSpeedButton;
    btnVideoContatos: TSpeedButton;
    btnVideoMovCaixa: TSpeedButton;
    btnVideoFuncionarios: TSpeedButton;
    btnVideoOrcamentos: TSpeedButton;
    btnVideoSair: TSpeedButton;
    btnVideoAuditoria: TSpeedButton;
    btnVideoBackup: TSpeedButton;
    btnVideoConsFinanceiro: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnVideoClientesClick(Sender: TObject);
    procedure btnVideoFuncionariosClick(Sender: TObject);
    procedure btnVideoMovCaixaClick(Sender: TObject);
    procedure btnVideoOrcamentosClick(Sender: TObject);
    procedure btnVideoConsFinanceiroClick(Sender: TObject);
    procedure btnVideoAuditoriaClick(Sender: TObject);
    procedure btnVideoContatosClick(Sender: TObject);
    procedure btnVideoBackupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVideoSairClick(Sender: TObject);
  private
    { Private declarations }
    procedure abrirVideo;

  public

  end;

var
  F_ESCOLHAPARAVIDEO: TF_ESCOLHAPARAVIDEO;
  pathVideo, nomeTela : string;

implementation

uses U_ExecutaVideos, U_principal, U_BiblioSysSalao;


{$R *.dfm}

procedure TF_ESCOLHAPARAVIDEO.FormCreate(Sender: TObject);
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

  pathVideo := '';

end;

procedure TF_ESCOLHAPARAVIDEO.FormShow(Sender: TObject);
begin

      {DUAS FORMAS DE EXECUTAR UM SITE PELA SUA URL
     1->
          ShellExecute(Handle, 'open', pathVideo, nil, nil, SW_SHOWMAXIMIZED);

     2->  Crie um formulario com o componente TWebBrowser [F_VIDEO] e indique a URL -> BROWSER.Navigate('https://www.youtube.com/watch?v=FIHOTMcrJuo&t=258s');
     }

end;

procedure TF_ESCOLHAPARAVIDEO.btnVideoClientesClick(Sender: TObject);
begin

      nomeTela    := 'GERENCIAMENTO DE CLIENTES';
      pathVideo   := 'https://www.youtube.com/watch?v=6fBzlCxv-Cw';
      abrirVideo;

end;

procedure TF_ESCOLHAPARAVIDEO.btnVideoFuncionariosClick(Sender: TObject);
begin

     nomeTela    := 'GERENCIAMENTO DE FUNCIONARIOS';
     pathVideo   := 'https://www.youtube.com/watch?v=FIHOTMcrJuo&t=258s';
     abrirVideo;

end;

procedure TF_ESCOLHAPARAVIDEO.btnVideoMovCaixaClick(Sender: TObject);
begin

     nomeTela    := 'GERENCIAMENTO MOVIMENTACAO DE CAIXA';
     pathVideo   := 'https://www.youtube.com/watch?v=iaHm8OwWvLE&t=67s';
     abrirVideo;

end;

procedure TF_ESCOLHAPARAVIDEO.btnVideoOrcamentosClick(Sender: TObject);
begin

    nomeTela      := 'GERENCIAMENTO DE ORÇAMENTOS';
    pathVideo     := 'https://www.youtube.com/watch?v=dcJgEJkpzx0';
    abrirVideo;

end;

procedure TF_ESCOLHAPARAVIDEO.btnVideoConsFinanceiroClick(Sender: TObject);
begin

    nomeTela     := 'CONSULTANDO FINANCEIRO';
    pathVideo    := 'https://www.youtube.com/watch?v=iow1LQ4I9Z8';
    abrirVideo;

end;

procedure TF_ESCOLHAPARAVIDEO.btnVideoAuditoriaClick(Sender: TObject);
begin

     nomeTela     := 'AUDITORIA DE ACESSOS';
     pathVideo    := 'https://www.youtube.com/watch?v=lrRAGk4ZAfQ';
     abrirVideo;

end;

procedure TF_ESCOLHAPARAVIDEO.btnVideoContatosClick(Sender: TObject);
begin

    nomeTela     := 'GERENCIAMENTO DE CONTATOS';
    pathVideo    := 'https://www.youtube.com/watch?v=ngCFvqOAuUo';
    abrirVideo;

end;

procedure TF_ESCOLHAPARAVIDEO.btnVideoBackupClick(Sender: TObject);
begin

    nomeTela     := 'BACKUP E SEGURANÇA';
    pathVideo    := 'https://www.youtube.com/watch?v=3OJR4bM1njc';
    abrirVideo;

end;

procedure TF_ESCOLHAPARAVIDEO.abrirVideo;
begin

     //ABRINDO O FORMULARIO COM O TWebBrowser

     Application.CreateForm(T_frmVideos,  _frmVideos);
     _frmVideos.ShowModal;
     FreeAndNil(_frmVideos);       

end;


procedure TF_ESCOLHAPARAVIDEO.btnVideoSairClick(Sender: TObject);
begin

     _frmPrincipal.logo.Visible := true;
     close;
     Release;

end;

end.
