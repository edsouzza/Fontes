unit U_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, DateUtils,ToolEdit, jpeg, ImgList, QExtCtrls, ExtCtrls;

  Const
     InputBoxMsg = WM_USER + 123;


type
  T_frmLogin = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl_EscolhaUsuario: TPanel;
    grid_Usuarios: TDBGrid;
    btn_Entrar: TSpeedButton;
    btn_Sair: TSpeedButton;
    subMenu: TPopupMenu;
    SYSDESENV: TMenuItem;
    lista_imagens: TImageList;
    SYSPDV: TMenuItem;
    edt_Senha: TEdit;
    lbl2: TLabel;

    procedure btn_SairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grid_UsuariosCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_FiltraUsuariosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_GravarNovaSenhaClick(Sender: TObject);
    procedure btn_EntrarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure btnSairLogoffClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_SenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_SenhaEnter(Sender: TObject);
    procedure edt_SenhaKeyPress(Sender: TObject; var Key: Char);
    procedure SYSPDVClick(Sender: TObject);
    procedure SYSDESENVClick(Sender: TObject);
    procedure edt_SenhaChange(Sender: TObject);

    //PROCEDIEMNTOS PERSONALIZADOS
    procedure GravarExpiracaoSeTabelaVazia;
    procedure AlterarSenha;
    procedure Autenticar;
    procedure Criptografar;
    procedure Descriptografar;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure MostrarUsuariosNoGrid;
    procedure ExecutarConfiguracaoInicial;
    procedure GravarConfiguracaoInicial;
    procedure IdentificarEmpresaUsuariaDoSistema;
    procedure AbriFecharTabelas;
    procedure Log_Entrada;
    procedure VerificarDataDeExpiracao;
    procedure InputBoxSet(var Msg: TMessage); message InputBoxMsg;
    procedure MudarBancoParaSysDesenv;
    procedure MudarBancoParaSysPdv;

    //FUNCOES PERSONALIZADAS
    Function SenhaInicialEncontrada:boolean;
    Function getIDUsuarioLogado:integer;
    Function IdentificarUsuarioLogando:string;



  private
    { Private declarations }
     senhaInicial,email,novasenha,usuario : string;
     DataAtual, DataExpiracao  : TDateTime;
        

     //populando a tabela de menus
     localArquivo,linha, caminhoBanco,caminhoIni : string;
     ListaTextos  : TStringList;
     arq          : TextFile;
     config       : TIniFile;

  public
    { Public declarations }
      Tentativas, Log_Cod : Integer;
      SenhaCriptografadaDoBanco, SenhaDescriptografadaDoBanco : string;

  end;

const
     ListaFormasPagto : array [1..4] of string = ('DINHEIRO', 'CREDITO', 'DEBITO', 'PARCELADO');

var
  _frmLogin    : T_frmLogin;
  

implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo, U_Registro,
  U_principal, U_Desbloqueio, U_Caixa, DBClient, DB, U_SPLASH;


{$R *.dfm}


procedure T_frmLogin.FormCreate(Sender: TObject);
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

   email                  := 'contato@dicadecompra.com';
   pathFile               :=  ExtractFilePath(Application.ExeName)+'Configuracoes.ini';
   //lblDataDoDia.Caption   :=  DateToStr(date);
   //lblHoraAtual.Caption   :=  timetoStr(time);
   edt_Senha.Enabled      :=  false;
   NivelFuncao            := 0;

   if(TabelaEstaVazia('expiracao'))then
   begin

      ExecutarConfiguracaoInicial;

   end;

   AbrirTabelas;
   IdentificarEmpresaUsuariaDoSistema;
   self.Caption := retornarNomeBancoSetado(RetornarCaminhoBanco);
   
   //IMPORTANTE : A SENHA INICIAL GRAVADA PARA O USU�RIO ADMIN � eas170867

end;     

procedure T_frmLogin.FormShow(Sender: TObject);
begin

    DataAtual          := now;
    DT_Sistema         := now;
    DataExpiracao      := StrToDate(RetornarDataExpiracao);

    //atualizando a data atual do sistema na tabela expiracao para eventuais verifica��es respeito de expira��o
    atualizarUmCampoDaTabela('expiracao','dt_atual',DateToStr(DataAtual),'id_dia','1','data');

    //Primerio verifica se licen�a esta expirada
    if not(SistemaLiberado)then
    begin
        VerificarDataDeExpiracao;
    end;

    if (alterandoUsuario ) then
    begin

       self.Caption               := 'Escolher usu�rio';
       self.btn_Sair.Caption      := 'Cancelar';
       self.pnl_cabecalho.Caption := 'Escolha seu usu�rio e entre com a senha';

    end;

    IdentificarEmpresaUsuariaDoSistema;
    MostrarUsuariosNoGrid;

end;

