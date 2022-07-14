unit U_QRelCupomOS;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelCupomOS = class(TQuickRep)
    QRBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrbndDetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    Q_TotalItem: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    qry_RelCupomOS: TSQLQuery;
    dsp_RelCupomOS: TDataSetProvider;
    cds_RelCupomOS: TClientDataSet;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QryEmpresa: TSQLQuery;
    QryEmpresaRAZAOSOCIAL: TStringField;
    QryEmpresaENDERECO: TStringField;
    QryEmpresaCIDADE: TStringField;
    QryEmpresaUF: TStringField;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QryEmpresaTELEFONE: TStringField;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    lblNomeUsuarioLogado: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel16: TQRLabel;
    cds_RelCupomOSCLI_ID: TIntegerField;
    cds_RelCupomOSCLI_NOME: TStringField;
    cds_RelCupomOSCLIENTE_ID: TIntegerField;
    cds_RelCupomOSVL_RECEBIDO: TFMTBCDField;
    cds_RelCupomOSVL_TROCO: TFMTBCDField;
    cds_RelCupomOSVL_DESCONTO: TFMTBCDField;
    cds_RelCupomOSPROBLEMA: TStringField;
    cds_RelCupomOSID_OS: TIntegerField;
    cds_RelCupomOSVL_ORCAMENTO: TFMTBCDField;
    QRLabel1: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText3: TQRDBText;
    QryEmpresaID_EMPRESA: TIntegerField;
    QryEmpresaDDD: TStringField;
    QryEmpresaEMAIL: TStringField;
    QryEmpresaCNPJ: TStringField;
    QryEmpresaIE: TStringField;
    QryEmpresaCEP: TStringField;
    QRLabel18: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel19: TQRLabel;
    QryEmpresaMSG: TStringField;
    QRDBText16: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText19: TQRDBText;
    cds_RelCupomOSCLI_CPF: TStringField;
    cds_RelCupomOSCLI_CNPJ: TStringField;
    procedure qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
       TotalValores : Extended;
  end;

var
  Q_RelCupomOS: TQ_RelCupomOS;

implementation

uses U_dmDadosSegundo, U_dmDados;

{$R *.DFM}

procedure TQ_RelCupomOS.qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    TotalValores := TotalValores + cds_RelCupomOS.FIELDBYNAME('VL_ORCAMENTO').AsCurrency;
end;

procedure TQ_RelCupomOS.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

procedure TQ_RelCupomOS.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
TotalValores :=0;
end;

end.
