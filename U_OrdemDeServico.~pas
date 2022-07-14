unit U_OrdemDeServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  EditNum, ToolEdit;

type
  T_frmOrdemServico = class(TForm)
    pan_titulo: TPanel;
    pangrid_visualizacao: TPanel;
    pan_botoes: TPanel;
    btnCadastros: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnSair: TSpeedButton;
    grid_OS: TDBGrid;
    btnimprimir: TSpeedButton;
    pangrid_inclusao: TPanel;
    GroupBox1: TGroupBox;
    btnConfirmaInclusao: TSpeedButton;
    grp1: TGroupBox;
    lbl11: TLabel;
    NUM: TLabel;
    lbl14: TLabel;
    lbl16: TLabel;
    lbl1: TLabel;
    lbl7: TLabel;
    dbDATACAD: TDBEdit;
    dbNOMECLIENTE: TDBEdit;
    lbl2: TLabel;
    dbENDERECO: TDBEdit;
    lbl4: TLabel;
    dbCEP: TDBEdit;
    dbCOMPLEMENTO: TDBEdit;
    lbl3: TLabel;
    lbl5: TLabel;
    dbEMAIL: TDBEdit;
    pangrid_alteracao: TPanel;
    grp2: TGroupBox;
    lbl10: TLabel;
    dbALTERACLIENTEOS: TDBEdit;
    dbALTERAEQUIPTOOS: TDBEdit;
    dbALTERAMARCAOS: TDBEdit;
    dbALTERANUMSERIEOS: TDBEdit;
    grp3: TGroupBox;
    btnConfirmaAlteracao: TSpeedButton;
    edtEQUIPAMENTO: TEdit;
    edtNUMSERIE: TEdit;
    edtMARCA: TEdit;
    edtACESSORIOS: TEdit;
    btnSairAlteracao: TSpeedButton;
    btnSairInclusao: TSpeedButton;
    lbl28: TLabel;
    lblFone: TLabel;
    btnCancelarInclusao: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    lblStatusLogoff: TLabel;
    lbl45: TLabel;
    dbDDD: TDBEdit;
    Label9: TLabel;
    dbFONE: TDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    dbCELULAR: TDBEdit;
    dbDDDCEL: TDBEdit;
    GroupBox9: TGroupBox;
    edtNOME: TEdit;
    dbPROBLEMA: TDBMemo;
    Label10: TLabel;
    Label2: TLabel;
    edtMODELO: TEdit;
    menPROBLEMA: TMemo;
    Label3: TLabel;
    dbCLIENTE: TDBLookupComboBox;
    Label4: TLabel;
    dbIDCLIENTE: TDBEdit;
    panel_numos: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbALTERAMODELOOS: TDBEdit;
    dbALTERAACESSORIOOS: TDBEdit;
    dbALTERAPROBLEMAOS: TDBMemo;
    Label13: TLabel;
    dbVALORORCAMENTO: TDBEdit;
    Label14: TLabel;
    dbIDOS: TDBEdit;
    dbALTERAIDOS: TDBEdit;
    dbALTERAVALORORCAMENTO: TDBEdit;
    Label15: TLabel;
    btnPagarOS: TSpeedButton;
    pan_fecharpagaros: TPanel;
    grp12: TGroupBox;
    Grid_PagarOs: TDBGrid;
    pan_mostratodasos: TPanel;
    GroupBox2: TGroupBox;
    gridMostraOS: TDBGrid;
    GroupBox3: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    pnl_Periodo: TPanel;
    lbl41: TLabel;
    lbl42: TLabel;
    btnPesquisar: TSpeedButton;
    btnFechar: TSpeedButton;
    edt_DataInicio: TDateEdit;
    edt_DataFim: TDateEdit;
    btnImprimirListaDeOs: TSpeedButton;
    db_IdCliente: TDBEdit;
    db_IDOS: TDBEdit;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCadastrosClick(Sender: TObject);
    procedure btnConfirmaInclusaoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSairAlteracaoClick(Sender: TObject);
    procedure GravaRegs;
    procedure LimparCampos;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure HabilitarBotoes;
    procedure DesabilitarBotoes;
    procedure btnCancelarInclusaoClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure btnSairInclusaoClick(Sender: TObject);
    procedure dbCLIENTEClick(Sender: TObject);
    procedure menPROBLEMAChange(Sender: TObject);
    procedure MostrarNumProximaOS;
    procedure btnConfirmaAlteracaoClick(Sender: TObject);
    procedure menPROBLEMAEnter(Sender: TObject);
    procedure FiltrarPorClienteTelaInicial;
    procedure edtNOMEChange(Sender: TObject);
    procedure edtNOMEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure GravarAlteracoesOS;
    procedure dbALTERAPROBLEMAOSEnter(Sender: TObject);
    procedure dbALTERAEQUIPTOOSEnter(Sender: TObject);
    procedure dbALTERANUMSERIEOSEnter(Sender: TObject);
    procedure dbALTERAMARCAOSEnter(Sender: TObject);
    procedure dbALTERAMODELOOSEnter(Sender: TObject);
    procedure dbALTERAACESSORIOOSEnter(Sender: TObject);
    procedure btnPagarOSClick(Sender: TObject);
    procedure Grid_PagarOsCellClick(Column: TColumn);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure PesquisarPeriodoDasOS;
    procedure btnFecharClick(Sender: TObject);
    procedure gridMostraOSDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnImprimirListaDeOsClick(Sender: TObject);
    procedure edt_DataInicioClick(Sender: TObject);
    procedure edt_DataInicioButtonClick(Sender: TObject);
    procedure edt_DataInicioChange(Sender: TObject);
    procedure ImprimirOs;
    procedure gridMostraOSCellClick(Column: TColumn);


  private
    { Private declarations }
  public
    { Public declarations }
    nomeCliente : string;
    valorDaOs   : double;
    numOS, numOSImprimir, IDCliente  : integer;

  end;

