unit U_QRelImprimeListaDeOS;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelImprimeListaDeOS = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrsysdt2: TQRSysData;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText2: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    qry_RelImprimeListaDeOS: TSQLQuery;
    dsp_RelImprimeListaDeOS: TDataSetProvider;
    cds_RelImprimeListaDeOS: TClientDataSet;
    ds_RelImprimeListaDeOS: TDataSource;
    QRDBText3: TQRDBText;
    qrb_titulo: TQRLabel;
    QR_Total: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    cds_RelImprimeListaDeOSID_OS: TIntegerField;
    cds_RelImprimeListaDeOSCLIENTE_ID: TIntegerField;
    cds_RelImprimeListaDeOSOPERADOR_ID: TIntegerField;
    cds_RelImprimeListaDeOSEQUIPAMENTO: TStringField;
    cds_RelImprimeListaDeOSNUMSERIE: TStringField;
    cds_RelImprimeListaDeOSMARCA: TStringField;
    cds_RelImprimeListaDeOSMODELO: TStringField;
    cds_RelImprimeListaDeOSACESSORIOS: TStringField;
    cds_RelImprimeListaDeOSVL_ORCAMENTO: TFMTBCDField;
    cds_RelImprimeListaDeOSVL_DESCONTO: TFMTBCDField;
    cds_RelImprimeListaDeOSVL_TROCO: TFMTBCDField;
    cds_RelImprimeListaDeOSVL_TOTAL: TFMTBCDField;
    cds_RelImprimeListaDeOSVL_RECEBIDO: TFMTBCDField;
    cds_RelImprimeListaDeOSVL_LIQUIDO: TFMTBCDField;
    cds_RelImprimeListaDeOSPROBLEMA: TStringField;
    cds_RelImprimeListaDeOSDATA_ABERTURA: TDateField;
    cds_RelImprimeListaDeOSDATA_FECHAMENTO: TDateField;
    cds_RelImprimeListaDeOSSTATUS: TStringField;
    cds_RelImprimeListaDeOSCLI_ID: TIntegerField;
    cds_RelImprimeListaDeOSCLIENTE: TStringField;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
       TotalValores : Extended;
  end;

var
  Q_RelImprimeListaDeOS: TQ_RelImprimeListaDeOS;

implementation

{$R *.DFM}

procedure TQ_RelImprimeListaDeOS.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     TotalValores := TotalValores + cds_RelImprimeListaDeOS.FIELDBYNAME('VL_ORCAMENTO').AsCurrency;
end;

procedure TQ_RelImprimeListaDeOS.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

procedure TQ_RelImprimeListaDeOS.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    TotalValores :=0;
end;

end.
