unit U_Agendamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ComCtrls, RxCalc, Calendar, RXClock, ToolEdit, RXDBCtrl, DB, DBClient,
  Provider, FMTBcd, CurrEdit, RXSpin, DateUtils, Menus, ImgList;

type
  T_frmAgendamentos = class(TForm)
    pan_titulo: TPanel;
    pan_botoes: TPanel;
    btnSairDoAgendamento: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    btnCancelarGravacaoDoAgendamento: TSpeedButton;
    btnGravarAgendamento: TSpeedButton;
    lbl45: TLabel;
    lblStatusLogoff: TLabel;
    pnl_cabecalho: TPanel;
    GroupBox1: TGroupBox;
    lst_Horarios: TListBox;
    gr_dataagendada: TGroupBox;
    calendario: TDateTimePicker;
    grid_clientes: TDBGrid;
    gr_dadosdoAgendamento: TGroupBox;
    txt_MostraNomeCliente: TStaticText;
    txt_MostraDataAgendada: TStaticText;
    txt_MostraHoraAgendada: TStaticText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedtCLI_ID: TDBEdit;
    btnGerenciarAgendamentos: TSpeedButton;
    GroupBox2: TGroupBox;
    edt_Nome: TEdit;
    lblStatus: TLabel;
    btnAgendarNaoCliente: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure HabilitarBotoes;
    procedure DesabilitarBotoes;
    procedure btnSairDoAgendamentoClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure Abrir_FecharTabelas;
    procedure FormShow(Sender: TObject);
    procedure btnSairDeGravarAgendamentoClick(Sender: TObject);
    procedure btnNovoAgendamentoClick(Sender: TObject);
    procedure lst_HorariosClick(Sender: TObject);
    procedure edt_QuantidadeDeServicosKeyPress(Sender: TObject;
      var Key: Char);
    procedure btnGravarAgendamentoClick(Sender: TObject);
    procedure btnCancelarGravacaoDoAgendamentoClick(Sender: TObject);
    procedure grid_clientesCellClick(Column: TColumn);
    procedure calendarioChange(Sender: TObject);
    procedure dbFUNC_NOMEClick(Sender: TObject);
    procedure VerificarSeTemAgendamentoAbertoNoHorarioAgendado;
    procedure GravarAgendamento;
    procedure PopularGridClientes;
    procedure btnGerenciarAgendamentosClick(Sender: TObject);
    procedure PesquisaPorNome;
    procedure edt_NomeChange(Sender: TObject);
    procedure btnAgendarNaoClienteClick(Sender: TObject);
    procedure edt_NomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    Id_Funcionario, IDCliente, proxNum  : Integer;
    TelCliente, CelCliente: string;

  public
    { Public declarations }


  end;

var
  _frmAgendamentos: T_frmAgendamentos;



implementation

uses U_dmDados, U_Clientes, U_BiblioSysSalao,  U_dmPesquisas,  U_ListaAgendamentosAbertos, U_AgendamentoNaoClientes,
  U_dmDadosSegundo;

{$R *.dfm}


procedure T_frmAgendamentos.FormCreate(Sender: TObject);
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

    lblDataDoDia.Caption     := DateToStr(now);
    lblHoraAtual.Caption     := timetoStr(time);
    lblStatusLogoff.Caption  := IdentificarUsuarioLogado;
    calendario.Date          := date;
    Id_Funcionario           := IdFuncionarioLogado('status');
    AbrirTabelas;
    PopularGridClientes;
    

end;


procedure T_frmAgendamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    Release;

end;


procedure T_frmAgendamentos.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmAgendamentos.HabilitarBotoes;
var
  i : Integer;
begin

       //Habilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= true;
      end;


end;


procedure T_frmAgendamentos.DesabilitarBotoes;
var
  i : Integer;
begin

      //Desabilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= false;
      end;


end;


procedure T_frmAgendamentos.btnSairDoAgendamentoClick(Sender: TObject);
begin

      close;
      HabilitarBotoes;

