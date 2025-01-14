unit U_AgendamentoNaoClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ComCtrls, RxCalc, Calendar, RXClock, ToolEdit, RXDBCtrl, DB, DBClient,
  Provider, FMTBcd, CurrEdit, RXSpin, DateUtils, Menus, ImgList;

type
  T_frmAgendamentosNaoClientes = class(TForm)
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
    btnGerenciarAgendamentos: TSpeedButton;
    GroupBox2: TGroupBox;
    edt_Nome: TEdit;
    lblStatus: TLabel;
    gr_dadosdoAgendamento: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txt_MostraNomeCliente: TStaticText;
    txt_MostraDataAgendada: TStaticText;
    txt_MostraHoraAgendada: TStaticText;
    dbedtCLI_ID: TDBEdit;
    txt_MostraNomeFuncionario: TStaticText;
    Label4: TLabel;
    Label5: TLabel;
    msk_Celular: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    msk_Fone: TMaskEdit;
    btnAgendarClientesCadastrados: TSpeedButton;
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
    procedure calendarioChange(Sender: TObject);
    procedure dbFUNC_NOMEClick(Sender: TObject);
    procedure VerificarSeTemAgendamentoAbertoNoHorarioAgendado;
    procedure GravarAgendamento;
    procedure btnGerenciarAgendamentosClick(Sender: TObject);
    procedure edt_NomeChange(Sender: TObject);
    procedure edt_NomeExit(Sender: TObject);
    procedure btnAgendarClientesCadastradosClick(Sender: TObject);
    
  private
    { Private declarations }
    Id_Funcionario, proxNum : integer;
  public
    { Public declarations }


  end;

var
  _frmAgendamentosNaoClientes: T_frmAgendamentosNaoClientes;

implementation

uses U_dmDados, U_Clientes, U_dmDadosSegundo, U_BiblioSysSalao,
  U_Fornecedores, U_dmPesquisas, U_ListaAgendamentosAbertos, U_Agendamentos;

{$R *.dfm}


procedure T_frmAgendamentosNaoClientes.FormCreate(Sender: TObject);
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

    //Recebe a data atual por padr�o

    lblDataDoDia.Caption     := DateToStr(now);
    lblHoraAtual.Caption     := timetoStr(time);
    AbrirTabelas;
    lblStatusLogoff.Caption  := IdentificarUsuarioLogado;
    calendario.Date          := date;
    Id_Funcionario           := IdFuncionarioLogado('status');

end;


procedure T_frmAgendamentosNaoClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    Release;

end;


procedure T_frmAgendamentosNaoClientes.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmAgendamentosNaoClientes.HabilitarBotoes;
var
  i : Integer;
begin

       //Habilitando os bot�es

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= true;
      end;


end;


procedure T_frmAgendamentosNaoClientes.DesabilitarBotoes;
var
  i : Integer;
begin

      //Desabilitando os bot�es

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= false;
      end;


end;


procedure T_frmAgendamentosNaoClientes.btnSairDoAgendamentoClick(Sender: TObject);
begin

      close;
      HabilitarBotoes;

end;


procedure T_frmAgendamentosNaoClientes.AbrirTabelas;
begin

      dm_Conexao.cds_DadosClientes.Active              := True;
      dm_Conexao.cds_DadosFuncionarios.Active          := True;
      dm_DadosSegundo.cds_Agendamentos.Active          := True;

end;


procedure T_frmAgendamentosNaoClientes.FecharTabelas;
begin

      dm_Conexao.cds_DadosClientes.Active              := False;
      dm_Conexao.cds_DadosFuncionarios.Active          := False;
      dm_DadosSegundo.cds_Agendamentos.Active          := False;

end;


procedure T_frmAgendamentosNaoClientes.Abrir_FecharTabelas;
begin

     dm_Conexao.cds_DadosClientes.Active               := False;
     dm_Conexao.cds_DadosClientes.Active               := True;

     dm_DadosSegundo.cds_Agendamentos.Active           := False;
     dm_DadosSegundo.cds_Agendamentos.Active           := True;

end;


procedure T_frmAgendamentosNaoClientes.FormShow(Sender: TObject);
begin

    calendario.Date:= Now;

    //Mostrando o n�mero do agendamento no t�tulo
    btnCancelarGravacaoDoAgendamento.Enabled := False;
    btnGravarAgendamento.Enabled             := False;
    edt_nome.SetFocus;

end;


procedure T_frmAgendamentosNaoClientes.btnSairDeGravarAgendamentoClick(Sender: TObject);
begin

    Close;

end;


procedure T_frmAgendamentosNaoClientes.btnNovoAgendamentoClick(Sender: TObject);
begin

       calendario.Enabled:= true;
      
end;


procedure T_frmAgendamentosNaoClientes.edt_QuantidadeDeServicosKeyPress(Sender: TObject;
  var Key: Char);
