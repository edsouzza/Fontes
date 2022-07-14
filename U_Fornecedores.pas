unit U_Fornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ToolEdit,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, SqlExpr;

type
  T_frmFornecedores = class(TForm)
    pan_titulo: TPanel;
    pangrid_visualizacao: TPanel;
    pan_botoes: TPanel;
    btnCadastros: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnInativar: TSpeedButton;
    btnSair: TSpeedButton;
    btnimprimir: TSpeedButton;
    pangrid_inclusao: TPanel;
    GroupBox1: TGroupBox;
    btnConfirmaInclusao: TSpeedButton;
    grp1: TGroupBox;
    lbl11: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl16: TLabel;
    lbl15: TLabel;
    lbl12: TLabel;
    msk_cep: TMaskEdit;
    pangrid_alteracao: TPanel;
    grp2: TGroupBox;
    lbl10: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    dbedtFORNE_NOME1: TDBEdit;
    dbedtFORNE_ENDERECO1: TDBEdit;
    dbedtFORNE_COMPLEMENTO1: TDBEdit;
    dbedtFORNE_EMAIL1: TDBEdit;
    dbedtFORNE_APELIDO1: TDBEdit;
    grp3: TGroupBox;
    btnConfirmaAlteracao: TSpeedButton;
    edt_nome: TEdit;
    edt_apelido: TEdit;
    edt_endereco: TEdit;
    edt_complemento: TEdit;
    edt_email: TEdit;
    btnRetornar: TSpeedButton;
    btnRetornar2: TSpeedButton;
    lbl29: TLabel;
    msk_Fone: TMaskEdit;
    lblFones: TLabel;
    msk_tel: TMaskEdit;
    msk_cep2: TMaskEdit;
    edt_DataCadastro: TEdit;
    btnCancelarAlteracao: TSpeedButton;
    btnCancelarInclusaoForne: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    lstEscolheTipoRel: TListBox;
    lblStatusLogoff: TLabel;
    edt_dddfone: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    msk_Fone2: TMaskEdit;
    edt_dddfone2: TEdit;
    Label17: TLabel;
    dbedtforne_ddd: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    msk_tel2: TMaskEdit;
    dbedtforne_ddd2: TDBEdit;
    Label20: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    msk_Fone3: TMaskEdit;
    edt_dddfone3: TEdit;
    msk_Fone4: TMaskEdit;
    edt_dddfone4: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    msk_tel3: TMaskEdit;
    dbedtforne_ddd3: TDBEdit;
    msk_tel4: TMaskEdit;
    dbedtforne_ddd4: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    msk_cnpj: TMaskEdit;
    msk_ie: TMaskEdit;
    Label5: TLabel;
    msk_cnpj2: TMaskEdit;
    Label6: TLabel;
    msk_ie2: TMaskEdit;
    edtIDAtual: TEdit;
    DBEDTIDFORNE: TDBEdit;
    txtMsg: TStaticText;
    grListaForne: TGroupBox;
    GroupBox9: TGroupBox;
    edtConsForne: TEdit;
    grid_Fornecedores: TDBGrid;
    grDadosForne: TGroupBox;
    lbl1: TLabel;
    lbl9: TLabel;
    lbl7: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    lbl28: TLabel;
    lblFone: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dbedtFORNE_DATACAD: TDBEdit;
    dbedtFORNE_APELIDO: TDBEdit;
    dbedtFORNE_NOME: TDBEdit;
    dbedtFORNE_ENDERECO: TDBEdit;
    dbedtFORNE_CEP: TDBEdit;
    dbedtFORNE_COMPLEMENTO: TDBEdit;
    dbedtFORNE_EMAIL: TDBEdit;
    dbedtFORNE_ID: TDBEdit;
    dbedtFORNE_FONEDDD: TDBEdit;
    dbedtFORNE_FONE2: TDBEdit;
    dbedtFORNE_FONEDDD2: TDBEdit;
    dbedtFORNE_FONE: TDBEdit;
    dbedtFORNE_FONEDDD3: TDBEdit;
    dbedtFORNE_FONE4: TDBEdit;
    dbedtFORNE_FONEDDD4: TDBEdit;
    dbedtFORNE_FONE3: TDBEdit;
    dbedtFORNE_CNPJ: TDBEdit;
    dbedtFORNE_IE: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    edt_Obs: TEdit;
    dbedtFORNE_OBS: TDBEdit;
    Label13: TLabel;
    dbedtFORNE_OBS1: TDBEdit;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInativarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCadastrosClick(Sender: TObject);
    procedure btnConfirmaInclusaoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure GravaRegs;
    procedure btnConfirmaAlteracaoClick(Sender: TObject);
    procedure Limpar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BancoParaEdts;
    procedure GravarAlteracoes;
    procedure EstadoInicialDosBotoes;
    procedure edt_nomeChange(Sender: TObject);
    procedure HabilitarBotoes;
    procedure DesabilitarBotoes;
    procedure dbedtFORNE_NOME1Change(Sender: TObject);
    procedure dbedtFORNE_APELIDO1Change(Sender: TObject);
    procedure dbedtFORNE_ENDERECO1Change(Sender: TObject);
    procedure dbedtFORNE_COMPLEMENTO1Change(Sender: TObject);
    procedure msk_cep2Change(Sender: TObject);
    procedure msk_telChange(Sender: TObject);
    procedure dbedtFORNE_EMAIL1Change(Sender: TObject);
    procedure btnCancelarInclusaoForneClick(Sender: TObject);
    procedure btnCancelarAlteracaoClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure msk_cep2KeyPress(Sender: TObject; var Key: Char);
    procedure msk_cepKeyPress(Sender: TObject; var Key: Char);
    procedure edt_nomeExit(Sender: TObject);
    procedure lstEscolheTipoRelClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnRetornar2Click(Sender: TObject);
    procedure msk_FoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_dddfoneKeyPress(Sender: TObject; var Key: Char);
    procedure edt_dddfone2KeyPress(Sender: TObject; var Key: Char);
    procedure edtConsForneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure grid_FornecedoresCellClick(Column: TColumn);
    procedure edt_apelidoEnter(Sender: TObject);
    procedure msk_cnpjChange(Sender: TObject);
    procedure msk_cepChange(Sender: TObject);
    procedure msk_ieChange(Sender: TObject);
    procedure msk_FoneChange(Sender: TObject);
    procedure msk_Fone2Change(Sender: TObject);
    procedure msk_Fone3Change(Sender: TObject);
    procedure msk_cnpj2Change(Sender: TObject);
    procedure msk_ie2Change(Sender: TObject);
    procedure msk_tel2Change(Sender: TObject);
    procedure msk_tel3Change(Sender: TObject);
    procedure DeletarContatos;
    procedure MostrarIDAtual;
    procedure FiltrarPorNome;
    procedure edtConsForneChange(Sender: TObject);
    procedure msk_cnpjEnter(Sender: TObject);
    procedure msk_ieEnter(Sender: TObject);
    procedure dbedtFORNE_APELIDO1Enter(Sender: TObject);
    procedure msk_cnpjClick(Sender: TObject);
    procedure msk_ieClick(Sender: TObject);
    procedure msk_cnpj2Enter(Sender: TObject);
    procedure msk_ie2Enter(Sender: TObject);
    procedure AtualizaQde;
    procedure msk_Fone4Change(Sender: TObject);
    procedure msk_tel4Change(Sender: TObject);
    procedure edtConsForneKeyPress(Sender: TObject; var Key: Char);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmFornecedores: T_frmFornecedores;
  proxNum, Fornec_ID : Integer;


