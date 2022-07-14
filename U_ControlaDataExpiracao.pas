unit U_ControlaDataExpiracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider, DateUtils, IniFiles,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, Registry,MIDASLIB, Mask,
  ToolEdit, RXDBCtrl, ComCtrls;


type
  T_frmControlaDataExpiracao = class(TForm)
    pnl_Desbloqueio: TPanel;
    grp2: TGroupBox;
    grp1: TGroupBox;
    lbl5: TLabel;
    grp3: TGroupBox;
    btn_ConfirmarContraChave: TSpeedButton;
    btnSair: TSpeedButton;
    panInfo: TPanel;
    edt_DataExpiracao: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure btn_ConfirmarContraChaveClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edt_DataExpiracaoButtonClick(Sender: TObject);
    procedure edt_DataExpiracaoChange(Sender: TObject);

    function getDataExpiracao : string;

  private
    { Private declarations }
    
  public
    { Public declarations }
  end;

var
_frmControlaDataExpiracao : T_frmControlaDataExpiracao;   

implementation

uses U_Login, U_dmDadosSegundo, U_dmPesquisas, U_BiblioSysSalao,
  U_principal;
{$R *.dfm}

procedure T_frmControlaDataExpiracao.FormCreate(Sender: TObject);
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

  edt_DataExpiracao.Date := StrToDate(getDataExpiracao);

end;

procedure T_frmControlaDataExpiracao.btn_ConfirmarContraChaveClick(Sender: TObject);
begin

       _Sql := 'update expiracao set dt_expiracao = :pExp,  dt_fim_degustacao = :pDeg where id_dia = 1';

       With DM_Pesq.Qry_Geral do
       begin

          Close;
          SQL.Clear;
          SQL.Add(_Sql);
          ParamByName('pExp').AsDateTime := edt_DataExpiracao.Date;
          ParamByName('pDeg').AsDateTime := edt_DataExpiracao.Date;
          ExecSQL;

       end;

        Arquivo := TIniFile.Create(pathFile);
        Arquivo.WriteString('data_expiracao','DATE_EXPIRACAO',DateToStr(edt_DataExpiracao.Date));
        Arquivo.WriteString('data_fim_degustacao','DATE_FIM_DEGUSTACAO',DateToStr(edt_DataExpiracao.Date));
        Arquivo.Free;

        Application.MessageBox('Data de expiração alterada com sucesso!', 'OK!', MB_OK);
        LogOperacoes(NomeDoUsuarioLogado, 'alteração de data de expiração do sistema');
        _frmPrincipal.ReiniciarComMensagemTemporizada;
        close;  

end;


procedure T_frmControlaDataExpiracao.btnSairClick(Sender: TObject);
begin

    Close;

end;

procedure T_frmControlaDataExpiracao.edt_DataExpiracaoButtonClick(
  Sender: TObject);
begin

    btn_ConfirmarContraChave.Enabled := true;
    
end;

procedure T_frmControlaDataExpiracao.edt_DataExpiracaoChange(
  Sender: TObject);
begin
btn_ConfirmarContraChave.Enabled:=true;
end;

function T_frmControlaDataExpiracao.getDataExpiracao: string;
begin

       _Sql := 'select dt_expiracao from expiracao where id_dia = 1';

       With DM_Pesq.Qry_Geral do
       begin

          Close;
          SQL.Clear;
          SQL.Add(_Sql);
          open;

       end;

       Result := DM_Pesq.Qry_Geral.Fields[0].AsString;

end;

end.

