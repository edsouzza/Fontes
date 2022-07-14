unit U_QRelDuplicatasFinalizadas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DBClient, Provider,
  DB, SqlExpr;

type
  TQ_RelDuplicatasFinalizadas = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qr_Titulo: TQRLabel;
    qrsysdt2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlbl3: TQRLabel;
    qrlbl2: TQRLabel;
    QRLabel4: TQRLabel;
    qrbndDetailBand1: TQRBand;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    qrdbtxtVALOR_TOTAL: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    qry_RelDuplicatas: TSQLQuery;
    dsp_RelDuplicatas: TDataSetProvider;
    cds_RelDuplicatas: TClientDataSet;
    cds_RelDuplicatasID_DUPLICATA: TIntegerField;
    cds_RelDuplicatasNUM_DUPLICATA: TStringField;
    cds_RelDuplicatasVALOR: TFMTBCDField;
    cds_RelDuplicatasDTPAGAMENTO: TDateField;
    cds_RelDuplicatasFORNE_NOME: TStringField;
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
  Q_RelDuplicatasFinalizadas: TQ_RelDuplicatasFinalizadas;

implementation

{$R *.DFM}

procedure TQ_RelDuplicatasFinalizadas.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   TotalValores :=0;
end;

procedure TQ_RelDuplicatasFinalizadas.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
    TotalValores := TotalValores + cds_RelDuplicatas.FIELDBYNAME('VALOR').AsCurrency;
end;

procedure TQ_RelDuplicatasFinalizadas.qrbnd1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
    QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

end.
