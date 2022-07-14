unit U_ConsOrcamentosParaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ToolEdit;

type
  T_frmConsOrcamentosParaPagamento = class(TForm)
    pan_titulo: TPanel;
    pangrid_atendimentos: TPanel;
    pan_botoes: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    grid_ListaOrcamentosAbertos: TDBGrid;
    btnFechar: TSpeedButton;
    DBMemoHistorico: TDBMemo;
    lblStatusLogoff: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PagarOrcamento;
    procedure PopularGridOrcamentos;
    procedure grid_ListaOrcamentosAbertosCellClick(Column: TColumn);
    procedure grid_ListaOrcamentosAbertosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);



  private
    { Private declarations }
  public
    { Public declarations }
     
  end;

var
  _frmConsOrcamentosParaPagamento: T_frmConsOrcamentosParaPagamento;


implementation

uses U_dmDados,  U_dmPesquisas, U_dmDadosSegundo,
  U_BiblioSysSalao,  U_principal, DBClient, U_QRelCotacaoPeriodo,
  U_FecharCotacao, U_Cotacao, U_orcamento,
  U_AtualizarFecharOrcamento, DB, U_QRelOrcamentoPeriodo,
  U_PagtoDoOrcamento;

{$R *.dfm}


procedure T_frmConsOrcamentosParaPagamento.FormCreate(Sender: TObject);
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


    //Recebe a data atual por padrão
    lblStatusLogoff.Caption :=  NomeDoUsuarioLogado;
    lblDataDoDia.Caption:=  DateToStr(date);
    lblHoraAtual.Caption:=  timetoStr(time);


end;

procedure T_frmConsOrcamentosParaPagamento.FormShow(Sender: TObject);
begin

    DM_Pesq.cdsPesqListaOrcamentos.Active := true;
    Caption := 'LOGADO POR '+NomeDoUsuarioLogado;
    PopularGridOrcamentos;

end;

procedure T_frmConsOrcamentosParaPagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    DM_Pesq.cdsPesqListaOrcamentos.Active := false;
    Release;

end;

procedure T_frmConsOrcamentosParaPagamento.btnFecharClick(Sender: TObject);
begin

  Close;

end;

procedure T_frmConsOrcamentosParaPagamento.grid_ListaOrcamentosAbertosCellClick(
  Column: TColumn);
begin

       //peguei os valores do relatorio pq ao clicar o mesmo ja é aberto e contem os valores necessarios
       //o grid foi carregado com os dados desse relatorio

       NumOrcamentoSelecionado     := DM_Pesq.cdsPesqListaOrcamentos.FieldByName('ID_ORCAMENTO').AsInteger;
       idCliente                   := DM_Pesq.cdsPesqListaOrcamentos.FieldByName('ID_CLIENTE').AsInteger;
       NomeCliente                 := DM_Pesq.cdsPesqListaOrcamentos.FieldByName('CLIENTE').AsString;
       TotalOrcamento              := DM_Pesq.cdsPesqListaOrcamentos.FieldByName('TOTAL').AsFloat;

       PagarOrcamento;

end;

procedure T_frmConsOrcamentosParaPagamento.grid_ListaOrcamentosAbertosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

      with grid_ListaOrcamentosAbertos do
      begin

        if DataSource.DataSet.FieldByName('status').AsString = 'AB' then
        begin

            if (gdSelected in State) then

              Canvas.Brush.Color := clMaroon   // cor do fundo da linha que estiver selecionada

            else
            begin

              // configuração das linhas que atendem o primeiro if, ou seja com STATUS A
              Canvas.Font.Style  := [fsBold];
              Canvas.Font.Color  := clBlue;

              // cor do fundo de todas as linhas
              Canvas.Brush.Color := clInfoBk;

            end
            end else begin

              // configuração das linhas que não atendem o primeiro if, ou seja com STATUS F ou C
              Canvas.Font.Color  := clBlue;
              Canvas.Brush.Color := clInfoBk;

            end;

            DefaultDrawColumnCell(Rect,DataCol,Column,State);

      end;

end;

procedure T_frmConsOrcamentosParaPagamento.PagarOrcamento;
begin

     Application.CreateForm(T_frmPagarOrcamento, _frmPagarOrcamento);
     _frmPagarOrcamento.ShowModal;
     FreeAndNil(_frmPagarOrcamento);

     close;

end;

procedure T_frmConsOrcamentosParaPagamento.PopularGridOrcamentos;
begin

            //MOSTRA TODOS OS ORÇAMENTOS ABERTOS PARA PAGAMENTO

            with DM_Pesq.cdsPesqListaOrcamentos do
            begin

                  Close;
                  CommandText:= ('select c.cli_nome as cliente, o.* from orcamento o, clientes c where o.id_cliente = c.cli_id  and o.status = '+QuotedStr('APROVADO')+'');
                  Open;

                  If not IsEmpty then
                  begin

                      TFloatField(DM_Pesq.cdsPesqListaOrcamentos.FieldByName('total')).DisplayFormat := '#,##0.00';

                      with grid_ListaOrcamentosAbertos do
                      begin

                        DataSource:=  DM_Pesq.dsPesqListaOrcamentos;
                        Columns.Clear;

                        Columns.Add;
                        Columns[0].FieldName         := 'CLIENTE';
                        Columns[0].Width             := 510;
                        Columns[0].Alignment         := taLeftJustify;
                        Columns[0].Title.caption     := 'CLIENTE';
                        Columns[0].Title.Font.Style  := [fsBold];
                        Columns[0].Title.Alignment   := taLeftJustify;

                        Columns.Add;
                        Columns[1].FieldName         := 'ID_ORCAMENTO';
                        Columns[1].Width             := 100;
                        Columns[1].Alignment         := taCenter;
                        Columns[1].Title.caption     := 'ORÇAMENTO';
                        Columns[1].Title.Font.Style  := [fsBold];
                        Columns[1].Title.Alignment   := taCenter;

                        Columns.Add;
                        Columns[2].FieldName         := 'DATA';
                        Columns[2].Width             := 120;
                        Columns[2].Alignment         := taCenter;
                        Columns[2].Title.caption     := 'DATA';
                        Columns[2].Title.Font.Style  := [fsBold];
                        Columns[2].Title.Alignment   := taCenter;

                        Columns.Add;
                        Columns[3].FieldName         := 'TOTAL';
                        Columns[3].Width             := 120;
                        Columns[3].Alignment         := taCenter;
                        Columns[3].Title.caption     := 'TOTAL';
                        Columns[3].Title.Font.Style  := [fsBold];
                        Columns[3].Title.Alignment   := taCenter;

                        Columns.Add;
                        Columns[4].FieldName         := 'STATUS';
                        Columns[4].Width             := 100;
                        Columns[4].Alignment         := taCenter;
                        Columns[4].Title.caption     := 'STATUS';
                        Columns[4].Title.Font.Style  := [fsBold];
                        Columns[4].Title.Alignment   := taCenter;

                      end;

                  end;
        end;

end;

end.

