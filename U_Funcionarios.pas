unit U_Funcionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ToolEdit, RXDBCtrl, Math, DB;

type
  T_frmFuncionarios = class(TForm)
    pan_titulo: TPanel;
    pan_botoes: TPanel;
    btnCadastros: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnInativar: TSpeedButton;
    btnSair: TSpeedButton;
    btnimprimir: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    pnl_inclusao: TPanel;
    grp_DadosDoFunc: TGroupBox;
    lbl11: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl15: TLabel;
    lbl35: TLabel;
    msk_cep: TMaskEdit;
    edt_nome: TEdit;
    edt_endereco: TEdit;
    edt_complemento: TEdit;
    edt_DataCadastro: TEdit;
    grp4: TGroupBox;
    btnConfirmaInclusao: TSpeedButton;
    btnRetornarDaInclusao: TSpeedButton;
    btnCancelarInclusao: TSpeedButton;
    pnl_alteracao: TPanel;
    grp2: TGroupBox;
    lbl10: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl34: TLabel;
    dbedtFUNC_NOME: TDBEdit;
    dbedtFUNC_ENDERECO1: TDBEdit;
    dbedtFUNC_COMPLEMENTO1: TDBEdit;
    dbedtFUNC_EMAIL1: TDBEdit;
    dbedtFUNC_DATACAD2: TDBEdit;
    msk_cep2: TMaskEdit;
    combo_Altera_Status: TComboBox;
    grp3: TGroupBox;
    btnConfirmaAlteracao: TSpeedButton;
    btnRetornarDaAlteracao: TSpeedButton;
    btnCancelarAlteracao: TSpeedButton;
    pnl_visualizacao: TPanel;
    lbl1: TLabel;
    lbl9: TLabel;
    lbl7: TLabel;
    lbl2: TLabel;
    lbl6: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl28: TLabel;
    lblFone: TLabel;
    dbgrd_Funcionarios: TDBGrid;
    dbedtFUNC_DATACAD: TDBEdit;
    dbedtFUNC_APELIDO: TDBEdit;
    dbedtFUNC_NOME1: TDBEdit;
    dbedtFUNC_ENDERECO: TDBEdit;
    dbedtFUNC_DATANASCTO: TDBEdit;
    dbedtFUNC_CEP: TDBEdit;
    dbedtFUNC_COMPLEMENTO: TDBEdit;
    dbedtFUNC_EMAIL: TDBEdit;
    dbedtFUNC_ID: TDBEdit;
    db_Mostra_Funcao: TDBLookupComboBox;
    dbFUNC_FUNCAOID: TDBLookupComboBox;
    lstEscolheTipoRel: TListBox;
    lblStatusLogoff: TLabel;
    lbl49: TLabel;
    db_FUNC_ID: TDBEdit;
    db_FUNCAOID: TDBEdit;
    edt_IncluirUsuario: TEdit;
    lbl50: TLabel;
    lbl51: TLabel;
    edt_UsuarioParaAlteracao: TEdit;
    pnl_Periodo: TPanel;
    lbl52: TLabel;
    lbl53: TLabel;
    btnFechar: TSpeedButton;
    edt_DataInicio: TDateEdit;
    edt_DataFim: TDateEdit;
    btnPesquisar: TSpeedButton;
    msk_DataNascto: TDateEdit;
    msk_dtNasc: TDBDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    dbedtFUNC_FONE: TDBEdit;
    dbedtDDD_FONE: TDBEdit;
    dbedtFUNC_FONE2: TDBEdit;
    dbedtDDD_FONE2: TDBEdit;
    dbedtFUNC_FONE3: TDBEdit;
    dbedtDDD_FONE3: TDBEdit;
    dbedtFUNC_FONE4: TDBEdit;
    dbedtDDD_FONE4: TDBEdit;
    lbl16: TLabel;
    lblFones: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    edt_email: TEdit;
    msk_Fone: TMaskEdit;
    edt_dddfone: TEdit;
    edt_dddfone2: TEdit;
    edt_dddfone3: TEdit;
    edt_dddfone4: TEdit;
    msk_Fone2: TMaskEdit;
    msk_Fone3: TMaskEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label28: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    msk_tel2: TMaskEdit;
    msk_tel3: TMaskEdit;
    msk_tel4: TMaskEdit;
    msk_tel: TMaskEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    GroupBox9: TGroupBox;
    edtConsFunc: TEdit;
    btnSenhas: TSpeedButton;
    msk_Fone4: TMaskEdit;
    txtMsg: TStaticText;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInativarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCadastrosClick(Sender: TObject);
    procedure btnConfirmaInclusaoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarInclusaoClick(Sender: TObject);
    procedure btnRetornarDaAlteracaoClick(Sender: TObject);
    procedure GravaRegs;
    procedure btnConfirmaAlteracaoClick(Sender: TObject);
    procedure Limpar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BancoParaEdts;
    procedure GravarAlteracoes;
    procedure edt_nomeChange(Sender: TObject);
    procedure dbedtFUNC_NOMEChange(Sender: TObject);
    procedure dbedtFUNC_APELIDO1Change(Sender: TObject);
    procedure dbedtFUNC_ENDERECO1Change(Sender: TObject);
    procedure msk_cep2Change(Sender: TObject);
    procedure btnCancelarAlteracaoClick(Sender: TObject);
    procedure HabilitarBotoes;
    procedure DesabilitarBotoes;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure AbrirCadastroDeSenhas;
    procedure msk_cep2KeyPress(Sender: TObject; var Key: Char);
    procedure dbedtFUNC_STATUS2KeyPress(Sender: TObject; var Key: Char);
    procedure msk_cepKeyPress(Sender: TObject; var Key: Char);
    procedure edt_statusKeyPress(Sender: TObject; var Key: Char);
    procedure combo_Altera_StatusChange(Sender: TObject);
    procedure Abrir_Fechar_Tabelas;
    procedure Combo_Altera_FuncaoClick(Sender: TObject);
    procedure dbFUNC_FUNCAOIDClick(Sender: TObject);
    procedure edt_nomeExit(Sender: TObject);
    procedure lstEscolheTipoRelClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure edt_IncluirUsuarioExit(Sender: TObject);
    procedure btnSairPermissoesClick(Sender: TObject);
    procedure edt_UsuarioParaAlteracaoChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edt_DataFimKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PesquisarPeriodo;
    procedure edt_comissaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnRetornarDaInclusaoClick(Sender: TObject);
    procedure MostrarFuncionarioTelaInicial;
    procedure FormShow(Sender: TObject);
    procedure ClassificarPorNome;
    procedure msk_dtNascButtonClick(Sender: TObject);
    procedure msk_dtNascChange(Sender: TObject);
    procedure edtConsFuncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FiltrarPorNome;
    procedure PopularDBMostraFuncoesParaAdminSistema;
    procedure PopularDBMostraFuncoesParaUsuariosComuns;
    procedure edtConsFuncChange(Sender: TObject);
    procedure btnSenhasClick(Sender: TObject);
    procedure dbedtFUNC_NOMEExit(Sender: TObject);
    procedure dbgrd_FuncionariosCellClick(Column: TColumn);
    procedure edt_apelidoEnter(Sender: TObject);
    procedure msk_FoneChange(Sender: TObject);
    procedure msk_Fone2Change(Sender: TObject);
    procedure msk_Fone3Change(Sender: TObject);
    procedure msk_Fone4Change(Sender: TObject);
    procedure msk_cepChange(Sender: TObject);
    procedure AtualizaQde;
    procedure edt_nomeEnter(Sender: TObject);
    procedure edt_IncluirUsuarioEnter(Sender: TObject);
    


  private
    { Private declarations }
    proxNumFunc, proxNumLogin, intFunc, idFuncSelecionado : integer;

  public
    { Public declarations }

  end;

