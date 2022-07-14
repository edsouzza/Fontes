unit U_Agenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ComCtrls, RxCalc, Calendar, RXClock, ToolEdit, RXDBCtrl, DB, DBClient,
  Provider, FMTBcd, CurrEdit, RXSpin, DateUtils, Menus, ImgList, jpeg;

type
  TF_AGENDA = class(TForm)
    pan_titulo: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    pan_botoes: TPanel;
    btnAgendar: TSpeedButton;
    btnExcluirAgendamento: TSpeedButton;
    btnSair: TSpeedButton;
    pangrid_agendar: TPanel;
    pangrid_agendados: TPanel;
    GridAgendamentos: TDBGrid;
    calendarioAgendamentos: TMonthCalendar;
    grid_funcionarios: TDBGrid;
    lst_Horarios: TListBox;
    Label2: TLabel;
    lblRegistroAtual: TLabel;
    Label4: TLabel;
    btnVisualizarPorAno: TSpeedButton;
    panel_ano_mes_status: TPanel;
    cmbAnos: TComboBox;
    lstMesesDoAno: TListBox;
    cmbSTATUS: TComboBox;
    Label5: TLabel;
    btnVisualizarPorMes: TSpeedButton;
    btnFecharAgendamento: TSpeedButton;
    btnFiltrarPorMesEAno: TSpeedButton;
    edtHistorico: TMemo;
    memoHistorico: TMemo;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    edtDataSelecionada: TEdit;
    img_grid_funcionarios: TImage;
    Label6: TLabel;
    DBLISTANOMES: TDBLookupComboBox;
    Label7: TLabel;
    lblStatusLogoff: TLabel;

    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAgendarClick(Sender: TObject);
    procedure btnVisualizarPorAnoClick(Sender: TObject);
    procedure GridAgendamentosCellClick(Column: TColumn);
    procedure btnVisualizarPorMesClick(Sender: TObject);
    procedure btnFecharAgendamentoClick(Sender: TObject);
    procedure grid_funcionariosCellClick(Column: TColumn);
    procedure lst_HorariosClick(Sender: TObject);
    procedure edtHistoricoChange(Sender: TObject);
    procedure btnFiltrarPorMesEAnoClick(Sender: TObject);
    procedure btnExcluirAgendamentoClick(Sender: TObject);
    procedure edtHistoricoEnter(Sender: TObject);
    procedure calendarioAgendamentosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    //MEUS PROCEDIMENTOS
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure PreencherComboAnos;
    procedure SetarMesEAnoVigente;
    procedure MostrarAgendamentosMesSelecionado;
    procedure GravarAgendamento;
    procedure FecharAgendamento;
    procedure ExcluirAgendamento;
    procedure controlesDefaultTelaAgendamento;
    procedure controlesDefaultTelaPrincipal;
    procedure PopulandoGridAgendamentosSelecionadosPorMes;
    procedure PopulandoGridAgendamentosSelecionadosPorAno;
    procedure PopulandoGridAgendamentosSelecionadosPorMesAno;
    procedure PopularGridFuncionariosParaAgendamento;
    procedure PopularListaFuncionariosParaPesquisa;
    procedure FecharAgendamentosVencidos;
    procedure GridAgendamentosTitleClick(Column: TColumn);
    procedure CompararDatas;


  private
    { Private declarations }
    Id_Agendamento : integer;
    mesSelecionado, mesSelecionadoAbreviado ,anoSelecionado, AnoAtual, statusSelecionado, agendadoPor, historico, horaSelecionada  : string;
    FiltrouPorMesAno, FiltrouPorMes, FiltrouPorAno, Agendou, CancelouAgendamento : boolean;
    dataAgendada : Tdate;


  public
    { Public declarations }
  end;

var
  F_AGENDA: TF_AGENDA;

implementation

uses  U_dmDados, U_dmPesquisas, U_dmDadosSegundo, U_BiblioSysSalao, U_principal;

{$R *.dfm}

{ TF_AGENDA }

procedure TF_AGENDA.FormCreate(Sender: TObject);
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
    lblStatusLogoff.Caption     := NomeDoUsuarioLogado;
    lblDataDoDia.Caption        := DateToStr(now);
    lblHoraAtual.Caption        := timetoStr(time);
    calendarioAgendamentos.Date := date;
    cdsTable                    := dm_pesq.cdsPesqAgendamentos;
    AbrirTabelas;
    PreencherComboAnos;

end;

procedure TF_AGENDA.FormShow(Sender: TObject);
begin

  //fecha agendamentos vencidos
  FecharAgendamentosVencidos;

  PopularListaFuncionariosParaPesquisa;
  Caption := 'LOGADO POR '+NomeDoUsuarioLogado;

  //verifica se é o primeiro acesso se for desabilita os botões de consulta
  if TabelaEstaVazia('AGENDA')then
  begin

       btnVisualizarPorMes.Enabled    := false;
       btnVisualizarPorAno.Enabled    := false;
       btnFiltrarPorMesEAno.Enabled   := false;
       panel_ano_mes_status.Enabled   := false;
       pan_titulo.Caption             := 'SEJA BEM VINDO FAÇA SEU PRIMEIRO AGENDAMENTO!';

  end else
  begin

    PopulandoGridAgendamentosSelecionadosPorMes;

  end;
  
end;