var
  _frmOrdemServico: T_frmOrdemServico;
  proxNum, proxNumOs : Integer;


implementation

uses U_dmDados, U_Clientes, U_dmPesquisas, U_BiblioSysSalao,  U_dmDadosSegundo,
  U_PagtoOS, DB, U_QRelImprimeListaDeOS, U_QRelImprimeOS;

{$R *.dfm}


procedure T_frmOrdemServico.FormCreate(Sender: TObject);
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

    lblDataDoDia.Caption:=  DateToStr(now);
    lblHoraAtual.Caption:=  timetoStr(time);
    lblStatusLogoff.Caption := IdentificarUsuarioLogado;
    AbrirTabelas;

end;

procedure T_frmOrdemServico.FormShow(Sender: TObject);
begin

    edtNOME.SetFocus;
    edt_DataFim.Date  :=  date;

     {VERIFICANDO SE NAO TEM O.S. PARA PAGAMENTO E AVISANDO O USUARIO PORQUE O GRID ESTA VAZIO, MESMO ASSIM PODERA
       CONSULTAR AS O.S. QUE FORAM FECHADAS}
     with DM_Pesq.Qry_Geral do
     begin

        close;
        sql.Clear;
        sql.Add('SELECT * FROM os WHERE status = '+QuotedStr('A')+'');
        open;

        if IsEmpty then begin

            pan_titulo.Caption := 'No momento não existem O.S. em aberto para pagamento';
            pan_titulo.Font.Color   := clYellow;

        end;

     end;

end;


procedure T_frmOrdemServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  FecharTabelas;
  Release;

end;

