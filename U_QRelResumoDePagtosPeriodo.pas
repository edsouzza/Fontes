unit U_QRelResumoDePagtosPeriodo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr, jpeg, RxGIF;

type
  TQ_RelResumoPagtosOrcamentos = class(TQuickRep)
    QRBand1: TQRBand;
    qrsysdt2: TQRSysData;
    QRLabel8: TQRLabel;
    qrbndDetailBand1: TQRBand;
    qrbnd1: TQRBand;
    QRLabel11: TQRLabel;
    qrsysdt4: TQRSysData;
    QRLabel7: TQRLabel;
    qry_RelResumoPagtosOrcamentos: TSQLQuery;
    dsp_RelResumoPagtosOrcamentos: TDataSetProvider;
    cds_RelResumoPagtosOrcamentos: TClientDataSet;
    cds_RelResumoPagtosOrcamentosID_EMPRESA: TIntegerField;
    cds_RelResumoPagtosOrcamentosRAZAOSOCIAL: TStringField;
    cds_RelResumoPagtosOrcamentosENDERECO: TStringField;
    cds_RelResumoPagtosOrcamentosBAIRRO: TStringField;
    cds_RelResumoPagtosOrcamentosDDD: TStringField;
    cds_RelResumoPagtosOrcamentosTELEFONE: TStringField;
    cds_RelResumoPagtosOrcamentosCELULAR: TStringField;
    cds_RelResumoPagtosOrcamentosEMAIL: TStringField;
    cds_RelResumoPagtosOrcamentosCNPJ: TStringField;
    cds_RelResumoPagtosOrcamentosIE: TStringField;
    cds_RelResumoPagtosOrcamentosCIDADE: TStringField;
    cds_RelResumoPagtosOrcamentosCEP: TStringField;
    cds_RelResumoPagtosOrcamentosUF: TStringField;
    cds_RelResumoPagtosOrcamentosMSG: TStringField;
    cds_RelResumoPagtosOrcamentosID_ORCAMENTO: TIntegerField;
    cds_RelResumoPagtosOrcamentosID_OPERADOR: TIntegerField;
    cds_RelResumoPagtosOrcamentosID_CLIENTE: TIntegerField;
    cds_RelResumoPagtosOrcamentosID_VENDA: TIntegerField;
    cds_RelResumoPagtosOrcamentosDATA: TDateField;
    cds_RelResumoPagtosOrcamentosSTATUS: TStringField;
    cds_RelResumoPagtosOrcamentosID_DETALHESORC: TIntegerField;
    cds_RelResumoPagtosOrcamentosORC_ID: TIntegerField;
    cds_RelResumoPagtosOrcamentosFLAG: TStringField;
    cds_RelResumoPagtosOrcamentosFUNC_ID: TIntegerField;
    cds_RelResumoPagtosOrcamentosFUNC_NOME: TStringField;
    cds_RelResumoPagtosOrcamentosCLI_ID: TIntegerField;
    cds_RelResumoPagtosOrcamentosCLI_NOME: TStringField;
    cds_RelResumoPagtosOrcamentosCLI_ENDERECO: TStringField;
    cds_RelResumoPagtosOrcamentosCLI_COMPLEMENTO: TStringField;
    cds_RelResumoPagtosOrcamentosCLI_CEP: TStringField;
    cds_RelResumoPagtosOrcamentosCLI_DDDFONE: TStringField;
    cds_RelResumoPagtosOrcamentosCLI_FONE: TStringField;
    cds_RelResumoPagtosOrcamentosCLI_IE: TStringField;
    cds_RelResumoPagtosOrcamentosCLI_APELIDO: TStringField;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
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
    cds_RelResumoPagtosOrcamentosTOTAL: TFMTBCDField;
    cds_RelResumoPagtosOrcamentosVALOR_ITEM: TFMTBCDField;
    cds_RelResumoPagtosOrcamentosQUANTIDADE: TFMTBCDField;
    cds_RelResumoPagtosOrcamentosTOTAL_1: TFMTBCDField;
    cds_RelResumoPagtosOrcamentosVALOR_PECAS: TFMTBCDField;
    cds_RelResumoPagtosOrcamentosVL_RECEBIDO: TFMTBCDField;
    cds_RelResumoPagtosOrcamentosVL_TROCO: TFMTBCDField;
    cds_RelResumoPagtosOrcamentosVL_DESCONTO: TFMTBCDField;
    cds_RelResumoPagtosOrcamentosCLI_CPF: TStringField;
    cds_RelResumoPagtosOrcamentosCLI_CNPJ: TStringField;
    QRDBText30: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    cds_RelResumoPagtosOrcamentosITEM_ID: TIntegerField;
    QRLogo: TQRImage;
    cds_RelResumoPagtosOrcamentosDESCRICAO: TStringField;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QR_TotalGeral: TQRLabel;
    cds_RelResumoPagtosOrcamentosTOTALGERAL: TFloatField;
    cds_RelResumoPagtosOrcamentosTOTAL_ITEM: TFloatField;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    cds_RelResumoPagtosOrcamentosSIGLA: TStringField;
    cds_RelResumoPagtosOrcamentosLOGO: TStringField;
    cds_RelResumoPagtosOrcamentosDATAPAGTO: TDateField;
    lblITEM: TQRLabel;
    lblDATA: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    lblNomeUsuarioLogado: TQRLabel;
    procedure qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure cds_RelResumoPagtosOrcamentosCalcFields(DataSet: TDataSet);


  private

  public
     TotalValores, TotalPecas, TotalPagar, TotalMaoObra, TotalGeral : Extended;
     NumItem : integer;
  end;

var
  Q_RelResumoPagtosOrcamentos: TQ_RelResumoPagtosOrcamentos;

implementation

Uses U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelResumoPagtosOrcamentos.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin

 TotalValores     := TotalValores + cds_RelResumoPagtosOrcamentos.FIELDBYNAME('TOTAL_1').AsCurrency;
 lblITEM.Caption  := IntToStr(NumItem);

end;

procedure TQ_RelResumoPagtosOrcamentos.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin

    TotalValores :=0;
    NumItem      :=0;

    //carregando a logo da empresa
    QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
    lblDATA.Caption   := DateToStr(now);

end;

procedure TQ_RelResumoPagtosOrcamentos.qrbnd1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin

      QR_TotalGeral.Caption := FormatFloat ('#,##0.00', TotalValores);

end;

procedure TQ_RelResumoPagtosOrcamentos.cds_RelResumoPagtosOrcamentosCalcFields(
  DataSet: TDataSet);
begin
        NumItem := NumItem+1;
end;

end.
