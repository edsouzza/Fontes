unit U_CadFornecedorPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls;

type
  T_frmCadFornecedorPedido = class(TForm)
    pan_titulo: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    lbl45: TLabel;
    lblStatusLogoff: TLabel;
    pan_botoes: TPanel;
    btnSalvar: TSpeedButton;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    txtNome: TEdit;
    txtApelido: TEdit;
    txtEndereco: TEdit;
    Label4: TLabel;
    txtEmail: TEdit;
    btnSair: TSpeedButton;
    Label5: TLabel;
    txtBairro: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure AbriTabelas;
    procedure GravarSemContato;
    procedure btnSalvarClick(Sender: TObject);
    procedure Gravar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure txtEnderecoChange(Sender: TObject);
    procedure txtNomeExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmCadFornecedorPedido: T_frmCadFornecedorPedido;

implementation

uses U_BiblioSysSalao, U_dmDados, U_dmDadosSegundo, U_dmPesquisas;

{$R *.dfm}


procedure T_frmCadFornecedorPedido.FormCreate(Sender: TObject);
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

    lblDataDoDia.Caption     := DateToStr(now);
    lblHoraAtual.Caption     := timetoStr(time);
    lblStatusLogoff.Caption  := IdentificarUsuarioLogado;

    AbriTabelas;

end;

procedure T_frmCadFornecedorPedido.AbriTabelas;
begin

  dm_Conexao.cds_Fornecedor.Active      := true;
  dm_Conexao.cds_ContatosForne.Active   := true;

end;

procedure T_frmCadFornecedorPedido.btnSalvarClick(Sender: TObject);
begin

     Gravar;

end;

procedure T_frmCadFornecedorPedido.Gravar;
begin

      With DM_Pesq.qry_Cod do
      begin

        Close;
        SQL.Clear;
        // Selecionando dentro da qry o numero de maior valor, ou seja o ultimo cod
        SQL.Add('select max(forne_id) from Fornecedores');
        Open;

        // Qdo encontrar o ultimo numero adicione 1 ao mesmo,
        //assim temos o numero do proximo codigo em uma variavel
        //O Fields[0] abaixo é porque e citei na sql apenas o campo cli_id
        if not IsEmpty then begin
           proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger+1;
        end;

      end;


     // Formatando a Data para a gravação
     DateSeparator := '/';
     ShortDateFormat := 'dd/mm/yyyy';


     // Abrindo um registro novo e gravando no bd
     with dm_Conexao.cds_Fornecedor do begin

        Append;

        //Edita aos campos que estão nos Edits nos Campos da Tabela

        // Para o código eu usei a variavel proxNum usada na consulta acima
        FieldByName('forne_id').AsInteger          := proxNum;
        FieldByname('forne_nome').AsString         :=  txtNome.Text;
        FieldByname('forne_apelido').AsString      := txtApelido.Text;
        FieldByname('forne_endereco').AsString     := txtEndereco.Text;
        FieldByname('forne_complemento').AsString  := txtBairro.Text;
        FieldByname('forne_email').AsString        := txtEmail.Text;
        FieldByname('forne_datacad').AsString      := DateToStr(date);
        FieldByname('forne_status').AsString       := 'A';

        ApplyUpdates(0)

     end;

     GravarSemContato;
     close;

end;

procedure T_frmCadFornecedorPedido.GravarSemContato;
begin

      With DM_Pesq.qry_Cod do
      begin

        Close;
        SQL.Clear;
        SQL.Add('select max(id_contato) from contatos_fornecedores');
        Open;

        if not IsEmpty then
        begin

           proxNumContato := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

        end;

      end;

     with dm_Conexao.cds_ContatosForne do
     begin

        Append;

        FieldByName('id_contato').AsInteger   := proxNumContato;
        FieldByname('forne_id').AsInteger     := proxNum;
        FieldByname('nome').AsString          := 'SEM CONTATO DEFINIDO';
        FieldByname('dddfone').AsString       := '011';
        FieldByname('fone').AsString          := '    -    ';
        FieldByname('dddcel').AsString        := '011';
        FieldByname('cel').AsString           := '    -    ';
        FieldByname('idnextel').AsString      := ' ';
        FieldByname('nextel').AsString        := '    -    ';
        FieldByname('status').AsString        := 'A';
        FieldByname('datacad').AsDateTime     := now;

     end;

     dm_Conexao.cds_ContatosForne.ApplyUpdates(0);

end;

procedure T_frmCadFornecedorPedido.FormKeyPress(Sender: TObject;
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

procedure T_frmCadFornecedorPedido.txtEnderecoChange(Sender: TObject);
begin
    btnSalvar.Enabled := true;
end;

procedure T_frmCadFornecedorPedido.txtNomeExit(Sender: TObject);
begin

    VerificarDuplicidade(dm_Conexao.cds_Fornecedor,'forne_nome',txtNome);

end;

procedure T_frmCadFornecedorPedido.btnSairClick(Sender: TObject);
begin
    close;
end;

end.