procedure T_frmLogin.VerificarDataDeExpiracao;
begin

        //CONTAR 15 DIAS A PARTIR DO DIA SEGUINTE - TRUNC RETIRA AS CASAS DECIMAIS DO N�MERO
        QdeDiasParaExpirar := trunc(RetornaDifDiasEntreDatas(StrToDate(RetornarFimDegustacao)+1,now));

        //ShowMessage('Qde de dias para expirar : '+(floatToStr(QdeDiasParaExpirar))); //para testar o comportamento do sistema altere a data DT_FIM_DEGUSTACAO no banco de dados   

        //VERIFICA��ES E MENSAGENS DE ACORDO COM A DATA ATUAL
        if ( RetornarDataExpiracao = '01/01/2000' )then
        begin

              // ABRE O FORMUL�RIO DE REGISTRO PARA ADQUIRIR A CHAVE E DAR INICIO AO PROCESSO DE OBTEN�AO DA LICEN�A DEFINITIVA OU INICIAR A DESGUSTA��O DE 15 DIAS
              Application.CreateForm(T_frmRegistro,  _frmRegistro);
              _frmRegistro.ShowModal;
              FreeAndNil(_frmRegistro);

        end else
        if ( QdeDiasParaExpirar <= 0 )then
        begin
                 //Licenca vencer� no dia seguinte se mesmo assim o cliente clicar em n�o comprar a licen�a abrir o login pois ainda tem 1 dia de uso

                 texto := 'Sua  licen�a  esta  vencida    favor   entrar  em  contato,'#13'estamos a disposi��o para maiores esclarecimentos no'#13'e-mail : '+email;
                 Application.MessageBox(PChar(texto),'Licen�a vencida!', MB_OK + MB_ICONERROR);
                 Application.Terminate;

        end else
        if ((QdeDiasParaExpirar > 1 ) and (QdeDiasParaExpirar <= 5)) then
        begin

            texto := 'Faltam      '+floatToStr(QdeDiasParaExpirar)+'    dia(s)     para     vencer      sua     licen�a,  deseja'#13'adquirir  sua licen�a e seguir desfrutando do sistema  agora?';

            if Application.MessageBox(PChar(texto),'Sobre a Licen�a!',MB_YESNO + MB_ICONWARNING) = IdYes then
            begin

              // ABRE O FORMUL�RIO DE REGISTRO PARA ADQUIRIR A CHAVE E DAR INICIO AO PROCESSO DE OBTEN�AO DA LICEN�A DEFINITIVA
              Application.CreateForm(T_frmRegistro,  _frmRegistro);
              _frmRegistro.ShowModal;
              FreeAndNil(_frmRegistro);

            end;
        end else
        if (QdeDiasParaExpirar = 1 ) then
        begin

            texto := 'Faltam  apenas  '+floatToStr(QdeDiasParaExpirar)+' dia  para  expirar  sua licen�a, atente   para   o   fato  de  perda  total  dos  dados  cadastrados  caso   isso  ocorra,  adquira   agora   sua    licen�a  e   siga   desfrutando  de  tudo que nosso  sistema  lhe  proporciona, vamos nessa?';
            if Application.MessageBox(PChar(texto),'Sobre a Licen�a!',MB_YESNO + MB_ICONWARNING) = IdYes then
            begin

              // ABRE O FORMUL�RIO DE REGISTRO PARA ADQUIRIR A CHAVE E DAR INICIO AO PROCESSO DE OBTEN�AO DA LICEN�A DEFINITIVA
              Application.CreateForm(T_frmRegistro,  _frmRegistro);
              _frmRegistro.ShowModal;
              FreeAndNil(_frmRegistro);

         end;

      end;

end;

procedure T_frmLogin.AbrirTabelas;
begin

    dm_Conexao.cds_DadosFuncionarios.Active      := True;
    DM_Pesq.cdsPesqFuncionarios.Active           := True;
    dm_DadosSegundo.cds_Login.Active             := True;
    dm_Conexao.cds_acessos.Active                := True;
    dm_Conexao.cds_ListaEmpresas.Active          := true;
    dm_Conexao.cds_Permissoes.Active             := true;

end;


procedure T_frmLogin.FecharTabelas;
begin

    dm_Conexao.cds_DadosFuncionarios.Active      := False;
    DM_Pesq.cdsPesqFuncionarios.Active           := False;
    dm_DadosSegundo.cds_Login.Active             := False;
    dm_Conexao.cds_acessos.Active                := False;
    dm_Conexao.cds_ListaEmpresas.Active          := False;
    dm_Conexao.cds_Permissoes.Active             := False;

end;

procedure T_frmLogin.AbriFecharTabelas;
begin

    dm_Conexao.cds_DadosFuncionarios.Active      := False;
    dm_Conexao.cds_DadosFuncionarios.Active      := True;

    DM_Pesq.cdsPesqFuncionarios.Active           := False;
    DM_Pesq.cdsPesqFuncionarios.Active           := True;

    dm_DadosSegundo.cds_Login.Active             := False;
    dm_DadosSegundo.cds_Login.Active             := True;

end;

procedure T_frmLogin.btn_SairClick(Sender: TObject);
begin

    if (alterandoUsuario ) then
    begin

      alterandoUsuario := false;
      _frmPrincipal.logo.Visible := true;
      close;

    end else
    begin

      Application.Terminate;
      
    end;

end;


procedure T_frmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin    

    FecharTabelas;
    dtDataDoDia.Free;
    ListaTextos.Free;
    Release;

end;

Function T_frmLogin.IdentificarUsuarioLogando:string;
begin

    //recebe o login e retorna o nome de quem esta logando no sistema
    with DM_Pesq.Qry_Geral do
    begin

        Close;
        SQL.Clear;
        SQL.add('SELECT n.func_nome, f.funcao_descricao FROM funcionarios n, funcoes f WHERE n.func_id = :pId and f.funcao_id = n.func_funcaoid');
        ParamByName('pId').AsInteger  := idSelecionado;
        open;

        if not IsEmpty then
        begin

           Result      :=  DM_Pesq.Qry_Geral.Fields[1].AsString+' '+DM_Pesq.Qry_Geral.Fields[0].AsString;
           sFuncao     :=  DM_Pesq.Qry_Geral.Fields[1].AsString;

        end;

    end;

    self.Caption  := Result;

end;


