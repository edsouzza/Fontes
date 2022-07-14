unit U_Clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr, DateUtils,
  ToolEdit, RXDBCtrl, Midas;

type
  T_frmClientes = class(TForm)
    pan_titulo: TPanel;
    pan_botoes: TPanel;
    btnCadastros: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnInativar: TSpeedButton;
    btnHistorico: TSpeedButton;
    btnSair: TSpeedButton;
    btnimprimir: TSpeedButton;
    pangrid_inclusao: TPanel;
    pangrid_alteracao: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    lstEscolheTipoRel: TListBox;
    btnAbrirVenda: TSpeedButton;
    pangrid_visualizacao: TPanel;
    grid_clientes: TDBGrid;
    txtMsg: TStaticText;
    lstMesesDoAno: TListBox;
    GroupBox9: TGroupBox;
    edtConsCli: TEdit;
    grp2: TGroupBox;
    grp3: TGroupBox;
    btnConfirmaAlteracao: TSpeedButton;
    btnRetornar: TSpeedButton;
    grp1: TGroupBox;
    lbl11: TLabel;
    lbl13: TLabel;
    lbl17: TLabel;
    lbl16: TLabel;
    lbl15: TLabel;
    lbl12: TLabel;
    lblFones: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edt_complemento: TEdit;
    msk_cep: TMaskEdit;
    edt_nome: TEdit;
    edt_apelido: TEdit;
    edt_endereco: TEdit;
    edt_email: TEdit;
    msk_Fone: TMaskEdit;
    edt_historico: TEdit;
    msk_DataNascto: TDateEdit;
    msk_Fone2: TMaskEdit;
    edt_DDDFONE: TEdit;
    edt_DDDFONE2: TEdit;
    msk_Fone3: TMaskEdit;
    msk_Fone4: TMaskEdit;
    edt_DDDFONE3: TEdit;
    edt_DDDFONE4: TEdit;
    msk_cpf: TMaskEdit;
    msk_cnpj: TMaskEdit;
    memoInclusaoCli: TMemo;
    GroupBox1: TGroupBox;
    btnConfirmaInclusao: TSpeedButton;
    btnRetornar2: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    lbl10: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl25: TLabel;
    lbl27: TLabel;
    lbl29: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label45: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbl26: TLabel;
    msk_cep2: TMaskEdit;
    edtAlteraBairro: TEdit;
    msk_tel: TMaskEdit;
    msk_tel2: TMaskEdit;
    msk_tel3: TMaskEdit;
    msk_tel4: TMaskEdit;
    msk_ie1: TMaskEdit;
    mskAlteraCPF: TMaskEdit;
    mskAlteraCNPJ: TMaskEdit;
    edtAlteraNome: TEdit;
    edtAlteraPlacaPrincipal: TEdit;
    edtAlteraEmail: TEdit;
    edtAlteraEndereco: TEdit;
    edtdddfone: TDBEdit;
    edtdddfone2: TDBEdit;
    edtdddfone3: TDBEdit;
    edtdddfone4: TDBEdit;
    memoAlteCli: TMemo;
    msk_AlteraDataNascto: TDateEdit;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    msk_ie: TMaskEdit;
    grDados: TGroupBox;
    lbl1: TLabel;
    lbl9: TLabel;
    lbl7: TLabel;
    lbl2: TLabel;
    lbl6: TLabel;
    lbl4: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    lbl28: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label12: TLabel;
    Label9: TLabel;
    dbedt7: TDBEdit;
    dbedt1: TDBEdit;
    dbedtCLI_NOME: TDBEdit;
    dbedt2: TDBEdit;
    dbedtCLI_DATANASCTO: TDBEdit;
    dbedt4: TDBEdit;
    dbedt3: TDBEdit;
    dbedt5: TDBEdit;
    dbedtCLI_ID: TDBEdit;
    dbedtCLI_DDDFONE: TDBEdit;
    dbedtCLI_FONE: TDBEdit;
    dbedtCLI_DDDFONE2: TDBEdit;
    dbedtCLI_FONE2: TDBEdit;
    dbedtCLI_DDDFONE3: TDBEdit;
    dbedtCLI_FONE3: TDBEdit;
    dbedtCLI_DDDFONE4: TDBEdit;
    dbedtCLI_FONE4: TDBEdit;
    memoTelaPrinClientes: TDBMemo;

    {PROCEDIMENTOS PERSONALIZADOS}

    procedure AtualizaQde;
    procedure FiltrarRegistrosNaDigitacao;
    procedure IniciarVenda;
    procedure VerificarSeECliente;
    procedure MostrandoClientesTelaInicialPeloNomeDoCliente;
    procedure PesquisarPeriodosDeAniversariantes;
    procedure VerificaAniversariantesDoDia;
    procedure DesabilitarBotoes;
    procedure HabilitarBotoes;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure Abrir_FecharTabelas;
    procedure EstadoInicialDosBotoes;
    procedure BancoParaEdts;
    procedure GravarAlteracoes;
    procedure GravaRegs;
    procedure Limpar;

    {PROCEDIMENTOS DEFAULT}

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
    procedure btnHistoricoClick(Sender: TObject);
    procedure edt_nomeChange(Sender: TObject);
    procedure dbedt9Change(Sender: TObject);
    procedure dbedt13Change(Sender: TObject);
    procedure dbedt10Change(Sender: TObject);
    procedure msk_cep2Change(Sender: TObject);
    procedure msk_AlteraDataNasctoChange(Sender: TObject);
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
    procedure edt_DDDFONEEnter(Sender: TObject);
    procedure edt_DDDFONE2Enter(Sender: TObject);
    procedure dbedt13Enter(Sender: TObject);
    procedure edtConsCliChange(Sender: TObject);
    procedure edtConsCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAbrirVendaClick(Sender: TObject);
    procedure grid_clientesCellClick(Column: TColumn);
    procedure rdIEClick(Sender: TObject);
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
    procedure btnConsPorPlacasClick(Sender: TObject);
    procedure edtConsCliClick(Sender: TObject);
    procedure msk_ieChange(Sender: TObject);
    procedure msk_cpfChange(Sender: TObject);
    procedure msk_cnpjChange(Sender: TObject);
    procedure msk_ie1Change(Sender: TObject);
    procedure mskAlteraCPFChange(Sender: TObject);
    procedure mskAlteraCNPJChange(Sender: TObject);
    procedure edt_apelidoEnter(Sender: TObject);
    procedure pangrid_visualizacaoEnter(Sender: TObject);
    procedure memoTelaPrinClientesEnter(Sender: TObject);
    procedure memoInclusaoCliEnter(Sender: TObject);
    procedure memoAlteCliEnter(Sender: TObject);
    procedure edtConsCliKeyPress(Sender: TObject; var Key: Char);
    procedure msk_DataNasctoClick(Sender: TObject);
    procedure msk_AlteraDataNasctoClick(Sender: TObject);



  private
    { Private declarations }
    texto, cpf, cnpj, dataHistorico, horaHistorico : string;
  public
    { Public declarations }
    MesEscolhido : string;
    filtrouPorCliente, filtrouPorPlaca, clicouHistorico, clienteBalcao : boolean;

  end;

