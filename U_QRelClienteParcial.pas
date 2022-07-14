unit U_QRelClienteParcial;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, SqlExpr;

type
  TQ_RelClienteParcial = class(TQuickRep)
    qrbndTitleBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrbndDetailBand1: TQRBand;
    qrshp2: TQRShape;
    qrshp1: TQRShape;
    qrshp3: TQRShape;
    qrlbl2: TQRLabel;
    qrlbl3: TQRLabel;
    qrlbl4: TQRLabel;
    qrlbl5: TQRLabel;
    qrdbtxtCLI_ID: TQRDBText;
    qrdbtxtCLI_NOME: TQRDBText;
    qrlbl6: TQRLabel;
    qrlbl7: TQRLabel;
    qrlbl8: TQRLabel;
    qrlbl9: TQRLabel;
    qrlbl11: TQRLabel;
    qrlbl12: TQRLabel;
    qrlbl13: TQRLabel;
    qrlbl14: TQRLabel;
    qrdbtxtCLI_DATACAD: TQRDBText;
    qrdbtxtCLI_STATUS: TQRDBText;
    qrlbl15: TQRLabel;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
    qrsysdt3: TQRSysData;
    Qry_ClienteIndividual: TSQLQuery;
    qrdbtxtCLI_APELIDO: TQRDBText;
    qrdbtxtCLI_DATANASCTO: TQRDBText;
    qrdbtxtCLI_ENDERECO: TQRDBText;
    qrdbtxtCLI_COMPLEMENTO: TQRDBText;
    qrdbtxtCLI_CEP: TQRDBText;
    qrdbtxtCLI_EMAIL: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrdbtxtCLI_FONE: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText9: TQRDBText;
    QRLogo: TQRImage;
    qrbTitulo: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelClienteParcial: TQ_RelClienteParcial;

implementation

uses U_dmDados, U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelClienteParcial.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