procedure T_frmLogin.grid_UsuariosCellClick(Column: TColumn);
begin

    idSelecionado                := dm_DadosSegundo.cds_Login.FieldByName('func_id').AsInteger;
    usuario                      := dm_DadosSegundo.cds_Login.FieldByName('usuario').AsString;
    sUsuarioLogado               := dm_DadosSegundo.cds_Login.FieldByName('usuario').AsString;
    self.Caption                 := IdentificarUsuarioLogando;
    edt_Senha.Enabled            := true;
    edt_Senha.SetFocus;
    edt_Senha.Clear;

end;


procedure T_frmLogin.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmLogin.edt_FiltraUsuariosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if Key = VK_RETURN then
     begin

         edt_Senha.SetFocus;

     end;

end;

procedure T_frmLogin.btn_GravarNovaSenhaClick(Sender: TObject);
begin

 if not (alterandoUsuario)then
 begin

     AlterarSenha;
     edt_Senha.Clear;
     btn_Entrar.Enabled           := false;
     btn_Sair.Enabled             := true;
     edt_Senha.Enabled            := true;
     grid_Usuarios.Enabled        := true;
     grid_Usuarios.SetFocus;

 end else
 begin
     AlterarSenha;
     close;
 end;

end;


procedure T_frmLogin.AlterarSenha;
begin
   //n�o seguir adiante se o usu�rio n�o digitar uma senha
   if (novasenha <> null) and (novasenha <> '') then
   begin

        Criptografar;

        novasenha  := dm_DadosSegundo.criptografa.Output;

        with DM_Pesq.Qry_Geral do
        begin

            Close;
            SQL.Clear;
            SQL.add('Update login SET senha = :pSenha WHERE usuario = :pUsuario');
            ParamByName('pSenha').AsString    := novasenha;
            ParamByName('pUsuario').AsString  := usuario;
            ExecSQL;

        end;

        dm_DadosSegundo.cds_Login.ApplyUpdates(0);
        Application.MessageBox('Senha cadastrada com sucesso, acesse o sistema agora!', 'Gerando senha de acesso!', MB_OK + MB_ICONWARNING);

        //atualizando
        dm_DadosSegundo.cds_Login.Active:= False;
        dm_DadosSegundo.cds_Login.Active:= True;

        with dm_DadosSegundo.cds_Login do
        begin

            Close;
            CommandText:= 'select * from login WHERE status = '+QuotedStr('A')+' order by usuario';
            Open;

        end;

        entrounovasenha := true;

   end else
   begin

      Application.MessageBox('Senha inv�lida, entre com uma senha agora!', 'Cadastrando senha de acesso!', MB_OK + MB_ICONERROR);
      //abrir o input box novamente

      if (SenhaInicialEncontrada)then
      begin

           // Usaremos PostMessage para enviar a mensagem em caixa alta
          PostMessage(Handle, InputBoxMsg, 0, 0);
          novasenha := InputBox('Entre com nova senha','Senha','');
          //ShowMessage('A senha cadastrada foi: ' + novasenha);

          AlterarSenha;
          //aqui o sistema recebeu a senha digitada pelo usu�rio
      end;

   end;

end;

procedure T_frmLogin.InputBoxSet(var Msg: TMessage);
var
  i: integer;
begin

  //INPUT BOX PARA DIGITA��O DA NOVA SENHA COM CARACTERS DE (*)
  for i:=0 to Screen.Forms[0].ComponentCount-1 do
  begin
    if Screen.Forms[0].Components[i] is TEdit then
    begin
      With TEdit( Screen.Forms[0].Components[i] ) do
      begin
        PasswordChar := '*'; //Aqui est� o caractere q ir� aparecer na inputbox
        Clear;               //Limpamos a caixa de digita��o da senha.
      end;
    end;
  end;

end;


procedure T_frmLogin.btn_EntrarClick(Sender: TObject);
begin

     IdentificarEmpresaUsuariaDoSistema;
     IdDoUsuarioLogado := getIDUsuarioLogado;
     RetornaNomeUsuarioLogado(getIDUsuarioLogado);

     if(edt_Senha.Text = '') or (edt_Senha.Text = null) then
     begin

        Application.MessageBox('Digite sua senha!', 'Erro de Autentica��o!', MB_OK + MB_ICONWARNING);
        exit;
        edt_Senha.SetFocus;

     end else begin

        Autenticar;

     end;
end;

function T_frmLogin.SenhaInicialEncontrada:boolean;
begin

     senhaInicial := 'e@s170867&'; //essa senha n�o pode ser usada por nenhum usu�rio serve para controle da senha inicial
     Descriptografar;
     SenhaDescriptografadaDoBanco := dm_DadosSegundo.criptografa.Output;

     //se identificar que se trata de acesso inicial ou senha reiniciada
     if (senhaInicial = SenhaDescriptografadaDoBanco) then
     begin
         //Application.MessageBox('Acesso inicial, cadastre sua senha pessoal!', 'Cadastro de senha de acesso!', MB_OK + MB_ICONWARNING);
         Result := true;
     end else begin
       Result := false;
     end;

end;


