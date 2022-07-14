unit U_RelEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, CJVQrDbBarCode;

type
  TRelEtiquetasF = class(TForm)
    QuickRep1: TQuickRep;
    qrDados: TQRStringsBand;
    GeradorCodBarra: TCJVQrDbBarCode;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
    EtiquetaInicial: integer;
  end;

var
  RelEtiquetasF: TRelEtiquetasF;

implementation

Uses U_dmDadosSegundo;

{$R *.dfm}

procedure TRelEtiquetasF.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
 x: integer;
begin

  QrDados.Items.Clear;

  for x:= 1 to EtiquetaInicial -1 do

      QrDados.Items.Add('');

      dm_DadosSegundo.cds_CodBarra.First;

      while not dm_DadosSegundo.cds_CodBarra.Eof do
      begin

         GeradorCodBarra.Texto:= dm_DadosSegundo.cds_CodBarra.FieldByName('codbarra').AsString;
         dm_DadosSegundo.cds_CodBarra.Next;

      end;

end;

end.
