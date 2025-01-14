unit U_QRelLogAcessosIndividual;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelAcessosIndividual = class(TQuickRep)
    qrbndTitleBand1: TQRBand;
    qrbnd2: TQRBand;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
    qrsysdt3: TQRSysData;
    qry_LogAcessosIndividual: TSQLQuery;
    dsp_LogAcessosIndividual: TDataSetProvider;
    cds_LogAcessosIndividual: TClientDataSet;
    qrdbtxtFUNC_NOME: TQRDBText;
    qrdbtxtLOG_DATA: TQRDBText;
    qrdbtxtLOG_ENTRADA: TQRDBText;
    qrdbtxtLOG_SAIDA: TQRDBText;
    qrlbl5: TQRLabel;
    qrlbl2: TQRLabel;
    qrlbl4: TQRLabel;
    qrlbl3: TQRLabel;
    cds_LogAcessosIndividualFUNC_ID: TIntegerField;
    cds_LogAcessosIndividualFUNC_NOME: TStringField;
    cds_LogAcessosIndividualID_ACESSOS: TIntegerField;
    cds_LogAcessosIndividualID_USUARIO: TIntegerField;
    cds_LogAcessosIndividualLOG_DATA: TDateField;
    cds_LogAcessosIndividualLOG_ENTRADA: TStringField;
    cds_LogAcessosIndividualLOG_SAIDA: TStringField;
    QRLogo: TQRImage;
    qrlbl1: TQRLabel;
    qrsysdt2: TQRSysData;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelAcessosIndividual: TQ_RelAcessosIndividual;

implementation
uses  U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelAcessosIndividual.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
