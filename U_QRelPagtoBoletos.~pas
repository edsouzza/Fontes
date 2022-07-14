unit U_QRelPagtoBoletos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelPagtoBoletos = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrlbl3: TQRLabel;
    qrlbl2: TQRLabel;
    QRBand1: TQRBand;
    QRDBText5: TQRDBText;
    Q_TotalItem: TQRDBText;
    QRDBText1: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    qry_RelPagtoBoletos: TSQLQuery;
    dsp_RelPagtoBoletos: TDataSetProvider;
    cds_RelPagtoBoletos: TClientDataSet;
    cds_RelPagtoBoletosCREDOR_ID: TIntegerField;
    cds_RelPagtoBoletosVALOR: TFMTBCDField;
    cds_RelPagtoBoletosDTPAGTO: TDateField;
    cds_RelPagtoBoletosCREDOR: TStringField;
    qrsysdt2: TQRSysData;
    qrbTitulo: TQRLabel;
    QRLogo: TQRImage;
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
  Q_RelPagtoBoletos: TQ_RelPagtoBoletos;

implementation

Uses U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelPagtoBoletos.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

     Total := (Total + cds_RelPagtoBoletos.FieldByname('valor').AsCurrency);

end;

procedure TQ_RelPagtoBoletos.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

    QR_Total.Caption := FormatFloat ('#,##0.00', Total);

end;

procedure TQ_RelPagtoBoletos.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin

     Total := 0;
     QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);

end;

end.
