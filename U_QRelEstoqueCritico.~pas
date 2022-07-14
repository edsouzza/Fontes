unit U_QRelEstoqueCritico;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelEstoqueCritico = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrbndDetailBand1: TQRBand;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    QRDBText2: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    qry_RelEstoqueCritico: TSQLDataSet;
    dsp_RelEstoqueCritico: TDataSetProvider;
    cds_RelEstoqueCritico: TClientDataSet;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    cds_RelEstoqueCriticoDESCRICAO: TStringField;
    cds_RelEstoqueCriticoESTOQUE_ATUAL: TFMTBCDField;
    cds_RelEstoqueCriticoESTOQUEMINIMO: TFMTBCDField;
    QRLinhaDivisoria: TQRShape;
    QRLogo: TQRImage;
    qrbTitulo: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelEstoqueCritico: TQ_RelEstoqueCritico;

implementation

uses U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelEstoqueCritico.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
