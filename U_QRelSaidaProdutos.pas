unit U_QRelSaidaProdutos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, SqlExpr,
  Provider, DBClient;

type
  TQ_RelSaidaProdutos = class(TQuickRep)
    titulo: TQRBand;
    qrsysdt2: TQRSysData;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
    qrsysdt3: TQRSysData;
    detalhe: TQRBand;
    qrdbtxtPGTO_ID: TQRDBText;
    qrdbtxtDESCRIPAGTO_DESCRICAO: TQRDBText;
    qrdbtxtDATALANCAMENTO: TQRDBText;
    cds_RelSaidaProdutos: TClientDataSet;
    dsp_RelSaidaProdutos: TDataSetProvider;
    qry_RelSaidaProdutos: TSQLQuery;
    qrlbl16: TQRLabel;
    qrlbl17: TQRLabel;
    qrlbl6: TQRLabel;
    qrlbl5: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    cds_RelSaidaProdutosPRODUTO_ID: TIntegerField;
    cds_RelSaidaProdutosPRECOCOMPRA: TFMTBCDField;
    cds_RelSaidaProdutosPRECOVENDA: TFMTBCDField;
    cds_RelSaidaProdutosVALORDELUCRO: TFMTBCDField;
    cds_RelSaidaProdutosQDE: TFMTBCDField;
    cds_RelSaidaProdutosTOTALUCRO: TFloatField;
    QRDBText5: TQRDBText;
    cds_RelSaidaProdutosCOD_BARRAS: TStringField;
    cds_RelSaidaProdutosDESCRICAO: TStringField;
    QRLogo: TQRImage;
    QRLinhaDivisoria: TQRShape;
    qrbTitulo: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure detalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure cds_RelSaidaProdutosCalcFields(DataSet: TDataSet);
  private

  public
  TotalValores, TotalLucro : Extended;
  end;

var
  Q_RelSaidaProdutos: TQ_RelSaidaProdutos;

implementation

uses U_dmDados, U_dmDadosSegundo, U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelSaidaProdutos.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   TotalValores :=0;
   QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

procedure TQ_RelSaidaProdutos.detalheBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
     TotalValores     := TotalValores + cds_RelSaidaProdutos.FIELDBYNAME('TOTALUCRO').AsCurrency;
end;

procedure TQ_RelSaidaProdutos.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

procedure TQ_RelSaidaProdutos.cds_RelSaidaProdutosCalcFields(
  DataSet: TDataSet);
begin
   cds_RelSaidaProdutos.FIELDBYNAME('TOTALUCRO').AsFloat := ( cds_RelSaidaProdutos.FIELDBYNAME('QDE').AsInteger) * (cds_RelSaidaProdutos.FIELDBYNAME('VALORDELUCRO').AsFloat);
end;

end.
