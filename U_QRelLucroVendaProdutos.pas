unit U_QRelLucroVendaProdutos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelLucroVendaProdutos = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrb_titulo: TQRLabel;
    qrsysdt2: TQRSysData;
    QRLabel4: TQRLabel;
    Q_NomeUsuarioLogado: TQRLabel;
    QRBand1: TQRBand;
    Q_TotalItem: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    qry_RelVendaProdutos: TSQLQuery;
    dsp_RelVendaProdutos: TDataSetProvider;
    cds_RelVendaProdutos: TClientDataSet;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    qrlbl2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    cds_RelVendaProdutosDESCRICAO: TStringField;
    cds_RelVendaProdutosPRODUTO_ID: TIntegerField;
    cds_RelVendaProdutosVENDA_ID: TIntegerField;
    cds_RelVendaProdutosQUANTIDADE: TFMTBCDField;
    cds_RelVendaProdutosVALORDELUCRO: TFMTBCDField;
    cds_RelVendaProdutosPRECOCOMPRA: TFMTBCDField;
    cds_RelVendaProdutosPRECOVENDA: TFMTBCDField;
    QRLabel5: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
       TotalValoresVendas : Extended;
  end;

var
  Q_RelLucroVendaProdutos: TQ_RelLucroVendaProdutos;

implementation

{$R *.DFM}

procedure TQ_RelLucroVendaProdutos.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin

    TotalValoresVendas := (TotalValoresVendas + cds_RelVendaProdutos.FieldByname('VALORDELUCRO').AsCurrency);

end;

procedure TQ_RelLucroVendaProdutos.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

     QR_Total.Caption := FormatFloat ('#,##0.00', TotalValoresVendas);

end;

procedure TQ_RelLucroVendaProdutos.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin

    TotalValoresVendas := 0;

end;

end.