end;


procedure T_frmAgendamentos.AbrirTabelas;
begin

      dm_Conexao.cds_DadosClientes.Active              := True;
      dm_Conexao.cds_DadosFuncionarios.Active          := True;
      dm_DadosSegundo.cds_Agendamentos.Active          := True;

end;


procedure T_frmAgendamentos.FecharTabelas;
begin

      dm_Conexao.cds_DadosClientes.Active              := False;
      dm_Conexao.cds_DadosFuncionarios.Active          := False;
      dm_DadosSegundo.cds_Agendamentos.Active          := False;

end;


procedure T_frmAgendamentos.Abrir_FecharTabelas;
begin

     dm_Conexao.cds_DadosClientes.Active               := False;
     dm_Conexao.cds_DadosClientes.Active               := True;

     dm_DadosSegundo.cds_Agendamentos.Active           := False;
     dm_DadosSegundo.cds_Agendamentos.Active           := True;

end;


procedure T_frmAgendamentos.FormShow(Sender: TObject);
begin

    calendario.Date:= Now;

    //Mostrando o número do agendamento no título
    btnCancelarGravacaoDoAgendamento.Enabled := False;
    btnGravarAgendamento.Enabled             := False;
    edt_nome.SetFocus;

end;


procedure T_frmAgendamentos.btnSairDeGravarAgendamentoClick(Sender: TObject);
begin

    Close;

end;


procedure T_frmAgendamentos.btnNovoAgendamentoClick(Sender: TObject);
begin

       calendario.Enabled:= true;
      
end;


procedure T_frmAgendamentos.edt_QuantidadeDeServicosKeyPress(Sender: TObject;
  var Key: Char);
begin

      // PARA DBEDIT ACEITAR APENAS NUMEROS
      If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmAgendamentos.btnCancelarGravacaoDoAgendamentoClick(
  Sender: TObject);
begin

      dm_DadosSegundo.cds_Agendamentos.Cancel;
      btnCancelarGravacaoDoAgendamento.Enabled := false;
      btnGravarAgendamento.Enabled             := false;
      btnGerenciarAgendamentos.Enabled         := true;
      btnSairDoAgendamento.Enabled             := true;
      gr_dataagendada.Enabled                  := false;
      lst_Horarios.Enabled                     := false;
      txt_MostraNomeCliente.Caption            := '';
      txt_MostraDataAgendada.Caption           := '';
      txt_MostraHoraAgendada.Caption           := '';
      calendario.Date                          := date;
      edt_nome.Clear;
      edt_nome.SetFocus;

end;

procedure T_frmAgendamentos.lst_HorariosClick(Sender: TObject);
begin

     //edt_HoraAgendada recebe o horario selecionado
     txt_MostraHoraAgendada.caption           := lst_Horarios.Items[lst_Horarios.itemindex];

     btnCancelarGravacaoDoAgendamento.Enabled := true;
     btnGravarAgendamento.Enabled             := true;

     btnGerenciarAgendamentos.Enabled         := false;
     btnSairDoAgendamento.Enabled             := false;

     lblStatus.Caption                        :='Escolha abaixo, gravar ou desistir no botão limpar!';


end;


procedure T_frmAgendamentos.GravarAgendamento;
var
  DataAtual     : TDate;
  dataEscolhida : string;
