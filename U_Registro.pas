unit U_Registro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider, DateUtils, 
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, Registry, MIDASLIB;


type
  T_frmRegistro = class(TForm)
    pnl_Desbloqueio: TPanel;
    grp2: TGroupBox;
    grp1: TGroupBox;
    lbl5: TLabel;
    lbl6: TLabel;
    edtContraChave: TEdit;
    edtChaveParaContato: TEdit;
    grp3: TGroupBox;
    btnObterLicenca: TSpeedButton;
    btnTestar: TSpeedButton;
    btnSair: TSpeedButton;
    Panel1: TPanel;
    btnLicenciar: TSpeedButton;


    //PROCEDURES PERSO
    procedure GerarQdeDiasParaDegustacao(qdeDias:integer);
    procedure VerificarSeUsouOsDiasDegustacao;
    procedure AtualizarDataAtual;
    procedure GerarChaveParaContato;

    //FUNCOES
    Function RecuperarSerialHD:string;
    function ChaveAutenticada : boolean;

    procedure FormCreate(Sender: TObject);
    procedure btnTestarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnObterLicencaClick(Sender: TObject);
    procedure edtContraChaveChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnLicenciarClick(Sender: TObject);
    procedure edtChaveParaContatoClick(Sender: TObject);
    procedure edtContraChaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContraChaveKeyPress(Sender: TObject; var Key: Char);
    procedure edtChaveParaContatoExit(Sender: TObject);
    procedure edtChaveParaContatoEnter(Sender: TObject);


  private
    { Private declarations }
    SerialHD,ChaveEntradaPeloCliente,chaveDescriptografada,ChaveDoBancoDescriptografada,email : string;
    DataPermanente,DataFimDegustacao : TDateTime;
    UsouTodosOsDiasDegustacao : boolean;

  public
    { Public declarations }
  end;

var

  _frmRegistro    : T_frmRegistro;



implementation

uses U_Login, U_dmDadosSegundo, U_dmPesquisas, U_BiblioSysSalao, U_dmDados,
  U_Desbloqueio, U_principal, U_CadFuncionarios, U_CadEmpresa;

{$R *.dfm}

procedure T_frmRegistro.FormCreate(Sender: TObject);
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

  email          := 'lpsyspdv@dicadecompra.com';
  DataPermanente := StrToDate('01/01/2500');

end;

procedure T_frmRegistro.FormShow(Sender: TObject);
begin    

   //VERIFICANDO SE J� UTILIZOU OS SETE DIAS DE DEGUSTA��O
   VerificarSeUsouOsDiasDegustacao;

   if UsouTodosOsDiasDegustacao then
   begin
      btnTestar.Enabled       := false;
      edtContraChave.Enabled  := true;
   end else
   begin
      btnTestar.Enabled       := true;
   end;

   //verificando e liberando o campo edtContraChave se solicitou a licenca anteriormente
   if(RetornarContraChave <> '0')then
   begin
      edtContraChave.Enabled:= true;
      btnTestar.Enabled     := false;
   end;
   
end;

procedure T_frmRegistro.GerarQdeDiasParaDegustacao(qdeDias: integer);
begin

      //gera a quantidade de dias de degusta��o do Sistema gratuitamente definida no procedimento
      _Sql := 'update expiracao set dt_expiracao = :pdt_expiracao, dt_inicio_degustacao = :pdata_inicio_degustacao, dt_fim_degustacao=:pdata_fim_degustacao where id_dia = 1';

       with DM_Pesq.Qry_Auxiliar do
       begin

           close;
           sql.Clear;
           sql.Add(_Sql);
           ParamByName('pdt_expiracao').AsDateTime              := Date + qdeDias;
           ParamByName('pdata_inicio_degustacao').AsDateTime    := now;
           ParamByName('pdata_fim_degustacao').AsDateTime       := Date + qdeDias;
           ExecSQL;

      end;

      texto := 'Sistema   liberado    por  '+IntToStr(qdeDias)+'  dias,  fa�a   todos  os  cadastros'#13'e testes que achar necess�rio, quando o vencimento estiver'#13'pr�ximo voc� ser� avisado e orientado  de  como  obter sua'#13'licen�a definitiva.';
      Application.MessageBox(PChar(texto),'Degusta��o 15 dias!', MB_OK + MB_ICONWARNING);

      cadastroInicial := true;

      Application.CreateForm(T_frmCadastraEmpresa,  _frmCadastraEmpresa);
      _frmCadastraEmpresa.ShowModal;
      FreeAndNil(_frmCadastraEmpresa);

      Close;

end;

procedure T_frmRegistro.btnTestarClick(Sender: TObject);
begin
     //DEFININDO POR QUANTOS DIAS O CLIENTE PODE TESTAR COM LICENCIAMENTO ABERTO DENTRO DO ARQUIVO CONFIGURACOES.INI
     GerarQdeDiasParaDegustacao(15);
