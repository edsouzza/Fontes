unit U_Atendimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ToolEdit;

type
  T_frmAtendimentos = class(TForm)
    pan_titulo: TPanel;
    pangrid_atendimentos: TPanel;
    pan_botoes: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    lblStatusLogoff: TLabel;
    lbl45: TLabel;
    grid_Funcionarios: TDBGrid;
    lbl52: TLabel;
    lbl53: TLabel;
    edt_DataInicio: TDateEdit;
    edt_DataFim: TDateEdit;
    GroupBox1: TGroupBox;
    btnFechar: TSpeedButton;
    db_FUNC_ID: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure PesquisarPeriodoAtendimentos;
    procedure FormShow(Sender: TObject);
    procedure grid_FuncionariosCellClick(Column: TColumn);


  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  _frmAtendimentos: T_frmAtendimentos;


implementation

uses U_dmDados, U_dmPesquisas, U_dmDadosSegundo,
  U_BiblioSysSalao, U_principal, U_QRelAtendimentos;

{$R *.dfm}


procedure T_frmAtendimentos.FormCreate(Sender: TObject);
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

procedure T_frmAtendimentos.FormShow(Sender: TObject);
begin

    dm_Conexao.cds_DadosFuncionarios.Active := true;
    edt_DataInicio.Date                 := DataInicio;
    edt_DataFim.Date                    := DataFim;

end;

procedure T_frmAtendimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    dm_Conexao.cds_DadosFuncionarios.Active := false;
    Release;

end;

procedure T_frmAtendimentos.btnFecharClick(Sender: TObject);
begin

    Close;

end;     

procedure T_frmAtendimentos.PesquisarPeriodoAtendimentos;
var
  DataInicio, DataFim : TDate;
  Id_Funcionario      : Integer;
begin

        if db_FUNC_ID.Text = '' then
        begin

            Application.MessageBox('No momento não há funcionários cadastrados!','Informação do Sistema',Mb_IconInformation);
            exit;

        end
        else begin

             DataInicio     := StrToDate(edt_DataInicio.text);
             DataFim        := StrToDate(edt_DataFim.text);
             Id_Funcionario := StrToInt(db_FUNC_ID.text);


             with Q_RelAtendimentos.cds_RelVendasAtendidas do
             begin

                Close;
                Params.ParamByName('pFunc').AsInteger    := Id_Funcionario;
                Params.ParamByName('datainicio').AsDate  := DataInicio;
                Params.ParamByName('datafim').AsDate     := DataFim;
                Open;

                if IsEmpty then
                 begin

                         Application.MessageBox('Não foram encontrados registros no período selecionado!',
                         'Atenção...', MB_OK + MB_ICONWARNING);
                         exit;

                end else begin

                     Q_RelAtendimentos.cds_RelVendasAtendidas.Active:= True;
                     Q_RelAtendimentos.Preview;

                end;

              end;
        end;
end;

procedure T_frmAtendimentos.grid_FuncionariosCellClick(Column: TColumn);
begin

        if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
        begin
                  Application.MessageBox('É necessário uma data inicial e uma data final para efetuar a pesquisa !', 'Período Inválido!', MB_OK);
                  edt_datainicio.text          := '  /  /    ';
                  edt_DataFim.Date             := date;
                  edt_DataInicio.SetFocus;

        end
        else if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                PesquisarPeriodoAtendimentos;

             end else begin

                Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
                edt_DataInicio.SetFocus;

            end;


      //COLOCAR NO FINAL DAS OPÇÕES
       edt_datainicio.text   := '  /  /    ';
       edt_DataFim.Date      := date;
end;

end.