var
  _frmFuncionarios: T_frmFuncionarios;
  proxNum, proxNumLogin, proxNumPermissao, proxNumFuncIdLogin, cont : Integer;


implementation

uses U_dmDados, U_dmDadosSegundo,
  U_dmPesquisas, U_BiblioSysSalao, U_QRelFuncCompleto, U_QRelFuncParcial,
  U_Login, U_CadSenhaUsuario, U_principal,  DBClient,
  U_QRelLogAcessos, U_ReiniciarSenhaUsuario;

{$R *.dfm}


procedure T_frmFuncionarios.FormCreate(Sender: TObject);
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
    edt_DataCadastro.Text   := DateToStr(now);
    lblDataDoDia.Caption    := DateToStr(date);
    lblHoraAtual.Caption    := timetoStr(time);
    lblStatusLogoff.Caption := IdentificarUsuarioLogado;
    AbrirTabelas;


end;

procedure T_frmFuncionarios.FormShow(Sender: TObject);
begin

     pan_titulo.Caption:= 'Controle de Funcionários - Visualizando...';
     AbrirTabelas;
     MostrarFuncionarioTelaInicial;
     edtConsFunc.SetFocus;
     AtualizaQde;

end;


procedure T_frmFuncionarios.AbrirTabelas;
begin

    dm_Conexao.cds_DadosFuncionarios.Active      := True;
    dm_DadosSegundo.cds_CadFuncoes.Active        := True;
    DM_Pesq.cdsPesqLogin.Active                  := true;

end;

procedure T_frmFuncionarios.FecharTabelas;
begin

    dm_Conexao.cds_DadosFuncionarios.Active      := False;
    dm_DadosSegundo.cds_CadFuncoes.Active        := False;
    DM_Pesq.cdsPesqLogin.Active                  := false;
    
end;


procedure T_frmFuncionarios.Abrir_Fechar_Tabelas;
begin

    dm_Conexao.cds_DadosFuncionarios.Active      := False;
    dm_Conexao.cds_DadosFuncionarios.Active      := True;

    dm_DadosSegundo.cds_CadFuncoes.Active        := False;
    dm_DadosSegundo.cds_CadFuncoes.Active        := True;

end;


procedure T_frmFuncionarios.btnInativarClick(Sender: TObject);
begin

       if dm_Conexao.cds_DadosFuncionarios.RecordCount = 0 then begin

            Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);

        end
        else begin

          DesabilitarBotoes;
          pan_titulo.Caption:= 'Controle de Funcionários - Inativando...';

          texto:= 'Confirma o desejo de inativar o Funcionário '+dbedtFUNC_NOME1.Text+ '?';

          if Application.MessageBox(PChar(texto),'Inativar Funcionário',MB_YESNO + MB_ICONQUESTION) = IdYes then
          begin

              _Sql := 'UPDATE funcionarios SET func_status = '+QuotedStr('I')+' WHERE func_id = :pIDFunc';

               with DM_Pesq.Qry_Geral do
               begin

                   close;
                   sql.Clear;
                   sql.Add(_Sql);
                   Params.ParamByName('pIDFunc').AsInteger :=  StrToInt(dbedtFUNC_ID.Text);
                   ExecSQL;

               end;

                _Sql := 'UPDATE login SET status = '+QuotedStr('I')+' WHERE func_id = :pIDFunc';

               with DM_Pesq.Qry_Geral do
               begin

                   close;
                   sql.Clear;
                   sql.Add(_Sql);
                   Params.ParamByName('pIDFunc').AsInteger :=  StrToInt(dbedtFUNC_ID.Text);
                   ExecSQL;

               end;

              Application.MessageBox('O Funcionário foi inativado com sucesso!',
              'Inativo', MB_OK);

              Abrir_Fechar_Tabelas;
              AtualizaQde;
              pan_titulo.Caption:= 'Controle de Funcionários - Visualizando...';
              HabilitarBotoes;
              btnInativar.Enabled:=false;

          end else begin

              dm_Conexao.cds_DadosFuncionarios.CancelUpdates;
              pan_titulo.Caption:= 'Controle de Funcionários - Visualizando...';
              HabilitarBotoes;

         end;

      end;

      Abrir_Fechar_Tabelas;
end;


procedure T_frmFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  FecharTabelas;
  Release;

end;

