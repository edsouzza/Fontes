unit U_CadFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Encryp,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr, DateUtils,
  ToolEdit, RXDBCtrl, Midas,DBClient;

type
  TF_FUNCIONARIOS = class(TForm)
    pan_titulo: TPanel;
    pan_botoes: TPanel;
    btnCadastros: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnInativar: TSpeedButton;
    btnSair: TSpeedButton;
    btnimprimir: TSpeedButton;
    pangrid_inclusao: TPanel;
    pangrid_alteracao: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    pangrid_visualizacao: TPanel;
    GridTelaPrincipal: TDBGrid;
    txtMsg: TStaticText;
    lstMesesDoAno: TListBox;
    GroupBox9: TGroupBox;
    edtFiltro: TEdit;
    grp2: TGroupBox;
    grp3: TGroupBox;
    btnConfirmaAlteracao: TSpeedButton;
    btnRetornar: TSpeedButton;
    grp1: TGroupBox;
    Label3: TLabel;
    memoInclusaoObs: TMemo;
    GroupBox1: TGroupBox;
    btnConfirmaInclusao: TSpeedButton;
    btnRetornar2: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label45: TLabel;
    memoAlteraObs: TMemo;
    lstEscolheTipoRel: TListBox;
    lbl11: TLabel;
    edt_nome: TEdit;
    lbl50: TLabel;
    lblListaTiposDeAcessoParaInclusao: TStaticText;
    lbl13: TLabel;
    edt_endereco: TEdit;
    lbl15: TLabel;
    msk_cep: TMaskEdit;
    lbl14: TLabel;
    edt_bairro: TEdit;
    lbl16: TLabel;
    edt_email: TEdit;
    lblFones: TLabel;
    msk_Fone: TMaskEdit;
    Label2: TLabel;
    msk_Fone2: TMaskEdit;
    msk_Fone3: TMaskEdit;
    Label4: TLabel;
    Label25: TLabel;
    msk_Fone4: TMaskEdit;
    edt_DataCadastro: TEdit;
    lbl18: TLabel;
    lbl10: TLabel;
    lbl20: TLabel;
    lbl26: TLabel;
    msk_cep2: TMaskEdit;
    lbl21: TLabel;
    lbl25: TLabel;
    Label34: TLabel;
    msk_tel: TMaskEdit;
    msk_tel2: TMaskEdit;
    Label26: TLabel;
    Label29: TLabel;
    msk_tel3: TMaskEdit;
    msk_tel4: TMaskEdit;
    Label31: TLabel;
    lbl34: TLabel;
    lblListaAcessosParaAlteracao: TStaticText;
    edtAlteraNome: TEdit;
    edtAlteraEndereco: TEdit;
    edt_AlteraComplemento: TEdit;
    edtAlteraBairro: TEdit;
    db_CONT_ID: TEdit;
    dbIDdaLista: TEdit;
    pnl_Periodo: TPanel;
    lbl52: TLabel;
    lbl53: TLabel;
    btnFechar: TSpeedButton;
    btnPesquisar: TSpeedButton;
    edt_DataInicio: TDateEdit;
    edt_DataFim: TDateEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    msk_DataNascto: TDateEdit;
    lbl17: TLabel;
    edt_complemento: TEdit;
    edtAlteraEmail: TEdit;
    Label11: TLabel;
    Label13: TLabel;
    msk_AlteraDataNascto: TDateEdit;
    Label14: TLabel;
    edt_AlteraLogin: TStaticText;
    edt_cadlogin: TStaticText;
    btnSenhas: TSpeedButton;
    Label15: TLabel;
    Label17: TLabel;
    lblStatusLogoff: TLabel;
    grDados: TGroupBox;
    lbl1: TLabel;
    lbl7: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    lbl28: TLabel;
    lblFone: TLabel;
    Label16: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label12: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    dbedtCONT_DATACAD: TDBEdit;
    dbedtCONT_NOME1: TDBEdit;
    dbedtCONT_ENDERECO: TDBEdit;
    dbedtCONT_CEP: TDBEdit;
    dbedtCONT_BAIRRO: TDBEdit;
    dbedtCONT_EMAIL: TDBEdit;
    dbedtCONT_ID: TDBEdit;
    dbedtCONT_TELEFONE1: TDBEdit;
    dbedtCONT_TELEFONE2: TDBEdit;
    dbedtCONT_CELULAR1: TDBEdit;
    dbedtCONT_CELULAR2: TDBEdit;
    memoTelaPrincipal: TDBMemo;
    dbedtFUNC_DATANASCTO: TDBEdit;
    dbedtFUNC_COMPLEMENTO: TDBEdit;
    edt_tipoacesso: TDBEdit;
    dbedtCONT_LOGIN: TDBEdit;

    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInativarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCadastrosClick(Sender: TObject);
    procedure btnConfirmaInclusaoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnConfirmaAlteracaoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_nomeChange(Sender: TObject);
    procedure dbedt9Change(Sender: TObject);
    procedure dbedt13Change(Sender: TObject);
    procedure dbedt10Change(Sender: TObject);
    procedure msk_cep2Change(Sender: TObject);
    procedure dbedtCLI_STATUSChange(Sender: TObject);
    procedure btnRetornar2Click(Sender: TObject);
    procedure msk_cep2KeyPress(Sender: TObject; var Key: Char);
    procedure msk_cepKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtCLI_STATUSKeyPress(Sender: TObject; var Key: Char);
    procedure edt_statusKeyPress(Sender: TObject; var Key: Char);
    procedure combo_Altera_StatusChange(Sender: TObject);
    procedure edt_nomeExit(Sender: TObject);
    procedure lstEscolheTipoRelClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairConsClientesClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstMesesDoAnoClick(Sender: TObject);
    procedure lstMesesDoAnoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_DDDFONEKeyPress(Sender: TObject; var Key: Char);
    procedure edt_DDDFONE2KeyPress(Sender: TObject; var Key: Char);
    procedure dbedt13Enter(Sender: TObject);
    procedure edtFiltroChange(Sender: TObject);
    procedure edtFiltroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridTelaPrincipalCellClick(Column: TColumn);
    procedure btnConsPorClienteClick(Sender: TObject);
    procedure msk_cepChange(Sender: TObject);
    procedure msk_FoneChange(Sender: TObject);
    procedure msk_Fone2Change(Sender: TObject);
    procedure msk_Fone3Change(Sender: TObject);
    procedure msk_Fone4Change(Sender: TObject);
    procedure msk_telChange(Sender: TObject);
    procedure msk_tel2Change(Sender: TObject);
    procedure msk_tel3Change(Sender: TObject);
    procedure msk_tel4Change(Sender: TObject);
    procedure edt_apelidoEnter(Sender: TObject);
    procedure memoTelaPrincipalEnter(Sender: TObject);
    procedure lblListaTiposDeAcessoParaInclusaoClick(Sender: TObject);
    procedure edt_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
      
    //procedimentos personalizados
    procedure EstadoInicialDosBotoes;
    procedure AtualizaQde;
    procedure GravarFuncionario;
    procedure Limpar;
    procedure BancoParaEdts;
    procedure GravarAlteracoes;
    procedure DesabilitarBotoes;
    procedure HabilitarBotoes;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure AbrirCadastroDeSenhas;
    procedure MostrandoDadosTelaInicial;
    procedure AbrirListaTiposDeAcessoCadastroAlteracao;
    procedure FiltrarPorNome;
    procedure CadastrarLoginUsuario;
    procedure PesquisarPeriodoLogsIndividual;
    procedure PesquisarPeriodoTodosFunc;
    procedure edt_enderecoExit(Sender: TObject);
    procedure memoInclusaoObsEnter(Sender: TObject);
    procedure lblListaAcessosParaAlteracaoClick(Sender: TObject);
    procedure memoAlteraObsEnter(Sender: TObject);
    procedure btnSenhasClick(Sender: TObject);
    procedure edtAlteraNomeEnter(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure VerificaPermissaoAlteracaoSenhaParaUsuarioLogado;
    procedure DefinirEstadoBotaoSenhas;
    procedure PesquisarPeriodosDeAniversariantes;
    procedure edtFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure edt_DataCadastroClick(Sender: TObject);
    procedure msk_AlteraDataNasctoClick(Sender: TObject);
    procedure edt_DataInicioClick(Sender: TObject);
    procedure edt_DataFimClick(Sender: TObject);

  private
    { Private declarations }
    sqlDefalt, nome, login, endereco, bairro, complemento, cep, tel1, tel2, cel1, cel2, email, status, idcont, datanascto, datacad, obs : string;
    idContSelecionado, proxIdFunc, intFunc  : integer;
    relLogsTodosFuncs : boolean;
    
    procedure eventoTimerReiniciar(Sender:TObject);

  public
    { Public declarations }
    MesEscolhido : string;


  end;

var
  F_FUNCIONARIOS: TF_FUNCIONARIOS;


implementation

uses U_dmDados, U_dmPesquisas, U_dmDadosSegundo, U_ListaPadraoComUmCampo,
  U_BiblioSysSalao, DB, U_principal, U_QRelFuncCompleto, U_QRelFuncParcial,
  U_CadastroPadraoUmCampo, U_dmNewDataModule, U_QRelContatosCompleto,
  U_RelContatosIndividual, U_CadSenhaUsuario, U_ReiniciarSenhaUsuario,
  U_QRelLogAcessos, U_QRelLogAcessosIndividual, U_Login, U_CadEmpresa,
  U_QRelFuncsAniversariantes;

{$R *.dfm}


procedure TF_FUNCIONARIOS.FormCreate(Sender: TObject);
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

    sqlDefalt := 'select u.*, f.* FROM funcionarios u INNER JOIN funcoes f ON u.func_funcaoid = f.funcao_id WHERE u.func_id > 1 '+
                 ' AND u.func_status = '+QuotedStr('A')+' ORDER BY u.func_nome';

    edt_DataCadastro.Text     := DateToStr(now);
    lblDataDoDia.Caption      := DateToStr(date);
    lblHoraAtual.Caption      := timetoStr(time);
    lblStatusLogoff.Caption   := NomeDoUsuarioLogado;
    IdDoUsuarioLogado         := IdFuncionarioLogado(NomeDoUsuarioLogado);
    EstadoInicialDosBotoes;

end;    

procedure TF_FUNCIONARIOS.FormShow(Sender: TObject);
begin

    AbrirTabelas;
    AtualizaQde;
    MostrandoDadosTelaInicial;
    edtFiltro.SetFocus;
    pan_titulo.Caption := 'Controle de funcion�rios - Consultando...';
    Caption            := 'LOGADO POR '+NomeDoUsuarioLogado;

    if(retornaQuantidadeRegsTabela('func_id','funcionarios')) > 1 then
    begin

       idContSelecionado := StrToInt(dbedtCONT_ID.Text);

    end;

    if(cadastroInicial)then
    begin
        btnSair.Enabled := false;
    end;

    DefinirEstadoBotaoSenhas;

    //VERIFICA SE � O PRIMEIRO ACESSO E JOGA DIRETO PARA CADASTRO DO PRIMEIRO FUNCIONARIO
    if(retornaQuantidadeRegsTabela('FUNC_ID','FUNCIONARIOS')=1)then
    begin

       btnCadastrosClick(self);

    end;

end;

procedure TF_FUNCIONARIOS.eventoTimerReiniciar(Sender: TObject);
begin

     keybd_event(VK_RETURN,0,0,0);
     TimerReiniciar.Enabled := False;

end;

procedure TF_FUNCIONARIOS.AbrirCadastroDeSenhas;
begin
             
      Application.CreateForm(T_frmCadSenhaUsuario,  _frmCadSenhaUsuario);
      _frmCadSenhaUsuario.ShowModal;
      FreeAndNil(_frmCadSenhaUsuario);

end;

procedure TF_FUNCIONARIOS.btnInativarClick(Sender: TObject);
begin   

          texto:= 'Confirma o desejo de inativar '+dbedtCONT_NOME1.Text+ '?';

          if Application.MessageBox(PChar(texto),'Inativar registro',MB_YESNO + MB_ICONQUESTION) = IdYes then
          begin

              _Sql := 'UPDATE funcionarios SET func_status = '+QuotedStr('I')+' WHERE func_id = :pID';

               with DM_Pesq.Qry_Geral do
               begin

                   close;
                   sql.Clear;
                   sql.Add(_Sql);
                   Params.ParamByName('pID').AsInteger :=  StrToInt(dbedtCONT_ID.Text);
                   ExecSQL;

               end;

               _Sql := 'UPDATE login SET status = '+QuotedStr('I')+' WHERE func_id = :pID';

               with DM_Pesq.Qry_Auxiliar do
               begin

                   close;
                   sql.Clear;
                   sql.Add(_Sql);
                   Params.ParamByName('pID').AsInteger :=  StrToInt(dbedtCONT_ID.Text);
                   ExecSQL;

               end;

              Application.MessageBox('O registro foi inativado com sucesso!',
              'Inativo', MB_OK);

              AtualizaQde;
              pan_titulo.Caption:= 'Controle de funcion�rios - Visualizando...';
              HabilitarBotoes;
              btnInativar.Enabled  :=false;
              btnimprimir.Enabled  := false;
              btnAlterar.Enabled   := false;
          end else
          begin
              dm_Conexao.cds_DadosFuncionarios.CancelUpdates;
              pan_titulo.Caption:= 'Controle de funcion�rios - Visualizando...';
              HabilitarBotoes;
              btnimprimir.Enabled  := false;
              btnInativar.Enabled  := false;
              btnAlterar.Enabled   := false;

         end;

      FecharAbrirTabelas;
      EstadoInicialDosBotoes;

end;


procedure TF_FUNCIONARIOS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    FreeAndNil(TimerReiniciar);
    Close;
    Release;

end;

procedure TF_FUNCIONARIOS.btnCadastrosClick(Sender: TObject);
begin

   if (btnCadastros.Caption = 'Voltar')then
   begin
      EstadoInicialDosBotoes;
   end else
   begin

     GridTelaPrincipal.Enabled    := True;
     edt_nome.SetFocus;
     pan_titulo.Caption:= 'Controle de funcion�rios - Incluindo...';
     pangrid_inclusao.BringToFront;
     DesabilitarBotoes;
     cadastrando:=true;
     btnRetornar2.Enabled := false;
     btnCadastros.Caption := 'Cadastro Inicial';
     btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');

   end;
          
end;

procedure TF_FUNCIONARIOS.CadastrarLoginUsuario;
begin

     //GRAVANDO O USUARIO E FUNCAO DE PERMISSAO NA TBL LOGIN

      DM_Pesq.cdsPesqLogin.Active := TRUE;

      proxNumLogin := GerarProximoID('id_usuario','login');

       with dm_DadosSegundo.cds_Login do
       begin

          Append;

          FieldByName('id_usuario').AsInteger     := proxNumLogin;
          FieldByName('func_id').AsInteger        := proxIdFunc;
          FieldByName('funcao_id').AsInteger      := RetornaIDPassandoString('funcao_id','funcoes','funcao_descricao',lblListaTiposDeAcessoParaInclusao.Caption);
          FieldByName('usuario').AsString         := edt_cadlogin.Caption;
          FieldByName('status').AsString          := 'A';

          ApplyUpdates(0);

       end;

       GerarSenhaInicial(proxNumLogin);

end;


procedure TF_FUNCIONARIOS.btnConfirmaInclusaoClick(Sender: TObject);
begin
     //cadastrando
     if (( edt_nome.Text = '') and (cadastrando)) then
      begin

           Application.MessageBox('Preencha todos os campos para continuar o cadastro!', 'Campos vazios', MB_OK);
           edt_nome.SetFocus;

      end else begin

         GravarFuncionario;

         if(cadastroInicial)then
         begin
           LogOperacoes('ADMINISTRADOR', 'cadastro do funcionario '+nome);
         end else begin
           LogOperacoes(NomeDoUsuarioLogado, 'cadastro do funcionario '+nome);
         end;

         if (cadastroInicial)then
         begin
             btnSairClick(self);            
         end else
         begin

             btnRetornar2.Enabled := true;
             btnCancelar.Enabled  := false;
             DesabilitarBotoes;
             EstadoInicialDosBotoes;
             edt_nome.SetFocus;

         end;

      end;

end;

procedure TF_FUNCIONARIOS.GravarFuncionario;
begin
         proxIdFunc   := GerarProximoID('func_id','funcionarios');
         nome         := edt_nome.Text;
         login        := edt_cadlogin.Caption;
         endereco     := edt_endereco.Text;
         bairro       := edt_bairro.Text;
         complemento  := edt_complemento.Text;
         cep          := msk_cep.Text;
         tel1         := msk_Fone.Text;
         tel2         := msk_Fone2.Text;
         cel1         := msk_Fone3.Text;
         cel2         := msk_Fone4.Text;
         email        := edt_email.Text;
         datacad      := edt_DataCadastro.Text;
         status       := 'A';
         obs          := memoInclusaoObs.Text;

         _Sql := 'insert into funcionarios (func_id, func_funcaoid, func_nome, func_login, func_endereco, func_bairro, func_complemento, func_cep, func_telefone1, '+
                 'func_telefone2, func_celular1, func_celular2, func_email, func_datanascto, func_datacad, func_status, func_obs) '+
                 'values (:func_id, :func_funcaoid, :func_nome, :func_login, :func_endereco, :func_bairro, :func_complemento, :func_cep, :func_telefone1, '+
                 ':func_telefone2, :func_celular1, :func_celular2, :func_email, :func_datanascto, :func_datacad, :func_status, :func_obs)';

         with DM_Pesq.Qry_Auxiliar do
         begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             ParamByName('func_id').AsInteger           :=  proxIdFunc;

               if(cadastroInicial)then
               begin
                  ParamByName('func_funcaoid').AsInteger     :=  2;
               end else begin
                  ParamByName('func_funcaoid').AsInteger     :=  IdGeral;
               end;

             ParamByName('func_nome').AsString          :=  nome;
             ParamByName('func_login').AsString         :=  login;
             ParamByName('func_endereco').AsString      :=  endereco;
             ParamByName('func_bairro').AsString        :=  bairro;
             ParamByName('func_complemento').AsString   :=  complemento;
             ParamByName('func_cep').AsString           :=  cep;
             ParamByName('func_telefone1').AsString     :=  tel1;
             ParamByName('func_telefone2').AsString     :=  tel2;
             ParamByName('func_celular1').AsString      :=  cel1;
             ParamByName('func_celular2').AsString      :=  cel2;
             ParamByName('func_email').AsString         :=  email;

             //CASO A DATA DE NASCIMENTO N�O SEJA DIGITADA
             if (msk_DataNascto.Text = '  /  /    ') then
                 ParamByName('func_datanascto').DataType := ftDate
             else
                 ParamByName('func_datanascto').AsDateTime  := StrToDate(msk_DataNascto.Text);

             ParamByName('func_datacad').AsString       :=  datacad;
             ParamByName('func_status').AsString        :=  status;
             ParamByName('func_obs').AsString           :=  obs;
             ExecSQL;

        end;

       Application.MessageBox('Registro cadastrado com sucesso!', 'Novo registro', MB_OK);
       AtualizaQde;
       CadastrarLoginUsuario;
       FecharAbrirTabelas;
       Limpar;

end;

procedure TF_FUNCIONARIOS.btnAlterarClick(Sender: TObject);
begin

    pan_titulo.Caption:= 'Controle de funcion�rios - Alterando...';
    pangrid_alteracao.BringToFront;
    BancoParaEdts;
    DesabilitarBotoes;
    btnRetornar.Enabled          := true;
    btnConfirmaAlteracao.Enabled := true;
    VerificaPermissaoAlteracaoSenhaParaUsuarioLogado;

end;

procedure TF_FUNCIONARIOS.btnCancelarClick(Sender: TObject);
begin

    //Cancelamento da Inclusao atual
    cadastrando := false;
    DM_Pesq.cdsPesqFuncionarios.Cancel;
    Limpar;
    edt_nome.SetFocus;
    btnRetornar2.Enabled         := true;
    btnConfirmaInclusao.Enabled  := False;
    btnCancelar.Enabled          := false;
    MostrandoDadosTelaInicial;

end;


procedure TF_FUNCIONARIOS.btnRetornarClick(Sender: TObject);
begin

    //Saindo da Altera��o
    MostrandoDadosTelaInicial;
    pangrid_visualizacao.BringToFront;
    pan_titulo.Caption:= 'Controle de funcion�rios - Visualizando...';
    HabilitarBotoes;
    edtFiltro.Clear;
    edtFiltro.SetFocus;
    EstadoInicialDosBotoes;
    
end;

procedure TF_FUNCIONARIOS.btnRetornar2Click(Sender: TObject);
begin

    //Saindo da Inclusao
    cadastrando:=false;    
    pangrid_visualizacao.BringToFront;
    AtualizaQde;
    FecharAbrirTabelas;
    MostrandoDadosTelaInicial;
    pan_titulo.Caption:= 'Controle de funcion�rios - Visualizando...';
    HabilitarBotoes;
    edtFiltro.Clear;
    edtFiltro.SetFocus;
    EstadoInicialDosBotoes;

end;


procedure TF_FUNCIONARIOS.Limpar;
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
      msk_DataNascto.Clear;
      edt_DataCadastro.Text     := DateToStr(now);
      edt_cadlogin.Caption      :='';
      pan_titulo.Caption:= 'Controle de funcion�rios - Incluindo...';
      lblListaTiposDeAcessoParaInclusao.Caption := '';
      cadastrando:=false;
      memoInclusaoObs.Clear;

end;

procedure TF_FUNCIONARIOS.GravarAlteracoes;
begin

         idcont       := db_CONT_ID.Text;

         nome         := edtAlteraNome.Text;
         endereco     := edtAlteraEndereco.Text;
         bairro       := edtAlteraBairro.Text;
         complemento  := edt_AlteraComplemento.Text;
         cep          := msk_cep2.Text;
         tel1         := msk_tel.Text;
         tel2         := msk_tel2.Text;
         cel1         := msk_tel3.Text;
         cel2         := msk_tel4.Text;
         email        := edtAlteraEmail.Text;
         datanascto   := msk_AlteraDataNascto.Text;
         obs          := memoAlteraObs.Text;

         if not(alterouFuncao)then
         begin

            IdGeral :=  StrToInt(dbIDdaLista.Text)

         end;


         _Sql :='update funcionarios set func_funcaoid = :func_funcaoid, func_nome = :func_nome, func_endereco = :func_endereco, '+
                'func_bairro = :func_bairro, func_complemento = :func_complemento, func_cep = :func_cep, func_telefone1 = :func_telefone1, func_telefone2 = :func_telefone2, '+
                'func_celular1 = :func_celular1, func_celular2 = :func_celular2, func_email = :func_email, func_datanascto = :func_datanascto, func_obs = :func_obs where (func_id = :func_id)';

         with DM_Pesq.Qry_Geral do
         begin

             sql.Clear;
             sql.Add(_Sql);
             ParamByName('func_id').AsInteger           :=  StrToInt(idcont);
             ParamByName('func_funcaoid').AsInteger     :=  IdGeral;
             ParamByName('func_nome').AsString          :=  nome;
             ParamByName('func_endereco').AsString      :=  endereco;
             ParamByName('func_bairro').AsString        :=  bairro;
             ParamByName('func_complemento').AsString   :=  complemento;
             ParamByName('func_cep').AsString           :=  cep;
             ParamByName('func_telefone1').AsString     :=  tel1;
             ParamByName('func_telefone2').AsString     :=  tel2;
             ParamByName('func_celular1').AsString      :=  cel1;
             ParamByName('func_celular2').AsString      :=  cel2;
             ParamByName('func_email').AsString         :=  email;    

             //CASO A DATA DE NASCIMENTO N�O SEJA DIGITADA
             if (msk_AlteraDataNascto.Text = '  /  /    ') then
                 ParamByName('func_datanascto').DataType := ftDate
             else
                 ParamByName('func_datanascto').AsDateTime  := StrToDate(msk_AlteraDataNascto.Text);

                                                      
             ParamByName('func_obs').AsString           :=  obs;

             ExecSQL();

        end;



         _Sql1 :='update login set funcao_id = :funcaoid where (id_usuario = :func_id)';

         with DM_Pesq.Qry_Auxiliar do
         begin

             sql.Clear;
             sql.Add(_Sql1);
             ParamByName('func_id').AsInteger      :=  StrToInt(idcont);
             ParamByName('funcaoid').AsInteger     :=  IdGeral;
             ExecSQL();

         end;
            

        FecharAbrirTabelas;
        
        Application.MessageBox('Altera��es feitas com sucesso!', 'OK!',
             MB_OK + MB_ICONWARNING);


end;

procedure TF_FUNCIONARIOS.BancoParaEdts;
begin

     //setando todos os valores do banco em edits

     _Sql := 'select u.*, f.* FROM funcionarios u INNER JOIN funcoes f ON u.func_funcaoid = f.funcao_id WHERE u.func_id > 1 '+
             'AND u.func_status = '+QuotedStr('A')+' AND u.func_id = :pID ORDER BY u.func_nome';


     with DM_Pesq.cdsPesqFuncionarios do
     begin

         close;
         CommandText:= (_Sql);
         Params.ParamByName('pID').AsInteger :=  idContSelecionado;
         open;

         if not IsEmpty then
         begin

             db_CONT_ID.Text              := DM_Pesq.cdsPesqFuncionarios.FieldByname('func_id').AsString;
             dbIDdaLista.Text             := DM_Pesq.cdsPesqFuncionarios.FieldByname('func_funcaoid').AsString;
             edtAlteraNome.Text           := DM_Pesq.cdsPesqFuncionarios.FieldByname('func_nome').AsString;
             edt_AlteraLogin.caption      := DM_Pesq.cdsPesqFuncionarios.FieldByname('func_login').AsString;
             edt_AlteraComplemento.Text   := DM_Pesq.cdsPesqFuncionarios.FieldByname('func_complemento').AsString;
             edtAlteraEndereco.Text       := DM_Pesq.cdsPesqFuncionarios.FieldByname('func_endereco').AsString;
             edtAlteraBairro.Text         := DM_Pesq.cdsPesqFuncionarios.FieldByname('func_bairro').AsString;
             msk_cep2.Text                := DM_Pesq.cdsPesqFuncionarios.FieldByname('func_cep').AsString;
             msk_tel.Text                 := DM_Pesq.cdsPesqFuncionarios.FieldByname('func_telefone1').AsString;
             msk_tel2.Text                := DM_Pesq.cdsPesqFuncionarios.FieldByname('func_telefone2').AsString;
             msk_tel3.Text                := DM_Pesq.cdsPesqFuncionarios.FieldByname('func_celular1').AsString;
             msk_tel4.Text                := DM_Pesq.cdsPesqFuncionarios.FieldByname('func_celular2').AsString; 
             edtAlteraEmail.Text          := DM_Pesq.cdsPesqFuncionarios.FieldByname('func_email').AsString;
             memoAlteraObs.Text           := DM_Pesq.cdsPesqFuncionarios.FieldByname('func_obs').AsString;

             if( DM_Pesq.cdsPesqFuncionarios.FieldByname('func_datanascto').AsDateTime <  StrToDateTime('01/01/1900') ) then
             begin
                msk_AlteraDataNascto.Text    := '';
             end else begin
                msk_AlteraDataNascto.Text    := DateToStr(DM_Pesq.cdsPesqFuncionarios.FieldByname('func_datanascto').AsDateTime);
             end;

         end;

     end;

     //mostrando o segmento cadastrado
     lblListaAcessosParaAlteracao.Caption :=  RetornaStringPassandoID('funcao_descricao','funcoes','funcao_id',StrToInt(dbIDdaLista.Text));
     edtAlteraNome.SetFocus;

end;


procedure TF_FUNCIONARIOS.btnConfirmaAlteracaoClick(Sender: TObject);
begin

     GravarAlteracoes;
     LogOperacoes(NomeDoUsuarioLogado, 'altera��o nos dados de funcion�rio cadastrado');
     MostrandoDadosTelaInicial;
     pangrid_visualizacao.BringToFront;
     edtFiltro.Clear;
     edtFiltro.SetFocus;
     pan_titulo.Caption:= 'Controle de funcion�rios - Visualizando...';
     HabilitarBotoes;
     btnimprimir.Enabled  := false;
     btnInativar.Enabled  := false;
     btnAlterar.Enabled   := false;
     alterouFuncao := false;
     EstadoInicialDosBotoes;
     
end;


procedure TF_FUNCIONARIOS.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TF_FUNCIONARIOS.DesabilitarBotoes;
var
  i : Integer;
begin

      //Desabilitando os bot�es

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= false;
      end;


      btnRetornar2.Enabled:= True;

end;

procedure TF_FUNCIONARIOS.HabilitarBotoes;
var
  i : Integer;
begin

       //Habilitando os bot�es

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= true;
      end;


      btnRetornar2.Enabled:= True;

end;

procedure TF_FUNCIONARIOS.edt_nomeChange(Sender: TObject);
begin 

    btnRetornar2.Enabled:= False;
    
end;

procedure TF_FUNCIONARIOS.dbedt9Change(Sender: TObject);
begin

    btnRetornar.Enabled:=False;

end;

procedure TF_FUNCIONARIOS.dbedt13Change(Sender: TObject);
begin

    btnRetornar.Enabled:=False;

end;

procedure TF_FUNCIONARIOS.dbedt10Change(Sender: TObject);
begin

    btnRetornar.Enabled:=False;

end;

procedure TF_FUNCIONARIOS.msk_cep2Change(Sender: TObject);
begin

    btnRetornar.Enabled:=False;

    if Length(Trim(msk_cep2.Text)) = 9 then  edtAlteraBairro.setfocus;

end;

procedure TF_FUNCIONARIOS.dbedtCLI_STATUSChange(Sender: TObject);
begin

    btnRetornar.Enabled:=False;

end;

procedure TF_FUNCIONARIOS.btnSairClick(Sender: TObject);
begin

 CriarTimerReiniciar;
 TimerReiniciar.OnTimer := eventoTimerReiniciar;
 TimerReiniciar.Enabled := true;

 if(btnSair.Caption ='Voltar')then
 begin

   lstMesesDoAno.Visible:= false;
   EstadoInicialDosBotoes;

 end else
 begin

   HabilitarBotoes;

   if(cadastroInicial)then
   begin

       if (retornaQuantidadeRegsTabela('func_id','funcionarios') < 2)then
       begin
         Application.MessageBox('Voc� n�o concluiu o cadastro do seu usu�rio finalize para continuar!', 'Validando usu�rio...', MB_ICONEXCLAMATION);
         btnCadastrosClick(self);
       end else begin
          texto := 'Parab�ns os cadastros iniciais foram efetivados com sucesso,'#13'ap�s a reinicializa��o acesse o sistema  e  cadastre sua senha'#13'pessoal. Seu usu�rio � ['+RetornaPrimerioUsuario+'].';
          ReiniciarComMensagemETemporizador(TimerReiniciar,texto,'Cadastros iniciais efetivados!',8000);
          TimerReiniciar.Enabled := false;
       end;

   end else
   begin
       close;
   end;

 end;

end;

procedure TF_FUNCIONARIOS.AbrirTabelas;
begin

   DM_Pesq.cdsPesqFuncionarios.Active  := true;
   dm_DadosSegundo.cds_Login.Active    := true;

end;

procedure TF_FUNCIONARIOS.FecharTabelas;
begin

     DM_Pesq.cdsPesqFuncionarios.Active  := false;
     dm_DadosSegundo.cds_Login.Active    := false;

end;

procedure TF_FUNCIONARIOS.FecharAbrirTabelas;
begin

  DM_Pesq.cdsPesqFuncionarios.Active:= false;
  DM_Pesq.cdsPesqFuncionarios.Active:= true;    

end;

procedure TF_FUNCIONARIOS.msk_cep2KeyPress(Sender: TObject; var Key: Char);
begin
         // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;
end;

procedure TF_FUNCIONARIOS.msk_cepKeyPress(Sender: TObject; var Key: Char);
begin
         // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;
end;

procedure TF_FUNCIONARIOS.dbedtCLI_STATUSKeyPress(Sender: TObject;
  var Key: Char);
begin

       // PARA DBEDIT ACEITAR APENAS LETRAS
       if not (Key in['A'..'Z',#8]) and not (Key in['a'..'z',#8]) then
        begin
          Key := #0;
       end;
end;

procedure TF_FUNCIONARIOS.edt_statusKeyPress(Sender: TObject; var Key: Char);
begin

       // PARA DBEDIT ACEITAR APENAS LETRAS
       if not (Key in['A'..'Z',#8]) and not (Key in['a'..'z',#8]) then
        begin
          Key := #0;
       end;
end;

procedure TF_FUNCIONARIOS.combo_Altera_StatusChange(Sender: TObject);
begin
      btnRetornar.Enabled:=False;
end;

procedure TF_FUNCIONARIOS.edt_nomeExit(Sender: TObject);
var
  Login : string;
begin

  if (cadastrando)then
  begin
      if not(edt_nome.Text = '')then
      begin
             if not (cadastroInicial)then
             begin
                AbrirListaTiposDeAcessoCadastroAlteracao;
                lblListaTiposDeAcessoParaInclusao.Caption := sTringGeral;
             end else
             begin

                edt_endereco.SetFocus;
                lblListaTiposDeAcessoParaInclusao.Caption := 'GERENTE';

             end;

          //GERA O STAFF / LOGIN DE ACESSO AO SISTEMA AUTOMATICAMENTE A PARTIR DO NOME DA EMPRESA
          if (NaoTemSigla) then
          begin
            GerarNovaSigla;
            Login := GerarStaff
            //ShowMessage('NAO TEM SIGLA : '+texto);

          end else
          begin
            Login := GerarStaff;
            //ShowMessage('TEM SIGLA '+texto);
          end;

          edt_cadlogin.Caption  := Login;
          btnCancelar.Enabled   := true;
          edt_endereco.SetFocus;

      end else
      begin
          if(cadastrando)then
          begin
             Application.MessageBox('Digite um nome para continuar!!',
                                  'Nome inv�lido!', MB_OK + MB_ICONWARNING);
           edt_nome.SetFocus;
          end;
      end;
  end;

end;

procedure TF_FUNCIONARIOS.lstEscolheTipoRelClick(Sender: TObject);
var
   statusAtual : string;
begin

    pan_titulo.Caption:= 'Controle de funcion�rios - Visualizando...';
    lstEscolheTipoRel.Visible     := False;
    lstEscolheTipoRel.Align       := alNone;
    pangrid_visualizacao.Enabled  := true;

    if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELAT�RIO   DE  TODOS  OS  FUNCIONARIOS' then
    begin

        TotalRegs := 0;         

       _Sql := 'SELECT * FROM funcionarios INNER JOIN funcoes ON '+
               '(FUNCIONARIOS.FUNC_FUNCAOID = FUNCOES.FUNCAO_ID) '+
               'WHERE '+
               'FUNC_ID > 1 '+
               'ORDER BY FUNC_NOME';

       Application.CreateForm(TQ_RelFuncCompleto,  Q_RelFuncCompleto);
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

       Q_RelFuncCompleto.QRLabelTotal.Caption    := IntToStr(TotalRegs);
       Q_RelFuncCompleto.Preview;
       FreeAndNil(Q_RelFuncCompleto);
       EstadoInicialDosBotoes;

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELAT�RIO DO FUNCIONARIO SELECIONADO' then
    begin

        Application.CreateForm(TQ_RelFuncIndividual,  Q_RelFuncIndividual);
        with Q_RelFuncIndividual.Qry_FuncIndividual do
           begin

              Close;
              ParamByName('pFunc').asinteger := StrToInt(dbedtCONT_ID.Text);
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
           FreeAndNil(Q_RelFuncIndividual);
           EstadoInicialDosBotoes;

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELAT�RIO  GERAL   DE   ANIVERSARIANTES' then
    begin

        lstMesesDoAno.Visible := true;
        lstMesesDoAno.Align   := alClient;
        lstMesesDoAno.BringToFront;
        
        //Desabilitando os bot�es
        pan_botoes.Enabled   := true;
        btnCadastros.Enabled := false;
        pan_titulo.Caption   := 'Consultando Aniversariantes do m�s selecionado';
        btnimprimir.Enabled  := false;
        btnSair.Caption:='Voltar';
        btnSair.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Ok.bmp');
        EstadoInicialDosBotoes;
        
    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELAT�RIO  ACESSOS   DOS  FUNCION�RIOS' then
    begin
           relLogsTodosFuncs   := true;
           pnl_Periodo.Visible := True;
           pnl_Periodo.Align   := alClient;
           edt_DataInicio.Date :=  date;
           edt_DataFim.Date    :=  date;
           pnl_Periodo.BringToFront;

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELAT�RIO  DE ACESSOS  DO  FUNCION�RIO' then
    begin

           pnl_Periodo.Visible := True;
           pnl_Periodo.Align   := alClient;
           edt_DataInicio.Date :=  date;
           edt_DataFim.Date    :=  date;
           pnl_Periodo.BringToFront;  

    end;  

end;

procedure TF_FUNCIONARIOS.btnimprimirClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

          pan_titulo.Caption:= 'Controle de funcion�rios - Imprimindo...';
          LogOperacoes(NomeDoUsuarioLogado, 'acesso a relat�rios de funcion�rios');
          lstEscolheTipoRel.Visible     := True;
          lstEscolheTipoRel.Align       := alClient;  

     end;

end;

procedure TF_FUNCIONARIOS.btnSairConsClientesClick(Sender: TObject);
begin

    pangrid_visualizacao.BringToFront;
    pan_titulo.Caption:= 'Controle de funcion�rios - Visualizando...';
    HabilitarBotoes;

end;

procedure TF_FUNCIONARIOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if key= vk_F5 then
     begin

         HabilitarBotoes;
         txtMsg.Visible           := false;
         edtFiltro.Enabled       := true;
         edtFiltro.SetFocus;

     end;
              
end;


procedure TF_FUNCIONARIOS.MostrandoDadosTelaInicial;
begin
     
      with DM_Pesq.cdsPesqFuncionarios do
      begin

          Close;
          CommandText:= (sqlDefalt);
          Open;

            if not IsEmpty then
            begin

                dbedtCONT_NOME1.DataSource          :=  DM_Pesq.dsPesqFuncionarios;
                dbedtCONT_NOME1.DataField           := 'FUNC_NOME';

                dbedtCONT_LOGIN.DataSource          :=  DM_Pesq.dsPesqFuncionarios;
                dbedtCONT_LOGIN.DataField           := 'FUNC_LOGIN';

                dbedtCONT_ENDERECO.DataSource       :=  DM_Pesq.dsPesqFuncionarios;
                dbedtCONT_ENDERECO.DataField        := 'FUNC_ENDERECO';

                dbedtFUNC_COMPLEMENTO.DataSource    :=  DM_Pesq.dsPesqFuncionarios;
                dbedtFUNC_COMPLEMENTO.DataField     := 'FUNC_COMPLEMENTO';

                dbedtCONT_ID.DataSource             :=  DM_Pesq.dsPesqFuncionarios;
                dbedtCONT_ID.DataField              := 'FUNC_ID';

                dbedtCONT_BAIRRO.DataSource         :=  DM_Pesq.dsPesqFuncionarios;
                dbedtCONT_BAIRRO.DataField          := 'FUNC_BAIRRO';

                dbedtCONT_CEP.DataSource            :=  DM_Pesq.dsPesqFuncionarios;
                dbedtCONT_CEP.DataField             := 'FUNC_CEP';

                dbedtCONT_EMAIL.DataSource          :=  DM_Pesq.dsPesqFuncionarios;
                dbedtCONT_EMAIL.DataField           := 'FUNC_EMAIL';

                dbedtCONT_DATACAD.DataSource        :=  DM_Pesq.dsPesqFuncionarios;
                dbedtCONT_DATACAD.DataField         := 'FUNC_DATACAD';

                dbedtFUNC_DATANASCTO.DataSource     :=  DM_Pesq.dsPesqFuncionarios;
                dbedtFUNC_DATANASCTO.DataField      := 'FUNC_DATANASCTO';

                dbedtCONT_TELEFONE1.DataSource      :=  DM_Pesq.dsPesqFuncionarios;
                dbedtCONT_TELEFONE1.DataField       := 'FUNC_TELEFONE1';

                dbedtCONT_TELEFONE2.DataSource      :=  DM_Pesq.dsPesqFuncionarios;
                dbedtCONT_TELEFONE2.DataField       := 'FUNC_TELEFONE2';

                dbedtCONT_CELULAR1.DataSource       :=  DM_Pesq.dsPesqFuncionarios;
                dbedtCONT_CELULAR1.DataField        := 'FUNC_CELULAR1';

                dbedtCONT_CELULAR2.DataSource       :=  DM_Pesq.dsPesqFuncionarios;
                dbedtCONT_CELULAR2.DataField        := 'FUNC_CELULAR2';

                memoTelaPrincipal.DataSource        :=  DM_Pesq.dsPesqFuncionarios;
                memoTelaPrincipal.DataField         := 'FUNC_OBS';

                edt_tipoacesso.DataSource           :=  DM_Pesq.dsPesqFuncionarios;
                edt_tipoacesso.DataField            := 'FUNCAO_DESCRICAO';


                with GridTelaPrincipal do
                begin

                  DataSource:=  DM_Pesq.dsPesqFuncionarios;
                  Columns.Clear;

                  Columns.Add;
                  Columns[0].FieldName         := 'FUNC_NOME';
                  Columns[0].Width             := 390;
                  Columns[0].Alignment         := taLeftJustify;
                  Columns[0].Title.caption     := 'FUNCIONARIOS';
                  Columns[0].Title.Font.Style  := [fsBold];

                end;
            end;
      end;    
end;


procedure TF_FUNCIONARIOS.btnConsPorClienteClick(Sender: TObject);
begin

     edtFiltro.Clear;
     edtFiltro.SetFocus;
     MostrandoDadosTelaInicial;

end;

procedure TF_FUNCIONARIOS.edtFiltroChange(Sender: TObject);
begin
   FiltrarPorNome;
end;


procedure TF_FUNCIONARIOS.FiltrarPorNome;
var
  nome : string;
begin

       nome := edtFiltro.Text;

       _Sql :='select u.*, f.* FROM funcionarios u INNER JOIN funcoes f ON u.func_funcaoid = f.funcao_id WHERE u.func_id > 1 '+
              'AND u.func_status = '+QuotedStr('A')+' AND u.func_nome LIKE (''%'+nome+'%'') '+
              'ORDER BY u.func_nome, u.func_login';
      
      with DM_Pesq.cdsPesqFuncionarios do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;   

end;

procedure TF_FUNCIONARIOS.PesquisarPeriodosDeAniversariantes;
begin

         _Sql := 'SELECT func_nome, func_datanascto FROM funcionarios '+
                 'WHERE EXTRACT(MONTH FROM func_datanascto) = :pMes AND func_id > 1 '+
                 'AND func_status = '+QuotedStr('A')+' '+
                 'ORDER BY EXTRACT(DAY FROM func_datanascto)';

         Application.CreateForm(TQ_RelFuncAniversariantes,  Q_RelFuncAniversariantes);
         with Q_RelFuncAniversariantes.cds_RelFuncAniversariantes do begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pMes').AsString := MesEscolhido;
            Open;


              if not Q_RelFuncAniversariantes.cds_RelFuncAniversariantes.IsEmpty then begin

                   with Q_RelFuncAniversariantes do
                   begin

                      qry_RelFuncAniversariantes.SQL.Add(_Sql);
                      cds_RelFuncAniversariantes.Active := true;
                      lblnomeDoMes.Caption              := retornarNomeMes(StrToInt(MesEscolhido));
                      ReportTitle                       := 'Lista de Funcion�rios Aniversariantes do m�s de '+retornarNomeMes(StrToInt(MesEscolhido));
                      Preview;

                   end

              end
              else begin

                texto := 'Nenhum funcion�rio aniversariante no m�s de '+retornarNomeMes(StrToInt(MesEscolhido))+'!';
                Application.MessageBox(Pchar(texto), 'Nenhum funcion�rio aniversariante!',MB_OK + MB_ICONWARNING);

              end;

         end;
         FreeAndNil(Q_RelFuncAniversariantes);
end;


procedure TF_FUNCIONARIOS.lstMesesDoAnoClick(Sender: TObject);
begin

    case lstMesesDoAno.ItemIndex of

        0: MesEscolhido := '1';  //JANEIRO
        1: MesEscolhido := '2';  //FEVEREIRO
        2: MesEscolhido := '3';  //MAR�O
        3: MesEscolhido := '4';  //ABRIL
        4: MesEscolhido := '5';  //MAIO
        5: MesEscolhido := '6';  //JUNHO
        6: MesEscolhido := '7';  //JULHO
        7: MesEscolhido := '8';  //AGOSTO
        8: MesEscolhido := '9';  //SETEMBRO
        9: MesEscolhido := '10'; //OUTUBRO
       10: MesEscolhido := '11'; //NOVEMBRO
       11: MesEscolhido := '12'; //DEZEMBRO

    end;

    PesquisarPeriodosDeAniversariantes;

end;

procedure TF_FUNCIONARIOS.lstMesesDoAnoKeyPress(Sender: TObject;
  var Key: Char);
begin

      if key=#27 then begin

         lstMesesDoAno.Visible := false;

          //Habilitando os bot�es
          pan_botoes.Enabled := true;
          pan_titulo.Caption:='Controle de funcion�rios - Visualizando...';

      end;

end;

procedure TF_FUNCIONARIOS.edt_DDDFONEKeyPress(Sender: TObject;
  var Key: Char);
begin

     // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure TF_FUNCIONARIOS.edt_DDDFONE2KeyPress(Sender: TObject;
  var Key: Char);
begin

     // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure TF_FUNCIONARIOS.dbedt13Enter(Sender: TObject);
begin

    btnRetornar.Enabled:= true;

end;

procedure TF_FUNCIONARIOS.edtFiltroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if KEY = VK_RETURN then
     begin
          edtFiltro.Clear;
          btnCadastros.Caption := 'Cadastro Inicial';
          btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');
          EstadoInicialDosBotoes;
      end;

end;


procedure TF_FUNCIONARIOS.GridTelaPrincipalCellClick(Column: TColumn);
begin

    idContSelecionado    :=  DM_Pesq.cdsPesqFuncionarios.fieldbyname('func_id').AsInteger;
    edtFiltro.SetFocus;

    btnCadastros.Caption := 'Voltar';
    btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Ok.bmp');
    btnAlterar.Enabled:=true;
    btnInativar.Enabled:=true;
    btnimprimir.Enabled:=true;

end;

procedure TF_FUNCIONARIOS.msk_cepChange(Sender: TObject);
begin

    if Length(Trim(msk_cep.Text)) = 9 then  edt_complemento.setfocus;

end;

procedure TF_FUNCIONARIOS.msk_FoneChange(Sender: TObject);
begin

    if Length(Trim(msk_Fone.Text)) = 9 then  msk_Fone2.setfocus;

end;

procedure TF_FUNCIONARIOS.msk_Fone2Change(Sender: TObject);
begin

    if Length(Trim(msk_Fone2.Text)) = 9 then  msk_Fone3.setfocus;

end;

procedure TF_FUNCIONARIOS.msk_Fone3Change(Sender: TObject);
begin

    if Length(Trim(msk_Fone3.Text)) = 10 then  msk_Fone4.setfocus;

end;

procedure TF_FUNCIONARIOS.msk_Fone4Change(Sender: TObject);
begin

    if Length(Trim(msk_Fone4.Text)) = 10 then  memoInclusaoObs.setfocus;

end;

procedure TF_FUNCIONARIOS.msk_telChange(Sender: TObject);
begin

    if Length(Trim(msk_tel.Text)) = 9 then  msk_tel2.setfocus;

end;

procedure TF_FUNCIONARIOS.msk_tel2Change(Sender: TObject);
begin

    if Length(Trim(msk_tel2.Text)) = 9 then  msk_tel3.setfocus;

end;

procedure TF_FUNCIONARIOS.msk_tel3Change(Sender: TObject);
begin

    if Length(Trim(msk_tel3.Text)) = 10 then  msk_tel4.setfocus;

end;

procedure TF_FUNCIONARIOS.msk_tel4Change(Sender: TObject);
begin

    if Length(Trim(msk_tel4.Text)) = 10 then  memoAlteraObs.setfocus;

end;

procedure TF_FUNCIONARIOS.edt_apelidoEnter(Sender: TObject);
begin

     //digitou um nome abre o botao salvar
     btnConfirmaInclusao.Enabled := true;

end;

procedure TF_FUNCIONARIOS.AtualizaQde;
begin
    //procedimento local que informa a quantidade de registros na tabela
    qdeRegs               := retornaQuantidadeRegsAtivosTabela('func_id','funcionarios','func_status')-1;   //exclus�o do reg da ADMINISTRACAO
    txtMsg.Caption        := 'Total de funcion�rios cadastrados '+ IntToStr( qdeRegs );
    txtMsg.Color          := clWhite;
    txtMsg.Visible        := true;
    txtMsg.Font.Color     := clBlue;

end;

procedure TF_FUNCIONARIOS.memoTelaPrincipalEnter(Sender: TObject);
begin
edtFiltro.SetFocus;
end;

procedure TF_FUNCIONARIOS.lblListaTiposDeAcessoParaInclusaoClick(Sender: TObject);
begin

  if (cadastrando)then
  begin
    AbrirListaTiposDeAcessoCadastroAlteracao;
    lblListaTiposDeAcessoParaInclusao.Caption := sTringGeral;
    edt_endereco.SetFocus;
    alterouFuncao := true;
  end;
end;

procedure TF_FUNCIONARIOS.AbrirListaTiposDeAcessoCadastroAlteracao;
begin

      //dados necess�rios para acessar lista padrao com apenas um campo
       nomeTabela    := 'FUNCOES';
       campoNome     := 'FUNCAO_DESCRICAO';
       campoID       := 'FUNCAO_ID';
       cdsTable      := dm_DadosSegundo.cds_CadFuncoes;
       dsTable       := dm_DadosSegundo.ds_CadFuncoes;
       
      Application.CreateForm(T_frmListaPadraoComUmCampo,  _frmListaPadraoComUmCampo);
      _frmListaPadraoComUmCampo.ShowModal;
      FreeAndNil(_frmListaPadraoComUmCampo);    

end;

procedure TF_FUNCIONARIOS.edt_nomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if(key = 13)then
  begin
      cadastrando:=true;  
  end;
end;

procedure TF_FUNCIONARIOS.edt_enderecoExit(Sender: TObject);
begin
  btnConfirmaInclusao.Enabled:= true;  
end;

procedure TF_FUNCIONARIOS.memoInclusaoObsEnter(Sender: TObject);
begin
   //posicionando o cursor na primeira linha do Memo
   memoInclusaoObs.SelStart := Perform(EM_LINEINDEX, 0, 0);
end;

procedure TF_FUNCIONARIOS.lblListaAcessosParaAlteracaoClick(
  Sender: TObject);
var
  intFunc : integer;
begin
      //RECEBE O ID DO FUNCIONARIO SELECIONADO PARA SER MOSTRADO NO GRID DE NOMES PRA SER REINICIADO A SENHA
       idUsuarioSelecionado       := StrToInt(db_CONT_ID.Text);
       intFunc := 0;
       
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

       //CASO SEJA ADMINISTRADOR ESTARA LIBERADO PARA ALTERA��O DE SENHAS => CASO SEJA USUARIO SOMENTE TER� ACESSO A SUA PROPRIA SENHA PARA ALTERA��O
       if (intFunc <= 2) then
       begin

            if not(cadastrando)then
            begin
              AbrirListaTiposDeAcessoCadastroAlteracao;
              lblListaAcessosParaAlteracao.Caption := sTringGeral;
              dbIDdaLista.Text := IntToStr(IdGeral);
              memoAlteraObs.SetFocus;
            end;

       end else
       begin

             messagedlg('Aten��o voc� n�o tem permiss�o para atualizar os tipos de acessos!',mtwarning,[mbyes],0);

       end;

end;

procedure TF_FUNCIONARIOS.memoAlteraObsEnter(Sender: TObject);
begin
  memoAlteraObs.SelStart := Perform(EM_LINEINDEX, 0, 0);
end;

procedure TF_FUNCIONARIOS.btnSenhasClick(Sender: TObject);
begin

            idUsuarioSelecionado       := StrToInt(db_CONT_ID.Text);

            if MessageDlg('Confirma a reinicializa��o da senha do usu�rio?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
            Begin

                GerarSenhaInicial(idUsuarioSelecionado);
                messagedlg('A senha do usu�rio foi reiniciada com sucesso, devendo ser alterada no pr�ximo acesso!',mtWarning,[mbyes],0);
                LogOperacoes(NomeDoUsuarioLogado, 'acesso a altera��o de senha');
                controleNumerico := 1;
                DefinirEstadoBotaoSenhas;

            end else
            begin

                exit;

            end;

end;

procedure TF_FUNCIONARIOS.edtAlteraNomeEnter(Sender: TObject);
begin
  btnSenhas.Enabled := true;
end;



procedure TF_FUNCIONARIOS.btnPesquisarClick(Sender: TObject);
begin
    if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
    begin

        Application.MessageBox('� necess�rio uma data inicial e uma data final para efetuar a pesquisa !', 'Per�odo Inv�lido!', MB_OK);
        edt_DataInicio.SetFocus;

    end else
    begin
         periodo := edt_DataInicio.Text+' a '+edt_DataFim.Text;

         if(relLogsTodosFuncs)then
         begin
           PesquisarPeriodoTodosFunc;
         end else
         begin
          PesquisarPeriodoLogsIndividual;
         end;
         
    end;
    EstadoInicialDosBotoes;
end;


procedure TF_FUNCIONARIOS.PesquisarPeriodoTodosFunc;
var
  DataInicio, DataFim : TDate;
begin

      if edt_DataFim.Date >= edt_DataInicio.Date then
       begin

            DataInicio  := StrToDate(edt_DataInicio.text);
            DataFim     := StrToDate(edt_DataFim.text);

             pnl_Periodo.Visible := False;

             Application.CreateForm(TQ_RelAcessos,  Q_RelAcessos);

             with Q_RelAcessos.cds_LogAcessos do
             begin

                Close;
                Params.ParamByName('datainicial').AsDate := DataInicio;
                Params.ParamByName('datafinal').AsDate   := DataFim;
                Open;

             end;

               Q_RelAcessos.cds_LogAcessos.Active:= True;
               Q_RelAcessos.ReportTitle:='Relat�rio Acessos de Funcion�rios Per�odo '+periodo;
               Q_RelAcessos.Preview;

               edt_DataInicio.Text := '';
               edt_DataFim.Text    := '';

             end else begin

             Application.MessageBox('A data final deve ser maior que a data inicial!', 'Per�odo Inv�lido!', MB_OK);
             edt_DataFim.SetFocus;

      end;
      relLogsTodosFuncs := false;
      FreeAndNil(Q_RelAcessos);
end;

procedure TF_FUNCIONARIOS.PesquisarPeriodoLogsIndividual;
var
  DataInicio, DataFim : TDate;
begin

      if ( edt_DataFim.Date >= edt_DataInicio.Date )then
       begin

            DataInicio  := StrToDate(edt_DataInicio.text);
            DataFim     := StrToDate(edt_DataFim.text);

             pnl_Periodo.Visible := False;

             Application.CreateForm(TQ_RelAcessosIndividual,  Q_RelAcessosIndividual);

             with Q_RelAcessosIndividual.cds_LogAcessosIndividual do
             begin

                Close;
                Params.ParamByName('pIdFunc').AsInteger  := idContSelecionado;
                Params.ParamByName('datainicial').AsDate := DataInicio;
                Params.ParamByName('datafinal').AsDate   := DataFim;
                Open;

             end;

             Q_RelAcessosIndividual.ReportTitle := 'Relat�rio de acessos de '+dbedtCONT_NOME1.Text+' Per�odo '+periodo;;
             Q_RelAcessosIndividual.cds_LogAcessosIndividual.Active:=true;
             Q_RelAcessosIndividual.Preview;
             FreeAndNil(Q_RelAcessosIndividual);

             edt_DataInicio.Text := '';
             edt_DataFim.Text    := '';

      end else begin

             Application.MessageBox('A data final deve ser maior que a data inicial!', 'Per�odo Inv�lido!', MB_OK);
             edt_DataFim.SetFocus;

      end;
end;


procedure TF_FUNCIONARIOS.VerificaPermissaoAlteracaoSenhaParaUsuarioLogado;
begin

      //FAZER VERIFICACAO : O USUARIO COMUM NAO PODE REINICIAR A SENHA DE NINGUEM SOMENTE A SUA PROPRIA
      //VERIFICO PRIMEIRO QUAL O ID DA FUNCAO DE QUEM ESTA LOGADO

      intFunc := 0;

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


      if( intFunc = 1 ) or (intFunc = 2)then    //CASO SEJA ADMINISTRADOR/SISTEMA ESTARA LIBERADO PARA ALTERA��O DE SENHAS
       begin

              btnSenhas.Enabled:= true;

       end else if( (intFunc > 2) AND (IdDoUsuarioLogado = StrToInt(db_CONT_ID.Text)) )then    //CASO O USU�RIO COMUM ESTEJA ALTERANDO SUA PR�PRIA SENHA LIBERA ALTERA��O
       begin

            btnSenhas.Enabled:= true;

       end else if( (intFunc > 2) AND (IdDoUsuarioLogado <> StrToInt(db_CONT_ID.Text)) )then   //CASO O USU�RIO COMUM ESTEJA ALTERANDO A SENHA DE OUTRO USUA�RIO BLOQUEAR ALTERA��O
       begin

            btnSenhas.Enabled:= false;

       end;

end;


procedure TF_FUNCIONARIOS.DefinirEstadoBotaoSenhas;
begin

    if(controleNumerico = 0)then
    begin
       btnSenhas.Enabled := true;
    end else begin
      btnSenhas.Enabled := false;
    end;

end;

procedure TF_FUNCIONARIOS.EstadoInicialDosBotoes;
begin

    btnCadastros  .Enabled := true;
    btnAlterar    .Enabled := false;
    btnInativar   .Enabled := false;
    btnimprimir   .Enabled := false;
    btnSair       .Enabled := true;
    btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');
    btnCadastros.Caption:='Cadastrar';
    btnSair.Caption :='Sair';
    btnSair.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Sair.bmp');
    edtFiltro.Clear;

end;


procedure TF_FUNCIONARIOS.edtFiltroKeyPress(Sender: TObject;
  var Key: Char);
begin
      btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Ok.bmp');
      btnAlterar.Enabled:=false;
      btnInativar.Enabled:=false;
      btnimprimir.Enabled:=false;
      btnCadastros.Caption:='Voltar';
end;

procedure TF_FUNCIONARIOS.btnFecharClick(Sender: TObject);
begin
    pnl_Periodo.Visible:=false;
    EstadoInicialDosBotoes;
end;

procedure TF_FUNCIONARIOS.edt_DataCadastroClick(Sender: TObject);
begin
    edt_DataCadastro.SelectAll;
end;

procedure TF_FUNCIONARIOS.msk_AlteraDataNasctoClick(Sender: TObject);
begin
  msk_AlteraDataNascto.SelectAll;
end;

procedure TF_FUNCIONARIOS.edt_DataInicioClick(Sender: TObject);
begin
  edt_DataInicio.SelectAll;
end;

procedure TF_FUNCIONARIOS.edt_DataFimClick(Sender: TObject);
begin
  edt_DataFim.SelectAll;
end;

end.

