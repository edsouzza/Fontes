unit U_QRelBaixa;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, SqlExpr, Provider,
  DB, DBClient;

type
  TQ_RelBaixados = class(TQuickRep)
    qrbndDetailBand1: TQRBand;
    qrdbtxtPGTO_ID: TQRDBText;
    qrdbtxtDESCRIPAGTO_DESCRICAO: TQRDBText;
    qrdbtxtCLI_FONE: TQRDBText;
    qrdbtxtDATALANCAMENTO: TQRDBText;
    qrdbtxtQUANTIDADE: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
    qrsysdt3: TQRSysData;
    cds_RelBaixa: TClientDataSet;
    dsp_RelBaixa: TDataSetProvider;
    qry_RelBaixa: TSQLQuery;
    cds_RelBaixaCODMOV: TStringField;
    cds_RelBaixaQUANTIDADE: TFMTBCDField;
    cds_RelBaixaDATAMOV: TDateField;
    cds_RelBaixaFUNC_ID: TIntegerField;
    cds_RelBaixaFUNC_NOME: TStringField;
    cds_RelBaixaDESCRICAO: TStringField;
    qrbndPageHeaderBand1: TQRBand;
    qrsysdt2: TQRSysData;
    QRDBText1: TQRDBText;
    cds_RelBaixaPRODUTO_ID: TIntegerField;
    cds_RelBaixaOPERADOR_ID: TIntegerField;
    cds_RelBaixaHISTORICO: TStringField;
    cds_RelBaixaID_PRODUTO: TIntegerField;
    qrlbl16: TQRLabel;
    qrlbl17: TQRLabel;
    qrlbl5: TQRLabel;
    qrlbl6: TQRLabel;
    QRLabel1: TQRLabel;
    qrlbl4: TQRLabel;
    QRLinhaDivisoria: TQRShape;
    QRLogo: TQRImage;
    qrbTitulo: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelBaixados: TQ_RelBaixados;

implementation

uses U_BiblioSysSalao;


{$R *.DFM}

procedure TQ_RelBaixados.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