procedure T_frmLogin.Autenticar;
begin    

      btn_Entrar.Enabled           := False;
      grid_Usuarios.Enabled        := true;
      
      if (dm_DadosSegundo.cds_Login.Locate('usuario', usuario,[])) then
      begin

           Descriptografar;

           if edt_Senha.Text = dm_DadosSegundo.criptografa.Output then
           begin

                 Log_Entrada;

                 NivelFuncao    := dm_DadosSegundo.cds_Login.fieldbyname('funcao_id').asinteger;
                 sUsuarioLogado := RetornaUsuarioLogado(idSelecionado);  //retorna a sigla do usuario logado
                 logado := true;

                 Application.CreateForm(T_frmPrincipal,  _frmPrincipal);
                 _frmPrincipal.Show;
                 
                 self.Close;
                 self.Release;
                 
           end  else
           begin  

              if Tentativas <= 1 then
              begin

                  if ( usuario = 'ADMINISTRACAO' ) then
                  begin

                        Application.MessageBox('Usu�rio ou Senha inv�lido!', 'Erro de Autentica��o!',
                        MB_OK + MB_ICONWARNING);

                        edt_Senha.Clear;
                        edt_Senha.SetFocus;
                        grid_Usuarios.Enabled := False;
                        btn_Entrar.Enabled    := False;

                        Inc(Tentativas);

                  end else begin

                        Application.MessageBox('Usu�rio ou Senha inv�lido!', 'Erro de Autentica��o!',
                        MB_OK + MB_ICONWARNING);

                        edt_Senha.Clear;
                        edt_Senha.SetFocus;
                        btn_Entrar.Enabled := False;

                        Inc(Tentativas);

                  end;

              end else if Tentativas = 2 then
              begin

                 Application.MessageBox('Desculpe voc� n�o tem permiss�o para acessar o Sistema!', 'Usu�rio sem permiss�o!',
                 MB_OK + MB_ICONWARNING);

                 Tentativas:= 0;
                 Application.Terminate;

              end;

           end;
       end;
end;


procedure T_frmLogin.Criptografar;
begin

     with dm_DadosSegundo.criptografa do
     begin

        Action := atEncryption;
        Input  := novasenha;
        Execute;

     end;

end;


procedure T_frmLogin.Descriptografar;
begin      

      with dm_DadosSegundo.criptografa do
      begin

        Action := atDecryption;
        Input  := dm_DadosSegundo.cds_Login.fieldByname('senha').AsString;
        Execute;

      end;

end;

procedure T_frmLogin.btn_CancelarClick(Sender: TObject);
begin

    Application.Terminate;

end;


procedure T_frmLogin.Log_Entrada;
begin

      With DM_Pesq.qry_Cod do begin

        Close;
        SQL.Clear;
        SQL.Add('select max(id_acessos) as UltimoNum from log_acessos');
        Open;

        if not IsEmpty then begin

           proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger+1;

        end;

      end;


     if (dm_DadosSegundo.cds_Login.Locate('usuario', usuario,[])) then
     begin

         with dm_Conexao.cds_acessos do begin

            Append;

            FieldByName('id_acessos').AsInteger := proxNum;
            FieldByname('id_usuario').asInteger := dm_DadosSegundo.cds_Login.fieldbyname('func_id').AsInteger;
            FieldByname('log_data').AsDateTime  := date;
            FieldByname('log_entrada').AsString := TimeToStr(time);

         end;

     end;

     dm_Conexao.cds_acessos.ApplyUpdates(0);

end;

procedure T_frmLogin.btnSairLogoffClick(Sender: TObject);
begin

    close;

end;

procedure T_frmLogin.MostrarUsuariosNoGrid;
begin

      with dm_DadosSegundo.cds_Login do
      begin

          Close;
          CommandText:= ('SELECT * FROM login WHERE status = '+QuotedStr('A')+' ORDER BY usuario');
          Open;

            if not IsEmpty then
            begin

                with grid_Usuarios do
                begin

                  DataSource:=  dm_DadosSegundo.ds_Login;
                  Columns.Clear;

                  Columns.Add;
                  Columns[0].FieldName         := 'USUARIO';
                  Columns[0].Width             := 475;
                  Columns[0].Alignment         := taLeftJustify;

                end;

            end;
      end;

end;

procedure T_frmLogin.ExecutarConfiguracaoInicial;
begin

    GravarConfiguracaoInicial;

end;

procedure T_frmLogin.GravarConfiguracaoInicial;
var
   I : integer;
   pastaBackup : string;
