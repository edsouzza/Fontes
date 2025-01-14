unit U_QRelPorTipoDePagamentoCredito;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DBClient, Provider,
  DB, SqlExpr;

type
  TQ_RelPorTipoDePagamentoCredito = class(TQuickRep)
    qrbndDetailBand1: TQRBand;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    dsp_RelTiposPagtos: TDataSetProvider;
    cds_RelTiposPagtos: TClientDataSet;
    qry_RelTiposPagtos: TSQLDataSet;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    cds_RelTiposPagtosFORMA_DESCRICAO: TStringField;
    cds_RelTiposPagtosID_VENDA: TStringField;
    cds_RelTiposPagtosID_ORC: TStringField;
    cds_RelTiposPagtosDATA: TDateField;
    cds_RelTiposPagtosVALOR: TFMTBCDField;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    QRDBText4: TQRDBText;
    QRBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrbTitulo: TQRLabel;
    QRLogo: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    qrlbl3: TQRLabel;
    QRLabel1: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
       TotalValores : Extended;
  end;

var
  Q_RelPorTipoDePagamentoCredito: TQ_RelPorTipoDePagamentoCredito;

implementation

uses U_dmDadosSegundo, U_dmDados, U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelPorTipoDePagamentoCredito.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  TotalValores :=0;
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

procedure TQ_RelPorTipoDePagamentoCredito.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TotalValores := TotalValores + cds_RelTiposPagtos.FIELDBYNAME('VALOR').AsCurrency;
end;

procedure TQ_RelPorTipoDePagamentoCredito.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

end.