implementation

uses U_dmDados, UConsultarFornecedores, U_Clientes, U_dmPesquisas,
  U_BiblioSysSalao, U_QRelFornecedorCompleto, U_QRelFornecedorIndividual,
  DB, DBClient, U_CadContatosFornecedores;

{$R *.dfm}


procedure T_frmFornecedores.FormCreate(Sender: TObject);
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

    lblDataDoDia.Caption           := DateToStr(date);
    lblHoraAtual.Caption           := timetoStr(time);
    Caption                        := 'LOGADO POR '+NomeDoUsuarioLogado;
    dtDataDoDia                    := TDateEdit.Create(self);
    dtDataDoDia.Date               := date;
    edt_DataCadastro.Text          := DateToStr(date);
    EstadoInicialDosBotoes;
    AbrirTabelas;

end;

procedure T_frmFornecedores.FormShow(Sender: TObject);
begin
      edtConsForne.SetFocus;
      AtualizaQde;
end;

procedure T_frmFornecedores.btnInativarClick(Sender: TObject);
var
  texto:string;
begin

      if dm_Conexao.cds_Fornecedor.RecordCount = 0 then begin

            Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);

      end
      else begin

          DesabilitarBotoes; 

          pan_titulo.Caption:= 'Controle de Fornecedores - Inativando...';

          texto:= 'Confirma o desejo de inativar o Fornecedor '+dbedtFORNE_NOME.Text+ '?';

          if Application.MessageBox(PChar(texto),'Inativar Fornecedor',MB_YESNO + MB_ICONQUESTION) = IdYes then
          begin

              with dm_Conexao.cds_Fornecedor do
              begin

                edit;
                Fieldbyname('forne_status').AsString := 'I';
                ApplyUpdates(0);

              end;

              Application.MessageBox('O fornecedor foi inativado com sucesso!',
              'Inativo', MB_OK);
              FecharAbrirTabelas;
              AtualizaQde;
              pan_titulo.Caption:= 'Controle de Fornecedores - Visualizando...';
              HabilitarBotoes;

          end else begin

              dm_Conexao.cds_Fornecedor.CancelUpdates;
              pan_titulo.Caption:= 'Controle de Fornecedores - Visualizando...';
              HabilitarBotoes;

         end;
    end; 
    EstadoInicialDosBotoes;
    FecharAbrirTabelas;

