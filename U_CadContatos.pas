unit U_CadContatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr, DateUtils,
  ToolEdit, RXDBCtrl, Midas,DBClient;

type
  TF_CONTATOS = class(TForm)
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
    GridTelaPrincipal: TDBGrid;
    dbedtCONT_DATACAD: TDBEdit;
    edt_seguimento: TDBEdit;
    dbedtCONT_NOME1: TDBEdit;
    dbedtCONT_ENDERECO: TDBEdit;
    dbedtCONT_CEP: TDBEdit;
    dbedtCONT_BAIRRO: TDBEdit;
    dbedtCONT_EMAIL: TDBEdit;
    dbedtCONT_ID: TDBEdit;
    txtMsg: TStaticText;
    lstMesesDoAno: TListBox;
    dbedtCONT_TELEFONE1: TDBEdit;
    dbedtCONT_TELEFONE2: TDBEdit;
    dbedtCONT_CELULAR1: TDBEdit;
    dbedtCONT_CELULAR2: TDBEdit;
    GroupBox9: TGroupBox;
    edtFiltro: TEdit;
    memoTelaPrincipal: TDBMemo;
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
    btnCancelarInclusao: TSpeedButton;
    Label45: TLabel;
    memoAlteraObs: TMemo;
    Label8: TLabel;
    lstEscolheTipoRel: TListBox;
    lbl11: TLabel;
    edt_nome: TEdit;
    lbl50: TLabel;
    lblListaSegmentosParaInclusao: TStaticText;
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
    lblListaSegmentosParaAlteracao: TStaticText;
    edtAlteraNome: TEdit;
    edtAlteraEndereco: TEdit;
    edtAlteraEmail: TEdit;
    edtAlteraBairro: TEdit;
    db_CONT_ID: TEdit;
    DBSEGID: TEdit;
    Label10: TLabel;
    Label1: TLabel;

    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInativarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCadastrosClick(Sender: TObject);
    procedure btnConfirmaInclusaoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarInclusaoClick(Sender: TObject);
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
    procedure lblListaSegmentosParaInclusaoClick(Sender: TObject);
    procedure edt_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
      
    //procedimentos personalizados
    procedure EstadoInicialDosBotoes;
    procedure AtualizaQde;
    procedure GravaRegs;
    procedure Limpar;
    procedure BancoParaEdts;
    procedure GravarAlteracoes;
    procedure DesabilitarBotoes;
    procedure HabilitarBotoes;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure MostrandoContatoTelaInicial;
    procedure AbrirFormCadastroPadrao;
    procedure AbrirListaDeSegmentosCadastroAlteracaoDeContatos;
    procedure FiltrarPorNome;
    procedure edt_enderecoExit(Sender: TObject);
    procedure memoInclusaoObsEnter(Sender: TObject);
    procedure lblListaSegmentosParaAlteracaoClick(Sender: TObject);
    procedure edt_enderecoEnter(Sender: TObject);
    procedure edtFiltroKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    sqlDefalt, nome, endereco, bairro, cep, tel1,tel2,cel1,cel2,email,status,idcont, data, obs : string;
    idContSelecionado : integer;

  public
    { Public declarations }
    MesEscolhido : string;

  end;

var
  F_CONTATOS: TF_CONTATOS;


implementation

uses U_dmDados, U_dmPesquisas, U_dmDadosSegundo, U_ListaPadraoComUmCampo,
  U_BiblioSysSalao, DB, U_principal, U_QRelContatosCompleto, U_RelContatosIndividual,
  U_CadastroPadraoUmCampo, U_dmNewDataModule, U_dmPesqDados;

{$R *.dfm}


procedure TF_CONTATOS.FormCreate(Sender: TObject);
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

    sqlDefalt                 := 'select c.*, s.* FROM contatos c INNER JOIN segmentos s ON s.id_segmento = c.cont_segid WHERE c.cont_status = '+QuotedStr('A')+' ORDER BY c.cont_nome';

    edt_DataCadastro.Text     := DateToStr(now);
    lblDataDoDia.Caption      := DateToStr(date);
    lblHoraAtual.Caption      := timetoStr(time);
    EstadoInicialDosBotoes;