procedure T_frmFuncionarios.btnCadastrosClick(Sender: TObject);

begin

     edt_nome.SetFocus;
     pan_titulo.Caption:= 'Controle de Funcionários - Incluindo...';
     pnl_visualizacao.SendToBack;
     pnl_inclusao.BringToFront;
     DesabilitarBotoes;
     dbgrd_Funcionarios.Enabled  := True;

     //DEFININDO O QUE SERA MOSTRADO NOS DBMOSTRAFUNCOES DE ACORDO COM O NIVEL DE FUNCAO
      if (NivelFuncao = 1) or (NivelFuncao = 2)then
            PopularDBMostraFuncoesParaAdminSistema
      else
            PopularDBMostraFuncoesParaUsuariosComuns;      

end;

procedure T_frmFuncionarios.AbrirCadastroDeSenhas;
begin
      
      Application.CreateForm(T_frmCadSenhaUsuario,  _frmCadSenhaUsuario);
      _frmCadSenhaUsuario.ShowModal;
      FreeAndNil(_frmCadSenhaUsuario);

end;

procedure T_frmFuncionarios.btnSenhasClick(Sender: TObject);
begin
       //RECEBE O ID DO FUNCIONARIO SELECIONADO PARA SER MOSTRADO NO GRID DE NOMES PRA SER REINICIADO A SENHA
       idUsuarioSelecionado       := StrToInt(dbedtFUNC_ID.Text);

       //FAZER VERIFICACAO : O USUARIO COMUM NAO PODE REINICIAR A SENHA DE NINGUEM SOMENTE A SUA PROPRIA

       //VERIFICO PRIMEIRO QUAL O ID DA FUNCAO DE QUEM ESTA LOGADO
        _Sql := 'SELECT func_funcaoid FROM funcionarios WHERE func_id = :pIDFUNC';

      with DM_Pesq.Qry_Geral do
        begin

          Close;
          SQL.Clear;
          SQL.Add(_Sql);
          Params.ParamByName('pIDFUNC').AsInteger  := IdDoUsuarioLogado;
          Open;

          if not IsEmpty then
              begin

                   intFunc :=  DM_Pesq.Qry_Geral.FieldByName('func_funcaoid').AsInteger;

              end;


        end;
       //ShowMessage('ID FUNCAO DO USUARIO LOGADO : '+IntToStr(intFunc));
       //ShowMessage('ID DO USUARIO LOGADO : '+IntToStr(IdDoUsuarioLogado));


       //CASO SEJA ADMINISTRADOR ESTARA LIBERADO PARA ALTERAÇÃO DE SENHAS => CASO SEJA USUARIO SOMENTE TERÁ ACESSO A SUA PROPRIA SENHA PARA ALTERAÇÃO
       if( intFunc = 2 )then
       begin

             Application.CreateForm(T_frmReiniciarSenhaUsuario,  _frmReiniciarSenhaUsuario);
            _frmReiniciarSenhaUsuario.ShowModal;
            FreeAndNil(_frmReiniciarSenhaUsuario);

            LogOperacoes(NomeDoUsuarioLogado, 'acesso a alteração de senha');

       end else if( (intFunc > 2) AND (IdDoUsuarioLogado = StrToInt(dbedtFUNC_ID.Text)) )then
       begin

             Application.CreateForm(T_frmReiniciarSenhaUsuario,  _frmReiniciarSenhaUsuario);
            _frmReiniciarSenhaUsuario.ShowModal;
            FreeAndNil(_frmReiniciarSenhaUsuario);

            LogOperacoes(NomeDoUsuarioLogado, 'acesso a alteração de senha');

       end else
       begin

            messagedlg('Atenção você só tem permissão para atualizar sua própria senha!',mtwarning,[mbyes],0);

       end;

end;


procedure T_frmFuncionarios.btnConfirmaInclusaoClick(Sender: TObject);
begin

  if ( edt_nome.Text = '') or ( edt_IncluirUsuario.Text = '') then
  begin

       Application.MessageBox('Preencha os campos para incluir um novo funcionário!', 'Campos vazios', MB_OK);
       edt_nome.SetFocus;

  end else begin

     GravaRegs;
     LogOperacoes(NomeDoUsuarioLogado, 'cadastro de novo funcionário');
     //Limpar;
     DesabilitarBotoes;
     //db_Mostra_Funcao.KeyValue     := 2;
     btnRetornarDaInclusao.Enabled := true;
     //AtualizaQde;
     //Abrir_Fechar_Tabelas;
     AbrirCadastroDeSenhas;

  end;

end;


procedure T_frmFuncionarios.GravaRegs;
var
  idFuncao : integer;