end;


procedure T_frmFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  edtConsForne.Clear;
  FecharTabelas;
  Release;

end;

procedure T_frmFornecedores.btnCadastrosClick(Sender: TObject);
begin

   if (btnCadastros.Caption = 'Voltar')then
   begin
      EstadoInicialDosBotoes;
   end else
   begin

     MostrarIDAtual;
     grid_Fornecedores.Enabled:= True;
     edt_nome.SetFocus;
     pan_titulo.Caption:= 'Controle de Fornecedores - Incluindo...';
     pangrid_visualizacao.SendToBack;
     pangrid_inclusao.BringToFront;
     DesabilitarBotoes;
     btnCadastros.Caption := 'Cadastro Inicial';
     btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');

   end;
                                     
end;

procedure T_frmFornecedores.btnAlterarClick(Sender: TObject);
begin

     if dm_Conexao.cds_Fornecedor.RecordCount = 0 then begin

            Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);

      end
      else begin

          pan_titulo.Caption:= 'Controle de Fornecedores - Alterando...';
          pangrid_visualizacao.SendToBack;
          pangrid_alteracao.BringToFront;

          BancoParaEdts;
          DesabilitarBotoes;
          dbedtFORNE_NOME1.SetFocus;
          btnRetornar.Enabled   := true;
          btnAlterar.Enabled    := false;

      end;

end;


procedure T_frmFornecedores.btnRetornarClick(Sender: TObject);
begin

    Limpar;
    pangrid_alteracao.SendToBack;
    dm_Conexao.cds_Fornecedor.Cancel;
    pangrid_visualizacao.BringToFront;
    pan_titulo.Caption:= 'Controle de Fornecedores - Visualizando...';
    HabilitarBotoes;
    EstadoInicialDosBotoes;

end;

procedure T_frmFornecedores.btnConfirmaInclusaoClick(Sender: TObject);
begin 

   GravaRegs;
   LogOperacoes(NomeDoUsuarioLogado, 'cadastro de novo fornecedor');
   Limpar;
   MostrarIDAtual;
   DesabilitarBotoes;
   btnRetornar2.Enabled:= true;
   FecharAbrirTabelas;
   AtualizaQde;
   btnInativar.Enabled := false;

end;