end;


procedure TF_CONTATOS.FormShow(Sender: TObject);
begin

    AbrirTabelas;
    AtualizaQde;
    MostrandoContatoTelaInicial;
    Caption := 'LOGADO POR '+NomeDoUsuarioLogado;
    edtFiltro.SetFocus;
    idContSelecionado := StrToInt(dbedtCONT_ID.Text);
    pan_titulo.Caption:= 'Controle de contatos - Consultando...';

end;

procedure TF_CONTATOS.btnInativarClick(Sender: TObject);
var
   idContato : integer;
begin

    idContato := StrToInt(dbedtCONT_ID.Text);

    if (idContato = 1)then
    begin
        Application.MessageBox('Este é um registro de sistema e não pode ser inativado!',
              'Atenção inativação não permitida!', MB_ICONWARNING);
              EstadoInicialDosBotoes;
    end else
    begin

          texto:= 'Confirma o desejo de inativar '+dbedtCONT_NOME1.Text+ '?';

          if Application.MessageBox(PChar(texto),'Inativar registro',MB_YESNO + MB_ICONQUESTION) = IdYes then
          begin

              _Sql := 'UPDATE contatos SET cont_status = '+QuotedStr('I')+' WHERE cont_id = :pIDCont';

               with DM_Pesq.Qry_Geral do
                begin

                   close;
                   sql.Clear;
                   sql.Add(_sql);
                   Params.ParamByName('pIDCont').AsInteger :=  idContato;
                   ExecSQL();

                end;

              Application.MessageBox('O registro foi inativado com sucesso!',
              'Inativo', MB_OK);

         end;

      pan_titulo.Caption:= 'Controle de Contatos - Visualizando...';
      HabilitarBotoes;
      EstadoInicialDosBotoes;
      FecharAbrirTabelas;

  end;

end;


procedure TF_CONTATOS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    Close;
    Release;

end;

procedure TF_CONTATOS.btnCadastrosClick(Sender: TObject);
begin

  if (btnCadastros.Caption = 'Voltar')then
   begin
      EstadoInicialDosBotoes;
   end else
   begin

     GridTelaPrincipal.Enabled    := True;
     edt_nome.SetFocus;
     pan_titulo.Caption:= 'Controle de Contatos - Incluindo...';
     pangrid_inclusao.BringToFront;
     btnCancelarInclusao.Enabled:=true;
     btnRetornar2.Enabled:=false;
     DesabilitarBotoes;
     cadastrando:=true;
     btnCadastros.Caption := 'Cadastro Inicial';
     btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');

   end;
     
end;


procedure TF_CONTATOS.btnConfirmaInclusaoClick(Sender: TObject);
begin
     
     if (( edt_nome.Text = '') or ( edt_endereco.Text = '') and (cadastrando)) then
      begin

           Application.MessageBox('Atenção preencha todos os campos para continuar!', 'Campos vazios', MB_ICONEXCLAMATION);
           edt_endereco.SetFocus;

      end else begin

         GravaRegs;
         LogOperacoes(NomeDoUsuarioLogado, 'cadastro de '+nomeTabela+'');
         btnRetornar2.Enabled:= true;
         btnCancelarInclusao.Enabled:= false;
         DesabilitarBotoes;
      end;

end;

procedure TF_CONTATOS.GravaRegs;
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
         obs      := memoInclusaoObs.Text;

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

       Application.MessageBox('Registro cadastrado com sucesso!', 'Novo registro', MB_OK);
       AtualizaQde;
       FecharAbrirTabelas;
       Limpar;
       cadastrando:=false;
       EstadoInicialDosBotoes;

end;

