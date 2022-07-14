unit U_DesbloqueioPermanente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider, DateUtils, IniFiles,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, Registry,MIDASLIB;


type
  T_frmDesbloqueioPermanente = class(TForm)
    pnl_Desbloqueio: TPanel;
    grp2: TGroupBox;
    grp1: TGroupBox;
    lbl5: TLabel;
    edt_Chave: TEdit;
    grp3: TGroupBox;
    btn_ConfirmarContraChave: TSpeedButton;
    btnSair: TSpeedButton;
    panInfo: TPanel;
    lblInfo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btn_ConfirmarContraChaveClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edt_ChaveChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    DataPermanente  : TDateTime;
    procedure eventoTimerReiniciar(Sender:TObject);
    procedure ReiniciarComMensagemTemporizada;
  public
    { Public declarations }
  end;

var
_frmDesbloqueioPermanente : T_frmDesbloqueioPermanente;    

implementation

uses U_Login, U_dmDadosSegundo, U_dmPesquisas, U_BiblioSysSalao;
{$R *.dfm}

procedure T_frmDesbloqueioPermanente.FormCreate(Sender: TObject);
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

    DataPermanente := StrToDate('01/01/2500');
    CriarTimerReiniciar;    //TimerReiniciar será criado nesse procedimento
    TimerReiniciar.OnTimer:= eventoTimerReiniciar;


end;

procedure T_frmDesbloqueioPermanente.btn_ConfirmarContraChaveClick(Sender: TObject);
var
    keyPermanente  : string;
begin

    keyPermanente             :=  '170867231220080474';  //edi, vo, nane
    dm_DadosSegundo.cds_Expiracao.Open;

   if ( edt_Chave.Text = keyPermanente ) then
   begin

        //SE DIGITAR A CHAVE PERMANENTE, ABRE ACESSO PERMANENTE ATE O ANO DE 2835
        _Sql := 'update expiracao set dt_expiracao = :pExp, dt_fim_degustacao = :pDtDegust,  dt_liberacao = :pDtLib, info = :info where id_dia = 1';

         With DM_Pesq.Qry_Geral do
         begin

            Close;
            SQL.Clear;
            SQL.Add(_Sql);
            ParamByName('pExp').AsDateTime      := DataPermanente;
            ParamByName('pDtDegust').AsDateTime := DataPermanente;
            ParamByName('pDtLib').AsDateTime    := now;
            ParamByName('INFO').AsString        := 'Feito desbloqueio permanente pelo Admin.';
            ExecSQL;

         end;     

        ReiniciarComMensagemTemporizada;
        LogOperacoes(NomeDoUsuarioLogado, 'desbloqueio permanentemente efetivado pelo Sistema');
        close;

   end else begin

         Application.MessageBox('Número da Chave Incorreto, Contacte o Administrador!', 'Licença Inválida', MB_OK);
         LogOperacoes(NomeDoUsuarioLogado, 'entrada de numero de chave incorreto para desbloqueio do sistema');
         edt_Chave.Clear;
         edt_Chave.SetFocus;
         btn_ConfirmarContraChave.Enabled := false;

   end;

end;


procedure T_frmDesbloqueioPermanente.btnSairClick(Sender: TObject);
begin

    Close;

end;

procedure T_frmDesbloqueioPermanente.edt_ChaveChange(Sender: TObject);
begin

    btn_ConfirmarContraChave.Enabled := true;

end;

procedure T_frmDesbloqueioPermanente.eventoTimerReiniciar(Sender: TObject);
begin
     keybd_event(VK_RETURN,0,0,0);
     TimerReiniciar.Enabled := False;
end;

procedure T_frmDesbloqueioPermanente.ReiniciarComMensagemTemporizada;
begin

   texto := 'Desbloqueio permanentemente efetivado com sucesso, entre novamente...!';
   ReiniciarComMensagemETemporizador(TimerReiniciar,texto,'Reiniciando...',5000);

end;

procedure T_frmDesbloqueioPermanente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(TimerReiniciar);
end;

end.

