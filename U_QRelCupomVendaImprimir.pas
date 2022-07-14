unit U_QRelCupomVendaImprimir;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelCupomVendaImprimir = class(TQuickRep)
    QRBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrbndDetailBand1: TQRBand;
    edtDescricao: TQRDBText;
    edtVlUnitario: TQRDBText;
    edtQuantidade: TQRDBText;
    Q_TotalItem: TQRDBText;
    qrbnd1: TQRBand;
    qrlbl9: TQRLabel;
    qry_RelCupomVenda: TSQLQuery;
    dsp_RelCupomVenda: TDataSetProvider;
    cds_RelCupomVenda: TClientDataSet;
    edtCodBarras: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QryEmpresa: TSQLQuery;
    QryEmpresaRAZAOSOCIAL: TStringField;
    QryEmpresaENDERECO: TStringField;
    QryEmpresaCIDADE: TStringField;
    QryEmpresaUF: TStringField;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    cds_RelCupomVendaCLI_ID: TIntegerField;
    cds_RelCupomVendaCLI_NOME: TStringField;
    cds_RelCupomVendaID_PRODUTO: TIntegerField;
    cds_RelCupomVendaDESCRICAO: TStringField;
    cds_RelCupomVendaCOD_BARRAS: TStringField;
    cds_RelCupomVendaVL_RECEBIDO: TFMTBCDField;
    cds_RelCupomVendaVL_TROCO: TFMTBCDField;
    cds_RelCupomVendaVL_DESCONTO: TFMTBCDField;
    cds_RelCupomVendaID_VENDA: TIntegerField;
    cds_RelCupomVendaVL_UNITARIO: TFMTBCDField;
    cds_RelCupomVendaVL_TOTALITEM: TFMTBCDField;
    QryEmpresaTELEFONE: TStringField;
    QRDBText2: TQRDBText;
    QryEmpresaID_EMPRESA: TIntegerField;
    QryEmpresaDDD: TStringField;
    QryEmpresaEMAIL: TStringField;
    QryEmpresaCNPJ: TStringField;
    QryEmpresaIE: TStringField;
    QryEmpresaCEP: TStringField;
    QryEmpresaMSG: TStringField;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText18: TQRDBText;
    qrsysdt4: TQRSysData;
    QRLabel12: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel10: TQRLabel;
    lblNomeUsuarioLogado: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel20: TQRLabel;
    cds_RelCupomVendaQUANTIDADE: TFMTBCDField;
    QRLabel21: TQRLabel;
    QRDBText3: TQRDBText;
    cds_RelCupomVendaDATA_VENDA: TDateField;
    QRDBText5: TQRDBText;
    cds_RelCupomVendaVL_BRUTO: TFMTBCDField;
    QRLabel22: TQRLabel;
    QRDBText7: TQRDBText;
    cds_RelCupomVendaVL_TOTALPAGAR: TFMTBCDField;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    cds_RelCupomVendaVL_PARCELADO: TFMTBCDField;
    QRDBText8: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText10: TQRDBText;
    cds_RelCupomVendaCLIENTE: TStringField;
    cds_RelCupomVendaCPF: TStringField;
    cds_RelCupomVendaCNPJ: TStringField;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel29: TQRLabel;
    QRLogo: TQRImage;
    lblDATA: TQRLabel;
    QryEmpresaBAIRRO: TStringField;
    QryEmpresaCELULAR: TStringField;
    QryEmpresaSIGLA: TStringField;
    QryEmpresaLOGO: TStringField;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
       TotalValores : Extended;
  end;

var
  Q_RelCupomVendaImprimir: TQ_RelCupomVendaImprimir;

implementation

uses U_dmDadosSegundo, U_dmDados, U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelCupomVendaImprimir.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin 
    //carregando a logo da empresa
    QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
    lblDATA.Caption   := DateToStr(now);
end;

end.
