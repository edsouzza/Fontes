unit U_QRelMovimentoMensalCaixa;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, SqlExpr, Provider,
  DB, DBClient;

type
  TQ_RelMovimentoMensal = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrbndDetailBand1: TQRBand;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    qrdbtxtVALOR_TOTAL: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    cds_RelMovimentosMensais: TClientDataSet;
    dsp_RelMovimentosMensais: TDataSetProvider;
    Qry_RelMovimentosMensais: TSQLQuery;
    QRDBText2: TQRDBText;
    cds_RelMovimentosMensaisID_VENDA: TIntegerField;
    cds_RelMovimentosMensaisORCAMENTO_ID: TIntegerField;
    cds_RelMovimentosMensaisID_VENDEDOR: TIntegerField;
    cds_RelMovimentosMensaisVL_TROCO: TFMTBCDField;
    cds_RelMovimentosMensaisDATA_VENDA: TDateField;
    cds_RelMovimentosMensaisVL_TOTALPAGAR: TFMTBCDField;
    cds_RelMovimentosMensaisFUNC_ID: TIntegerField;
    cds_RelMovimentosMensaisFUNC_NOME: TStringField;
    QRLogo: TQRImage;
    qrbTitulo: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrlbl2: TQRLabel;
    procedure qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
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
  Q_RelMovimentoMensal: TQ_RelMovimentoMensal;

implementation

uses  U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelMovimentoMensal.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
    TotalValores := TotalValores + cds_RelMovimentosMensais.FIELDBYNAME('VL_TOTALPAGAR').AsCurrency;
    
end;

procedure TQ_RelMovimentoMensal.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

procedure TQ_RelMovimentoMensal.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  TotalValores :=0;
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
