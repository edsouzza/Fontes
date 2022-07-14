unit U_QRelProdutosInativos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, SqlExpr, Provider,
  DB, DBClient;

type
  TQ_RelProdutosInativos = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrlbl16: TQRLabel;
    qrlbl17: TQRLabel;
    qrlbl6: TQRLabel;
    QRLinhaDivisoria: TQRShape;
    QRLogo: TQRImage;
    qrbTitulo: TQRLabel;
    qrbndDetailBand1: TQRBand;
    qrdbtxtPGTO_ID: TQRDBText;
    qrdbtxtDESCRIPAGTO_DESCRICAO: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
    qrsysdt3: TQRSysData;
    qry_RelProdutosInativos: TSQLQuery;
    dsp_RelProdutosInativos: TDataSetProvider;
    cds_RelProdutosInativos: TClientDataSet;
    cds_RelProdutosInativosID_PRODUTO: TIntegerField;
    cds_RelProdutosInativosDESCRICAO: TStringField;
    cds_RelProdutosInativosCOD_BARRAS: TStringField;
    QRDBText1: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelProdutosInativos: TQ_RelProdutosInativos;

implementation
uses U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelProdutosInativos.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
