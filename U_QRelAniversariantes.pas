unit U_QRelAniversariantes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DBClient, Provider,
  DB, SqlExpr;

type
  TQ_RelAniversariantes = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrbndDetailBand1: TQRBand;
    qrdbtxtNASCIMENTO: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    qry_RelAniversariantes: TSQLQuery;
    dsp_RelAniversariantes: TDataSetProvider;
    cds_RelAniversariantes: TClientDataSet;
    QRDBText1: TQRDBText;
    cds_RelAniversariantesCLI_NOME: TStringField;
    cds_RelAniversariantesCLI_DATANASCTO: TDateField;
    QRLogo: TQRImage;
    Qr_titulo: TQRLabel;
    qrsysdt2: TQRSysData;
    qrlbl6: TQRLabel;
    qrlbl2: TQRLabel;
    lblnomeDoMes: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelAniversariantes: TQ_RelAniversariantes;

implementation

uses U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelAniversariantes.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
