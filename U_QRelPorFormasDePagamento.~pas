unit U_QRelPorFormasDePagamento;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelPorFormasDePagamento = class(TQuickRep)
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
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    qry_RelFormaPagto: TSQLQuery;
    dsp_RelFormaPagto: TDataSetProvider;
    cds_RelFormaPagto: TClientDataSet;
    QRDBText2: TQRDBText;
    cds_RelFormaPagtoID_VENDA: TStringField;
    cds_RelFormaPagtoDATA: TDateField;
    cds_RelFormaPagtoTIPO: TStringField;
    cds_RelFormaPagtoVALOR: TFMTBCDField;
    cds_RelFormaPagtoFORMA_ID: TIntegerField;
    cds_RelFormaPagtoFORMA_DESCRICAO: TStringField;
    cds_RelFormaPagtoID_VENDA_1: TIntegerField;
    cds_RelFormaPagtoID_VENDEDOR: TIntegerField;
    cds_RelFormaPagtoFUNC_ID: TIntegerField;
    cds_RelFormaPagtoFUNC_NOME: TStringField;
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
  Q_RelPorFormasDePagamento: TQ_RelPorFormasDePagamento;

implementation

{$R *.DFM}

procedure TQ_RelPorFormasDePagamento.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    TotalValores :=0;
end;

procedure TQ_RelPorFormasDePagamento.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     TotalValores := TotalValores + cds_RelFormaPagto.FIELDBYNAME('valor').AsCurrency;
end;

procedure TQ_RelPorFormasDePagamento.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

end.
