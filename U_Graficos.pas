unit U_Graficos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls,
  TeEngine, Series, TeeProcs, Chart, DbChart, ComCtrls, ToolEdit, TeePrevi;

type
  T_frmGraficos = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    PageControl1: TPageControl;
    TabVendas: TTabSheet;
    DBChartVendas: TDBChart;
    Series1: TBarSeries;
    Panel1: TPanel;
    edt_DataInicio: TDateEdit;
    edt_DataFim: TDateEdit;
    btn_Filtrar: TSpeedButton;
    lblAcumulado: TLabel;
    btn_LimparPesquisa: TSpeedButton;
    btn_ImprimirGrafico: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btn_FiltrarClick(Sender: TObject);
    procedure btn_LimparPesquisaClick(Sender: TObject);
    procedure PesquisarPeriodoVendas;
    procedure MostrarTotalAcumulado;
    procedure LimparPesquisaAtual;
    procedure btn_ImprimirGraficoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  _frmGraficos: T_frmGraficos;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas,
     DB, U_Funcionarios, U_principal, U_dmDadosSegundo, ZDataset, DBClient,
  SqlExpr;

{$R *.dfm}

procedure T_frmGraficos.FormCreate(Sender: TObject);
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
  
end;

procedure T_frmGraficos.FormShow(Sender: TObject);
begin

    edt_DataInicio.text := '';
    edt_DataFim.text    := DateToStr(now);

end;

procedure T_frmGraficos.pnl_rodapeClick(Sender: TObject);
begin

   btn_LimparPesquisaClick(Self);
   dm_DadosSegundo.IB_Estatisticas.Close;
   close;

end;

procedure T_frmGraficos.btnFiltrarClick(Sender: TObject);
begin

             DataInicio     := StrToDate(edt_DataInicio.text);
             DataFim        := StrToDate(edt_DataFim.text);


             with dm_DadosSegundo.IB_Estatisticas do
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
                         LimparPesquisaAtual;

                    end else
                    begin
                         btn_Filtrar.Enabled := false;
                    end;

             end;

end;

procedure T_frmGraficos.btn_FiltrarClick(Sender: TObject);
begin

        if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
        begin

              Application.MessageBox('É necessário uma data inicial e uma data final para efetuar a pesquisa !', 'Período Inválido!', MB_OK);
             LimparPesquisaAtual;

        end
        else if (edt_DataFim.Date >= edt_DataInicio.Date) then
        begin

                PesquisarPeriodoVendas;
               
        end else
        begin

                 Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
                 LimparPesquisaAtual;

       end;
       
end;


procedure T_frmGraficos.PesquisarPeriodoVendas;
begin

             DataInicio     := StrToDate(edt_DataInicio.text);
             DataFim        := StrToDate(edt_DataFim.text);

             with dm_DadosSegundo.IB_Estatisticas do
             begin

                Close;
                Params.ParamByName('datainicio').AsDate := DataInicio;
                Params.ParamByName('datafim').AsDate    := DataFim;
                Open;     

                     if not IsEmpty then
                     begin

                          MostrarTotalAcumulado;
                          btn_LimparPesquisa.Enabled    := true;
                          btn_ImprimirGrafico.Enabled   := true;
                          edt_datainicio.Enabled        := false;
                          edt_DataFim.Enabled           := false;
                          btn_Filtrar.Enabled := false;

                     end else
                     begin

                           Application.MessageBox('Não foram encontrados registros no período selecionado!',
                           'Atenção...', MB_OK + MB_ICONWARNING);
                           LimparPesquisaAtual;

                     end;

              end;      

end;

procedure T_frmGraficos.MostrarTotalAcumulado;
begin

    lblAcumulado.Visible:= true;
    valorTotal:=0;

    while not dm_DadosSegundo.IB_Estatisticas.eof do
    begin

        valorTotal := valorTotal + (dm_DadosSegundo.IB_EstatisticasTOTAL.AsFloat);
        dm_DadosSegundo.IB_Estatisticas.next;

    end;

    lblAcumulado.Caption:= lblAcumulado.Caption+(trim(Transform(valorTotal)));

end;


procedure T_frmGraficos.btn_LimparPesquisaClick(Sender: TObject);
begin

    LimparPesquisaAtual;

end;

procedure T_frmGraficos.btn_ImprimirGraficoClick(Sender: TObject);
begin

    //imprimindo o grafico atual
    ChartPreview(Self, DBChartVendas);
    
end;

procedure T_frmGraficos.LimparPesquisaAtual;
begin

     edt_DataInicio.Clear;
     edt_datainicio.text                          := '  /  /    ';
     dm_DadosSegundo.IB_Estatisticas.Active       := false;
     edt_DataInicio.Enabled                       := true;
     edt_DataFim.Enabled                          := true;
     btn_LimparPesquisa.Enabled                   := false;
     btn_ImprimirGrafico.Enabled                  := false;   
     lblAcumulado.Visible                         := false;
     lblAcumulado.Caption                         := 'Total acumulado no período.: ';
     edt_DataFim.text                             := DateToStr(now);
     btn_Filtrar.Enabled                          := true;
     edt_DataInicio.SetFocus;

end;

end.
