unit U_Contatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ToolEdit, RXDBCtrl, Math, DB;

type
  T_frmContatos = class(TForm)
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
    lbl18: TLabel;
    lbl15: TLabel;
    msk_cep: TMaskEdit;
    edt_nome: TEdit;
    edt_endereco: TEdit;
    edt_bairro: TEdit;
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
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl34: TLabel;
    dbedtCONT_NOME: TDBEdit;
    dbedtCONT_ENDERECO1: TDBEdit;
    dbedtCONT_COMPLEMENTO1: TDBEdit;
    dbedtCONT_EMAIL1: TDBEdit;
    dbedtCONT_DATACAD2: TDBEdit;
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
    lbl4: TLabel;
    lbl5: TLabel;
    lbl28: TLabel;
    lblFone: TLabel;
    dbgrd_Contatos: TDBGrid;
    dbedtCONT_DATACAD: TDBEdit;
    dbedtCONT_NOME1: TDBEdit;
    dbedtCONT_ENDERECO: TDBEdit;
    dbedtCONT_CEP: TDBEdit;
    dbedtCONT_BAIRRO: TDBEdit;
    dbedtCONT_EMAIL: TDBEdit;
    dbedtCONT_ID: TDBEdit;
    lstEscolheTipoRel: TListBox;
    lblStatusLogoff: TLabel;
    lbl49: TLabel;
    db_CONT_ID: TDBEdit;
    lbl50: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    dbedtCONT_TELEFONE1: TDBEdit;
    dbedtCONT_TELEFONE2: TDBEdit;
    dbedtCONT_CELULAR1: TDBEdit;
    dbedtCONT_CELULAR2: TDBEdit;
    lbl16: TLabel;
    lblFones: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    edt_email: TEdit;
    msk_Fone: TMaskEdit;
    msk_Fone2: TMaskEdit;
    Label26: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label34: TLabel;
    msk_tel2: TMaskEdit;
    msk_tel4: TMaskEdit;
    msk_tel: TMaskEdit;
    GroupBox9: TGroupBox;
    edtFiltro: TEdit;
    msk_Fone4: TMaskEdit;
    txtMsg: TStaticText;
    msk_Fone3: TMaskEdit;
    msk_tel3: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    edt_obs: TEdit;
    dbSegID: TDBEdit;
    lblSegmento: TStaticText;
    btnCadNovoSegmento: TButton;
    lblListaSegmentosParaInclusao: TStaticText;
    edt_seguimento: TDBEdit;
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
    procedure AbrirFormCadastroPadrao;
    procedure AbrirListaDeSegmentosCadastroAlteracaoDeContatos;
    procedure edt_nomeChange(Sender: TObject);
    procedure dbedtCONT_NOMEChange(Sender: TObject);
    procedure dbedtCONT_APELIDO1Change(Sender: TObject);
    procedure dbedtCONT_ENDERECO1Change(Sender: TObject);
    procedure msk_cep2Change(Sender: TObject);
    procedure btnCancelarAlteracaoClick(Sender: TObject);
    procedure HabilitarBotoes;
    procedure DesabilitarBotoes;
    procedure DesabilitarBotoesParcialmente;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure PopularDBMostraSegmentosAlteracao;
    procedure msk_cep2KeyPress(Sender: TObject; var Key: Char);
    procedure dbedtCONT_STATUS2KeyPress(Sender: TObject; var Key: Char);
    procedure msk_cepKeyPress(Sender: TObject; var Key: Char);
    procedure edt_statusKeyPress(Sender: TObject; var Key: Char);
    procedure combo_Altera_StatusChange(Sender: TObject);
    procedure Abrir_Fechar_Tabelas;
    procedure Combo_Altera_FuncaoClick(Sender: TObject);
    procedure dbCONT_SEGMENTOClick(Sender: TObject);
    procedure edt_nomeExit(Sender: TObject);
    procedure lstEscolheTipoRelClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnSairPermissoesClick(Sender: TObject);
    procedure edt_UsuarioParaAlteracaoChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edt_comissaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnRetornarDaInclusaoClick(Sender: TObject);
    procedure MostrarContatoTelaInicial;
    procedure FormShow(Sender: TObject);
    procedure msk_dtNascButtonClick(Sender: TObject);
    procedure msk_dtNascChange(Sender: TObject);
    procedure edtFiltroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FiltrarPorNome;
    procedure edtFiltroChange(Sender: TObject);
    procedure dbedtCONT_NOMEExit(Sender: TObject);
    procedure dbgrd_ContatosCellClick(Column: TColumn);
    procedure edt_apelidoEnter(Sender: TObject);
    procedure msk_FoneChange(Sender: TObject);
    procedure msk_Fone2Change(Sender: TObject);
    procedure msk_Fone3Change(Sender: TObject);
    procedure msk_Fone4Change(Sender: TObject);
    procedure msk_cepChange(Sender: TObject);
    procedure AtualizaQde;
    procedure edt_IncluirUsuarioEnter(Sender: TObject);
    procedure lblSegmentoClick(Sender: TObject);
    procedure btnCadNovoSegmentoClick(Sender: TObject);
    procedure edt_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_enderecoExit(Sender: TObject);
    procedure msk_telChange(Sender: TObject);
    procedure msk_tel2Change(Sender: TObject);
    procedure msk_tel3Change(Sender: TObject);
    procedure msk_tel4Change(Sender: TObject);
    procedure lblListaSegmentosParaInclusaoClick(Sender: TObject);
    procedure edt_seguimentoEnter(Sender: TObject);
    procedure edtFiltroClick(Sender: TObject);
    


  private
    { Private declarations }
    idContSelecionado, intContato : integer;
    sqlDefalt, nome, endereco, bairro, cep, tel1,tel2,cel1,cel2,email,status,idcont, segid, data, obs : string;

  public
    { Public declarations }

  end;

