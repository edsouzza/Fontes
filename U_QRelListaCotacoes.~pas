unit U_QRelListaCotacoes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelListaCotacoes = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrlbl8: TQRLabel;
    qrsysdt2: TQRSysData;
    QRLabel4: TQRLabel;
    Q_NomeUsuarioLogado: TQRLabel;
    qry_RelListaCotacoes: TSQLQuery;
    dsp_RelListaCotacoes: TDataSetProvider;
    cds_RelListaCotacoes: TClientDataSet;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    Q_TotalItem: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    qrlbl3: TQRLabel;
    qrlbl2: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrlbl9: TQRLabel;
    cds_RelListaCotacoesID_COTACAO: TIntegerField;
    cds_RelListaCotacoesID_CLIENTE: TIntegerField;
    cds_RelListaCotacoesTOTAL: TBCDField;
    cds_RelListaCotacoesDATA: TDateField;
    cds_RelListaCotacoesID_DETALHESCOTACAO: TIntegerField;
    cds_RelListaCotacoesCOTACAO_ID: TIntegerField;
    cds_RelListaCotacoesPRODUTO_ID: TIntegerField;
    cds_RelListaCotacoesUNITARIO: TFMTBCDField;
    cds_RelListaCotacoesQUANTIDADE: TFMTBCDField;
    cds_RelListaCotacoesTOTALITEM: TFMTBCDField;
    cds_RelListaCotacoesCLI_ID: TIntegerField;
    cds_RelListaCotacoesCLI_NOME: TStringField;
    cds_RelListaCotacoesID_PRODUTO: TIntegerField;
    cds_RelListaCotacoesDESCRICAO: TStringField;
    QRShape2: TQRShape;
    QR_Total: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape3: TQRShape;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
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
  Q_RelListaCotacoes: TQ_RelListaCotacoes;

implementation

{$R *.DFM}

procedure TQ_RelListaCotacoes.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotalValores := TotalValores + cds_RelListaCotacoes.fieldbyname('totalitem').AsCurrency;
end;

procedure TQ_RelListaCotacoes.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

procedure TQ_RelListaCotacoes.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
    TotalValores :=0;
end;

end.
