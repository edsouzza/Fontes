unit U_QRelCreditosRecebidos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DBClient, Provider,
  DB, SqlExpr;

type
  TQ_RelCreditosRecebidos = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    qrlbl3: TQRLabel;
    qrlbl2: TQRLabel;
    QRLabel4: TQRLabel;
    qrbndDetailBand1: TQRBand;
    qrdbtxtDATAFECHAMENTO: TQRDBText;
    qrdbtxtVALOR_TOTAL: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrsysdt5: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    qry_RelCreditosRecebidos: TSQLQuery;
    dsp_RelCreditosRecebidos: TDataSetProvider;
    cds_RelCreditosRecebidos: TClientDataSet;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    cds_RelCreditosRecebidosID_CREDITO: TIntegerField;
    cds_RelCreditosRecebidosCLIENTE_ID: TIntegerField;
    cds_RelCreditosRecebidosORC_ID: TIntegerField;
    cds_RelCreditosRecebidosVENDA_ID: TIntegerField;
    cds_RelCreditosRecebidosPARCELA: TStringField;
    cds_RelCreditosRecebidosDOC: TStringField;
    cds_RelCreditosRecebidosAUT: TStringField;
    cds_RelCreditosRecebidosVALOR: TFMTBCDField;
    cds_RelCreditosRecebidosQDE_PARCELAS: TIntegerField;
    cds_RelCreditosRecebidosDTVENCIMENTO: TDateField;
    cds_RelCreditosRecebidosDTRECEBIMENTO: TDateField;
    cds_RelCreditosRecebidosDATACAD: TDateField;
    cds_RelCreditosRecebidosMESANO: TStringField;
    cds_RelCreditosRecebidosSTATUS: TStringField;
    cds_RelCreditosRecebidosCLI_ID: TIntegerField;
    cds_RelCreditosRecebidosCLI_NOME: TStringField;
    qrsysdt2: TQRSysData;
    qrbTitulo: TQRLabel;
    QRLogo: TQRImage;
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
  Q_RelCreditosRecebidos: TQ_RelCreditosRecebidos;

implementation

Uses U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelCreditosRecebidos.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    TotalValores :=0;
    QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

procedure TQ_RelCreditosRecebidos.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
    TotalValores := TotalValores + cds_RelCreditosRecebidos.FIELDBYNAME('VALOR').AsCurrency;
end;

procedure TQ_RelCreditosRecebidos.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

end.
