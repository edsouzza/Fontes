unit U_QRelListaOrcamentos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelListaOrcamentos = class(TQuickRep)
    qry_RelListaOrcamentos: TSQLQuery;
    dsp_RelListaOrcamentos: TDataSetProvider;
    cds_RelListaOrcamentos: TClientDataSet;
    qrbndPageHeaderBand1: TQRBand;
    qrlbl8: TQRLabel;
    qrsysdt2: TQRSysData;
    QRLabel4: TQRLabel;
    Q_lblNomeUsuarioLogado: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape3: TQRShape;
    QRBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    Q_TotalItem: TQRDBText;
    QRBand2: TQRBand;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    cds_RelListaOrcamentosID_ORCAMENTO: TIntegerField;
    cds_RelListaOrcamentosID_OPERADOR: TIntegerField;
    cds_RelListaOrcamentosID_CLIENTE: TIntegerField;
    cds_RelListaOrcamentosID_VENDA: TIntegerField;
    cds_RelListaOrcamentosDATA: TDateField;
    cds_RelListaOrcamentosID_DETALHESORC: TIntegerField;
    cds_RelListaOrcamentosORC_ID: TIntegerField;
    cds_RelListaOrcamentosFLAG: TStringField;
    cds_RelListaOrcamentosCLI_ID: TIntegerField;
    cds_RelListaOrcamentosCLI_NOME: TStringField;
    cds_RelListaOrcamentostotal_item: TFloatField;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    total_itens: TQRExpr;
    QRLabel10: TQRLabel;
    cds_RelListaOrcamentosVALOR_PECAS: TFMTBCDField;
    cds_RelListaOrcamentosTOTAL: TFMTBCDField;
    cds_RelListaOrcamentosVALOR_ITEM: TFMTBCDField;
    cds_RelListaOrcamentosQUANTIDADE: TFMTBCDField;
    cds_RelListaOrcamentosTOTAL_1: TFMTBCDField;
    cds_RelListaOrcamentosSTATUS: TStringField;
    QRDBText1: TQRDBText;
    cds_RelListaOrcamentosDATAPAGTO: TDateField;
    cds_RelListaOrcamentosITEM_ID: TIntegerField;
    cds_RelListaOrcamentosDESCRICAO: TStringField;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure cds_RelListaOrcamentosCalcFields(DataSet: TDataSet);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public
       TotalValores : Extended;
  end;

var
  Q_RelListaOrcamentos: TQ_RelListaOrcamentos;

implementation

{$R *.DFM}

procedure TQ_RelListaOrcamentos.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    TotalValores := TotalValores + cds_RelListaOrcamentos.fieldbyname('total_item').AsCurrency;
end;

procedure TQ_RelListaOrcamentos.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

procedure TQ_RelListaOrcamentos.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);

begin

    TotalValores :=0;

end;

procedure TQ_RelListaOrcamentos.cds_RelListaOrcamentosCalcFields(
  DataSet: TDataSet);
begin

    cds_RelListaOrcamentostotal_item.AsFloat  := ( cds_RelListaOrcamentosVALOR_ITEM.asfloat * cds_RelListaOrcamentosQUANTIDADE.asfloat );
    
end;

procedure TQ_RelListaOrcamentos.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
    total_itens.Reset;
end;

end.
