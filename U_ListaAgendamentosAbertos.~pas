unit U_ListaAgendamentosAbertos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ComCtrls;

type
  T_frmListaAgendamentos = class(TForm)
    pan_titulo: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    GridAgendamentosAbertos: TDBGrid;
    grp10: TGroupBox;
    GroupBox3: TGroupBox;
    calendarioAgendamentos: TMonthCalendar;
    btnImprimirAgendamento: TSpeedButton;
    btnFecharAgendamento: TSpeedButton;
    btnSair: TSpeedButton;
    btnCancelarAgendamento: TSpeedButton;
    lblStatus: TLabel;
    btnAgendamentos: TSpeedButton;
    lbl45: TLabel;
    lblStatusLogoff: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DesabilitarBotoes;
    procedure HabilitarBotoes;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure AbrirFecharTabelas;
    procedure PopulandoGridAgendamentosAbertosClientes;
    procedure btnSairClick(Sender: TObject);
    procedure calendarioAgendamentosClick(Sender: TObject);
    procedure FecharAgendamento;
    procedure CancelarAgendamento;
    procedure GridAgendamentosAbertosCellClick(Column: TColumn);
    procedure btnFecharAgendamentoClick(Sender: TObject);
    procedure btnImprimirAgendamentoClick(Sender: TObject);
    procedure btnCancelarAgendamentoClick(Sender: TObject);
    procedure btnAgendamentosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    Id_Agendamento, clicou : integer;
  public
    { Public declarations }

  end;

var
  _frmListaAgendamentos: T_frmListaAgendamentos;


implementation

uses U_dmDados, U_dmPesquisas, U_dmDadosSegundo,
  U_BiblioSysSalao, U_QRelClienteCompleto, U_QRelClienteParcial,
  U_Funcionarios, U_principal, DB,  U_Agendamentos, DBClient,
  U_QRelAgendamentosAbertos, U_EscolhaParaImpressaoDeAgendamentos;

{$R *.dfm}


procedure T_frmListaAgendamentos.FormCreate(Sender: TObject);
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
    lblDataDoDia.Caption           :=  DateToStr(date);
    lblHoraAtual.Caption           :=  timetoStr(time);
    lblStatusLogoff.Caption        := IdentificarUsuarioLogado;
    AbrirTabelas;
    calendarioAgendamentos.Date    := now;
    
    PopulandoGridAgendamentosAbertosClientes;

end;

procedure T_frmListaAgendamentos.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmListaAgendamentos.DesabilitarBotoes;
var
  i : Integer;
begin

   //Desabilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= false;
      end;

end;

procedure T_frmListaAgendamentos.HabilitarBotoes;
var
  i : Integer;
begin

       //Habilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= true;
      end;

end;

procedure T_frmListaAgendamentos.AbrirTabelas;
begin

    dm_DadosSegundo.cds_Agendamentos.Active := true;
    dm_pesq.cdsPesqAgendamentos.Active      := true;

end;


procedure T_frmListaAgendamentos.FecharTabelas;
begin

    dm_DadosSegundo.cds_Agendamentos.Active := false;
    dm_pesq.cdsPesqAgendamentos.Active      := false;

end;

procedure T_frmListaAgendamentos.AbrirFecharTabelas;
begin

    dm_DadosSegundo.cds_Agendamentos.Active  := false;
    dm_DadosSegundo.cds_Agendamentos.Active := true;

    dm_pesq.cdsPesqAgendamentos.Active       := false;
    dm_pesq.cdsPesqAgendamentos.Active       := true;

end;

procedure T_frmListaAgendamentos.calendarioAgendamentosClick(
  Sender: TObject);
begin

     btnFecharAgendamento.Enabled   := false;
     btnCancelarAgendamento.Enabled := false;
         
     PopulandoGridAgendamentosAbertosClientes;
     
     clicou := 1;

     if clicou = 1 then
     begin

         btnSair.Enabled := true;

     end;

end;


