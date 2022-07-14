unit U_QRelPagtoOrcamento;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr, jpeg, RxGIF;

type
  TQ_RelCupomPagtoOrcamento = class(TQuickRep)
    QRBand1: TQRBand;
    qrsysdt2: TQRSysData;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    qrbndDetailBand1: TQRBand;
    qrbnd1: TQRBand;
    qrlbl9: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText18: TQRDBText;
    qrsysdt4: TQRSysData;
    QRLabel7: TQRLabel;
    qry_RelCupomPagtoOrcamento: TSQLQuery;
    dsp_RelCupomPagtoOrcamento: TDataSetProvider;
    cds_RelCupomPagtoOrcamento: TClientDataSet;
    cds_RelCupomPagtoOrcamentoID_EMPRESA: TIntegerField;
    cds_RelCupomPagtoOrcamentoRAZAOSOCIAL: TStringField;
    cds_RelCupomPagtoOrcamentoENDERECO: TStringField;
    cds_RelCupomPagtoOrcamentoBAIRRO: TStringField;
    cds_RelCupomPagtoOrcamentoDDD: TStringField;
    cds_RelCupomPagtoOrcamentoTELEFONE: TStringField;
    cds_RelCupomPagtoOrcamentoCELULAR: TStringField;
    cds_RelCupomPagtoOrcamentoEMAIL: TStringField;
    cds_RelCupomPagtoOrcamentoCNPJ: TStringField;
    cds_RelCupomPagtoOrcamentoIE: TStringField;
    cds_RelCupomPagtoOrcamentoCIDADE: TStringField;
    cds_RelCupomPagtoOrcamentoCEP: TStringField;
    cds_RelCupomPagtoOrcamentoUF: TStringField;
    cds_RelCupomPagtoOrcamentoMSG: TStringField;
    cds_RelCupomPagtoOrcamentoID_ORCAMENTO: TIntegerField;
    cds_RelCupomPagtoOrcamentoID_OPERADOR: TIntegerField;
    cds_RelCupomPagtoOrcamentoID_CLIENTE: TIntegerField;
    cds_RelCupomPagtoOrcamentoID_VENDA: TIntegerField;
    cds_RelCupomPagtoOrcamentoDATA: TDateField;
    cds_RelCupomPagtoOrcamentoSTATUS: TStringField;
    cds_RelCupomPagtoOrcamentoID_DETALHESORC: TIntegerField;
    cds_RelCupomPagtoOrcamentoORC_ID: TIntegerField;
    cds_RelCupomPagtoOrcamentoFLAG: TStringField;
    cds_RelCupomPagtoOrcamentoFUNC_ID: TIntegerField;
    cds_RelCupomPagtoOrcamentoFUNC_NOME: TStringField;
    cds_RelCupomPagtoOrcamentoCLI_ID: TIntegerField;
    cds_RelCupomPagtoOrcamentoCLI_NOME: TStringField;
    cds_RelCupomPagtoOrcamentoCLI_ENDERECO: TStringField;
    cds_RelCupomPagtoOrcamentoCLI_COMPLEMENTO: TStringField;
    cds_RelCupomPagtoOrcamentoCLI_CEP: TStringField;
    cds_RelCupomPagtoOrcamentoCLI_DDDFONE: TStringField;
    cds_RelCupomPagtoOrcamentoCLI_FONE: TStringField;
    cds_RelCupomPagtoOrcamentoCLI_IE: TStringField;
    cds_RelCupomPagtoOrcamentoCLI_APELIDO: TStringField;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText29: TQRDBText;
    cds_RelCupomPagtoOrcamentoTOTAL: TFMTBCDField;
    cds_RelCupomPagtoOrcamentoVALOR_ITEM: TFMTBCDField;
    cds_RelCupomPagtoOrcamentoQUANTIDADE: TFMTBCDField;
    cds_RelCupomPagtoOrcamentoTOTAL_1: TFMTBCDField;
    cds_RelCupomPagtoOrcamentoVALOR_PECAS: TFMTBCDField;
    cds_RelCupomPagtoOrcamentoVL_RECEBIDO: TFMTBCDField;
    cds_RelCupomPagtoOrcamentoVL_TROCO: TFMTBCDField;
    cds_RelCupomPagtoOrcamentoVL_DESCONTO: TFMTBCDField;
    cds_RelCupomPagtoOrcamentoCLI_CPF: TStringField;
    cds_RelCupomPagtoOrcamentoCLI_CNPJ: TStringField;
    QRDBText30: TQRDBText;
    QRLabel30: TQRLabel;
    cds_RelCupomPagtoOrcamentoITEM_ID: TIntegerField;
    cds_RelCupomPagtoOrcamentoDESCRICAO: TStringField;
    QRLabel10: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText28: TQRDBText;
    cds_RelCupomPagtoOrcamentoSIGLA: TStringField;
    cds_RelCupomPagtoOrcamentoLOGO: TStringField;
    cds_RelCupomPagtoOrcamentoDATAPAGTO: TDateField;
    cds_RelCupomPagtoOrcamentoVL_BRUTO: TFMTBCDField;
    cds_RelCupomPagtoOrcamentoVL_TOTALPAGAR: TFMTBCDField;
    cds_RelCupomPagtoOrcamentoVL_PARCELADO: TFMTBCDField;
    cds_RelCupomPagtoOrcamentoDATA_VENDA: TDateField;
    QRDBText33: TQRDBText;
    lblNomeUsuarioLogado: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel29: TQRLabel;
    QRLogo: TQRImage;
    lblDATA: TQRLabel;
    QRLabel27: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
     TotalValores, TotalPecas, TotalPagar, TotalMaoObra : Extended;
  end;

var
  Q_RelCupomPagtoOrcamento: TQ_RelCupomPagtoOrcamento;

implementation

Uses U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelCupomPagtoOrcamento.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    //carregando a logo da empresa
    QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
    lblDATA.Caption   := DateToStr(now);

end;

end.
