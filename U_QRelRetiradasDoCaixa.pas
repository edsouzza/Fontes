unit U_QRelRetiradasDoCaixa;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, SqlExpr, DB,
  DBClient, Provider;

type
  TQ_RelRetiradasDoCaixa = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText3: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    QR_Total: TQRLabel;
    dsp_RetiradasDoCaixa: TDataSetProvider;
    cds_RetiradasDoCaixa: TClientDataSet;
    sql_RetiradasDoCaixa: TSQLDataSet;
    cds_RetiradasDoCaixaDATA: TDateField;
    cds_RetiradasDoCaixaHISTORICO: TStringField;
    cds_RetiradasDoCaixaVALOR_MOVIMENTO: TFMTBCDField;
    QRLabel4: TQRLabel;
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
      TotalValores : Extended;
  end;

var
  Q_RelRetiradasDoCaixa: TQ_RelRetiradasDoCaixa;

implementation

uses U_dmDados,U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelRetiradasDoCaixa.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   TotalValores := (TotalValores + cds_RetiradasDoCaixa.FIELDBYNAME('VALOR_MOVIMENTO').AsCurrency);
end;

procedure TQ_RelRetiradasDoCaixa.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QR_Total.Caption := FormatFloat ('#,##0.00', -TotalValores);
end;

procedure TQ_RelRetiradasDoCaixa.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  TotalValores :=0;
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