begin

    proxNumFunc        := 0;
    proxNumLogin       := 0;

    idFuncao := RetornaIDPassandoString('funcao_id','funcoes','funcao_descricao', db_Mostra_Funcao.Text);

    //GRAVANDO O FUNCIONARIO NA TBL FUNCIONARIOS
    With DM_Pesq.qry_Cod do begin

        Close;
        SQL.Clear;
        SQL.Add('select max(func_id) from Funcionarios');
        Open;

        if not IsEmpty then begin

           proxNumFunc           := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;
           idUsuarioSelecionado  := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

        end;

     end;


     with dm_Conexao.cds_DadosFuncionarios do
     begin

         Append;

        //PARA ACEITAR DATA VAZIA AO CADASTRAR
        if not (msk_DataNascto.Text = '  /  /    ') then
              FieldByName('func_datanascto').AsDateTime  := StrToDate(msk_DataNascto.Text)
        else
              FieldByName('func_datanascto').Clear;

        FieldByName('func_id').AsInteger           := proxNumFunc;
        FieldByname('func_nome').AsString          := edt_nome.Text;
        FieldByname('func_apelido').AsString       := edt_IncluirUsuario.Text;
        FieldByname('func_endereco').AsString      := edt_endereco.Text;
        FieldByname('func_complemento').AsString   := edt_complemento.Text;
        FieldByname('func_cep').AsString           := msk_cep.Text;
        FieldByname('func_dddfone').AsString       := edt_dddfone.Text;
        FieldByname('func_fone').AsString          := msk_fone.Text;
        FieldByname('func_dddfone2').AsString      := edt_dddfone2.Text;
        FieldByname('func_fone2').AsString         := msk_fone2.Text;
        FieldByname('func_dddfone3').AsString      := edt_dddfone3.Text;
        FieldByname('func_fone3').AsString         := msk_fone3.Text;
        FieldByname('func_dddfone4').AsString      := edt_dddfone4.Text;
        FieldByname('func_fone4').AsString         := msk_fone4.Text;
        FieldByname('func_email').AsString         := edt_email.Text;
        FieldByname('func_datacad').AsString       := edt_DataCadastro.Text;
        FieldByname('func_status').AsString        := 'A';
        FieldByname('func_funcaoid').AsInteger     := idFuncao;

        ApplyUpdates(0);


     end;
 
     //==============================================//        


      //GRAVANDO O USUARIO E FUNCAO DE PERMISSAO NA TBL LOGIN

      DM_Pesq.cdsPesqLogin.Active := TRUE;

      With DM_Pesq.Qry_Geral do begin

        Close;
        SQL.Clear;
        SQL.Add('select max(id_usuario) from login');
        Open;

        if not IsEmpty then begin

           proxNumLogin := DM_Pesq.Qry_Geral.Fields[0].AsInteger + 1;

        end;

      end;


       with dm_DadosSegundo.cds_Login do
       begin

          Append;

          FieldByName('id_usuario').AsInteger     := proxNumLogin;
          FieldByName('func_id').AsInteger        := proxNumFunc;                   // ESTE É O FUNC_ID_1
          FieldByName('id_funcao').AsInteger      := idFuncao;                      //StrToInt(dbedtFUNCAO_ID.text); //se nao escolher nada entra como ADMINISTRADOR
          FieldByName('usuario').AsString         := edt_IncluirUsuario.Text;
          FieldByName('senha').AsString           := '';
          FieldByName('status').AsString          := 'A';

          ApplyUpdates(0);

       end;

       AtualizaQde;
       Limpar;
       Abrir_Fechar_Tabelas;

end;


procedure T_frmFuncionarios.btnAlterarClick(Sender: TObject);
begin
 intFunc := 0;

 if dm_Conexao.cds_DadosFuncionarios.RecordCount = 0 then
 begin

    Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);
    exit;

  end
  else begin

         //ATUALIZANDO O USUARIO NO LOGIN ATRAVES DO ID
         With DM_Pesq.Qry_Geral do begin

           close;
           sql.Clear;
           sql.Add('SELECT func_id, usuario FROM login WHERE func_id = :pIdFunc');
           Params.ParamByName('pIdFunc').AsInteger      := StrToInt(db_FUNC_ID.text);
           open;

           if not IsEmpty then
           begin

               edt_UsuarioParaAlteracao.Text :=  DM_Pesq.Qry_Geral.Fields[1].Value;

           end;


        end;

          pan_titulo.Caption:= 'Controle de Funcionários - Alterando...';
          pnl_visualizacao.SendToBack;
          pnl_alteracao.BringToFront;

          BancoParaEdts;
          DesabilitarBotoes;
          dbedtFUNC_NOME.SetFocus;
          btnRetornarDaAlteracao.Enabled:= true;

     end;


    _Sql := 'SELECT func_id, func_funcaoid FROM funcionarios WHERE func_id = :pIDFUNC';

    with DM_Pesq.Qry_Geral do
      begin

        Close;
        SQL.Clear;
        SQL.Add(_Sql);
        Params.ParamByName('pIDFUNC').AsInteger  := StrToInt(dbedtFUNC_ID.Text);
        Open;

        if not IsEmpty then
            begin

                 intFunc :=  DM_Pesq.Qry_Geral.FieldByName('func_funcaoid').AsInteger;

            end;


      end;

      //ShowMessage('O ID DA FUNCAO DESTE FUNCIONARIO É : '+IntToStr(intFunc));

     //DEFININDO O QUE SERA MOSTRADO NOS DBMOSTRAFUNCOES DE ACORDO COM O NIVEL DE FUNCAO
      if (NivelFuncao = 1) or (NivelFuncao = 2)then
            PopularDBMostraFuncoesParaAdminSistema
      else
            PopularDBMostraFuncoesParaUsuariosComuns;


end;

procedure T_frmFuncionarios.btnCancelarInclusaoClick(Sender: TObject);
begin

    dm_Conexao.cds_DadosFuncionarios.Cancel;
    Limpar;
    btnRetornarDaInclusao.Enabled := true;
    btnConfirmaInclusao.Enabled   := False;
    btnCancelarInclusao.Enabled   := false;

end;


procedure T_frmFuncionarios.btnRetornarDaAlteracaoClick(Sender: TObject);
begin

      pnl_visualizacao.BringToFront;
      pan_titulo.Caption:= 'Controle de Funcionários - Visualizando...';
      //DesabilitarBotoesParcialmente;

end;

procedure T_frmFuncionarios.Limpar;
var
  i : Integer;
begin

      //Limpando os Edits e Masks
      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TEdit)then
              (Components[i] as TEdit).Clear;

      end;

      msk_cep.Text              := '#####-###;1;_';
      msk_Fone.Text             := '####-####;1;_';
      msk_Fone2.Text            := '####-####;1;_';
      msk_Fone3.Text            := '####-####;1;_';
      msk_Fone4.Text            := '#####-####;1;_';
      msk_DataNascto.Text       := '';
      edt_DDDFONE.Text          := '011';
      edt_DDDFONE2.Text         := '011';
      edt_DDDFONE3.Text         := '011';
      edt_DDDFONE4.Text         := '011';
      edt_DataCadastro.Text     := DateToStr(now);
      edt_nome.SetFocus;
      pan_titulo.Caption:= 'Controle de Funcionários - Incluindo...';
      db_Mostra_Funcao.KeyValue := 0;

end;