end;

procedure T_frmRegistro.GerarChaveParaContato;
begin

   //MOSTRANDO A CHAVE PARA CONTATO E GRAVANDO O SERIAL DO HD NO CAMPO INFO DA TABELA EXPIRA�AO
   SerialHD                    := GetSerialNumberFromHD('C');
   edtChaveParaContato.Enabled := true;
   edtChaveParaContato.Text    :=  Criptografar('C',SerialHD);

   texto := 'Chave  para  contato   gerada   com   sucesso  copie,'#13'envie para : '+email+' - assunto :'#13'[ Solicita��o de chave definitiva Syspdv ].';
   Application.MessageBox(PChar(texto),'Licenciando o Sistema...', MB_OK + MB_ICONINFORMATION);

   edtChaveParaContato.SetFocus;
   btnObterLicenca.Enabled := false;
   btnTestar.Enabled       := false;
   btnLicenciar.Enabled    := false;

   _Sql := 'update expiracao set contra_chave = :pContraChave where id_dia = 1';

   with DM_Pesq.Qry_Auxiliar do
   begin

       close;
       sql.Clear;
       sql.Add(_Sql);
       ParamByName('pContraChave').AsString  := edtChaveParaContato.Text;
       ExecSQL;

  end;

end;

procedure T_frmRegistro.btnObterLicencaClick(Sender: TObject);
begin

        GerarChaveParaContato;

        //este � o n�mero real do HD do cliente
        chaveDescriptografada := Criptografar('D', edtChaveParaContato.Text);

       //gravando a s�rie do HD do cliente no banco de dados de forma criptografada
       _Sql := 'update expiracao set info = :info, acesso = 1 where id_dia = 1';

       with DM_Pesq.Qry_Auxiliar do
       begin

           close;
           sql.Clear;
           sql.Add(_Sql);
           ParamByName('INFO').AsString := edtChaveParaContato.Text;
           ExecSQL;

      end;
      
end;


procedure T_frmRegistro.AtualizarDataAtual;
begin

    //GRAVA A DATA ATUAL NO BANCO DE DADOS
    with dm_DadosSegundo.cds_Expiracao do
    begin

      Open;
      Edit;
      FieldByName('DT_ATUAL').AsDateTime := Date;
      Post;
      ApplyUpdates(0);

    end;

end;


procedure T_frmRegistro.edtContraChaveChange(Sender: TObject);
begin 

    btnLicenciar.Enabled    := True;
    btnObterLicenca.Enabled := False;
    btnTestar.Enabled       := false;

end;

procedure T_frmRegistro.btnSairClick(Sender: TObject);
begin

    texto := 'Copiou sua chave e/ou deseja sair assim mesmo?';
    if Application.MessageBox(PChar(texto),'Sistema n�o licenciado!',MB_YESNO + MB_ICONWARNING) = IdYes then
    begin

      texto := 'Obrigado  por  ter testado nosso sistema, estamos a'#13'disposi��o para  maiores  esclarecimentos no e-mail'#13''+email;
      Application.MessageBox(PChar(texto),'Sistema n�o licenciado!', MB_OK + MB_ICONINFORMATION);
      Application.Terminate;
    end;

end;

procedure T_frmRegistro.VerificarSeUsouOsDiasDegustacao;
begin

       DataFimDegustacao := StrToDate(RetornarFimDegustacao);

       if( DataFimDegustacao > StrToDate('01/01/2000'))then
       begin
            UsouTodosOsDiasDegustacao := true;
       end;   

end;


Function T_frmRegistro.RecuperarSerialHD: string;
begin
      //recupera o serial do HD do cliente que esta na tabela expiracao do banco de dados
      _Sql := 'SELECT info FROM expiracao where id_dia = 1';

       with DM_Pesq.Qry_Auxiliar do
       begin

           close;
           sql.Clear;
           sql.Add(_Sql);
           open;

           if not IsEmpty then
           begin

               Result := DM_Pesq.Qry_Auxiliar.Fields[0].AsString;

           end;

      end;

end;

procedure T_frmRegistro.edtChaveParaContatoClick(Sender: TObject);
begin

     edtChaveParaContato.SelStart := 0;
     edtChaveParaContato.SelLength:= Length(edtChaveParaContato.Text);

end;