begin

      pastaBackup := 'c:\bkpdados\';

       //CONFIGURANDO DATA DE EXPIRA��O DO SISTEMA
     _Sql := 'insert into expiracao (id_dia,  dt_atual, dt_expiracao, acesso,  dt_instalacao, dt_liberacao, caminho_banco, caminho_imgpadrao, caminho_telainicial, caminho_imgcodbarras, caminho_aplicacao, caminho_backup) '+
             'values (:id_dia, :dt_atual, :dt_expiracao, :acesso,  :dt_instalacao, :dt_liberacao, :caminho_banco, :caminho_imgpadrao, :caminho_telainicial, :caminho_imgcodbarras, :caminho_aplicacao, :caminho_backup)';

     with DM_Pesq.cdsPesqGeral do
      begin

           close;
           CommandText:=(_Sql);
           Params.ParamByName('id_dia').AsInteger                :=  1;
           params.ParamByName('dt_atual').AsDateTime             :=  now;
           params.ParamByName('dt_expiracao').AsDateTime         :=  StrToDate('01/01/2000');
           params.ParamByName('acesso').AsInteger                :=  0;
           params.ParamByName('dt_instalacao').AsDateTime        :=  now;
           params.ParamByName('dt_liberacao').AsDateTime         :=  StrToDate('01/01/2000');
           params.ParamByName('caminho_banco').AsString          :=  'C:\Meus Documentos\Bancos_De_Projetos\SysPdv\SYSPDV.FDB';
           params.ParamByName('caminho_imgpadrao').AsString      :=  ExtractFilePath(Application.ExeName)+'imagens\padrao.jpg';
           params.ParamByName('caminho_telainicial').AsString    :=  ExtractFilePath(Application.ExeName)+'imagens\logo.gif';
           params.ParamByName('caminho_imgcodbarras').AsString   :=  ExtractFilePath(Application.ExeName)+'imagens\codigo_barras.gif';
           params.ParamByName('caminho_aplicacao').AsString      :=  ExtractFilePath(Application.ExeName);
           params.ParamByName('caminho_backup').AsString         :=  pastaBackup;
           execute;

      end;  

      //criando a pasta padr�o do backup
      if not DirectoryExists(pastaBackup) then
      begin
          MkDir(PChar(pastaBackup));
      end;


      //================================================================================================================================================================


      //GRAVANDO O FUNCIONARIO ADMINISTRACAO NA TBL FUNCIONARIOS

      _Sql :=    'insert into funcionarios (func_id, func_funcaoid, func_nome, func_login, func_endereco, func_bairro, func_complemento, func_cep, func_telefone1, '+
                 'func_telefone2, func_celular1, func_celular2, func_email, func_datanascto, func_datacad, func_status, func_obs) '+
                 'values (:func_id, :func_funcaoid, :func_nome, :func_login, :func_endereco, :func_bairro, :func_complemento, :func_cep, :func_telefone1, '+
                 ':func_telefone2, :func_celular1, :func_celular2, :func_email, :func_datanascto, :func_datacad, :func_status, :func_obs)';

         with DM_Pesq.Qry_Auxiliar do
         begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             ParamByName('func_id').AsInteger           :=  1;
             ParamByName('func_funcaoid').AsInteger     :=  1;
             ParamByName('func_nome').AsString          := 'ADMINISTRACAO';
             ParamByName('func_login').AsString         := 'EA0000';
             ParamByName('func_endereco').AsString      := 'R.MUNIZ BARRETO,201';
             ParamByName('func_bairro').AsString        := 'V.BRASILANDIA';
             ParamByName('func_complemento').AsString   := 'V.TEREZINHA';
             ParamByName('func_cep').AsString           := '02846-160';
             ParamByName('func_telefone1').AsString     := '3921-0669';
             ParamByName('func_telefone2').AsString     := '';
             ParamByName('func_celular1').AsString      := '';
             ParamByName('func_celular2').AsString      := '99475-6517';
             ParamByName('func_email').AsString         := 'edsouzza@hotmail.com';
             ParamByName('func_datanascto').AsDateTime  := StrToDate('15/02/2012');
             ParamByName('func_datacad').AsString       := DateToStr(date);
             ParamByName('func_status').AsString        := 'A';
             ParamByName('func_obs').AsString           := 'FUNCIONARIO DE SISTEMA';    
             ExecSQL;

        end;

     //================================================================================================================================================================
     //GRAVANDO O FORNCEDOR PADR�O

      _Sql :=    'insert into fornecedores (forne_id, forne_nome, forne_apelido, forne_endereco, forne_complemento, forne_datacad, forne_status, forne_obs) '+
                 'values (:forne_id, :forne_nome, :forne_apelido, :forne_endereco, :forne_complemento, :forne_datacad, :forne_status, :forne_obs)';

         with DM_Pesq.Qry_Auxiliar do
         begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             ParamByName('forne_id').AsInteger              := 1;
             ParamByName('forne_nome').AsString             := 'PADRAO';
             ParamByName('forne_apelido').AsString          := 'PADRAO';
             ParamByName('forne_endereco').AsString         := 'PADRAO';
             ParamByName('forne_complemento').AsString      := 'PADRAO';
             ParamByName('forne_datacad').AsString          := DateToStr(now);
             ParamByName('forne_status').AsString           := 'A';
             ParamByName('forne_obs').AsString              := 'FORNECEDOR PADRAO';
             ExecSQL;

        end;

      //=======================================================================================
      //GRAVANDO O CATEGORIA PADR�O

      _Sql :=    'insert into categorias (id_categoria, categoria) values (:id_categoria, :categoria)';

         with DM_Pesq.Qry_Auxiliar do
         begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             ParamByName('id_categoria').AsInteger         := 1;
             ParamByName('categoria').AsString             := 'PADRAO';
             ExecSQL;

        end;

      //=======================================================================================
      //GRAVANDO O FABRICANTE PADR�O

      _Sql :=    'insert into fabricantes (id_fabricante, nome_fabricante) values (:id_fabricante, :nome_fabricante)';

         with DM_Pesq.Qry_Auxiliar do
         begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             ParamByName('id_fabricante').AsInteger         := 1;
             ParamByName('nome_fabricante').AsString        := 'PADRAO';
             ExecSQL;

        end;

     //=======================================================================================
      //GRAVANDO O USUARIO ADMIN NA TBL LOGIN => A SENHA INICIAL GRAVADA PARA O USU�RIO ADMINISTRA��O � eas170867
       dm_DadosSegundo.cds_Login.Active := TRUE;
       with dm_DadosSegundo.cds_Login do
       begin

          Append;

          FieldByName('id_usuario').AsInteger     := 1;
          FieldByName('func_id').AsInteger        := 1;
          FieldByName('funcao_id').AsInteger      := 1;
          FieldByName('usuario').AsString         := 'ADMIN';
          FieldByName('senha').AsString           := '87898B8D8FF11272CD64';  //eas170867
          FieldByName('status').AsString          := 'A';

          ApplyUpdates(0);

       end;

       //=======================================================================================
       //GRAVANDO AS FUN�OES DOS USUARIOS
       dm_DadosSegundo.cds_CadFuncoes.Active := TRUE;
       
       with dm_DadosSegundo.cds_CadFuncoes do
       begin

          Append;
          FieldByName('funcao_id').AsInteger          := 1;
          FieldByName('funcao_descricao').AsString    := 'SISTEMA';
          ApplyUpdates(0);

       end;       

       with dm_DadosSegundo.cds_CadFuncoes do
       begin

          Append;
          FieldByName('funcao_id').AsInteger          := 2;
          FieldByName('funcao_descricao').AsString    := 'GERENTE';
          ApplyUpdates(0);

       end;

       with dm_DadosSegundo.cds_CadFuncoes do
       begin

          Append;
          FieldByName('funcao_id').AsInteger          := 3;
          FieldByName('funcao_descricao').AsString    := 'COLABORADOR';  
          ApplyUpdates(0);

       end;

      //=======================================================================================

     //CONFIGURA��O EMPRESA CLIENTE
     dm_Conexao.cds_ListaEmpresas.Active := TRUE;
     with dm_Conexao.cds_ListaEmpresas do
     begin

        Append;
        FieldByName('id_empresa').AsInteger    := 1;
        FieldByname('empresa').AsString        := 'SISTEMA';
        ApplyUpdates(0);

     end;

      //=======================================================================================

     //CONFIGURA��O DAS PERMISSOES DA EMPRESA
     dm_Conexao.cds_Permissoes.Active := TRUE;
     with dm_Conexao.cds_Permissoes do
     begin

        Append;
        FieldByName('id_permissao').AsInteger    := 1;
        FieldByname('empresaid').AsInteger       := 1;
        ApplyUpdates(0);

     end;

      //=======================================================================================

     //CONFIGURA��O DOS PRIMEIROS CREDORES
     dm_Conexao.cds_Credores.Active := TRUE;
     with dm_Conexao.cds_Credores do
     begin

        Append;
        FieldByName('id_credor').AsInteger    := 1;
        FieldByname('credor').AsString        := 'SABESP';
        ApplyUpdates(0);

     end;

     with dm_Conexao.cds_Credores do
     begin

        Append;
        FieldByName('id_credor').AsInteger    := 2;
        FieldByname('credor').AsString        := 'ELETROPAULO';
        ApplyUpdates(0);

     end;

     with dm_Conexao.cds_Credores do
     begin

        Append;
        FieldByName('id_credor').AsInteger    := 3;
        FieldByname('credor').AsString        := 'ALUGUEL';
        ApplyUpdates(0);

     end;

   //=======================================================================================

     //CONFIGURA��O DO PRIMEIRO SEGMENTO
    dm_DadosSegundo.cds_Segmentos.Active := TRUE;
     with dm_DadosSegundo.cds_Segmentos do
     begin

        Append;
        FieldByName('id_segmento').AsInteger    := 1;
        FieldByname('segmento').AsString        := 'INFORMATICA';
        ApplyUpdates(0);

     end;

     //=======================================================================================
     //CONFIGURA��O DO PRIMEIRO CONTATO
     _Sql := 'insert into contatos (cont_id, cont_nome, cont_segid, cont_endereco, cont_bairro, cont_cep, cont_telefone1, cont_telefone2, cont_celular1, cont_celular2, cont_email, cont_datacad, cont_status, cont_obs) '+
                 'values (:cont_id, :cont_nome, :cont_segid, :cont_endereco, :cont_bairro, :cont_cep, :cont_telefone1, :cont_telefone2, :cont_celular1, :cont_celular2, :cont_email, :cont_datacad, :cont_status, :cont_obs)';

         with DM_Pesq.Qry_Auxiliar do
         begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             ParamByName('cont_id').AsInteger           :=  GerarProximoID('cont_id','contatos');
             ParamByName('cont_nome').AsString          :=  'EDI AQUINO DE SOUZA';
             ParamByName('cont_segid').AsInteger        :=  1;
             ParamByName('cont_endereco').AsString      :=  'RUA MUNIZ BARRETO, 201';
             ParamByName('cont_bairro').AsString        :=  'V.TEREZINHA';
             ParamByName('cont_cep').AsString           :=  '02846-160';
             ParamByName('cont_telefone1').AsString     :=  '3921-0669';
             ParamByName('cont_telefone2').AsString     :=  '';
             ParamByName('cont_celular1').AsString      :=  '99475-6517';
             ParamByName('cont_celular2').AsString      :=  '';
             ParamByName('cont_email').AsString         :=  'edsouzza@hotmail.com';
             ParamByName('cont_datacad').AsString       :=  DateToStr(now);
             ParamByName('cont_status').AsString        :=  'A';
             ParamByName('cont_obs').AsString           :=  'Desenvolvimento de pequenas aplicacoes para controle de clientes/fluxo de caixa e desenvolvimento de sites.';
             ExecSQL;

        end;

   //=======================================================================================
   //CONFIGURA��O DO CLIENTE VENDA BALCAO
     _Sql := 'insert into clientes (cli_id, cli_nome, cli_apelido, cli_endereco, cli_complemento, cli_datacad, cli_status, cli_obs) '+
                 'values (:cli_id, :cli_nome, :cli_apelido, :cli_endereco, :cli_complemento, :cli_datacad, :cli_status, :cli_obs)';

         with DM_Pesq.Qry_Auxiliar do
         begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             ParamByName('cli_id').AsInteger           :=  GerarProximoID('cli_id','clientes');
             ParamByName('cli_nome').AsString          :=  'VENDA BALCAO';
             ParamByName('cli_apelido').AsString       :=  'VENDA BALCAO';
             ParamByName('cli_endereco').AsString      :=  'VENDA BALCAO';
             ParamByName('cli_complemento').AsString   :=  'VENDA BALCAO';
             ParamByName('cli_datacad').AsString       :=  DateToStr(now);
             ParamByName('cli_status').AsString        :=  'A';
             ParamByName('cli_obs').AsString           :=  'Cliente balcao para vendas de produtos a clientes cadastrados';
             ExecSQL;

        end;

     //=======================================================================================

     //CONFIGURANDO FORMAS DE PAGAMENTO PELO ARRAY CONSTANT

        for I := 1 to 4 do
        begin

           _Sql := 'insert into formapagto (forma_id, forma_descricao) values (:forma_id, :forma_descricao)';

               with DM_Pesq.Qry_Auxiliar do
               begin

                   close;
                   sql.Clear;
                   sql.Add(_Sql);
                   ParamByName('forma_id').AsInteger           :=  I;
                   ParamByName('forma_descricao').AsString     :=  ListaFormasPagto[I];
                   ExecSQL;

              end;

        end;

   //========================================================================================
   //CADASTRANDO A LOGO PADRAO DO SISTEMA
    _Sql := 'insert into configuracoes (config_id, config_descricao, config_endereco, config_data) '+
             'values (:config_id, :config_descricao, :config_endereco, :config_data)';

     with DM_Pesq.Qry_Auxiliar do
     begin

         close;
         sql.Clear;
         sql.Add(_Sql);
         ParamByName('config_id').AsInteger             := 1;
         ParamByName('config_descricao').AsString       := 'LOGO PADRAO';
         ParamByName('config_endereco').AsString        := ExtractFilePath(Application.ExeName)+'imagens\padrao.jpg';           //c:\program files (x86)\syspdv\imagens\padrao.jpg';
         ParamByName('config_data').AsDate              := Now;
         ExecSQL;

    end;

    //========================================================================================
   //CONFIGURACAO INICIAL DO FRENTE DE CAIXA
    _Sql := 'insert into frente_caixa (id_frentecaixa, status) values (:pid, :status)';

     with DM_Pesq.Qry_Auxiliar do
     begin

         close;
         sql.Clear;
         sql.Add(_Sql);
         ParamByName('pid').AsInteger    := 1;
         ParamByName('status').AsString  := 'B';
         ExecSQL;

    end;

  {==========================================================================================
   POPULANDO A TABELA DE MENUS}
      ListaTextos := TStringList.Create;
      ListaTextos.Clear;     
      localArquivo := ExtractFilePath(Application.ExeName)+'\SQL_MENUS.txt';
      AssignFile(arq,localArquivo);

      {$I-}         // desativa a diretiva de Input
      Reset(arq);   // Abre o arquivo texto para leitura
      {$I+}         // ativa a diretiva de Input

      if (IOResult <> 0) then// verifica o resultado da opera��o de abertura
      begin
         showmessage('Erro na abertura do arquivo !!!')
      end else
      begin
             while (not eof(arq)) do
             begin

                 readln(arq, linha);      // L� uma linha do arquivo
                 ListaTextos.Add(linha);  // imprime a linha dentro do StringList (ListaTextos)

                 //quebrando a linha -> (1;MENUCONFIGURACOES;3;L) em um ARRAY sendo => CODIGO:ListaTextos[0] MENU:ListaTextos[1]  NIVELID:ListaTextos[2]   STATUS:ListaTextos[3]
                 ListaTextos:= Quebra(linha,';');

                 //aqui v�o os procedimentos de grava��o dos dados da linha dividida em um array
                 _Sql := 'insert into menus (codigo, menu, nivelid, status) values (:codigo, :menu, :nivelid, :status)';

                 with DM_Pesq.Qry_Auxiliar do
                 begin

                     close;
                     sql.Clear;
                     sql.Add(_Sql);
                     ParamByName('codigo').AsInteger    := StrToInt(ListaTextos[0]);
                     ParamByName('menu').AsString       := ListaTextos[1];
                     ParamByName('nivelid').AsInteger   := StrToInt(ListaTextos[2]);
                     ParamByName('status').AsString     := ListaTextos[3];
                     ExecSQL;

                 end;

              end;

             CloseFile(arq); // Fecha o arquivo texto aberto
      end;

  //==========================================================================================

  Application.MessageBox('Executada configura��o inicial do Sistema!',
               'Seja bem vindo!', MB_OK + MB_ICONASTERISK);


     dm_Conexao.cds_DadosFuncionarios.Active := false;
     dm_DadosSegundo.cds_Login.Active        := false;
     dm_DadosSegundo.cds_CadFuncoes.Active   := false;
     dm_Conexao.cds_ListaEmpresas.Active     := false;
     dm_DadosSegundo.cds_Segmentos.Active    := false;
     dm_Conexao.cds_Credores.Active          := false;
     
