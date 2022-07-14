unit U_ConsultasDaAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ComCtrls, RxCalc, Calendar, RXClock, ToolEdit, RXDBCtrl, DB, DBClient,
  Provider, FMTBcd, CurrEdit, RXSpin, DateUtils, Menus, ImgList;

type
  T_frmAgenda = class(TForm)
    pan_titulo: TPanel;
    pangrid_visualizacao: TPanel;
    pan_botoes: TPanel;
    btnSair: TSpeedButton;
    btnimprimir: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    paginas: TPageControl;
    tsVisualizacao: TTabSheet;
    grp4: TGroupBox;
    Grid_VisualizaAgenda: TDBGrid;
    btnExcluirAgendamento: TSpeedButton;
    btnSairVisualizacaoAgendamento: TSpeedButton;
    dbedtID_HISTORICOAGENDAMENTO: TDBEdit;
    tsPorPeriodo: TTabSheet;
    grp1: TGroupBox;
    btn2: TSpeedButton;
    Grid_PesquisaPeriodoAgendamento: TDBGrid;
    grp5: TGroupBox;
    btnConsultarPeriodoAgendamento: TSpeedButton;
    lbl17: TLabel;
    lbl30: TLabel;
    btnRetornarConsPeriodoAgendamento: TSpeedButton;
    btnLimparPesquisaPeriodoAgendamento: TSpeedButton;
    edt_DataInicio: TDateEdit;
    edt_DataFim: TDateEdit;
    tsAtendidos: TTabSheet;
    grp2: TGroupBox;
    btn1: TSpeedButton;
    Grid_Pesquisa_Atendidos: TDBGrid;
    grp6: TGroupBox;
    btn_Consulta_Periodo_Atendidos: TSpeedButton;
    lbl12: TLabel;
    lbl13: TLabel;
    btn_Retorna_Periodo_Atendidos: TSpeedButton;
    btn_Limpa_Periodo_Atendidos: TSpeedButton;
    edt_DataInicio_Atendidos: TDateEdit;
    edt_DataFim_Atendidos: TDateEdit;
    db_status_agendamento_atendido: TEdit;
    tsAbertos: TTabSheet;
    grp7: TGroupBox;
    btn3: TSpeedButton;
    Grid_Pesquisa_EmAbertos: TDBGrid;
    grp8: TGroupBox;
    btn_Consulta_Periodo_Abertos: TSpeedButton;
    lbl14: TLabel;
    lbl15: TLabel;
    btn_Retorna_Periodo_Abertos: TSpeedButton;
    btn_Limpa_Periodo_Abertos: TSpeedButton;
    edt_DataInicio_Abertos: TDateEdit;
    edt_DataFim_Abertos: TDateEdit;
    db_Status_Agendamento_Visualizando: TEdit;
    pmAlteraExcluiServicosIncluidosParaAgendamento: TPopupMenu;
    Excluir1: TMenuItem;
    AlterarQuantidade1: TMenuItem;
    dbedtSERV_NOME: TDBEdit;
    dbedtCliente: TDBEdit;
    ListaDeImagens: TImageList;
    tsFechamento: TTabSheet;
    grp3: TGroupBox;
    Grid_Fechamento: TDBGrid;
    grpGrupoDosBotoesRemarcacao: TGroupBox;
    btn_Retorna_Fechamento: TSpeedButton;
    btn_Cancelar_Agendamento: TSpeedButton;
    btn_Fechar_Agendamento: TSpeedButton;
    btn_Remarcar_Agendamento: TSpeedButton;
    db_CodHistoricoFechamento: TDBEdit;
    db_NomeServicoFechamento: TDBEdit;
    db_NomeClienteFechamento: TDBEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    pnl_Remarcacao: TPanel;
    grp10: TGroupBox;
    btn_CancelarRemarcacao: TSpeedButton;
    btn_OkRemarcado: TSpeedButton;
    grp11: TGroupBox;
    Calendario_RemarcarDia: TDateTimePicker;
    edt_DiaRemarcado: TEdit;
    lst_RemarcarHora: TListBox;
    edt_HoraRemarcada: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    grp9: TGroupBox;
    db_DataAnterior: TDBEdit;
    db_HoraAnterior: TDBEdit;
    db_Cliente: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure HabilitarBotoes;
    procedure DesabilitarBotoes;
    procedure Editar;
    procedure Leitura;
    procedure btnSairClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure Abrir_FecharTabelas;
    procedure LocalizarServicoParaAgendamento;
    procedure SalvarControleDeAgendamento;
    procedure FormShow(Sender: TObject);
    procedure btnSairDeSalvarAgendamentoClick(Sender: TObject);
    procedure btnSairDeGravarAgendamentoClick(Sender: TObject);
    procedure btnNovoAgendamentoClick(Sender: TObject);
    procedure btnCancelarSalvamentoDoAgendamentoClick(Sender: TObject);
    procedure btnSalvarAgendamentoClick(Sender: TObject);
    procedure edt_DiaAgendado1Enter(Sender: TObject);
    procedure edt_HoraAgendadaEnter(Sender: TObject);
    procedure dbFUNC_NOMEClick(Sender: TObject);
    procedure calendarioExit(Sender: TObject);
    procedure lst_HorariosClick(Sender: TObject);
    procedure calendarioChange(Sender: TObject);
    procedure edt_DiaAgendadoEnter(Sender: TObject);
    procedure btnCadastrosClick(Sender: TObject);
    procedure Grid_ServicosCellClick(Column: TColumn);
    procedure cmb_PromocaoClick(Sender: TObject);
    procedure Grid_PromocoesCellClick(Column: TColumn);
    procedure edt_PesquisaChange(Sender: TObject);
    procedure MostrarTodasPromocoes;
    procedure InserirServico;
    procedure LimparTabelaAbreAgendamentos;
    procedure edt_PesquisaExit(Sender: TObject);
    procedure edt_QuantidadeDeServicosKeyPress(Sender: TObject;
      var Key: Char);
    procedure edt_QuantidadeDeServicosKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edt_PesquisaEnter(Sender: TObject);
    procedure btnGravarAgendamentoClick(Sender: TObject);
    procedure btnCancelarGravacaoDoAgendamentoClick(Sender: TObject);
    procedure Grid_PromocoesExit(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure AlterarQuantidade1Click(Sender: TObject);
    procedure Grid_VisualizaAgendaCellClick(Column: TColumn);
    procedure btnExcluirAgendamentoClick(Sender: TObject);
    procedure btnSairVisualizacaoAgendamentoClick(Sender: TObject);
    procedure Grid_VisualizaAgendaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Grid_PesquisaPeriodoAgendamentoDrawColumnCell(
      Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure Grid_Pesquisa_AtendidosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Grid_Pesquisa_EmAbertosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure edt_DataInicioChange(Sender: TObject);
    procedure PesquisarPeriodoDeAgendamentos;
    procedure PesquisarPeriodoDeAgendamentosAtendidos;
    procedure PesquisarPeriodoDeAgendamentosEmAbertos;
    procedure btnConsultarPeriodoAgendamentoClick(Sender: TObject);
    procedure btnLimparPesquisaPeriodoAgendamentoClick(Sender: TObject);
    procedure LimparPesquisaPorPeriodo;
    procedure LimparPesquisaAtendidos;
    procedure LimparPesquisaAbertos;
    procedure edt_DataFimChange(Sender: TObject);
    procedure btnRetornarConsPeriodoAgendamentoClick(Sender: TObject);
    procedure edt_DataInicio_AtendidosChange(Sender: TObject);
    procedure edt_DataFim_AtendidosChange(Sender: TObject);
    procedure btn_Consulta_Periodo_AtendidosClick(Sender: TObject);
    procedure btn_Limpa_Periodo_AtendidosClick(Sender: TObject);
    procedure btn_Retorna_Periodo_AtendidosClick(Sender: TObject);
    procedure edt_DataInicio_AbertosChange(Sender: TObject);
    procedure edt_DataFim_AbertosChange(Sender: TObject);
    procedure btn_Consulta_Periodo_AbertosClick(Sender: TObject);
    procedure btn_Limpa_Periodo_AbertosClick(Sender: TObject);
    procedure btn_Retorna_Periodo_AbertosClick(Sender: TObject);
    procedure btn_Retorna_FechamentoClick(Sender: TObject);
    procedure btn_Fechar_AgendamentoClick(Sender: TObject);
    procedure btn_Cancelar_AgendamentoClick(Sender: TObject);
    procedure btn_Remarcar_AgendamentoClick(Sender: TObject);
    procedure lst_RemarcarHoraClick(Sender: TObject);
    procedure btnCancelarRemarcacaoClick(Sender: TObject);
    procedure edt_HoraRemarcadaEnter(Sender: TObject);
    procedure Calendario_RemarcarDiaChange(Sender: TObject);
    procedure btn_OkRemarcadoClick(Sender: TObject);
    procedure btn_CancelarRemarcacaoClick(Sender: TObject);
    procedure Calendario_RemarcarDiaExit(Sender: TObject);
    procedure edt_DiaRemarcadoClick(Sender: TObject);
    procedure Grid_FechamentoCellClick(Column: TColumn);
    procedure edt_DiaAgendadoClick(Sender: TObject);
    procedure edt_ValorDescontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rb_PromocaoClick(Sender: TObject);
    procedure rb_DescontoClick(Sender: TObject);
    procedure dbCLI_NOMEEnter(Sender: TObject);
    procedure dbFUNC_NOMEEnter(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure tsPorPeriodoShow(Sender: TObject);
    procedure tsVisualizacaoShow(Sender: TObject);
    procedure tsAtendidosShow(Sender: TObject);
    procedure tsAbertosShow(Sender: TObject);
    procedure tsFechamentoShow(Sender: TObject);
    procedure tsAgendamentoShow(Sender: TObject);


    
  private
    { Private declarations }
  public
    { Public declarations }


  end;

var
  _frmAgenda: T_frmAgenda;
  proxNum, NumAgendamento  : Integer;
  permitido : Boolean;
  PrecoDoServico, PrecoDesconto, ValorLiquido : Double;
  DiaRemarcado, HoraRemarcada: string;

implementation

uses U_dmDados, U_Clientes, U_dmDadosSegundo, U_BiblioSysSalao,
  U_Fornecedores, U_dmPesquisas, U_QRelAgendaPorPeriodo,
  U_QRelAgendaAbertosPorPeriodo, U_QRelAgendaAtendidosPorPeriodo;

{$R *.dfm}


procedure T_frmAgenda.FormCreate(Sender: TObject);
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

    lblDataDoDia.Caption:= DateToStr(now);
    lblHoraAtual.Caption:= timetoStr(time);
    AbrirTabelas;

    DesabilitarBotoes;

end;


procedure T_frmAgenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    FecharTabelas;
    Release;

end;


procedure T_frmAgenda.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmAgenda.HabilitarBotoes;
var
  i : Integer;
begin

       //Habilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= true;
      end;


end;


procedure T_frmAgenda.DesabilitarBotoes;
var
  i : Integer;
begin

      //Desabilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= false;
      end;


end;


procedure T_frmAgenda.btnSairClick(Sender: TObject);
begin

      FecharTabelas;
      close;
      HabilitarBotoes;

end;


procedure T_frmAgenda.AbrirTabelas;
begin

      dm_Conexao.cds_DadosClientes.Active              := True;
      dm_Conexao.cds_Servicos.Active                   := True;
      dm_Conexao.cds_DadosFuncionarios.Active          := True;
      dm_Conexao.cds_Promocoes.Active                  := True;
      dm_Conexao.cds_FormaPagtos.Active                := True;
      dm_DadosSegundo.cds_AbreAgendamento.Active       := True;
      dm_DadosSegundo.cds_ControleAgendamento.Active   := True;
      dm_DadosSegundo.cds_HistoricoAgendamento.Active  := True;
      DM_Pesq.cdsPesqServicos.Active                   := True;
      DM_Pesq.cdsPesqPromocoes.Active                  := True;

end;


procedure T_frmAgenda.FecharTabelas;
begin

      dm_Conexao.cds_DadosClientes.Active              := False;
      dm_Conexao.cds_Servicos.Active                   := False;
      dm_Conexao.cds_DadosFuncionarios.Active          := False;
      dm_Conexao.cds_Promocoes.Active                  := False;
      dm_Conexao.cds_FormaPagtos.Active                := False;
      dm_DadosSegundo.cds_AbreAgendamento.Active       := False;
      dm_DadosSegundo.cds_ControleAgendamento.Active   := False;
      dm_DadosSegundo.cds_HistoricoAgendamento.Active  := False;
      DM_Pesq.cdsPesqServicos.Active                   := False;
      DM_Pesq.cdsPesqPromocoes.Active                  := False;

end;


procedure T_frmAgenda.Abrir_FecharTabelas;
begin

     dm_Conexao.cds_DadosClientes.Active               := False;
     dm_Conexao.cds_DadosClientes.Active               := True;

     dm_DadosSegundo.cds_AbreAgendamento.Active        := False;
     dm_DadosSegundo.cds_AbreAgendamento.Active        := True;

     dm_DadosSegundo.cds_HistoricoAgendamento.Active   := False;
     dm_DadosSegundo.cds_HistoricoAgendamento.Active   := True;

     dm_DadosSegundo.cds_ControleAgendamento.Active    := False;
     dm_DadosSegundo.cds_ControleAgendamento.Active    := True;

end;


procedure T_frmAgenda.FormShow(Sender: TObject);
begin

    Abrir_FecharTabelas;

end;


procedure T_frmAgenda.Excluir1Click(Sender: TObject);
begin

    dm_DadosSegundo.cds_AbreAgendamento.Delete;
    LimparTabelaAbreAgendamentos;

end;

procedure T_frmAgenda.AlterarQuantidade1Click(Sender: TObject);
begin

    //ALTERANDO A QUANTIDADE QUANDO FOR O MESMO PRODUTO
    with dm_DadosSegundo.cds_AbreAgendamento do
    begin

         Edit;
         FieldByName('quantidade').AsInteger := StrToInt(edt_QuantidadeDeServicos.Text);
         Post;

    end;

    //FORMATANDO O TOTAL GERAL
    db_TotalGeral.Text:= FormatFloat('#,###,###,##0.00',StrToFloat(db_TotalGeral.Text));

    LimparTabelaAbreAgendamentos;


end;

procedure T_frmAgenda.Grid_VisualizaAgendaCellClick(Column: TColumn);
begin

     btnExcluirAgendamento.Enabled          := True;
     btnSairVisualizacaoAgendamento.Enabled := True;

end;

procedure T_frmAgenda.btnExcluirAgendamentoClick(Sender: TObject);
var
  texto : string;
  cod   : Integer;
begin

      texto:= 'Confirma a Exclusão do Agendamento '+dbedtSERV_NOME.Text+' do Cliente '+dbedtCliente.Text+ '?';
      cod := StrToInt(dbedtID_HISTORICOAGENDAMENTO.Text);


      if Application.MessageBox(PChar(texto),'Exclusão de Agendamento',MB_YESNO + MB_ICONQUESTION) = IdYes then
      begin
          _Sql:= 'delete from historico_agendamento where id_historicoagendamento = :pCodigo';


          with DM_Pesq.Qry_Geral do begin

            Close;
            SQL.Clear;
            SQL.Add(_Sql);
            ParamByName('pCodigo').AsInteger:= cod;
            ExecSQL();

          end;


          dm_DadosSegundo.cds_HistoricoAgendamento.ApplyUpdates(0);
          ShowMessage('O Agendamento foi excluído com Sucesso!');
          Abrir_FecharTabelas;
          
      end;

end;


procedure T_frmAgenda.btnSairVisualizacaoAgendamentoClick(Sender: TObject);
begin

    pan_titulo.Caption:='Controle da Agenda - Cadastro';
    HabilitarBotoes;
    pangrid_visualizacao.SendToBack;

    btnExcluirAgendamento.Enabled          := False;
    btnSairVisualizacaoAgendamento.Enabled := False;
    paginas.ActivePageIndex:=0;
    paginas.Enabled := False;

end;


procedure T_frmAgenda.Grid_VisualizaAgendaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var i : Integer;
begin

         for i:=0 to Grid_VisualizaAgenda.Columns.count-1 do

          If DM_dadosSegundo.cds_historicoagendamento.FieldByName('CodigoMovimento').AsString = 'AB' then

              Grid_VisualizaAgenda.Canvas.Font.Color:= clRed

          else If DM_dadosSegundo.cds_historicoagendamento.FieldByName('CodigoMovimento').AsString = 'FC' then

              Grid_VisualizaAgenda.Canvas.Font.Color := clBlue;

              Grid_VisualizaAgenda.Canvas.FillRect(Rect);
              Grid_VisualizaAgenda.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;


procedure T_frmAgenda.Grid_PesquisaPeriodoAgendamentoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  i : Integer;
begin

      for i:=0 to Grid_PesquisaPeriodoAgendamento.Columns.count-1 do

          If DM_dadosSegundo.cds_historicoagendamento.FieldByName('CodigoMovimento').AsString = 'AB' then

              Grid_PesquisaPeriodoAgendamento.Canvas.Font.Color:= clRed

          else If DM_dadosSegundo.cds_historicoagendamento.FieldByName('CodigoMovimento').AsString = 'FC' then

              Grid_PesquisaPeriodoAgendamento.Canvas.Font.Color := clBlue;

              Grid_PesquisaPeriodoAgendamento.Canvas.FillRect(Rect);
              Grid_PesquisaPeriodoAgendamento.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure T_frmAgenda.Grid_Pesquisa_AtendidosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  i : Integer;
begin

      for i:=0 to Grid_Pesquisa_Atendidos.Columns.count-1 do

          If DM_dadosSegundo.cds_historicoagendamento.FieldByName('CodigoMovimento').AsString = 'AB' then

              Grid_Pesquisa_Atendidos.Canvas.Font.Color:= clRed

          else If DM_dadosSegundo.cds_historicoagendamento.FieldByName('CodigoMovimento').AsString = 'FC' then

              Grid_Pesquisa_Atendidos.Canvas.Font.Color := clBlue;

              Grid_Pesquisa_Atendidos.Canvas.FillRect(Rect);
              Grid_Pesquisa_Atendidos.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure T_frmAgenda.Grid_Pesquisa_EmAbertosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  i : Integer;
begin

      for i:=0 to Grid_Pesquisa_EmAbertos.Columns.count-1 do

          If DM_dadosSegundo.cds_historicoagendamento.FieldByName('CodigoMovimento').AsString = 'AB' then

              Grid_Pesquisa_EmAbertos.Canvas.Font.Color:= clRed

          else If DM_dadosSegundo.cds_historicoagendamento.FieldByName('CodigoMovimento').AsString = 'FC' then

              Grid_Pesquisa_EmAbertos.Canvas.Font.Color := clBlue;

              Grid_Pesquisa_EmAbertos.Canvas.FillRect(Rect);
              Grid_Pesquisa_EmAbertos.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure T_frmAgenda.edt_DataInicioChange(Sender: TObject);
begin
         //HABILITA O BOTAO PARA CONSULTAR
         btnConsultarPeriodoAgendamento.Enabled      := True;
         btnLimparPesquisaPeriodoAgendamento.Enabled := False;
         btnRetornarConsPeriodoAgendamento.Enabled   := True;

end;

procedure T_frmAgenda.PesquisarPeriodoDeAgendamentos;
var
  DataInicio, DataFim : TDate;
begin

         DataInicio  := StrToDate(edt_DataInicio.Text);
         DataFim     := StrToDate(edt_DataFim.Text);

         // PESQUISA POR PERIODO ESCOLHIDO PELO CAMPO DATA AGENDADA DA ABA POR PERIODO
         _Sql := 'select controle_agendamento.num_agendamento,historico_agendamento.id_historicoagendamento, historico_agendamento.data_agendada, '+
        'historico_agendamento.hora_agendada, historico_agendamento.valor_unitario, historico_agendamento.valor_total, '+
        'historico_agendamento.codigomovimento, historico_agendamento.datafechamento, clientes.cli_nome, '+
        'funcionarios.func_nome, servicos.serv_nome, historico_agendamento.id_cliente, historico_agendamento.id_servico, '+
        'historico_agendamento.id_funcionario, historico_agendamento.id_formapagto, historico_agendamento.id_agendamento, '+
        'historico_agendamento.quantidade, historico_agendamento.datacad, historico_agendamento.mesano FROM '+
        'historico_agendamento inner join clientes on (historico_agendamento.id_cliente = clientes.cli_id) '+
        'inner join controle_agendamento on (historico_agendamento.id_agendamento = controle_agendamento.num_agendamento) '+
        'inner join servicos on (historico_agendamento.id_servico = servicos.serv_id) inner join funcionarios '+
        'on (historico_agendamento.id_funcionario = funcionarios.func_id) WHERE historico_agendamento.data_agendada '+
        'BETWEEN :Pdataini AND :Pdatafim ORDER BY controle_agendamento.num_agendamento';


        with dm_DadosSegundo.cds_HistoricoAgendamento do
        begin

          Close;
          CommandText:= (_Sql);
          Params.ParamByName('Pdataini').AsDate  := DataInicio;
          Params.ParamByName('Pdatafim').AsDate  := DataFim;
          Open;

        end;

        //FORMATANDO O VALOR DO CAMPO valor_unitario COMO CURRENCY
        TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_unitario')).DisplayFormat:= '###,##0.00';
        TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_total')).DisplayFormat:= '###,##0.00';


end;


procedure T_frmAgenda.btnConsultarPeriodoAgendamentoClick(Sender: TObject);
begin

     //AO CLICAR NO BOTAO FAZ A PESQUISA POR PERIODO
     PesquisarPeriodoDeAgendamentos;


     btnLimparPesquisaPeriodoAgendamento.Enabled := True;
     btnRetornarConsPeriodoAgendamento.Enabled   := True;
     btnConsultarPeriodoAgendamento.Enabled      := False;
     edt_DataInicio.Enabled                      := False;
     edt_DataFim.Enabled                         := False;
     btnimprimir.Enabled                         := True;
     btnimprimir.Tag                             := 100;


end;

procedure T_frmAgenda.btnLimparPesquisaPeriodoAgendamentoClick(
  Sender: TObject);
begin

   LimparPesquisaPorPeriodo;
   edt_DataInicio.Enabled     := True;
   edt_DataFim.Enabled        := True;
   edt_DataInicio.SetFocus;

end;

procedure T_frmAgenda.LimparPesquisaPorPeriodo;
begin

        _Sql := 'select controle_agendamento.num_agendamento,historico_agendamento.id_historicoagendamento, historico_agendamento.data_agendada, '+
        'historico_agendamento.hora_agendada, historico_agendamento.valor_unitario, historico_agendamento.valor_total, '+
        'historico_agendamento.codigomovimento, historico_agendamento.datafechamento, clientes.cli_nome, '+
        'funcionarios.func_nome, servicos.serv_nome, historico_agendamento.id_cliente, historico_agendamento.id_servico, '+
        'historico_agendamento.id_funcionario, historico_agendamento.id_formapagto, historico_agendamento.id_agendamento, '+
        'historico_agendamento.quantidade, historico_agendamento.datacad, historico_agendamento.mesano FROM '+
        'historico_agendamento inner join clientes on (historico_agendamento.id_cliente = clientes.cli_id) '+
        'inner join controle_agendamento on (historico_agendamento.id_agendamento = controle_agendamento.num_agendamento) '+
        'inner join servicos on (historico_agendamento.id_servico = servicos.serv_id) inner join funcionarios '+
        'on (historico_agendamento.id_funcionario = funcionarios.func_id) ORDER BY controle_agendamento.num_agendamento';

          with dm_DadosSegundo.cds_HistoricoAgendamento do
          begin

            Close;
            CommandText:= (_Sql);
            Open;

          end;

         edt_DataInicio.Clear;
         edt_DataFim.Clear;

         btnLimparPesquisaPeriodoAgendamento.Enabled := True;
         btnRetornarConsPeriodoAgendamento.Enabled   := True;
         btnConsultarPeriodoAgendamento.Enabled      := False;

         //FORMATANDO O VALOR DO CAMPO valor_unitario COMO CURRENCY
         TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_unitario')).DisplayFormat:= '###,##0.00';
         TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_total')).DisplayFormat:= '###,##0.00';



end;

procedure T_frmAgenda.edt_DataFimChange(Sender: TObject);
begin

    //HABILITA O BOTAO PARA CONSULTAR
     btnConsultarPeriodoAgendamento.Enabled      := True;
     btnLimparPesquisaPeriodoAgendamento.Enabled := False;

end;

procedure T_frmAgenda.btnRetornarConsPeriodoAgendamentoClick(
  Sender: TObject);
begin

      LimparPesquisaPorPeriodo;
      pan_titulo.Caption:='Controle da Agenda - Cadastro';
      HabilitarBotoes;
      pangrid_visualizacao.SendToBack;

      btnLimparPesquisaPeriodoAgendamento.Enabled := False;
      btnRetornarConsPeriodoAgendamento.Enabled   := False;
      btnConsultarPeriodoAgendamento.Enabled      := False;
      edt_DataInicio.Enabled                      := False;
      edt_DataFim.Enabled                         := False;
      paginas.ActivePageIndex:=0;
      paginas.Enabled := False;    

end;

procedure T_frmAgenda.PesquisarPeriodoDeAgendamentosAtendidos;
var
  DataInicio, DataFim : TDate;
begin

             DataInicio  := StrToDate(edt_DataInicio_Atendidos.Text);
             DataFim     := StrToDate(edt_DataFim_Atendidos.Text);

             // PESQUISA POR PERIODO ESCOLHIDO PELO CAMPO DATA AGENDADA DA ABA POR PERIODO
        _Sql := 'select controle_agendamento.num_agendamento,historico_agendamento.id_historicoagendamento, historico_agendamento.data_agendada, '+
        'historico_agendamento.hora_agendada, historico_agendamento.valor_unitario, historico_agendamento.valor_total, '+
        'historico_agendamento.codigomovimento, historico_agendamento.datafechamento, clientes.cli_nome, '+
        'funcionarios.func_nome, servicos.serv_nome, historico_agendamento.id_cliente, historico_agendamento.id_servico, '+
        'historico_agendamento.id_funcionario, historico_agendamento.id_formapagto, historico_agendamento.id_agendamento, '+
        'historico_agendamento.quantidade, historico_agendamento.datacad, historico_agendamento.mesano FROM '+
        'historico_agendamento inner join clientes on (historico_agendamento.id_cliente = clientes.cli_id) '+
        'inner join controle_agendamento on (historico_agendamento.id_agendamento = controle_agendamento.num_agendamento) '+
        'inner join servicos on (historico_agendamento.id_servico = servicos.serv_id) inner join funcionarios '+
        'on (historico_agendamento.id_funcionario = funcionarios.func_id) WHERE historico_agendamento.codigomovimento = :pCodMov '+
        'AND historico_agendamento.data_agendada BETWEEN :Pdataini AND :Pdatafim ORDER BY controle_agendamento.num_agendamento';

            with dm_DadosSegundo.cds_HistoricoAgendamento do
            begin

              Close;
              CommandText:= (_Sql);
              Params.ParamByName('pCodMov').AsString:= 'FC';
              Params.ParamByName('Pdataini').AsDate  := DataInicio;
              Params.ParamByName('Pdatafim').AsDate  := DataFim;
              Open;

            end;

            //FORMATANDO O VALOR DO CAMPO valor_unitario COMO CURRENCY
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_unitario')).DisplayFormat:= '###,##0.00';
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_total')).DisplayFormat:= '###,##0.00';


end;

procedure T_frmAgenda.edt_DataInicio_AtendidosChange(Sender: TObject);
begin

     //HABILITA O BOTAO PARA CONSULTAR
     btn_Consulta_Periodo_Atendidos.Enabled      := True;
     btn_Limpa_Periodo_Atendidos.Enabled         := False;
     btn_Retorna_Periodo_Atendidos.Enabled       := True;

end;

procedure T_frmAgenda.edt_DataFim_AtendidosChange(Sender: TObject);
begin

      //HABILITA O BOTAO PARA CONSULTAR
     btn_Consulta_Periodo_Atendidos.Enabled      := True;
     btn_Limpa_Periodo_Atendidos.Enabled         := False;
     btn_Retorna_Periodo_Atendidos.Enabled       := True;

end;

procedure T_frmAgenda.btn_Consulta_Periodo_AtendidosClick(Sender: TObject);
begin

     //AO CLICAR NO BOTAO FAZ A PESQUISA POR PERIODO
     PesquisarPeriodoDeAgendamentosAtendidos;


     btn_Limpa_Periodo_Atendidos.Enabled     := True;
     btn_Retorna_Periodo_Atendidos.Enabled   := True;
     btn_Consulta_Periodo_Atendidos.Enabled  := False;
     edt_DataInicio_Atendidos.Enabled        := False;
     edt_DataFim_Atendidos.Enabled           := False;
     btnimprimir.Enabled                     := True;
     btnimprimir.Tag                         := 300;


end;
procedure T_frmAgenda.btn_Limpa_Periodo_AtendidosClick(Sender: TObject);
begin

     LimparPesquisaAtendidos;
     edt_DataInicio_Atendidos.Enabled     := True;
     edt_DataFim_Atendidos.Enabled        := True;
     edt_DataInicio_Atendidos.SetFocus;


end;

procedure T_frmAgenda.btn_Retorna_Periodo_AtendidosClick(Sender: TObject);
begin

      LimparPesquisaAtendidos;
      pan_titulo.Caption:='Controle da Agenda - Cadastro';
      HabilitarBotoes;
      pangrid_visualizacao.SendToBack;

      btn_Limpa_Periodo_Atendidos.Enabled     := False;
      btn_Retorna_Periodo_Atendidos.Enabled   := False;
      btn_Consulta_Periodo_Atendidos.Enabled  := False;
      edt_DataInicio_Atendidos.Enabled        := False;
      edt_DataFim_Atendidos.Enabled           := False;
      paginas.ActivePageIndex:=0;
      paginas.Enabled := False;

end;


procedure T_frmAgenda.PesquisarPeriodoDeAgendamentosEmAbertos;
var
  DataInicio, DataFim : TDate;
begin

             DataInicio  := StrToDate(edt_DataInicio_Abertos.Text);
             DataFim     := StrToDate(edt_DataFim_Abertos.Text);

             // PESQUISA POR PERIODO ESCOLHIDO PELO CAMPO DATA AGENDADA DA ABA ABERTOS
        _Sql := 'select controle_agendamento.num_agendamento,historico_agendamento.id_historicoagendamento, historico_agendamento.data_agendada, '+
        'historico_agendamento.hora_agendada, historico_agendamento.valor_unitario, historico_agendamento.valor_total, '+
        'historico_agendamento.codigomovimento, historico_agendamento.datafechamento, clientes.cli_nome, '+
        'funcionarios.func_nome, servicos.serv_nome, historico_agendamento.id_cliente, historico_agendamento.id_servico, '+
        'historico_agendamento.id_funcionario, historico_agendamento.id_formapagto, historico_agendamento.id_agendamento, '+
        'historico_agendamento.quantidade, historico_agendamento.datacad, historico_agendamento.mesano FROM '+
        'historico_agendamento inner join clientes on (historico_agendamento.id_cliente = clientes.cli_id) '+
        'inner join controle_agendamento on (historico_agendamento.id_agendamento = controle_agendamento.num_agendamento) '+
        'inner join servicos on (historico_agendamento.id_servico = servicos.serv_id) inner join funcionarios '+
        'on (historico_agendamento.id_funcionario = funcionarios.func_id) WHERE historico_agendamento.codigomovimento = :pCodMov '+
        'AND historico_agendamento.data_agendada BETWEEN :Pdataini AND :Pdatafim ORDER BY controle_agendamento.num_agendamento';

            with dm_DadosSegundo.cds_HistoricoAgendamento do
            begin

              Close;
              CommandText:= (_Sql);
              Params.ParamByName('pCodMov').AsString:= 'AB';
              Params.ParamByName('Pdataini').AsDate  := DataInicio;
              Params.ParamByName('Pdatafim').AsDate  := DataFim;
              Open;

            end;

            //FORMATANDO O VALOR DO CAMPO valor_unitario COMO CURRENCY
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_unitario')).DisplayFormat:= '###,##0.00';
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_total')).DisplayFormat:= '###,##0.00';

end;

procedure T_frmAgenda.edt_DataInicio_AbertosChange(Sender: TObject);
begin

    //HABILITA O BOTAO PARA CONSULTAR
     btn_Consulta_Periodo_Abertos.Enabled      := True;
     btn_Limpa_Periodo_Abertos.Enabled         := False;
     btn_Retorna_Periodo_Abertos.Enabled       := True;

end;

procedure T_frmAgenda.edt_DataFim_AbertosChange(Sender: TObject);
begin

       //HABILITA O BOTAO PARA CONSULTAR
     btn_Consulta_Periodo_Abertos.Enabled      := True;
     btn_Limpa_Periodo_Abertos.Enabled         := False;
     btn_Retorna_Periodo_Abertos.Enabled       := True;

end;

procedure T_frmAgenda.btn_Consulta_Periodo_AbertosClick(Sender: TObject);
begin

     //AO CLICAR NO BOTAO FAZ A PESQUISA POR PERIODO
     PesquisarPeriodoDeAgendamentosEmAbertos;


     btn_Limpa_Periodo_Abertos.Enabled      := True;
     btn_Retorna_Periodo_Abertos.Enabled    := True;
     btn_Consulta_Periodo_Abertos.Enabled   := False;
     edt_DataInicio_Abertos.Enabled         := False;
     edt_DataFim_Abertos.Enabled            := False;
     btnimprimir.Enabled                    := True; 
     btnimprimir.Tag                        := 200;


end;

procedure T_frmAgenda.btn_Limpa_Periodo_AbertosClick(Sender: TObject);
begin

     LimparPesquisaAbertos;
     edt_DataInicio_Abertos.Enabled     := True;
     edt_DataFim_Abertos.Enabled        := True;
     edt_DataInicio_Abertos.SetFocus;


end;

procedure T_frmAgenda.btn_Retorna_Periodo_AbertosClick(Sender: TObject);
begin

      LimparPesquisaAbertos;
      pan_titulo.Caption:='Controle da Agenda - Cadastro';
      HabilitarBotoes;
      pangrid_visualizacao.SendToBack;

      btn_Limpa_Periodo_Abertos.Enabled     := False;
      btn_Retorna_Periodo_Abertos.Enabled   := False;
      btn_Consulta_Periodo_Abertos.Enabled  := False;
      edt_DataInicio_Abertos.Enabled        := False;
      edt_DataFim_Abertos.Enabled           := False;
      paginas.ActivePageIndex:=0;
      paginas.Enabled := False;

end;

procedure T_frmAgenda.LimparPesquisaAbertos;
begin

         // SE SELECIONAR A PAGINA ABERTOS
        _Sql := 'select controle_agendamento.num_agendamento,historico_agendamento.id_historicoagendamento, historico_agendamento.data_agendada, '+
        'historico_agendamento.hora_agendada, historico_agendamento.valor_unitario, historico_agendamento.valor_total, '+
        'historico_agendamento.codigomovimento, historico_agendamento.datafechamento, clientes.cli_nome, '+
        'funcionarios.func_nome, servicos.serv_nome, historico_agendamento.id_cliente, historico_agendamento.id_servico, '+
        'historico_agendamento.id_funcionario, historico_agendamento.id_formapagto, historico_agendamento.id_agendamento, '+
        'historico_agendamento.quantidade, historico_agendamento.datacad, historico_agendamento.mesano FROM '+
        'historico_agendamento inner join clientes on (historico_agendamento.id_cliente = clientes.cli_id) '+
        'inner join controle_agendamento on (historico_agendamento.id_agendamento = controle_agendamento.num_agendamento) '+
        'inner join servicos on (historico_agendamento.id_servico = servicos.serv_id) inner join funcionarios '+
        'on (historico_agendamento.id_funcionario = funcionarios.func_id) WHERE historico_agendamento.codigomovimento = :pCodMov '+
        'ORDER BY controle_agendamento.num_agendamento';

            with dm_DadosSegundo.cds_HistoricoAgendamento do
            begin

              Close;
              CommandText:= (_Sql);
              Params.ParamByName('pCodMov').AsString:= 'AB';
              Open;

            end;

           edt_DataInicio_Abertos.Clear;
           edt_DataFim_Abertos.Clear;

           btn_Consulta_Periodo_Abertos.Enabled      := True;
           btn_Limpa_Periodo_Abertos.Enabled         := False;
           btn_Retorna_Periodo_Abertos.Enabled       := True;

           //FORMATANDO O VALOR DO CAMPO valor_unitario COMO CURRENCY
           TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_unitario')).DisplayFormat:= '###,##0.00';
           TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_total')).DisplayFormat:= '###,##0.00';


end;

procedure T_frmAgenda.LimparPesquisaAtendidos;
begin

          // SE SELECIONAR A PAGINA ATENDIDOS
            _Sql := 'select controle_agendamento.num_agendamento,historico_agendamento.id_historicoagendamento, historico_agendamento.data_agendada, '+
        'historico_agendamento.hora_agendada, historico_agendamento.valor_unitario, historico_agendamento.valor_total, '+
        'historico_agendamento.codigomovimento, historico_agendamento.datafechamento, clientes.cli_nome, '+
        'funcionarios.func_nome, servicos.serv_nome, historico_agendamento.id_cliente, historico_agendamento.id_servico, '+
        'historico_agendamento.id_funcionario, historico_agendamento.id_formapagto, historico_agendamento.id_agendamento, '+
        'historico_agendamento.quantidade, historico_agendamento.datacad, historico_agendamento.mesano FROM '+
        'historico_agendamento inner join clientes on (historico_agendamento.id_cliente = clientes.cli_id) '+
        'inner join controle_agendamento on (historico_agendamento.id_agendamento = controle_agendamento.num_agendamento) '+
        'inner join servicos on (historico_agendamento.id_servico = servicos.serv_id) inner join funcionarios '+
        'on (historico_agendamento.id_funcionario = funcionarios.func_id) WHERE historico_agendamento.codigomovimento = :pCodMov '+
        'ORDER BY controle_agendamento.num_agendamento';

            with dm_DadosSegundo.cds_HistoricoAgendamento do
            begin

              Close;
              CommandText:= (_Sql);
              Params.ParamByName('pCodMov').AsString:= 'FC';
              Open;

            end;


           edt_DataInicio_Atendidos.Clear;
           edt_DataFim_Atendidos.Clear;

           btn_Consulta_Periodo_Atendidos.Enabled      := True;
           btn_Limpa_Periodo_Atendidos.Enabled         := False;
           btn_Retorna_Periodo_Atendidos.Enabled       := True;

           //FORMATANDO O VALOR DO CAMPO valor_unitario COMO CURRENCY
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_unitario')).DisplayFormat:= '###,##0.00';
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_total')).DisplayFormat:= '###,##0.00';


end;

procedure T_frmAgenda.btn_Retorna_FechamentoClick(Sender: TObject);
begin

      pan_titulo.Caption:='Controle da Agenda - Cadastro';
      HabilitarBotoes;
      pangrid_visualizacao.SendToBack;

      btn_Fechar_Agendamento.Enabled     := False;
      btn_Remarcar_Agendamento.Enabled   := False;
      btn_Cancelar_Agendamento.Enabled   := False;


      paginas.ActivePageIndex:=0;
      paginas.Enabled := False;

end;

procedure T_frmAgenda.btn_Fechar_AgendamentoClick(Sender: TObject);
var
  texto           : string;
  cod             : Integer;
  DataDoDia       : TDate;
begin

      texto:= 'Confirma o Fechamento do Serviço '+db_NomeServicoFechamento.Text+' agendado por '+db_NomeClienteFechamento.Text+ '?';
      cod := StrToInt(db_CodHistoricoFechamento.Text);
      DataDoDia := Date;


      if Application.MessageBox(PChar(texto),'Fechamento de Serviço',MB_YESNO + MB_ICONQUESTION) = IdYes then
      begin

          _Sql:= 'UPDATE historico_agendamento SET codigomovimento = :pCodMov, datafechamento = :pDataFechamento WHERE id_historicoagendamento = :pCodigo';


          with DM_Pesq.Qry_Geral do begin

            Close;
            SQL.Clear;
            SQL.Add(_Sql);
            ParamByName('pCodMov').AsString           := 'FC';
            ParamByName('pDataFechamento').AsDateTime := DataDoDia;
            ParamByName('pCodigo').AsInteger          := cod;
            ExecSQL();

          end;


          dm_DadosSegundo.cds_HistoricoAgendamento.ApplyUpdates(0);
          Application.MessageBox('Agendamento fechado com sucesso!', 
            'Fechado!', MB_OK);
          Abrir_FecharTabelas;

      end;


end;


procedure T_frmAgenda.btn_Cancelar_AgendamentoClick(Sender: TObject);
var
  texto           : string;
  cod             : Integer;
  DataDoDia       : TDate;
begin

      texto:= 'Confirma o Cancelamento do Serviço '+db_NomeServicoFechamento.Text+' agendado por '+db_NomeClienteFechamento.Text+ '?';
      cod := StrToInt(db_CodHistoricoFechamento.Text);
      DataDoDia := Date;


      if Application.MessageBox(PChar(texto),'Cancelamento de Serviço',MB_YESNO + MB_ICONQUESTION) = IdYes then
      begin

          _Sql:= 'UPDATE historico_agendamento SET codigomovimento = :pCodMov, datafechamento = :pDataFechamento WHERE id_historicoagendamento = :pCodigo';


          with DM_Pesq.Qry_Geral do begin

            Close;
            SQL.Clear;
            SQL.Add(_Sql);
            ParamByName('pCodMov').AsString           := 'CL';
            ParamByName('pDataFechamento').AsDateTime := DataDoDia;
            ParamByName('pCodigo').AsInteger          := cod;
            ExecSQL();

          end;


          dm_DadosSegundo.cds_HistoricoAgendamento.ApplyUpdates(0);
          Application.MessageBox('Cancelamento concluído com sucesso!',
            'Cancelado!', MB_OK);
          Abrir_FecharTabelas;

      end;



end;

procedure T_frmAgenda.btn_Remarcar_AgendamentoClick(Sender: TObject);

begin

     edt_DiaRemarcado.Clear;
     edt_HoraRemarcada.Clear;
     grpGrupoDosBotoesRemarcacao.Enabled:= False;
     Grid_Fechamento.Enabled := False;
     pnl_Remarcacao.Visible  := True;

     tsVisualizacao.Enabled  := False;
     tsAgendamento.Enabled   := False;
     tsPorPeriodo.Enabled    := False;
     tsAtendidos.Enabled     := False;
     tsAbertos.Enabled       := False;


end;

procedure T_frmAgenda.lst_RemarcarHoraClick(Sender: TObject);
begin

       //edt_HoraRemarcada recebe o horario selecionado
      edt_HoraRemarcada.Text := lst_RemarcarHora.Items[lst_RemarcarHora.itemindex];
      HoraRemarcada := edt_HoraRemarcada.Text;

      with lst_RemarcarHora do
       begin

         SendToBack;
         Height  := 22;
         Left    := 178;
         Top     := 46;
         Width   := 151;

       end;

       btn_OkRemarcado.Enabled  := True;
       lst_RemarcarHora.Visible := False;

end;

procedure T_frmAgenda.btnCancelarRemarcacaoClick(Sender: TObject);
begin
      pnl_Remarcacao.Visible:= False;
end;

procedure T_frmAgenda.edt_HoraRemarcadaEnter(Sender: TObject);
begin

      with lst_RemarcarHora do
       begin

         Visible:= True;
         BringToFront;
         Height  := 75;
         Left    := 178;
         Top     := 46;
         Width   := 151;

       end;


end;

procedure T_frmAgenda.Calendario_RemarcarDiaChange(Sender: TObject);
begin

     edt_HoraRemarcada.Enabled :=True;
     edt_HoraRemarcada.SetFocus;


end;

procedure T_frmAgenda.btn_OkRemarcadoClick(Sender: TObject);
var
  cod   : Integer;
begin

      cod := StrToInt(db_CodHistoricoFechamento.Text);

      _Sql:= 'UPDATE historico_agendamento SET data_agendada = :pDataAgendada, hora_agendada '+
      '= :pHoraAgendada WHERE id_historicoagendamento = :pCodigo';


      with DM_Pesq.Qry_Geral do begin

        Close;
        SQL.Clear;
        SQL.Add(_Sql);
        ParamByName('pDataAgendada').AsDateTime  := StrToDate(DiaRemarcado);
        ParamByName('pHoraAgendada').AsString    := HoraRemarcada;
        ParamByName('pCodigo').AsInteger         := cod;
        ExecSQL();

      end;


      dm_DadosSegundo.cds_HistoricoAgendamento.ApplyUpdates(0);

      Application.MessageBox('Remarcação feita com sucesso!',
        'Remarcado!', MB_OK);
      Abrir_FecharTabelas;

      pnl_Remarcacao.Visible:= False;
      grpGrupoDosBotoesRemarcacao.Enabled:= True;
      Grid_Fechamento.Enabled:= True;

      tsVisualizacao.Enabled  := True;
      tsAgendamento.Enabled   := True;
      tsPorPeriodo.Enabled    := True;
      tsAtendidos.Enabled     := True;
      tsAbertos.Enabled       := True;
      Abrir_FecharTabelas;   

end;


procedure T_frmAgenda.btn_CancelarRemarcacaoClick(Sender: TObject);
begin

     dm_DadosSegundo.cds_HistoricoAgendamento.Cancel;
     Application.MessageBox('Remarcação cancelada!',
                        'Cancelada!', MB_OK);
                   Abrir_FecharTabelas;

     pnl_Remarcacao.Visible:= False;
     grpGrupoDosBotoesRemarcacao.Enabled:= True;
     Grid_Fechamento.Enabled:= True;

     tsVisualizacao.Enabled  := True;
     tsAgendamento.Enabled   := True;
     tsPorPeriodo.Enabled    := True;
     tsAtendidos.Enabled     := True;
     tsAbertos.Enabled       := True;


end;

procedure T_frmAgenda.Calendario_RemarcarDiaExit(Sender: TObject);
begin

     edt_DiaRemarcado.Text:= DateToStr(Calendario_RemarcarDia.date);
     DiaRemarcado:= edt_DiaRemarcado.Text;
     edt_DiaRemarcado.Visible := True;

end;

procedure T_frmAgenda.edt_DiaRemarcadoClick(Sender: TObject);
begin

      with  Calendario_RemarcarDia do
      begin

         Visible := True;
         Height  := 22;
         Left    := 17;
         Top     := 63;

      end;

      btn_CancelarRemarcacao.Enabled  := True;
      edt_DiaRemarcado.Visible        := False;
end;


procedure T_frmAgenda.Grid_FechamentoCellClick(Column: TColumn);
begin

      btn_Fechar_Agendamento.Enabled   := True;
      btn_Cancelar_Agendamento.Enabled := True;
      btn_Remarcar_Agendamento.Enabled := True;

end;

procedure T_frmAgenda.edt_DiaAgendadoClick(Sender: TObject);
begin

   with calendario do
       begin

         Visible := True;
         Height  := 21;
         Left    := 424;
         Top     := 41;
         Width   := 123;

       end;

end;


procedure T_frmAgenda.edt_ValorDescontoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if Key = VK_RETURN then
     begin

         edt_PrecoDesconto.Text   := edt_ValorDesconto.Text;

         PrecoDoServico          := StrToFloat(edt_PrecoServico.Text);
         PrecoDesconto           := StrToFloat(edt_PrecoDesconto.Text);
         edt_PrecoDesconto.Text  := FloatToStr(PrecoDesconto);


         ValorLiquido           := (PrecoDoServico - PrecoDesconto);
         edt_PrecoLiquido.Text  := FloatToStr(ValorLiquido);


         Gr_ValorDesconto.Visible := False;
         edt_QuantidadeDeServicos.SetFocus;

         rb_Desconto.Checked:= False;
         edt_ValorDesconto.Clear;

     end;

end;

procedure T_frmAgenda.rb_PromocaoClick(Sender: TObject);
begin


       with Grid_Promocoes do begin

            Height := 146;
            Left   := 8;
            Top    := 68;
            Width  := 214;
            Visible:= True;

       end;

      LocalizarServicoParaAgendamento;
     

end;

procedure T_frmAgenda.rb_DescontoClick(Sender: TObject);
begin

      
        if rb_Desconto.Checked then begin


           with Gr_ValorDesconto do
           begin

              Visible := True;
              Height  := 81;
              Left    := 288;
              Width   := 217;
              top     :=0;

           end;

           edt_ValorDesconto.SetFocus;


        end;

end;

procedure T_frmAgenda.dbCLI_NOMEEnter(Sender: TObject);
begin
   keybd_event(VK_DOWN, 0, 0, 0);
   keybd_event(VK_UP, 0, 0, 0);
end;

procedure T_frmAgenda.dbFUNC_NOMEEnter(Sender: TObject);
begin
   keybd_event(VK_DOWN, 0, 0, 0);
   keybd_event(VK_UP, 0, 0, 0);
end;


procedure T_frmAgenda.btnimprimirClick(Sender: TObject);
var
  DataInicio, DataFim : TDate;

begin

       // VISUALIZAÇÃO DE TODOS OS AGENDAMENTOS POR PERÍODO
       if btnimprimir.Tag = 100 then
       begin


          DataInicio  := StrToDate(edt_DataInicio.text);
          DataFim     := StrToDate(edt_DataFim.text);


         with Q_RelAgendaPorPeriodo.cds_RelAgendaPeriodo do
         begin

            Close;
            Params.ParamByName('pdataini').AsDate   := DataInicio;
            Params.ParamByName('pdatafim').AsDate   := DataFim;
            Open;

         end;

         Q_RelAgendaPorPeriodo.cds_RelAgendaPeriodo.Active:= True;
         Q_RelAgendaPorPeriodo.Preview;
         btnimprimir.Enabled                    := False;

        // VISUALIZAÇÃO DE TODOS OS AGENDAMENTOS ABERTOS POR PERÍODO
       end else if btnimprimir.Tag = 200 then
       begin


          DataInicio  := StrToDate(edt_DataInicio_Abertos.text);
          DataFim     := StrToDate(edt_DataFim_Abertos.text);


         with Q_RelAgendaAbertos.cds_RelAgendaAbertosPeriodo do
         begin

            Close;
            Params.ParamByName('pmov').AsString     := 'AB';
            Params.ParamByName('pdataini').AsDate   := DataInicio;
            Params.ParamByName('pdatafim').AsDate   := DataFim;

            Open;

         end;

         Q_RelAgendaAbertos.cds_RelAgendaAbertosPeriodo.Active:= True;
         Q_RelAgendaAbertos.Preview;
         btnimprimir.Enabled                    := False;

       // VISUALIZAÇÃO DE TODOS OS AGENDAMENTOS ATENDIDOS POR PERÍODO
       end else if btnimprimir.Tag = 300 then
       begin


          DataInicio  := StrToDate(edt_DataInicio_Atendidos.text);
          DataFim     := StrToDate(edt_DataFim_Atendidos.text);


         with Q_RelAgendaAtendidos.cds_RelAgendaAtendidosPeriodo do
         begin

            Close;
            Params.ParamByName('pmov').AsString     := 'FC';
            Params.ParamByName('pdataini').AsDate   := DataInicio;
            Params.ParamByName('pdatafim').AsDate   := DataFim;

            Open;

         end;

         Q_RelAgendaAtendidos.cds_RelAgendaAtendidosPeriodo.Active:= True;
         Q_RelAgendaAtendidos.Preview;
         btnimprimir.Enabled                    := False;

       end;

end;


procedure T_frmAgenda.tsVisualizacaoShow(Sender: TObject);
begin

            // SE SELECIONAR A PAGINA VISUALIZAÇÃO

            _Sql := 'select controle_agendamento.num_agendamento,historico_agendamento.id_historicoagendamento, historico_agendamento.data_agendada, '+
            'historico_agendamento.hora_agendada, historico_agendamento.valor_unitario, historico_agendamento.valor_total,'+
            'historico_agendamento.codigomovimento, historico_agendamento.datafechamento, clientes.cli_nome, '+
            'funcionarios.func_nome, servicos.serv_nome, historico_agendamento.id_cliente, historico_agendamento.id_servico, '+
            'historico_agendamento.id_funcionario, historico_agendamento.id_formapagto, historico_agendamento.id_agendamento, '+
            'historico_agendamento.quantidade, historico_agendamento.datacad, historico_agendamento.mesano FROM '+
            'historico_agendamento inner join clientes on (historico_agendamento.id_cliente = clientes.cli_id) '+
            'inner join controle_agendamento on (historico_agendamento.id_agendamento = controle_agendamento.num_agendamento) '+
            'inner join servicos on (historico_agendamento.id_servico = servicos.serv_id) inner join funcionarios '+
            'on (historico_agendamento.id_funcionario = funcionarios.func_id) ORDER BY controle_agendamento.num_agendamento';

            with dm_DadosSegundo.cds_HistoricoAgendamento do
            begin

              Close;
              CommandText:= (_Sql);
              Open;

            end;


            dbedtSERV_NOME.DataField                := 'SERV_NOME';
            dbedtSERV_NOME.DataSource               := dm_DadosSegundo.ds_HistoricoAgendamento;

            dbedtCliente.DataField                  := 'CLI_NOME';
            dbedtCliente.DataSource                 := dm_DadosSegundo.ds_HistoricoAgendamento;

            dbedtID_HISTORICOAGENDAMENTO.DataField  := 'ID_HISTORICOAGENDAMENTO';
            dbedtID_HISTORICOAGENDAMENTO.DataSource := dm_DadosSegundo.ds_HistoricoAgendamento;

            btnSairVisualizacaoAgendamento.Enabled  := True;

            //FORMATANDO O VALOR DO CAMPO valor_unitario COMO CURRENCY
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_unitario')).DisplayFormat:= '###,##0.00';
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_total')).DisplayFormat:= '###,##0.00';

            with Grid_VisualizaAgenda do
            begin

              DataSource:=  dm_DadosSegundo.ds_HistoricoAgendamento;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName         := 'NUM_AGENDAMENTO';
              Columns[0].Title.Caption     := 'Agendamento';
              Columns[0].Width             := 95;
              Columns[0].Alignment         := taCenter;
              Columns[0].Title.Alignment   := taCenter;
              Columns[0].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[1].FieldName         := 'CODIGOMOVIMENTO';
              Columns[1].Title.Caption     := 'Status';
              Columns[1].Width             := 60;
              Columns[1].Alignment         := taCenter;
              Columns[1].Title.Alignment   := taCenter;
              Columns[1].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[2].FieldName         := 'CLI_NOME';
              Columns[2].Title.Caption     := 'Cliente';
              Columns[2].Width             := 300;
              Columns[2].Alignment         := taLeftJustify;
              Columns[2].Title.Alignment   := taLeftJustify;
              Columns[2].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[3].FieldName         := 'SERV_NOME';
              Columns[3].Title.Caption     := 'Serviço';
              Columns[3].Width             := 200;
              Columns[3].Alignment         := taLeftJustify;
              Columns[3].Title.Alignment   := taLeftJustify;
              Columns[3].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[4].FieldName         := 'DATA_AGENDADA';
              Columns[4].Title.Caption     := 'Data Agendada';
              Columns[4].Width             := 120;
              Columns[4].Alignment         := taCenter;
              Columns[4].Title.Alignment   := taCenter;
              Columns[4].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[5].FieldName         := 'HORA_AGENDADA';
              Columns[5].Title.Caption     := 'Hora Agendada';
              Columns[5].Width             := 120;
              Columns[5].Alignment         := taCenter;
              Columns[5].Title.Alignment   := taCenter;
              Columns[5].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[6].FieldName         := 'valor_unitario';
              Columns[6].Title.Caption     := 'Valor Serviço';
              Columns[6].Width             := 120;
              Columns[6].Alignment         := taRightJustify;
              Columns[6].Title.Alignment   := taRightJustify;
              Columns[6].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[7].FieldName         := 'QUANTIDADE';
              Columns[7].Title.Caption     := 'Quantidade';
              Columns[7].Width             := 80;
              Columns[7].Alignment         := taCenter;
              Columns[7].Title.Alignment   := taRightJustify;
              Columns[7].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[8].FieldName         := 'valor_total';
              Columns[8].Title.Caption     := 'Valor Total';
              Columns[8].Width             := 120;
              Columns[8].Alignment         := taRightJustify;
              Columns[8].Title.Alignment   := taRightJustify;
              Columns[8].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[9].FieldName         := 'FUNC_NOME';
              Columns[9].Title.Caption     := 'Atendido Por';
              Columns[9].Width             := 150;
              Columns[9].Alignment         := taRightJustify;
              Columns[9].Title.Alignment   := taRightJustify;
              Columns[9].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[10].FieldName         := 'DATAFECHAMENTO';
              Columns[10].Title.Caption     := 'Data Fechamento';
              Columns[10].Width             := 120;
              Columns[10].Alignment         := taCenter;
              Columns[10].Title.Alignment   := taCenter;
              Columns[10].Title.Font.Color  := clBlack;

          end;

end;


procedure T_frmAgenda.tsPorPeriodoShow(Sender: TObject);
begin

            // SE SELECIONAR A PAGINA POR PERÍODO
            _Sql := 'select controle_agendamento.num_agendamento,historico_agendamento.id_historicoagendamento, historico_agendamento.data_agendada, '+
            'historico_agendamento.hora_agendada, historico_agendamento.valor_unitario, historico_agendamento.valor_total, '+
            'historico_agendamento.codigomovimento, historico_agendamento.datafechamento, clientes.cli_nome, '+
            'funcionarios.func_nome, servicos.serv_nome, historico_agendamento.id_cliente, historico_agendamento.id_servico, '+
            'historico_agendamento.id_funcionario, historico_agendamento.id_formapagto, historico_agendamento.id_agendamento, '+
            'historico_agendamento.quantidade, historico_agendamento.datacad, historico_agendamento.mesano FROM '+
            'historico_agendamento inner join clientes on (historico_agendamento.id_cliente = clientes.cli_id) '+
            'inner join controle_agendamento on (historico_agendamento.id_agendamento = controle_agendamento.num_agendamento) '+
            'inner join servicos on (historico_agendamento.id_servico = servicos.serv_id) inner join funcionarios '+
            'on (historico_agendamento.id_funcionario = funcionarios.func_id) ORDER BY controle_agendamento.num_agendamento';

            with dm_DadosSegundo.cds_HistoricoAgendamento do
            begin

              Close;
              CommandText:= (_Sql);
              Open;

            end;


            btnRetornarConsPeriodoAgendamento.Enabled   := True;

            //FORMATANDO O VALOR DO CAMPO valor_unitario COMO CURRENCY
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_unitario')).DisplayFormat:= '###,##0.00';
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_total')).DisplayFormat:= '###,##0.00';


            with Grid_PesquisaPeriodoAgendamento do
            begin

              DataSource:=  dm_DadosSegundo.ds_HistoricoAgendamento;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName         := 'NUM_AGENDAMENTO';
              Columns[0].Title.Caption     := 'Agendamento';
              Columns[0].Width             := 95;
              Columns[0].Alignment         := taCenter;
              Columns[0].Title.Alignment   := taCenter;
              Columns[0].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[1].FieldName         := 'CODIGOMOVIMENTO';
              Columns[1].Title.Caption     := 'Status';
              Columns[1].Width             := 60;
              Columns[1].Alignment         := taCenter;
              Columns[1].Title.Alignment   := taCenter;
              Columns[1].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[2].FieldName         := 'CLI_NOME';
              Columns[2].Title.Caption     := 'Cliente';
              Columns[2].Width             := 300;
              Columns[2].Alignment         := taLeftJustify;
              Columns[2].Title.Alignment   := taLeftJustify;
              Columns[2].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[3].FieldName         := 'SERV_NOME';
              Columns[3].Title.Caption     := 'Serviço';
              Columns[3].Width             := 200;
              Columns[3].Alignment         := taLeftJustify;
              Columns[3].Title.Alignment   := taLeftJustify;
              Columns[3].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[4].FieldName         := 'DATA_AGENDADA';
              Columns[4].Title.Caption     := 'Data Agendada';
              Columns[4].Width             := 120;
              Columns[4].Alignment         := taCenter;
              Columns[4].Title.Alignment   := taCenter;
              Columns[4].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[5].FieldName         := 'HORA_AGENDADA';
              Columns[5].Title.Caption     := 'Hora Agendada';
              Columns[5].Width             := 120;
              Columns[5].Alignment         := taCenter;
              Columns[5].Title.Alignment   := taCenter;
              Columns[5].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[6].FieldName         := 'valor_unitario';
              Columns[6].Title.Caption     := 'Valor Serviço';
              Columns[6].Width             := 120;
              Columns[6].Alignment         := taRightJustify;
              Columns[6].Title.Alignment   := taRightJustify;
              Columns[6].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[7].FieldName         := 'QUANTIDADE';
              Columns[7].Title.Caption     := 'Quantidade';
              Columns[7].Width             := 80;
              Columns[7].Alignment         := taCenter;
              Columns[7].Title.Alignment   := taRightJustify;
              Columns[7].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[8].FieldName         := 'valor_total';
              Columns[8].Title.Caption     := 'Valor Total';
              Columns[8].Width             := 120;
              Columns[8].Alignment         := taRightJustify;
              Columns[8].Title.Alignment   := taRightJustify;
              Columns[8].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[9].FieldName         := 'FUNC_NOME';
              Columns[9].Title.Caption     := 'Atendido Por';
              Columns[9].Width             := 150;
              Columns[9].Alignment         := taRightJustify;
              Columns[9].Title.Alignment   := taRightJustify;
              Columns[9].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[10].FieldName         := 'DATAFECHAMENTO';
              Columns[10].Title.Caption     := 'Data Fechamento';
              Columns[10].Width             := 120;
              Columns[10].Alignment         := taCenter;
              Columns[10].Title.Alignment   := taCenter;
              Columns[10].Title.Font.Color  := clBlack;


            end;

end;



procedure T_frmAgenda.tsAtendidosShow(Sender: TObject);
begin

            // SE SELECIONAR A PAGINA ATENDIDOS
            _Sql := 'select controle_agendamento.num_agendamento,historico_agendamento.id_historicoagendamento, historico_agendamento.data_agendada, '+
            'historico_agendamento.hora_agendada, historico_agendamento.valor_unitario, historico_agendamento.valor_total, '+
            'historico_agendamento.codigomovimento, historico_agendamento.datafechamento, clientes.cli_nome, '+
            'funcionarios.func_nome, servicos.serv_nome, historico_agendamento.id_cliente, historico_agendamento.id_servico, '+
            'historico_agendamento.id_funcionario, historico_agendamento.id_formapagto, historico_agendamento.id_agendamento, '+
            'historico_agendamento.quantidade, historico_agendamento.datacad, historico_agendamento.mesano FROM '+
            'historico_agendamento inner join clientes on (historico_agendamento.id_cliente = clientes.cli_id) '+
            'inner join controle_agendamento on (historico_agendamento.id_agendamento = controle_agendamento.num_agendamento) '+
            'inner join servicos on (historico_agendamento.id_servico = servicos.serv_id) inner join funcionarios '+
            'on (historico_agendamento.id_funcionario = funcionarios.func_id) WHERE historico_agendamento.codigomovimento = :pCodMov '+
            'ORDER BY controle_agendamento.num_agendamento';


            with dm_DadosSegundo.cds_HistoricoAgendamento do
            begin

              Close;
              CommandText:= (_Sql);
              Params.ParamByName('pCodMov').AsString:= 'FC';
              Open;

            end;


            btn_Retorna_Periodo_Atendidos.Enabled       := True;


            //FORMATANDO O VALOR DO CAMPO valor_unitario COMO CURRENCY
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_unitario')).DisplayFormat:= '###,##0.00';
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_total')).DisplayFormat:= '###,##0.00';


            with Grid_Pesquisa_Atendidos do
            begin

              DataSource:=  dm_DadosSegundo.ds_HistoricoAgendamento;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName         := 'NUM_AGENDAMENTO';
              Columns[0].Title.Caption     := 'Agendamento';
              Columns[0].Width             := 95;
              Columns[0].Alignment         := taCenter;
              Columns[0].Title.Alignment   := taCenter;
              Columns[0].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[1].FieldName         := 'CODIGOMOVIMENTO';
              Columns[1].Title.Caption     := 'Status';
              Columns[1].Width             := 60;
              Columns[1].Alignment         := taCenter;
              Columns[1].Title.Alignment   := taCenter;
              Columns[1].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[2].FieldName         := 'CLI_NOME';
              Columns[2].Title.Caption     := 'Cliente';
              Columns[2].Width             := 300;
              Columns[2].Alignment         := taLeftJustify;
              Columns[2].Title.Alignment   := taLeftJustify;
              Columns[2].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[3].FieldName         := 'SERV_NOME';
              Columns[3].Title.Caption     := 'Serviço';
              Columns[3].Width             := 200;
              Columns[3].Alignment         := taLeftJustify;
              Columns[3].Title.Alignment   := taLeftJustify;
              Columns[3].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[4].FieldName         := 'DATA_AGENDADA';
              Columns[4].Title.Caption     := 'Data Agendada';
              Columns[4].Width             := 120;
              Columns[4].Alignment         := taCenter;
              Columns[4].Title.Alignment   := taCenter;
              Columns[4].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[5].FieldName         := 'HORA_AGENDADA';
              Columns[5].Title.Caption     := 'Hora Agendada';
              Columns[5].Width             := 120;
              Columns[5].Alignment         := taCenter;
              Columns[5].Title.Alignment   := taCenter;
              Columns[5].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[6].FieldName         := 'valor_unitario';
              Columns[6].Title.Caption     := 'Valor Serviço';
              Columns[6].Width             := 120;
              Columns[6].Alignment         := taRightJustify;
              Columns[6].Title.Alignment   := taRightJustify;
              Columns[6].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[7].FieldName         := 'QUANTIDADE';
              Columns[7].Title.Caption     := 'Quantidade';
              Columns[7].Width             := 80;
              Columns[7].Alignment         := taCenter;
              Columns[7].Title.Alignment   := taRightJustify;
              Columns[7].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[8].FieldName         := 'valor_total';
              Columns[8].Title.Caption     := 'Valor Total';
              Columns[8].Width             := 120;
              Columns[8].Alignment         := taRightJustify;
              Columns[8].Title.Alignment   := taRightJustify;
              Columns[8].Title.Font.Color  := clBlack;


              Columns.Add;
              Columns[9].FieldName         := 'FUNC_NOME';
              Columns[9].Title.Caption     := 'Atendido Por';
              Columns[9].Width             := 150;
              Columns[9].Alignment         := taRightJustify;
              Columns[9].Title.Alignment   := taRightJustify;
              Columns[9].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[10].FieldName         := 'DATAFECHAMENTO';
              Columns[10].Title.Caption     := 'Data Fechamento';
              Columns[10].Width             := 120;
              Columns[10].Alignment         := taCenter;
              Columns[10].Title.Alignment   := taCenter;
              Columns[10].Title.Font.Color  := clBlack;

            end;


end;

procedure T_frmAgenda.tsAbertosShow(Sender: TObject);
begin

            // SE SELECIONAR A PAGINA ABERTOS
            _Sql := 'select controle_agendamento.num_agendamento,historico_agendamento.id_historicoagendamento, historico_agendamento.data_agendada, '+
            'historico_agendamento.hora_agendada, historico_agendamento.valor_unitario, historico_agendamento.valor_total, '+
            'historico_agendamento.codigomovimento, historico_agendamento.datafechamento, clientes.cli_nome, '+
            'funcionarios.func_nome, servicos.serv_nome, historico_agendamento.id_cliente, historico_agendamento.id_servico, '+
            'historico_agendamento.id_funcionario, historico_agendamento.id_formapagto, historico_agendamento.id_agendamento, '+
            'historico_agendamento.quantidade, historico_agendamento.datacad, historico_agendamento.mesano FROM '+
            'historico_agendamento inner join clientes on (historico_agendamento.id_cliente = clientes.cli_id) '+
            'inner join controle_agendamento on (historico_agendamento.id_agendamento = controle_agendamento.num_agendamento) '+
            'inner join servicos on (historico_agendamento.id_servico = servicos.serv_id) inner join funcionarios '+
            'on (historico_agendamento.id_funcionario = funcionarios.func_id) WHERE historico_agendamento.codigomovimento = :pCodMov '+
            'ORDER BY controle_agendamento.num_agendamento';


            with dm_DadosSegundo.cds_HistoricoAgendamento do
            begin

              Close;
              CommandText:= (_Sql);
              Params.ParamByName('pCodMov').AsString:= 'AB';
              Open;

            end;


            btn_Retorna_Periodo_Abertos.Enabled     := True;
            

            //FORMATANDO O VALOR DO CAMPO valor_unitario COMO CURRENCY
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_unitario')).DisplayFormat:= '###,##0.00';
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_total')).DisplayFormat:= '###,##0.00';


            with Grid_Pesquisa_EmAbertos do
            begin

              DataSource:=  dm_DadosSegundo.ds_HistoricoAgendamento;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName         := 'NUM_AGENDAMENTO';
              Columns[0].Title.Caption     := 'Agendamento';
              Columns[0].Width             := 95;
              Columns[0].Alignment         := taCenter;
              Columns[0].Title.Alignment   := taCenter;
              Columns[0].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[1].FieldName         := 'CODIGOMOVIMENTO';
              Columns[1].Title.Caption     := 'Status';
              Columns[1].Width             := 60;
              Columns[1].Alignment         := taCenter;
              Columns[1].Title.Alignment   := taCenter;
              Columns[1].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[2].FieldName         := 'CLI_NOME';
              Columns[2].Title.Caption     := 'Cliente';
              Columns[2].Width             := 300;
              Columns[2].Alignment         := taLeftJustify;
              Columns[2].Title.Alignment   := taLeftJustify;
              Columns[2].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[3].FieldName         := 'SERV_NOME';
              Columns[3].Title.Caption     := 'Serviço';
              Columns[3].Width             := 200;
              Columns[3].Alignment         := taLeftJustify;
              Columns[3].Title.Alignment   := taLeftJustify;
              Columns[3].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[4].FieldName         := 'DATA_AGENDADA';
              Columns[4].Title.Caption     := 'Data Agendada';
              Columns[4].Width             := 120;
              Columns[4].Alignment         := taCenter;
              Columns[4].Title.Alignment   := taCenter;
              Columns[4].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[5].FieldName         := 'HORA_AGENDADA';
              Columns[5].Title.Caption     := 'Hora Agendada';
              Columns[5].Width             := 120;
              Columns[5].Alignment         := taCenter;
              Columns[5].Title.Alignment   := taCenter;
              Columns[5].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[6].FieldName         := 'valor_unitario';
              Columns[6].Title.Caption     := 'Valor Serviço';
              Columns[6].Width             := 120;
              Columns[6].Alignment         := taRightJustify;
              Columns[6].Title.Alignment   := taRightJustify;
              Columns[6].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[7].FieldName         := 'QUANTIDADE';
              Columns[7].Title.Caption     := 'Quantidade';
              Columns[7].Width             := 80;
              Columns[7].Alignment         := taCenter;
              Columns[7].Title.Alignment   := taRightJustify;
              Columns[7].Title.Font.Color  := clBlack;


              Columns.Add;
              Columns[8].FieldName         := 'valor_total';
              Columns[8].Title.Caption     := 'Valor Total';
              Columns[8].Width             := 120;
              Columns[8].Alignment         := taRightJustify;
              Columns[8].Title.Alignment   := taRightJustify;
              Columns[8].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[9].FieldName         := 'FUNC_NOME';
              Columns[9].Title.Caption     := 'Atendido Por';
              Columns[9].Width             := 150;
              Columns[9].Alignment         := taRightJustify;
              Columns[9].Title.Alignment   := taRightJustify;
              Columns[9].Title.Font.Color  := clBlack;


            end;

end;

procedure T_frmAgenda.tsFechamentoShow(Sender: TObject);
begin

            // SE SELECIONAR A PAGINA FECHAMENTO
            _Sql := 'select controle_agendamento.num_agendamento,historico_agendamento.id_historicoagendamento, historico_agendamento.data_agendada, '+
            'historico_agendamento.hora_agendada, historico_agendamento.valor_unitario, historico_agendamento.valor_total, '+
            'historico_agendamento.codigomovimento, historico_agendamento.datafechamento, clientes.cli_nome, '+
            'funcionarios.func_nome, servicos.serv_nome, historico_agendamento.id_cliente, historico_agendamento.id_servico, '+
            'historico_agendamento.id_funcionario, historico_agendamento.id_formapagto, historico_agendamento.id_agendamento, '+
            'historico_agendamento.quantidade, historico_agendamento.datacad, historico_agendamento.mesano FROM '+
            'historico_agendamento inner join clientes on (historico_agendamento.id_cliente = clientes.cli_id) '+
            'inner join controle_agendamento on (historico_agendamento.id_agendamento = controle_agendamento.num_agendamento) '+
            'inner join servicos on (historico_agendamento.id_servico = servicos.serv_id) inner join funcionarios '+
            'on (historico_agendamento.id_funcionario = funcionarios.func_id) WHERE historico_agendamento.codigomovimento = :pCodMov '+
            'ORDER BY controle_agendamento.num_agendamento';


            with dm_DadosSegundo.cds_HistoricoAgendamento do
            begin

              Close;
              CommandText:= (_Sql);
              Params.ParamByName('pCodMov').AsString:= 'AB';
              Open;

            end;

            db_CodHistoricoFechamento.DataSource   := dm_DadosSegundo.ds_HistoricoAgendamento;
            db_CodHistoricoFechamento.DataField    := 'ID_HISTORICOAGENDAMENTO';

            db_NomeClienteFechamento.DataField     := 'CLI_NOME';
            db_NomeClienteFechamento.DataSource    := dm_DadosSegundo.ds_HistoricoAgendamento;

            db_NomeServicoFechamento.DataField     := 'SERV_NOME';
            db_NomeServicoFechamento.DataSource    := dm_DadosSegundo.ds_HistoricoAgendamento;

            db_Cliente.DataField                   := 'CLI_NOME';
            db_Cliente.DataSource                  := dm_DadosSegundo.ds_HistoricoAgendamento;

            db_DataAnterior.DataField              := 'DATA_AGENDADA';
            db_DataAnterior.DataSource             := dm_DadosSegundo.ds_HistoricoAgendamento;

            db_HoraAnterior.DataField              := 'HORA_AGENDADA';
            db_HoraAnterior.DataSource             := dm_DadosSegundo.ds_HistoricoAgendamento;


            btn_Retorna_Fechamento.Enabled         := True;


            //FORMATANDO O VALOR DO CAMPO valor_unitario COMO CURRENCY
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_unitario')).DisplayFormat:= '###,##0.00';
            TCurrencyField(dm_DadosSegundo.cds_HistoricoAgendamento.FieldByName('valor_total')).DisplayFormat:= '###,##0.00';


            with Grid_Fechamento do
            begin

              DataSource:=  dm_DadosSegundo.ds_HistoricoAgendamento;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName         := 'NUM_AGENDAMENTO';
              Columns[0].Title.Caption     := 'Agendamento';
              Columns[0].Width             := 95;
              Columns[0].Alignment         := taCenter;
              Columns[0].Title.Alignment   := taCenter;
              Columns[0].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[1].FieldName         := 'CODIGOMOVIMENTO';
              Columns[1].Title.Caption     := 'Status';
              Columns[1].Width             := 60;
              Columns[1].Alignment         := taCenter;
              Columns[1].Title.Alignment   := taCenter;
              Columns[1].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[2].FieldName         := 'CLI_NOME';
              Columns[2].Title.Caption     := 'Cliente';
              Columns[2].Width             := 300;
              Columns[2].Alignment         := taLeftJustify;
              Columns[2].Title.Alignment   := taLeftJustify;
              Columns[2].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[3].FieldName         := 'SERV_NOME';
              Columns[3].Title.Caption     := 'Serviço';
              Columns[3].Width             := 200;
              Columns[3].Alignment         := taLeftJustify;
              Columns[3].Title.Alignment   := taLeftJustify;
              Columns[3].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[4].FieldName         := 'DATA_AGENDADA';
              Columns[4].Title.Caption     := 'Data Agendada';
              Columns[4].Width             := 120;
              Columns[4].Alignment         := taCenter;
              Columns[4].Title.Alignment   := taCenter;
              Columns[4].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[5].FieldName         := 'HORA_AGENDADA';
              Columns[5].Title.Caption     := 'Hora Agendada';
              Columns[5].Width             := 120;
              Columns[5].Alignment         := taCenter;
              Columns[5].Title.Alignment   := taCenter;
              Columns[5].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[6].FieldName         := 'valor_unitario';
              Columns[6].Title.Caption     := 'Valor Serviço';
              Columns[6].Width             := 120;
              Columns[6].Alignment         := taRightJustify;
              Columns[6].Title.Alignment   := taRightJustify;
              Columns[6].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[7].FieldName         := 'QUANTIDADE';
              Columns[7].Title.Caption     := 'Quantidade';
              Columns[7].Width             := 80;
              Columns[7].Alignment         := taCenter;
              Columns[7].Title.Alignment   := taRightJustify;
              Columns[7].Title.Font.Color  := clBlack;


              Columns.Add;
              Columns[8].FieldName         := 'valor_total';
              Columns[8].Title.Caption     := 'Valor Total';
              Columns[8].Width             := 120;
              Columns[8].Alignment         := taRightJustify;
              Columns[8].Title.Alignment   := taRightJustify;
              Columns[8].Title.Font.Color  := clBlack;

              Columns.Add;
              Columns[9].FieldName         := 'FUNC_NOME';
              Columns[9].Title.Caption     := 'Atendido Por';
              Columns[9].Width             := 150;
              Columns[9].Alignment         := taRightJustify;
              Columns[9].Title.Alignment   := taRightJustify;
              Columns[9].Title.Font.Color  := clBlack;


            end;


end;

procedure T_frmAgenda.tsAgendamentoShow(Sender: TObject);
begin


            _Sql:= 'select * from historico_agendamento';
            
            with dm_DadosSegundo.cds_HistoricoAgendamento do
            begin

              Close;
              CommandText:= (_Sql);
              Open;

            end;


end;

end.

