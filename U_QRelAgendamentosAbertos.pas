unit U_QRelAgendamentosAbertos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelAgendamentosAbertos = class(TQuickRep)
    qrbndPageHeaderBand1: TQRBand;
    qrlbl1: TQRLabel;
    qrsysdt2: TQRSysData;
    qrbndColumnHeaderBand1: TQRBand;
    qrlbl17: TQRLabel;
    qrlbl18: TQRLabel;
    qrlbl5: TQRLabel;
    qrlbl6: TQRLabel;
    QRLabel1: TQRLabel;
    qrbndDetailBand1: TQRBand;
    qrdbtxtDESCRIPAGTO_DESCRICAO: TQRDBText;
    qrdbtxtCLI_APELIDO: TQRDBText;
    qrdbtxtDATALANCAMENTO: TQRDBText;
    qrdbtxtQUANTIDADE: TQRDBText;
    QRDBText1: TQRDBText;
    qrbnd1: TQRBand;
    qrsysdt1: TQRSysData;
    qrsysdt3: TQRSysData;
    qry_RelAgendamentosAbertos: TSQLQuery;
    dsp_RelAgendamentosAbertos: TDataSetProvider;
    cds_RelAgendamentosAbertos: TClientDataSet;
    cds_RelAgendamentosAbertosID_AGENDAMENTO: TIntegerField;
    cds_RelAgendamentosAbertosAGENDADOPOR: TIntegerField;
    cds_RelAgendamentosAbertosDATA_AGENDADA: TDateField;
    cds_RelAgendamentosAbertosHORA_AGENDADA: TStringField;
    cds_RelAgendamentosAbertosMESANO: TStringField;
    cds_RelAgendamentosAbertosSTATUS: TStringField;
    cds_RelAgendamentosAbertosFUNC_ID: TIntegerField;
    cds_RelAgendamentosAbertosFUNC_NOME: TStringField;
    cds_RelAgendamentosAbertosCLIENTE: TStringField;
    cds_RelAgendamentosAbertosNAOCLIENTE: TStringField;
    cds_RelAgendamentosAbertosTELEFONE: TStringField;
    cds_RelAgendamentosAbertosCELULAR: TStringField;
    cds_RelAgendamentosAbertosCADASTRADO: TStringField;
  private

  public

  end;

var
  Q_RelAgendamentosAbertos: TQ_RelAgendamentosAbertos;

implementation

{$R *.DFM}

end.
