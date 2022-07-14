unit U_QRelFaturamentoDiario;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DBClient, Provider,
  DB, SqlExpr;

type
  TQ_RelFaturamentoDiario = class(TQuickRep)
    Qry_RelFaturamentoDiario: TSQLQuery;
    dsp_RelFaturamentoDiario: TDataSetProvider;
    cds_RelFaturamentoDiario: TClientDataSet;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    qrbndDetailBand1: TQRBand;
    qrbndPageHeaderBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrlbl8: TQRLabel;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    QRDBText5: TQRDBText;
    cds_RelFaturamentoDiarioSALDO_FECHAMENTO: TFMTBCDField;
    cds_RelFaturamentoDiarioDATA_FECHAMENTO: TDateField;
    qrlbl3: TQRLabel;
    QRLabel4: TQRLabel;
    procedure qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
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
  Q_RelFaturamentoDiario: TQ_RelFaturamentoDiario;

implementation

{$R *.DFM}

procedure TQ_RelFaturamentoDiario.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
TotalValores := TotalValores + cds_RelFaturamentoDiario.FIELDBYNAME('SALDO_FECHAMENTO').AsCurrency;
end;

procedure TQ_RelFaturamentoDiario.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

procedure TQ_RelFaturamentoDiario.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
 TotalValores :=0;
end;

end.
