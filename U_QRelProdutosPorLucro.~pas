unit U_QRelProdutosPorLucro;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, SqlExpr,
  DBClient, Provider;

type
  TQ_RelProdutosPorLucro = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrbndDetailBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrdbtxtPGTO_ID: TQRDBText;
    qrdbtxtDESCRIPAGTO_DESCRICAO: TQRDBText;
    qrdbtxtCLI_FONE: TQRDBText;
    qrdbtxtPGTO_VALORTOTAL: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
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
    cds_ProdutosVALORDELUCRO: TFMTBCDField;
    cds_ProdutosCOD_BARRAS: TStringField;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLinhaDivisoria: TQRShape;
    qrbTitulo: TQRLabel;
    QRLogo: TQRImage;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelProdutosPorLucro: TQ_RelProdutosPorLucro;

implementation

uses U_dmDados,  U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelProdutosPorLucro.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