procedure T_frmOrdemServico.btnCadastrosClick(Sender: TObject);
begin

     dm_Conexao.cds_DadosClientes.Active     := true;
     dbCLIENTE.KeyValue     := 1;
     grid_OS.Enabled        := True;
     edtEQUIPAMENTO.SetFocus;
     pan_titulo.Caption:= 'Controle de Ordem de Serviços - Incluindo...';
     pangrid_visualizacao.SendToBack;
     pangrid_inclusao.BringToFront;
     DesabilitarBotoes;
     MostrarNumProximaOS;
                                     
end;


procedure T_frmOrdemServico.btnConfirmaInclusaoClick(Sender: TObject);
begin

   GravaRegs;
   LogOperacoes(NomeDoUsuarioLogado, 'cadastro de nova O.S.');
   LimparCampos;
   DesabilitarBotoes;
   btnSairInclusao.Enabled:= true;

end;

procedure T_frmOrdemServico.btnAlterarClick(Sender: TObject);
begin

     if dm_DadosSegundo.cds_OS.RecordCount = 0 then begin

            Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);

      end
      else begin

          dbALTERAEQUIPTOOS.SetFocus;
          pan_titulo.Caption:= 'Controle de Ordem de Serviços - Alterando...';
          pangrid_alteracao.BringToFront;
          dm_DadosSegundo.cds_OS.Edit;
          DesabilitarBotoes;
          btnConfirmaAlteracao.Enabled := true;
          btnSairAlteracao.Enabled     := true;

      end;


end;


procedure T_frmOrdemServico.btnSairAlteracaoClick(Sender: TObject);
begin

    pangrid_visualizacao.BringToFront;
    pan_titulo.Caption:= 'Controle de Ordem de Serviços - Visualizando...';
    HabilitarBotoes;

end;


procedure T_frmOrdemServico.GravaRegs;
begin
    
      With DM_Pesq.qry_Cod do begin

        Close;
        SQL.Clear; 
        SQL.Add('select max(ID_OS) from OS');
        Open;

        if not IsEmpty then begin

           proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger+1;

        end;

      end;
     

      _Sql := 'INSERT INTO os (id_os, cliente_id, operador_id, equipamento, numserie, marca, modelo, '+
              'acessorios, vl_orcamento, problema, data_abertura, status) VALUES (:pIDOS,:pClienteID,:pOPeradorID, '+
              ':pEquipto,:pNumserie,:pMarca,:pModelo,:pAcessorios,:pValor,:pProblema,:pDataAbertura,:pStatus)';


      With DM_Pesq.Qry_Geral do
      begin

         close;
         sql.Clear;
         sql.Add(_Sql);
         Params.ParamByName('pIDOS').AsInteger           := proxNum;
         Params.ParamByName('pClienteID').AsInteger      := strtoint(dbIDCLIENTE.Text);
         Params.ParamByName('pOPeradorID').AsInteger     := IdFuncionarioLogado(lblStatusLogoff.Caption);
         Params.ParamByName('pEquipto').AsString         := edtEQUIPAMENTO.Text;
         Params.ParamByName('pNumserie').AsString        := edtNUMSERIE.Text;
         Params.ParamByName('pMarca').AsString           := edtMARCA.Text;
         Params.ParamByName('pModelo').AsString          := edtMODELO.Text;
         Params.ParamByName('pAcessorios').AsString      := edtACESSORIOS.Text;
         Params.ParamByName('pValor').AsFloat            := 0;
         Params.ParamByName('pProblema').AsString        := UpperCase(menPROBLEMA.Text);
         Params.ParamByName('pStatus').AsString          := 'A';
         Params.ParamByName('pDataAbertura').AsDateTime  := date;
         ExecSQL();

    end;

     Application.MessageBox('Ordem de Serviço cadastrada com sucesso!', 'Cadastrando...', MB_OK);

     texto:= 'Imprimir Ordem de Serviço ?';

      if Application.MessageBox(PChar(texto),'Impressão de Ordem de Serviço',MB_YESNO + MB_ICONQUESTION) = IdYes then
      begin

          ImprimirOs;

      end else begin

          exit;

      end;

      FecharAbrirTabelas;
      exit;
      LimparCampos;    