procedure TF_CONTATOS.btnAlterarClick(Sender: TObject);
begin

    pan_titulo.Caption:= 'Controle de Contatos - Alterando...';
    pangrid_alteracao.BringToFront;
    BancoParaEdts;
    DesabilitarBotoes;
    btnRetornar.Enabled          := true;
    btnConfirmaAlteracao.Enabled := true;
    
end;

procedure TF_CONTATOS.btnCancelarInclusaoClick(Sender: TObject);
begin

    //cancelamento da Inclusao
    cadastrando := false;
    DM_PesqDados.cdsPesqContato.Cancel;
    Limpar;
    btnRetornar2.Enabled         := true;
    btnConfirmaInclusao.Enabled  := False;
    btnCancelarInclusao.Enabled  := false;
    MostrandoContatoTelaInicial;    

end;


procedure TF_CONTATOS.btnRetornarClick(Sender: TObject);
begin

    //Saindo da Alteração
    MostrandoContatoTelaInicial;
    pangrid_visualizacao.BringToFront;
    pan_titulo.Caption:= 'Controle de contatos - Visualizando...';
    HabilitarBotoes;
    edtFiltro.Clear;
    edtFiltro.SetFocus;
    EstadoInicialDosBotoes;

end;

procedure TF_CONTATOS.btnRetornar2Click(Sender: TObject);
begin

    //Saindo da Inclusao
    cadastrando := false;
    lblListaSegmentosParaInclusao.Caption:= '';
    pangrid_visualizacao.BringToFront;
    AtualizaQde;
    FecharAbrirTabelas;
    pan_titulo.Caption:= 'Controle de contatos - Visualizando...';
    HabilitarBotoes;
    edtFiltro.Clear;
    edtFiltro.SetFocus;
    EstadoInicialDosBotoes;

end;      


procedure TF_CONTATOS.Limpar;
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
      memoInclusaoObs.Clear;


end;

procedure TF_CONTATOS.GravarAlteracoes;
begin

         IdGeral  := StrToInt(dbSegID.Text);
         idcont   := db_CONT_ID.Text;
         nome     := edtAlteraNome.Text;
         endereco := edtAlteraEndereco.Text;
         bairro   := edtAlteraBairro.Text;
         cep      := msk_cep2.Text;
         tel1     := msk_tel.Text;
         tel2     := msk_tel2.Text;
         cel1     := msk_tel3.Text;
         cel2     := msk_tel4.Text;
         email    := edtAlteraEmail.Text;
         obs      := memoAlteraObs.Text;


         _Sql :='UPDATE contatos SET cont_nome = :cont_nome, cont_segid = :cont_segid, cont_endereco = :cont_endereco, cont_bairro = :cont_bairro,  '+
                 'cont_cep = :cont_cep,cont_telefone1 = :cont_telefone1,cont_telefone2 = :cont_telefone2,cont_celular1 = :cont_celular1,cont_celular2 = :cont_celular2, '+
                 'cont_email = :cont_email, cont_obs = :cont_obs WHERE cont_id = :pIDContato';

         with DM_Pesq.Qry_Geral do
         begin

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
             Params.ParamByName('cont_obs').AsString           :=  obs;
             Params.ParamByName('pIDContato').AsInteger        :=  idContSelecionado;
             ExecSQL();

        end;

        FecharAbrirTabelas;
        Application.MessageBox('Alterações feitas com sucesso!', 'OK!',
             MB_OK + MB_ICONWARNING);


end;