procedure T_frmListaAgendamentos.PopulandoGridAgendamentosAbertosClientes;
begin


         _Sql := 'SELECT a.*, f.func_id, f.func_nome FROM agendamentos a, funcionarios f '+
                 'WHERE data_agendada = :pDataAgendada AND func_id = a.agendadopor AND '+
                 'status = '+QuotedStr('ABERTO')+' ORDER BY data_agendada,hora_agendada';


          with dm_pesq.cdsPesqAgendamentos do
          begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pDataAgendada').AsDateTime := calendarioAgendamentos.Date;
            Open;

                if not IsEmpty then
                begin

                     GridAgendamentosAbertos.Enabled := true;
                     lblStatus.Caption               := IntToStr(dm_pesq.cdsPesqAgendamentos.RecordCount) +'  Agendamento(s) encontrado(s) nesta data!';

                end else begin

                     GridAgendamentosAbertos.Enabled := false;    
                     lblStatus.Caption               := 'Não foram encontrados agendamentos nesta data!';

                end;


                with GridAgendamentosAbertos do
                begin

                      DataSource:=  dm_pesq.dsPesqAgendamentos;
                      Columns.Clear;

                      Columns.Add;
                      Columns[0].FieldName         := 'CLIENTE';
                      Columns[0].Title.Caption     := 'CLIENTE';
                      Columns[0].Width             := 220;
                      Columns[0].Alignment         := taLeftJustify;
                      Columns[0].Title.Alignment   := taLeftJustify;
                      Columns[0].Title.Font.Style  := [fsBold];
                      Columns[0].Title.Font.Color  := clWhite;

                      Columns.Add;
                      Columns[1].FieldName         := 'NAOCLIENTE';
                      Columns[1].Title.Caption     := 'NÃO CLIENTE';
                      Columns[1].Width             := 200;
                      Columns[1].Alignment         := taLeftJustify;
                      Columns[1].Title.Alignment   := taLeftJustify;
                      Columns[1].Title.Font.Style  := [fsBold];
                      Columns[1].Title.Font.Color  := clWhite;

                      Columns.Add;
                      Columns[2].FieldName         := 'TELEFONE';
                      Columns[2].Title.Caption     := 'TELEFONE';
                      Columns[2].Width             := 80;
                      Columns[2].Alignment         := taLeftJustify;
                      Columns[2].Title.Alignment   := taLeftJustify;
                      Columns[2].Title.Font.Style  := [fsBold];
                      Columns[2].Title.Font.Color  := clWhite;

                      Columns.Add;
                      Columns[3].FieldName         := 'CELULAR';
                      Columns[3].Title.Caption     := 'CELULAR';
                      Columns[3].Width             := 80;
                      Columns[3].Alignment         := taLeftJustify;
                      Columns[3].Title.Alignment   := taLeftJustify;
                      Columns[3].Title.Font.Style  := [fsBold];
                      Columns[3].Title.Font.Color  := clWhite;

                      Columns.Add;
                      Columns[4].FieldName         := 'FUNC_NOME';
                      Columns[4].Title.Caption     := 'AGENDADO POR:';
                      Columns[4].Width             := 150;
                      Columns[4].Alignment         := taLeftJustify;
                      Columns[4].Title.Alignment   := taLeftJustify;
                      Columns[4].Title.Font.Style  := [fsBold];
                      Columns[4].Title.Font.Color  := clWhite;

                      Columns.Add;
                      Columns[5].FieldName         := 'DATA_AGENDADA';
                      Columns[5].Title.Caption     := 'Data';
                      Columns[5].Width             := 90;
                      Columns[5].Alignment         := taCenter;
                      Columns[5].Title.Alignment   := taCenter;
                      Columns[5].Title.Font.Style  := [fsBold];
                      Columns[5].Title.Font.Color  := clWhite;

                      Columns.Add;
                      Columns[6].FieldName         := 'HORA_AGENDADA';
                      Columns[6].Title.Caption     := 'Hora';
                      Columns[6].Width             := 60;
                      Columns[6].Alignment         := taCenter;
                      Columns[6].Title.Alignment   := taCenter;
                      Columns[6].Title.Font.Style  := [fsBold];
                      Columns[6].Title.Font.Color  := clWhite;

                end;
        end;
end;


procedure T_frmListaAgendamentos.btnSairClick(Sender: TObject);
begin

    close;
    release;

end;

procedure T_frmListaAgendamentos.btnFecharAgendamentoClick(
  Sender: TObject);
begin

      FecharAgendamento;

end;


procedure T_frmListaAgendamentos.FecharAgendamento;
var
  texto : string;