procedure TF_AGENDA.PopulandoGridAgendamentosSelecionadosPorMes;
begin

      MostrarAgendamentosMesSelecionado;
      FiltrouPorMes                := true;
      btnVisualizarPorMes.Caption  := 'Voltar';
      btnAgendar.Enabled           := false;
      btnVisualizarPorAno.Enabled  := false;
      panel_ano_mes_status.Enabled := false;
      btnFiltrarPorMesEAno.Enabled := false;
      panel_ano_mes_status.Enabled := false;
      sNomeSelecionado             := DBLISTANOMES.Text;
      btnVisualizarPorMes.Glyph.LoadFromFile('imagens\voltar.bmp');

      if(DBLISTANOMES.Text='')then
      begin
           _Sql := 'SELECT * FROM agenda WHERE ag_mes = :pMes and status = :pStatus ORDER BY ag_dtagendada, ag_hora';

            if(cmbSTATUS.Text = 'ABERTO')then
            begin
                pan_titulo.Caption  := 'AGENDAMENTOS ABERTOS MÊS '+mesSelecionado;
            end else begin
                pan_titulo.Caption  := 'AGENDAMENTOS FECHADOS MÊS '+mesSelecionado;
            end;

      end else
      begin
           //COM NOME DE USUARIO SELECIONADO
           _Sql := 'SELECT * FROM agenda WHERE ag_mes = :pMes and status = :pStatus and agendadopara=:pAgendado ORDER BY ag_dtagendada, ag_hora';

            if(cmbSTATUS.Text = 'ABERTO')then
            begin
                pan_titulo.Caption:= 'ABERTOS '+mesSelecionado+' - '+sNomeSelecionado;
            end else begin
                pan_titulo.Caption:= 'FECHADOS '+mesSelecionado+' - '+sNomeSelecionado;
            end;
      end;

          with cdsTable do
          begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pMes').Asstring    := mesSelecionado;
            Params.ParamByName('pStatus').Asstring := statusSelecionado;

            if(DBLISTANOMES.Text<>'')then
            begin
               Params.ParamByName('pAgendado').Asstring := sNomeSelecionado;
            end;

            Open;

                if not IsEmpty then
                begin

                     GridAgendamentos.Enabled := true;
                     agendadoPor := cdsTable.Fields[1].asstring;

                end else begin

                     GridAgendamentos.Enabled := false;

                end;
          end;

          with GridAgendamentos do
          begin

            DataSource:=  dm_pesq.dsPesqAgendamentos;
            Columns.Clear;

            Columns.Add;
            Columns[0].FieldName         := 'AGENDA_ID';
            Columns[0].Title.Caption     := 'COD.';
            Columns[0].Width             := 60;
            Columns[0].Alignment         := taCenter;
            Columns[0].Title.Alignment   := taCenter;
            Columns[0].Title.Font.Style  := [fsBold];
            Columns[0].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[1].FieldName         := 'AGENDADOPARA';
            Columns[1].Title.Caption     := 'AGENDADO PARA';
            Columns[1].Width             := 300;
            Columns[1].Alignment         := taLeftJustify;
            Columns[1].Title.Alignment   := taLeftJustify;
            Columns[1].Title.Font.Style  := [fsBold];
            Columns[1].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[2].FieldName         := 'AG_DTAGENDADA';
            Columns[2].Title.Caption     := 'DATA';
            Columns[2].Width             := 80;
            Columns[2].Alignment         := taCenter;
            Columns[2].Title.Alignment   := taCenter;
            Columns[2].Title.Font.Style  := [fsBold];
            Columns[2].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[3].FieldName         := 'AG_HORA';
            Columns[3].Title.Caption     := 'HORA';
            Columns[3].Width             := 60;
            Columns[3].Alignment         := taCenter;
            Columns[3].Title.Alignment   := taCenter;
            Columns[3].Title.Font.Style  := [fsBold];
            Columns[3].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[4].FieldName         := 'AGENDADOPOR';
            Columns[4].Title.Caption     := 'AGENDADO POR';
            Columns[4].Width             := 300;
            Columns[4].Alignment         := taLeftJustify;
            Columns[4].Title.Alignment   := taLeftJustify;
            Columns[4].Title.Font.Style  := [fsBold];
            Columns[4].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[5].FieldName         := 'AG_DTAGENDAMENTO';
            Columns[5].Title.Caption     := 'AGENDADA EM';
            Columns[5].Width             := 100;
            Columns[5].Alignment         := taCenter;
            Columns[5].Title.Alignment   := taCenter;
            Columns[5].Title.Font.Style  := [fsBold];
            Columns[5].Title.Font.Color  := clWhite;


          end;

end;

