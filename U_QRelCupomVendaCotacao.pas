unit U_QRelCupomVendaCotacao;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelCupomVendaCotacao = class(TQuickRep)
    QRBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrbndDetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    Q_TotalItem: TQRDBText;
    qrbnd1: TQRBand;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    qry_RelCupomVendaCotacao: TSQLQuery;
    dsp_RelCupomVendaCotacao: TDataSetProvider;
    cds_RelCupomVendaCotacao: TClientDataSet;
    cds_RelCupomVendaCotacaoID_COTACAO: TIntegerField;
    cds_RelCupomVendaCotacaoID_CLIENTE: TIntegerField;
    cds_RelCupomVendaCotacaoTOTAL: TBCDField;
    cds_RelCupomVendaCotacaoDATA: TDateField;
    cds_RelCupomVendaCotacaoID_DETALHESCOTACAO: TIntegerField;
    cds_RelCupomVendaCotacaoCOTACAO_ID: TIntegerField;
    cds_RelCupomVendaCotacaoPRODUTO_ID: TIntegerField;
    cds_RelCupomVendaCotacaoUNITARIO: TFMTBCDField;
    cds_RelCupomVendaCotacaoQUANTIDADE: TFMTBCDField;
    cds_RelCupomVendaCotacaoTOTALITEM: TFMTBCDField;
    cds_RelCupomVendaCotacaoCLI_ID: TIntegerField;
    cds_RelCupomVendaCotacaoCLI_NOME: TStringField;
    cds_RelCupomVendaCotacaoID_PRODUTO: TIntegerField;
    cds_RelCupomVendaCotacaoDESCRICAO: TStringField;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    cds_RelCupomVendaCotacaoID_VENDA: TIntegerField;
    cds_RelCupomVendaCotacaoCOD_BARRAS: TStringField;
    cds_RelCupomVendaCotacaoVL_RECEBIDO: TFMTBCDField;
    cds_RelCupomVendaCotacaoVL_TROCO: TFMTBCDField;
    cds_RelCupomVendaCotacaoVL_DESCONTO: TFMTBCDField;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel10: TQRLabel;
    lblNomeUsuarioLogado: TQRLabel;
    QRLabel6: TQRLabel;
    QryEmpresa: TSQLQuery;
    QryEmpresaRAZAOSOCIAL: TStringField;
    QryEmpresaENDERECO: TStringField;
    QryEmpresaCIDADE: TStringField;
    QryEmpresaUF: TStringField;
    QryEmpresaTELEFONE: TStringField;
    QryEmpresaID_EMPRESA: TIntegerField;
    QryEmpresaDDD: TStringField;
    QryEmpresaEMAIL: TStringField;
    QryEmpresaCNPJ: TStringField;
    QryEmpresaIE: TStringField;
    QryEmpresaCEP: TStringField;
    QryEmpresaMSG: TStringField;
    QRDBText18: TQRDBText;
    qrsysdt4: TQRSysData;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText19: TQRDBText;
    cds_RelCupomVendaCotacaoCLI_CPF: TStringField;
    cds_RelCupomVendaCotacaoCLI_CNPJ: TStringField;
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
  Q_RelCupomVendaCotacao: TQ_RelCupomVendaCotacao;

implementation

uses U_dmDadosSegundo, U_dmDados;

{$R *.DFM}

procedure TQ_RelCupomVendaCotacao.qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    TotalValores := TotalValores + cds_RelCupomVendaCotacao.FIELDBYNAME('TOTALITEM').AsCurrency;
end;

procedure TQ_RelCupomVendaCotacao.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

procedure TQ_RelCupomVendaCotacao.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
TotalValores :=0;
end;

end.
