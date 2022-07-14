unit U_QRelFuncParcial;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, SqlExpr;

type
  TQ_RelFuncIndividual = class(TQuickRep)
    qrbndTitleBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrbnd2: TQRBand;
    qrshp4: TQRShape;
    qrshp5: TQRShape;
    qrshp6: TQRShape;
    qrlbl16: TQRLabel;
    qrlbl17: TQRLabel;
    qrlbl18: TQRLabel;
    qrlbl19: TQRLabel;
    qrdbtxtFUNC_ID: TQRDBText;
    qrdbtxtFUNC_NOME: TQRDBText;
    qrlbl20: TQRLabel;
    qrlbl21: TQRLabel;
    qrlbl22: TQRLabel;
    qrlbl23: TQRLabel;
    qrlbl24: TQRLabel;
    qrlbl25: TQRLabel;
    qrlbl26: TQRLabel;
    qrlbl27: TQRLabel;
    qrlbl28: TQRLabel;
    qrdbtxtFUNC_DATACAD: TQRDBText;
    qrlbl29: TQRLabel;
    qrdbtxtCLI_APELIDO: TQRDBText;
    qrdbtxtCLI_DATANASCTO: TQRDBText;
    qrdbtxtCLI_ENDERECO: TQRDBText;
    qrdbtxtCLI_COMPLEMENTO: TQRDBText;
    qrdbtxtCLI_CEP: TQRDBText;
    qrdbtxtFUNC_FONE: TQRDBText;
    qrdbtxtCLI_EMAIL: TQRDBText;
    qrlbl2: TQRLabel;
    qrdbtxtFUNC_FUNCAOID: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
    qrsysdt3: TQRSysData;
    Qry_FuncIndividual: TSQLQuery;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    lblSTATUS: TQRLabel;
    Qry_FuncIndividualFUNC_ID: TIntegerField;
    Qry_FuncIndividualFUNC_FUNCAOID: TIntegerField;
    Qry_FuncIndividualFUNC_NOME: TStringField;
    Qry_FuncIndividualFUNC_ENDERECO: TStringField;
    Qry_FuncIndividualFUNC_BAIRRO: TStringField;
    Qry_FuncIndividualFUNC_COMPLEMENTO: TStringField;
    Qry_FuncIndividualFUNC_CEP: TStringField;
    Qry_FuncIndividualFUNC_TELEFONE1: TStringField;
    Qry_FuncIndividualFUNC_TELEFONE2: TStringField;
    Qry_FuncIndividualFUNC_CELULAR1: TStringField;
    Qry_FuncIndividualFUNC_CELULAR2: TStringField;
    Qry_FuncIndividualFUNC_EMAIL: TStringField;
    Qry_FuncIndividualFUNC_STATUS: TStringField;
    Qry_FuncIndividualFUNC_OBS: TStringField;
    Qry_FuncIndividualFUNCAO_ID: TIntegerField;
    Qry_FuncIndividualFUNCAO_DESCRICAO: TStringField;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    Qry_FuncIndividualFUNC_LOGIN: TStringField;
    Qry_FuncIndividualFUNC_DATACAD: TStringField;
    Qry_FuncIndividualFUNC_DATANASCTO: TDateField;
    QRLogo: TQRImage;
    qrbTitulo: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelFuncIndividual: TQ_RelFuncIndividual;

implementation
uses  U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelFuncIndividual.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