end;

procedure T_frmLogin.IdentificarEmpresaUsuariaDoSistema;
begin

     with DM_Pesq.Qry_Geral do
     begin

         close;
         sql.Clear;
         sql.Add('SELECT razaosocial FROM empresa');
         open;

         if not IsEmpty then
         begin

             NomeEmpresaLogada      := DM_Pesq.Qry_Geral.Fields[0].AsString;
             idEmpresaLogada        := 2;
             pnl_cabecalho.Caption  := NomeEmpresaLogada;
             
         end else pnl_cabecalho.Caption :=  'ACESSO AO SISTEMA';

     end;

       //gravando o id da empresa na tabela permissoes
       dm_Conexao.cds_Permissoes.ApplyUpdates(0);

end;

Function T_frmLogin.getIDUsuarioLogado:integer;
var
   nomeOperador : string;
begin

     IDOperador   := IdFuncionarioLogado(usuario);
     nomeOperador := RetornaNomeUsuarioLogado(IDOperador);
     Result       := IDOperador;

end;

procedure T_frmLogin.edt_SenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if key=13 then
     begin

         btn_EntrarClick(self);

     end;

end;

procedure T_frmLogin.edt_SenhaEnter(Sender: TObject);
begin

   if(  usuario = '' ) then
   begin

    Application.MessageBox('Selecione um usu�rio na lista ao acima!', 'Usu�rio n�o selecionado!',
                 MB_OK + MB_ICONWARNING);   
    edt_Senha.Enabled := false;

   end else begin

      if (SenhaInicialEncontrada)then
      begin
          edt_Senha.Enabled:=false;
           // Usaremos PostMessage para enviar a mensagem em caixa alta
          PostMessage(Handle, InputBoxMsg, 0, 0);
          novasenha := InputBox('Cadastro de Senha de Acesso','Senha','');
          //ShowMessage('A senha cadastrada foi: ' + novasenha);

          AlterarSenha;
          //aqui o sistema recebeu a senha digitada pelo usu�rio
      end;

   end;