end;

procedure T_frmOrdemServico.gridMostraOSCellClick(Column: TColumn);
begin 
     
    numOSImprimir :=  DM_Pesq.cdsPesqGeral.Fields[0].Value;

    with Q_RelImprimeOS.cds_RelImprimeOS do
     begin

        Close;
        Params.ParamByName('pIDOS').AsInteger   := numOSImprimir;
        Open;

        with Q_RelImprimeOS do
        begin

          Preview;

        end;
     end;

end;


procedure T_frmOrdemServico.ImprimirOs;
begin

     with Q_RelImprimeOS.cds_RelImprimeOS do
     begin

        Close;
        Params.ParamByName('pIDOS').AsInteger   := proxNum;
        Open;

        with Q_RelImprimeOS do
        begin

          Preview;

        end;
     end;

end;



procedure T_frmOrdemServico.LimparCampos;
var
  i : Integer;
begin

      //Limpando os Edits 
      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TEdit)then
              (Components[i] as TEdit).Clear;
      end;

      btnSairInclusao.Enabled := true;
      menPROBLEMA.Clear;
      panel_numos.Caption := 'Ordem de Serviço Nº ';

end;


procedure T_frmOrdemServico.FormKeyPress(Sender: TObject; var Key: Char);
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



procedure T_frmOrdemServico.HabilitarBotoes;
var
  i : Integer;
begin

       //Habilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= true;
      end;


      btnSairInclusao.Enabled:= True;
      btnConfirmaAlteracao.Enabled:= true;


end;

procedure T_frmOrdemServico.DesabilitarBotoes;
var
  i : Integer;
begin

   //Desabilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= false;
      end;


      btnSairInclusao.Enabled:= True;

end;



procedure T_frmOrdemServico.btnSairClick(Sender: TObject);
begin

   HabilitarBotoes;
   close;

end;


procedure T_frmOrdemServico.btnCancelarInclusaoClick(Sender: TObject);
begin

  dm_DadosSegundo.cds_OS.Cancel;
  pangrid_inclusao.SendToBack;
  btnSairInclusao.Enabled     := true;
  btnConfirmaInclusao.Enabled := False;
  btnCancelarInclusao.Enabled := false;
  dbCLIENTE.SetFocus;
  LimparCampos;

end;

procedure T_frmOrdemServico.AbrirTabelas;
begin

    dm_DadosSegundo.cds_OS.Active           := True;
    dm_DadosSegundo.cds_Empresa.Active      := true;
    dm_Conexao.cds_DadosFuncionarios.Active := true;
   

end;

procedure T_frmOrdemServico.FecharTabelas;
begin

     dm_DadosSegundo.cds_OS.Active           := False;
     dm_DadosSegundo.cds_Empresa.Active      := False;
     dm_Conexao.cds_DadosFuncionarios.Active := False;


end;

procedure T_frmOrdemServico.FecharAbrirTabelas;
begin

     dm_DadosSegundo.cds_OS.Active:= False;
     dm_DadosSegundo.cds_OS.Active:= True;

end;



procedure T_frmOrdemServico.btnSairInclusaoClick(Sender: TObject);
begin

    LimparCampos;
    pangrid_visualizacao.BringToFront;
    pan_titulo.Caption:= 'Controle de Ordem de Serviços - Visualizando...';
    HabilitarBotoes;

end;

procedure T_frmOrdemServico.dbCLIENTEClick(Sender: TObject);
begin
      edtEQUIPAMENTO.SetFocus;
end;

procedure T_frmOrdemServico.menPROBLEMAChange(Sender: TObject);
begin
    btnConfirmaInclusao.Enabled := true;
    btnCancelarInclusao.Enabled := true;
end;

