unit U_EscolhaParaOrcamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaParaOrcamentos = class(TForm)
    pnl_cabecalho: TPanel;
    pnl1: TPanel;
    pnl_rodape: TPanel;
    btnAbrirNovoOrcamento: TSpeedButton;
    btnConsultarOrcamentos: TSpeedButton;
    btnAtualizarOrcamento: TSpeedButton;
    btnPagarOrcamento: TSpeedButton;
    btnImprimirCupons: TSpeedButton;
    btnSair: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnAbrirNovoOrcamentoClick(Sender: TObject);
    procedure btnConsultarOrcamentosClick(Sender: TObject);
    procedure btnPagarOrcamentoClick(Sender: TObject);
    procedure btnAtualizarOrcamentoClick(Sender: TObject);
    procedure btnImprimirCuponsClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    MesEscolhido, nomeDoMes : string;
  end;

var
  _frmEscolhaParaOrcamentos: T_frmEscolhaParaOrcamentos;

implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelAniversariantes, U_dmDadosSegundo,
  U_ConsTodosPedidos, U_ConsPedidosPorPeriodo, U_CadPedido, U_orcamento,
  U_ConsOrcamentosPorCliente, U_ConsOrcamentosPeriodo,
  U_ConsOrcamentosParaPagamento, U_dmPesquisas,
  U_OrcamentosParaImpressaoDeRecibos, U_principal;

{$R *.dfm}

procedure T_frmEscolhaParaOrcamentos.FormCreate(Sender: TObject);
//DESABILITA O BOTAO FECHAR DO FORMUL�RIO
var
  hwndHandle : THANDLE;
  hMenuHandle : HMenu;
begin
//Impede movimenta��o do formul�rio
 DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  hwndHandle := Self.Handle;
  if (hwndHandle <> 0) then
    begin
      hMenuHandle := GetSystemMenu(hwndHandle, FALSE);
        if (hMenuHandle <> 0) then
          DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);
  end;

  lblDataDoDia.Caption      := DateToStr(date);
  lblHoraAtual.Caption      := timetoStr(time);

end;

procedure T_frmEscolhaParaOrcamentos.btnAbrirNovoOrcamentoClick(Sender: TObject);
begin

    abrindoOrcamento := false;  //significa que n�o foi aberto atraves do cadastro de clientes
    
    Application.CreateForm(T_frmOrcamento,  _frmOrcamento);
    _frmOrcamento.ShowModal;
    FreeAndNil(_frmOrcamento);

end;

procedure T_frmEscolhaParaOrcamentos.btnConsultarOrcamentosClick(Sender: TObject);
begin

     dm_DadosSegundo.cds_Orcamento.Active := true;

     if (dm_DadosSegundo.cds_Orcamento.RecordCount = 0) then
     begin

         Application.MessageBox('A tabela de or�amentos encontra-se vazia no momento!','Informa��o do Sistema',MB_ICONEXCLAMATION);

     end else
     begin

        Application.CreateForm(T_frmConsOrcamentosPorCliente,  _frmConsOrcamentosPorCliente);
        _frmConsOrcamentosPorCliente.ShowModal;
        FreeAndNil(_frmConsOrcamentosPorCliente);

     end;

end;

procedure T_frmEscolhaParaOrcamentos.btnPagarOrcamentoClick(Sender: TObject);
begin

     DM_Pesq.cdsPesqListaOrcamentos.Active := true;
     with DM_Pesq.cdsPesqListaOrcamentos do
     begin

          Close;
          CommandText:= ('select c.cli_nome as cliente, o.* from orcamento o, clientes c where o.id_cliente = c.cli_id  and o.status = '+QuotedStr('APROVADO')+'');
          Open;

          If IsEmpty then
          begin

             Application.MessageBox('No momento n�o h� or�amentos fechados para pagamento!','Informa��o do Sistema',MB_ICONEXCLAMATION);

         end else
         begin

                Application.CreateForm(T_frmConsOrcamentosParaPagamento,  _frmConsOrcamentosParaPagamento);
                _frmConsOrcamentosParaPagamento.ShowModal;
                FreeAndNil(_frmConsOrcamentosParaPagamento);

         end;

      end;

end;

procedure T_frmEscolhaParaOrcamentos.btnAtualizarOrcamentoClick(Sender: TObject);
begin   

      _Sql :='SELECT O.*, CL.CLI_ID, CL.CLI_NOME FROM ORCAMENTO O, CLIENTES CL WHERE O.ID_CLIENTE = CL.CLI_ID AND O.STATUS = '+QuotedStr('PENDENTE')+'';

      With DM_Pesq.qry_Cod do begin

        Close;
        SQL.Clear;
        SQL.Add(_Sql);
        Open;

        if not IsEmpty then
        begin

           Application.CreateForm(T_frmConsOrcamentosPeriodo,  _frmConsOrcamentosPeriodo);
           _frmConsOrcamentosPeriodo.ShowModal;
           FreeAndNil(_frmConsOrcamentosPeriodo);

        end else begin

          {   Application.MessageBox('N�o      foram    encontrados     or�amentos      com    status    "PENDENTE"  ou    que   estejam    aguardando   aprova��o   do  cliente!',
             'Aten��o...', MB_OK + MB_ICONWARNING);  }

             Application.MessageBox('N�o foram encontrados or�amentos com status "PENDENTE" ou    que   estejam    aguardando    aprova��o   do   cliente!',
             'Aten��o...', MB_OK + MB_ICONWARNING);

        end;

      end;

end;

procedure T_frmEscolhaParaOrcamentos.btnImprimirCuponsClick(Sender: TObject);
begin

     if not(TemUmOrcamentoFinalizado)then
     begin
         Application.MessageBox('N�o existem cupons a serem impressos no momento!','Informa��o do Sistema',MB_ICONEXCLAMATION);
     end else
     begin

        ImprimindoRelatorio := true;

        Application.CreateForm(T_frmConsOrcamentosPorCliente,  _frmConsOrcamentosPorCliente);
        _frmConsOrcamentosPorCliente.ShowModal;
        FreeAndNil(_frmConsOrcamentosPorCliente);

     end;
     
end;

procedure T_frmEscolhaParaOrcamentos.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure T_frmEscolhaParaOrcamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     _frmPrincipal.logo.Visible := true;
end;

end.
