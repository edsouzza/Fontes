unit U_QRelAberturaCaixa;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DBClient, Provider,
  DB, SqlExpr;

type
  TQ_RelAberturaCaixa = class(TQuickRep)
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
    Qry_RelAberturaCaixa: TSQLQuery;
    cds_RelAberturaCaixa: TClientDataSet;
    dsp_RelAberturaCaixa: TDataSetProvider;
    cds_RelAberturaCaixaID_ABRECAIXA: TIntegerField;
    cds_RelAberturaCaixaVALOR_ABERTURA: TFMTBCDField;
    cds_RelAberturaCaixaDATA_ABERTURA: TDateField;
    cds_RelAberturaCaixaHORA_ABERTURA: TStringField;
    cds_RelAberturaCaixaID_FUNCIONARIO: TIntegerField;
    cds_RelAberturaCaixaFUNC_ID: TIntegerField;
    cds_RelAberturaCaixaFUNC_NOME: TStringField;
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
  Q_RelAberturaCaixa: TQ_RelAberturaCaixa;

implementation

uses U_dmDadosSegundo, U_dmDados;

{$R *.DFM}

procedure TQ_RelAberturaCaixa.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    TotalValores :=0;
end;

procedure TQ_RelAberturaCaixa.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin

     TotalValores := TotalValores + cds_RelAberturaCaixa.FIELDBYNAME('valor_abertura').AsCurrency;

end;

procedure TQ_RelAberturaCaixa.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

end.