function T_frmRegistro.ChaveAutenticada : boolean;
begin

    //verifica se a chave entrada pelo cliente � a mesma que o suporte enviou pra ele

    ChaveEntradaPeloCliente       := Criptografar('D',edtContraChave.Text);  //descriptografando a chave do cliente
    ChaveDoBancoDescriptografada  := Criptografar('D',RecuperarSerialHD);    //descriptografando a chave do banco

    {
      ShowMessage('CHAVE DO CLIENTE  DESCRIPTOGRAFADA '+ChaveEntradaPeloCliente);
      ShowMessage('SERIE HD NO BANCO DESCRIPTOGRAFADA '+ChaveDoBancoDescriptografada);
      O codigo abaixo � para n�o aceitar a chave gerada para contato como chave de libera��o -> RecuperarSerialHD <> edtContraChave.Text
    }

    if( ChaveEntradaPeloCliente = ChaveDoBancoDescriptografada ) and (RecuperarSerialHD <> edtContraChave.Text)then
    begin
         Result := true;
    end else begin
         Result := false;
    end;

end;

procedure T_frmRegistro.btnLicenciarClick(Sender: TObject);
begin
      //ShowMessage(BoolToStr(ChaveAutenticada));
      Self.Hide;

      if(ChaveAutenticada)then
      begin
            // libera o sistema para uso com validade permanente e abre a tela de login para o primeiro acesso
            Application.MessageBox('Sistema liberado com sucesso, obrigado  pela  prefer�ncia.','Sistema licenciado!', MB_OK + MB_ICONINFORMATION);    

            _Sql := 'update expiracao set dt_expiracao = :dt_expiracao, dt_liberacao=:dt_liberacao, dt_fim_degustacao=:dt_fim_degustacao where id_dia = 1';
            with DM_Pesq.Qry_Auxiliar do
            begin

               close;
               sql.Clear;
               sql.Add(_Sql);
               ParamByName('DT_EXPIRACAO').AsDateTime      := DataPermanente;
               ParamByName('DT_LIBERACAO').AsDateTime      := now;
               ParamByName('DT_FIM_DEGUSTACAO').AsDateTime := now;
               ExecSQL;

           end;

           //direcionando ao formulario de abertura corretamente
           if(retornaQuantidadeRegsTabela('func_id','funcionarios')>=2)then
           begin
               //ja tinha degustado dos 15 dias e resolveu gerar a licenca definitiva
               Application.CreateForm(T_frmLogin,  _frmLogin);
               _frmLogin.ShowModal;
               FreeAndNil(_frmLogin);
               close;
               Release;

           end else if(retornaQuantidadeRegsTabela('func_id','funcionarios')=1)then
           begin

             cadastroInicial := true;
             Application.CreateForm(T_frmCadastraEmpresa,  _frmCadastraEmpresa);
             _frmCadastraEmpresa.ShowModal;
             FreeAndNil(_frmCadastraEmpresa);
             close;
             Release;
             
           end;

      end else
      begin

           texto:= 'Chave  inv�lida   reinicie  o  sistema  e  clique  no  bot�o'#13'[Obter  Licen�a], copie  a  chave gerada e siga os passos'#13'da  tela para adquirir uma licen�a v�lida  e  liberar o seu'#13'sistema em definitivo!';
           Application.MessageBox(PChar(texto),'Sistema n�o licenciado!', MB_OK + MB_ICONWARNING);

           edtContraChave.Text := '';
           edtContraChave.SetFocus;
           edtContraChave.Enabled:= false;
           btnLicenciar.Enabled := false;
           Application.Terminate;

      end;
end;

procedure T_frmRegistro.edtContraChaveKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin    

      //Inibindo a digita��o do campo | se digitar algo chamar aten��o do usu�rio que deve entrar com a chave copiando e colando no campo e n�o digitando
      Application.MessageBox('Copie a chave recebida por email e cole aqui clicando com o bot�o direito do mouse, se ainda n�o tem a chave clique no bot�o Obter Licen�a!','Digita��o bloqueada!', MB_OK + MB_ICONINFORMATION);
      edtContraChave.Text := '';
      edtContraChave.SetFocus;
      
end;

procedure T_frmRegistro.edtContraChaveKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in[]) then
     begin
        Key:= #0;
     end;
end;

procedure T_frmRegistro.edtChaveParaContatoExit(Sender: TObject);
begin

      texto := 'Copiou a chave gerada para enviar por e-mail?';
      if Application.MessageBox(PChar(texto),'Licenciando o Sistema...',MB_YESNO + MB_ICONWARNING) = IdYes then
      begin

        texto := 'Obrigado  pela prefer�ncia entraremos em contato o mais breve poss�vel!';
        Application.MessageBox(PChar(texto),'Licenciando o Sistema...', MB_OK + MB_ICONINFORMATION);
        Application.Terminate;

      end else begin
         edtChaveParaContato.SetFocus;
      end;
end;

procedure T_frmRegistro.edtChaveParaContatoEnter(Sender: TObject);
begin

    edtChaveParaContato.SelStart := 0;
    edtChaveParaContato.SelLength:= Length(edtChaveParaContato.Text);

end;


end.
