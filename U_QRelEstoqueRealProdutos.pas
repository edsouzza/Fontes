unit U_QRelEstoqueRealProdutos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelProdutosEstoqueReal = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrlbl16: TQRLabel;
    qrlbl17: TQRLabel;
    qrlbl5: TQRLabel;
    qrlbl2: TQRLabel;
    qrbndDetailBand1: TQRBand;
    qrdbtxtPGTO_ID: TQRDBText;
    qrdbtxtDESCRIPAGTO_DESCRICAO: TQRDBText;
    qrdbtxtCLI_FONE: TQRDBText;
    qrdbtxtPGTO_VALORTOTAL: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
    sql_Produtos: TSQLDataSet;
    dsp_Produtos: TDataSetProvider;
    cds_Produtos: TClientDataSet;
    cds_ProdutosID_PRODUTO: TIntegerField;
    cds_ProdutosDESCRICAO: TStringField;
    cds_ProdutosSTATUS: TStringField;
    cds_ProdutosPRECOCOMPRA: TFMTBCDField;
    qrlbl9: TQRLabel;
    QR_Total: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    cds_ProdutosTOTAL: TFloatField;
    cds_ProdutosCOD_BARRAS: TStringField;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    cds_ProdutosESTOQUE_ATUAL: TFMTBCDField;
    QRLinhaDivisoria: TQRShape;
    QRLogo: TQRImage;
    qrlbl1: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure cds_ProdutosCalcFields(DataSet: TDataSet);
  private

  public
       TotalValores : Extended;
  end;

var
  Q_RelProdutosEstoqueReal: TQ_RelProdutosEstoqueReal;

implementation

Uses U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelProdutosEstoqueReal.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin

  TotalValores :=0;
  //carregando a logo da empresa
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
  
end;

procedure TQ_RelProdutosEstoqueReal.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin

    TotalValores := TotalValores + cds_Produtos.FIELDBYNAME('TOTAL').AsFloat;

end;

procedure TQ_RelProdutosEstoqueReal.qrbnd1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin

    QR_Total.Caption := FormatFloat ('#,##0.00', TotalValores);

end;

procedure TQ_RelProdutosEstoqueReal.cds_ProdutosCalcFields(
  DataSet: TDataSet);
begin

   cds_ProdutosTotal.AsFloat:= ( cds_ProdutosPRECOCOMPRA.AsFloat * cds_ProdutosESTOQUE_ATUAL.AsFloat );

end;

end.
