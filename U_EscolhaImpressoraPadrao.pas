unit U_EscolhaImpressoraPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit, DateUtils;

type
  T_frmEscolhaTipoImpressora = class(TForm)
    pnl_cabecalho: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    pnl1: TPanel;
    pnl_rodape: TPanel;
    lstOpcoes: TListBox;

    //procedimentos perso
    procedure AbrirTabelas;
    procedure AbrirFecharTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lstOpcoesClick(Sender: TObject);


  private
    { Private declarations }
    tipoImpressora : string;

  public
    { Public declarations }


  end;

var
  _frmEscolhaTipoImpressora : T_frmEscolhaTipoImpressora;
  proxNumCaixa : Integer;

implementation

uses U_BiblioSysSalao, U_dmDadosSegundo, U_principal, U_dmDados,
  U_dmPesquisas;

{$R *.dfm}


procedure T_frmEscolhaTipoImpressora.FormCreate(Sender: TObject);
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

   lblDataDoDia.Caption:=  DateToStr(date);
   lblHoraAtual.Caption:=  timetoStr(time);
   AbrirTabelas;

end;

procedure T_frmEscolhaTipoImpressora.AbrirTabelas;
begin

    dm_DadosSegundo.cds_tipoimpressora.Active  := true;

end;

procedure T_frmEscolhaTipoImpressora.AbrirFecharTabelas;
begin

    dm_DadosSegundo.cds_tipoimpressora.Active  := false;
    dm_DadosSegundo.cds_tipoimpressora.Active  := true;

end;

procedure T_frmEscolhaTipoImpressora.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    _frmPrincipal.logo.Visible := true;
    Release;

end;

procedure T_frmEscolhaTipoImpressora.lstOpcoesClick(Sender: TObject);
begin

     if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'IMPRESSORA JATOTINTA' then
     begin   
           tipoImpressora := 'JATOTINTA';
           GravarEscolhaImpressora(tipoimpressora);

     end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'IMPRESSORA  MATRICIAL' then
     begin
         tipoImpressora := 'MATRICIAL';
         GravarEscolhaImpressora(tipoimpressora);

     end;

     texto:= 'Impressora padrão setada como '+tipoImpressora+' com sucesso! '#13'Você  pode  alterá-la  a  qualquer   momento  acessando'#13'o menu impressoras na tela principal.';

     Application.MessageBox(PChar(texto),'Setando impressora padrão',MB_OK);


     AbrirFecharTabelas;
     close;
end;

end.
