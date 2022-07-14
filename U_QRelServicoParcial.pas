unit U_QRelServicoParcial;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, SqlExpr;

type
  TQ_RelServicoParcial = class(TQuickRep)
    qrbndTitleBand1: TQRBand;
    qrlbl1: TQRLabel;
    qrsysdt2: TQRSysData;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
    qrbnd2: TQRBand;
    qrshp6: TQRShape;
    qrlbl16: TQRLabel;
    qrlbl17: TQRLabel;
    qrdbtxtFORNE_ID: TQRDBText;
    qrdbtxtFORNE_NOME: TQRDBText;
    qrlbl20: TQRLabel;
    qrlbl21: TQRLabel;
    qrlbl22: TQRLabel;
    qrlbl27: TQRLabel;
    qrdbtxtFORNE_DATACAD: TQRDBText;
    qrdbtxtCLI_ENDERECO: TQRDBText;
    qrdbtxtCLI_COMPLEMENTO: TQRDBText;
    Qry_Servicos: TSQLQuery;
    QRLabel1: TQRLabel;
    QRLabelTotal: TQRLabel;
    Qry_ServicosID_SERVICO: TIntegerField;
    Qry_ServicosCODBARRAS: TStringField;
    Qry_ServicosDESCRICAO: TStringField;
    Qry_ServicosVALOR: TFMTBCDField;
    Qry_ServicosTIPO: TStringField;
    Qry_ServicosSTATUS: TStringField;
    Qry_ServicosDATA: TDateField;
  private

  public

  end;

var
  Q_RelServicoParcial: TQ_RelServicoParcial;

implementation

uses U_dmDados;

{$R *.DFM}

end.
