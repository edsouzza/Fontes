unit U_QRelImprimeOS;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr, jpeg;

type
  TQ_RelImprimeOS = class(TQuickRep)
    qry_RelImprimeOS: TSQLQuery;
    dsp_RelImprimeOS: TDataSetProvider;
    cds_RelImprimeOS: TClientDataSet;
    ds_RelImprimeOS: TDataSource;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRDBText10: TQRDBText;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape9: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText18: TQRDBText;
    QRShape5: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText14: TQRDBText;
    qrsysdt1: TQRSysData;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText41: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel40: TQRLabel;
    QRShape17: TQRShape;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText49: TQRDBText;
    logo: TQRImage;
    QRDBText1: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText47: TQRDBText;
    logo1: TQRImage;
    QRDBText51: TQRDBText;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText48: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText50: TQRDBText;
    cds_RelImprimeOSID_OS: TIntegerField;
    cds_RelImprimeOSCLIENTE_ID: TIntegerField;
    cds_RelImprimeOSOPERADOR_ID: TIntegerField;
    cds_RelImprimeOSEQUIPAMENTO: TStringField;
    cds_RelImprimeOSNUMSERIE: TStringField;
    cds_RelImprimeOSMARCA: TStringField;
    cds_RelImprimeOSMODELO: TStringField;
    cds_RelImprimeOSACESSORIOS: TStringField;
    cds_RelImprimeOSVL_ORCAMENTO: TFMTBCDField;
    cds_RelImprimeOSVL_DESCONTO: TFMTBCDField;
    cds_RelImprimeOSVL_TROCO: TFMTBCDField;
    cds_RelImprimeOSVL_RECEBIDO: TFMTBCDField;
    cds_RelImprimeOSPROBLEMA: TStringField;
    cds_RelImprimeOSDATA_ABERTURA: TDateField;
    cds_RelImprimeOSDATA_FECHAMENTO: TDateField;
    cds_RelImprimeOSSTATUS: TStringField;
    cds_RelImprimeOSCLI_ID: TIntegerField;
    cds_RelImprimeOSCLI_NOME: TStringField;
    cds_RelImprimeOSCLI_APELIDO: TStringField;
    cds_RelImprimeOSCLI_ENDERECO: TStringField;
    cds_RelImprimeOSCLI_COMPLEMENTO: TStringField;
    cds_RelImprimeOSCLI_CEP: TStringField;
    cds_RelImprimeOSCLI_DDDFONE: TStringField;
    cds_RelImprimeOSCLI_FONE: TStringField;
    cds_RelImprimeOSCLI_DDDFONE2: TStringField;
    cds_RelImprimeOSCLI_FONE2: TStringField;
    cds_RelImprimeOSCLI_DDDFONE3: TStringField;
    cds_RelImprimeOSCLI_FONE3: TStringField;
    cds_RelImprimeOSCLI_DDDFONE4: TStringField;
    cds_RelImprimeOSCLI_FONE4: TStringField;
    cds_RelImprimeOSCLI_EMAIL: TStringField;
    cds_RelImprimeOSCLI_DATANASCTO: TDateField;
    cds_RelImprimeOSCLI_DATACAD: TStringField;
    cds_RelImprimeOSCLI_STATUS: TStringField;
    cds_RelImprimeOSCLI_HISTORICO: TMemoField;
    cds_RelImprimeOSCLI_OBS: TStringField;
    cds_RelImprimeOSFUNC_ID: TIntegerField;
    cds_RelImprimeOSFUNC_NOME: TStringField;
    QRDBText3: TQRDBText;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    cds_RelImprimeOSCLI_CPF: TStringField;
    cds_RelImprimeOSCLI_CNPJ: TStringField;
    QRLabel47: TQRLabel;
    QRDBText52: TQRDBText;
  private

  public

  end;

var
  Q_RelImprimeOS: TQ_RelImprimeOS;

implementation

uses U_dmDadosSegundo;

{$R *.DFM}

end.
