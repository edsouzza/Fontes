unit U_QRelProdutosCompleto;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, SqlExpr,
  DBClient, Provider;

type
  TQ_RelProdutosCompleto = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrbndDetailBand1: TQRBand;
    qrbTitulo: TQRLabel;
    qrsysdt2: TQRSysData;
    qrdbtxtPGTO_ID: TQRDBText;
    qrdbtxtDESCRIPAGTO_DESCRICAO: TQRDBText;
    qrdbtxtCLI_FONE: TQRDBText;
    qrdbtxtPGTO_VALORTOTAL: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabelTotal: TQRLabel;
    dsp_Produtos: TDataSetProvider;
    cds_Produtos: TClientDataSet;
    cds_ProdutosID_PRODUTO: TIntegerField;
    cds_ProdutosDESCRICAO: TStringField;
    cds_ProdutosPRECOVENDA: TBCDField;
    cds_ProdutosSTATUS: TStringField;
    sql_Produtos: TSQLDataSet;
    qrlbl16: TQRLabel;
    qrlbl17: TQRLabel;
    qrlbl5: TQRLabel;
    qrlbl2: TQRLabel;
    cds_ProdutosCOD_BARRAS: TStringField;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    cds_ProdutosESTOQUE_ATUAL: TFMTBCDField;
    QRLogo: TQRImage;
    QRLinhaDivisoria: TQRShape;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelProdutosCompleto: TQ_RelProdutosCompleto;

implementation

uses U_dmDados, U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelProdutosCompleto.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