procedure TF_AGENDA.PopulandoGridAgendamentosSelecionadosPorAno;
begin

      MostrarAgendamentosMesSelecionado;
      lstMesesDoAno.ItemIndex      := -1;
      FiltrouPorAno                := true;
      btnVisualizarPorAno.Caption  := 'Voltar';
      btnAgendar.Enabled           := false;
      btnVisualizarPorMes.Enabled  := false;
      btnFecharAgendamento.Enabled := false;
      btnFiltrarPorMesEAno.Enabled := false;
      panel_ano_mes_status.Enabled := false;
      sNomeSelecionado             := DBLISTANOMES.Text;
      btnVisualizarPorAno.Glyph.LoadFromFile('imagens\btn_inicio.bmp');

      if(DBLISTANOMES.Text='')then
      begin
           _Sql := 'SELECT * FROM agenda WHERE ag_ano = :pAno and status = :pStatus ORDER BY ag_dtagendada, ag_hora';

            if(cmbSTATUS.Text = 'ABERTO')then
            begin
                pan_titulo.Caption:= 'AGENDAMENTOS ABERTOS DE '+anoSelecionado;
            end else begin
                pan_titulo.Caption:= 'AGENDAMENTOS FECHADOS DE '+anoSelecionado;
            end;
      end else begin
           _Sql := 'SELECT * FROM agenda WHERE ag_ano = :pAno and status = :pStatus and agendadopara=:pAgendado ORDER BY ag_dtagendada, ag_hora';

            if(cmbSTATUS.Text = 'ABERTO')then
            begin
                pan_titulo.Caption:= 'AGENDAMENTOS ABERTOS DE '+sNomeSelecionado+' EM '+anoSelecionado;
            end else begin
                pan_titulo.Caption:= 'AGENDAMENTOS FECHADOS DE '+sNomeSelecionado+' EM '+anoSelecionado;
            end;
      end;

          with cdsTable do
          begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pAno').Asstring      := anoSelecionado;
            Params.ParamByName('pStatus').Asstring   := statusSelecionado;

            if(DBLISTANOMES.Text<>'')then
            begin
               Params.ParamByName('pAgendado').Asstring := sNomeSelecionado;
            end;

            Open;

                if not IsEmpty then
                begin

                     GridAgendamentos.Enabled := true;
                     agendadoPor := cdsTable.Fields[1].asstring;

                end else begin

                     GridAgendamentos.Enabled := false;

                end;
          end;

          //USE ESTAS CONFIGURACOES COMO BASE PARA AS OUTRAS DUAS
          with GridAgendamentos do
          begin

            DataSource:=  dm_pesq.dsPesqAgendamentos;
            Columns.Clear;

            Columns.Add;
            Columns[0].FieldName         := 'AGENDA_ID';
            Columns[0].Title.Caption     := 'COD.';
            Columns[0].Width             := 60;
            Columns[0].Alignment         := taCenter;
            Columns[0].Title.Alignment   := taCenter;
            Columns[0].Title.Font.Style  := [fsBold];
            Columns[0].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[1].FieldName         := 'AGENDADOPARA';
            Columns[1].Title.Caption     := 'AGENDADO PARA';
            Columns[1].Width             := 300;
            Columns[1].Alignment         := taLeftJustify;
            Columns[1].Title.Alignment   := taLeftJustify;
            Columns[1].Title.Font.Style  := [fsBold];
            Columns[1].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[2].FieldName         := 'AG_DTAGENDADA';
            Columns[2].Title.Caption     := 'DATA';
            Columns[2].Width             := 80;
            Columns[2].Alignment         := taCenter;
            Columns[2].Title.Alignment   := taCenter;
            Columns[2].Title.Font.Style  := [fsBold];
            Columns[2].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[3].FieldName         := 'AG_HORA';
            Columns[3].Title.Caption     := 'HORA';
            Columns[3].Width             := 60;
            Columns[3].Alignment         := taCenter;
            Columns[3].Title.Alignment   := taCenter;
            Columns[3].Title.Font.Style  := [fsBold];
            Columns[3].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[4].FieldName         := 'AGENDADOPOR';
            Columns[4].Title.Caption     := 'AGENDADO POR';
            Columns[4].Width             := 300;
            Columns[4].Alignment         := taLeftJustify;
            Columns[4].Title.Alignment   := taLeftJustify;
            Columns[4].Title.Font.Style  := [fsBold];
            Columns[4].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[5].FieldName         := 'AG_DTAGENDAMENTO';
            Columns[5].Title.Caption     := 'AGENDADA EM';
            Columns[5].Width             := 100;
            Columns[5].Alignment         := taCenter;
            Columns[5].Title.Alignment   := taCenter;
            Columns[5].Title.Font.Style  := [fsBold];
            Columns[5].Title.Font.Color  := clWhite;

          end;

end;


