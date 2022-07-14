unit U_QRelExtratoCaixa;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelExtratoCaixa = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrbndDetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    Qry_ExtratoCaixa: TSQLQuery;
    dsp_ExtratoCaixa: TDataSetProvider;
    cds_ExtratoCaixa: TClientDataSet;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    cds_ExtratoCaixaID_CAIXA: TIntegerField;
    cds_ExtratoCaixaID_VENDA: TIntegerField;
    cds_ExtratoCaixaSALDO_ANTERIOR: TFMTBCDField;
    cds_ExtratoCaixaVALOR_MOVIMENTO: TFMTBCDField;
    cds_ExtratoCaixaSALDO_ATUAL: TFMTBCDField;
    cds_ExtratoCaixaDATA: TDateField;
    cds_ExtratoCaixaSTATUS: TStringField;
    cds_ExtratoCaixaHISTORICO: TStringField;
    QRLabel2: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLogo: TQRImage;
    qrbTitulo: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelExtratoCaixa: TQ_RelExtratoCaixa;

implementation

uses  U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelExtratoCaixa.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
