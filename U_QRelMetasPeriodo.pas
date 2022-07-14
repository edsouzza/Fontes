unit U_QRelMetasPeriodo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, SqlExpr, Provider,
  DB, DBClient;

type
  TQ_RelMetasPeriodo = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qr_Titulo: TQRLabel;
    qrsysdt2: TQRSysData;
    QRLabel2: TQRLabel;
    qrlbl3: TQRLabel;
    QRLabel1: TQRLabel;
    qrlbl2: TQRLabel;
    QRLabel3: TQRLabel;
    qrbndDetailBand1: TQRBand;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    qrdbtxtVALOR_TOTAL: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    cds_RelMetasPeriodo: TClientDataSet;
    dsp_RelMetasPeriodo: TDataSetProvider;
    qry_RelMetasPeriodo: TSQLQuery;
    cds_RelMetasPeriodoID_META: TIntegerField;
    cds_RelMetasPeriodoDTINICIAL: TDateField;
    cds_RelMetasPeriodoDTFINAL: TDateField;
    cds_RelMetasPeriodoVL_ABERTURAMETA: TFMTBCDField;
    cds_RelMetasPeriodoVL_FECHAMENTOMETA: TFMTBCDField;
    cds_RelMetasPeriodoRESULTADO: TStringField;
    cds_RelMetasPeriodoMESANO: TStringField;
    cds_RelMetasPeriodoSTATUS: TStringField;
  private

  public

  end;

var
  Q_RelMetasPeriodo: TQ_RelMetasPeriodo;

implementation

{$R *.DFM}

end.