procedure T_frmOrdemServico.MostrarNumProximaOS;
begin

    proxNumOs := 0;

    With DM_Pesq.qry_Cod do begin

        Close;
        SQL.Clear;
        SQL.Add('select max(ID_OS) from OS');
        Open;

        if not IsEmpty then begin

           proxNumOs           := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;
           panel_numos.Caption := panel_numos.Caption + IntToStr(proxNumOs);

        end;

    end;

end;

procedure T_frmOrdemServico.btnConfirmaAlteracaoClick(Sender: TObject);
begin

    GravarAlteracoesOS;
    LogOperacoes(NomeDoUsuarioLogado, 'alteração em O.S. cadastrada');

end;

procedure T_frmOrdemServico.GravarAlteracoesOS;
begin

    _Sql := 'UPDATE os SET equipamento=:pEquipto, numserie=:pNumserie, marca=:pMarca, '+
            'modelo=:pModelo, acessorios=:pAcessorios, vl_orcamento=:pValor, '+
            'problema=:pProblema WHERE id_os = :pIDOS';

           With DM_Pesq.Qry_Geral do begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             Params.ParamByName('pIDOS').AsInteger           := StrToInt(dbIDOS.Text);
             Params.ParamByName('pEquipto').AsString         := dbALTERAEQUIPTOOS.Text;
             Params.ParamByName('pNumserie').AsString        := dbALTERANUMSERIEOS.Text;
             Params.ParamByName('pMarca').AsString           := dbALTERAMARCAOS.Text;
             Params.ParamByName('pModelo').AsString          := dbALTERAMODELOOS.Text;
             Params.ParamByName('pAcessorios').AsString      := dbALTERAACESSORIOOS.Text;
             Params.ParamByName('pValor').AsFloat            := StrToFloat(dbALTERAVALORORCAMENTO.Text);
             Params.ParamByName('pProblema').AsString        := UpperCase(dbALTERAPROBLEMAOS.Text);
             ExecSQL();

          end;

          Application.MessageBox('As alterações foram gravadas com sucesso!', 'Alterando...', MB_OK);
          FecharAbrirTabelas;
          HabilitarBotoes;
          pangrid_alteracao.SendToBack;

end;

procedure T_frmOrdemServico.menPROBLEMAEnter(Sender: TObject);
begin
     menPROBLEMA.Clear;
end;

procedure T_frmOrdemServico.FiltrarPorClienteTelaInicial;
var
  nome : string;
begin

       nome := edtNOME.Text;

      _Sql  := 'SELECT o.*, c.* FROM os o, clientes c WHERE c.cli_id = o.cliente_id AND o.status = '+quotedstr('A')+' '+
               'AND c.cli_nome LIKE (''%'+nome+'%'') ORDER BY c.cli_nome';

      with dm_DadosSegundo.cds_OS do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

end;

procedure T_frmOrdemServico.edtNOMEChange(Sender: TObject);
begin
    FiltrarPorClienteTelaInicial;
end;

procedure T_frmOrdemServico.edtNOMEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

       if KEY = VK_RETURN then
        begin

          edtNOME.Clear;

      end;


end;



procedure T_frmOrdemServico.dbALTERAPROBLEMAOSEnter(Sender: TObject);
begin

     dbALTERAPROBLEMAOS.SelStart:=0;
     dbALTERAPROBLEMAOS.SelLength:= Length(dbALTERAPROBLEMAOS.Text);  

end;

procedure T_frmOrdemServico.dbALTERAEQUIPTOOSEnter(Sender: TObject);
begin

     dbALTERAEQUIPTOOS.SelStart:=0;
     dbALTERAEQUIPTOOS.SelLength:= Length(dbALTERAEQUIPTOOS.Text);

end;

procedure T_frmOrdemServico.dbALTERANUMSERIEOSEnter(Sender: TObject);
begin

     dbALTERANUMSERIEOS.SelStart:=0;
     dbALTERANUMSERIEOS.SelLength:= Length(dbALTERANUMSERIEOS.Text);

end;