procedure TF_AGENDA.PopulandoGridAgendamentosSelecionadosPorMesAno;
begin

      MostrarAgendamentosMesSelecionado;
      FiltrouPorMesAno             := true;
      btnVisualizarPorMes.Enabled  := false;
      btnVisualizarPorAno.Enabled  := false;
      btnAgendar.Enabled           := false;
      btnFiltrarPorMesEAno.Caption := 'Voltar';
      panel_ano_mes_status.Enabled := false;
      panel_ano_mes_status.Enabled := false;
      sNomeSelecionado             := DBLISTANOMES.Text;
      btnFiltrarPorMesEAno.Glyph.LoadFromFile('imagens\btn_inicio.bmp');

   
          if(DBLISTANOMES.Text='')then
          begin
                _Sql := 'SELECT * FROM agenda WHERE ag_mesano = :pMesAno and status = :pStatus ORDER BY ag_dtagendada, ag_hora';

                if(cmbSTATUS.Text = 'ABERTO')then
                begin
                    pan_titulo.Caption  := 'ABERTOS DE '+mesAnoSelecionado;
                end else begin
                    pan_titulo.Caption  := 'FECHADOS DE '+mesAnoSelecionado;
                end;

          end else
          begin
               //COM NOME DE USUARIO SELECIONADO
               _Sql := 'SELECT * FROM agenda WHERE ag_mesano = :pMesAno and status = :pStatus and agendadopara=:pAgendado ORDER BY ag_dtagendada, ag_hora';

                if(cmbSTATUS.Text = 'ABERTO')then
                begin
                    pan_titulo.Caption:= 'ABERTOS '+mesAnoSelecionado+' PARA '+sNomeSelecionado;
                end else begin
                    pan_titulo.Caption:= 'FECHADOS '+mesAnoSelecionado+' PARA '+sNomeSelecionado;
                end;
          end;


          with cdsTable do
          begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pMesAno').Asstring := mes_ano;
            Params.ParamByName('pStatus').Asstring := statusSelecionado;
            
            if(DBLISTANOMES.Text<>'')then
            begin
               Params.ParamByName('pAgendado').Asstring := sNomeSelecionado;
            end;

            Open;

                if not IsEmpty then
                begin

                     GridAgendamentos.Enabled := true;
                     agendadoPor := cdsTable.Fields[1].asstring;

                end else begin

                     GridAgendamentos.Enabled := false;

                end;
          end;

          with GridAgendamentos do
          begin

            DataSource:=  dm_pesq.dsPesqAgendamentos;
            Columns.Clear;

           Columns.Add;
            Columns[0].FieldName         := 'AGENDA_ID';
            Columns[0].Title.Caption     := 'COD.';
            Columns[0].Width             := 60;
            Columns[0].Alignment         := taCenter;
            Columns[0].Title.Alignment   := taCenter;
            Columns[0].Title.Font.Style  := [fsBold];
            Columns[0].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[1].FieldName         := 'AGENDADOPARA';
            Columns[1].Title.Caption     := 'AGENDADO PARA';
            Columns[1].Width             := 300;
            Columns[1].Alignment         := taLeftJustify;
            Columns[1].Title.Alignment   := taLeftJustify;
            Columns[1].Title.Font.Style  := [fsBold];
            Columns[1].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[2].FieldName         := 'AG_DTAGENDADA';
            Columns[2].Title.Caption     := 'DATA';
            Columns[2].Width             := 80;
            Columns[2].Alignment         := taCenter;
            Columns[2].Title.Alignment   := taCenter;
            Columns[2].Title.Font.Style  := [fsBold];
            Columns[2].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[3].FieldName         := 'AG_HORA';
            Columns[3].Title.Caption     := 'HORA';
            Columns[3].Width             := 60;
            Columns[3].Alignment         := taCenter;
            Columns[3].Title.Alignment   := taCenter;
            Columns[3].Title.Font.Style  := [fsBold];
            Columns[3].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[4].FieldName         := 'AGENDADOPOR';
            Columns[4].Title.Caption     := 'AGENDADO POR';
            Columns[4].Width             := 300;
            Columns[4].Alignment         := taLeftJustify;
            Columns[4].Title.Alignment   := taLeftJustify;
            Columns[4].Title.Font.Style  := [fsBold];
            Columns[4].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[5].FieldName         := 'AG_DTAGENDAMENTO';
            Columns[5].Title.Caption     := 'AGENDADA EM';
            Columns[5].Width             := 100;
            Columns[5].Alignment         := taCenter;
            Columns[5].Title.Alignment   := taCenter;
            Columns[5].Title.Font.Style  := [fsBold];
            Columns[5].Title.Font.Color  := clWhite;


          end;

end;

procedure TF_AGENDA.btnFiltrarPorMesEAnoClick(Sender: TObject);
begin

   if(btnFiltrarPorMesEAno.Caption = 'Voltar')then
   begin
       SetarMesEAnoVigente;
       cmbSTATUS.ItemIndex            := 0;
       btnFecharAgendamento.Enabled   := false;
       btnExcluirAgendamento.Enabled  := false;
       btnVisualizarPorMes.Enabled    := true;
       btnVisualizarPorAno.Enabled    := true;
       FiltrouPorMesAno               := false;
       btnAgendar.Enabled             := true;
       panel_ano_mes_status.Enabled   := true;
       GridAgendamentos.DataSource    := nil;
       GridAgendamentos.Enabled       := false;
       DBLISTANOMES.KeyValue          :=0;
       btnFecharAgendamento.Hint      := '';
       btnExcluirAgendamento.Hint     := '';
       memoHistorico.Cursor           := crDefault;
       btnFiltrarPorMesEAno.Caption   := 'Filtrar por Mês / Ano';
       pan_titulo.Caption             := 'DEFINA SUA CONSULTA PARA VISUALIZAR';
       btnFiltrarPorMesEAno.Glyph.LoadFromFile('imagens\btn_pesquisa.bmp');
       memoHistorico.Clear;

   end else begin

       PopulandoGridAgendamentosSelecionadosPorMesAno;

   end;

end;

procedure TF_AGENDA.btnVisualizarPorMesClick(Sender: TObject);
begin

   if(btnVisualizarPorMes.Caption = 'Voltar')then
   begin
       SetarMesEAnoVigente;
       cmbSTATUS.ItemIndex             := 0;
       btnFecharAgendamento.Enabled    := false;
       btnExcluirAgendamento.Enabled   := false;
       btnFiltrarPorMesEAno.Enabled    := true;
       btnVisualizarPorMes.Enabled     := true;
       btnVisualizarPorAno.Enabled     := true;
       btnAgendar.Enabled              := true;
       panel_ano_mes_status.Enabled    := true;
       memoHistorico.Cursor            := crDefault;
       btnVisualizarPorMes.Caption     := 'Filtrar por Mês';
       GridAgendamentos.DataSource     := nil;
       GridAgendamentos.Enabled        := false;
       DBLISTANOMES.KeyValue           :=0;
       FiltrouPorMes                   := false;
       pan_titulo.Caption              := 'DEFINA SUA CONSULTA PARA VISUALIZAR';
       btnVisualizarPorMes.Glyph.LoadFromFile('imagens\BOOKOPEN.bmp');
       memoHistorico.Clear;
       btnFecharAgendamento.Hint      := '';
       btnExcluirAgendamento.Hint     := '';

   end else begin

       PopulandoGridAgendamentosSelecionadosPorMes;

   end;

end;

