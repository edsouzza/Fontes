unit U_QRelFuncCompleto;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, SqlExpr;

type
  TQ_RelFuncCompleto = class(TQuickRep)
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
    qrdbtxtFUNC_ID: TQRDBText;
    qrdbtxtFUNC_NOME: TQRDBText;
    qrlbl20: TQRLabel;
    qrlbl21: TQRLabel;
    qrlbl23: TQRLabel;
    qrlbl24: TQRLabel;
    qrlbl25: TQRLabel;
    qrlbl26: TQRLabel;
    qrlbl27: TQRLabel;
    qrlbl28: TQRLabel;
    qrdbtxtFUNC_DATACAD: TQRDBText;
    edtSTATUS: TQRDBText;
    qrlbl29: TQRLabel;
    qrdbtxtCLI_APELIDO: TQRDBText;
    qrdbtxtCLI_ENDERECO: TQRDBText;
    qrdbtxtCLI_CEP: TQRDBText;
    qrdbtxtCLI_EMAIL: TQRDBText;
    qrlbl2: TQRLabel;
    qrdbtxtFUNC_FUNCAOID: TQRDBText;
    qrlbl3: TQRLabel;
    qrdbtxt2: TQRDBText;
    Qry_Func: TSQLQuery;
    QRLabel2: TQRLabel;
    QRLabelTotal: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    Qry_FuncFUNC_ID: TIntegerField;
    Qry_FuncFUNC_FUNCAOID: TIntegerField;
    Qry_FuncFUNC_NOME: TStringField;
    Qry_FuncFUNC_ENDERECO: TStringField;
    Qry_FuncFUNC_BAIRRO: TStringField;
    Qry_FuncFUNC_COMPLEMENTO: TStringField;
    Qry_FuncFUNC_CEP: TStringField;
    Qry_FuncFUNC_TELEFONE1: TStringField;
    Qry_FuncFUNC_TELEFONE2: TStringField;
    Qry_FuncFUNC_CELULAR1: TStringField;
    Qry_FuncFUNC_CELULAR2: TStringField;
    Qry_FuncFUNC_EMAIL: TStringField;
    Qry_FuncFUNC_DATACAD: TStringField;
    Qry_FuncFUNC_STATUS: TStringField;
    Qry_FuncFUNC_OBS: TStringField;
    Qry_FuncFUNCAO_ID: TIntegerField;
    Qry_FuncFUNCAO_DESCRICAO: TStringField;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    qrlbl22: TQRLabel;
    qrdbtxtCLI_COMPLEMENTO: TQRDBText;
    Qry_FuncFUNC_LOGIN: TStringField;
    Qry_FuncFUNC_DATANASCTO: TDateField;
    QRLogo: TQRImage;
    qrbTitulo: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelFuncCompleto: TQ_RelFuncCompleto;

implementation

uses U_dmDados, U_dmDadosSegundo, U_BiblioSysSalao;

{$R *.DFM}

{ TQ_RelFuncCompleto }

procedure TQ_RelFuncCompleto.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
