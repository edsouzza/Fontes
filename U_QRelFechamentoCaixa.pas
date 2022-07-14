unit U_QRelFechamentoCaixa;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DBClient, Provider,
  DB, SqlExpr;

type
  TQ_RelFechamentoCaixa = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrlbl8: TQRLabel;
    qrsysdt2: TQRSysData;
    qrbndDetailBand1: TQRBand;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    qrdbtxtVALOR_TOTAL: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    qrlbl9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QR_Total: TQRLabel;
    QRDBText2: TQRDBText;
    Qry_RelFechamentoCaixa: TSQLQuery;
    cds_RelFechamentoCaixa: TClientDataSet;
    dsp_RelFechamentoCaixa: TDataSetProvider;
    cds_RelFechamentoCaixaID_FECHACAIXA: TIntegerField;
    cds_RelFechamentoCaixaSALDO_FECHAMENTO: TFMTBCDField;
    cds_RelFechamentoCaixaDATA_FECHAMENTO: TDateField;
    cds_RelFechamentoCaixaHORA_FECHAMENTO: TStringField;
    cds_RelFechamentoCaixaID_FUNCIONARIO: TIntegerField;
    cds_RelFechamentoCaixaFUNC_ID: TIntegerField;
    cds_RelFechamentoCaixaFUNC_NOME: TStringField;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
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
  Q_RelFechamentoCaixa: TQ_RelFechamentoCaixa;

implementation

uses U_dmDadosSegundo, U_dmDados;

{$R *.DFM}

procedure TQ_RelFechamentoCaixa.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    TotalValores :=0;
end;

procedure TQ_RelFechamentoCaixa.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin

     TotalValores := TotalValores + cds_RelFechamentoCaixa.FIELDBYNAME('saldo_fechamento').AsCurrency;

end;

procedure TQ_RelFechamentoCaixa.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

end.