var
  _frmContatos: T_frmContatos;
  proxNum, proxNumLogin, proxNumPermissao, proxNumFuncIdLogin, cont : Integer;


implementation

uses U_dmDados, U_dmDadosSegundo,
  U_dmPesquisas, U_BiblioSysSalao, U_QRelFuncCompleto, U_QRelFuncParcial,
  U_Login, U_CadSenhaUsuario, U_principal,  DBClient, Midas,
  U_QRelLogAcessos, U_ReiniciarSenhaUsuario, U_ListaSegmentos, U_Segmentos,
  U_CadastroPadraoUmCampo, U_ListaPadraoComUmCampo, U_QRelContatosCompleto,
  U_RelContatosIndividual;

{$R *.dfm}


procedure T_frmContatos.FormCreate(Sender: TObject);
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

procedure T_frmContatos.FormShow(Sender: TObject);
begin

     sqlDefalt := 'select c.*, s.* FROM contatos c INNER JOIN segmentos s ON s.id_segmento = c.cont_segid WHERE c.cont_status = '+QuotedStr('A')+' ORDER BY c.cont_nome';
     pan_titulo.Caption:= 'Controle de Contatos - Visualizando...';
     AbrirTabelas;
     MostrarContatoTelaInicial;
     edtFiltro.SetFocus;
     AtualizaQde;

end;


procedure T_frmContatos.AbrirTabelas;
begin

    dm_DadosSegundo.cds_Contatos.Active := True;


end;

procedure T_frmContatos.FecharTabelas;
begin

    dm_DadosSegundo.cds_Contatos.Active        := False;

end;


procedure T_frmContatos.Abrir_Fechar_Tabelas;
begin

    dm_DadosSegundo.cds_Contatos.Active        := False;
    dm_DadosSegundo.cds_Contatos.Active        := True;

end;


procedure T_frmContatos.btnInativarClick(Sender: TObject);
begin

       if dm_DadosSegundo.cds_Contatos.RecordCount = 0 then begin

            Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);

        end
        else begin

          DesabilitarBotoes;
          pan_titulo.Caption:= 'Controle de Contatos - Inativando...';

          texto:= 'Confirma o desejo de inativar o Contato '+dbedtCONT_NOME1.Text+ '?';

          if Application.MessageBox(PChar(texto),'Inativar Contato',MB_YESNO + MB_ICONQUESTION) = IdYes then
          begin

              _Sql := 'UPDATE contatos SET cont_status = '+QuotedStr('I')+' WHERE cont_id = :pIDCont';

               with DM_Pesq.Qry_Geral do
               begin

                   close;
                   sql.Clear;
                   sql.Add(_Sql);
                   Params.ParamByName('pIDCont').AsInteger :=  StrToInt(dbedtCONT_ID.Text);
                   ExecSQL;

               end;

              Application.MessageBox('O Contato foi inativado com sucesso!',
              'Inativo', MB_OK);

              Abrir_Fechar_Tabelas;
              AtualizaQde;
              pan_titulo.Caption:= 'Controle de Contatos - Visualizando...';
              HabilitarBotoes;
              btnInativar.Enabled:=false;
              btnimprimir.Enabled  := false;
          end else begin

              dm_DadosSegundo.cds_Contatos.CancelUpdates;
              pan_titulo.Caption:= 'Controle de Contatos - Visualizando...';
              HabilitarBotoes;
              btnimprimir.Enabled  := false;

         end;

      end;

      Abrir_Fechar_Tabelas;
      btnimprimir.Enabled  := false;