procedure T_frmFuncionarios.GravarAlteracoes;
begin
         dm_DadosSegundo.cds_Login.Active := true;
         
         with dm_Conexao.cds_DadosFuncionarios do
         begin

              // Mostrando os dados do Banco nos Edits para alteração apenas das mascaras
            Edit;
            FieldByname('func_funcaoid').AsInteger   := StrToInt(db_FUNCAOID.text);
            FieldByname('func_fone').AsString        := msk_tel.Text;
            FieldByname('func_fone2').AsString       := msk_tel2.Text;
            FieldByname('func_fone3').AsString       := msk_tel3.Text;
            FieldByname('func_fone4').AsString       := msk_tel4.Text;
            FieldByname('func_cep').AsString         := msk_cep2.Text;
            FieldByname('func_status').AsString      := combo_Altera_Status.Text;
            FieldByname('func_apelido').AsString     := edt_UsuarioParaAlteracao.Text;

         end;


         //ATUALIZANDO O USUARIO NO LOGIN ATRAVES DO ID
         With DM_Pesq.Qry_Geral do begin

           close;
           sql.Clear;
           sql.Add('UPDATE login SET usuario = :pNovoUsuario, id_funcao = :pIDFuncao WHERE func_id = :pIdFunc');
           Params.ParamByName('pNovoUsuario').AsString  := edt_UsuarioParaAlteracao.Text;
           Params.ParamByName('pIdFunc').AsInteger      := StrToInt(db_FUNC_ID.text);
           Params.ParamByName('pIDFuncao').AsInteger    := StrToInt(db_FUNCAOID.text);
           ExecSQL();

        end;

         dm_Conexao.cds_DadosFuncionarios.ApplyUpdates(0);
         dm_DadosSegundo.cds_Login.ApplyUpdates(0);
         Abrir_Fechar_Tabelas;

         Application.MessageBox('Alterações feitas com sucesso!', 'OK!',
             MB_OK + MB_ICONWARNING);


end;



procedure T_frmFuncionarios.btnConfirmaAlteracaoClick(Sender: TObject);
begin

   GravarAlteracoes;
   LogOperacoes(NomeDoUsuarioLogado, 'alteração nos dados de funcionário cadastrado');
   pnl_visualizacao.BringToFront;
   pan_titulo.Caption:= 'Controle de Funcionários - Visualizando...';
   //DesabilitarBotoesParcialmente;

end;



procedure T_frmFuncionarios.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmFuncionarios.BancoParaEdts;
begin

     // Mostrando os dados do Banco nos Edits para Alteração
     msk_tel.Text                 := dm_Conexao.cds_DadosFuncionarios.FieldByname('func_fone').AsString;
     msk_tel2.Text                := dm_Conexao.cds_DadosFuncionarios.FieldByname('func_fone2').AsString;
     msk_tel3.Text                := dm_Conexao.cds_DadosFuncionarios.FieldByname('func_fone3').AsString;
     msk_tel4.Text                := dm_Conexao.cds_DadosFuncionarios.FieldByname('func_fone4').AsString;
     msk_cep2.Text                := dm_Conexao.cds_DadosFuncionarios.FieldByname('func_cep').AsString;
     combo_Altera_Status.Text     := dm_Conexao.cds_DadosFuncionarios.FieldByname('func_status').AsString;

end;



procedure T_frmFuncionarios.edt_nomeChange(Sender: TObject);
begin

    btnCancelarInclusao.Enabled   := True;
    btnRetornarDaInclusao.Enabled := False;


end;

