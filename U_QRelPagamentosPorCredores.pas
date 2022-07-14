unit U_QRelPagamentosPorCredores;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelPagamentosPorCredores = class(TQuickRep)
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
    qry_RelPagamentosPorCredores: TSQLQuery;
    dsp_RelPagamentosPorCredores: TDataSetProvider;
    cds_RelPagamentosPorCredores: TClientDataSet;
    cds_RelPagamentosPorCredoresID_PAGTO: TIntegerField;
    cds_RelPagamentosPorCredoresCREDOR_ID: TIntegerField;
    cds_RelPagamentosPorCredoresVALOR: TFMTBCDField;
    cds_RelPagamentosPorCredoresDTVENCTO: TDateField;
    cds_RelPagamentosPorCredoresDTPAGTO: TDateField;
    cds_RelPagamentosPorCredoresMESANO: TStringField;
    cds_RelPagamentosPorCredoresSTATUS: TStringField;
    cds_RelPagamentosPorCredoresDTCAD: TDateField;
    cds_RelPagamentosPorCredoresID_CREDOR: TIntegerField;
    cds_RelPagamentosPorCredoresCREDOR: TStringField;
    qryEmpresa: TSQLQuery;
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
  Q_RelPagamentosPorCredores: TQ_RelPagamentosPorCredores;

implementation
uses U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelPagamentosPorCredores.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin

    TotalValores :=0;

    //carregando a logo da empresa
    QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);

    idUser := RetornaIDPassandoString('func_id','funcionarios','func_nome',NomeDoUsuarioLogado);

    lblLogado.Caption := RetornaUsuarioLogado(idUser);
    lblDATA.Caption   := DateToStr(now);

end;

procedure TQ_RelPagamentosPorCredores.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TotalValores := TotalValores + cds_RelPagamentosPorCredores.FIELDBYNAME('VALOR').AsCurrency;
end;

procedure TQ_RelPagamentosPorCredores.qrbnd1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
    QR_TotalGeral.Caption := FormatFloat ('#,##0.00', TotalValores);
end;

end.