end;


procedure T_frmContatos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  FecharTabelas;
  Release;

end;

procedure T_frmContatos.btnCadastrosClick(Sender: TObject);

begin
     cadastrando:=true;
     edt_nome.SetFocus;
     pan_titulo.Caption:= 'Controle de Contatos - Incluindo...';
     pnl_visualizacao.SendToBack;
     pnl_inclusao.BringToFront;
     DesabilitarBotoes;
     dbgrd_Contatos.Enabled  := True;

end;

procedure T_frmContatos.btnConfirmaInclusaoClick(Sender: TObject);
begin

  if (( edt_endereco.Text = '') or ( edt_nome.Text = '') and (cadastrando)) then
  begin

       Application.MessageBox('Preencha os campos para incluir um novo contato!', 'Campos vazios', MB_OK);
       edt_nome.SetFocus;

  end else begin

     GravaRegs;
     LogOperacoes(NomeDoUsuarioLogado, 'cadastro de novo contato');
     DesabilitarBotoes;
     btnRetornarDaInclusao.Enabled := true;
     
  end;

end;


procedure T_frmContatos.GravaRegs;
begin

         nome     := edt_nome.Text;
         endereco := edt_endereco.Text;       
         bairro   := edt_bairro.Text;
         cep      := msk_cep.Text;
         tel1     := msk_Fone.Text;
         tel2     := msk_Fone2.Text;
         cel1     := msk_Fone3.Text;
         cel2     := msk_Fone4.Text;
         email    := edt_email.Text;
         data     := edt_DataCadastro.Text;
         status   := 'A';
         obs      := edt_obs.Text;
         
         _Sql := 'insert into contatos (cont_id, cont_nome, cont_segid, cont_endereco, cont_bairro, cont_cep, cont_telefone1, cont_telefone2, cont_celular1, cont_celular2, cont_email, cont_datacad, cont_status, cont_obs) '+
                 'values (:cont_id, :cont_nome, :cont_segid, :cont_endereco, :cont_bairro, :cont_cep, :cont_telefone1, :cont_telefone2, :cont_celular1, :cont_celular2, :cont_email, :cont_datacad, :cont_status, :cont_obs)';

         with DM_Pesq.Qry_Auxiliar do
         begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             ParamByName('cont_id').AsInteger           :=  GerarProximoID('cont_id','contatos');
             ParamByName('cont_nome').AsString          :=  nome;
             ParamByName('cont_segid').AsInteger        :=  IdGeral;
             ParamByName('cont_endereco').AsString      :=  endereco;
             ParamByName('cont_bairro').AsString        :=  bairro;
             ParamByName('cont_cep').AsString           :=  cep;
             ParamByName('cont_telefone1').AsString     :=  tel1;
             ParamByName('cont_telefone2').AsString     :=  tel2;
             ParamByName('cont_celular1').AsString      :=  cel1;
             ParamByName('cont_celular2').AsString      :=  cel2;
             ParamByName('cont_email').AsString         :=  email;
             ParamByName('cont_datacad').AsString       :=  data;
             ParamByName('cont_status').AsString        :=  status;
             ParamByName('cont_obs').AsString           :=  obs;
             ExecSQL;

        end;

       Application.MessageBox('Contato cadastrado com sucesso!', 'Cadastro de contato', MB_OK);
       AtualizaQde;
       Limpar;
       cadastrando:=false;

end;


procedure T_frmContatos.btnAlterarClick(Sender: TObject);
begin
 intContato := 0;
 IdGeral    := StrToInt(dbSegID.Text);

 if dm_DadosSegundo.cds_Contatos.RecordCount = 0 then
 begin

    Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);
    exit;

  end
  else begin

          //listando o segmento atual para edição caso necessario
          PopularDBMostraSegmentosAlteracao;

          pan_titulo.Caption:= 'Controle de Contatos - Alterando...';
          pnl_visualizacao.SendToBack;
          pnl_alteracao.BringToFront;
          DesabilitarBotoes;
          btnRetornarDaAlteracao.Enabled:= true;
          //mostrando os valores dos edits com mascaras
          BancoParaEdts;
          btnalterar.Enabled   := false;
          dbedtCONT_NOME.SetFocus;

          if dm_DadosSegundo.cds_Contatos.State in [DsEdit,DsInsert] then
          ShowMessage('Edição'); // Esta mensagem NÃO é exibida

  end;

end;

