unit U_CadClientesParaOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask, ExtCtrls, ToolEdit;

type
  T_frmCadastraClientesParaOrcamento = class(TForm)
    PanGrid_CadClientes: TPanel;
    grp3: TGroupBox;
    lbl54: TLabel;
    lbl55: TLabel;
    lbl56: TLabel;
    lbl57: TLabel;
    lbl60: TLabel;
    lbl61: TLabel;
    lbl62: TLabel;
    msk_CepCliente: TMaskEdit;
    edt_NomeCliente: TEdit;
    edt_ApelidoCliente: TEdit;
    edt_EndCliente: TEdit;
    edt_ComplementoCliente: TEdit;
    edt_EmailCliente: TEdit;
    grp6: TGroupBox;
    btnCadastraCliente: TSpeedButton;
    btnRetornaCadCliente: TSpeedButton;
    btnCancelaCadCliente: TSpeedButton;
    msk_DataNasctoCliente: TDateEdit;
    lblFones: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    msk_Fone: TMaskEdit;
    msk_Fone2: TMaskEdit;
    edt_DDDFONE: TEdit;
    edt_DDDFONE2: TEdit;
    msk_Fone3: TMaskEdit;
    edt_DDDFONE3: TEdit;
    edt_DDDFONE4: TEdit;
    rdCPF: TRadioButton;
    rdCNPJ: TRadioButton;
    msk_cpf: TMaskEdit;
    msk_cnpj: TMaskEdit;
    msk_Fone4: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure GravarRegistro;
    procedure LimparCampos;
    procedure btnCancelaCadClienteClick(Sender: TObject);
    procedure btnRetornaCadClienteClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCadastraClienteClick(Sender: TObject);
    procedure edt_ApelidoClienteEnter(Sender: TObject);
    procedure edt_NomeClienteExit(Sender: TObject);
    procedure rdCNPJClick(Sender: TObject);
    procedure rdCPFClick(Sender: TObject);
    procedure msk_CepClienteChange(Sender: TObject);
    procedure msk_cpfChange(Sender: TObject);
    procedure msk_cnpjChange(Sender: TObject);
    procedure msk_FoneChange(Sender: TObject);
    procedure msk_Fone2Change(Sender: TObject);
    procedure msk_Fone3Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    dataDia, hora : string;
  public
    { Public declarations }
  end;

var
  _frmCadastraClientesParaOrcamento: T_frmCadastraClientesParaOrcamento;

implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_orcamento;

{$R *.dfm}

procedure T_frmCadastraClientesParaOrcamento.FormCreate(Sender: TObject);
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

procedure T_frmCadastraClientesParaOrcamento.GravarRegistro;
begin

    dataDia := DateToStr(date);
    hora    := TimeToStr(time);

    // Incrementando o cli_id da tabela clientes
     With DM_Pesq.qry_Cod do begin

        Close;
        SQL.Clear;
        SQL.Add('select max(cli_id) from Clientes');
        Open;

        if not IsEmpty then
        begin

           proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger+1;

        end;

      end;

     dm_Conexao.cds_DadosClientes.Active := false;
     dm_Conexao.cds_DadosClientes.Active := true;

     // Formatando a Data para a gravação
     DateSeparator := '/';
     ShortDateFormat := 'dd/mm/yyyy';

     // Abrindo um registro novo e gravando no bd
     with dm_Conexao.cds_DadosClientes do begin

        Append;

        // Para o código eu usei a variavel proxNum usada na consulta acima
        FieldByName('cli_id').AsInteger              := proxNum;
        FieldByname('cli_nome').AsString             := edt_NomeCliente.Text;
        FieldByname('cli_apelido').AsString          := edt_ApelidoCliente.Text;
        FieldByname('cli_endereco').AsString         := edt_EndCliente.Text;
        FieldByname('cli_complemento').AsString      := edt_ComplementoCliente.Text;
        FieldByname('cli_cep').AsString              := msk_CepCliente.Text;
        FieldByname('cli_cpf').AsString              := msk_cpf.Text;
        FieldByname('cli_cnpj').AsString             := msk_cnpj.Text;
        FieldByname('cli_ie').AsString               := EmptyStr;
        FieldByname('cli_dddfone').AsString          := edt_DDDFONE.Text;
        FieldByname('cli_fone').AsString             := msk_Fone.Text;
        FieldByname('cli_dddfone2').AsString         := edt_DDDFONE2.Text;
        FieldByname('cli_fone2').AsString            := msk_Fone2.Text;
        FieldByname('cli_dddfone3').AsString         := edt_DDDFONE3.Text;
        FieldByname('cli_fone3').AsString            := msk_Fone3.Text;
        FieldByname('cli_dddfone4').AsString         := edt_DDDFONE4.Text;
        FieldByname('cli_fone4').AsString            := msk_Fone4.Text;
        FieldByname('cli_email').AsString            := edt_EmailCliente.Text;

        //PARA ACEITAR DATA VAZIA AO CADASTRAR
        if not (msk_DataNasctoCliente.Text = '  /  /    ') then
              FieldByName('cli_datanascto').AsDateTime  := StrToDate(msk_DataNasctoCliente.Text)
        else
              FieldByName('cli_datanascto').Clear;

        FieldByname('cli_datacad').AsString          := dateToStr(now);
        FieldByname('cli_status').AsString           := 'A';
        FieldByname('cli_historico').AsString        := dataDia + ' ' + hora + ' ..: CADASTRO INICIAL';
        FieldByname('cli_obs').AsString              := EmptyStr;
        ApplyUpdates(0);

     end;


     Application.MessageBox('O cliente foi cadastrado com sucesso, prossiga com a orçamento!',
              'Cliente cadastrado...', MB_OK);
     LogOperacoes(NomeDoUsuarioLogado, 'cadastro de novo cliente para orçamento');
   
    close;
    release;