procedure T_frmOrdemServico.dbALTERAMARCAOSEnter(Sender: TObject);
begin

    dbALTERAMARCAOS.SelStart:=0;
    dbALTERAMARCAOS.SelLength:= Length(dbALTERAMARCAOS.Text);

end;

procedure T_frmOrdemServico.dbALTERAMODELOOSEnter(Sender: TObject);
begin

    dbALTERAMODELOOS.SelStart:=0;
    dbALTERAMODELOOS.SelLength:= Length(dbALTERAMODELOOS.Text);

end;

procedure T_frmOrdemServico.dbALTERAACESSORIOOSEnter(Sender: TObject);
begin

    dbALTERAACESSORIOOS.SelStart:=0;
    dbALTERAACESSORIOOS.SelLength:= Length(dbALTERAACESSORIOOS.Text);

end;

procedure T_frmOrdemServico.btnPagarOSClick(Sender: TObject);
begin

     if dm_DadosSegundo.cds_OS.RecordCount = 0 then begin

            Application.MessageBox('No momento não há registros a serem exibidos!', 'Tabela vazia', MB_OK);

      end
      else begin

          pan_titulo.Caption:= 'Controle de Ordem de Serviços - Pagando...';
          LogOperacoes(NomeDoUsuarioLogado, 'acesso a pagamento de O.S.');
          pan_fecharpagaros.BringToFront;
          DesabilitarBotoes;

      end;

end;

procedure T_frmOrdemServico.Grid_PagarOsCellClick(Column: TColumn);
begin

     nomeCliente :=  dm_DadosSegundo.cds_OSCLIENTE.Value;
     valorDaOs   :=  dm_DadosSegundo.cds_OS.Fields[7].Value;
     numOS       :=  dm_DadosSegundo.cds_OS.Fields[0].Value;
     IDCliente   :=  dm_DadosSegundo.cds_OS.Fields[1].Value;

     HabilitarBotoes;
     pangrid_visualizacao.BringToFront;

     Application.CreateForm(T_frmPagarOS,  _frmPagarOS);
     _frmPagarOS.ShowModal;
     FreeAndNil(_frmPagarOS);


end;

procedure T_frmOrdemServico.btnimprimirClick(Sender: TObject);
begin

    pan_mostratodasos.BringToFront;
    pan_botoes.Visible     := false;
    pan_titulo.Caption     := 'Defina o período de pesquisa';
    LogOperacoes(NomeDoUsuarioLogado, 'acesso a impressão de O.S.');
    DesabilitarBotoes;

end;

procedure T_frmOrdemServico.PesquisarPeriodoDasOS;
begin

             DataInicio     := StrToDate(edt_DataInicio.text);
             DataFim        := StrToDate(edt_DataFim.text);

      
             _Sql :='SELECT o.*, c.cli_id, c.cli_nome as cliente FROM os o, clientes c WHERE c.cli_id = o.cliente_id AND o.data_abertura '+
                    'BETWEEN :datainicial AND :datafinal ORDER BY c.cli_nome';

             with DM_Pesq.cdsPesqGeral do
             begin

                close;
                CommandText:= (_Sql);
                Params.ParamByName('datainicial').AsDateTime := DataInicio;
                Params.ParamByName('datafinal').AsDateTime   := DataFim;
                open;

                if not IsEmpty then begin

                   //FORMATANDO O VALOR DE ORÇAMENTO DO CDS VIA CODIGO
                   TFloatField(DM_Pesq.cdsPesqGeral.FieldByName('vl_orcamento')).DisplayFormat := '#,##0.00';
                   gridMostraOS.DataSource := DM_Pesq.dsPesqGeral;
                   gridMostraOS.Enabled := true;
                   gridMostraOS.Refresh;
                   btnImprimirListaDeOs.Enabled := true;
                   pan_titulo.Caption           := 'Escolha a O.S. a ser impressa';

                end else begin

                   Application.MessageBox('Não foram encontrados registros no período selecionado!', 'Nada encontrado!', MB_OK);
                   edt_datainicio.text          := '  /  /    ';
                   edt_DataInicio.SetFocus;
                   btnImprimirListaDeOs.Enabled := false;
                   btnSair.Caption := 'Limpar';
                   exit;

                end;

            end;
