unit U_QRelMovimentosCaixa;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DBClient, Provider,
  DB, SqlExpr;

type
  TQ_RelMovimentosCaixa = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrbndDetailBand1: TQRBand;
    qrdbtxtVALOR_TOTAL: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    qrlbl9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QR_Total: TQRLabel;
    Qry_RelMovimentosCaixa: TSQLQuery;
    cds_RelMovimentosCaixa: TClientDataSet;
    dsp_RelMovimentosCaixa: TDataSetProvider;
    cds_RelMovimentosCaixaID_VENDA: TIntegerField;
    cds_RelMovimentosCaixaID_VENDEDOR: TIntegerField;
    cds_RelMovimentosCaixaVL_TROCO: TFMTBCDField;
    cds_RelMovimentosCaixaDATA_VENDA: TDateField;
    cds_RelMovimentosCaixaFUNC_ID: TIntegerField;
    cds_RelMovimentosCaixaFUNC_NOME: TStringField;
    cds_RelMovimentosCaixaVL_TOTALPAGAR: TFMTBCDField;
    QRDBText2: TQRDBText;
    cds_RelMovimentosCaixaORCAMENTO_ID: TIntegerField;
    QRLogo: TQRImage;
    qrbTitulo: TQRLabel;
    qrsysdt2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    qrlbl2: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     TotalValores : Extended;
  public

  end;

var
  Q_RelMovimentosCaixa: TQ_RelMovimentosCaixa;

implementation

uses U_dmDadosSegundo, U_dmDados, U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelMovimentosCaixa.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    TotalValores :=0;
    QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

procedure TQ_RelMovimentosCaixa.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin

   TotalValores := TotalValores + cds_RelMovimentosCaixa.FIELDBYNAME('VL_TOTALPAGAR').AsCurrency;

end;

procedure TQ_RelMovimentosCaixa.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

    QR_Total.Caption    := FormatFloat ('#,##0.00', TotalValores);

end;

end.
