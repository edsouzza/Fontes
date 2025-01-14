unit U_QRelPorFabricantes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DBClient, Provider,
  DB, SqlExpr;

type
  TQ_RelPorFabricantes = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrgrp1: TQRGroup;
    qrlbl3: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    qrbndDetailBand1: TQRBand;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    dsp_RelPorFabricantes: TDataSetProvider;
    cds_RelPorFabricantes: TClientDataSet;
    qry_RelPorFabricantes: TSQLDataSet;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    cds_RelPorFabricantesID_FABRICANTE: TIntegerField;
    cds_RelPorFabricantesNOME_FABRICANTE: TStringField;
    cds_RelPorFabricantesDESCRICAO: TStringField;
    cds_RelPorFabricantesFABRICANTE_ID: TIntegerField;
    cds_RelPorFabricantesESTOQUE_ATUAL: TFMTBCDField;
    QRLogo: TQRImage;
    qrbTitulo: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelPorFabricantes: TQ_RelPorFabricantes;

implementation

uses U_dmDadosSegundo, U_dmDados, U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelPorFabricantes.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
