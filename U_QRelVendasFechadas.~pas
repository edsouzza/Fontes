unit U_QRelVendasFechadas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelVendasFechadas = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qr_Titulo: TQRLabel;
    qrsysdt2: TQRSysData;
    qrbndDetailBand1: TQRBand;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    qrdbtxtVALOR_TOTAL: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    qry_RelVendasFechadas: TSQLQuery;
    dsp_RelVendasFechadas: TDataSetProvider;
    cds_RelVendasFechadas: TClientDataSet;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlbl3: TQRLabel;
    QRLabel1: TQRLabel;
    qrlbl2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    cds_RelVendasFechadasID_VENDA: TIntegerField;
    cds_RelVendasFechadasID_VENDEDOR: TIntegerField;
    cds_RelVendasFechadasCLIENTE_ID: TIntegerField;
    cds_RelVendasFechadasORCAMENTO_ID: TIntegerField;
    cds_RelVendasFechadasDATA_VENDA: TDateField;
    cds_RelVendasFechadasHORA_VENDA: TStringField;
    cds_RelVendasFechadasVL_BRUTO: TFMTBCDField;
    cds_RelVendasFechadasVL_DESCONTO: TFMTBCDField;
    cds_RelVendasFechadasVL_TOTALPAGAR: TFMTBCDField;
    cds_RelVendasFechadasVL_RECEBIDO: TFMTBCDField;
    cds_RelVendasFechadasVL_TROCO: TFMTBCDField;
    cds_RelVendasFechadasVL_LIQUIDO: TFMTBCDField;
    cds_RelVendasFechadasVL_DESPESA: TFMTBCDField;
    cds_RelVendasFechadasSTATUS: TStringField;
    cds_RelVendasFechadasMESANO: TStringField;
    cds_RelVendasFechadasNUMMES: TIntegerField;
    cds_RelVendasFechadasFUNC_ID: TIntegerField;
    cds_RelVendasFechadasFUNC_NOME: TStringField;
    cds_RelVendasFechadasCLI_ID: TIntegerField;
    cds_RelVendasFechadasCLI_NOME: TStringField;
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
  Q_RelVendasFechadas: TQ_RelVendasFechadas;

implementation

{$R *.DFM}

procedure TQ_RelVendasFechadas.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    TotalValores :=0;
end;

procedure TQ_RelVendasFechadas.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     TotalValores := TotalValores + cds_RelVendasFechadas.FIELDBYNAME('vl_totalpagar').AsCurrency;
end;

procedure TQ_RelVendasFechadas.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

end.
