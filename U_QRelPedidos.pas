unit U_QRelPedidos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelPedidos = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrlbl8: TQRLabel;
    qrgrp1: TQRGroup;
    qrlbl2: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    qrbndDetailBand1: TQRBand;
    qrdbtxtVALOR_TOTAL: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    Qry_RelPedidos: TSQLQuery;
    dsp_RelPedidos: TDataSetProvider;
    cds_RelPedidos: TClientDataSet;
    cds_RelPedidosNUMPEDIDO: TStringField;
    cds_RelPedidosDATA_ABERTURA: TDateField;
    cds_RelPedidosDATA_ENTREGA: TDateField;
    cds_RelPedidosVL_TOTALPEDIDO: TFMTBCDField;
    cds_RelPedidosSTATUS: TStringField;
    cds_RelPedidosPEDIDO_ID: TIntegerField;
    cds_RelPedidosVL_UNITARIO: TFMTBCDField;
    cds_RelPedidosQDE: TFMTBCDField;
    cds_RelPedidosVL_TOTALITEM: TFMTBCDField;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    cds_RelPedidosFORNE_NOME: TStringField;
    cds_RelPedidosDESCRICAO: TStringField;
    cds_RelPedidosNOME: TStringField;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
     TotalValores : Extended;
  end;

var
  Q_RelPedidos: TQ_RelPedidos;

implementation

uses U_dmDadosSegundo, U_dmDados;

{$R *.DFM}


procedure TQ_RelPedidos.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
      TotalValores :=0;
end;

procedure TQ_RelPedidos.qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
       TotalValores := TotalValores + cds_RelPedidos.FIELDBYNAME('VL_TOTALITEM').AsCurrency;
end;

procedure TQ_RelPedidos.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

end.
