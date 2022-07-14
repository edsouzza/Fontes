unit U_QRelAgendamentosCancelados;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TQ_RelAgendamentosCancelados = class(TQuickRep)
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
    qry_RelAgendamentosCancelados: TSQLQuery;
    dsp_RelAgendamentosCancelados: TDataSetProvider;
    cds_RelAgendamentosCancelados: TClientDataSet;
    cds_RelAgendamentosCanceladosID_AGENDAMENTO: TIntegerField;
    cds_RelAgendamentosCanceladosAGENDADOPOR: TIntegerField;
    cds_RelAgendamentosCanceladosDATA_AGENDADA: TDateField;
    cds_RelAgendamentosCanceladosHORA_AGENDADA: TStringField;
    cds_RelAgendamentosCanceladosMESANO: TStringField;
    cds_RelAgendamentosCanceladosSTATUS: TStringField;
    cds_RelAgendamentosCanceladosFUNC_ID: TIntegerField;
    cds_RelAgendamentosCanceladosFUNC_NOME: TStringField;
    cds_RelAgendamentosCanceladosCLIENTE: TStringField;
    cds_RelAgendamentosCanceladosNAOCLIENTE: TStringField;
    cds_RelAgendamentosCanceladosTELEFONE: TStringField;
    cds_RelAgendamentosCanceladosCELULAR: TStringField;
    cds_RelAgendamentosCanceladosCADASTRADO: TStringField;
  private

  public

  end;

var
  Q_RelAgendamentosCancelados: TQ_RelAgendamentosCancelados;

implementation

{$R *.DFM}

end.