procedure TF_AGENDA.btnVisualizarPorAnoClick(Sender: TObject);
begin

   if(btnVisualizarPorAno.Caption = 'Voltar')then
   begin
       SetarMesEAnoVigente;
       cmbSTATUS.ItemIndex            := 0;
       btnFecharAgendamento.Enabled   := false;
       btnExcluirAgendamento.Enabled := false;
       btnVisualizarPorMes.Enabled    := true;
       btnFiltrarPorMesEAno.Enabled   := true;
       btnAgendar.Enabled             := true;
       panel_ano_mes_status.Enabled   := true;
       btnVisualizarPorAno.Caption    := 'Filtrar por Ano';
       GridAgendamentos.DataSource    := nil;
       GridAgendamentos.Enabled       := false;
       DBLISTANOMES.KeyValue          :=0;
       FiltrouPorAno                  := false;
       memoHistorico.Cursor           := crDefault;
       pan_titulo.Caption             := 'DEFINA SUA CONSULTA PARA VISUALIZAR';
       btnVisualizarPorAno.Glyph.LoadFromFile('imagens\btn_Calendario.bmp');
       memoHistorico.Clear;
       btnFecharAgendamento.Hint      := '';
       btnExcluirAgendamento.Hint     := '';

   end else begin

       PopulandoGridAgendamentosSelecionadosPorAno;

   end;

end;

procedure TF_AGENDA.btnAgendarClick(Sender: TObject);
begin

     if(btnAgendar.Caption = 'Gravar')then
     begin

         GravarAgendamento;

     end else
     begin
       //caso o caption do botão seja 'Agendar'
       pangrid_agendar.BringToFront;
       PopularGridFuncionariosParaAgendamento;
       pan_titulo.Caption           := 'DEFINA A DATA';
       lblRegistroAtual.Visible     := true;
       lblRegistroAtual.Caption     := 'AGENDAMENTO '+inttostr(GerarProximoID('agenda_id','agenda'))+' PARA:';
       agendando                    := true;
       btnAgendar.Caption           := 'Gravar';
       btnAgendar.Enabled           := false;
       btnSair.Enabled              := false;
       btnFiltrarPorMesEAno.Enabled := false;
       btnVisualizarPorMes.Enabled  := false;
       btnVisualizarPorAno.Enabled  := false;
       btnFecharAgendamento.Enabled := true;  //opção de cancelamento
       btnFecharAgendamento.Caption := 'Cancelar';
       btnFecharAgendamento.Glyph.LoadFromFile('imagens\btn_inicio.bmp');
       btnAgendar.Glyph.LoadFromFile('imagens\btn_gravar.bmp');

       controlesDefaultTelaAgendamento;

     end;

end;

procedure TF_AGENDA.btnSairClick(Sender: TObject);
begin
     close;   
end;

procedure TF_AGENDA.AbrirTabelas;
begin
dm_DadosSegundo.cds_Agendamentos.Active  := true;
end;

procedure TF_AGENDA.FecharAbrirTabelas;
begin
dm_DadosSegundo.cds_Agendamentos.Active  := true;
dm_DadosSegundo.cds_Agendamentos.Active  := false;
end;

procedure TF_AGENDA.FecharTabelas;
begin
dm_DadosSegundo.cds_Agendamentos.Active  := false;
end;

procedure TF_AGENDA.PreencherComboAnos;
var
  i : integer;
begin

     //setando o ano vigente na comboano
     DataDoDia    := date;
     AnoAtual     := IntToStr(YearOf(DataDoDia));

     //populando a comboano com os anos
     for i := 2000 to 3000 do
     begin

          cmbAnos.Items.Add(inttostr(i));

     end;

     //setando o ano atual
     cmbAnos.ItemIndex := Integer(cmbAnos.Items.IndexOf(AnoAtual));

     //setando o mes atual
     SetarMesEAnoVigente;

end;

procedure TF_AGENDA.SetarMesEAnoVigente;
begin

     //setar o mes vigente na TListBox
     lstMesesDoAno.ItemIndex := retornaNumMes-1;

     //setando o ano vigente no combo anos
     cmbAnos.ItemIndex := Integer(cmbAnos.Items.IndexOf(AnoAtual));

end;

procedure TF_AGENDA.MostrarAgendamentosMesSelecionado;
begin
   // mesSelecionado, anoSelecionado, AnoAtual, statusSelecionado  ShowMessage('status selecionado: '+ statusSelecionado);
   mesSelecionadoAbreviado := copy(lstMesesDoAno.Items[lstMesesDoAno.itemindex],0,3);
   mesSelecionado          := lstMesesDoAno.Items[lstMesesDoAno.itemindex];
   anoSelecionado          := cmbAnos.text;
   statusSelecionado       := cmbSTATUS.text;
   mes_ano                 := mesSelecionadoAbreviado+'/'+anoSelecionado;
   mesAnoSelecionado       := mesSelecionado+'/'+anoSelecionado;

end;

procedure TF_AGENDA.GridAgendamentosCellClick(Column: TColumn);
begin

    //AO CLICAR NO REGISTRO MOSTRAR O NOME DE QUEM AGENDOU
    Id_Agendamento                 := cdsTable.Fields[0].AsInteger;  //campo ID
    agendadoPor                    := cdsTable.Fields[1].asstring;  // nome do usuario logado que agendou o registro
    memoHistorico.Text             := cdsTable.Fields[9].asstring;  //campo historico
    btnFecharAgendamento.Hint      := 'Fechar o agendamento selecionado';
    btnExcluirAgendamento.Hint     := 'Cancelar o agendamento selecionado';
    btnExcluirAgendamento.Enabled  := true;
    btnAgendar.Enabled             := false;
    memoHistorico.Cursor           := crHandPoint;

    //LIBERAR O BOTAO FECHAR SOMENTE SE O AGENDAMENTO ESTIVER ABERTO
    if (AgendamentoAberto(Id_Agendamento))then
     btnFecharAgendamento.Enabled   := true;

