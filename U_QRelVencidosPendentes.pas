unit U_QRelVencidosPendentes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelVencidosPendentes = class(TQuickRep)
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
    qrbndDetailBand1: TQRBand;
    QRDBText19: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    qryEmpresa: TSQLQuery;
    qry_RelVencidosPendentes: TSQLQuery;
    dsp_RelVencidosPendentes: TDataSetProvider;
    cds_RelVencidosPendentes: TClientDataSet;
    cds_RelVencidosPendentesID_PAGTO: TIntegerField;
    cds_RelVencidosPendentesCREDOR_ID: TIntegerField;
    cds_RelVencidosPendentesVALOR: TFMTBCDField;
    cds_RelVencidosPendentesDTVENCTO: TDateField;
    cds_RelVencidosPendentesDTPAGTO: TDateField;
    cds_RelVencidosPendentesMESANO: TStringField;
    cds_RelVencidosPendentesSTATUS: TStringField;
    cds_RelVencidosPendentesDTCAD: TDateField;
    cds_RelVencidosPendentesID_CREDOR: TIntegerField;
    cds_RelVencidosPendentesCREDOR: TStringField;
    qrbnd1: TQRBand;
    QRLabel11: TQRLabel;
    qrsysdt4: TQRSysData;
    QRLabel7: TQRLabel;
    QR_TotalGeral: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel12: TQRLabel;
    procedure qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
      TotalValores : double;
      idUser       : integer;
  public

  end;

var
  Q_RelVencidosPendentes: TQ_RelVencidosPendentes;

implementation

uses U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelVencidosPendentes.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   TotalValores := TotalValores + cds_RelVencidosPendentes.FIELDBYNAME('VALOR').AsCurrency;
end;

procedure TQ_RelVencidosPendentes.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin

    TotalValores :=0;

    //carregando a logo da empresa
    QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);

    idUser := RetornaIDPassandoString('func_id','funcionarios','func_nome',NomeDoUsuarioLogado);

    lblLogado.Caption := RetornaUsuarioLogado(idUser);
    lblDATA.Caption   := DateToStr(now);
    
end;

procedure TQ_RelVencidosPendentes.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    QR_TotalGeral.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

end.
