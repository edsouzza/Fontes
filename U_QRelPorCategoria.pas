unit U_QRelPorCategoria;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DBClient, Provider,
  DB, SqlExpr;

type
  TQ_RelPorCategorias = class(TQuickRep)
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
    dsp_RelCategorias: TDataSetProvider;
    cds_RelCategorias: TClientDataSet;
    qry_RelCategorias: TSQLDataSet;
    cds_RelCategoriasID_CATEGORIA: TIntegerField;
    cds_RelCategoriasCATEGORIA: TStringField;
    cds_RelCategoriasCATEGORIA_ID: TIntegerField;
    cds_RelCategoriasDESCRICAO: TStringField;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    cds_RelCategoriasESTOQUE_ATUAL: TFMTBCDField;
    QRLogo: TQRImage;
    qrbTitulo: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelPorCategorias: TQ_RelPorCategorias;

implementation

uses U_dmDadosSegundo, U_dmDados, U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelPorCategorias.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