procedure T_frmFornecedores.GravaRegs;
begin

     // Abrindo um registro novo e gravando no bd
     with dm_Conexao.cds_Fornecedor do
     begin

        Append;

        FieldByName('forne_id').AsInteger           := StrToInt(edtIDAtual.text);
        FieldByname('forne_nome').AsString          := edt_nome.Text;
        FieldByname('forne_apelido').AsString       := edt_apelido.Text;
        FieldByname('forne_endereco').AsString      := edt_endereco.Text;
        FieldByname('forne_complemento').AsString   := edt_complemento.Text;
        FieldByname('forne_cep').AsString           := msk_cep.Text;
        FieldByname('forne_cnpj').AsString          := msk_cnpj.Text;
        FieldByname('forne_ie').AsString            := msk_ie.Text;
        FieldByname('forne_dddfone').AsString       := edt_dddfone.Text;
        FieldByname('forne_fone').AsString          := msk_Fone.Text;
        FieldByname('forne_dddfone2').AsString      := edt_dddfone2.Text;
        FieldByname('forne_fone2').AsString         := msk_Fone2.Text;
        FieldByname('forne_dddfone3').AsString      := edt_dddfone3.Text;
        FieldByname('forne_fone3').AsString         := msk_Fone3.Text;
        FieldByname('forne_dddfone4').AsString      := edt_dddfone4.Text;
        FieldByname('forne_fone4').AsString         := msk_Fone4.Text;
        FieldByname('forne_email').AsString         := edt_email.Text;
        FieldByname('forne_datacad').AsString       := edt_DataCadastro.Text;
        FieldByname('forne_status').AsString        := 'A';
        FieldByname('forne_obs').AsString           := edt_Obs.Text;

     end;

     dm_Conexao.cds_Fornecedor.ApplyUpdates(0);
     AtualizaQde;
     Application.MessageBox('Fornecedor cadastrado com sucesso!', 'Cadastro de fornecedor!', MB_ICONEXCLAMATION);

end;


procedure T_frmFornecedores.Limpar;
var
  i : Integer;
begin

      //Limpando os Edits e Masks
      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TEdit)then
              (Components[i] as TEdit).Clear;
      end;

      msk_cep.Text      := '#####-###;1;_';
      msk_Fone.Text     := '(###)####_####;1;_';
      msk_Fone2.Text    := '(###)####_####;1;_';
      msk_Fone3.Text    := '(###)####_####;1;_';
      msk_Fone4.Text    := '(###)#####_####;1;_';
      msk_cnpj.Text     := '###.###.###/####-##;1;_';
      msk_ie.Text       := '###.###.###.###;1;_';
      msk_cnpj2.Text    := '###.###.###/####-##;1;_';
      msk_ie2.Text      := '###.###.###.###;1;_';
      edt_DDDFONE.Text  := '011';
      edt_DDDFONE2.Text := '011';
      edt_DDDFONE3.Text := '011';
      edt_DDDFONE4.Text := '011';
      edt_nome.SetFocus;
      pan_titulo.Caption:= 'Controle de Fornecedores - Incluindo...';
      edt_DataCadastro.Text := DateToStr(date);  
      pangrid_alteracao.SendToBack;
      pangrid_inclusao.BringToFront;

end;


procedure T_frmFornecedores.btnConfirmaAlteracaoClick(Sender: TObject);
begin

   GravarAlteracoes;
   dm_Conexao.cds_Fornecedor.Next;
   dm_Conexao.cds_Fornecedor.ApplyUpdates(0);
   Application.MessageBox('Alteração efetuada com sucesso!', 'Alteração', MB_OK);
   
   LogOperacoes(NomeDoUsuarioLogado, 'Alteração de fornecedor cadastrado');
   pangrid_alteracao.SendToBack;
   pangrid_visualizacao.BringToFront;
   pan_titulo.Caption:= 'Controle de Fornecedores - Visualizando...';
   HabilitarBotoes;
   btnAlterar.Enabled:=false;
   btnInativar.Enabled:=false;

end;


procedure T_frmFornecedores.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmFornecedores.BancoParaEdts;
begin
     // Mostrando os dados do Banco nos Edits para alteração
     msk_tel.Text   := dm_Conexao.cds_Fornecedor.FieldByname('forne_fone').AsString;
     msk_tel2.Text  := dm_Conexao.cds_Fornecedor.FieldByname('forne_fone2').AsString;
     msk_tel3.Text  := dm_Conexao.cds_Fornecedor.FieldByname('forne_fone3').AsString;
     msk_tel4.Text  := dm_Conexao.cds_Fornecedor.FieldByname('forne_fone4').AsString;
     msk_cep2.Text  := dm_Conexao.cds_Fornecedor.FieldByname('forne_cep').AsString;
     msk_cnpj2.Text := dm_Conexao.cds_Fornecedor.FieldByname('forne_cnpj').AsString;
     msk_ie2.Text   := dm_Conexao.cds_Fornecedor.FieldByname('forne_ie').AsString;