end;

procedure TF_AGENDA.grid_funcionariosCellClick(Column: TColumn);
begin
    nomeParaAgendamento            :=  dm_Conexao.cds_DadosFuncionarios.fieldbyname('func_nome').AsString;
    lst_Horarios.Enabled           := true;
    calendarioAgendamentos.Enabled := false;
    pan_titulo.Caption             := 'SELECIONE A HORA';
end;

procedure TF_AGENDA.PopularGridFuncionariosParaAgendamento;
begin

     _Sql := 'SELECT func_id, func_nome FROM funcionarios WHERE func_id > 1 ORDER BY func_nome';

          with dm_Conexao.cds_DadosFuncionarios do
          begin

            Close;
            CommandText:= (_Sql);
            Open;

          end;

          with grid_funcionarios do
          begin

            DataSource:=  dm_Conexao.ds_DadosFuncionarios;
            Columns.Clear;

            Columns.Add;
            Columns[0].FieldName         := 'FUNC_NOME';
            Columns[0].Title.Caption     := '';
            Columns[0].Width             := 460;
            Columns[0].Alignment         := taLeftJustify;
            Columns[0].Title.Alignment   := taLeftJustify;
            Columns[0].Title.Font.Style  := [fsBold];
            Columns[0].Title.Font.Color  := clWhite;

          end;


end;

procedure TF_AGENDA.PopularListaFuncionariosParaPesquisa;
begin

      _Sql := 'SELECT func_id, func_nome FROM funcionarios WHERE func_id > 1 ORDER BY func_nome';

      with dm_Conexao.cds_DadosFuncionarios do
      begin

         Close;
         CommandText:= (_Sql);
         Open;

         //PREENCHENDO O DBLISTANOMES COM NOMES DOS FUNCIONARIOS A QUEM SERÃO DESTINADOS OS AGENDAMENTOS
         DBLISTANOMES.ListField   := 'FUNC_NOME';
         DBLISTANOMES.ListSource  := dm_Conexao.ds_DadosFuncionarios;
         DBLISTANOMES.KeyField    :='FUNC_ID';
         DBLISTANOMES.KeyValue    := 0;

      end;

end;

procedure TF_AGENDA.lst_HorariosClick(Sender: TObject);
begin

  lst_Horarios.Enabled       := false;
  edtHistorico.Enabled       := true;
  pan_titulo.Caption         := 'DESCREVA O ASSUNTO';
  grid_funcionarios.Enabled  := false;
  edtHistorico.SetFocus;

end;

procedure TF_AGENDA.edtHistoricoChange(Sender: TObject);
begin
  btnAgendar.Enabled:=true;
end;

procedure TF_AGENDA.controlesDefaultTelaPrincipal;
begin
     //coloca os controles em estado inicial da tela principal
     if(FiltrouPorAno)then
     begin  
       cmbSTATUS.ItemIndex            := 0;
       btnFecharAgendamento.Enabled   := false;
       btnExcluirAgendamento.Enabled  := false;
       btnVisualizarPorMes.Enabled    := true;
       btnFiltrarPorMesEAno.Enabled   := true;
       btnAgendar.Enabled             := true;
       panel_ano_mes_status.Enabled   := true;
       btnVisualizarPorAno.Caption    := 'Filtrar por Ano';
       GridAgendamentos.DataSource    := nil;
       GridAgendamentos.Enabled       := false;
       pan_titulo.Caption             := 'DEFINA SUA CONSULTA PARA VISUALIZAR';
       btnVisualizarPorAno.Glyph.LoadFromFile('imagens\btn_Calendario.bmp');
       memoHistorico.Clear;
       SetarMesEAnoVigente;

     end else if(FiltrouPorMesAno)then
     begin
       cmbSTATUS.ItemIndex            := 0;
       btnFecharAgendamento.Enabled   := false;
       btnExcluirAgendamento.Enabled  := false;
       btnVisualizarPorMes.Enabled    := true;
       btnVisualizarPorAno.Enabled    := true;
       btnAgendar.Enabled             := true;
       panel_ano_mes_status.Enabled   := true;
       btnFiltrarPorMesEAno.Caption   := 'Filtrar por Mês / Ano';
       GridAgendamentos.DataSource    := nil;
       GridAgendamentos.Enabled       := false;
       pan_titulo.Caption             := 'DEFINA SUA CONSULTA PARA VISUALIZAR';
       btnFiltrarPorMesEAno.Glyph.LoadFromFile('imagens\btn_pesquisa.bmp');
       SetarMesEAnoVigente;
       memoHistorico.Clear;

     end else if(FiltrouPorMes)then
     begin
       cmbSTATUS.ItemIndex            := 0;
       btnFecharAgendamento.Enabled   := false;
       btnExcluirAgendamento.Enabled  := false;
       btnFiltrarPorMesEAno.Enabled   := true;
       btnVisualizarPorMes.Enabled    := true;
       btnVisualizarPorAno.Enabled    := true;
       btnAgendar.Enabled             := true;
       panel_ano_mes_status.Enabled   := true;
       btnVisualizarPorMes.Caption    := 'Filtrar por Mês';
       GridAgendamentos.DataSource    := nil;
       GridAgendamentos.Enabled       := false;
       pan_titulo.Caption             := 'DEFINA SUA CONSULTA PARA VISUALIZAR';
       btnVisualizarPorMes.Glyph.LoadFromFile('imagens\BOOKOPEN.bmp');
       SetarMesEAnoVigente;
       memoHistorico.Clear;

     end else if(Agendou)then
     begin
       cmbSTATUS.ItemIndex            := 0;
       btnFecharAgendamento.Enabled   := false;
       btnExcluirAgendamento.Enabled  := false;
       btnFiltrarPorMesEAno.Enabled   := true;
       btnVisualizarPorMes.Enabled    := true;
       btnVisualizarPorAno.Enabled    := true;
       btnAgendar.Enabled             := true;
       btnSair.Enabled                := true;
       panel_ano_mes_status.Enabled   := true;
       btnFecharAgendamento.Caption   := 'Fechar';
       GridAgendamentos.DataSource    := nil;
       GridAgendamentos.Enabled       := false;
       pan_titulo.Caption             := 'DEFINA SUA CONSULTA PARA VISUALIZAR';
       btnFecharAgendamento.Glyph.LoadFromFile('imagens\btn_Ok.bmp');
       SetarMesEAnoVigente;
       memoHistorico.Clear;

     end else if(CancelouAgendamento)then
     begin
       cmbSTATUS.ItemIndex            := 0;
       btnFecharAgendamento.Enabled   := false;
       btnExcluirAgendamento.Enabled := false;
       btnFiltrarPorMesEAno.Enabled   := true;
       btnVisualizarPorMes.Enabled    := true;
       btnVisualizarPorAno.Enabled    := true;
       btnSair.Enabled                := true;
       panel_ano_mes_status.Enabled   := true;
       btnAgendar.Enabled             := true;
       btnAgendar.Caption             := 'Agendar';
       btnFecharAgendamento.Caption   := 'Fechar';
       GridAgendamentos.DataSource    := nil;
       GridAgendamentos.Enabled       := false;
       pan_titulo.Caption             := 'DEFINA SUA CONSULTA PARA VISUALIZAR';
       btnFecharAgendamento.Glyph.LoadFromFile('imagens\btn_Ok.bmp');
       SetarMesEAnoVigente;
       memoHistorico.Clear;

     end;      

     Agendou                  := false;
     CancelouAgendamento      := false;
     FiltrouPorAno            := false;
     FiltrouPorMesAno         := false;
     FiltrouPorMes            := false;
     lblRegistroAtual.Visible := false;
     
     pangrid_agendados.BringToFront;
     lblRegistroAtual.SendToBack;

