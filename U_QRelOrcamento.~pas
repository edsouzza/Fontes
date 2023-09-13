unit U_QRelOrcamento;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DBClient, Provider,
  DB, SqlExpr, jpeg, RxGIF;

type
  TQ_RelOrcamento = class(TQuickRep)
    QRBand1: TQRBand;
    qrsysdt2: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    qrbndDetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    Q_TotalItem: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qry_RelOrcamento: TSQLQuery;
    dsp_RelOrcamento: TDataSetProvider;
    cds_RelOrcamento: TClientDataSet;
    cds_RelOrcamentoID_EMPRESA: TIntegerField;
    cds_RelOrcamentoRAZAOSOCIAL: TStringField;
    cds_RelOrcamentoENDERECO: TStringField;
    cds_RelOrcamentoDDD: TStringField;
    cds_RelOrcamentoTELEFONE: TStringField;
    cds_RelOrcamentoCELULAR: TStringField;
    cds_RelOrcamentoEMAIL: TStringField;
    cds_RelOrcamentoCNPJ: TStringField;
    cds_RelOrcamentoIE: TStringField;
    cds_RelOrcamentoCIDADE: TStringField;
    cds_RelOrcamentoCEP: TStringField;
    cds_RelOrcamentoUF: TStringField;
    cds_RelOrcamentoMSG: TStringField;
    cds_RelOrcamentoID_ORCAMENTO: TIntegerField;
    cds_RelOrcamentoID_OPERADOR: TIntegerField;
    cds_RelOrcamentoID_CLIENTE: TIntegerField;
    cds_RelOrcamentoID_VENDA: TIntegerField;
    cds_RelOrcamentoDATA: TDateField;
    cds_RelOrcamentoFUNC_ID: TIntegerField;
    cds_RelOrcamentoFUNC_NOME: TStringField;
    cds_RelOrcamentoCLI_ID: TIntegerField;
    cds_RelOrcamentoCLI_NOME: TStringField;
    cds_RelOrcamentoCLI_ENDERECO: TStringField;
    cds_RelOrcamentoCLI_CEP: TStringField;
    cds_RelOrcamentoCLI_DDDFONE: TStringField;
    cds_RelOrcamentoCLI_FONE: TStringField;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText16: TQRDBText;
    cds_RelOrcamentoCLI_IE: TStringField;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText19: TQRDBText;
    cds_RelOrcamentoID_DETALHESORC: TIntegerField;
    cds_RelOrcamentoORC_ID: TIntegerField;
    cds_RelOrcamentoFLAG: TStringField;
    QRLabel17: TQRLabel;
    QRDBText20: TQRDBText;
    cds_RelOrcamentoCLI_COMPLEMENTO: TStringField;
    QRDBText21: TQRDBText;
    cds_RelOrcamentoBAIRRO: TStringField;
    QRDBText22: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel20: TQRLabel;
    cds_RelOrcamentoVALOR_PECAS: TFMTBCDField;
    QRLabel24: TQRLabel;
    QR_TotalGeral: TQRLabel;
    cds_RelOrcamentoCLI_APELIDO: TStringField;
    QRLabel26: TQRLabel;
    QRDBText24: TQRDBText;
    cds_RelOrcamentoSTATUS: TStringField;
    cds_RelOrcamentoTOTAL: TFMTBCDField;
    cds_RelOrcamentoVALOR_ITEM: TFMTBCDField;
    cds_RelOrcamentoQUANTIDADE: TFMTBCDField;
    cds_RelOrcamentoTOTAL_1: TFMTBCDField;
    cds_RelOrcamentoTOTAL_ITEM: TFloatField;
    QRLabel27: TQRLabel;
    QRDBText25: TQRDBText;
    cds_RelOrcamentoCLI_CPF: TStringField;
    cds_RelOrcamentoCLI_CNPJ: TStringField;
    QRDBText26: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    cds_RelOrcamentoITEM_ID: TIntegerField;
    cds_RelOrcamentoDESCRICAO: TStringField;
    QRLogo: TQRImage;
    lblUsuarioLogado: TQRLabel;
    procedure qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure cds_RelOrcamentoCalcFields(DataSet: TDataSet);

  private

  public
        TotalValores, TotalPecas, TotalGeral, TotalMaoObra : Extended;

  end;

var
  Q_RelOrcamento: TQ_RelOrcamento;

implementation

Uses U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelOrcamento.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin


    TotalPecas   := TotalPecas   + cds_RelOrcamento.FIELDBYNAME('valor_pecas').AsCurrency;
    TotalValores := ( TotalValores + cds_RelOrcamento.FIELDBYNAME('TOTAL_1').AsCurrency );
    TotalGeral   := TotalGeral   + cds_RelOrcamento.FIELDBYNAME('total_item').AsCurrency;

end;

procedure TQ_RelOrcamento.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

    //SEPARANDO A MAO DE OBRA DO VALOR DAS PEÇAS PARA MOSTRAR NO RELATORIO
    
    TotalMaoObra          :=  TotalValores  - TotalPecas;
    TotalGeral            :=  TotalGeral    - TotalPecas;

    QR_TotalGeral.Caption := FormatFloat ('#,##0.00', TotalGeral);

end;

procedure TQ_RelOrcamento.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin

  TotalValores :=0;
  TotalPecas   :=0;
  TotalGeral   :=0;

  //carregando a logo da empresa
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
  lblUsuarioLogado.Caption := sUsuarioLogado;

end;

procedure TQ_RelOrcamento.cds_RelOrcamentoCalcFields(DataSet: TDataSet);
begin

    //criado campo TOTAL_ITEM ONDE CALCULO O VALOR DO ITEM COM VALOR * QDE + VALOR DAS PEÇAS PARA MOSTRAR NO TOTAL GERAL
    cds_RelOrcamentoTOTAL_ITEM.AsFloat := cds_RelOrcamentoVALOR_PECAS.AsFloat + (cds_RelOrcamentoVALOR_ITEM.AsFloat * cds_RelOrcamentoQUANTIDADE.AsFloat);

end;

end.