procedure TF_CONTATOS.BancoParaEdts;
begin

     //setando todos os valores do banco em edits

     _Sql := 'select c.*, s.* FROM contatos c INNER JOIN segmentos s ON s.id_segmento = c.cont_segid WHERE c.cont_status = '+QuotedStr('A')+' AND c.cont_id = :pIDCont';

     with DM_PesqDados.cdsPesqContato do
     begin

         close;
         CommandText:= (_Sql);
         Params.ParamByName('pIDCont').AsInteger :=  idContSelecionado;
         open;

         if not IsEmpty then
         begin

             db_CONT_ID.Text              := DM_PesqDados.cdsPesqContato.FieldByname('cont_id').AsString;
             dbSegID.Text                 := DM_PesqDados.cdsPesqContato.FieldByname('cont_segid').AsString;
             edtAlteraNome.Text           := DM_PesqDados.cdsPesqContato.FieldByname('cont_nome').AsString;
             edtAlteraEndereco.Text       := DM_PesqDados.cdsPesqContato.FieldByname('cont_endereco').AsString;
             edtAlteraBairro.Text         := DM_PesqDados.cdsPesqContato.FieldByname('cont_bairro').AsString;
             edtAlteraEmail.Text          := DM_PesqDados.cdsPesqContato.FieldByname('cont_email').AsString;
             msk_cep2.Text                := DM_PesqDados.cdsPesqContato.FieldByname('cont_cep').AsString;
             msk_tel.Text                 := DM_PesqDados.cdsPesqContato.FieldByname('cont_telefone1').AsString;
             msk_tel2.Text                := DM_PesqDados.cdsPesqContato.FieldByname('cont_telefone2').AsString;
             msk_tel3.Text                := DM_PesqDados.cdsPesqContato.FieldByname('cont_celular1').AsString;
             msk_tel4.Text                := DM_PesqDados.cdsPesqContato.FieldByname('cont_celular2').AsString;
             memoAlteraObs.Text           := DM_PesqDados.cdsPesqContato.FieldByname('cont_obs').AsString;

         end;

     end;
     //mostrando o segmento cadastrado
     lblListaSegmentosParaAlteracao.Caption :=  RetornaStringPassandoID('segmento','segmentos','id_segmento',StrToInt(dbSegID.Text));

     edtAlteraNome.SetFocus;

end;


procedure TF_CONTATOS.btnConfirmaAlteracaoClick(Sender: TObject);
begin

     GravarAlteracoes;
     LogOperacoes(NomeDoUsuarioLogado, 'alteração nos dados de cliente cadastrado');
     MostrandoContatoTelaInicial;
     pangrid_visualizacao.BringToFront;
     edtFiltro.Clear;
     edtFiltro.SetFocus;
     pan_titulo.Caption:= 'Controle de contatos - Visualizando...';
     HabilitarBotoes;
     EstadoInicialDosBotoes;

end;


procedure TF_CONTATOS.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure TF_CONTATOS.DesabilitarBotoes;
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

procedure TF_CONTATOS.HabilitarBotoes;
var
  i : Integer;
begin

       //Habilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= true;
      end;


      btnRetornar2.Enabled:= True;

end;

procedure TF_CONTATOS.edt_nomeChange(Sender: TObject);
begin

    btnCancelarInclusao.Enabled:= True;
    btnRetornar2.Enabled:= False;
    
end;

procedure TF_CONTATOS.dbedt9Change(Sender: TObject);
begin

    btnRetornar.Enabled:=False;

end;

procedure TF_CONTATOS.dbedt13Change(Sender: TObject);
begin

    btnRetornar.Enabled:=False;

end;

procedure TF_CONTATOS.dbedt10Change(Sender: TObject);
begin

    btnRetornar.Enabled:=False;

end;

procedure TF_CONTATOS.msk_cep2Change(Sender: TObject);
begin

    btnRetornar.Enabled:=False;

    if Length(Trim(msk_cep2.Text)) = 9 then  edtAlteraBairro.setfocus;

end;

procedure TF_CONTATOS.dbedtCLI_STATUSChange(Sender: TObject);
begin

    btnRetornar.Enabled:=False;

end;

procedure TF_CONTATOS.btnSairClick(Sender: TObject);
begin

   cadastrando        :=false;
   cadastrandoContato := false;
   HabilitarBotoes;
   close;

end;

procedure TF_CONTATOS.AbrirTabelas;
begin

   DM_PesqDados.cdsPesqContato.Active  := true;

end;

procedure TF_CONTATOS.FecharTabelas;
begin

     DM_PesqDados.cdsPesqContato.Active := false;