end;

procedure TF_AGENDA.btnExcluirAgendamentoClick(Sender: TObject);
begin

  //CANCELA O AGENDAMENTO SELECIONADO POR QUALQUER CONSULTA - OBS: ESTES REGISTROS NÃO SERÃO VISTOS EM NENHUMA CONSULTA A PARTIR DESSE MOMENTO
  ExcluirAgendamento;

end;

procedure TF_AGENDA.controlesDefaultTelaAgendamento;
begin

     //coloca os controles em estado inicial
     edtHistorico.Clear;
     edtDataSelecionada.Clear;
     calendarioAgendamentos.Date    := date;
     calendarioAgendamentos.Enabled := true;
     grid_funcionarios.Visible      := false;
     img_grid_funcionarios.Visible  := true;
     lst_Horarios.ItemIndex         := -1;
     lst_Horarios.Enabled           := false;
     edtHistorico.Enabled           := false;
     edtHistorico.SelStart          := Perform(EM_LINEINDEX, 0, 0);   //abrir sempre na primeira linha do memo

end;

procedure TF_AGENDA.btnFecharAgendamentoClick(Sender: TObject);
begin

     if(btnFecharAgendamento.Caption = 'Cancelar')then
     begin

       CancelouAgendamento := true;
       texto:= 'O agendamento em curso foi cancelado com sucesso?';
       messagedlg(texto,mtWarning,[mbok],0);
       controlesDefaultTelaAgendamento;
       controlesDefaultTelaPrincipal;             

     end else if(btnFecharAgendamento.Caption = 'Fechar')then
     begin

       FecharAgendamento;
       controlesDefaultTelaPrincipal;

     end;

end;

procedure TF_AGENDA.GravarAgendamento;
begin
         //SETANDO OS DADOS PARA CADASTRAMENTO DO AGENDAMENTO
         mesSelecionado          := retornaNomeMesPassandoData(calendarioAgendamentos.Date);
         anoSelecionado          := retornaAnoPassandoData(calendarioAgendamentos.Date);
         mes_ano                 := gerarMesAnoPassandoData(calendarioAgendamentos.Date);  //EX: MAI/2020
         horaSelecionada         := lst_Horarios.Items[lst_Horarios.itemindex];
         historico               := LetrasIniciaisMaiusculas(edtHistorico.Text);
         dataAgendada            := calendarioAgendamentos.Date;

         _Sql := 'insert into agenda (agenda_id, agendadopor, agendadopara, ag_dtagendada, ag_hora, ag_mes, ag_ano, ag_mesano, ag_dtagendamento, ag_historico, status) '+
                            'values (:agenda_id, :agendadopor, :agendadopara, :ag_dtagendada, :ag_hora, :ag_mes, :ag_ano, :ag_mesano, :ag_dtagendamento, :ag_historico, :status)';

         with DM_Pesq.Qry_Auxiliar do
         begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             ParamByName('agenda_id').AsInteger           :=  GerarProximoID('agenda_id','agenda');
             ParamByName('agendadopor').AsString          :=  NomeDoUsuarioLogado;
             ParamByName('agendadopara').AsString         :=  nomeParaAgendamento;
             ParamByName('ag_dtagendada').AsDate          :=  dataAgendada;
             ParamByName('ag_hora').AsString              :=  horaSelecionada;
             ParamByName('ag_mes').AsString               :=  mesSelecionado; // nome completo do mes
             ParamByName('ag_ano').AsString               :=  anoSelecionado; // ano do cadastro
             ParamByName('ag_mesano').AsString            :=  mes_ano;
             ParamByName('ag_dtagendamento').AsDate       :=  DataDoDia;
             ParamByName('ag_historico').AsString         :=  historico;
             ParamByName('status').AsString               :=  'ABERTO';
             ExecSQL;

        end;

       Application.MessageBox('Agendamento cadastrado com sucesso!', 'Novo Agendamento', MB_OK);
       FecharAbrirTabelas;
       btnAgendar.Caption := 'Agendar';
       edtHistorico.Clear;
       agendando := false;
       Agendou   := true;
       controlesDefaultTelaPrincipal;

