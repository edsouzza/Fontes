unit U_QRelLogAcessos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelAcessos = class(TQuickRep)
    qrbndTitleBand1: TQRBand;
    qrlbl1: TQRLabel;
    qrsysdt2: TQRSysData;
    qrbnd2: TQRBand;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
    qrsysdt3: TQRSysData;
    qry_LogAcessos: TSQLQuery;
    dsp_qry_LogAcessos: TDataSetProvider;
    cds_LogAcessos: TClientDataSet;
    qrdbtxtFUNC_NOME: TQRDBText;
    qrdbtxtLOG_DATA: TQRDBText;
    qrdbtxtLOG_ENTRADA: TQRDBText;
    qrdbtxtLOG_SAIDA: TQRDBText;
    qrlbl5: TQRLabel;
    qrlbl2: TQRLabel;
    qrlbl4: TQRLabel;
    qrlbl3: TQRLabel;
    QRLogo: TQRImage;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Q_RelAcessos: TQ_RelAcessos;

implementation

uses  U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelAcessos.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);
end;

end.