procedure T_frmContatos.btnCancelarInclusaoClick(Sender: TObject);
begin

    dm_DadosSegundo.cds_Contatos.Cancel;
    Limpar;
    btnRetornarDaInclusao.Enabled := true;
    btnConfirmaInclusao.Enabled   := False;
    btnCancelarInclusao.Enabled   := false;

end;


procedure T_frmContatos.btnRetornarDaAlteracaoClick(Sender: TObject);
begin

      pnl_visualizacao.BringToFront;
      edtFiltro.SetFocus;
      pan_titulo.Caption:= 'Controle de Contatos - Visualizando...';
      DesabilitarBotoesParcialmente;
      Abrir_Fechar_Tabelas;

end;

procedure T_frmContatos.Limpar;
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
      edt_DataCadastro.Text     := DateToStr(now);
      edt_nome.SetFocus;
      pan_titulo.Caption:= 'Controle de Contatos - Incluindo...';
      lblListaSegmentosParaInclusao.Caption := '';
      cadastrando:=false;
      btnCadNovoSegmento.Enabled := false;


end;

procedure T_frmContatos.GravarAlteracoes;
begin

         
         nome     := dbedtCONT_NOME.Text;
         endereco := dbedtCONT_ENDERECO1.Text;
         segid    := dbSegID.Text;
         bairro   := dbedtCONT_COMPLEMENTO1.Text;
         cep      := msk_cep2.Text;
         tel1     := msk_tel.Text;
         tel2     := msk_tel2.Text;
         cel1     := msk_tel3.Text;
         cel2     := msk_tel4.Text;
         email    := dbedtCONT_EMAIL1.Text;
         status   := combo_Altera_Status.Text;
         idcont   := db_CONT_ID.Text;

         _Sql :='UPDATE contatos SET cont_nome = :cont_nome, cont_segid = :cont_segid, cont_endereco = :cont_endereco, cont_bairro = :cont_bairro,  '+
                 'cont_cep = :cont_cep,cont_telefone1 = :cont_telefone1,cont_telefone2 = :cont_telefone2,cont_celular1 = :cont_celular1,cont_celular2 = :cont_celular2, '+
                 'cont_email = :cont_email, cont_status = :cont_status WHERE cont_id = :pIDCont';

         with DM_Pesq.Qry_Geral do
         begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             Params.ParamByName('cont_nome').AsString          :=  nome;
             Params.ParamByName('cont_segid').AsInteger        :=  IdGeral;
             Params.ParamByName('cont_endereco').AsString      :=  endereco;
             Params.ParamByName('cont_bairro').AsString        :=  bairro;
             Params.ParamByName('cont_cep').AsString           :=  cep;
             Params.ParamByName('cont_telefone1').AsString     :=  tel1;
             Params.ParamByName('cont_telefone2').AsString     :=  tel2;
             Params.ParamByName('cont_celular1').AsString      :=  cel1;
             Params.ParamByName('cont_celular2').AsString      :=  cel2;
             Params.ParamByName('cont_email').AsString         :=  email;
             Params.ParamByName('cont_status').AsString        :=  status;
             Params.ParamByName('pIDCont').AsInteger           :=  StrToInt(idcont);

             ExecSQL;

        end;

        Application.MessageBox('Alterações feitas com sucesso!', 'OK!',
             MB_OK + MB_ICONWARNING);


end;



procedure T_frmContatos.btnConfirmaAlteracaoClick(Sender: TObject);
begin

   GravarAlteracoes;
   LogOperacoes(NomeDoUsuarioLogado, 'alteração nos dados de contato cadastrado');
   pnl_visualizacao.BringToFront;
   pan_titulo.Caption:= 'Controle de Contatos - Visualizando...';
   DesabilitarBotoesParcialmente;

end;



procedure T_frmContatos.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmContatos.BancoParaEdts;
begin

     //mostra os valore dos edits com mascara buscando do banco de dados
     _Sql := 'select c.*, s.* FROM contatos c INNER JOIN segmentos s ON s.id_segmento = c.cont_segid WHERE c.cont_status = '+QuotedStr('A')+' AND c.cont_id = :pIDCont';

     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText:= (_Sql);
         Params.ParamByName('pIDCont').AsInteger :=  idContSelecionado;
         open;

         if not IsEmpty then
         begin

             msk_cep2.Text                := DM_Pesq.cdsPesqGeral.FieldByname('cont_cep').AsString;
             msk_tel.Text                 := DM_Pesq.cdsPesqGeral.FieldByname('cont_telefone1').AsString;
             msk_tel2.Text                := DM_Pesq.cdsPesqGeral.FieldByname('cont_telefone2').AsString;
             msk_tel3.Text                := DM_Pesq.cdsPesqGeral.FieldByname('cont_celular1').AsString;
             msk_tel4.Text                := DM_Pesq.cdsPesqGeral.FieldByname('cont_celular2').AsString;
             combo_Altera_Status.Text     := DM_Pesq.cdsPesqGeral.FieldByname('cont_status').AsString;

         end;

     end;