end;

procedure T_frmFornecedores.GravarAlteracoes;
begin

     dm_Conexao.cds_Fornecedor.Edit;

     // Mostrando os dados do Banco nos Edits para alteração apenas das mascaras
     dm_Conexao.cds_Fornecedor.FieldByname('forne_fone').AsString    := msk_tel.Text;
     dm_Conexao.cds_Fornecedor.FieldByname('forne_fone2').AsString   := msk_tel2.Text;
     dm_Conexao.cds_Fornecedor.FieldByname('forne_fone3').AsString   := msk_tel3.Text;
     dm_Conexao.cds_Fornecedor.FieldByname('forne_fone4').AsString   := msk_tel4.Text;
     dm_Conexao.cds_Fornecedor.FieldByname('forne_cep').AsString     := msk_cep2.Text;
     dm_Conexao.cds_Fornecedor.FieldByname('forne_cnpj').AsString    := msk_cnpj2.Text;
     dm_Conexao.cds_Fornecedor.FieldByname('forne_ie').AsString      := msk_ie2.Text;


end;


procedure T_frmFornecedores.HabilitarBotoes;
var
  i : Integer;
begin

       //Habilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= true;
      end;


      btnRetornar2.Enabled:= True;
      btnConfirmaAlteracao.Enabled:= true;


end;

procedure T_frmFornecedores.DesabilitarBotoes;
var
  i : Integer;
begin

   //Desabilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= false;
      end;


      btnRetornar2.Enabled:= True;

end;



procedure T_frmFornecedores.edt_nomeChange(Sender: TObject);
begin
 
  btnCancelarInclusaoForne.Enabled:= True;
  btnRetornar2.Enabled:= False;

end;


procedure T_frmFornecedores.dbedtFORNE_NOME1Change(Sender: TObject);
begin

  btnConfirmaAlteracao.Enabled:= True;  //habilitando o botao de confirmacao de alteracao
  btnCancelarAlteracao.Enabled:= True;
  btnRetornar.Enabled:=False;
  
end;


procedure T_frmFornecedores.btnSairClick(Sender: TObject);
begin
   
   FreeAndNil(dtDataDoDia);
   HabilitarBotoes;
   close;

end;


procedure T_frmFornecedores.dbedtFORNE_APELIDO1Change(Sender: TObject);
begin

  btnConfirmaAlteracao.Enabled:= True;  //habilitando o botao de confirmacao de alteracao
  btnCancelarAlteracao.Enabled:= True;
  btnRetornar.Enabled:=False;

end;

procedure T_frmFornecedores.dbedtFORNE_ENDERECO1Change(Sender: TObject);
begin
  btnConfirmaAlteracao.Enabled:= True;  //habilitando o botao de confirmacao de alteracao
  btnCancelarAlteracao.Enabled:= True;
  btnRetornar.Enabled:=False;
end;

procedure T_frmFornecedores.dbedtFORNE_COMPLEMENTO1Change(Sender: TObject);
begin
  btnConfirmaAlteracao.Enabled:= True;  //habilitando o botao de confirmacao de alteracao
  btnCancelarAlteracao.Enabled:= True;
  btnRetornar.Enabled:=False;
end;

procedure T_frmFornecedores.msk_cep2Change(Sender: TObject);
begin
  btnConfirmaAlteracao.Enabled:= True;  //habilitando o botao de confirmacao de alteracao
  btnCancelarAlteracao.Enabled:= True;
  btnRetornar.Enabled:=False;
end;

procedure T_frmFornecedores.msk_telChange(Sender: TObject);
begin

  btnConfirmaAlteracao.Enabled:= True;  //habilitando o botao de confirmacao de alteracao
  btnCancelarAlteracao.Enabled:= True;
  btnRetornar.Enabled:=False;
  if Length(Trim(msk_tel.Text)) = 9 then  msk_tel2.setfocus;

