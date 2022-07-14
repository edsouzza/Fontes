unit U_QRelClienteCompleto;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, SqlExpr;

type
  TQ_RelClienteCompleto = class(TQuickRep)
    qrbndTitleBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
    qrbnd2: TQRBand;
    qrshp4: TQRShape;
    qrshp5: TQRShape;
    qrshp6: TQRShape;
    qrlbl16: TQRLabel;
    qrlbl17: TQRLabel;
    qrlbl18: TQRLabel;
    qrlbl19: TQRLabel;
    qrdbtxt1: TQRDBText;
    qrdbtxt2: TQRDBText;
    qrlbl20: TQRLabel;
    qrlbl21: TQRLabel;
    qrlbl22: TQRLabel;
    qrlbl23: TQRLabel;
    qrlbl25: TQRLabel;
    qrlbl26: TQRLabel;
    qrlbl27: TQRLabel;
    qrlbl28: TQRLabel;
    qrdbtxt3: TQRDBText;
    qrdbtxt4: TQRDBText;
    qrlbl29: TQRLabel;
    qrdbtxtCLI_APELIDO: TQRDBText;
    qrdbtxtCLI_DATANASCTO: TQRDBText;
    qrdbtxtCLI_ENDERECO: TQRDBText;
    qrdbtxtCLI_COMPLEMENTO: TQRDBText;
    qrdbtxtCLI_CEP: TQRDBText;
    qrdbtxtCLI_EMAIL: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabelTotal: TQRLabel;
    Qry_Clientes: TSQLQuery;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    qrdbtxtCLI_FONE: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText9: TQRDBText;
    Qry_ClientesCLI_ID: TIntegerField;
    Qry_ClientesCLI_NOME: TStringField;
    Qry_ClientesCLI_APELIDO: TStringField;
    Qry_ClientesCLI_ENDERECO: TStringField;
    Qry_ClientesCLI_COMPLEMENTO: TStringField;
    Qry_ClientesCLI_CPF: TStringField;
    Qry_ClientesCLI_CNPJ: TStringField;
    Qry_ClientesCLI_IE: TStringField;
    Qry_ClientesCLI_CEP: TStringField;
    Qry_ClientesCLI_DDDFONE: TStringField;
    Qry_ClientesCLI_FONE: TStringField;
    Qry_ClientesCLI_DDDFONE2: TStringField;
    Qry_ClientesCLI_FONE2: TStringField;
    Qry_ClientesCLI_DDDFONE3: TStringField;
    Qry_ClientesCLI_FONE3: TStringField;
    Qry_ClientesCLI_DDDFONE4: TStringField;
    Qry_ClientesCLI_FONE4: TStringField;
    Qry_ClientesCLI_EMAIL: TStringField;
    Qry_ClientesCLI_DATANASCTO: TDateField;
    Qry_ClientesCLI_DATACAD: TStringField;
    Qry_ClientesCLI_STATUS: TStringField;
    Qry_ClientesCLI_HISTORICO: TMemoField;
    Qry_ClientesCLI_OBS: TStringField;
    QRLogo: TQRImage;
    qrbTitulo: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelClienteCompleto: TQ_RelClienteCompleto;

implementation

uses U_dmDados, U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelClienteCompleto.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