begin

          DataAtual     := date;
          dataEscolhida := DateToStr(calendario.Date);

          With DM_Pesq.qry_Cod do begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_agendamento) from agendamentos');
              Open;

              if not IsEmpty then begin

                 proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

          end;


         if calendario.Date < DataAtual then
         begin

             Application.MessageBox('A data de agendamento não pode ser menor que a data atual!', 'Atenção data inválida', MB_OK);
             exit;

         end else begin

               MostrarMesEAno(dataEscolhida);  //PARA O CAMPO MESANO

              _Sql :=  'INSERT INTO agendamentos (id_agendamento,cliente,agendadopor,telefone,celular,data_agendada,hora_agendada,cadastrado,mesano,status) '+
                       'VALUES (:pID, :pCliente, :pAgendadopor, :pTel, :pCel, :pdtAgendada, :phrAgendada, :pCad, :pMesano, :pStatus)';

              With DM_Pesq.Qry_Geral do
              begin

                Close;
                SQL.Clear;
                SQL.Add(_sql);
                Params.ParamByName('pID').AsInteger          := proxNum;
                Params.ParamByName('pCliente').AsString      := txt_MostraNomeCliente.caption;
                Params.ParamByName('pAgendadopor').AsInteger := Id_Funcionario;
                Params.ParamByName('pTel').AsString          := TelCliente;
                Params.ParamByName('pCel').AsString          := CelCliente;
                Params.ParamByName('pdtAgendada').AsDateTime := calendario.Date;
                Params.ParamByName('phrAgendada').AsString   := txt_MostraHoraAgendada.caption;
                Params.ParamByName('pCad').AsString          := 'S';
                Params.ParamByName('pMesano').AsString       := mes_ano;
                Params.ParamByName('pStatus').AsString       := 'ABERTO';
                ExecSQL;

             end;

               btnCancelarGravacaoDoAgendamento.Enabled := false;
               btnGravarAgendamento.Enabled             := false;
               gr_dataagendada.Enabled                  := false;
               lst_Horarios.Enabled                     := false;
               txt_MostraNomeCliente.Caption            := '';
               txt_MostraDataAgendada.Caption           := '';
               txt_MostraHoraAgendada.Caption           := '';

            Application.MessageBox('Agendamento gravado com sucesso!', 'OK', MB_OK);

            LogOperacoes(NomeDoUsuarioLogado, 'agendamento de cliente');

       end;

end;


procedure T_frmAgendamentos.VerificarSeTemAgendamentoAbertoNoHorarioAgendado;
begin

      _Sql := 'SELECT data_agendada, hora_agendada, status FROM agendamentos '+
              'WHERE data_agendada = :pData AND hora_agendada = :pHora AND '+
              'status = :pStatus Order by data_agendada';      

         with DM_Pesq.Qry_Geral do begin

           Close;
           SQL.Clear;
           SQL.Add(_Sql);
           Params.ParamByName('pData').AsDateTime := calendario.Date;
           Params.ParamByName('pHora').AsString   := txt_MostraHoraAgendada.Caption;
           Params.ParamByName('pStatus').AsString := 'ABERTO';
           Open;

              if IsEmpty then
              begin

                    GravarAgendamento;

                    edt_nome.Clear;
                    edt_nome.SetFocus;
                    calendario.Date := date;
                    gr_dataagendada.Enabled           := false;
                    lblStatus.Caption                 :='Escolha o nome do cliente ou digite para filtrar';
                    btnSairDoAgendamento.Enabled      := true;
                    btnGerenciarAgendamentos.Enabled  := true;

              end
              else begin

                   Application.MessageBox('Essa data e hora já estão agendados por favor escolha outro horário!', 'Atenção horário ocupado', MB_OK);
                   txt_MostraHoraAgendada.Caption    := '';
                   gr_dataagendada.Enabled           := true;
                   lblStatus.Caption                 := 'Escolha outro dia ou hora!';
                   exit;

              end;

         end;

end;


procedure T_frmAgendamentos.btnGravarAgendamentoClick(Sender: TObject);
begin

    VerificarSeTemAgendamentoAbertoNoHorarioAgendado;

end;

procedure T_frmAgendamentos.grid_clientesCellClick(Column: TColumn);
begin

    txt_MostraNomeCliente.Caption := DM_Pesq.cdsPesqCliente.FieldByName('cli_nome').AsString;
    edt_Nome.text                 := DM_Pesq.cdsPesqCliente.FieldByName('cli_nome').AsString;
    IDCliente                     := DM_Pesq.cdsPesqCliente.FieldByName('cli_id').AsInteger;
    TelCliente                    := DM_Pesq.cdsPesqCliente.FieldByName('cli_fone').AsString;
    CelCliente                    := DM_Pesq.cdsPesqCliente.FieldByName('cli_fone4').AsString;
    gr_dataagendada.Enabled       := true;
    lblStatus.Caption             :='Escolha a data do agendamento';

