unit U_QRelFornecedorCompleto;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, SqlExpr;

type
  TQ_RelFornecedorCompleto = class(TQuickRep)
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
    qrdbtxtFORNE_ID: TQRDBText;
    qrdbtxtFORNE_NOME: TQRDBText;
    qrlbl20: TQRLabel;
    qrlbl21: TQRLabel;
    qrlbl22: TQRLabel;
    qrlbl23: TQRLabel;
    qrlbl25: TQRLabel;
    qrlbl26: TQRLabel;
    qrlbl27: TQRLabel;
    qrdbtxtFORNE_DATACAD: TQRDBText;
    qrlbl29: TQRLabel;
    qrdbtxtCLI_APELIDO: TQRDBText;
    qrdbtxtCLI_ENDERECO: TQRDBText;
    qrdbtxtCLI_COMPLEMENTO: TQRDBText;
    qrdbtxtCLI_CEP: TQRDBText;
    qrdbtxtCLI_EMAIL: TQRDBText;
    Qry_Fornecedores: TSQLQuery;
    QRLabel1: TQRLabel;
    QRLabelTotal: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrdbtxtCLI_FONE: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLogo: TQRImage;
    qrbTitulo: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelFornecedorCompleto: TQ_RelFornecedorCompleto;

implementation

uses U_dmDados, U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelFornecedorCompleto.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