end;

procedure T_frmLogin.edt_SenhaKeyPress(Sender: TObject; var Key: Char);
begin
  btn_Entrar.Enabled := true;   
end;

procedure T_frmLogin.GravarExpiracaoSeTabelaVazia;
begin

  //caso a tabela de expira��o esteja vazia gerar data de expira��o com data vencida o campo INFO nem foi tratado ou seja estar� vazio
  _Sql := 'insert into expiracao (id_dia, dt_atual, dt_expiracao, acesso) values (:id_dia, :dt_atual, :dt_expiracao, :acesso)';

   with DM_Pesq.Qry_Auxiliar do
   begin

       close;
       sql.Clear;
       sql.Add(_Sql);
       ParamByName('id_dia').AsInteger           :=  1;
       ParamByName('dt_atual').AsDateTime        :=  date;
       ParamByName('dt_expiracao').AsDateTime    :=  StrToDate('01/01/2000');
       ParamByName('acesso').AsInteger           :=  0;
       ExecSQL;

  end;

end;

procedure T_frmLogin.MudarBancoParaSysPdv;
begin
      //Arquivo INI criado dinamicamente para uso nesta procedure
      caminhoBanco :='C:\Meus Documentos\Bancos_De_Projetos\SysPdv\SYSPDV.FDB';
      caminhoIni   := ExtractFilePath(Application.ExeName)+'config.ini';
      config       := TIniFile.Create(caminhoIni);

      config.WriteString('SYSPDV','DATABASE', caminhoBanco);
      config.WriteString('SYSPDV','USER', 'sysdba');
      config.WriteString('SYSPDV','PASSWORD', 'masterkey');

      With dm_Conexao.conexao_dados do
      begin

        try

            Connected                 := false;
            ConnectionName            :='SYSPDV'; //Nome do Driver v�lido ***
            LoadParamsOnConnect       := False;
            Params.Values['DATABASE'] := config.ReadString('SYSPDV','DATABASE','');
            DriverName                :='FIREBIRD';
            Connected                 := True;
            LoadParamsFromIniFile(ExtractFilePath(Application.ExeName)+'config.ini');
            texto := 'Conectado a '+retornarNomeBancoSetado(caminhoBanco)+' com sucesso!';
            Application.MessageBox(Pchar(texto), 'Novo banco setado!',MB_OK + MB_ICONEXCLAMATION);
            //showmessage(Params.Text);
            config.Free;

        except
        ShowMessage('Erro ao conectar a nova base de dados! Contate o suporte.');
        end;
      end;

      gravarNovoBancoSetado(caminhoBanco);
      dm_DadosSegundo.cds_Login.Active:=false;
      dm_DadosSegundo.cds_Login.Active:=true;
      self.Caption:= retornarNomeBancoSetado(caminhoBanco);

