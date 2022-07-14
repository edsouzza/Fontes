unit U_QRelPagtoCredores;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelPagamentosCredores = class(TQuickRep)
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
    qrbndDetailBand1: TQRBand;
    QRDBText19: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText2: TQRDBText;
    qrbnd1: TQRBand;
    QRLabel11: TQRLabel;
    qrsysdt4: TQRSysData;
    QRLabel7: TQRLabel;
    QR_TotalGeral: TQRLabel;
    qry_RelPagtoCredores: TSQLQuery;
    dsp_RelPagtoCredores: TDataSetProvider;
    cds_RelPagtoCredores: TClientDataSet;
    QRLabel10: TQRLabel;
    qryEmpresa: TSQLQuery;
    cds_RelPagtoCredoresID_PAGTO: TIntegerField;
    cds_RelPagtoCredoresCREDOR_ID: TIntegerField;
    cds_RelPagtoCredoresVALOR: TFMTBCDField;
    cds_RelPagtoCredoresDTVENCTO: TDateField;
    cds_RelPagtoCredoresDTPAGTO: TDateField;
    cds_RelPagtoCredoresMESANO: TStringField;
    cds_RelPagtoCredoresSTATUS: TStringField;
    cds_RelPagtoCredoresDTCAD: TDateField;
    cds_RelPagtoCredoresID_CREDOR: TIntegerField;
    cds_RelPagtoCredoresCREDOR: TStringField;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    lblLogado: TQRLabel;
    lblDATA: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText4: TQRDBText;
    procedure qrbndDetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbnd1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
      TotalValores : Extended;
      idUser       : integer;
  end;

var
  Q_RelPagamentosCredores: TQ_RelPagamentosCredores;

implementation

uses U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelPagamentosCredores.qrbndDetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin

    TotalValores := TotalValores + cds_RelPagtoCredores.FIELDBYNAME('VALOR').AsCurrency;
    
end;

procedure TQ_RelPagamentosCredores.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    TotalValores :=0;

    //carregando a logo da empresa
    QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);

    idUser := RetornaIDPassandoString('func_id','funcionarios','func_nome',NomeDoUsuarioLogado);

    lblLogado.Caption := RetornaUsuarioLogado(idUser);
    lblDATA.Caption   := DateToStr(now);

end;

procedure TQ_RelPagamentosCredores.qrbnd1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

    QR_TotalGeral.Caption := FormatFloat ('#,##0.00', TotalValores);

end;

end.