end;

procedure T_frmCadastraClientesParaOrcamento.LimparCampos;
var
  i : Integer;
begin

      //Limpando os Edits e Masks
      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TEdit)then
              (Components[i] as TEdit).Clear;
      end;

      msk_CepCliente.Text := '#####-###;1;_';
      msk_DataNasctoCliente.Clear;
      msk_Fone.Text:= '####-####;1;_';
      msk_Fone2.Text:= '####-####;1;_';
      msk_Fone3.Text:= '####-####;1;_';
      msk_Fone4.Text:= '####-####;1;_';
      msk_cpf.Text      := '###.###.###-##;1;_';
      msk_cnpj.text     := '###.###.###/####-##;1;_';
      edt_DDDFONE.Text  := '011';
      edt_DDDFONE2.Text := '011';
      edt_DDDFONE3.Text := '011';
      edt_DDDFONE4.Text := '011';
      rdCNPJ.Enabled    := true;
      rdCPF.Enabled     := true;
      msk_cpf.Enabled   := false;
      msk_cnpj.Enabled  := false;
      edt_NomeCliente.SetFocus;

end;



procedure T_frmCadastraClientesParaOrcamento.btnCancelaCadClienteClick(
  Sender: TObject);
begin

     dm_Conexao.cds_DadosClientes.Cancel;

     btnCadastraCliente.Enabled   := false;
     btnCancelaCadCliente.Enabled := false;
     LimparCampos;

end;

procedure T_frmCadastraClientesParaOrcamento.btnRetornaCadClienteClick(
  Sender: TObject);
begin

    close;

end;

procedure T_frmCadastraClientesParaOrcamento.FormKeyPress(Sender: TObject;
  var Key: Char);
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

procedure T_frmCadastraClientesParaOrcamento.btnCadastraClienteClick(
  Sender: TObject);
begin

     GravarRegistro;

     btnCadastraCliente.Enabled   := false;
     btnCancelaCadCliente.Enabled := false;

end;

procedure T_frmCadastraClientesParaOrcamento.edt_ApelidoClienteEnter(
  Sender: TObject);
begin          

      btnCancelaCadCliente.Enabled := true;
      btnCadastraCliente.Enabled   := true

end;

procedure T_frmCadastraClientesParaOrcamento.edt_NomeClienteExit(
  Sender: TObject);
begin

    VerificarDuplicidade(dm_Conexao.cds_DadosClientes,'cli_nome',edt_NomeCliente);

end;    


procedure T_frmCadastraClientesParaOrcamento.rdCNPJClick(Sender: TObject);
begin

    rdCPF.Enabled    := false;
    msk_cpf.Enabled  := false;

    msk_cnpj.Enabled := true;
    msk_cnpj.SetFocus;


end;

procedure T_frmCadastraClientesParaOrcamento.rdCPFClick(Sender: TObject);
begin

    rdCNPJ.Enabled   := false;
    msk_cnpj.Enabled := false;

    msk_cpf.Enabled  := true;
    msk_cpf.SetFocus;

end;

procedure T_frmCadastraClientesParaOrcamento.msk_CepClienteChange(
  Sender: TObject);
begin

    if Length(Trim(msk_CepCliente.Text)) = 9 then  msk_DataNasctoCliente.setfocus;

end;

procedure T_frmCadastraClientesParaOrcamento.msk_cpfChange(Sender: TObject);
begin

    if Length(Trim(msk_cpf.Text)) = 14 then  msk_Fone.setfocus;

end;

procedure T_frmCadastraClientesParaOrcamento.msk_cnpjChange(Sender: TObject);
begin

   if Length(Trim(msk_cnpj.Text)) = 19 then  msk_Fone.setfocus;

end;

procedure T_frmCadastraClientesParaOrcamento.msk_FoneChange(Sender: TObject);
begin

   if Length(Trim(msk_Fone.Text)) = 9 then  msk_fone2.setfocus;

end;

procedure T_frmCadastraClientesParaOrcamento.msk_Fone2Change(
  Sender: TObject);
begin

    if Length(Trim(msk_Fone2.Text)) = 9 then  msk_fone3.setfocus;

end;

procedure T_frmCadastraClientesParaOrcamento.msk_Fone3Change(
  Sender: TObject);
begin

     if Length(Trim(msk_Fone3.Text)) = 9 then  msk_fone4.setfocus;

end;

procedure T_frmCadastraClientesParaOrcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dm_Conexao.cds_DadosClientes.Active := false;
     dm_Conexao.cds_DadosClientes.Active := true;
end;

end.