procedure T_frmFuncionarios.dbedtFUNC_NOMEChange(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled   := True;  //habilitando o botao de confirmacao de alteracao
    btnCancelarAlteracao.Enabled   := True;
    btnRetornarDaAlteracao.Enabled :=False;

end;

procedure T_frmFuncionarios.dbedtFUNC_APELIDO1Change(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled   := True;   //habilitando o botao de confirmacao de alteracao
    btnCancelarAlteracao.Enabled   := True;
    btnRetornarDaAlteracao.Enabled :=False;

end;

procedure T_frmFuncionarios.dbedtFUNC_ENDERECO1Change(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled   := True;   //habilitando o botao de confirmacao de alteracao
    btnCancelarAlteracao.Enabled   := True;
    btnRetornarDaAlteracao.Enabled :=False;

end;

procedure T_frmFuncionarios.msk_cep2Change(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled   := True;   //habilitando o botao de confirmacao de alteracao
    btnCancelarAlteracao.Enabled   := True;
    btnRetornarDaAlteracao.Enabled :=False;

end;


procedure T_frmFuncionarios.btnCancelarAlteracaoClick(Sender: TObject);
begin

    dm_Conexao.cds_DadosFuncionarios.Cancel;
    pnl_inclusao.SendToBack;
    btnRetornarDaAlteracao.Enabled:= true;
    btnConfirmaAlteracao.Enabled:= False;
    btnCancelarAlteracao.Enabled:= false;
    dbedtFUNC_NOME.SetFocus;

end;


procedure T_frmFuncionarios.btnSairClick(Sender: TObject);
begin

    close;
    HabilitarBotoes;
    release;

end;


procedure T_frmFuncionarios.HabilitarBotoes;
var
  i : Integer;
begin

       //Habilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= true;
      end;


      btnRetornarDaInclusao.Enabled:= True;
      btnConfirmaAlteracao.Enabled:= true;

end;

procedure T_frmFuncionarios.DesabilitarBotoes;
var
  i : Integer;
begin

   //Desabilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= false;
      end;

      btnRetornarDaInclusao.Enabled:= True;
      
end;

procedure T_frmFuncionarios.msk_cep2KeyPress(Sender: TObject;
  var Key: Char);
begin
         // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmFuncionarios.dbedtFUNC_STATUS2KeyPress(Sender: TObject;
  var Key: Char);
begin

        // PARA DBEDIT ACEITAR APENAS LETRAS
       if not (Key in['A'..'Z',#8]) and not (Key in['a'..'z',#8]) then
        begin
          Key := #0;
       end;

end;

procedure T_frmFuncionarios.msk_cepKeyPress(Sender: TObject;
  var Key: Char);
begin
         // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmFuncionarios.edt_statusKeyPress(Sender: TObject;
  var Key: Char);
begin

        // PARA DBEDIT ACEITAR APENAS LETRAS
       if not (Key in['A'..'Z',#8]) and not (Key in['a'..'z',#8]) then
        begin
          Key := #0;
       end;

end;

procedure T_frmFuncionarios.combo_Altera_StatusChange(Sender: TObject);
begin

  btnConfirmaAlteracao.Enabled:= True;  //habilitando o botao de confirmacao de inclusao
  btnCancelarAlteracao.Enabled:= True;
  btnRetornarDaAlteracao.Enabled:= False;

end;


procedure T_frmFuncionarios.Combo_Altera_FuncaoClick(Sender: TObject);
begin

   btnConfirmaAlteracao.Enabled   := True;
   btnCancelarAlteracao.Enabled   := True;
   btnRetornarDaAlteracao.Enabled := True;

end;

procedure T_frmFuncionarios.dbFUNC_FUNCAOIDClick(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled:= True;

end;

procedure T_frmFuncionarios.edt_nomeExit(Sender: TObject);
begin

   VerificarDuplicidade(dm_Conexao.cds_DadosFuncionarios, 'func_nome', edt_nome);
   NomeUsuarioParaNovaSenha  := edt_nome.Text;
   db_Mostra_Funcao.KeyValue := 3;
   db_Mostra_Funcao.Enabled  := true;
   edt_IncluirUsuario.Text := edt_nome.Text;

end;

procedure T_frmFuncionarios.lstEscolheTipoRelClick(Sender: TObject);
var
   statusAtual : string;
begin

    pan_titulo.Caption:= 'Controle de Funcionários - Visualizando...';
    lstEscolheTipoRel.Visible:= False;
    lstEscolheTipoRel.Align:= alNone;
    pnl_visualizacao.Enabled:= True;

    if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO   DE  TODOS  OS  FUNCIONÁRIOS' then
    begin

        TotalRegs := 0;

        //PESQUISANDO A QUANTIDADE DE REGISTROS RETORNADO PELO QRY

       _Sql := 'SELECT * FROM funcionarios INNER JOIN funcoes ON '+
               '(FUNCIONARIOS.FUNC_FUNCAOID = FUNCOES.FUNCAO_ID) '+
               'WHERE '+
               'FUNC_ID > 1 '+
               'ORDER BY FUNC_NOME';

       with Q_RelFuncCompleto.Qry_Func do
       begin

          Close;
          sql.Clear;
          SQL.Add(_Sql);
          Open;

          if not IsEmpty then
          begin

             TotalRegs := Q_RelFuncCompleto.Qry_Func.RecordCount;

          end;

       end;

       Q_RelFuncCompleto.Preview;
       Q_RelFuncCompleto.QRLabelTotal.Caption  := IntToStr(TotalRegs);

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO DO FUNCIONÁRIO SELECIONADO' then
    begin

           with Q_RelFuncIndividual.Qry_FuncIndividual do
           begin

              Close;
              ParamByName('pFunc').asinteger := StrToInt(dbedtFUNC_ID.Text);
              Open;

           end;

           statusAtual := Q_RelFuncIndividual.Qry_FuncIndividualFUNC_STATUS.Value;

           if( statusAtual = 'A' )then
           begin
                 Q_RelFuncIndividual.lblSTATUS.Caption := 'ATIVO';
           end else begin
                 Q_RelFuncIndividual.lblSTATUS.Caption := 'INATIVO';
           end;

           Q_RelFuncIndividual.Preview;

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO DE ACESSOS DOS FUNCIONÁROS' then
    begin

           pnl_Periodo.Visible := True;
           pnl_Periodo.Align   := alClient;
           pnl_Periodo.BringToFront;
           edt_DataFim.Date    :=  date;

    end;

end;

procedure T_frmFuncionarios.btnimprimirClick(Sender: TObject);
begin

 if dm_Conexao.cds_DadosFuncionarios.RecordCount = 0 then
 begin

    Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);
    exit;

  end
  else begin


    pan_titulo.Caption:= 'Controle de Funcionários - Imprimindo...';
    LogOperacoes(NomeDoUsuarioLogado, 'acesso a relatórios de funcionários');
    lstEscolheTipoRel.Visible:= True;
    lstEscolheTipoRel.Align:= alClient;
    pnl_visualizacao.Enabled:= False;

  end;

end;

procedure T_frmFuncionarios.btnRetornarClick(Sender: TObject);
begin
    pnl_visualizacao.BringToFront;
    HabilitarBotoes;
end;

procedure T_frmFuncionarios.edt_IncluirUsuarioExit(Sender: TObject);
begin

     if edt_IncluirUsuario.Text = '' then
    begin

        Application.MessageBox('É necessário preencher um nome de usuário para continuar!', 'Campo não pode ser vazio!', MB_OK);
        edt_IncluirUsuario.SetFocus;
        exit;

    end
    else begin

          VerificarDuplicidade(dm_DadosSegundo.cds_login, 'usuario', edt_IncluirUsuario);
          
    end;
              
end;

procedure T_frmFuncionarios.btnSairPermissoesClick(Sender: TObject);
begin
    close;
    HabilitarBotoes;
end;



procedure T_frmFuncionarios.edt_UsuarioParaAlteracaoChange(
  Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled   := True;  //habilitando o botao de confirmacao de alteracao
    btnCancelarAlteracao.Enabled   := True;
    btnRetornarDaAlteracao.Enabled :=False;

end;

procedure T_frmFuncionarios.btnFecharClick(Sender: TObject);
begin

    close;
    FecharTabelas;
    HabilitarBotoes;

end;

procedure T_frmFuncionarios.btnPesquisarClick(Sender: TObject);
begin

    if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
    begin

        Application.MessageBox('É necessário uma data inicial e uma data final para efetuar a pesquisa !', 'Período Inválido!', MB_OK);
        edt_DataInicio.SetFocus;

    end else
    begin

         PesquisarPeriodo;

    end;

end;

procedure T_frmFuncionarios.edt_DataFimKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if Key = VK_RETURN then
  begin

    PesquisarPeriodo;
    
  end;

end;

procedure T_frmFuncionarios.PesquisarPeriodo;
var
  DataInicio, DataFim : TDate;
begin


      if edt_DataFim.Date >= edt_DataInicio.Date then
       begin


            DataInicio  := StrToDate(edt_DataInicio.text);
            DataFim     := StrToDate(edt_DataFim.text);


             pnl_Periodo.Visible := False;

             with Q_RelAcessos.cds_LogAcessos do
             begin

                Close;
                Params.ParamByName('datainicial').AsDate := DataInicio;
                Params.ParamByName('datafinal').AsDate   := DataFim;
                Open;

             end;

             Q_RelAcessos.cds_LogAcessos.Active:= True;
             Q_RelAcessos.Preview;


             edt_DataInicio.Text := '';
             edt_DataFim.Text    := '';

          

             end else begin

             Application.MessageBox('A data final deve ser maior que a data inicial!', 'Período Inválido!', MB_OK);
             edt_DataFim.SetFocus;

      end;

end;

procedure T_frmFuncionarios.edt_comissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
         // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;
end;

procedure T_frmFuncionarios.btnRetornarDaInclusaoClick(Sender: TObject);
begin

  pnl_visualizacao.BringToFront;
  pan_titulo.Caption:= 'Controle de Funcionários - Visualizando...';
  //DesabilitarBotoesParcialmente;
  AtualizaQde;
  Abrir_Fechar_Tabelas;
  MostrarFuncionarioTelaInicial;

end;


procedure T_frmFuncionarios.ClassificarPorNome;
begin

        _Sql :='SELECT p.*, f.funcao_id, f.funcao_descricao FROM funcionarios p, funcoes f WHERE '+
        'p.func_funcaoid = f.funcao_id AND p.func_nome <> '+QuotedStr('ADMINISTRACAO')+' AND '+
        'func_nome <> '+QuotedStr('SISTEMA')+' AND p.func_status = '+QuotedStr('A')+' '+
        'ORDER BY p.func_nome';

         with DM_Pesq.cdsPesqConsFuncionarios do begin

           Close;
           CommandText:= (_Sql);
           Open;

         end;

end;

procedure T_frmFuncionarios.MostrarFuncionarioTelaInicial;
begin

            //MOSTRA TODOS OS FUNCIONARIOS COM EXCEÇAÕ DO ADMINISTRACAO E INATIVOS

            with dm_Conexao.cds_DadosFuncionarios do
            begin

                Close;
                CommandText:= ('SELECT * FROM funcionarios WHERE func_nome <> '+QuotedStr('ADMINISTRACAO')+' AND '+
                'func_status = :pStatus ORDER BY func_nome');
                Params.ParamByName('pStatus').AsString  := 'A';
                Open;

                  if not IsEmpty then
                  begin

                      dbedtFUNC_NOME1.DataSource          :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtFUNC_NOME1.DataField           := 'FUNC_NOME';

                      dbedtFUNC_APELIDO.DataSource        :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtFUNC_APELIDO.DataField         := 'FUNC_APELIDO';

                      dbedtFUNC_ENDERECO.DataSource       :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtFUNC_ENDERECO.DataField        := 'FUNC_ENDERECO';

                      dbedtFUNC_ID.DataSource             :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtFUNC_ID.DataField              := 'FUNC_ID';

                      dbedtFUNC_COMPLEMENTO.DataSource    :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtFUNC_COMPLEMENTO.DataField     := 'FUNC_COMPLEMENTO';

                      dbedtFUNC_CEP.DataSource            :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtFUNC_CEP.DataField             := 'FUNC_CEP';

                      dbedtFUNC_EMAIL.DataSource          :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtFUNC_EMAIL.DataField           := 'FUNC_EMAIL';

                      dbedtFUNC_DATACAD.DataSource        :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtFUNC_DATACAD.DataField         := 'FUNC_DATACAD';

                      dbedtDDD_FONE.DataSource            :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtDDD_FONE.DataField             := 'FUNC_DDDFONE';

                      dbedtFUNC_FONE.DataSource           :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtFUNC_FONE.DataField            := 'FUNC_FONE';

                      dbedtDDD_FONE2.DataSource           :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtDDD_FONE2.DataField            := 'FUNC_DDDFONE2';

                      dbedtFUNC_FONE2.DataSource          :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtFUNC_FONE2.DataField           := 'FUNC_FONE2';

                      dbedtDDD_FONE3.DataSource           :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtDDD_FONE3.DataField            := 'FUNC_DDDFONE3';

                      dbedtFUNC_FONE3.DataSource          :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtFUNC_FONE3.DataField           := 'FUNC_FONE3';

                      dbedtDDD_FONE4.DataSource           :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtDDD_FONE4.DataField            := 'FUNC_DDDFONE4';

                      dbedtFUNC_FONE4.DataSource          :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtFUNC_FONE4.DataField           := 'FUNC_FONE4';

                      dbedtFUNC_DATANASCTO.DataSource     :=  dm_Conexao.ds_DadosFuncionarios;
                      dbedtFUNC_DATANASCTO.DataField      := 'FUNC_DATANASCTO';


                      with dbgrd_Funcionarios do
                      begin

                        DataSource:=  dm_Conexao.ds_DadosFuncionarios;
                        Columns.Clear;

                        Columns.Add;
                        Columns[0].FieldName         := 'FUNC_NOME';
                        Columns[0].Width             := 280;
                        Columns[0].Alignment         := taLeftJustify;
                        Columns[0].Title.caption     := 'FUNCIONÁRIOS';
                        Columns[0].Title.Font.Style  := [fsBold];

                      end;

                  end;

      end;

end;


procedure T_frmFuncionarios.PopularDBMostraFuncoesParaAdminSistema;
begin

      _Sql  := 'SELECT * FROM funcoes WHERE funcao_id > 1';

      with DM_Pesq.cdsPesqGeral do
      begin
            Close;
            CommandText:= _Sql;
            Open;


            if not IsEmpty then
            begin

                  with db_Mostra_Funcao do
                  begin

                       //TDBLOOKYP INCLUSAO
                       ListSource := DM_Pesq.dsPesqGeral;
                       ListField  := 'FUNCAO_DESCRICAO';
                       KeyField   := 'FUNCAO_ID';
                       KeyValue   := 1;

                  end;


                  with dbFUNC_FUNCAOID do
                  begin

                       //TDBLOOKP PARA ALTERACAO
                       ListSource := DM_Pesq.dsPesqGeral;
                       ListField  := 'FUNCAO_DESCRICAO';
                       KeyField   := 'FUNCAO_ID';
                       
                       if(intFunc = 2)then
                       begin
                           dbFUNC_FUNCAOID.KeyValue   := 2;  //ADMINISTRADOR
                       end else if(intFunc = 3)then
                       begin
                           dbFUNC_FUNCAOID.KeyValue   := 3;  //USUARIO
                       end;

                  end;

                  with db_FUNCAOID do
                  begin

                      DataSource := DM_Pesq.dsPesqGeral;
                      DataField  := 'FUNCAO_ID';

                  end;

            end;
      end;
end;

procedure T_frmFuncionarios.PopularDBMostraFuncoesParaUsuariosComuns;
begin

     //popular os DBMostraFuncoes sem a opção SISTEMA e ADMINISTRADOR

      _Sql  := 'SELECT * FROM funcoes WHERE funcao_id > 2';

      with DM_Pesq.cdsPesqGeral do
      begin
            Close;
            CommandText:= _Sql;
            Open;
      end;

      with db_Mostra_Funcao do
      begin

           //TDBLOOKYP INCLUSAO
           ListSource := DM_Pesq.dsPesqGeral;
           ListField  := 'FUNCAO_DESCRICAO';
           KeyField   := 'FUNCAO_ID';
           KeyValue   := 1;
           Enabled    := false;

      end;


      with dbFUNC_FUNCAOID do
      begin

           //TDBLOOKYP ALTERACAO ESTARA DESABILITADO POIS NAO TEM PERMISSAO PARA ALTERACAO
           ListSource := DM_Pesq.dsPesqGeral;
           ListField  := 'FUNCAO_DESCRICAO';
           KeyField   := 'FUNCAO_ID';
           Enabled    := false;

      end;

      with db_FUNCAOID do
      begin

          DataSource := DM_Pesq.dsPesqGeral;
          DataField  := 'FUNCAO_ID';

      end;      

      btnInativar.Enabled := false;

end;


procedure T_frmFuncionarios.msk_FoneChange(Sender: TObject);
begin
    if Length(Trim(msk_Fone.Text)) = 9 then  msk_Fone2.setfocus;
end;

procedure T_frmFuncionarios.msk_Fone2Change(Sender: TObject);
begin
    if Length(Trim(msk_Fone2.Text)) = 9 then  msk_Fone3.setfocus;
end;

procedure T_frmFuncionarios.msk_Fone3Change(Sender: TObject);
begin
     if Length(Trim(msk_Fone3.Text)) = 9 then  msk_Fone4.setfocus;
end;

procedure T_frmFuncionarios.msk_Fone4Change(Sender: TObject);
begin
    if Length(Trim(msk_Fone4.Text)) = 10 then  edt_email.setfocus;
end;

procedure T_frmFuncionarios.msk_cepChange(Sender: TObject);
begin
    if Length(Trim(msk_cep.Text)) = 9 then  edt_complemento.setfocus;
end;

procedure T_frmFuncionarios.msk_dtNascButtonClick(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled   := True;   //habilitando o botao de confirmacao de alteracao
    btnCancelarAlteracao.Enabled   := True;
    btnRetornarDaAlteracao.Enabled :=False;


end;

procedure T_frmFuncionarios.msk_dtNascChange(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled   := True;   //habilitando o botao de confirmacao de alteracao
    btnCancelarAlteracao.Enabled   := True;
    btnRetornarDaAlteracao.Enabled :=False;


end;

procedure T_frmFuncionarios.edtConsFuncKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

      if KEY = VK_RETURN then
      begin

          edtConsFunc.Clear;

      end;

end;

procedure T_frmFuncionarios.FiltrarPorNome;
var
  nome : string;
begin

       nome := edtConsFunc.Text;

      _Sql  := 'SELECT * FROM funcionarios WHERE func_nome <> '+QuotedStr('ADMINISTRACAO')+' AND '+
                'func_nome <> '+QuotedStr('SISTEMA')+' AND func_status = '+QuotedStr('A')+' '+
                'AND func_nome LIKE (''%'+nome+'%'') ORDER BY func_nome';

      with dm_Conexao.cds_DadosFuncionarios do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

end;

procedure T_frmFuncionarios.edtConsFuncChange(Sender: TObject);
begin

   FiltrarPorNome;

end;

procedure T_frmFuncionarios.dbedtFUNC_NOMEExit(Sender: TObject);
begin
    btnConfirmaAlteracao.Enabled := true;
end;

procedure T_frmFuncionarios.dbgrd_FuncionariosCellClick(Column: TColumn);
begin

    idFuncSelecionado    :=  dm_Conexao.cds_DadosFuncionarios.fieldbyname('func_id').AsInteger;
    btnInativar.Enabled  := true;
    btnSenhas.Enabled    := true;

end;

procedure T_frmFuncionarios.edt_apelidoEnter(Sender: TObject);
begin

    btnConfirmaInclusao.Enabled:= True;

end;

procedure T_frmFuncionarios.AtualizaQde;
begin

    qdeRegs               := ListaQdeRegs(dm_Conexao.cds_DadosFuncionarios);
    txtMsg.Caption        := 'Total de funcionários cadastrados '+ IntToStr( qdeRegs );
    txtMsg.Font.Color     := clBlue;

end;


procedure T_frmFuncionarios.edt_nomeEnter(Sender: TObject);
begin
    db_Mostra_Funcao.Enabled  := false;
end;

procedure T_frmFuncionarios.edt_IncluirUsuarioEnter(Sender: TObject);
begin
  btnConfirmaInclusao.Enabled:=true;
end;

end.