end;

procedure T_frmFornecedores.dbedtFORNE_EMAIL1Change(Sender: TObject);
begin
  btnConfirmaAlteracao.Enabled:= True;  //habilitando o botao de confirmacao de alteracao
  btnCancelarAlteracao.Enabled:= True;
  btnRetornar.Enabled:=False;
end;

procedure T_frmFornecedores.DeletarContatos;
begin

     _Sql:= 'Delete FROM contatos_fornecedores WHERE forne_id = :pIDForne';

      with DM_Pesq.Qry_Geral do
      begin

        Close;
        SQL.Clear;
        SQL.Add(_Sql);
        ParamByName('pIDForne').AsInteger := StrToInt(edtIDAtual.Text);
        ExecSQL();

     end;

end;


procedure T_frmFornecedores.btnCancelarInclusaoForneClick(Sender: TObject);
begin

  DeletarContatos;
  dm_Conexao.cds_Fornecedor.Cancel;
  pangrid_inclusao.SendToBack;
  Limpar;
  btnRetornar2.Enabled:= true;
  btnConfirmaInclusao.Enabled:= False;
  btnCancelarInclusaoForne.Enabled:= false;
                  
end;

procedure T_frmFornecedores.btnCancelarAlteracaoClick(Sender: TObject);
begin

  dm_Conexao.cds_Fornecedor.Cancel;
  pangrid_inclusao.SendToBack;
  btnRetornar.Enabled:= true;
  btnConfirmaAlteracao.Enabled:= False;
  btnCancelarAlteracao.Enabled:= false;
  dbedtFORNE_NOME1.SetFocus;

end;


procedure T_frmFornecedores.AbrirTabelas;
begin

     dm_Conexao.cds_Fornecedor.Active:= True;

end;

procedure T_frmFornecedores.FecharTabelas;
begin

     dm_Conexao.cds_Fornecedor.Active:= False;

end;

procedure T_frmFornecedores.FecharAbrirTabelas;
begin

     dm_Conexao.cds_Fornecedor.Active:= False;
     dm_Conexao.cds_Fornecedor.Active:= True;

end;



procedure T_frmFornecedores.msk_cep2KeyPress(Sender: TObject;
  var Key: Char);
begin
         // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmFornecedores.msk_cepKeyPress(Sender: TObject;
  var Key: Char);
begin
         // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmFornecedores.edt_nomeExit(Sender: TObject);
begin

     VerificarDuplicidade(dm_Conexao.cds_Fornecedor,'forne_nome',edt_nome);
     
end;

procedure T_frmFornecedores.lstEscolheTipoRelClick(Sender: TObject);
begin

    pan_titulo.Caption:= 'Controle de Fornecedores - Visualizndo...';
    lstEscolheTipoRel.Visible:= False;
    lstEscolheTipoRel.Align:= alNone;
    pangrid_visualizacao.Enabled:= True;

    if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO   DE  TODOS  OS  FORNECEDORES' then
    begin

        TotalRegs := 0;

        //PESQUISANDO A QUANTIDADE DE REGISTROS RETORNADO PELO QRY

       _Sql := 'SELECT * FROM fornecedores WHERE forne_status = '+QuotedStr('A')+' and forne_id > 1 ORDER BY forne_nome';

       Application.CreateForm(TQ_RelFornecedorCompleto,  Q_RelFornecedorCompleto);
       with Q_RelFornecedorCompleto.Qry_Fornecedores do
       begin

          Close;
          sql.Clear;
          SQL.Add(_Sql);
          Open;

       end;
       TotalRegs                                         := Q_RelFornecedorCompleto.Qry_Fornecedores.RecordCount;
       Q_RelFornecedorCompleto.Qry_Fornecedores.Active   := True;
       Q_RelFornecedorCompleto.QRLabelTotal.Caption      := IntToStr(TotalRegs);
       Q_RelFornecedorCompleto.Preview;   
       EstadoInicialDosBotoes;

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO   DO  FORNECEDOR SELECIONADO' then
    begin

       Application.CreateForm(TQ_RelFornecedorIndividual,  Q_RelFornecedorIndividual);
       with Q_RelFornecedorIndividual.Qry_Fornecedor do
       begin

          Close;
          ParamByName('forne_id').asinteger := StrToInt(dbedtFORNE_ID.Text);
          Open;

       end;

       Q_RelFornecedorIndividual.Qry_Fornecedor.Active:= true;
       Q_RelFornecedorIndividual.Preview;
       EstadoInicialDosBotoes;
       
    end;

