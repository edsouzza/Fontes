unit U_QRelFuncsAniversariantes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelFuncAniversariantes = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrlbl6: TQRLabel;
    qrlbl2: TQRLabel;
    qrbndDetailBand1: TQRBand;
    qry_RelFuncAniversariantes: TSQLQuery;
    dsp_RelFuncAniversariantes: TDataSetProvider;
    cds_RelFuncAniversariantes: TClientDataSet;
    cds_RelFuncAniversariantesFUNC_NOME: TStringField;
    cds_RelFuncAniversariantesFUNC_DATANASCTO: TDateField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    Qr_titulo: TQRLabel;
    lblnomeDoMes: TQRLabel;
    QRLogo: TQRImage;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);

  private

  public

  end;

var
  Q_RelFuncAniversariantes: TQ_RelFuncAniversariantes;

implementation

uses U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelFuncAniversariantes.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
