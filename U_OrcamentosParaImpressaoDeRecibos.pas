unit U_OrcamentosParaImpressaoDeRecibos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ToolEdit;

type
  T_frmOrcamentosParaImpressaoDeRecibos = class(TForm)
    pan_titulo: TPanel;
    pangrid_atendimentos: TPanel;
    pan_botoes: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    grid_ListaOrcamentosFinalizados: TDBGrid;
    btnFechar: TSpeedButton;
    DBMemoHistorico: TDBMemo;
    btnImprimirResumo: TSpeedButton;
    lblStatusLogoff: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopularGridOrcamentos;
    procedure ImprimirCupomJato;
    procedure ImprimirCupomMatricial;
    procedure grid_ListaOrcamentosFinalizadosCellClick(Column: TColumn);
    procedure grid_ListaOrcamentosFinalizadosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnImprimirResumoClick(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
     
  end;

var
  _frmOrcamentosParaImpressaoDeRecibos: T_frmOrcamentosParaImpressaoDeRecibos;


implementation

uses U_dmDados,  U_dmPesquisas, U_dmDadosSegundo,
  U_BiblioSysSalao,  U_principal, DBClient, U_QRelCotacaoPeriodo,
  U_FecharCotacao, U_Cotacao, U_orcamento,
  U_AtualizarFecharOrcamento, DB, U_QRelOrcamentoPeriodo,
  U_PagtoDoOrcamento, U_QRelPagtoOrcamento, U_QRelResumoDePagtosPeriodo;

{$R *.dfm}


procedure T_frmOrcamentosParaImpressaoDeRecibos.FormCreate(Sender: TObject);
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


    //Recebe a data atual por padr�o
    lblStatusLogoff.Caption :=  NomeDoUsuarioLogado;
    lblDataDoDia.Caption    :=  DateToStr(date);
    lblHoraAtual.Caption    :=  timetoStr(time);

end;

procedure T_frmOrcamentosParaImpressaoDeRecibos.FormShow(Sender: TObject);
begin

    DM_Pesq.cdsPesqListaOrcamentos.Active := true;
    Caption := 'LOGADO POR '+NomeDoUsuarioLogado;
    PopularGridOrcamentos;

end;

procedure T_frmOrcamentosParaImpressaoDeRecibos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    DM_Pesq.cdsPesqListaOrcamentos.Active := false;
    Release;

end;

procedure T_frmOrcamentosParaImpressaoDeRecibos.btnFecharClick(Sender: TObject);
begin         

  Close;

end;

procedure T_frmOrcamentosParaImpressaoDeRecibos.ImprimirCupomJato;
begin

      AvisoTemporario('Imprimindo cupom...');

      Application.CreateForm(TQ_RelCupomPagtoOrcamento,  Q_RelCupomPagtoOrcamento);
      with Q_RelCupomPagtoOrcamento.cds_RelCupomPagtoOrcamento do
      begin

        Close;
        Params.ParamByName('pIDOrcamento').value  :=  NumOrcamentoSelecionado;
        Open;

        Q_RelCupomPagtoOrcamento.cds_RelCupomPagtoOrcamento.Active := True;
        Q_RelCupomPagtoOrcamento.ReportTitle := 'Cupom de Pagamento';
        Q_RelCupomPagtoOrcamento.lblNomeUsuarioLogado.Caption := sUsuarioLogado;
        Q_RelCupomPagtoOrcamento.Preview;
        FreeAndNil(Q_RelCupomPagtoOrcamento);

      end;

end;

procedure T_frmOrcamentosParaImpressaoDeRecibos.ImprimirCupomMatricial;
var
   idVendaImpressao : integer;
begin

    AvisoTemporario('Imprimindo cupom...');

    idVendaImpressao := RetornaNumVenda(NumOrcamentoSelecionado);

    //GERA O CUPOM COM AS DEFINI��ES
    GerarCupomMatricial(idVendaImpressao);

end;

procedure T_frmOrcamentosParaImpressaoDeRecibos.grid_ListaOrcamentosFinalizadosCellClick(
  Column: TColumn);
begin

       //peguei os valores do relatorio pq ao clicar o mesmo ja � aberto e contem os valores necessarios
       //o grid foi carregado com os dados desse relatorio

       NumOrcamentoSelecionado     := DM_Pesq.cdsPesqListaOrcamentos.FieldByName('ID_ORCAMENTO').AsInteger;
       idClienteImpressao          := DM_Pesq.cdsPesqListaOrcamentos.FieldByName('ID_CLIENTE').AsInteger;
       NomeCliente                 := DM_Pesq.cdsPesqListaOrcamentos.FieldByName('CLIENTE').AsString;

       //Direciona a impressao do cupom
       if(imprimirJato)then
       begin
         ImprimirCupomJato;
       end else if (imprimirMatricial)then
       begin
         ImprimirCupomMatricial;
       end;
         
end;

procedure T_frmOrcamentosParaImpressaoDeRecibos.grid_ListaOrcamentosFinalizadosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

      with grid_ListaOrcamentosFinalizados do
      begin

        if DataSource.DataSet.FieldByName('status').AsString = 'FINALIZADO' then
        begin

            if (gdSelected in State) then

              Canvas.Brush.Color := clMaroon   // cor do fundo da linha que estiver selecionada

            else
            begin

              // configura��o das linhas que atendem o primeiro if, ou seja com STATUS A
              Canvas.Font.Style  := [fsBold];
              Canvas.Font.Color  := clBlue;

              // cor do fundo de todas as linhas
              Canvas.Brush.Color := clInfoBk;

            end
            end else begin

              // configura��o das linhas que n�o atendem o primeiro if, ou seja com STATUS F ou C
              Canvas.Font.Color  := clBlue;
              Canvas.Brush.Color := clInfoBk;

            end;

            DefaultDrawColumnCell(Rect,DataCol,Column,State);

      end;

end;

procedure T_frmOrcamentosParaImpressaoDeRecibos.PopularGridOrcamentos;
begin

            //MOSTRA TODOS OS OR�AMENTOS ABERTOS PARA PAGAMENTO

            with DM_Pesq.cdsPesqListaOrcamentos do
            begin
                  Close;
                  CommandText:= ('SELECT O.*, CL.CLI_ID, CL.CLI_NOME AS CLIENTE FROM ORCAMENTO O, CLIENTES CL WHERE O.id_cliente = CL.cli_id AND O.STATUS = '+QuotedStr('FINALIZADO')+' AND O.id_cliente = :pIDCLIENTE AND O.DATA BETWEEN :DATAINICIAL AND :DATAFINAL');
                  Params.ParamByName('pIDCLIENTE').AsInteger   := IdCliente;
                  Params.ParamByName('DATAINICIAL').AsDate     := DataInicioImprimir;
                  Params.ParamByName('DATAFINAL').AsDate       := DataFimImprimir;
                  Open;

                  If not IsEmpty then
                  begin


                      with grid_ListaOrcamentosFinalizados do
                      begin

                        TFloatField(DM_Pesq.cdsPesqListaOrcamentos.FieldByName('TOTAL')).DisplayFormat := '#,##0.00';
                        DataSource:=  DM_Pesq.dsPesqListaOrcamentos;
                        Columns.Clear;

                        Columns.Add;
                        Columns[0].FieldName         := 'CLIENTE';
                        Columns[0].Width             := 650;
                        Columns[0].Alignment         := taLeftJustify;
                        Columns[0].Title.caption     := 'CLIENTE';
                        Columns[0].Title.Font.Style  := [fsBold];
                        Columns[0].Title.Alignment   := taLeftJustify;

                        Columns.Add;
                        Columns[1].FieldName         := 'ID_ORCAMENTO';
                        Columns[1].Width             := 100;
                        Columns[1].Alignment         := taCenter;
                        Columns[1].Title.caption     := 'OR�AMENTO';
                        Columns[1].Title.Font.Style  := [fsBold];
                        Columns[1].Title.Alignment   := taCenter;

                        Columns.Add;
                        Columns[2].FieldName         := 'DATA';
                        Columns[2].Width             := 100;
                        Columns[2].Alignment         := taCenter;
                        Columns[2].Title.caption     := 'DATA';
                        Columns[2].Title.Font.Style  := [fsBold];
                        Columns[2].Title.Alignment   := taCenter;

                        Columns.Add;
                        Columns[3].FieldName         := 'TOTAL';
                        Columns[3].Width             := 100;
                        Columns[3].Alignment         := taCenter;
                        Columns[3].Title.caption     := 'TOTAL';
                        Columns[3].Title.Font.Style  := [fsBold];
                        Columns[3].Title.Alignment   := taCenter;

                      end;

                  end;
            end;

end;

procedure T_frmOrcamentosParaImpressaoDeRecibos.btnImprimirResumoClick(
  Sender: TObject);
begin

      //imprimir resumo de todos os pagamentos do cliente selecionado dentro do per�odo selecionado
      
      NumOrcamentoSelecionado     := DM_Pesq.cdsPesqListaOrcamentos.FieldByName('ID_ORCAMENTO').AsInteger;
      idClienteImpressao          := DM_Pesq.cdsPesqListaOrcamentos.FieldByName('ID_CLIENTE').AsInteger;
      NomeCliente                 := DM_Pesq.cdsPesqListaOrcamentos.FieldByName('CLIENTE').AsString;

      AvisoTemporario('Imprimindo pagamentos do cliente...');


      Application.CreateForm(TQ_RelResumoPagtosOrcamentos,  Q_RelResumoPagtosOrcamentos);
      with Q_RelResumoPagtosOrcamentos.cds_RelResumoPagtosOrcamentos do
      begin

        Close;
        Params.ParamByName('pIDCliente').value    :=  idClienteImpressao;
        Params.ParamByName('datainicial').AsDate  :=  DataInicio;
        Params.ParamByName('datafinal').AsDate    :=  DataFim;
        Open;


        Q_RelResumoPagtosOrcamentos.cds_RelResumoPagtosOrcamentos.Active := True;
        Q_RelResumoPagtosOrcamentos.ReportTitle      := 'Pagamentos Do Cliente Selecionado No Per�odo de '+periodo;
        Q_RelResumoPagtosOrcamentos.lblNomeUsuarioLogado.Caption := sUsuarioLogado;
        Q_RelResumoPagtosOrcamentos.Preview;
        FreeAndNil(Q_RelResumoPagtosOrcamentos);

      end;

end;

end.

