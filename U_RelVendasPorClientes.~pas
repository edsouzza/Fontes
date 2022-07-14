unit U_RelVendasPorClientes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelVendasPorClientes = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qr_Titulo: TQRLabel;
    qrsysdt2: TQRSysData;
    qrbndDetailBand1: TQRBand;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    qrdbtxtVALOR_TOTAL: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    qry_RelVendasPorClientes: TSQLQuery;
    dsp_RelVendasPorClientes: TDataSetProvider;
    cds_RelVendasPorClientes: TClientDataSet;
    cds_RelVendasPorClientesID_HISTORICOATIVOS: TIntegerField;
    cds_RelVendasPorClientesCLIENTE_ID: TIntegerField;
    cds_RelVendasPorClientesVENDEDOR_ID: TIntegerField;
    cds_RelVendasPorClientesVL_LIQUIDO: TFMTBCDField;
    cds_RelVendasPorClientesMESANO: TStringField;
    cds_RelVendasPorClientesDATA: TDateField;
    cds_RelVendasPorClientesHISTORICO: TStringField;
    cds_RelVendasPorClientesCLI_ID: TIntegerField;
    cds_RelVendasPorClientesCLI_NOME: TStringField;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    qrlbl3: TQRLabel;
    qrlbl2: TQRLabel;
    cds_RelVendasPorClientesCLI_FONE: TStringField;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    cds_RelVendasPorClientesCLI_FONE4: TStringField;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
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
  Q_RelVendasPorClientes: TQ_RelVendasPorClientes;

implementation

{$R *.DFM}

procedure TQ_RelVendasPorClientes.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
    TotalValores :=0;
end;

procedure TQ_RelVendasPorClientes.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   TotalValores := TotalValores + cds_RelVendasPorClientes.FIELDBYNAME('VL_LIQUIDO').AsCurrency;
end;

procedure TQ_RelVendasPorClientes.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QR_Total.Caption := FormatFloat('#,##0.00', TotalValores);
end;

end.
