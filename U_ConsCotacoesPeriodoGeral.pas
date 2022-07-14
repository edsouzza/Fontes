unit U_ConsCotacoesPeriodoGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_ConsCotacoesPeriodo, Buttons, StdCtrls, Mask, ToolEdit, Grids,
  DBGrids, ExtCtrls;

type
  T_frmConsCotacoesPeriodoGeral = class(T_frmConsCotacoesPeriodo)
    procedure btnPesquisarClick(Sender: TObject);
    procedure PesquisarPeriodoCotacoes;
    procedure btnImprimirPeriodoCotacaoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmConsCotacoesPeriodoGeral: T_frmConsCotacoesPeriodoGeral;

implementation


uses U_BiblioSysSalao, U_dmPesquisas, DBClient, U_QRelCotacaoPeriodoGeral;

{$R *.dfm}

procedure T_frmConsCotacoesPeriodoGeral.btnPesquisarClick(Sender: TObject);
begin

      if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
        begin
                  Application.MessageBox('É necessário uma data inicial e uma data final para efetuar a pesquisa !', 'Período Inválido!', MB_OK);
                  edt_datainicio.text          := '  /  /    ';
                  edt_DataFim.Date             := date;
                  edt_DataInicio.SetFocus;
                  btnImprimirPeriodoCotacao.Enabled := false;
        end
        else if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                 PesquisarPeriodoCotacoes;

                 btnImprimirPeriodoCotacao.Enabled := true;
                 btnPesquisar.Enabled              := false;
                 btnFechar.Caption                 := 'Limpar';

        end else begin

          Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
          edt_DataInicio.SetFocus;
          btnImprimirPeriodoCotacao.Enabled := false;

       end;

end;

procedure T_frmConsCotacoesPeriodoGeral.PesquisarPeriodoCotacoes;
var
  DataInicio, DataFim : TDate;
begin

             DataInicio     := StrToDate(edt_DataInicio.text);
             DataFim        := StrToDate(edt_DataFim.text);


             _Sql := 'SELECT C.*, CL.CLI_ID, CL.CLI_NOME FROM COTACAO C, CLIENTES CL '+
                     'WHERE C.ID_CLIENTE = CL.CLI_ID AND C.DATA BETWEEN :DATAINICIAL AND :DATAFINAL '+
                     'ORDER BY C.DATA, CL.CLI_NOME';


             with Q_RelCotacaoPeriodoGeral.cds_RelCotacaoPeriodoGeral do
             begin

                Close;
                CommandText :=(_Sql);
                Params.ParamByName('datainicial').AsDate := DataInicio;
                Params.ParamByName('datafinal').AsDate   := DataFim;
                Open;

                if IsEmpty then
                  begin

                         Application.MessageBox('Não foram encontrados registros no período selecionado!',
                         'Atenção...', MB_OK + MB_ICONWARNING);
                         exit;

                  end else begin

                    //preenche o grid com a consulta
                    grid_ListaCotacoes.DataSource :=  Q_RelCotacaoPeriodoGeral.ds_RelCotacaoPeriodoGeral;

                end;

        end;

end;


procedure T_frmConsCotacoesPeriodoGeral.btnImprimirPeriodoCotacaoClick(
  Sender: TObject);
begin

       Q_RelCotacaoPeriodoGeral.cds_RelCotacaoPeriodoGeral.Active := True;
       Q_RelCotacaoPeriodoGeral.Preview;   
       
end;

end.