var
  _frmClientes: T_frmClientes;


implementation

uses U_dmDados, U_dmPesquisas, U_dmDadosSegundo,
  U_BiblioSysSalao, U_QRelClienteCompleto, U_QRelClienteParcial,
  U_ConsHistoricoClientes, DB, DBClient, U_QRelAniversariantes,
  U_principal, U_Caixa, U_EntraCPFCNPJVendaBalcao,
  U_QRelFuncsAniversariantes, U_EscolhaTipoAcao, U_orcamento;

{$R *.dfm}


procedure T_frmClientes.FormCreate(Sender: TObject);
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
   
    //A TABELA ENCONTRA-SE ABERTA AO CLICAR DO BOTAO CLIENTES
    //Recebe a data atual por padrão  

    lblDataDoDia.Caption      := DateToStr(date);
    lblHoraAtual.Caption      := timetoStr(time);
    flag :=0;
    EstadoInicialDosBotoes;
    
end;


procedure T_frmClientes.FormShow(Sender: TObject);
begin

    dm_Conexao.cds_DadosClientes.Active := true;
    MostrandoClientesTelaInicialPeloNomeDoCliente;
    Caption := 'LOGADO POR '+NomeDoUsuarioLogado;

    if flag = 1 then
    begin

       pan_titulo.Caption:= 'Controle de Clientes - Consultando...';
       flag := 0;

    end;

    if not(ModuloFrenteCaixaAtivado)then
    begin
         btnAbrirVenda.Caption := 'Orçamento';
    end else
    begin
        btnAbrirVenda.Caption :=  'Venda / Orçamento';
    end;

    filtrouPorPlaca      := true;
    clicouHistorico      := false;
    edtConsCli.SetFocus;
    
end;

procedure T_frmClientes.btnInativarClick(Sender: TObject);
begin   


        DesabilitarBotoes;
        pan_titulo.Caption:= 'Controle de Clientes - Inativando...';

        texto:= 'Confirma o desejo de inativar o Cliente '+dbedtCLI_NOME.Text+ '?';

         if Application.MessageBox(PChar(texto),'Inativar Cliente',MB_YESNO + MB_ICONQUESTION) = IdYes then
         begin


                  _SQL := 'UPDATE CLIENTES SET CLI_STATUS = '+QuotedStr('I')+' WHERE CLI_ID = :pID';

                  with DM_Pesq.Qry_Geral do
                  begin

                     close;
                     sql.Clear;
                     sql.Add(_sql);
                     Params.ParamByName('pID').AsInteger := idCliente;
                     ExecSQL();

                  end;

                  Application.MessageBox('Cliente inativado com sucesso!',
                  'Inativo', MB_OK);

                  pan_titulo.Caption:= 'Visualizando pelo nome';
                  HabilitarBotoes;
                  btnInativar.Enabled  :=false;
                  btnAlterar.Enabled   := false;
                  btnimprimir.Enabled  := false;

          end else begin

                dm_Conexao.cds_DadosClientes.CancelUpdates;
                pan_titulo.Caption:= 'Visualizando clientes pelo nome';
                HabilitarBotoes;
                btnimprimir.Enabled  := false;
                btnInativar.Enabled  := false;
                btnAlterar.Enabled   := false;

          end;

          Abrir_FecharTabelas;
          EstadoInicialDosBotoes;

end;


procedure T_frmClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    FecharTabelas;
    Release;

end;

procedure T_frmClientes.btnCadastrosClick(Sender: TObject);
begin

   if (btnCadastros.Caption = 'Voltar')then
   begin
      EstadoInicialDosBotoes;
   end else
   begin
     grid_clientes.Enabled    := True;

     pan_titulo.Caption:= 'Controle de Clientes - Incluindo...';
     pangrid_inclusao.BringToFront;
     DesabilitarBotoes;
     cadastrando := true;
     edt_nome.SetFocus;
     if cadastrando then btnRetornar2.Enabled:=false;
   end;

end;


procedure T_frmClientes.btnConfirmaInclusaoClick(Sender: TObject);
begin

     GravaRegs;
     LogOperacoes(NomeDoUsuarioLogado, 'cadastro de novo cliente');
     idCliente   :=  proxNum;
     clienteNovo :=  true;
     Limpar;
     btnRetornar2.Enabled:= true;
     btnCancelar.Enabled:= false;
     Application.MessageBox('Cliente cadastrado com sucesso!', 'Cadastro', MB_OK);
     exit;
     MostrandoClientesTelaInicialPeloNomeDoCliente;    

end;

procedure T_frmClientes.GravaRegs;
begin

      //passando a dataAtual e horaAtual
     horaHistorico := TimeToStr(time);
     dataHistorico := DateToStr(date);


     NomeDoClienteDaVenda :=  edt_nome.text;

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

    
     // Abrindo um registro novo e gravando no bd
     with dm_Conexao.cds_DadosClientes do
     begin

        Append;


        //PARA ACEITAR DATA VAZIA AO CADASTRAR
        if not (msk_DataNascto.Text = '  /  /    ') then
              FieldByName('cli_datanascto').AsDateTime  := StrToDate(msk_DataNascto.Text)
        else
              FieldByName('cli_datanascto').Clear;

        // Para o código eu usei a variavel proxNum usada na consulta acima
        FieldByName('cli_id').AsInteger              := proxNum;
        FieldByname('cli_nome').AsString             := edt_nome.Text;
        FieldByname('cli_apelido').AsString          := edt_apelido.Text;
        FieldByname('cli_endereco').AsString         := edt_endereco.Text;
        FieldByname('cli_complemento').AsString      := edt_complemento.Text;
        FieldByname('cli_cep').AsString              := msk_cep.Text;
        FieldByname('cli_cpf').AsString              := msk_cpf.Text;
        FieldByname('cli_cnpj').AsString             := msk_cnpj.Text;
        FieldByname('cli_ie').AsString               := msk_IE.Text;
        FieldByname('cli_dddfone').AsString          := edt_DDDFONE.Text;
        FieldByname('cli_fone').AsString             := msk_Fone.Text;
        FieldByname('cli_dddfone2').AsString         := edt_DDDFONE2.Text;
        FieldByname('cli_fone2').AsString            := msk_Fone2.Text;
        FieldByname('cli_dddfone3').AsString         := edt_DDDFONE3.Text;
        FieldByname('cli_fone3').AsString            := msk_Fone3.Text;
        FieldByname('cli_dddfone4').AsString         := edt_DDDFONE4.Text;
        FieldByname('cli_fone4').AsString            := msk_Fone4.Text;
        FieldByname('cli_email').AsString            := edt_email.Text;
        FieldByname('cli_historico').AsString        := dataHistorico + ' ' + horaHistorico + ' ..: ' + edt_historico.text;
        FieldByname('cli_obs').AsString              := memoInclusaoCli.Text;
        FieldByname('cli_datacad').AsString          := dateToStr(now);
        FieldByname('cli_status').AsString           := 'A';
        ApplyUpdates(0);

     end;


     ECliente    := true;
     Abrir_FecharTabelas;          
     DesabilitarBotoes;
     EstadoInicialDosBotoes;

