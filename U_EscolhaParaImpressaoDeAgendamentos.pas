unit U_EscolhaParaImpressaoDeAgendamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls,
  ToolEdit, ComCtrls, RXDBCtrl;

type
  T_frmEscolhaParaImpressaoDeAgendamentos = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    panel_datas: TPanel;
    lbl52: TLabel;
    lbl53: TLabel;
    btnFechar: TSpeedButton;
    edt_DataInicio: TDateEdit;
    edt_DataFim: TDateEdit;
    lstOpcoes: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure lstOpcoesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure ImprimirAgendamentosAbertos;
    procedure ImprimirAgendamentosFechados;
    procedure ImprimirAgendamentosCancelados;
  private
    { Private declarations }
  public
    { Public declarations }
    MesEscolhido, nomeDoMes : string;
  end;

var
  _frmEscolhaParaImpressaoDeAgendamentos: T_frmEscolhaParaImpressaoDeAgendamentos;

implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelAgendamentosAbertos,
  U_QRelAgendamentosFechados, U_QRelAgendamentosCancelados, DB;

{$R *.dfm}

procedure T_frmEscolhaParaImpressaoDeAgendamentos.FormCreate(Sender: TObject);
//DESABILITA O BOTAO FECHAR DO FORMULÁRIO
var
  hwndHandle : THANDLE;
  hMenuHandle : HMenu;
begin
//Impede movimentação do formulário
 DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  hwndHandle := Self.Handle;
  if (hwndHandle <> 0) then
    begin
      hMenuHandle := GetSystemMenu(hwndHandle, FALSE);
        if (hMenuHandle <> 0) then
          DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);

  end;

end;

procedure T_frmEscolhaParaImpressaoDeAgendamentos.lstOpcoesClick(
  Sender: TObject);
begin

      DataInicio     := edt_DataInicio.Date;
      DataFim        := edt_DataFim.Date;

     if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'IMPRIMIR       AGENDAMENTOS      ABERTOS' then
     begin

           if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                     ImprimirAgendamentosAbertos;

            end else begin

              Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
              edt_DataInicio.SetFocus;

           end;

    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'IMPRIMIR       AGENDAMENTOS    FECHADOS' then
    begin

         if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                     ImprimirAgendamentosFechados;

            end else begin

              Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
              edt_DataInicio.SetFocus;

           end;


    end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'IMPRIMIR     AGENDAMENTOS  CANCELADOS' then
    begin

         if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                     ImprimirAgendamentosCancelados;

            end else begin

              Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
              edt_DataInicio.SetFocus;

           end;        

    end;

end;

procedure T_frmEscolhaParaImpressaoDeAgendamentos.FormShow(
  Sender: TObject);
begin

  //   edt_DataInicio.Date := DataSelecionada;
  //   edt_DataFim.Date    := DataSelecionada;

end;

procedure T_frmEscolhaParaImpressaoDeAgendamentos.btnFecharClick(
  Sender: TObject);
begin
    close;
end;


procedure T_frmEscolhaParaImpressaoDeAgendamentos.ImprimirAgendamentosAbertos;
begin

       with Q_RelAgendamentosAbertos.cds_RelAgendamentosAbertos do
       begin

          Close;
          Params.ParamByName('pStatus').AsString     := 'ABERTO';
          Params.ParamByName('datainicio').AsDate    := DataInicio;
          Params.ParamByName('datafim').AsDate       := DataFim;
          Open;

          if not IsEmpty then
          begin

                Q_RelAgendamentosAbertos.Preview;


          end else begin

                Application.MessageBox('Não foram encontrados agendamentos abertos neste período!',
                'Nada encontrado!', MB_OK + MB_ICONWARNING);

          end;

       end;

end;


procedure T_frmEscolhaParaImpressaoDeAgendamentos.ImprimirAgendamentosFechados;
begin

         with Q_RelAgendamentosFechados.cds_RelAgendamentosFechados do
         begin

              Close;
              Params.ParamByName('pStatus').AsString     := 'FECHADO';
              Params.ParamByName('datainicio').AsDate    := DataInicio;
              Params.ParamByName('datafim').AsDate       := DataFim;
              Open;


          if not IsEmpty then
          begin

                Q_RelAgendamentosFechados.Preview;


          end else begin

                Application.MessageBox('Não foram encontrados agendamentos fechados neste período!',
                'Nada encontrado!', MB_OK + MB_ICONWARNING);

          end;


       end;

end;

procedure T_frmEscolhaParaImpressaoDeAgendamentos.ImprimirAgendamentosCancelados;
begin


          with Q_RelAgendamentosCancelados.cds_RelAgendamentosCancelados do
          begin

              Close;
              Params.ParamByName('pStatus').AsString     := 'CANCELADO';
              Params.ParamByName('datainicio').AsDate    := DataInicio;
              Params.ParamByName('datafim').AsDate       := DataFim;
              Open;


          if not IsEmpty then
          begin

                 Q_RelAgendamentosCancelados.Preview;


          end else begin

                Application.MessageBox('Não foram encontrados agendamentos cancelados neste período!',
                'Nada encontrado!', MB_OK + MB_ICONWARNING);

          end;

               
       end;

end;

end.
