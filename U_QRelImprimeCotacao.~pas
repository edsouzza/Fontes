unit U_QRelImprimeCotacao;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelImprimeCotacao = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    qrsysdt2: TQRSysData;
    qrlbl2: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    qrlbl3: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    qrbndDetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    Q_TotalItem: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    qry_RelImprimeCotacao: TSQLQuery;
    dsp_RelImprimeCotacao: TDataSetProvider;
    cds_RelImprimeCotacao: TClientDataSet;
    cds_RelImprimeCotacaoID_COTACAO: TIntegerField;
    cds_RelImprimeCotacaoID_CLIENTE: TIntegerField;
    cds_RelImprimeCotacaoTOTAL: TBCDField;
    cds_RelImprimeCotacaoDATA: TDateField;
    cds_RelImprimeCotacaoID_DETALHESCOTACAO: TIntegerField;
    cds_RelImprimeCotacaoCOTACAO_ID: TIntegerField;
    cds_RelImprimeCotacaoPRODUTO_ID: TIntegerField;
    cds_RelImprimeCotacaoUNITARIO: TFMTBCDField;
    cds_RelImprimeCotacaoQUANTIDADE: TFMTBCDField;
    cds_RelImprimeCotacaoTOTALITEM: TFMTBCDField;
    cds_RelImprimeCotacaoCLI_ID: TIntegerField;
    cds_RelImprimeCotacaoCLI_NOME: TStringField;
    cds_RelImprimeCotacaoID_PRODUTO: TIntegerField;
    cds_RelImprimeCotacaoDESCRICAO: TStringField;
    QRLabel4: TQRLabel;
    lblNomeUsuarioLogado: TQRLabel;
    cds_RelImprimeCotacaoCLI_CPFCNPJ: TStringField;
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
  Q_RelImprimeCotacao: TQ_RelImprimeCotacao;

implementation

{$R *.DFM}

procedure TQ_RelImprimeCotacao.qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    TotalValores := TotalValores + cds_RelImprimeCotacao.FIELDBYNAME('TOTALITEM').AsCurrency;
end;

procedure TQ_RelImprimeCotacao.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

procedure TQ_RelImprimeCotacao.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
TotalValores :=0;
end;

end.