end;


procedure T_frmClientes.btnAlterarClick(Sender: TObject);
begin

    pan_titulo.Caption:= 'Controle de Clientes - Alterando...';
    pangrid_alteracao.BringToFront;
    BancoParaEdts;
    DesabilitarBotoes;
    btnRetornar.Enabled          := true;
    btnConfirmaAlteracao.Enabled := true;

end;

procedure T_frmClientes.btnCancelarClick(Sender: TObject);
begin

    //Inclusao
    cadastrando := false;
    dm_Conexao.cds_DadosClientes.Cancel;
    Limpar;
    btnRetornar2.Enabled         := true;
    btnConfirmaInclusao.Enabled  := False;
    btnCancelar.Enabled          := false;
    btnAbrirVenda.Enabled        := false;
    MostrandoClientesTelaInicialPeloNomeDoCliente;


end;


procedure T_frmClientes.btnRetornarClick(Sender: TObject);
begin

    //Alteração
    pangrid_visualizacao.BringToFront;
    pan_titulo.Caption:= 'Controle de Clientes - Visualizando...';
    HabilitarBotoes;
    btnAbrirVenda.Enabled     := false;
    edtConsCli.Clear;
    edtConsCli.SetFocus;
    EstadoInicialDosBotoes;
    
end;

procedure T_frmClientes.btnRetornar2Click(Sender: TObject);
begin

    //Inclusao
    cadastrando := false;
    pangrid_visualizacao.BringToFront;
    pan_titulo.Caption:= 'Controle de Clientes - Visualizando...';
    HabilitarBotoes;
    EstadoInicialDosBotoes;
    edtConsCli.Clear;
    edtConsCli.SetFocus;

end;      


procedure T_frmClientes.Limpar;
var
  i : Integer;
begin

      //Limpando os Edits e Masks
      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TEdit)then
              (Components[i] as TEdit).Clear;
      end;

      msk_cep.Text      := '#####-###;1;_';
      msk_Fone.Text     := '####-####;1;_';
      msk_Fone2.Text    := '####-####;1;_';
      msk_Fone3.Text    := '#####-####;1;_';
      msk_Fone4.Text    := '#####-####;1;_';
      msk_cpf.Text      := '###.###.###-##;1;_';
      msk_ie.Text       := '###.###.###.###;1;_';
      msk_cnpj.text     := '###.###.###/####-##;1;_';
      edt_DDDFONE.Text  := '011';
      edt_DDDFONE2.Text := '011';
      edt_DDDFONE3.Text := '011';
      edt_DDDFONE4.Text := '011';
      memoInclusaoCli.Clear;
      msk_DataNascto.Clear;
      edt_nome.SetFocus;
      pan_titulo.Caption:= 'Controle de Clientes - Incluindo...';
      edt_historico.Text:= ' CADASTRO INICIAL';

end;

procedure T_frmClientes.GravarAlteracoes;
begin

     with DM_Pesq.cdsPesqCliente do
     begin

        Edit;

        FieldByname('cli_fone').AsString          := msk_tel.Text  ;
        FieldByname('cli_fone2').AsString         := msk_tel2.Text ;
        FieldByname('cli_fone3').AsString         := msk_tel3.Text ;
        FieldByname('cli_fone4').AsString         := msk_tel4.Text ;
        FieldByname('cli_cep').AsString           := msk_cep2.Text ;
        FieldByname('cli_cpf').AsString           := mskAlteraCPF.Text  ;
        FieldByname('cli_cnpj').AsString          := mskAlteraCNPJ.Text ;
        FieldByname('cli_ie').AsString            := msk_ie1.Text  ;
        FieldByname('cli_nome').AsString          := edtAlteraNome.Text  ;
        FieldByname('cli_apelido').AsString       := edtAlteraPlacaPrincipal.Text ;
        FieldByname('cli_email').AsString         := edtAlteraEmail.Text ;
        FieldByname('cli_endereco').AsString      := edtAlteraEndereco.Text ;
        FieldByname('cli_complemento').AsString   := edtAlteraBairro.Text ;
        FieldByname('cli_dddfone').AsString       := edtdddfone.Text ;
        FieldByname('cli_dddfone2').AsString      := edtdddfone2.Text ;
        FieldByname('cli_dddfone3').AsString      := edtdddfone3.Text ;
        FieldByname('cli_dddfone4').AsString      := edtdddfone4.Text ;
        FieldByname('cli_obs').AsString           := memoAlteCli.Text;

        if not (msk_AlteraDataNascto.Text = '  /  /    ') then
              FieldByName('cli_datanascto').AsDateTime  := StrToDate(msk_AlteraDataNascto.Text)
        else
              FieldByName('cli_datanascto').Clear;


        ApplyUpdates(0);

     end;

     Abrir_FecharTabelas;

     Application.MessageBox('Alterações feitas com sucesso!', 'OK!', MB_OK + MB_ICONWARNING);


end;