end;

procedure TF_CONTATOS.FecharAbrirTabelas;
begin

  DM_PesqDados.cdsPesqContato.Active:= false;
  DM_PesqDados.cdsPesqContato.Active:= true;
  MostrandoContatoTelaInicial;
  AtualizaQde;

end;

procedure TF_CONTATOS.msk_cep2KeyPress(Sender: TObject; var Key: Char);
begin
         // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;
end;

procedure TF_CONTATOS.msk_cepKeyPress(Sender: TObject; var Key: Char);
begin
         // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;
end;

procedure TF_CONTATOS.dbedtCLI_STATUSKeyPress(Sender: TObject;
  var Key: Char);
begin

       // PARA DBEDIT ACEITAR APENAS LETRAS
       if not (Key in['A'..'Z',#8]) and not (Key in['a'..'z',#8]) then
        begin
          Key := #0;
       end;
end;

procedure TF_CONTATOS.edt_statusKeyPress(Sender: TObject; var Key: Char);
begin

       // PARA DBEDIT ACEITAR APENAS LETRAS
       if not (Key in['A'..'Z',#8]) and not (Key in['a'..'z',#8]) then
        begin
          Key := #0;
       end;
end;

procedure TF_CONTATOS.combo_Altera_StatusChange(Sender: TObject);
begin
      btnRetornar.Enabled:=False;
end;

procedure TF_CONTATOS.edt_nomeExit(Sender: TObject);
begin

   if not(edt_nome.Text = '')then
      begin
         cadastrando := true;
         if(TemDuplicidade(DM_PesqDados.cdsPesqContato,'cont_nome',edt_nome.Text))then
         begin

              Application.MessageBox('Atenção este contato já esta cadastrado!', 'Duplicidade no nome', MB_ICONEXCLAMATION);
              edt_nome.SetFocus;

         end else begin

            if(cadastrando)then
            begin
              AbrirListaDeSegmentosCadastroAlteracaoDeContatos;
              lblListaSegmentosParaInclusao.Caption := sTringGeral;
            end;

         end;

    end else
      begin
          if(cadastrando)then
          begin
             Application.MessageBox('Digite um nome para continuar!!',
                                  'Nome inválido!', MB_OK + MB_ICONWARNING);
           edt_nome.SetFocus;
          end;
    end;      

end;

procedure TF_CONTATOS.lstEscolheTipoRelClick(Sender: TObject);
begin

    pan_titulo.Caption:= 'Controle de Contatos - Visualizando...';
    lstEscolheTipoRel.Visible:= False;
    lstEscolheTipoRel.Align:= alNone;

    if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO   DE  TODOS  OS  CONTATOS' then
    begin

        TotalRegs := 0;         

       _Sql :='select c.*, s.* FROM contatos c INNER JOIN segmentos s ON s.id_segmento = c.cont_segid';

       Application.CreateForm(TQ_RelContatosCompleto, Q_RelContatosCompleto);

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
       FreeAndNil(Q_RelContatosCompleto);
       EstadoInicialDosBotoes;

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO DO CONTATO SELECIONADO' then
    begin

       TotalRegs := 1;

       Application.CreateForm(TQ_RelContatosIndividual, Q_RelContatosIndividual);
       
       with Q_RelContatosIndividual.Qry_DadosIndividual do
       begin

          Close;
          Params.ParamByName('pIDContato').AsInteger := idContSelecionado;
          Open;

       end;

       Q_RelContatosIndividual.QRLabelTotal.Caption    := IntToStr(TotalRegs);
       Q_RelContatosIndividual.Preview;
       FreeAndNil(Q_RelContatosIndividual);
       EstadoInicialDosBotoes;

    end;
    
end;

procedure TF_CONTATOS.btnimprimirClick(Sender: TObject);
begin

  if DM_PesqDados.cdsPesqContato.RecordCount = 0 then
  begin

    Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);
    exit;

  end
  else begin

    pan_titulo.Caption:= 'Controle de Contatos - Imprimindo...';
    LogOperacoes(NomeDoUsuarioLogado, 'acesso a relatórios de funcionários');
    lstEscolheTipoRel.Visible:= True;
    lstEscolheTipoRel.Align:= alClient;
    
  end;
end;

procedure TF_CONTATOS.btnSairConsClientesClick(Sender: TObject);
begin

    pangrid_visualizacao.BringToFront;
    pan_titulo.Caption:= 'Controle de contatos - Visualizando...';
    HabilitarBotoes;

end;

procedure TF_CONTATOS.FormKeyDown(Sender: TObject; var Key: Word;
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


procedure TF_CONTATOS.MostrandoContatoTelaInicial;
begin

      with DM_PesqDados.cdsPesqContato do
      begin

          Close;
          CommandText:= ('SELECT c.*, s.* FROM contatos c, segmentos s WHERE s.id_segmento = c.cont_segid AND cont_status = '+QuotedStr('A')+' ORDER BY cont_nome');
          Open;

            if not IsEmpty then
            begin

                dbedtCONT_NOME1.DataSource          :=  DM_PesqDados.dsPesqContato;
                dbedtCONT_NOME1.DataField           := 'CONT_NOME';

                dbedtCONT_ENDERECO.DataSource       :=  DM_PesqDados.dsPesqContato;
                dbedtCONT_ENDERECO.DataField        := 'CONT_ENDERECO';

                dbedtCONT_ID.DataSource             :=  DM_PesqDados.dsPesqContato;
                dbedtCONT_ID.DataField              := 'CONT_ID';

                dbedtCONT_BAIRRO.DataSource         :=  DM_PesqDados.dsPesqContato;
                dbedtCONT_BAIRRO.DataField          := 'CONT_BAIRRO';

                dbedtCONT_CEP.DataSource            :=  DM_PesqDados.dsPesqContato;
                dbedtCONT_CEP.DataField             := 'CONT_CEP';

                dbedtCONT_EMAIL.DataSource          :=  DM_PesqDados.dsPesqContato;
                dbedtCONT_EMAIL.DataField           := 'CONT_EMAIL';

                dbedtCONT_DATACAD.DataSource        :=  DM_PesqDados.dsPesqContato;
                dbedtCONT_DATACAD.DataField         := 'CONT_DATACAD';

                dbedtCONT_TELEFONE1.DataSource      :=  DM_PesqDados.dsPesqContato;
                dbedtCONT_TELEFONE1.DataField       := 'CONT_TELEFONE1';

                dbedtCONT_TELEFONE2.DataSource      :=  DM_PesqDados.dsPesqContato;
                dbedtCONT_TELEFONE2.DataField       := 'CONT_TELEFONE2';

                dbedtCONT_CELULAR1.DataSource       :=  DM_PesqDados.dsPesqContato;
                dbedtCONT_CELULAR1.DataField        := 'CONT_CELULAR1';

                dbedtCONT_CELULAR2.DataSource       :=  DM_PesqDados.dsPesqContato;
                dbedtCONT_CELULAR2.DataField        := 'CONT_CELULAR2';

                memoTelaPrincipal.DataSource        :=  DM_PesqDados.dsPesqContato;
                memoTelaPrincipal.DataField         := 'CONT_OBS';

                edt_seguimento.DataSource           :=  DM_PesqDados.dsPesqContato;
                edt_seguimento.DataField            := 'SEGMENTO';


                with GridTelaPrincipal do
                begin

                  DataSource:=  DM_PesqDados.dsPesqContato;
                  Columns.Clear;

                  Columns.Add;
                  Columns[0].FieldName         := 'CONT_NOME';
                  Columns[0].Width             := 390;
                  Columns[0].Alignment         := taLeftJustify;
                  Columns[0].Title.caption     := 'CONTATOS';
                  Columns[0].Title.Font.Style  := [fsBold];

                end;

            end;

            DM_PesqDados.cdsPesqContato.CommandText := sqlDefalt;

      end;

end;


procedure TF_CONTATOS.btnConsPorClienteClick(Sender: TObject);
begin

       edtFiltro.Clear;
       edtFiltro.SetFocus;
       MostrandoContatoTelaInicial;

end;

procedure TF_CONTATOS.edtFiltroChange(Sender: TObject);
begin
   FiltrarPorNome;
end;


procedure TF_CONTATOS.FiltrarPorNome;
var
  nome : string;
begin

       nome := edtFiltro.Text;

      _Sql  := 'select c.*, s.id_segmento, s.segmento FROM contatos c INNER JOIN segmentos s ON s.id_segmento = c.cont_segid WHERE '+
               'c.cont_status = '+QuotedStr('A')+' AND c.cont_nome LIKE (''%'+nome+'%'') OR s.segmento LIKE (''%'+nome+'%'') ORDER BY c.cont_nome';

      with DM_PesqDados.cdsPesqContato do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;    
end;


procedure TF_CONTATOS.lstMesesDoAnoClick(Sender: TObject);
begin

    case lstMesesDoAno.ItemIndex of

        0: MesEscolhido := '1';  //JANEIRO
        1: MesEscolhido := '2';  //FEVEREIRO
        2: MesEscolhido := '3';  //MARÇO
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

end;

procedure TF_CONTATOS.lstMesesDoAnoKeyPress(Sender: TObject;
  var Key: Char);
begin

      if key=#27 then begin

         lstMesesDoAno.Visible := false;

          //Habilitando os botões
          pan_botoes.Enabled := true;
          pan_titulo.Caption:='Controle de contatos - Visualizando...';

      end;

end;

procedure TF_CONTATOS.edt_DDDFONEKeyPress(Sender: TObject;
  var Key: Char);
begin

     // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure TF_CONTATOS.edt_DDDFONE2KeyPress(Sender: TObject;
  var Key: Char);
begin

     // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure TF_CONTATOS.dbedt13Enter(Sender: TObject);
begin

    btnRetornar.Enabled:= true;

end;

procedure TF_CONTATOS.edtFiltroKeyDown(Sender: TObject; var Key: Word;
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


procedure TF_CONTATOS.GridTelaPrincipalCellClick(Column: TColumn);
begin

    idContSelecionado    :=  DM_PesqDados.cdsPesqContato.fieldbyname('cont_id').AsInteger;
    edtFiltro.SetFocus;
    btnCadastros.Caption := 'Voltar';
    btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Ok.bmp');
    btnAlterar.Enabled:=true;
    btnInativar.Enabled:=true;
    btnimprimir.Enabled:=true;

end;

procedure TF_CONTATOS.msk_cepChange(Sender: TObject);
begin

    if Length(Trim(msk_cep.Text)) = 9 then  edt_email.setfocus;

end;

procedure TF_CONTATOS.msk_FoneChange(Sender: TObject);
begin

    if Length(Trim(msk_Fone.Text)) = 9 then  msk_Fone2.setfocus;

end;

procedure TF_CONTATOS.msk_Fone2Change(Sender: TObject);
begin

    if Length(Trim(msk_Fone2.Text)) = 9 then  msk_Fone3.setfocus;

end;

procedure TF_CONTATOS.msk_Fone3Change(Sender: TObject);
begin

    if Length(Trim(msk_Fone3.Text)) = 10 then  msk_Fone4.setfocus;

end;

procedure TF_CONTATOS.msk_Fone4Change(Sender: TObject);
begin

    if Length(Trim(msk_Fone4.Text)) = 10 then  memoInclusaoObs.setfocus;

end;

procedure TF_CONTATOS.msk_telChange(Sender: TObject);
begin

    if Length(Trim(msk_tel.Text)) = 9 then  msk_tel2.setfocus;

end;

procedure TF_CONTATOS.msk_tel2Change(Sender: TObject);
begin

    if Length(Trim(msk_tel2.Text)) = 9 then  msk_tel3.setfocus;

end;

procedure TF_CONTATOS.msk_tel3Change(Sender: TObject);
begin

    if Length(Trim(msk_tel3.Text)) = 10 then  msk_tel4.setfocus;

end;

procedure TF_CONTATOS.msk_tel4Change(Sender: TObject);
begin

    if Length(Trim(msk_tel4.Text)) = 10 then  memoAlteraObs.setfocus;

end;

procedure TF_CONTATOS.edt_apelidoEnter(Sender: TObject);
begin

     //digitou um nome abre o botao salvar
     btnConfirmaInclusao.Enabled := true;

end;

procedure TF_CONTATOS.AtualizaQde;
begin
    //procedimento local que informa a quantidade de registros na tabela
    qdeRegs               := retornaQuantidadeRegsAtivosTabela('cont_id','contatos','cont_status');
    txtMsg.Caption        := 'Total de contatos cadastrados '+ IntToStr( qdeRegs );
    txtMsg.Color          := clWhite;
    txtMsg.Visible        := true;
    txtMsg.Font.Color     := clBlue;

end;

procedure TF_CONTATOS.memoTelaPrincipalEnter(Sender: TObject);
begin
edtFiltro.SetFocus;
end;

procedure TF_CONTATOS.lblListaSegmentosParaInclusaoClick(Sender: TObject);
begin
  //clicou no label cadastrando
  if (cadastrando)then
  begin
    AbrirListaDeSegmentosCadastroAlteracaoDeContatos;
    lblListaSegmentosParaInclusao.Caption := sTringGeral;
    edt_endereco.SetFocus;
  end;
end;

procedure TF_CONTATOS.AbrirListaDeSegmentosCadastroAlteracaoDeContatos;
begin

      //dados necessários para acessar lista padrao com apenas um campo
       nomeTabela    := 'SEGMENTOS';
       campoNome     := 'SEGMENTO';
       campoID       := 'ID_SEGMENTO';
       cdsTable      := dm_DadosSegundo.cds_Segmentos;
       dsTable       := dm_DadosSegundo.ds_Segmentos;

       cadastrandoContato := true;

       Application.CreateForm(T_frmCadastroPadraoUmCampo,  _frmCadastroPadraoUmCampo);
       _frmCadastroPadraoUmCampo.ShowModal;
       FreeAndNil(_frmCadastroPadraoUmCampo);

end;

procedure TF_CONTATOS.AbrirFormCadastroPadrao;
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

procedure TF_CONTATOS.edt_nomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if(key = 13)then
  begin
      cadastrando:=true;  
  end;
end;

procedure TF_CONTATOS.edt_enderecoExit(Sender: TObject);
begin
  btnConfirmaInclusao.Enabled:= true;
end;

procedure TF_CONTATOS.memoInclusaoObsEnter(Sender: TObject);
begin
   //posicionando o cursor na primeira linha do Memo
   memoInclusaoObs.SelStart := Perform(EM_LINEINDEX, 0, 0);
end;

procedure TF_CONTATOS.lblListaSegmentosParaAlteracaoClick(Sender: TObject);
begin
   //clicou no label de segmentos agora editando
    AbrirListaDeSegmentosCadastroAlteracaoDeContatos;
    lblListaSegmentosParaAlteracao.Caption := sTringGeral;
    DBSEGID.Text := IntToStr(IdGeral);
    memoAlteraObs.SetFocus;

end;

procedure TF_CONTATOS.edt_enderecoEnter(Sender: TObject);
begin
  cadastrando := true;
end;

procedure TF_CONTATOS.EstadoInicialDosBotoes;
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
    MostrandoContatoTelaInicial;

end;
procedure TF_CONTATOS.edtFiltroKeyPress(Sender: TObject; var Key: Char);
begin
      btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Ok.bmp');
      btnAlterar.Enabled  :=false;
      btnInativar.Enabled :=false;
      btnimprimir.Enabled := false;
      btnCadastros.Caption:='Voltar';
end;

end.

