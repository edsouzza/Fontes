unit U_QRelDespesasCompras;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DBClient, Provider,
  DB, SqlExpr;

type
  TQ_RelDespesasCompras = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrb_titulo: TQRLabel;
    qrsysdt2: TQRSysData;
    QRLabel4: TQRLabel;
    Q_NomeUsuarioLogado: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    qrlbl3: TQRLabel;
    qrlbl2: TQRLabel;
    QRBand1: TQRBand;
    QRDBText5: TQRDBText;
    Q_TotalItem: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText1: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    qry_RelDespesasCompras: TSQLQuery;
    dsp_RelDespesasCompras: TDataSetProvider;
    cds_RelDespesasCompras: TClientDataSet;
    cds_RelDespesasComprasDESCRICAO: TStringField;
    cds_RelDespesasComprasPRECOCOMPRA: TFMTBCDField;
    cds_RelDespesasComprasQUANTIDADE: TFMTBCDField;
    cds_RelDespesasComprasTotal_Item: TFloatField;
    procedure cds_RelDespesasComprasCalcFields(DataSet: TDataSet);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
     Total : Extended;
  end;

var
  Q_RelDespesasCompras: TQ_RelDespesasCompras;

implementation

{$R *.DFM}

procedure TQ_RelDespesasCompras.cds_RelDespesasComprasCalcFields(
  DataSet: TDataSet);
begin

     cds_RelDespesasComprasTotal_Item.Value := (cds_RelDespesasComprasPRECOCOMPRA.AsFloat * cds_RelDespesasComprasQUANTIDADE.AsFloat);

end;

procedure TQ_RelDespesasCompras.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

   Total := (Total + cds_RelDespesasCompras.FieldByname('total_item').AsCurrency);

end;

procedure TQ_RelDespesasCompras.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

   QR_Total.Caption := FormatFloat ('#,##0.00', Total);

end;

procedure TQ_RelDespesasCompras.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin

    Total := 0;

end;

end.
