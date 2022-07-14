unit U_QRelProdutosIndividual;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, Inifiles,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, SqlExpr, Dialogs;

type
  TQ_RelProdutosIndividual = class(TQuickRep)
    qrbndTitleBand1: TQRBand;
    qrsysdt2: TQRSysData;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
    qrsysdt3: TQRSysData;
    qrbnd2: TQRBand;
    qrshp4: TQRShape;
    qrshp5: TQRShape;
    qrshp6: TQRShape;
    qrlbl16: TQRLabel;
    qrlbl17: TQRLabel;
    qrdbtxtID_PRODUTO: TQRDBText;
    qrdbtxtDESCRICAO: TQRDBText;
    qrlbl20: TQRLabel;
    qrlbl21: TQRLabel;
    qrlbl22: TQRLabel;
    qrlbl24: TQRLabel;
    qrlbl26: TQRLabel;
    qrlbl27: TQRLabel;
    qrdbtxtDATACAD: TQRDBText;
    qrlbl29: TQRLabel;
    qrdbtxtCLI_ENDERECO: TQRDBText;
    qrdbtxtCLI_COMPLEMENTO: TQRDBText;
    qrdbtxtCLI_FONE: TQRDBText;
    qry_ProdutosIndividuais: TSQLQuery;
    qrlbl2: TQRLabel;
    qrdbtxtCLI_DATACAD: TQRDBText;
    intgrfld_ProdutosIndividuaisID_PRODUTO: TIntegerField;
    strngfld_ProdutosIndividuaisDESCRICAO: TStringField;
    bcdfld_ProdutosIndividuaisPRECOVENDA: TBCDField;
    dtfld_ProdutosIndividuaisDATACAD: TDateField;
    strngfld_ProdutosIndividuaisMESANO: TStringField;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    qry_ProdutosIndividuaisCOD_BARRAS: TStringField;
    qry_ProdutosIndividuaisESTOQUE_ATUAL: TFMTBCDField;
    qry_ProdutosIndividuaisESTOQUEMINIMO: TFMTBCDField;
    foto: TQRImage;
    QRLinhaDivisoria: TQRShape;
    QRLogo: TQRImage;
    qrlbl1: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    procedure MostrarFotoDoProduto;
    //procedure MostrarFotoPadrao;
  public

  end;

var
  Q_RelProdutosIndividual: TQ_RelProdutosIndividual;

implementation

uses U_dmDados, U_Produtos, U_BiblioSysSalao;

{$R *.DFM}

procedure TQ_RelProdutosIndividual.MostrarFotoDoProduto;
var
   caminhoFoto : string;
begin

    caminhoFoto := ExtractFilePath(Application.ExeName) + 'Produtos\'+codBarrasProduto+'.jpg';
    //ShowMessage(caminhoFoto);

    if FileExists(caminhoFoto) then
    begin
          foto.Picture.LoadFromFile(caminhoFoto)
    end;

end;

procedure TQ_RelProdutosIndividual.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    
   MostrarFotoDoProduto;
   QRLogo.Picture.LoadFromFile(CarregarLogoEmpresa);

end;



end.
