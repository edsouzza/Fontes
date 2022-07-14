unit U_QRelPorFornecedores;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelPorFornecedores = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrsysdt2: TQRSysData;
    QRLogo: TQRImage;
    qrbTitulo: TQRLabel;
    qrgrp1: TQRGroup;
    qrlbl3: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    qrbndDetailBand1: TQRBand;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    QRDBText2: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    qry_RelFornecedores: TSQLDataSet;
    dsp_RelFornecedores: TDataSetProvider;
    cds_RelFornecedores: TClientDataSet;
    cds_RelFornecedoresFORNE_ID: TIntegerField;
    cds_RelFornecedoresFORNE_NOME: TStringField;
    cds_RelFornecedoresFORNECEDOR_ID: TIntegerField;
    cds_RelFornecedoresDESCRICAO: TStringField;
    cds_RelFornecedoresESTOQUE_ATUAL: TFMTBCDField;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelPorFornecedores: TQ_RelPorFornecedores;

implementation

uses  U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelPorFornecedores.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