begin

       texto:= 'Confirma a conclusão desse atendimento?';

       if Application.MessageBox(PChar(texto),'Fechando Atendimento...',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

            With DM_Pesq.Qry_Geral do begin

               close;
               sql.Clear;
               sql.Add('UPDATE agendamentos SET status =  '+QuotedStr('FECHADO')+' WHERE id_agendamento = :pIdAgendamento');
               Params.ParamByName('pIdAgendamento').AsInteger := Id_Agendamento;
               ExecSQL();

            end;

            Application.MessageBox('Agendamento fechado com sucesso!', 'Fechando Agendamento', MB_OK);
            LogOperacoes(NomeDoUsuarioLogado, ' fechamento de agendamento');
            AbrirFecharTabelas;
            GridAgendamentosAbertos.Refresh;

       end
       else begin

         btnFecharAgendamento.Enabled   := true;
         btnImprimirAgendamento.Enabled := true;
         btnCancelarAgendamento.Enabled := true;
         GridAgendamentosAbertos.Enabled:= true;

       end;

       AbrirFecharTabelas;
       lblStatus.Caption  := IntToStr(dm_pesq.cdsPesqAgendamentos.RecordCount) +'  Agendamento(s) encontrado(s) nesta data!';


end;

procedure T_frmListaAgendamentos.GridAgendamentosAbertosCellClick(
  Column: TColumn);
begin

     Id_Agendamento                 :=  dm_pesq.cdsPesqAgendamentos.FieldbyName('id_agendamento').asInteger;

     btnFecharAgendamento.Enabled   := true;   
     btnCancelarAgendamento.Enabled := true;
    
end;


procedure T_frmListaAgendamentos.btnImprimirAgendamentoClick(
  Sender: TObject);
begin

    DataSelecionada := calendarioAgendamentos.Date;

     Application.CreateForm(T_frmEscolhaParaImpressaoDeAgendamentos,  _frmEscolhaParaImpressaoDeAgendamentos);
    _frmEscolhaParaImpressaoDeAgendamentos.ShowModal;
    FreeAndNil(_frmEscolhaParaImpressaoDeAgendamentos);

    LogOperacoes(NomeDoUsuarioLogado, ' impressao de agendamentos');

end;

procedure T_frmListaAgendamentos.btnCancelarAgendamentoClick(
  Sender: TObject);
begin

    CancelarAgendamento;

end;

procedure T_frmListaAgendamentos.CancelarAgendamento;
var
  texto : string;
begin

       texto:= 'Confirma  o cancelamento desse atendimento?';

       if Application.MessageBox(PChar(texto),'Cancelando Atendimento...',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

            With DM_Pesq.Qry_Geral do begin

               close;
               sql.Clear;
               sql.Add('UPDATE agendamentos SET status =  '+QuotedStr('CANCELADO')+' WHERE id_agendamento = :pIdAgendamento');
               Params.ParamByName('pIdAgendamento').AsInteger := Id_Agendamento;
               ExecSQL();

            end;

            Application.MessageBox('Agendamento cancelado com sucesso!', 'Cancelando Agendamento', MB_OK);
            LogOperacoes(NomeDoUsuarioLogado, ' cancelamento de agendamento');
            GridAgendamentosAbertos.Refresh;

       end
       else begin

         btnFecharAgendamento.Enabled   := true;
         btnImprimirAgendamento.Enabled := true;
         btnCancelarAgendamento.Enabled := true;
         GridAgendamentosAbertos.Enabled:= true;

         exit;

       end;

       AbrirFecharTabelas;
       lblStatus.Caption  := IntToStr(dm_pesq.cdsPesqAgendamentos.RecordCount) +'  Agendamento(s) encontrado(s) nesta data!';

end;



procedure T_frmListaAgendamentos.btnAgendamentosClick(Sender: TObject);
begin     

      _frmListaAgendamentos.hide;

      Application.CreateForm(T_frmAgendamentos,  _frmAgendamentos);
      _frmAgendamentos.ShowModal;
      FreeAndNil(_frmAgendamentos);

      Release;
      close;

end;

procedure T_frmListaAgendamentos.FormShow(Sender: TObject);
begin

    btnImprimirAgendamento.Enabled := true;
    
end;

end.

