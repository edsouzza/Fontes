unit U_EscolhaTipoDeAgendamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  T_frmEscolhaTipoDeAgendamento = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    chkClientes: TCheckBox;
    chkNaoClientes: TCheckBox;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure chkClientesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkNaoClientesClick(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmEscolhaTipoDeAgendamento: T_frmEscolhaTipoDeAgendamento;

implementation

uses U_Balancete, U_Financeiro, U_BiblioSysSalao, U_AgendamentoNaoClientes,
  U_Agendamentos, U_dmDados;

{$R *.dfm}

procedure T_frmEscolhaTipoDeAgendamento.FormCreate(Sender: TObject);
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


    //Recebe a data atual por padrão

    lblDataDoDia.Caption    :=  DateToStr(now);
    lblHoraAtual.Caption    :=  timetoStr(time);

end;

procedure T_frmEscolhaTipoDeAgendamento.chkClientesClick(Sender: TObject);
begin

      dm_Conexao.cds_DadosClientes.Active := true;

      if chkClientes.Checked then
      begin

        if dm_Conexao.cds_DadosClientes.RecordCount = 0 then
        begin

              Application.MessageBox('Seja Bem Vindo é necessário ter clientes préviamente cadastrados para continuar!',
             'Atenção', MB_OK + MB_ICONWARNING);
             close;

          end else begin

              Application.CreateForm(T_frmAgendamentos, _frmAgendamentos);
              _frmAgendamentos.ShowModal;
              FreeAndNil(_frmAgendamentos);

              chkClientes.Checked    := False;
              chkNaoClientes.Checked := False;

              Close;
              Release;
         end;
     end;
end;

procedure T_frmEscolhaTipoDeAgendamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

     Close;
     Release;

end;

procedure T_frmEscolhaTipoDeAgendamento.chkNaoClientesClick(Sender: TObject);
begin

      if chkNaoClientes.Checked then
      begin

        Application.CreateForm(T_frmAgendamentosNaoClientes, _frmAgendamentosNaoClientes);
        _frmAgendamentosNaoClientes.ShowModal;
        FreeAndNil(_frmAgendamentosNaoClientes);

        chkNaoClientes.Checked  := False;
        chkClientes.Checked     := False;

        Close;
        Release;

      end;


end;

procedure T_frmEscolhaTipoDeAgendamento.pnl_rodapeClick(Sender: TObject);
begin
    close;
end;

end.
