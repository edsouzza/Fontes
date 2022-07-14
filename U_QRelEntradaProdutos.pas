unit U_QRelEntradaProdutos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, SqlExpr,
  Provider, DBClient;

type
  TQ_RelEntradaProdutos = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
    qrsysdt3: TQRSysData;
    qrbndDetailBand1: TQRBand;
    qrdbtxtPGTO_ID: TQRDBText;
    qrdbtxtDESCRIPAGTO_DESCRICAO: TQRDBText;
    qrdbtxtDATALANCAMENTO: TQRDBText;
    qrdbtxtQUANTIDADE: TQRDBText;
    cds_RelEntradaProdutos: TClientDataSet;
    dsp_RelEntradaProdutos: TDataSetProvider;
    qry_RelEntradaProdutos: TSQLQuery;
    QRDBText1: TQRDBText;
    cds_RelEntradaProdutosPRODUTO_ID: TIntegerField;
    cds_RelEntradaProdutosDATAMOV: TDateField;
    cds_RelEntradaProdutosID_PRODUTO: TIntegerField;
    cds_RelEntradaProdutosDESCRICAO: TStringField;
    qrlbl16: TQRLabel;
    qrlbl17: TQRLabel;
    qrlbl6: TQRLabel;
    qrlbl5: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    cds_RelEntradaProdutosCOD_BARRAS: TStringField;
    cds_RelEntradaProdutosQUANTIDADE: TFMTBCDField;
    cds_RelEntradaProdutosESTOQUE_ATUAL: TFMTBCDField;
    QRLinhaDivisoria: TQRShape;
    QRLogo: TQRImage;
    qrbTitulo: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelEntradaProdutos: TQ_RelEntradaProdutos;

implementation

uses U_dmDados, U_dmDadosSegundo, U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelEntradaProdutos.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
