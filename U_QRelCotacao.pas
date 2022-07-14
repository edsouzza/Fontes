unit U_QRelCotacao;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DBClient, Provider,
  DB, SqlExpr;

type
  TQ_RelCotacao = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrb_titulo: TQRLabel;
    qrsysdt2: TQRSysData;
    qrbndDetailBand1: TQRBand;
    qrbnd1: TQRBand;
    qrsysdt4: TQRSysData;
    qrlbl9: TQRLabel;
    qry_RelCotacao: TSQLQuery;
    dsp_RelCotacao: TDataSetProvider;
    cds_RelCotacao: TClientDataSet;
    QRLabel4: TQRLabel;
    QRBand1: TQRBand;
    QRDBText5: TQRDBText;
    Q_TotalItem: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlbl3: TQRLabel;
    qrlbl2: TQRLabel;
    Q_NomeUsuarioLogado: TQRLabel;
    QR_Total: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    cds_RelCotacaoID_DETALHESCOTACAO: TIntegerField;
    cds_RelCotacaoCOTACAO_ID: TIntegerField;
    cds_RelCotacaoPRODUTO_ID: TIntegerField;
    cds_RelCotacaoUNITARIO: TFMTBCDField;
    cds_RelCotacaoQUANTIDADE: TFMTBCDField;
    cds_RelCotacaoTOTALITEM: TFMTBCDField;
    cds_RelCotacaoID_COTACAO: TIntegerField;
    cds_RelCotacaoID_CLIENTE: TIntegerField;
    cds_RelCotacaoTOTAL: TBCDField;
    cds_RelCotacaoDATA: TDateField;
    cds_RelCotacaoCLI_ID: TIntegerField;
    cds_RelCotacaoCLI_NOME: TStringField;
    cds_RelCotacaoID_PRODUTO: TIntegerField;
    cds_RelCotacaoDESCRICAO: TStringField;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
        TotalValoresCotacao : Extended;
        NumCotacao          : integer;
  end;

var
  Q_RelCotacao: TQ_RelCotacao;

implementation

uses U_dmDadosSegundo;

{$R *.DFM}

procedure TQ_RelCotacao.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

      TotalValoresCotacao := (TotalValoresCotacao + cds_RelCotacao.FieldByname('totalitem').AsCurrency);

end;

procedure TQ_RelCotacao.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

      QR_Total.Caption := FormatFloat ('#,##0.00', TotalValoresCotacao);

end;

procedure TQ_RelCotacao.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin

      TotalValoresCotacao := 0;

end;

end.
