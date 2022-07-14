unit U_QRelFabricantes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelFabricantes = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qr_Titulo: TQRLabel;
    qrsysdt2: TQRSysData;
    qrgrp1: TQRGroup;
    qrlbl3: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    qrbndDetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    sql_RelFabricantes: TSQLDataSet;
    dsp_RelFabricantes: TDataSetProvider;
    cds_RelFabricantes: TClientDataSet;
    ds_RelFabricantes: TDataSource;
    cds_RelFabricantesID_FABRICANTE: TIntegerField;
    cds_RelFabricantesNOME_FABRICANTE: TStringField;
  private

  public

  end;

var
  Q_RelFabricantes: TQ_RelFabricantes;

implementation

uses U_dmDados;

{$R *.DFM}

end.