end;

procedure T_frmFornecedores.btnimprimirClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

        if dm_Conexao.cds_Fornecedor.RecordCount = 0 then begin

             Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);

        end
        else begin

          pan_titulo.Caption:= 'Controle de Fornecedores - Imprimindo...';
          LogOperacoes(NomeDoUsuarioLogado, 'acesso a relatórios de fornecedores');
          lstEscolheTipoRel.Visible:= True;
          lstEscolheTipoRel.Align:= alClient;
          pangrid_visualizacao.Enabled:= False;
          

        end;

     end;

end;

procedure T_frmFornecedores.btnRetornar2Click(Sender: TObject);
begin

    Limpar;
    pangrid_inclusao.SendToBack;
    pangrid_visualizacao.BringToFront;
    pan_titulo.Caption:= 'Controle de Fornecedores - Visualizando...';
    HabilitarBotoes;
    AtualizaQde;
    FecharAbrirTabelas;
    EstadoInicialDosBotoes;

end;

procedure T_frmFornecedores.msk_FoneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

    if key=13 then
    begin

       exit;

    end;

end;

procedure T_frmFornecedores.edt_dddfoneKeyPress(Sender: TObject;
  var Key: Char);
begin
        // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;
end;

procedure T_frmFornecedores.edt_dddfone2KeyPress(Sender: TObject;
  var Key: Char);
begin

    // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmFornecedores.edtConsForneKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if KEY = VK_RETURN then
      begin

          edtConsForne.Clear;
          btnCadastros.Caption := 'Cadastro Inicial';
          btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');
          EstadoInicialDosBotoes;
          
      end;

end;

procedure T_frmFornecedores.grid_FornecedoresCellClick(Column: TColumn);
begin
    btnCadastros.Caption := 'Voltar';
    btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Ok.bmp');
    btnAlterar.Enabled:=true;
    btnInativar.Enabled:=true;
    btnimprimir.Enabled := true;
end;

procedure T_frmFornecedores.edt_apelidoEnter(Sender: TObject);
begin

   btnConfirmaInclusao.Enabled:= True;  //habilitando o botao de confirmacao de inclusao
   IDForne := edtIDAtual.Text;    

   {
     HABILITE SE TIVER A NECESSIDADE DE CADASTRAR CONTATOS DO FORNECEDOR

   Application.CreateForm(T_frmCadContatoFornecedores,  _frmCadContatoFornecedores);
   _frmCadContatoFornecedores.ShowModal;
   FreeAndNil(_frmCadContatoFornecedores);
   }

end;

procedure T_frmFornecedores.msk_cnpjChange(Sender: TObject);
begin
    if Length(Trim(msk_cnpj.Text)) = 18 then  msk_ie.setfocus;
end;

procedure T_frmFornecedores.msk_cepChange(Sender: TObject);
begin
    if Length(Trim(msk_cep.Text)) = 9 then  edt_email.setfocus;
end;

procedure T_frmFornecedores.msk_ieChange(Sender: TObject);
begin
    if Length(Trim(msk_ie.Text)) = 15 then  msk_fone.setfocus;
end;

procedure T_frmFornecedores.msk_FoneChange(Sender: TObject);
begin
    if Length(Trim(msk_fone.Text)) = 9 then  msk_fone2.setfocus;
end;

procedure T_frmFornecedores.msk_Fone2Change(Sender: TObject);
begin
     if Length(Trim(msk_fone2.Text)) = 9 then  msk_fone3.setfocus;
end;

procedure T_frmFornecedores.msk_Fone3Change(Sender: TObject);
begin
   if Length(Trim(msk_fone3.Text)) = 9 then  msk_fone4.setfocus;
end;

procedure T_frmFornecedores.msk_cnpj2Change(Sender: TObject);
begin
     if Length(Trim(msk_cnpj2.Text)) = 18 then  msk_ie2.setfocus;