end;

procedure T_frmLogin.MudarBancoParaSysDesenv;
begin
      //Arquivo INI criado dinamicamente para uso nesta procedure
      caminhoBanco :='C:\Meus Documentos\Bancos_De_Projetos\SysPdv\SYSDESENV.FDB';
      caminhoIni   := ExtractFilePath(Application.ExeName)+'config.ini';
      config       := TIniFile.Create(caminhoIni);

      config.WriteString('SYSPDV','DATABASE', caminhoBanco);
      config.WriteString('SYSPDV','USER', 'sysdba');
      config.WriteString('SYSPDV','PASSWORD', 'masterkey');

      With dm_Conexao.conexao_dados do
      begin

        try

            Connected                 := false;
            ConnectionName            :='SYSPDV'; //Nome do Driver v�lido ***
            LoadParamsOnConnect       := False;
            Params.Values['DATABASE'] := config.ReadString('SYSPDV','DATABASE','');
            DriverName                :='FIREBIRD';
            Connected                 := True;
            LoadParamsFromIniFile(ExtractFilePath(Application.ExeName)+'config.ini');
            texto := 'Conectado a '+retornarNomeBancoSetado(caminhoBanco)+' com sucesso!';
            Application.MessageBox(Pchar(texto), 'Novo banco setado!',MB_OK + MB_ICONEXCLAMATION);
            //showmessage(Params.Text);
            config.Free;

        except
        ShowMessage('Erro ao conectar a nova base de dados! Contate o suporte.');
        end;
      end;

      gravarNovoBancoSetado(caminhoBanco);
      dm_DadosSegundo.cds_Login.Active:=false;
      dm_DadosSegundo.cds_Login.Active:=true;
      self.Caption:= retornarNomeBancoSetado(caminhoBanco);

end;

procedure T_frmLogin.SYSDESENVClick(Sender: TObject);
begin

    MudarbancoParaSysDesenv;

end;

procedure T_frmLogin.SYSPDVClick(Sender: TObject);
begin

    MudarBancoParaSysPdv;

end;

procedure T_frmLogin.edt_SenhaChange(Sender: TObject);
begin

   CentralizarDigitacao(edt_Senha);

end;

end.
