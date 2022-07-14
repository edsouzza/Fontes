unit U_QRelPagtosVencer;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelPagtosVencer = class(TQuickRep)
    QRBand1: TQRBand;
    qrsysdt2: TQRSysData;
    QRLabel8: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
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
    QRLabel5: TQRLabel;
    QRLabel29: TQRLabel;
    QRLogo: TQRImage;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel1: TQRLabel;
    lblLogado: TQRLabel;
    lblDATA: TQRLabel;
    QRLabel12: TQRLabel;
    qrbndDetailBand1: TQRBand;
    QRDBText19: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    qrbnd1: TQRBand;
    QRLabel11: TQRLabel;
    qrsysdt4: TQRSysData;
    QRLabel7: TQRLabel;
    QR_TotalGeral: TQRLabel;
    qry_RelPagtosVencer: TSQLQuery;
    dsp_RelPagtosVencer: TDataSetProvider;
    cds_RelPagtosVencer: TClientDataSet;
    cds_RelPagtosVencerID_PAGTO: TIntegerField;
    cds_RelPagtosVencerCREDOR_ID: TIntegerField;
    cds_RelPagtosVencerVALOR: TFMTBCDField;
    cds_RelPagtosVencerDTVENCTO: TDateField;
    cds_RelPagtosVencerDTPAGTO: TDateField;
    cds_RelPagtosVencerMESANO: TStringField;
    cds_RelPagtosVencerSTATUS: TStringField;
    cds_RelPagtosVencerDTCAD: TDateField;
    cds_RelPagtosVencerID_CREDOR: TIntegerField;
    cds_RelPagtosVencerCREDOR: TStringField;
    qryEmpresa: TSQLQuery;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
      TotalValores : double;
      idUser       : integer;
  public

  end;

var
  Q_RelPagtosVencer: TQ_RelPagtosVencer;

implementation
uses U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelPagtosVencer.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin

   TotalValores :=0;

    //carregando a logo da empresa
    QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);

    idUser := RetornaIDPassandoString('func_id','funcionarios','func_nome',NomeDoUsuarioLogado);

    lblLogado.Caption := RetornaUsuarioLogado(idUser);
    lblDATA.Caption   := DateToStr(now);
    
end;

procedure TQ_RelPagtosVencer.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TotalValores := TotalValores + cds_RelPagtosVencer.FIELDBYNAME('VALOR').AsCurrency;
end;

procedure TQ_RelPagtosVencer.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QR_TotalGeral.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

end.