begin

      // PARA DBEDIT ACEITAR APENAS NUMEROS
      If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmAgendamentosNaoClientes.btnCancelarGravacaoDoAgendamentoClick(
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




procedure T_frmAgendamentosNaoClientes.lst_HorariosClick(Sender: TObject);
begin

     //edt_HoraAgendada recebe o horario selecionado
     txt_MostraHoraAgendada.caption           := lst_Horarios.Items[lst_Horarios.itemindex];

     btnCancelarGravacaoDoAgendamento.Enabled := true;
     btnGravarAgendamento.Enabled             := true;

     btnGerenciarAgendamentos.Enabled         := false;
     btnSairDoAgendamento.Enabled             := false;

     lblStatus.Caption                        :='Escolha abaixo, gravar ou desistir no bot�o limpar!';


end;

procedure T_frmAgendamentosNaoClientes.btnGravarAgendamentoClick(Sender: TObject);
begin

    VerificarSeTemAgendamentoAbertoNoHorarioAgendado;

end;

procedure T_frmAgendamentosNaoClientes.VerificarSeTemAgendamentoAbertoNoHorarioAgendado;
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
                    lblStatus.Caption                 :='Entre com o nome do cliente ';
                    btnSairDoAgendamento.Enabled      := true;
                    btnGerenciarAgendamentos.Enabled  := true;

              end
              else begin

                   Application.MessageBox('Essa data e hora j� est�o agendados por favor escolha outro hor�rio!', 'Aten��o hor�rio ocupado', MB_OK);
                   txt_MostraHoraAgendada.Caption    := '';
                   gr_dataagendada.Enabled           := true;
                   lblStatus.Caption                 := 'Escolha outro dia ou hora!';
                   exit;

              end;

         end;

end;

procedure T_frmAgendamentosNaoClientes.GravarAgendamento;
var
  DataAtual  : TDate;
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


          if calendario.Date < DataAtual then begin

               Application.MessageBox('A data de agendamento n�o pode ser menor que a data atual!', 'Aten��o data inv�lida', MB_OK);
               exit;

           end else begin

                 MostrarMesEAno(dataEscolhida);  //PARA O CAMPO MESANO

                 with dm_DadosSegundo.cds_Agendamentos do
                 begin

                    Append;
                    FieldByName('id_agendamento').AsInteger           := proxNum;
                    FieldByName('naocliente').AsString                := edt_Nome.Text;
                    FieldByName('agendadopor').AsInteger              := Id_Funcionario;
                    FieldByName('telefone').AsString                  := msk_Fone.Text;
                    FieldByName('celular').AsString                   := msk_Celular.Text;
                    FieldByName('Data_Agendada').AsDateTime           := calendario.Date;
                    FieldByName('Hora_Agendada').AsString             := txt_MostraHoraAgendada.caption;
                    FieldByName('cadastrado').AsString                := 'N';
                    FieldByName('status').AsString                    := 'ABERTO';
                    FieldByName('MesAno').AsString                    := mes_ano;
                    ApplyUpdates(0);

                 end;

                   btnCancelarGravacaoDoAgendamento.Enabled := false;
                   btnGravarAgendamento.Enabled             := false;
                   gr_dataagendada.Enabled                  := false;
                   lst_Horarios.Enabled                     := false;
                   txt_MostraNomeCliente.Caption            := '';
                   txt_MostraDataAgendada.Caption           := '';
                   txt_MostraHoraAgendada.Caption           := '';
                   msk_Celular.Text                         := '#####-####;1;_';
                   msk_Fone.Text                            := '#####-####;1;_';


                Application.MessageBox('Agendamento gravado com sucesso!', 'OK', MB_OK);
                
                LogOperacoes(NomeDoUsuarioLogado, 'agendamento de nao cliente');

            end;

end;





procedure T_frmAgendamentosNaoClientes.calendarioChange(Sender: TObject);
begin

    if calendario.Date < date then
    begin

        lblStatus.Caption :=('A data do agendamento n�o pode ser anterior a data atual!');
        exit;

    end else begin

         lblStatus.Caption :=('Escolha o hor�rio do agendamento!');
         txt_MostraDataAgendada.Caption := DateToStr(calendario.Date);
         lst_Horarios.Enabled := true;

    end;

end;

procedure T_frmAgendamentosNaoClientes.dbFUNC_NOMEClick(Sender: TObject);
begin

    gr_dataagendada.Enabled := true;

end;



procedure T_frmAgendamentosNaoClientes.btnGerenciarAgendamentosClick(Sender: TObject);
begin

      Application.CreateForm(T_frmListaAgendamentos,  _frmListaAgendamentos);
      _frmListaAgendamentos.ShowModal;
      FreeAndNil(_frmListaAgendamentos);

      Release;
      close;
      
end;


procedure T_frmAgendamentosNaoClientes.edt_NomeChange(Sender: TObject);
begin

    gr_dataagendada.Enabled       := true;
    lblStatus.Caption             :='Escolha a data do agendamento';

end;

procedure T_frmAgendamentosNaoClientes.edt_NomeExit(Sender: TObject);
begin

    txt_MostraNomeCliente.Caption := edt_Nome.Text;

end;

procedure T_frmAgendamentosNaoClientes.btnAgendarClientesCadastradosClick(
  Sender: TObject);
begin

      _frmAgendamentosNaoClientes.Hide;

      Application.CreateForm(T_frmAgendamentos,  _frmAgendamentos);
      _frmAgendamentos.ShowModal;
      FreeAndNil(_frmAgendamentos);

      Release;
      close;

end;

end.