end;

procedure T_frmOrdemServico.btnPesquisarClick(Sender: TObject);
begin

       if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
        begin
                  Application.MessageBox('É necessário uma data inicial e uma data final para efetuar a pesquisa !', 'Período Inválido!', MB_OK);
                  edt_datainicio.text          := '  /  /    ';
                  edt_DataFim.Date             := date;
                  edt_DataInicio.SetFocus;
        end
        else if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                 PesquisarPeriodoDasOS;

                 btnPesquisar.Enabled              := false;
                 btnFechar.Caption                 := 'Limpar';

        end else begin

          Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
          edt_DataInicio.SetFocus;

       end;



end;

procedure T_frmOrdemServico.btnFecharClick(Sender: TObject);
begin

  if btnFechar.Caption = 'Fechar' then
  begin

    pangrid_visualizacao.BringToFront;
    pan_botoes.Visible     := true;
    edt_datainicio.text    := '  /  /    ';
    HabilitarBotoes;

  end else begin

     edt_DataInicio.Clear;
     edt_DataInicio.SetFocus;
     DM_Pesq.cdsPesqGeral.Close;
     btnFechar.Caption            := 'Fechar';
     btnPesquisar.Enabled         := false;
     btnImprimirListaDeOs.Enabled := false;
     gridMostraOS.Enabled         := false;
     pan_titulo.Caption           := 'Defina o período de pesquisa';
  
  end;

end;

procedure T_frmOrdemServico.gridMostraOSDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

      with gridMostraOS do
      begin

        if DataSource.DataSet.FieldByName('status').AsString = 'A' then
        begin

            if (gdSelected in State) then

              Canvas.Brush.Color := clSkyBlue   // cor do fundo da linha que estiver selecionada

            else
            begin

              // configuração das linhas que atendem o primeiro if, ou seja com STATUS A
              Canvas.Font.Style  := [fsBold];
              Canvas.Font.Color  := clBlue;

              // cor do fundo de todas as linhas
              Canvas.Brush.Color := clInfoBk;

            end
            end else begin

              // configuração das linhas que não atendem o primeiro if, ou seja com STATUS F ou C
              Canvas.Font.Color  := clRed;
              Canvas.Brush.Color := clInfoBk;

            end;

            DefaultDrawColumnCell(Rect,DataCol,Column,State);

      end;


end;

procedure T_frmOrdemServico.btnImprimirListaDeOsClick(Sender: TObject);
var
  DataInicio, DataFim : TDate;
begin

     DataInicio     := StrToDate(edt_DataInicio.text);
     DataFim        := StrToDate(edt_DataFim.text);

     with Q_RelImprimeListaDeOS.cds_RelImprimeListaDeOS do
     begin

        Params.ParamByName('datainicial').AsDate := DataInicio;
        Params.ParamByName('datafinal').AsDate   := DataFim;
        Open;

     end;

        Q_RelImprimeListaDeOS.Preview;
        LogOperacoes(NomeDoUsuarioLogado, 'acesso a impressão de listagem de O.S.');

end;

procedure T_frmOrdemServico.edt_DataInicioClick(Sender: TObject);
begin

    btnPesquisar.Enabled         := true;
    btnFechar.Enabled            := true;

end;

procedure T_frmOrdemServico.edt_DataInicioButtonClick(Sender: TObject);
begin

    btnPesquisar.Enabled         := true;
    btnFechar.Enabled            := true;

end;

procedure T_frmOrdemServico.edt_DataInicioChange(Sender: TObject);
begin

    btnPesquisar.Enabled         := true;
    btnFechar.Enabled            := true;

end;

end.



