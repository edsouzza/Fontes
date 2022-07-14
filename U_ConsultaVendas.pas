unit U_ConsultaVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ToolEdit;

type
  T_frmConsultaVendas = class(TForm)
    pan_titulo: TPanel;
    pangrid_atendimentos: TPanel;
    pan_botoes: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    lblStatusLogoff: TLabel;
    lbl45: TLabel;
    grid_Vendas: TDBGrid;
    lbl52: TLabel;
    edt_DataInicio: TDateEdit;
    lbl53: TLabel;
    edt_DataFim: TDateEdit;
    GroupBox1: TGroupBox;
    btnFechar: TSpeedButton;
    GroupBox2: TGroupBox;
    btnPesquisar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure PesquisarPeriodoVendas;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  _frmConsultaVendas: T_frmConsultaVendas;


implementation

uses U_dmDadosSegundo, U_BiblioSysSalao, U_principal, U_QRelVendasFechadas,
  U_QRelAtendimentos, U_QRelVendasComFormaPagamento;

{$R *.dfm}


procedure T_frmConsultaVendas.FormCreate(Sender: TObject);
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
    lblStatusLogoff.Caption := IdentificarUsuarioLogado;
    edt_DataFim.Date        := date;

end;

procedure T_frmConsultaVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

     dm_DadosSegundo.cds_Venda.Active := false;
     Release;

end;

procedure T_frmConsultaVendas.btnFecharClick(Sender: TObject);
begin

    flag := 0;
    Close;

end;     

procedure T_frmConsultaVendas.PesquisarPeriodoVendas;
var
  DataInicio, DataFim : TDate;
begin

        if flag = 100 then
        begin

             DataInicio     := StrToDate(edt_DataInicio.text);
             DataFim        := StrToDate(edt_DataFim.text);


             with Q_RelVendasFechadas.cds_RelVendasFechadas do
             begin

                Close;
                Params.ParamByName('datainicio').AsDate := DataInicio;
                Params.ParamByName('datafim').AsDate    := DataFim;
                Open;

              if IsEmpty then
                 begin

                         Application.MessageBox('Não foram encontrados registros no período selecionado!',
                         'Atenção...', MB_OK + MB_ICONWARNING);
                         exit;

               end else begin

                     Q_RelVendasFechadas.cds_RelVendasFechadas.Active:= True;
                     Q_RelVendasFechadas.Preview;

                     edt_datainicio.text   := '  /  /    ';
                     edt_DataFim.Date      := date;

                end;

              end;

        end;

        if flag = 200 then
        begin

             DataInicio     := StrToDate(edt_DataInicio.text);
             DataFim        := StrToDate(edt_DataFim.text);

             dm_DadosSegundo.cds_Venda.Active := true;

             with Q_RelVendasComFormaPagto.cds_RelVendaEFormaPagto do
             begin

                Close;
                Params.ParamByName('datainicio').AsDate      := DataInicio;
                Params.ParamByName('datafim').AsDate         := DataFim;
                Open;

             if IsEmpty then
             begin

                     Application.MessageBox('Não foram encontrados registros no período selecionado!',
                     'Atenção...', MB_OK + MB_ICONWARNING);
                     exit;

            end else begin

                   Q_RelVendasComFormaPagto.cds_RelVendaEFormaPagto.Active:= True;
                   Q_RelVendasComFormaPagto.Preview;

            end;

          end;

        end;
     

end;

procedure T_frmConsultaVendas.FormShow(Sender: TObject);
begin

    dm_DadosSegundo.cds_Venda.Active := true;

end;

procedure T_frmConsultaVendas.btnPesquisarClick(Sender: TObject);
begin

      if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
        begin
                  Application.MessageBox('É necessário uma data inicial e uma data final para efetuar a pesquisa !', 'Período Inválido!', MB_OK);
                  edt_datainicio.text          := '  /  /    ';
                  edt_DataFim.Date             := date;
                  edt_DataInicio.SetFocus;

        end
        else if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                PesquisarPeriodoVendas;

             end else begin

                Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
                edt_DataInicio.SetFocus;

            end;


      //COLOCAR NO FINAL DAS OPÇÕES
       edt_datainicio.text   := '  /  /    ';
       edt_DataFim.Date      := date;

end;

end.