end;

procedure T_frmFornecedores.msk_ie2Change(Sender: TObject);
begin
     if Length(Trim(msk_ie2.Text)) = 15 then  msk_tel.setfocus;
end;

procedure T_frmFornecedores.msk_tel2Change(Sender: TObject);
begin
    if Length(Trim(msk_tel2.Text)) = 9 then  msk_tel3.setfocus;
end;

procedure T_frmFornecedores.msk_tel3Change(Sender: TObject);
begin
    if Length(Trim(msk_tel3.Text)) = 9 then  msk_tel4.setfocus;
end;

procedure T_frmFornecedores.msk_Fone4Change(Sender: TObject);
begin
if Length(Trim(msk_fone4.Text)) = 10 then  edt_Obs.setfocus;
end;

procedure T_frmFornecedores.MostrarIDAtual;
begin

      With DM_Pesq.qry_Cod do
      begin

        Close;
        SQL.Clear;
        SQL.Add('select max(forne_id) from Fornecedores');
        Open;

        if not IsEmpty then
        begin

           proxNum         := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;
           edtIDAtual.Text := IntToStr(proxNum);

        end;

      end;

end;

procedure T_frmFornecedores.FiltrarPorNome;
var
  nome : string;
begin

      nome := edtConsForne.Text;

      _Sql  := 'SELECT * FROM fornecedores WHERE forne_status = '+QuotedStr('A')+' and forne_id > 1'+
                'AND forne_nome LIKE (''%'+nome+'%'') ORDER BY forne_nome';

      with dm_Conexao.cds_Fornecedor do
      begin

            Close;
            CommandText:= (_Sql);
            Open;
      end;    

end;

procedure T_frmFornecedores.edtConsForneChange(Sender: TObject);
begin
    FiltrarPorNome;
end;

procedure T_frmFornecedores.msk_cnpjEnter(Sender: TObject);
begin

   btnConfirmaInclusao.Enabled:= True;

end;

procedure T_frmFornecedores.msk_ieEnter(Sender: TObject);
begin

    btnConfirmaInclusao.Enabled:= True;

end;

procedure T_frmFornecedores.dbedtFORNE_APELIDO1Enter(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled := true;

end;

procedure T_frmFornecedores.msk_cnpjClick(Sender: TObject);
begin

    btnConfirmaAlteracao.Enabled := true;

end;

procedure T_frmFornecedores.msk_ieClick(Sender: TObject);
begin

   btnConfirmaAlteracao.Enabled := true;

end;

procedure T_frmFornecedores.msk_cnpj2Enter(Sender: TObject);
begin

   btnConfirmaAlteracao.Enabled := true;

end;

procedure T_frmFornecedores.msk_ie2Enter(Sender: TObject);
begin

     btnConfirmaAlteracao.Enabled := true;

end;

procedure T_frmFornecedores.AtualizaQde;
begin

    qdeRegs               := ListaQdeRegs(dm_Conexao.cds_Fornecedor);
    txtMsg.Caption        := 'Total de fornecedores cadastrados '+ IntToStr( qdeRegs );
    txtMsg.Font.Color     := clBlue;

end;



procedure T_frmFornecedores.msk_tel4Change(Sender: TObject);
begin
if Length(Trim(msk_tel4.Text)) = 10 then  dbedtFORNE_OBS1.setfocus;
end;

procedure T_frmFornecedores.EstadoInicialDosBotoes;
begin

    btnCadastros  .Enabled := true;
    btnAlterar    .Enabled := false;
    btnInativar   .Enabled := false;
    btnimprimir   .Enabled := false;
    btnSair       .Enabled := true;
    btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');
    btnCadastros.Caption:='Cadastrar';
    edtConsForne.Clear;
    FreeAndNil(Q_RelFornecedorIndividual);
    FreeAndNil(Q_RelFornecedorCompleto);

end;

procedure T_frmFornecedores.edtConsForneKeyPress(Sender: TObject;
  var Key: Char);
begin

      btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Ok.bmp');
      btnAlterar.Enabled:=false;
      btnInativar.Enabled:=false;
      btnimprimir.Enabled:=false;
      btnCadastros.Caption:='Voltar';
      
end;

end.



