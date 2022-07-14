unit Q_RelImprimeEtiquetas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DBXpress, FMTBcd, DB,
  DBClient, Provider, SqlExpr, CJVQrDbBarCode;

type
  TQ_ImprimeEtiquetas = class(TQuickRep)
    DetailBand1: TQRBand;
    GeradorCodBarra: TCJVQrDbBarCode;
  private

  public

  end;

var
  Q_ImprimeEtiquetas: TQ_ImprimeEtiquetas;

implementation

uses U_dmDadosSegundo;

{$R *.DFM}

end.