procedure T_frmClientes.BancoParaEdts;
begin

     // Mostrando os dados do Banco nos Edits para Alteração

     edtAlteraNome.Text                := DM_Pesq.cdsPesqCliente.FieldByname('cli_nome').AsString;
     edtAlteraPlacaPrincipal.Text      := DM_Pesq.cdsPesqCliente.FieldByname('cli_apelido').AsString;
     edtAlteraEmail.Text               := DM_Pesq.cdsPesqCliente.FieldByname('cli_email').AsString;
     edtAlteraEndereco.Text            := DM_Pesq.cdsPesqCliente.FieldByname('cli_endereco').AsString;
     edtAlteraBairro.Text              := DM_Pesq.cdsPesqCliente.FieldByname('cli_complemento').AsString;
     edtdddfone.Text                   := DM_Pesq.cdsPesqCliente.FieldByname('cli_dddfone').AsString;
     msk_tel.Text                      := DM_Pesq.cdsPesqCliente.FieldByname('cli_fone').AsString;
     edtdddfone2.Text                  := DM_Pesq.cdsPesqCliente.FieldByname('cli_dddfone2').AsString;
     msk_tel2.Text                     := DM_Pesq.cdsPesqCliente.FieldByname('cli_fone2').AsString;
     edtdddfone3.Text                  := DM_Pesq.cdsPesqCliente.FieldByname('cli_dddfone3').AsString;
     msk_tel3.Text                     := DM_Pesq.cdsPesqCliente.FieldByname('cli_fone3').AsString;
     edtdddfone4.Text                  := DM_Pesq.cdsPesqCliente.FieldByname('cli_dddfone4').AsString;
     msk_tel4.Text                     := DM_Pesq.cdsPesqCliente.FieldByname('cli_fone4').AsString;
     msk_cep2.Text                     := DM_Pesq.cdsPesqCliente.FieldByname('cli_cep').AsString;
     mskAlteraCPF.Text                 := DM_Pesq.cdsPesqCliente.FieldByname('cli_cpf').AsString;
     mskAlteraCNPJ.Text                := DM_Pesq.cdsPesqCliente.FieldByname('cli_cnpj').AsString;
     msk_ie1.Text                      := DM_Pesq.cdsPesqCliente.FieldByname('cli_ie').AsString;
     msk_AlteraDataNascto.Text         := DM_Pesq.cdsPesqCliente.FieldByname('cli_datanascto').AsString;
     memoAlteCli.Text                  := DM_Pesq.cdsPesqCliente.FieldByname('cli_obs').AsString;

     edtAlteraNome.SetFocus;

end;


procedure T_frmClientes.btnConfirmaAlteracaoClick(Sender: TObject);
begin

     GravarAlteracoes;
     LogOperacoes(NomeDoUsuarioLogado, 'alteração nos dados de cliente cadastrado');
     pangrid_visualizacao.BringToFront;
     pan_titulo.Caption:= 'Controle de Clientes - Visualizando...';
     HabilitarBotoes;
     EstadoInicialDosBotoes;
     
end;


procedure T_frmClientes.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmClientes.btnHistoricoClick(Sender: TObject);
begin
  clicouHistorico := true;

  if DM_Pesq.cdsPesqCliente.RecordCount = 0 then
  begin

    Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);
    exit;

  end
  else begin
       
       //historico mostrara o grid dependendo do tipo de filtro realizado
       if ( filtrouPorCliente )then
        begin

           MostrandoClientesTelaInicialPeloNomeDoCliente;

        end else if ( filtrouPorPlaca )then
        begin



        end;

       _frmConsHistorico := T_frmConsHistorico.Create(Self);
       _frmConsHistorico.ShowModal;
       FreeAndNil(_frmConsHistorico);

       vendeu := false;
       edtConsCli.Clear;
       EstadoInicialDosBotoes;

  end;

end;



procedure T_frmClientes.DesabilitarBotoes;
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

procedure T_frmClientes.HabilitarBotoes;
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

procedure T_frmClientes.edt_nomeChange(Sender: TObject);
begin

    btnCancelar.Enabled:= True;
    btnRetornar2.Enabled:= False; 
    
end;

procedure T_frmClientes.dbedt9Change(Sender: TObject);
begin

    btnRetornar.Enabled:=False;

end;

procedure T_frmClientes.dbedt13Change(Sender: TObject);
begin

    btnRetornar.Enabled:=False;

end;

procedure T_frmClientes.dbedt10Change(Sender: TObject);
begin

    btnRetornar.Enabled:=False;

end;

procedure T_frmClientes.msk_cep2Change(Sender: TObject);
begin

    btnRetornar.Enabled:=False;

    if Length(Trim(msk_cep2.Text)) = 9 then  msk_tel.setfocus;

end;

procedure T_frmClientes.msk_AlteraDataNasctoChange(Sender: TObject);
begin

     btnRetornar.Enabled:=False;

end;

procedure T_frmClientes.dbedtCLI_STATUSChange(Sender: TObject);
begin

    btnRetornar.Enabled:=False;

end;


procedure T_frmClientes.btnSairClick(Sender: TObject);
begin

if(btnSair.Caption ='Voltar')then
 begin

   lstMesesDoAno.Visible:= false;
   EstadoInicialDosBotoes;

 end else
 begin

   FecharTabelas;
   HabilitarBotoes;
   close;

 end;
    
end;


procedure T_frmClientes.AbrirTabelas;
begin

   DM_Pesq.cdsPesqCliente.Active       := true;
   dm_Conexao.cds_DadosClientes.Active := true;

end;


procedure T_frmClientes.FecharTabelas;
begin

     dm_Conexao.cds_DadosClientes.close;
     DM_Pesq.cdsPesqCliente.Active := false;

end;


procedure T_frmClientes.Abrir_FecharTabelas;
begin

  dm_Conexao.cds_DadosClientes.Active:= False;
  dm_Conexao.cds_DadosClientes.Active:= True;

  dm_DadosSegundo.cds_CadFuncoes.Active:= False;
  dm_DadosSegundo.cds_CadFuncoes.Active:= True;

  DM_Pesq.cdsPesqCliente.Active        := false;
  DM_Pesq.cdsPesqCliente.Active        := true;

  MostrandoClientesTelaInicialPeloNomeDoCliente;

  edtConsCli.SetFocus;

end;


procedure T_frmClientes.msk_cep2KeyPress(Sender: TObject; var Key: Char);
begin
         // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;
end;

procedure T_frmClientes.msk_cepKeyPress(Sender: TObject; var Key: Char);
begin
         // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;
end;

procedure T_frmClientes.dbedtCLI_STATUSKeyPress(Sender: TObject;
  var Key: Char);
