unit U_QRelPedidoPeriodo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelPedidoPeriodo = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrb_titulo: TQRLabel;
    qrsysdt2: TQRSysData;
    QRLabel4: TQRLabel;
    Q_NomeUsuarioLogado: TQRLabel;
    QRBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText2: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    qry_RelPedidoPeriodo: TSQLQuery;
    dsp_RelPedidoPeriodo: TDataSetProvider;
    cds_RelPedidoPeriodo: TClientDataSet;
    ds_RelPedidoPeriodo: TDataSource;
    cds_RelPedidoPeriodoNUMPEDIDO: TStringField;
    cds_RelPedidoPeriodoNUMNF: TStringField;
    cds_RelPedidoPeriodoDATA_ENTREGA: TDateField;
    cds_RelPedidoPeriodoVL_TOTALPEDIDO: TFMTBCDField;
    cds_RelPedidoPeriodoDATA_ABERTURA: TDateField;
    cds_RelPedidoPeriodoFORNECEDOR_ID: TIntegerField;
    cds_RelPedidoPeriodoFORNE_ID: TIntegerField;
    cds_RelPedidoPeriodoFORNE_NOME: TStringField;
    QRDBText3: TQRDBText;
    cds_RelPedidoPeriodoSTATUS: TStringField;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    qrlbl2: TQRLabel;
    QRLabel5: TQRLabel;
  private

  public

  end;

var
  Q_RelPedidoPeriodo: TQ_RelPedidoPeriodo;

implementation

{$R *.DFM}

end.
