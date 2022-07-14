unit U_QRelBalancete;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, SqlExpr, DB,
  DBClient, Provider;

type
  TQ_RelBalancete = class(TQuickRep)
    qrbndTitleBand1: TQRBand;
    qrlbl1: TQRLabel;
    qrsysdt2: TQRSysData;
    qrbnd2: TQRBand;
    qrdbtxtLOG_ENTRADA: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
    dspBalancete: TDataSetProvider;
    cdsVendaProdutos: TClientDataSet;
    qrlbl5: TQRLabel;
    qrlbl2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    sqlVendaProdutos: TSQLQuery;
    cdsVendaProdutosTOTALVALOR: TFMTBCDField;
  private

  public

  end;

var
  Q_RelBalancete: TQ_RelBalancete;

implementation

uses U_dmDados;

{$R *.DFM}

end.
