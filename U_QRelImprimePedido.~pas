unit U_QRelImprimePedido;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelImprimePedido = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    qrsysdt2: TQRSysData;
    qrlbl2: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    qrlbl3: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    qrbndDetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    Q_TotalItem: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    qry_RelImprimePedido: TSQLQuery;
    dsp_RelImprimePedido: TDataSetProvider;
    cds_RelImprimePedido: TClientDataSet;
    lblNomeUsuarioLogado: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText12: TQRDBText;
    cds_RelImprimePedidoID_PEDIDO: TIntegerField;
    cds_RelImprimePedidoCONTATO_ID: TIntegerField;
    cds_RelImprimePedidoNUMPEDIDO: TStringField;
    cds_RelImprimePedidoFORNECEDOR_ID: TIntegerField;
    cds_RelImprimePedidoDATA_ABERTURA: TDateField;
    cds_RelImprimePedidoVL_TOTALPEDIDO: TFMTBCDField;
    cds_RelImprimePedidoFORNE_ID: TIntegerField;
    cds_RelImprimePedidoFORNE_NOME: TStringField;
    cds_RelImprimePedidoFORNE_APELIDO: TStringField;
    cds_RelImprimePedidoFORNE_ENDERECO: TStringField;
    cds_RelImprimePedidoFORNE_COMPLEMENTO: TStringField;
    cds_RelImprimePedidoFORNE_CEP: TStringField;
    cds_RelImprimePedidoFORNE_DDDFONE: TStringField;
    cds_RelImprimePedidoFORNE_FONE: TStringField;
    cds_RelImprimePedidoFORNE_DDDFONE2: TStringField;
    cds_RelImprimePedidoFORNE_FONE2: TStringField;
    cds_RelImprimePedidoFORNE_DDDFONE3: TStringField;
    cds_RelImprimePedidoFORNE_FONE3: TStringField;
    cds_RelImprimePedidoFORNE_DDDFONE4: TStringField;
    cds_RelImprimePedidoFORNE_FONE4: TStringField;
    cds_RelImprimePedidoFORNE_EMAIL: TStringField;
    cds_RelImprimePedidoFORNE_IE: TStringField;
    cds_RelImprimePedidoFORNE_CNPJ: TStringField;
    cds_RelImprimePedidoFORNE_DATACAD: TStringField;
    cds_RelImprimePedidoFORNE_STATUS: TStringField;
    cds_RelImprimePedidoID_PRODUTO: TIntegerField;
    cds_RelImprimePedidoDESCRICAO: TStringField;
    cds_RelImprimePedidoID_ITENSPEDIDO: TIntegerField;
    cds_RelImprimePedidoPEDIDO_ID: TIntegerField;
    cds_RelImprimePedidoPRODUTO_ID: TIntegerField;
    cds_RelImprimePedidoVL_UNITARIO: TFMTBCDField;
    cds_RelImprimePedidoQDE: TFMTBCDField;
    cds_RelImprimePedidoVL_TOTALITEM: TFMTBCDField;
    cds_RelImprimePedidoID_CONTATO: TIntegerField;
    cds_RelImprimePedidoNOME: TStringField;
    cds_RelImprimePedidoPRAZO: TStringField;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    cds_RelImprimePedidoNUMNF: TStringField;
    cds_RelImprimePedidoCOD_ALT1: TStringField;
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
  Q_RelImprimePedido: TQ_RelImprimePedido;

implementation

{$R *.DFM}

procedure TQ_RelImprimePedido.qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    TotalValores := TotalValores + cds_RelImprimePedido.FIELDBYNAME('VL_TOTALITEM').AsCurrency;
end;

procedure TQ_RelImprimePedido.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  QR_Total.Caption         := FormatFloat ('#,##0.00', TotalValores);

end;

procedure TQ_RelImprimePedido.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
TotalValores :=0;
end;

end.
