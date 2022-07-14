unit U_QRelVendasComFormaPagamento;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, SqlExpr, Provider,
  DB, DBClient;

type
  TQ_RelVendasComFormaPagto = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qr_Titulo: TQRLabel;
    qrsysdt2: TQRSysData;
    qrbndDetailBand1: TQRBand;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    qrdbtxtVALOR_TOTAL: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    cds_RelVendaEFormaPagto: TClientDataSet;
    cds_RelVendaEFormaPagtoID_VENDA: TStringField;
    cds_RelVendaEFormaPagtoDATA: TDateField;
    cds_RelVendaEFormaPagtoTIPO: TStringField;
    cds_RelVendaEFormaPagtoVALOR: TFMTBCDField;
    cds_RelVendaEFormaPagtoFORMA_ID: TIntegerField;
    cds_RelVendaEFormaPagtoFORMA_DESCRICAO: TStringField;
    cds_RelVendaEFormaPagtoID_VENDA_1: TIntegerField;
    cds_RelVendaEFormaPagtoID_VENDEDOR: TIntegerField;
    cds_RelVendaEFormaPagtoFUNC_ID: TIntegerField;
    cds_RelVendaEFormaPagtoFUNC_NOME: TStringField;
    dsp_RelVendaEFormaPagto: TDataSetProvider;
    qry_RelVendaEFormaPagto: TSQLQuery;
    cds_RelVendaEFormaPagtoVL_TOTALPAGAR: TFMTBCDField;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    qrlbl3: TQRLabel;
    qrlbl2: TQRLabel;
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
  Q_RelVendasComFormaPagto: TQ_RelVendasComFormaPagto;

implementation

{$R *.DFM}

procedure TQ_RelVendasComFormaPagto.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    TotalValores :=0;
end;

procedure TQ_RelVendasComFormaPagto.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
    TotalValores := TotalValores + cds_RelVendaEFormaPagto.FIELDBYNAME('valor').AsCurrency;
end;

procedure TQ_RelVendasComFormaPagto.qrbnd1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

end.