end;

procedure TF_AGENDA.FecharAgendamento;
var
  texto : string;
begin
       //procedimento de fechamento do agendamento
       texto:= 'Confirma a conclusão desse agendamento?';

       if Application.MessageBox(PChar(texto),'Fechando Agendamento...',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

            With DM_Pesq.Qry_Geral do begin

               close;
               sql.Clear;
               sql.Add('UPDATE agenda SET status =  '+QuotedStr('FECHADO')+' WHERE agenda_id = :pIdAgendamento');
               Params.ParamByName('pIdAgendamento').AsInteger := Id_Agendamento;
               ExecSQL();

            end;

            Application.MessageBox('Agendamento fechado com sucesso!', 'Fechando Agendamento', MB_OK);
            btnFiltrarPorMesEAno.Enabled:= true;
            FecharAbrirTabelas;

       end;

       controlesDefaultTelaPrincipal;

end;

procedure TF_AGENDA.ExcluirAgendamento;
var
  texto : string;
begin  
       {procedimento : excluir agendamento - obs: o registro será excluido definitivamente da tabela pois não aparecerá em nenhum tipo de consulta após sua execução
       As consultas baseiam-se nos status ABERTO/FECHADO}

       texto:= 'Confirma a exclusão permanente desse agendamento?';

       if Application.MessageBox(PChar(texto),'Excluindo Agendamento...',MB_YESNO + MB_ICONERROR) = IdYes then
       begin

            //excluindo registro definitivamente da tabela para otimização da mesma
            DeletarRegistro('AGENDA','agenda_id',IntToStr(Id_Agendamento));

            Application.MessageBox('Agendamento excluído com sucesso!', 'Excluindo Agendamento', MB_OK);
            CancelouAgendamento := true;
            FecharAbrirTabelas;
            controlesDefaultTelaPrincipal;

       end else begin

            controlesDefaultTelaPrincipal;

       end;

end;


procedure TF_AGENDA.edtHistoricoEnter(Sender: TObject);
begin
  if(btnAgendar.Caption = 'Gravar')then
  begin
       btnAgendar.Enabled:= true;
  end;
end;

procedure TF_AGENDA.CompararDatas;
Var
 DataAtual, DataAgendamento: TDate;
 Value: Integer;
Begin
 DataAtual       := StrToDate(FormatDateTime('dd/mm/yyyy', Now));
 DataAgendamento := calendarioAgendamentos.Date;

 Value := CompareDate(DataAtual, DataAgendamento);
 
 If Value = 0 then
 begin

    //MessageDlg('A Data Atual coincide com a Data de Agendamento!', mtInformation, [mbOK], 0);
    grid_funcionarios.Enabled      := true;
    pan_titulo.Caption             := 'SELECIONE UM NOME';
    grid_funcionarios.Visible      := true;
    lblRegistroAtual.BringToFront;

 end else If Value = 1 then
 begin

    //MessageDlg('A Data Atual é superior a Data de Agendamento!', mtInformation, [mbOK], 0);
    Application.MessageBox('Data do Agendamento deve ser maior ou igual a data atual!', 'Data inválida para Agendamento', MB_ICONEXCLAMATION);
    calendarioAgendamentos.Date   := date;
    grid_funcionarios.Visible     := false;
    img_grid_funcionarios.Visible := true;

 end else
 begin

    //MessageDlg('A Data Atual é inferior a Data de Agendamento!', mtInformation, [mbOK], 0);
    grid_funcionarios.Enabled      := true;
    pan_titulo.Caption             := 'SELECIONE UM NOME';
    grid_funcionarios.Visible      := true;
    lblRegistroAtual.BringToFront;

 end;

end;


procedure TF_AGENDA.calendarioAgendamentosClick(Sender: TObject);
begin

  edtDataSelecionada.Text        := DateToStr(calendarioAgendamentos.Date);
  CompararDatas;

end;

procedure TF_AGENDA.GridAgendamentosTitleClick(Column: TColumn);
begin

    //AO CLICAR NA COLUNA CLASSIFICAR PELA MESMA
    cdsTable.IndexFieldNames := Column.FieldName;

end;

procedure TF_AGENDA.FecharAgendamentosVencidos;
begin
//VERIFICA SE TEM AGENDAMENTOS VENCIDOS E ABERTOS E FECHA TODOS ATÉ A DATA ANTERIOR AO DIA ATUAL

    With DM_Pesq.Qry_Geral do begin

       close;
       sql.Clear;
       sql.Add('UPDATE agenda SET status = '+QuotedStr('FECHADO')+' WHERE ag_dtagendada < :pAgendamentoVencido');
       Params.ParamByName('pAgendamentoVencido').AsDate := now;
       ExecSQL();

    end;

end;


end.

