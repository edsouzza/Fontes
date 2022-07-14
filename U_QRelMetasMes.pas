unit U_QRelMetasMes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, SqlExpr, Provider,
  DB, DBClient;

type
  TQ_RelMetasMes = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qr_Titulo: TQRLabel;
    qrsysdt2: TQRSysData;
    QRLabel2: TQRLabel;
    qrlbl3: TQRLabel;
    QRLabel1: TQRLabel;
    qrlbl2: TQRLabel;
    qrbndDetailBand1: TQRBand;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    qrdbtxtVALOR_TOTAL: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    cds_RelMetasMes: TClientDataSet;
    dsp_RelMetas: TDataSetProvider;
    qry_RelMetasMes: TSQLQuery;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    cds_RelMetasMesID_META: TIntegerField;
    cds_RelMetasMesDTINICIAL: TDateField;
    cds_RelMetasMesDTFINAL: TDateField;
    cds_RelMetasMesVL_ABERTURAMETA: TFMTBCDField;
    cds_RelMetasMesVL_FECHAMENTOMETA: TFMTBCDField;
    cds_RelMetasMesRESULTADO: TStringField;
    cds_RelMetasMesMESANO: TStringField;
    cds_RelMetasMesSTATUS: TStringField;
  private

  public

  end;

var
  Q_RelMetasMes: TQ_RelMetasMes;

implementation

{$R *.DFM}

end.
