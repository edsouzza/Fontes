unit U_QRelAgendamentosFechados;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelAgendamentosFechados = class(TQuickRep)
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
    qry_RelAgendamentosFechados: TSQLQuery;
    dsp_RelAgendamentosFechados: TDataSetProvider;
    cds_RelAgendamentosFechados: TClientDataSet;
    cds_RelAgendamentosFechadosID_AGENDAMENTO: TIntegerField;
    cds_RelAgendamentosFechadosAGENDADOPOR: TIntegerField;
    cds_RelAgendamentosFechadosDATA_AGENDADA: TDateField;
    cds_RelAgendamentosFechadosHORA_AGENDADA: TStringField;
    cds_RelAgendamentosFechadosMESANO: TStringField;
    cds_RelAgendamentosFechadosSTATUS: TStringField;
    cds_RelAgendamentosFechadosFUNC_ID: TIntegerField;
    cds_RelAgendamentosFechadosFUNC_NOME: TStringField;
    cds_RelAgendamentosFechadosCLIENTE: TStringField;
    cds_RelAgendamentosFechadosNAOCLIENTE: TStringField;
    cds_RelAgendamentosFechadosTELEFONE: TStringField;
    cds_RelAgendamentosFechadosCELULAR: TStringField;
    cds_RelAgendamentosFechadosCADASTRADO: TStringField;
  private

  public

  end;

var
  Q_RelAgendamentosFechados: TQ_RelAgendamentosFechados;

implementation

{$R *.DFM}

end.
