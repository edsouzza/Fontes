unit U_QRelMesAnoSelecionado;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelMesAnoSelecionado = class(TQuickRep)
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
    QRLabel10: TQRLabel;
    QRLabel1: TQRLabel;
    lblLogado: TQRLabel;
    lblDATA: TQRLabel;
    QRLabel12: TQRLabel;
    qryEmpresa: TSQLQuery;
    qrbndDetailBand1: TQRBand;
    QRDBText19: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    qrbnd1: TQRBand;
    QRLabel11: TQRLabel;
    qrsysdt4: TQRSysData;
    QRLabel7: TQRLabel;
    QR_TotalGeral: TQRLabel;
    qry_RelMesAnoSelecionado: TSQLQuery;
    dsp_RelMesAnoSelecionado: TDataSetProvider;
    cds_RelMesAnoSelecionado: TClientDataSet;
    cds_RelMesAnoSelecionadoID_PAGTO: TIntegerField;
    cds_RelMesAnoSelecionadoCREDOR_ID: TIntegerField;
    cds_RelMesAnoSelecionadoVALOR: TFMTBCDField;
    cds_RelMesAnoSelecionadoDTVENCTO: TDateField;
    cds_RelMesAnoSelecionadoDTPAGTO: TDateField;
    cds_RelMesAnoSelecionadoMESANO: TStringField;
    cds_RelMesAnoSelecionadoSTATUS: TStringField;
    cds_RelMesAnoSelecionadoDTCAD: TDateField;
    cds_RelMesAnoSelecionadoID_CREDOR: TIntegerField;
    cds_RelMesAnoSelecionadoCREDOR: TStringField;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
      TotalValores : Extended;
      idUser       : integer;
  public

  end;

var
  Q_RelMesAnoSelecionado: TQ_RelMesAnoSelecionado;

implementation
uses U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelMesAnoSelecionado.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin

    TotalValores :=0;

    //carregando a logo da empresa
    QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);

    idUser := RetornaIDPassandoString('func_id','funcionarios','func_nome',NomeDoUsuarioLogado);

    lblLogado.Caption := RetornaUsuarioLogado(idUser);
    lblDATA.Caption   := DateToStr(now);

end;

procedure TQ_RelMesAnoSelecionado.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TotalValores := TotalValores + cds_RelMesAnoSelecionado.FIELDBYNAME('VALOR').AsCurrency;
end;

procedure TQ_RelMesAnoSelecionado.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QR_TotalGeral.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

end.
