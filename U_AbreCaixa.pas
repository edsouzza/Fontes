unit U_AbreCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit;

type
  T_frmAbreCaixa = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    btn_Sair: TSpeedButton;
    pnl_DadosUsuario: TPanel;
    btn_Gravar: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    pnl1: TPanel;
    lbl2: TLabel;
    edt_valordeabertura: TEdit;
    procedure btn_SairClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure AbrirFecharTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure AtualizaCaixa;
    procedure GravaAberturaDoCaixa;
    procedure edt_valordeaberturaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_valordeaberturaClick(Sender: TObject);
    procedure btn_GravarClick(Sender: TObject);
    procedure edt_valordeaberturaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    { Private declarations }


  public
    { Public declarations }


  end;

var
  _frmAbreCaixa : T_frmAbreCaixa;
  proxNumCaixa : Integer;

implementation

uses U_BiblioSysSalao, U_dmDadosSegundo, U_principal, U_dmDados,
  U_dmPesquisas;

{$R *.dfm}


procedure T_frmAbreCaixa.FormCreate(Sender: TObject);
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

   lblDataDoDia.Caption:=  DateToStr(date);
   lblHoraAtual.Caption:=  timetoStr(time);

   AbrirTabelas;

end;


procedure T_frmAbreCaixa.AbrirTabelas;
begin

    dm_Conexao.cds_Caixa.Active      := True;
    dm_Conexao.cds_AbreCaixa.Active  := True;

end;


procedure T_frmAbreCaixa.FecharTabelas;
begin

    dm_Conexao.cds_Caixa.Active       := False;
    dm_Conexao.cds_AbreCaixa.Active   := False;

end;


procedure T_frmAbreCaixa.AbrirFecharTabelas;
begin

    dm_Conexao.cds_Caixa.Active      := False;
    dm_Conexao.cds_Caixa.Active      := True;

    dm_Conexao.cds_AbreCaixa.Active  := False;
    dm_Conexao.cds_AbreCaixa.Active  := True;

end;


procedure T_frmAbreCaixa.btn_SairClick(Sender: TObject);
begin

     texto:= 'Confirma o desejo de sair sem abrir o caixa?';

     if Application.MessageBox(PChar(texto),'Sair!',MB_YESNO + MB_ICONQUESTION) = IdYes then
     begin

         close;

     end
     else Exit;

end;


procedure T_frmAbreCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Release;

end;

procedure T_frmAbreCaixa.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmAbreCaixa.edt_valordeaberturaKeyPress(Sender: TObject;
  var Key: Char);
begin

    btn_Gravar.Enabled    := True;

    // PARA DBEDIT ACEITAR APENAS NUMEROS
    If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

    

end;

procedure T_frmAbreCaixa.edt_valordeaberturaClick(Sender: TObject);
begin

     edt_valordeabertura.SelStart := 0;
     edt_valordeabertura.SelLength:= Length(edt_valordeabertura.Text);

end;

procedure T_frmAbreCaixa.btn_GravarClick(Sender: TObject);
begin

    AtualizaCaixa;
    GravaAberturaDoCaixa;
    AbrirFecharTabelas;
    btn_Gravar.Enabled   := False;

end;

procedure T_frmAbreCaixa.AtualizaCaixa;
begin

           // ATUALIZANDO O CAIXA
           With DM_Pesq.qry_Cod do begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_caixa) from caixa');
              Open;

              if not IsEmpty then begin

                 proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;


            with  dm_Conexao.cds_Caixa do begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNum;
                FieldByName('id_venda').AsInteger        := 0;
                FieldByName('saldo_anterior').AsFloat    := StrToFloat(edt_ValorDeAbertura.Text); //aqui entra o valor de saldo do dia anterior
                FieldByName('valor_movimento').AsFloat   := 0;
                FieldByName('saldo_atual').AsFloat       := StrToFloat(edt_ValorDeAbertura.Text);
                FieldByName('data').AsDateTime           := date;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := 'ABERTURA DO CAIXA';
                ApplyUpdates(0);

            end;


            Application.MessageBox('Bem Vindo, o caixa do dia foi aberto com Sucesso!',
                'Abertura do Caixa do Dia', MB_OK + MB_ICONWARNING);
            close;

            CaixaAberto := true;

            AbrirFecharTabelas;


end;


procedure T_frmAbreCaixa.GravaAberturaDoCaixa;
begin

         // GRAVANDO A ABERTURA DO CAIXA

           With DM_Pesq.qry_Cod do begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_abrecaixa) from abrecaixa');
              Open;

              if not IsEmpty then begin

                 proxNumCaixa := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;


            with  dm_Conexao.cds_AbreCaixa do begin

                Append;

                FieldByName('id_abrecaixa').AsInteger    := proxNumCaixa;
                FieldByName('valor_abertura').AsFloat    := StrToFloat(edt_ValorDeAbertura.Text);
                FieldByName('data_abertura').AsDateTime  := date;
                FieldByName('hora_abertura').AsString    := TimeToStr(time);
                FieldByName('id_funcionario').AsInteger  := 1;

                ApplyUpdates(0);

            end;


            AbrirFecharTabelas;

end;

procedure T_frmAbreCaixa.edt_valordeaberturaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if key = 13 then
     begin

         btn_GravarClick(Self);

     end;

end;

end.
