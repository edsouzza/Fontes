unit U_ConsultaCotacoesRealizadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ToolEdit;

type
  T_frmConsCotacoesRealizadas = class(TForm)
    pan_titulo: TPanel;
    pangrid_atendimentos: TPanel;
    pan_botoes: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    lblStatusLogoff: TLabel;
    lbl45: TLabel;
    grid_ListaCotacoes: TDBGrid;
    lbl52: TLabel;
    edt_DataInicio: TDateEdit;
    lbl53: TLabel;
    edt_DataFim: TDateEdit;
    db_CLIENTE_ID: TDBEdit;
    btnFechar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure PesquisarPeriodoCotacoes;
    procedure FormShow(Sender: TObject);
    procedure grid_ListaCotacoesCellClick(Column: TColumn);
    procedure btnPesquisarClick(Sender: TObject);
    procedure PesquisarPeriodoCotacoesIndividuais;


  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  _frmConsCotacoesRealizadas: T_frmConsCotacoesRealizadas;


implementation

uses U_dmDados,  U_dmPesquisas, U_dmDadosSegundo,
  U_BiblioSysSalao,  U_principal, U_QRelListaCotacoes,
  DBClient;

{$R *.dfm}


procedure T_frmConsCotacoesRealizadas.FormCreate(Sender: TObject);
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

    lblDataDoDia.Caption    :=  DateToStr(date);
    lblHoraAtual.Caption    :=  timetoStr(time);
    lblStatusLogoff.Caption :=  IdentificarUsuarioLogado;
    edt_DataFim.Date        :=  date;

end;

procedure T_frmConsCotacoesRealizadas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    DM_Pesq.cdsPesqListaCotacoes.Active := false;
    Release;

end;

procedure T_frmConsCotacoesRealizadas.btnFecharClick(Sender: TObject);
begin

    Close;

end;

procedure T_frmConsCotacoesRealizadas.PesquisarPeriodoCotacoes;
var
  DataInicio, DataFim : TDate;
  Id_Funcionario      : Integer;
begin


             DataInicio     := StrToDate(edt_DataInicio.text);
             DataFim        := StrToDate(edt_DataFim.text);
             Id_Funcionario := IdFuncionarioLogado(lblStatusLogoff.Caption);


             with Q_RelListaCotacoes.cds_RelListaCotacoes do
             begin

                Close;
                Params.ParamByName('datainicial').AsDate := DataInicio;
                Params.ParamByName('datafinal').AsDate   := DataFim;
                Open;

                if IsEmpty then
                  begin

                         Application.MessageBox('Não foram encontrados registros no período selecionado!',
                         'Atenção...', MB_OK + MB_ICONWARNING);
                         exit;

                  end else begin

                    NomeDoUsuarioLogado                            :=  NomeFuncionarioLogado(Id_Funcionario);
                    Q_RelListaCotacoes.Q_NomeUsuarioLogado.Caption :=  NomeDoUsuarioLogado;
                    Q_RelListaCotacoes.cds_RelListaCotacoes.Active := True;
                    Q_RelListaCotacoes.Preview;

                end;

        end;

end;

procedure T_frmConsCotacoesRealizadas.FormShow(Sender: TObject);
begin

    DM_Pesq.cdsPesqListaCotacoes.Active := true;

end;

procedure T_frmConsCotacoesRealizadas.grid_ListaCotacoesCellClick(Column: TColumn);
begin

     btnPesquisarClick(Self);
     
end;

procedure T_frmConsCotacoesRealizadas.btnPesquisarClick(Sender: TObject);
begin

     if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
        begin
                  Application.MessageBox('É necessário uma data inicial e uma data final para efetuar a pesquisa !', 'Período Inválido!', MB_OK);
                  edt_datainicio.text          := '  /  /    ';
                  edt_DataFim.Date             := date;
                  edt_DataInicio.SetFocus;

        end
        else if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                 PesquisarPeriodoCotacoesIndividuais;

        end else begin

          Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
          edt_DataInicio.SetFocus;

       end;


       //COLOCAR NO FINAL DAS OPÇÕES
       edt_datainicio.text   := '  /  /    ';
       edt_DataFim.Date      := date;

end;

procedure T_frmConsCotacoesRealizadas.PesquisarPeriodoCotacoesIndividuais;
var
  DataInicio, DataFim        : TDate;
  Id_Cliente : Integer;
begin

             DataInicio     := StrToDate(edt_DataInicio.text);
             DataFim        := StrToDate(edt_DataFim.text);
             Id_Cliente     := StrToInt(db_CLIENTE_ID.Text);


           with Q_RelListaCotacoes.cds_RelListaCotacoes do
           begin

               close;

               Params.ParamByName('pIDCliente').AsInteger    := Id_Cliente;
               Params.ParamByName('datainicial').AsDate      := DataInicio;
               Params.ParamByName('datafinal').AsDate        := DataFim;
               Open;

                if IsEmpty then
                  begin

                         Application.MessageBox('Não foram encontrados registros no período selecionado!',
                         'Atenção...', MB_OK + MB_ICONWARNING);
                         exit;

                 end else begin


                     Q_RelListaCotacoes.cds_RelListaCotacoes.Active := True;
                     Q_RelListaCotacoes.Preview;

                     //COLOCAR NO FINAL DAS OPÇÕES
                     edt_datainicio.text   := '  /  /    ';
                     edt_DataFim.Date      := date;

                 end;

           end;

end;

end.