begin

       // PARA DBEDIT ACEITAR APENAS LETRAS
       if not (Key in['A'..'Z',#8]) and not (Key in['a'..'z',#8]) then
        begin
          Key := #0;
       end;
end;

procedure T_frmClientes.edt_statusKeyPress(Sender: TObject; var Key: Char);
begin

       // PARA DBEDIT ACEITAR APENAS LETRAS
       if not (Key in['A'..'Z',#8]) and not (Key in['a'..'z',#8]) then
        begin
          Key := #0;
       end;
end;

procedure T_frmClientes.combo_Altera_StatusChange(Sender: TObject);
begin

      btnRetornar.Enabled:=False;

end;


procedure T_frmClientes.edt_nomeExit(Sender: TObject);
begin

      if not(edt_nome.Text = '')then
      begin
          edt_apelido.Text := retornaPrimeiroUltimoNome(edt_nome.Text);
          cadastrando := true;

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

procedure T_frmClientes.lstEscolheTipoRelClick(Sender: TObject);
begin

    pan_titulo.Caption:= 'Controle de Clientes - Visualizando...';
    lstEscolheTipoRel.Visible    := False;
    lstEscolheTipoRel.Align      := alNone;
    pangrid_visualizacao.Enabled := True;

    if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO   DE  TODOS  OS  CLIENTES' then
    begin

        TotalRegs := 0;

        _Sql := 'SELECT * FROM clientes WHERE cli_status = '+quotedstr('A')+' AND cli_id > 1 ORDER BY cli_nome';

        //PESQUISANDO A QUANTIDADE DE REGISTROS RETORNADO PELO QRY

       Application.CreateForm(TQ_RelClienteCompleto, Q_RelClienteCompleto);
       with Q_RelClienteCompleto.Qry_Clientes do
       begin

          SQL.Add(_Sql);
          Close;
          Open;

          if not IsEmpty then begin

             TotalRegs := Q_RelClienteCompleto.Qry_Clientes.RecordCount;

          end;

     end;

       Q_RelClienteCompleto.Qry_Clientes.Active   := True;
       Q_RelClienteCompleto.QRLabelTotal.Caption  := IntToStr(TotalRegs);
       Q_RelClienteCompleto.Preview;
       FreeAndNil(Q_RelClienteCompleto);
       EstadoInicialDosBotoes;

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO DO CLIENTE SELECIONADO' then
    begin
       Application.CreateForm(TQ_RelClienteParcial, Q_RelClienteParcial);
       with Q_RelClienteParcial.Qry_ClienteIndividual do
       begin

          Close;
          ParamByName('cli_id').asinteger := StrToInt(dbedtCLI_ID.Text);
          Open;

       end;

       Q_RelClienteParcial.Preview;
       FreeAndNil(Q_RelClienteParcial);

     end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO     DE     ANIVERSARIANTES' then
     begin

        lstMesesDoAno.Visible := true;
        lstMesesDoAno.Align   := alClient;
        lstMesesDoAno.BringToFront;
        
        //Desabilitando os botões
        pan_botoes.Enabled   := true;
        btnCadastros.Enabled := false;
        pan_titulo.Caption   := 'Consultando Aniversariantes do mês selecionado';
        btnSair.Caption:='Voltar';
        btnSair.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Ok.bmp');
        EstadoInicialDosBotoes;

    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELATÓRIO  LISTA  E-MAILS   CLIENTES' then
     begin

        pan_titulo.Caption := 'Gerando lista de e-mails dos clientes';

        //GERA UMA ARQUIVO TXT DA LISTA DE EMAILS CADASTRADOS NA TABELA DE CLIENTES
        GerarListaEmailsClientes;
        Application.MessageBox('A lista de e-mails dos clientes foi criada com sucesso!', 'Lista de emails de clientes', MB_OK);
        exit;
        
    end;


end;

procedure T_frmClientes.btnimprimirClick(Sender: TObject);
begin

     if (temImpressoraPadrao)then
     begin

          pan_titulo.Caption:= 'Controle de Clientes - Imprimindo...';
          lstEscolheTipoRel.Visible:= True;
          lstEscolheTipoRel.Align:= alClient;
          LogOperacoes(NomeDoUsuarioLogado, 'acesso a relatório de clientes');    

     end;

end;



procedure T_frmClientes.btnSairConsClientesClick(Sender: TObject);
begin

    pangrid_visualizacao.BringToFront;
    pan_titulo.Caption:= 'Controle de Clientes - Visualizando...';
    HabilitarBotoes;

end;

procedure T_frmClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

       if key= vk_F5 then
       begin


           HabilitarBotoes;
           txtMsg.Visible           := false;

           TemNivers                := false;
           edtConsCli.Enabled       := true;
           edtConsCli.SetFocus;
           btnHistorico.Enabled     := false;

       end;

        if key = VK_F2 then
        begin

             IniciarVenda;

        end;

end;


procedure T_frmClientes.VerificaAniversariantesDoDia;
var
  Dia_Atual, Trez_Proximos_Dias, Mes_Atual  : string;
  DataDoDia : TDate;

begin

    // ESSE PROCEDIMENTO MOSTRARÁ NA TELA INICIAL OS CLIENTES ANIVERSARIANTES DO DIA E DOS TRES PROXIMOS

    DataDoDia           := date;
    Trez_Proximos_Dias  := IntToStr(DayOf(DataDoDia)+3);
    Dia_Atual           := IntToStr(DayOf(DataDoDia));
    Mes_Atual           := IntToStr(MonthOf(DataDoDia));


     _Sql := 'SELECT cli_id, cli_nome, cli_apelido, cli_endereco, cli_complemento, cli_cpf, cli_cnpj, cli_ie, '+
             'cli_cep, cli_dddfone, cli_fone, cli_dddfone2, cli_fone2, cli_dddfone3, cli_fone3, cli_dddfone4, cli_fone4, '+
             'cli_email,  cli_datanascto, cli_datacad, cli_status, cli_historico, cli_obs, EXTRACT(DAY FROM cli_datanascto), EXTRACT(MONTH FROM cli_datanascto) '+
             'FROM clientes WHERE EXTRACT(DAY FROM cli_datanascto) BETWEEN :pDia AND :pDiasProximos AND '+
             'EXTRACT(MONTH FROM cli_datanascto) = :pMes AND cli_status = :pStatus ORDER BY EXTRACT(DAY FROM cli_datanascto) DESC AND cli_id > 1';


         with DM_Pesq.cdsPesqCliente do
         begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pDia').AsString          := Dia_Atual;
            Params.ParamByName('pDiasProximos').AsString := Trez_Proximos_Dias;
            Params.ParamByName('pMes').AsString          := Mes_Atual;
            Params.ParamByName('pStatus').AsString       := 'A';
            Open;


            // SE ENCONTRAR ANIVERSARIANTES POPULAR EDITS E GRID COM DADOS
            if not DM_Pesq.cdsPesqCliente.IsEmpty then
            begin

                  dbedtCLI_NOME.DataSource          :=  DM_Pesq.dsPesqCliente;
                  dbedtCLI_NOME.DataField           := 'CLI_NOME';

                  dbedt1.DataSource                 :=  DM_Pesq.dsPesqCliente;
                  dbedt1.DataField                  := 'CLI_APELIDO';

                  dbedt2.DataSource                 :=  DM_Pesq.dsPesqCliente;
                  dbedt2.DataField                  := 'CLI_ENDERECO';

                  dbedt3.DataSource                 :=  DM_Pesq.dsPesqCliente;
                  dbedt3.DataField                  := 'CLI_COMPLEMENTO';

                  dbedt4.DataSource                 :=  DM_Pesq.dsPesqCliente;
                  dbedt4.DataField                  := 'CLI_CEP';

                  dbedt5.DataSource                 :=  DM_Pesq.dsPesqCliente;
                  dbedt5.DataField                  := 'CLI_EMAIL';

                  dbedt7.DataSource                 :=  DM_Pesq.dsPesqCliente;
                  dbedt7.DataField                  := 'CLI_DATACAD';

                  dbedtCLI_ID.DataSource            :=  DM_Pesq.dsPesqCliente;
                  dbedtCLI_ID.DataField             := 'CLI_ID';

                  dbedtCLI_DDDFONE.DataSource       :=  DM_Pesq.dsPesqCliente;
                  dbedtCLI_DDDFONE.DataField        := 'CLI_DDDFONE';

                  dbedtCLI_FONE.DataSource          :=  DM_Pesq.dsPesqCliente;
                  dbedtCLI_FONE.DataField           := 'CLI_FONE';

                  dbedtCLI_DDDFONE2.DataSource      :=  DM_Pesq.dsPesqCliente;
                  dbedtCLI_DDDFONE2.DataField       := 'CLI_DDDFONE2';

                  dbedtCLI_FONE2.DataSource         :=  DM_Pesq.dsPesqCliente;
                  dbedtCLI_FONE2.DataField          := 'CLI_FONE2';

                  dbedtCLI_DDDFONE3.DataSource       :=  DM_Pesq.dsPesqCliente;
                  dbedtCLI_DDDFONE3.DataField        := 'CLI_DDDFONE3';

                  dbedtCLI_FONE3.DataSource          :=  DM_Pesq.dsPesqCliente;
                  dbedtCLI_FONE3.DataField           := 'CLI_FONE3';

                  dbedtCLI_DDDFONE4.DataSource      :=  DM_Pesq.dsPesqCliente;
                  dbedtCLI_DDDFONE4.DataField       := 'CLI_DDDFONE4';

                  dbedtCLI_FONE4.DataSource         :=  DM_Pesq.dsPesqCliente;
                  dbedtCLI_FONE4.DataField          := 'CLI_FONE4';

                  dbedtCLI_DATANASCTO.DataSource    :=  DM_Pesq.dsPesqCliente;
                  dbedtCLI_DATANASCTO.DataField     := 'CLI_DATANASCTO';

                  memoTelaPrinClientes.DataSource   :=  DM_Pesq.dsPesqCliente;
                  memoTelaPrinClientes.DataField    := 'CLI_OBS';


                  with Grid_Clientes do
                  begin

                    DataSource:=  DM_Pesq.dsPesqCliente;
                    Columns.Clear;

                    Columns.Add;
                    Columns[0].FieldName         := 'CLI_NOME';
                    Columns[0].Width             := 320;
                    Columns[0].Alignment         := taLeftJustify;
                    Columns[0].Title.caption     := 'CLIENTES';
                    Columns[0].Title.Font.Style  := [fsBold];

                  end;


                  with txtMsg do
                  begin

                    Caption := 'Aniversariante(s) do dia e/ou dos três próximos. Clique em F5 para continuar';
                    Visible := True;

                  end;

                 DesabilitarBotoes;
                 TemNivers          := true;
                 edtConsCli.Enabled := false;

            end
            else begin

               //SE NAO ENCONTRAR ANIVERSARIANTES MOSTRE TODOS OS CLIENTES


            end;

         end;

end;



procedure T_frmClientes.MostrandoClientesTelaInicialPeloNomeDoCliente;
begin

            //MOSTRA TODOS OS CLIENTES COM EXCEÇÃO DOS  INATIVOS

            with DM_Pesq.cdsPesqCliente do
            begin

                Close;
                CommandText:= ('SELECT * FROM clientes WHERE  cli_status = '+QuotedStr('A')+'  AND cli_id > 1 ORDER BY cli_nome');
                Open;

            end;


            dbedtCLI_NOME.DataSource          :=  DM_Pesq.dsPesqCliente;
            dbedtCLI_NOME.DataField           := 'CLI_NOME';

            dbedt1.DataSource                 :=  DM_Pesq.dsPesqCliente;
            dbedt1.DataField                  := 'CLI_APELIDO';

            dbedt2.DataSource                 :=  DM_Pesq.dsPesqCliente;
            dbedt2.DataField                  := 'CLI_ENDERECO';

            dbedt3.DataSource                 :=  DM_Pesq.dsPesqCliente;
            dbedt3.DataField                  := 'CLI_COMPLEMENTO';  

            dbedt4.DataSource                 :=  DM_Pesq.dsPesqCliente;
            dbedt4.DataField                  := 'CLI_CEP';

            dbedt5.DataSource                 :=  DM_Pesq.dsPesqCliente;
            dbedt5.DataField                  := 'CLI_EMAIL';

            dbedt7.DataSource                 :=  DM_Pesq.dsPesqCliente;
            dbedt7.DataField                  := 'CLI_DATACAD';

            memoTelaPrinClientes.DataSource   :=  DM_Pesq.dsPesqCliente;
            memoTelaPrinClientes.DataField    := 'CLI_OBS';

            dbedtCLI_ID.DataSource            :=  DM_Pesq.dsPesqCliente;
            dbedtCLI_ID.DataField             := 'CLI_ID';

            dbedtCLI_DDDFONE.DataSource       :=  DM_Pesq.dsPesqCliente;
            dbedtCLI_DDDFONE.DataField        := 'CLI_DDDFONE';

            dbedtCLI_FONE.DataSource          :=  DM_Pesq.dsPesqCliente;
            dbedtCLI_FONE.DataField           := 'CLI_FONE';

            dbedtCLI_DDDFONE2.DataSource      :=  DM_Pesq.dsPesqCliente;
            dbedtCLI_DDDFONE2.DataField       := 'CLI_DDDFONE2';

            dbedtCLI_FONE2.DataSource         :=  DM_Pesq.dsPesqCliente;
            dbedtCLI_FONE2.DataField          := 'CLI_FONE2';

            dbedtCLI_DDDFONE3.DataSource       := DM_Pesq.dsPesqCliente;
            dbedtCLI_DDDFONE3.DataField        := 'CLI_DDDFONE3';

            dbedtCLI_FONE3.DataSource          := DM_Pesq.dsPesqCliente;
            dbedtCLI_FONE3.DataField           := 'CLI_FONE3';

            dbedtCLI_DDDFONE4.DataSource      :=  DM_Pesq.dsPesqCliente;
            dbedtCLI_DDDFONE4.DataField       := 'CLI_DDDFONE4';

            dbedtCLI_FONE4.DataSource         :=  DM_Pesq.dsPesqCliente;
            dbedtCLI_FONE4.DataField          := 'CLI_FONE4';

            dbedtCLI_DATANASCTO.DataSource    :=  DM_Pesq.dsPesqCliente;
            dbedtCLI_DATANASCTO.DataField     := 'CLI_DATANASCTO';

            memoTelaPrinClientes.DataSource   :=  DM_Pesq.dsPesqCliente;
            memoTelaPrinClientes.DataField    := 'CLI_OBS';


            with Grid_Clientes do
            begin

              DataSource:=  DM_Pesq.dsPesqCliente;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName         := 'CLI_NOME';
              Columns[0].Width             := 390;
              Columns[0].Alignment         := taLeftJustify;
              Columns[0].Title.caption     := 'CLIENTES';
              Columns[0].Title.Font.Style  := [fsBold];
              Columns[0].Title.Alignment   := taCenter;

            end;

            AtualizaQde;
            btnHistorico.Enabled := false;
            pan_titulo.Caption   :='Visualizando clientes';

end;


procedure T_frmClientes.btnConsPorClienteClick(Sender: TObject);
begin

       if not( clicouHistorico ) then
           btnHistorico.Enabled := false
       else
           btnHistorico.Enabled := true;

       edtConsCli.Clear;
       edtConsCli.SetFocus;
       MostrandoClientesTelaInicialPeloNomeDoCliente;

       filtrouPorCliente         := true;
       filtrouPorPlaca           := false;
       ConsultouPorCliente       := true;


end;

procedure T_frmClientes.btnConsPorPlacasClick(Sender: TObject);
begin

       edtConsCli.Clear;
       edtConsCli.SetFocus;               
       filtrouPorPlaca           := true;
       filtrouPorCliente         := false;
       ConsultouPorCliente       := false;

end;

procedure T_frmClientes.edtConsCliChange(Sender: TObject);
begin

   FiltrarRegistrosNaDigitacao;

end;

procedure T_frmClientes.FiltrarRegistrosNaDigitacao;
var
  nome : string;
begin

      nome := edtConsCli.Text;

      _Sql  := 'SELECT * FROM clientes WHERE cli_nome LIKE (''%'+nome+'%'') AND cli_status = '+QuotedStr('A')+' AND cli_id > 1 ORDER BY cli_nome';

      with DM_Pesq.cdsPesqCliente do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;
         
end;


procedure T_frmClientes.PesquisarPeriodosDeAniversariantes;
begin

         _Sql := 'SELECT cli_nome, cli_datanascto FROM clientes '+
         'WHERE EXTRACT(MONTH FROM cli_datanascto) = :pMes AND cli_id > 1 '+
         'AND cli_status = '+QuotedStr('A')+' ORDER BY EXTRACT(DAY FROM cli_datanascto)';

         Application.CreateForm(TQ_RelAniversariantes,  Q_RelAniversariantes);
         with Q_RelAniversariantes.cds_RelAniversariantes do begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pMes').AsString := MesEscolhido;
            Open;

               if not Q_RelAniversariantes.cds_RelAniversariantes.IsEmpty then begin

                   with Q_RelAniversariantes do
                   begin
                      qry_RelAniversariantes.SQL.Add(_Sql);
                      cds_RelAniversariantes.Active := true;
                      lblnomeDoMes.Caption          := retornarNomeMes(StrToInt(MesEscolhido));
                      ReportTitle                   := 'Lista de Clientes Aniversariantes do mês de '+retornarNomeMes(StrToInt(MesEscolhido));
                      Preview;
                   end

              end

              else begin

                  texto := 'Nenhum cliente aniversariante no mês de '+retornarNomeMes(StrToInt(MesEscolhido))+'!';
                  Application.MessageBox(Pchar(texto), 'Nenhum cliente aniversariante!',MB_OK + MB_ICONWARNING);

              end;

         end;
         FreeAndNil(Q_RelAniversariantes);
end;

procedure T_frmClientes.lstMesesDoAnoClick(Sender: TObject);
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

        PesquisarPeriodosDeAniversariantes;

end;

procedure T_frmClientes.lstMesesDoAnoKeyPress(Sender: TObject;
  var Key: Char);
begin

      if key=#27 then begin

         lstMesesDoAno.Visible := false;

          //Habilitando os botões
          pan_botoes.Enabled := true;
          pan_titulo.Caption:='Controle de Clientes - Visualizando...';

      end;

end;

procedure T_frmClientes.edt_DDDFONEKeyPress(Sender: TObject;
  var Key: Char);
begin

     // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmClientes.edt_DDDFONE2KeyPress(Sender: TObject;
  var Key: Char);
begin

     // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmClientes.edt_DDDFONEEnter(Sender: TObject);
begin

     edt_DDDFONE.SelStart  := 0;
     edt_DDDFONE.SelLength :=  Length(edt_DDDFONE.Text);

end;

procedure T_frmClientes.edt_DDDFONE2Enter(Sender: TObject);
begin

     edt_DDDFONE2.SelStart  := 0;
     edt_DDDFONE2.SelLength :=  Length(edt_DDDFONE2.Text);

end;

procedure T_frmClientes.dbedt13Enter(Sender: TObject);
begin

    btnRetornar.Enabled:= true;

end;

procedure T_frmClientes.edtConsCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if KEY = VK_RETURN then
     begin

          edtConsCli.Clear;
          btnCadastros.Caption := 'Cadastro Inicial';
          btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');
          EstadoInicialDosBotoes;

      end;

end;


procedure T_frmClientes.btnAbrirVendaClick(Sender: TObject);
begin

    if(frenteDeCaixaLiberado)then
    begin

       Application.CreateForm(T_frmEscolhaTipoAcao, _frmEscolhaTipoAcao);
       _frmEscolhaTipoAcao.ShowModal;
       FreeAndNil(_frmEscolhaTipoAcao);

       close;

    end else begin

         abrindoOrcamento:=true; //abrindo orçamento atraves do cadastro de clientes

         Application.CreateForm(T_frmOrcamento,  _frmOrcamento);

         _frmOrcamento.txtNomeCliente.Caption     :=  ' '+sNomeClienteVenda;
         _frmOrcamento.txt_IDCLIENTE.Text         :=  sIdClienteVenda;
         _frmOrcamento.panel_detalhes.Visible     :=  true;
         _frmOrcamento.AbreNovoOrcamento;
         _frmOrcamento.ShowModal;
         FreeAndNil(_frmOrcamento);

         close;


    end;

end;

procedure T_frmClientes.IniciarVenda;
begin

    vendaCliente := true;

    idClienteVenda       := StrToInt(dbedtCLI_ID.Text);
    clienteBalcao        := EClienteBalcao(idClienteVenda);   
    CaixaAberto          := true;

     if CaixaAberto then
     begin

          //SE NAO FOR CLIENTE BALCAO ABRA A FRENTE DE CAIXA
          if not(clienteBalcao) then
          begin

              Application.CreateForm(T_frmCaixa, _frmCaixa);
              _frmCaixa.ShowModal;
              FreeAndNil(_frmCaixa);

          end;

     end;

     self.Close;
     EstadoInicialDosBotoes;

end;

procedure T_frmClientes.grid_clientesCellClick(Column: TColumn);
begin

  if not(TemNivers) then
  begin

    idCliente            := DM_Pesq.cdsPesqCliente.FieldByName('CLI_ID').AsInteger;
    cpf                  := DM_Pesq.cdsPesqCliente.FieldByName('CLI_CPF').AsString;
    cnpj                 := DM_Pesq.cdsPesqCliente.FieldByName('CLI_CNPJ').AsString;
    NomeDoClienteDaVenda := DM_Pesq.cdsPesqCliente.FieldByName('CLI_NOME').AsString;
    sNomeClienteVenda    := ' '+DM_Pesq.cdsPesqCliente.FieldByName('CLI_NOME').AsString;
    sIdClienteVenda      := IntToStr(idCliente);

    //POSSIBILITANDO ALTERAÇÃO NAS PLACAS PELA TELA PRINCIPAL DOS CLIENTES
    DM_Pesq.cdsPesqCliente.Active := true;
    DM_Pesq.cdsPesqCliente.ApplyUpdates(0);

    edtConsCli.SetFocus;
    VerificarSeECliente;

    btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Ok.bmp');
    btnCadastros.Caption := 'Voltar';
    btnAlterar.Enabled   :=true;
    btnInativar.Enabled  :=true;
    btnimprimir.Enabled  :=true;
    btnHistorico.Enabled :=true;

  end;

end;

procedure T_frmClientes.VerificarSeECliente;
begin

    btnAbrirVenda.Enabled := true;

    if idCliente > 1 then
    begin

         ECliente  := true;
         cpf       := DM_Pesq.cdsPesqCliente.FieldByName('CLI_CPF').AsString;
         cnpj      := DM_Pesq.cdsPesqCliente.FieldByName('CLI_CNPJ').AsString;

    end else

        ECliente := false;

end;


procedure T_frmClientes.rdIEClick(Sender: TObject);
begin

    msk_ie.SetFocus;

end;

procedure T_frmClientes.msk_cepChange(Sender: TObject);
begin

    if Length(Trim(msk_cep.Text)) = 9 then  msk_Fone.setfocus;

end;

procedure T_frmClientes.msk_FoneChange(Sender: TObject);
begin

    if Length(Trim(msk_Fone.Text)) = 9 then  msk_Fone2.setfocus;

end;

procedure T_frmClientes.msk_Fone2Change(Sender: TObject);
begin

    if Length(Trim(msk_Fone2.Text)) = 9 then  msk_Fone3.setfocus;

end;

procedure T_frmClientes.msk_Fone3Change(Sender: TObject);
begin

    if Length(Trim(msk_Fone3.Text)) = 9 then  msk_Fone4.setfocus;

end;

procedure T_frmClientes.msk_Fone4Change(Sender: TObject);
begin

    if Length(Trim(msk_Fone4.Text)) = 10 then  msk_DataNascto.setfocus;

end;

procedure T_frmClientes.msk_telChange(Sender: TObject);
begin

    if Length(Trim(msk_tel.Text)) = 9 then  msk_tel2.setfocus;

end;

procedure T_frmClientes.msk_tel2Change(Sender: TObject);
begin

    if Length(Trim(msk_tel2.Text)) = 9 then  msk_tel3.setfocus;

end;

procedure T_frmClientes.msk_tel3Change(Sender: TObject);
begin

    if Length(Trim(msk_tel3.Text)) = 9 then  msk_tel4.setfocus;

end;

procedure T_frmClientes.msk_tel4Change(Sender: TObject);
begin

    if Length(Trim(msk_tel4.Text)) = 10 then  msk_AlteraDataNascto.setfocus;

end;

procedure T_frmClientes.edtConsCliClick(Sender: TObject);
begin

    edtConsCli.Clear;

end;

procedure T_frmClientes.msk_ieChange(Sender: TObject);
begin

   if Length(Trim(msk_ie.Text)) = 15 then  msk_cpf.setfocus;

end;

procedure T_frmClientes.msk_cpfChange(Sender: TObject);
begin

     if Length(Trim(msk_cpf.Text)) = 14 then  msk_cnpj.setfocus;

end;

procedure T_frmClientes.msk_cnpjChange(Sender: TObject);
begin

     if Length(Trim(msk_cnpj.Text)) = 18 then  memoInclusaoCli.setfocus;

end;

procedure T_frmClientes.msk_ie1Change(Sender: TObject);
begin

    if Length(Trim(msk_ie1.Text)) = 15 then  mskAlteraCPF.setfocus;

end;

procedure T_frmClientes.mskAlteraCPFChange(Sender: TObject);
begin

    if Length(Trim(mskAlteraCPF.Text)) = 14 then  mskAlteraCNPJ.setfocus;

end;

procedure T_frmClientes.mskAlteraCNPJChange(Sender: TObject);
begin

     if Length(Trim(mskAlteraCNPJ.Text)) = 18 then  memoAlteCli.setfocus;

end;

procedure T_frmClientes.edt_apelidoEnter(Sender: TObject);
begin

     //digitou um nome abre o botao salvar
     btnConfirmaInclusao.Enabled := true;

end;

procedure T_frmClientes.AtualizaQde;
begin

    qdeRegs               := ListaQdeRegs(DM_Pesq.cdsPesqCliente);
    txtMsg.Caption        := 'Total de clientes cadastrados '+ IntToStr( qdeRegs );
    txtMsg.Color          := clWhite;
    txtMsg.Visible        := true;
    txtMsg.Font.Color     := clBlue;

end;

procedure T_frmClientes.pangrid_visualizacaoEnter(Sender: TObject);
begin
 btnHistorico.Enabled:= false;
end;

procedure T_frmClientes.memoTelaPrinClientesEnter(Sender: TObject);
begin
edtConsCli.SetFocus;
end;

procedure T_frmClientes.memoInclusaoCliEnter(Sender: TObject);
begin
  memoInclusaoCli.SelStart := Perform(EM_LINEINDEX, 0, 0);
end;

procedure T_frmClientes.memoAlteCliEnter(Sender: TObject);
begin
  memoAlteCli.SelStart := Perform(EM_LINEINDEX, 0, 0);
end;

procedure T_frmClientes.EstadoInicialDosBotoes;
begin

    btnCadastros  .Enabled := true;
    btnAlterar    .Enabled := false;
    btnInativar   .Enabled := false;
    btnimprimir   .Enabled := false;
    btnSair       .Enabled := true;
    btnHistorico  .Enabled := false;
    btnAbrirVenda .Enabled := false;
    btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');
    btnCadastros.Caption:='Cadastrar';
    btnSair.Caption :='Sair';
    btnSair.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Sair.bmp');
    edtConsCli.Clear;

end;

procedure T_frmClientes.edtConsCliKeyPress(Sender: TObject; var Key: Char);
begin
      btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Ok.bmp');  
      btnCadastros.Caption:='Voltar';
end;

procedure T_frmClientes.msk_DataNasctoClick(Sender: TObject);
begin
    msk_DataNascto.SelectAll;
end;

procedure T_frmClientes.msk_AlteraDataNasctoClick(Sender: TObject);
begin
   msk_AlteraDataNascto.SelectAll;
end;

end.

