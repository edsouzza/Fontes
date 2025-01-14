unit U_QRelCotacaoPeriodoGeral;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DBClient, Provider,
  DB, SqlExpr;

type
  TQ_RelCotacaoPeriodoGeral = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrb_titulo: TQRLabel;
    qrsysdt2: TQRSysData;
    QRLabel4: TQRLabel;
    Q_NomeUsuarioLogado: TQRLabel;
    QRBand1: TQRBand;
    Q_TotalItem: TQRDBText;
    QRDBText8: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qry_RelCotacaoPeriodoGeral: TSQLQuery;
    dsp_RelCotacaoPeriodoGeral: TDataSetProvider;
    cds_RelCotacaoPeriodoGeral: TClientDataSet;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    cds_RelCotacaoPeriodoGeralID_COTACAO: TIntegerField;
    cds_RelCotacaoPeriodoGeralID_CLIENTE: TIntegerField;
    cds_RelCotacaoPeriodoGeralTOTAL: TBCDField;
    cds_RelCotacaoPeriodoGeralDATA: TDateField;
    cds_RelCotacaoPeriodoGeralSTATUS: TStringField;
    cds_RelCotacaoPeriodoGeralCLI_ID: TIntegerField;
    cds_RelCotacaoPeriodoGeralCLI_NOME: TStringField;
    qrsysdt5: TQRSysData;
    ds_RelCotacaoPeriodoGeral: TDataSource;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlbl2: TQRLabel;
    qrlbl3: TQRLabel;
  private

  public

  end;

var
  Q_RelCotacaoPeriodoGeral: TQ_RelCotacaoPeriodoGeral;

implementation

{$R *.DFM}

end.