end;   

procedure T_frmContatos.edt_nomeChange(Sender: TObject);
begin

    btnCancelarInclusao.Enabled   := True;
    btnRetornarDaInclusao.Enabled := False;  

end;

procedure T_frmContatos.dbedtCONT_NOMEChange(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled   := True;  //habilitando o botao de confirmacao de alteracao
    btnCancelarAlteracao.Enabled   := True;
    btnRetornarDaAlteracao.Enabled :=False;

end;

procedure T_frmContatos.dbedtCONT_APELIDO1Change(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled   := True;   //habilitando o botao de confirmacao de alteracao
    btnCancelarAlteracao.Enabled   := True;
    btnRetornarDaAlteracao.Enabled :=False;

end;

procedure T_frmContatos.dbedtCONT_ENDERECO1Change(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled   := True;   //habilitando o botao de confirmacao de alteracao
    btnCancelarAlteracao.Enabled   := True;
    btnRetornarDaAlteracao.Enabled :=False;

end;

procedure T_frmContatos.msk_cep2Change(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled   := True;   //habilitando o botao de confirmacao de alteracao
    btnCancelarAlteracao.Enabled   := True;
    btnRetornarDaAlteracao.Enabled :=False;
    if Length(Trim(msk_cep2.Text)) = 9 then  dbedtCONT_COMPLEMENTO1.setfocus;

end;


procedure T_frmContatos.btnCancelarAlteracaoClick(Sender: TObject);
begin

    dm_DadosSegundo.cds_Contatos.Cancel;
    //pnl_inclusao.SendToBack;
    btnRetornarDaAlteracao.Enabled:= true;
    btnConfirmaAlteracao.Enabled:= False;
    btnCancelarAlteracao.Enabled:= false;
    dbedtCONT_NOME.SetFocus;

end;


procedure T_frmContatos.btnSairClick(Sender: TObject);
begin

    close;
    HabilitarBotoes;
    release;

end;


procedure T_frmContatos.HabilitarBotoes;
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

procedure T_frmContatos.DesabilitarBotoes;
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

procedure T_frmContatos.DesabilitarBotoesParcialmente;
begin

      btnCadastros.Enabled := true;
      btnAlterar.Enabled   := false;
      btnInativar.Enabled  := false;
      btnimprimir.Enabled  := false;
      btnSair.Enabled      := true;
      edtFiltro.Clear;
      edtFiltro.SetFocus;
      

end;


procedure T_frmContatos.msk_cep2KeyPress(Sender: TObject;
  var Key: Char);
begin
         // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmContatos.dbedtCONT_STATUS2KeyPress(Sender: TObject;
  var Key: Char);
begin

        // PARA DBEDIT ACEITAR APENAS LETRAS
       if not (Key in['A'..'Z',#8]) and not (Key in['a'..'z',#8]) then
        begin
          Key := #0;
       end;

end;

procedure T_frmContatos.msk_cepKeyPress(Sender: TObject;
  var Key: Char);
begin
         // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmContatos.edt_statusKeyPress(Sender: TObject;
  var Key: Char);
begin

        // PARA DBEDIT ACEITAR APENAS LETRAS
       if not (Key in['A'..'Z',#8]) and not (Key in['a'..'z',#8]) then
        begin
          Key := #0;
       end;

end;

procedure T_frmContatos.combo_Altera_StatusChange(Sender: TObject);
begin

  btnConfirmaAlteracao.Enabled:= True;  //habilitando o botao de confirmacao de inclusao
  btnCancelarAlteracao.Enabled:= True;
  btnRetornarDaAlteracao.Enabled:= False;

end;


procedure T_frmContatos.Combo_Altera_FuncaoClick(Sender: TObject);
begin

   btnConfirmaAlteracao.Enabled   := True;
   btnCancelarAlteracao.Enabled   := True;
   btnRetornarDaAlteracao.Enabled := True;

end;

procedure T_frmContatos.dbCONT_SEGMENTOClick(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled:= True;

end;

procedure T_frmContatos.edt_nomeExit(Sender: TObject);
begin

   if(TemDuplicidade(dm_DadosSegundo.cds_Contatos,'cont_nome',edt_nome.Text))then
   begin

        Application.MessageBox('Atenção esta contato já esta cadastrado!', 'Duplicidade no nome do contato', MB_ICONEXCLAMATION);
        edt_nome.SetFocus;

   end else begin

      if(cadastrando)then
      begin
        AbrirListaDeSegmentosCadastroAlteracaoDeContatos;
        lblListaSegmentosParaInclusao.Caption := sTringGeral;
        btnCadNovoSegmento.Enabled := true;
      end;

   end;

end;

procedure T_frmContatos.lstEscolheTipoRelClick(Sender: TObject);
begin

    pan_titulo.Caption:= 'Controle de Contatos - Visualizando...';
    lstEscolheTipoRel.Visible:= False;
    lstEscolheTipoRel.Align:= alNone;
    pnl_visualizacao.Enabled:= True;

    if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO   DE  TODOS  OS  CONTATOS' then
    begin

        TotalRegs := 0;         

       _Sql :='select c.*, s.* FROM contatos c INNER JOIN segmentos s ON s.id_segmento = c.cont_segid';

       with Q_RelContatosCompleto.Qry_Dados do
       begin

          Close;
          sql.Clear;
          SQL.Add(_Sql);
          Open;

          if not IsEmpty then
          begin

             TotalRegs := Q_RelContatosCompleto.Qry_Dados.RecordCount;

          end;

       end;
       
       Q_RelContatosCompleto.QRLabelTotal.Caption    := IntToStr(TotalRegs);
       Q_RelContatosCompleto.Preview;

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO DO CONTATO SELECIONADO' then
    begin

       TotalRegs := 1;
       
       with Q_RelContatosIndividual.Qry_DadosIndividual do
       begin

          Close;
          Params.ParamByName('pIDContato').AsInteger := idContSelecionado;
          Open;

       end;

       Q_RelContatosIndividual.QRLabelTotal.Caption    := IntToStr(TotalRegs);
       Q_RelContatosIndividual.Preview;


    end;

end;

procedure T_frmContatos.btnimprimirClick(Sender: TObject);
begin

 if dm_DadosSegundo.cds_Contatos.RecordCount = 0 then
 begin

    Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);
    exit;

  end
  else begin 

    pan_titulo.Caption:= 'Controle de Contatos - Imprimindo...';
    LogOperacoes(NomeDoUsuarioLogado, 'acesso a relatórios de funcionários');
    lstEscolheTipoRel.Visible:= True;
    lstEscolheTipoRel.Align:= alClient;
    pnl_visualizacao.Enabled:= False;
    btnimprimir.Enabled  := false;
    btnInativar.Enabled  := false;
    btnAlterar.Enabled   := false;

  end;

end;

procedure T_frmContatos.btnRetornarClick(Sender: TObject);
begin
    pnl_visualizacao.BringToFront;
    HabilitarBotoes;
end;

procedure T_frmContatos.btnSairPermissoesClick(Sender: TObject);
begin
    close;
    HabilitarBotoes;
end;



procedure T_frmContatos.edt_UsuarioParaAlteracaoChange(
  Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled   := True;  //habilitando o botao de confirmacao de alteracao
    btnCancelarAlteracao.Enabled   := True;
    btnRetornarDaAlteracao.Enabled :=False;

end;

procedure T_frmContatos.btnFecharClick(Sender: TObject);
begin

    close;
    FecharTabelas;
    HabilitarBotoes;

end;

procedure T_frmContatos.edt_comissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
         // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;
end;

procedure T_frmContatos.btnRetornarDaInclusaoClick(Sender: TObject);
begin

  pnl_visualizacao.BringToFront;
  edtFiltro.SetFocus;
  pan_titulo.Caption:= 'Controle de Contatos - Visualizando...';
  DesabilitarBotoesParcialmente;

end;


procedure T_frmContatos.MostrarContatoTelaInicial;
begin

            //MOSTRA TODOS OS CONTATOS

            with dm_DadosSegundo.cds_Contatos do
            begin

                Close;
                CommandText:= (sqlDefalt);
                Open;

                  if not IsEmpty then
                  begin

                      dbedtCONT_NOME1.DataSource          :=  dm_DadosSegundo.ds_Contatos;
                      dbedtCONT_NOME1.DataField           := 'CONT_NOME';

                      dbedtCONT_ENDERECO.DataSource       :=  dm_DadosSegundo.ds_Contatos;
                      dbedtCONT_ENDERECO.DataField        := 'CONT_ENDERECO';

                      dbedtCONT_ID.DataSource             :=  dm_DadosSegundo.ds_Contatos;
                      dbedtCONT_ID.DataField              := 'CONT_ID';

                      dbedtCONT_BAIRRO.DataSource         :=  dm_DadosSegundo.ds_Contatos;
                      dbedtCONT_BAIRRO.DataField          := 'CONT_BAIRRO';

                      dbedtCONT_CEP.DataSource            :=  dm_DadosSegundo.ds_Contatos;
                      dbedtCONT_CEP.DataField             := 'CONT_CEP';

                      dbedtCONT_EMAIL.DataSource          :=  dm_DadosSegundo.ds_Contatos;
                      dbedtCONT_EMAIL.DataField           := 'CONT_EMAIL';

                      dbedtCONT_DATACAD.DataSource        :=  dm_DadosSegundo.ds_Contatos;
                      dbedtCONT_DATACAD.DataField         := 'CONT_DATACAD';

                      dbedtCONT_TELEFONE1.DataSource      :=  dm_DadosSegundo.ds_Contatos;
                      dbedtCONT_TELEFONE1.DataField       := 'CONT_TELEFONE1';

                      dbedtCONT_TELEFONE2.DataSource      :=  dm_DadosSegundo.ds_Contatos;
                      dbedtCONT_TELEFONE2.DataField       := 'CONT_TELEFONE2';

                      dbedtCONT_CELULAR1.DataSource       :=  dm_DadosSegundo.ds_Contatos;
                      dbedtCONT_CELULAR1.DataField        := 'CONT_CELULAR1';

                      dbedtCONT_CELULAR2.DataSource       :=  dm_DadosSegundo.ds_Contatos;
                      dbedtCONT_CELULAR2.DataField        := 'CONT_CELULAR2';

                      edt_seguimento.DataSource           :=  dm_DadosSegundo.ds_Contatos;
                      edt_seguimento.DataField            := 'SEGMENTO';


                      with dbgrd_Contatos do
                      begin

                        DataSource:=  dm_DadosSegundo.ds_Contatos;
                        Columns.Clear;

                        Columns.Add;
                        Columns[0].FieldName         := 'CONT_NOME';
                        Columns[0].Width             := 280;
                        Columns[0].Alignment         := taLeftJustify;
                        Columns[0].Title.caption     := 'CONTATOS';
                        Columns[0].Title.Font.Style  := [fsBold];

                      end;

                  end;

      end;


end;

procedure T_frmContatos.PopularDBMostraSegmentosAlteracao;
begin

   lblSegmento.Caption :=  RetornaStringPassandoID('segmento','segmentos','id_segmento',StrToInt(dbSegID.Text));

end;


procedure T_frmContatos.msk_FoneChange(Sender: TObject);
begin
    if Length(Trim(msk_Fone.Text)) = 9 then  msk_Fone2.setfocus;
end;

procedure T_frmContatos.msk_Fone2Change(Sender: TObject);
begin
    if Length(Trim(msk_Fone2.Text)) = 9 then  msk_Fone3.setfocus;
end;

procedure T_frmContatos.msk_Fone3Change(Sender: TObject);
begin
     if Length(Trim(msk_Fone3.Text)) = 10 then  msk_Fone4.setfocus;
end;

procedure T_frmContatos.msk_Fone4Change(Sender: TObject);
begin
    if Length(Trim(msk_Fone4.Text)) = 10 then  edt_email.setfocus;
end;

procedure T_frmContatos.msk_cepChange(Sender: TObject);
begin
    if Length(Trim(msk_cep.Text)) = 9 then  edt_bairro.setfocus;
end;

procedure T_frmContatos.msk_dtNascButtonClick(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled   := True;   //habilitando o botao de confirmacao de alteracao
    btnCancelarAlteracao.Enabled   := True;
    btnRetornarDaAlteracao.Enabled :=False;


end;

procedure T_frmContatos.msk_dtNascChange(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled   := True;   //habilitando o botao de confirmacao de alteracao
    btnCancelarAlteracao.Enabled   := True;
    btnRetornarDaAlteracao.Enabled :=False;


end;

procedure T_frmContatos.edtFiltroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

      if KEY = VK_RETURN then
      begin
          edtFiltro.Clear;
      end;

end;

procedure T_frmContatos.FiltrarPorNome;
var
  nome : string;
begin

       nome := edtFiltro.Text;
      _Sql  := 'select c.*, s.id_segmento, s.segmento FROM contatos c INNER JOIN segmentos s ON s.id_segmento = c.cont_segid WHERE '+
               'c.cont_status = '+QuotedStr('A')+' AND c.cont_nome LIKE (''%'+nome+'%'') ORDER BY c.cont_nome';

      with dm_DadosSegundo.cds_Contatos do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;     

end;

procedure T_frmContatos.edtFiltroChange(Sender: TObject);
begin

   FiltrarPorNome;

end;

procedure T_frmContatos.dbedtCONT_NOMEExit(Sender: TObject);
begin
    btnConfirmaAlteracao.Enabled := true;
end;

procedure T_frmContatos.dbgrd_ContatosCellClick(Column: TColumn);
begin

    idContSelecionado    :=  dm_DadosSegundo.cds_Contatos.fieldbyname('cont_id').AsInteger;
    
    btnInativar.Enabled  := true;
    btnimprimir.Enabled  := true;
    btnalterar.Enabled   := true;
    edtFiltro.SetFocus;

end;

procedure T_frmContatos.edt_apelidoEnter(Sender: TObject);
begin

    btnConfirmaInclusao.Enabled:= True;

end;

procedure T_frmContatos.AtualizaQde;
begin

    qdeRegs               := ListaQdeRegs(dm_DadosSegundo.cds_Contatos);
    txtMsg.Caption        := 'Total de contatos cadastrados '+ IntToStr( qdeRegs );
    txtMsg.Font.Color     := clBlue;

end;


procedure T_frmContatos.edt_IncluirUsuarioEnter(Sender: TObject);
begin
  btnConfirmaInclusao.Enabled:=true;
end;

procedure T_frmContatos.AbrirFormCadastroPadrao;
begin

       //dados necessários para acessar formulario de cadastro de segmentos padrão com apenas um campo
       nomeTabela    := 'SEGMENTOS';
       campoNome     := 'SEGMENTO';
       campoID       := 'ID_SEGMENTO';
       cdsTable      := dm_DadosSegundo.cds_Segmentos;
       dsTable       := dm_DadosSegundo.ds_Segmentos;

       Application.CreateForm(T_frmCadastroPadraoUmCampo,  _frmCadastroPadraoUmCampo);
       _frmCadastroPadraoUmCampo.ShowModal;
       FreeAndNil(_frmCadastroPadraoUmCampo);

       edt_endereco.SetFocus;

end;

procedure T_frmContatos.lblSegmentoClick(Sender: TObject);
begin
      //alterando
      AbrirListaDeSegmentosCadastroAlteracaoDeContatos;
      
      btnConfirmaAlteracao.Enabled:=true;
      lblSegmento.Caption := sTringGeral;

end;           

procedure T_frmContatos.btnCadNovoSegmentoClick(Sender: TObject);
begin

      gravouNovoSegmentoPelosContatos:= true;
      AbrirFormCadastroPadrao;

end;

procedure T_frmContatos.edt_nomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if(key = 13)then
  begin

      cadastrando:=true;

  end;

end;


procedure T_frmContatos.edt_enderecoExit(Sender: TObject);
begin

  btnConfirmaInclusao.Enabled:= true;

end;

procedure T_frmContatos.msk_telChange(Sender: TObject);
begin
  if Length(Trim(msk_tel.Text)) = 9 then  msk_tel2.setfocus;
end;

procedure T_frmContatos.msk_tel2Change(Sender: TObject);
begin
  if Length(Trim(msk_tel2.Text)) = 9 then  msk_tel3.setfocus;
end;

procedure T_frmContatos.msk_tel3Change(Sender: TObject);
begin
  if Length(Trim(msk_tel3.Text)) = 10 then  msk_tel4.setfocus;
end;

procedure T_frmContatos.msk_tel4Change(Sender: TObject);
begin
  if Length(Trim(msk_tel4.Text)) = 10 then  lblSegmento.setfocus;
end;


procedure T_frmContatos.AbrirListaDeSegmentosCadastroAlteracaoDeContatos;
begin

      //dados necessários para acessar lista padrao com apenas um campo
       nomeTabela    := 'SEGMENTOS';
       campoNome     := 'SEGMENTO';
       campoID       := 'ID_SEGMENTO';
       cdsTable      := dm_DadosSegundo.cds_Segmentos;
       dsTable       := dm_DadosSegundo.ds_Segmentos;

      Application.CreateForm(T_frmListaPadraoComUmCampo,  _frmListaPadraoComUmCampo);
      _frmListaPadraoComUmCampo.ShowModal;
      FreeAndNil(_frmListaPadraoComUmCampo);

      edt_endereco.SetFocus;

end;

procedure T_frmContatos.lblListaSegmentosParaInclusaoClick(
  Sender: TObject);
begin
  //clicou no label cadastrando
  AbrirListaDeSegmentosCadastroAlteracaoDeContatos;
  lblListaSegmentosParaInclusao.Caption := sTringGeral;
end;

procedure T_frmContatos.edt_seguimentoEnter(Sender: TObject);
begin
  edtFiltro.SetFocus;
end;

procedure T_frmContatos.edtFiltroClick(Sender: TObject);
begin
  edtFiltro.Clear;
end;

end.

