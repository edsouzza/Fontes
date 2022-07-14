unit U_QRelAtendimentos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelAtendimentos = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qr_Titulo: TQRLabel;
    qrsysdt2: TQRSysData;
    qrbndDetailBand1: TQRBand;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    qrdbtxtVALOR_TOTAL: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    qry_RelVendasAtendidas: TSQLQuery;
    dsp_RelVendasAtendidas: TDataSetProvider;
    cds_RelVendasAtendidas: TClientDataSet;
    cds_RelVendasAtendidasID_VENDA: TIntegerField;
    cds_RelVendasAtendidasID_VENDEDOR: TIntegerField;
    cds_RelVendasAtendidasDATA_VENDA: TDateField;
    cds_RelVendasAtendidasHORA_VENDA: TStringField;
    cds_RelVendasAtendidasVL_BRUTO: TFMTBCDField;
    cds_RelVendasAtendidasVL_DESCONTO: TFMTBCDField;
    cds_RelVendasAtendidasSTATUS: TStringField;
    cds_RelVendasAtendidasFUNC_ID: TIntegerField;
    cds_RelVendasAtendidasFUNC_NOME: TStringField;
    cds_RelVendasAtendidasVL_TOTALPAGAR: TFMTBCDField;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    qrlbl3: TQRLabel;
    QRLabel1: TQRLabel;
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
  Q_RelAtendimentos: TQ_RelAtendimentos;

implementation

{$R *.DFM}

procedure TQ_RelAtendimentos.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
    TotalValores :=0;
end;

procedure TQ_RelAtendimentos.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   TotalValores := TotalValores + cds_RelVendasAtendidas.FIELDBYNAME('vl_totalpagar').AsCurrency;
end;

procedure TQ_RelAtendimentos.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

end.
