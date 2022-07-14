unit U_EntraCPFCNPJVendaBalcao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls;

type
  T_frmEntraCPFCNPJ = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl_DadosUsuario: TPanel;
    grp_CadastrarSenha: TGroupBox;
    msk_cpf: TMaskEdit;
    msk_cnpj: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNomeCliente: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure AlterarCPF_CNPJClienteBalcao;
    procedure msk_cnpjKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cpfChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNomeClienteExit(Sender: TObject);

  private

  public
    { Public declarations }

  end;

var
  _frmEntraCPFCNPJ: T_frmEntraCPFCNPJ;

implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo, U_Caixa,
  SqlExpr, DB, DBClient;


{$R *.dfm}


procedure T_frmEntraCPFCNPJ.FormCreate(Sender: TObject);
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

procedure T_frmEntraCPFCNPJ.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Application.CreateForm(T_frmCaixa, _frmCaixa);
    _frmCaixa.ShowModal;
    FreeAndNil(_frmCaixa);
    
    Close;
    Release;

end;

procedure T_frmEntraCPFCNPJ.FormKeyPress(Sender: TObject; var Key: Char);
begin

  // Enter por Tab
  //verifica se a tecla pressionada é a tecla ENTER, conhecida pelo Delphi como #13
  If key = #13 then
  Begin

    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);

  end;
end;

procedure T_frmEntraCPFCNPJ.AlterarCPF_CNPJClienteBalcao;
begin

    with DM_Pesq.Qry_Auxiliar do
    begin

        close;
        sql.Clear;
        sql.Add('UPDATE clientes SET cli_nome = :pNome, cli_cpf = :pCPF, cli_cnpj = :pCNPJ WHERE cli_id = 1');
        Params.ParamByName('pNome').AsString := sNomeClienteVenda;
        Params.ParamByName('pCPF').AsString  := cpf;
        Params.ParamByName('pCNPJ').AsString := cnpj;
        ExecSQL();

    end;

end;

procedure T_frmEntraCPFCNPJ.msk_cnpjKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

      if key =  13 then
      begin
         sNomeClienteVenda := UpperCase(edtNomeCliente.Text);
         cpf               :=  msk_cpf.Text;
         cnpj              :=  msk_cnpj.Text;
         AlterarCPF_CNPJClienteBalcao;
         close;

      end;

end;

procedure T_frmEntraCPFCNPJ.msk_cpfChange(Sender: TObject);
begin
    if Length(Trim(msk_cpf.Text)) = 14 then  msk_cnpj.setfocus;
end;

procedure T_frmEntraCPFCNPJ.FormShow(Sender: TObject);
begin
    edtNomeCliente.SetFocus;
end;     


procedure T_frmEntraCPFCNPJ.edtNomeClienteExit(Sender: TObject);
begin
    if(edtNomeCliente.Text = '')then
    begin
        edtNomeCliente.Text := 'VENDA BALCAO';
    end;
end;

end.


