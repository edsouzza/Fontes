unit U_EscolhaFormaDePagamentoParaRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls,
  ToolEdit;

type
  T_frmEscolhaFormaDePagamentoParaRelatorios = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    grid_formaPagto: TDBGrid;
    lbl52: TLabel;
    edt_DataInicio: TDateEdit;
    lbl53: TLabel;
    edt_DataFim: TDateEdit;
    btnSair: TSpeedButton;
    dbNumTipo: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PopulandoGridFormaPagtos;
    procedure pnl_rodapeClick(Sender: TObject);
    procedure grid_formaPagtoCellClick(Column: TColumn);
    procedure PesquisarPorFormaDePagamento;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }


  end;

var
  _frmEscolhaFormaDePagamentoParaRelatorios: T_frmEscolhaFormaDePagamentoParaRelatorios;

implementation

uses U_Caixa, U_dmPesquisas, U_BiblioSysSalao, U_QRelPorFormasDePagamento,
  U_dmDadosSegundo, DB;

{$R *.dfm}

procedure T_frmEscolhaFormaDePagamentoParaRelatorios.FormCreate(Sender: TObject);
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

  PopulandoGridFormaPagtos;
  edt_DataFim.Text := DateToStr(date);

end;

procedure T_frmEscolhaFormaDePagamentoParaRelatorios.FormKeyPress(Sender: TObject;
  var Key: Char);
begin

       if key=#27 then begin

         close;
         Release;

      end;

end;

procedure T_frmEscolhaFormaDePagamentoParaRelatorios.PopulandoGridFormaPagtos;
begin

          _Sql := 'SELECT * FROM formapagto ORDER BY forma_descricao';

            with DM_Pesq.cdsPesqFormaPagto do begin

                Close;
                CommandText:=(_Sql);
                Open;

            end;

            dbNumTipo.DataField         := 'FORMA_ID';
            dbNumTipo.DataSource        :=  DM_Pesq.dsPesqFormaPagto;


            with grid_formaPagto do
            begin

              DataSource:=  DM_Pesq.dsPesqFormaPagto;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName        := 'FORMA_DESCRICAO';
              Columns[0].Width            := 840;
              Columns[0].Alignment        := taLeftJustify;
              Columns[0].Title.caption    := 'DESCRIÇÃO';
              Columns[0].Title.Font.Style := [fsBold];
              Columns[0].Title.Alignment  := taCenter;

            end;

end;


procedure T_frmEscolhaFormaDePagamentoParaRelatorios.pnl_rodapeClick(Sender: TObject);
begin

   close;

end;


procedure T_frmEscolhaFormaDePagamentoParaRelatorios.grid_formaPagtoCellClick(
  Column: TColumn);
begin

        if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
        begin
                  Application.MessageBox('É necessário uma data inicial e uma data final para efetuar a pesquisa !', 'Período Inválido!', MB_OK);
                  edt_datainicio.text          := '  /  /    ';
                  edt_DataFim.Date             := date;
                  edt_DataInicio.SetFocus;

        end
        else if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                PesquisarPorFormaDePagamento;

             end else begin

                Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
                edt_DataInicio.SetFocus;

            end;


      //COLOCAR NO FINAL DAS OPÇÕES
       edt_datainicio.text   := '  /  /    ';
       edt_DataFim.Date      := date;

end;


procedure T_frmEscolhaFormaDePagamentoParaRelatorios.PesquisarPorFormaDePagamento;
var
  DataInicio, DataFim : TDate;
  sTipo : string;
begin

     DataInicio     := StrToDate(edt_DataInicio.text);
     DataFim        := StrToDate(edt_DataFim.text);
     sTipo          := dbNumTipo.text;

     dm_DadosSegundo.cds_Venda.Active := true;

       with Q_RelPorFormasDePagamento.cds_RelFormaPagto do
       begin

          Close;
          Params.ParamByName('pTipo').AsString         := sTipo;
          Params.ParamByName('datainicio').AsDate      := DataInicio;
          Params.ParamByName('datafim').AsDate         := DataFim;
          Open;

              if IsEmpty then begin

                  Application.MessageBox('Não foram encontrados pagamentos desse tipo no período discriminado!', 'Nada encontrado!', MB_OK);
                  exit;

              end else begin

                   Q_RelPorFormasDePagamento.cds_RelFormaPagto.Active:= True;
                   Q_RelPorFormasDePagamento.Preview;

              end;

          end;

end;

procedure T_frmEscolhaFormaDePagamentoParaRelatorios.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin

    dm_DadosSegundo.cds_Venda.Active := false;

end;

procedure T_frmEscolhaFormaDePagamentoParaRelatorios.btnSairClick(
  Sender: TObject);
begin

    close;

end;

procedure T_frmEscolhaFormaDePagamentoParaRelatorios.FormShow(
  Sender: TObject);
begin

     edt_DataInicio.Date     := DataInicio;
     edt_DataFim.Date        := DataFim;

end;

end.