end;

procedure T_frmAgendamentos.calendarioChange(Sender: TObject);
begin

    if calendario.Date < date then
    begin

        lblStatus.Caption :=('A data do agendamento não pode ser anterior a data atual!');   
        exit;

    end else begin

         lblStatus.Caption :=('Escolha o horário do agendamento!');
         txt_MostraDataAgendada.Caption := DateToStr(calendario.Date);
         lst_Horarios.Enabled := true;

    end;

end;

procedure T_frmAgendamentos.dbFUNC_NOMEClick(Sender: TObject);
begin

    gr_dataagendada.Enabled := true;

end;



procedure T_frmAgendamentos.PopularGridClientes;
begin


          //MOSTRA TODOS OS CLIENTES COM EXCEÇAÕ DO CODBARRAS E INATIVOS

            with DM_Pesq.cdsPesqCliente do begin

                Close;
                CommandText:= ('SELECT * FROM clientes WHERE cli_nome <> :pCliNome AND cli_status = :pStatus ORDER BY cli_nome');
                Params.ParamByName('pCliNome').AsString := 'CODBARRAS';
                Params.ParamByName('pStatus').AsString  := 'A';
                Open;

            end;

            dbedtCLI_ID.DataSource         :=  DM_Pesq.dsPesqCliente;
            dbedtCLI_ID.DataField          := 'CLI_ID';
             
            with Grid_Clientes do
            begin

              DataSource :=  DM_Pesq.dsPesqCliente;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName         := 'CLI_NOME';
              Columns[0].Width             := 380;
              Columns[0].Alignment         := taLeftJustify;
              Columns[0].Title.caption     := 'CLIENTES CADASTRADOS';
              Columns[0].Title.Alignment   := taCenter;
              Columns[0].Title.Font.Style  := [fsBold];
              Columns[0].Title.Font.Color  := clred;

            end;


end;

procedure T_frmAgendamentos.btnGerenciarAgendamentosClick(Sender: TObject);
begin

      Application.CreateForm(T_frmListaAgendamentos,  _frmListaAgendamentos);
      _frmListaAgendamentos.ShowModal;
      FreeAndNil(_frmListaAgendamentos);

      Release;
      close;     

end;


procedure T_frmAgendamentos.PesquisaPorNome;
var
  nome : string;
begin

       nome := edt_Nome.Text;

      _Sql  := 'SELECT * FROM clientes WHERE cli_nome <> '+QuotedStr('CODBARRAS')+' AND '+
                          'cli_status = '+QuotedStr('A')+' AND  cli_nome LIKE (''%'+nome+'%'') ORDER BY cli_nome';

      with DM_Pesq.cdsPesqCliente do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

end;


procedure T_frmAgendamentos.edt_NomeChange(Sender: TObject);
begin

    PesquisaPorNome;      
    txt_MostraNomeCliente.Caption := DM_Pesq.cdsPesqCliente.FieldByName('cli_nome').AsString;
    gr_dataagendada.Enabled       := true;
    lblStatus.Caption             :='Escolha a data do agendamento';

end;

procedure T_frmAgendamentos.btnAgendarNaoClienteClick(Sender: TObject);
begin

      _frmAgendamentos.hide;

      Application.CreateForm(T_frmAgendamentosNaoClientes,  _frmAgendamentosNaoClientes);
      _frmAgendamentosNaoClientes.ShowModal;
      FreeAndNil(_frmAgendamentosNaoClientes);

      Release;
      close;

end;

procedure T_frmAgendamentos.edt_NomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

    if key=vk_return then
    begin

        edt_nome.Clear;    

    end;

end;

end.

