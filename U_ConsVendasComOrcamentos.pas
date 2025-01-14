unit U_ConsVendasComOrcamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmPesquisaVenda = class(TForm)
    pnl_cabecalho: TPanel;
    pnl1: TPanel;
    pnl_rodape: TPanel;
    GroupBox9: TGroupBox;
    edtVenda: TEdit;
    gridVenda: TDBGrid;
    btnLimpar: TButton;
    btnVisualizarVenda: TButton;
    procedure FormCreate(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure PopulandoGridVendas;
    procedure PesquisaPorVendas;
    procedure edtVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtVendaClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure rdVendaClick(Sender: TObject);
    procedure rdOrcamentoClick(Sender: TObject);
    procedure btnVisualizarVendaClick(Sender: TObject);
    procedure gridVendaCellClick(Column: TColumn);


  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  _frmPesquisaVenda: T_frmPesquisaVenda;

implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelAniversariantes, U_dmDadosSegundo,
  U_ConsTodosPedidos, U_ConsPedidosPorPeriodo, U_CadPedido, U_orcamento,
  U_ConsOrcamentosPorCliente, U_ConsOrcamentosPeriodo, U_Produtos,
  U_AlteraFornecedorDoProduto, U_AlteraFotoDoProduto, U_VisualizarVendaConcluida,
  U_CadCategoriasProdutos, U_CadFabricantesProdutos, U_ConsSimilares,
  U_GerenciarSimilares, U_GerenciarCreditosPagamentosComCartao,
  U_dmPesquisas, DB, DBClient;

{$R *.dfm}

procedure T_frmPesquisaVenda.FormCreate(Sender: TObject);
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

end;

procedure T_frmPesquisaVenda.PopulandoGridVendas;
begin

     PesquisaPorVendas;

end;


procedure T_frmPesquisaVenda.pnl_rodapeClick(
  Sender: TObject);
begin

     close;
     Release;

end;

procedure T_frmPesquisaVenda.edtVendaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if key = 13 then
     begin

          PopulandoGridVendas;

     end;

end;

procedure T_frmPesquisaVenda.edtVendaClick(Sender: TObject);
begin

     btnLimparClick(self);

end;

procedure T_frmPesquisaVenda.btnLimparClick(Sender: TObject);
begin

    edtVenda.Clear;
    edtVenda.SetFocus;
    gridVenda.DataSource := nil;

end;

procedure T_frmPesquisaVenda.PesquisaPorVendas;
begin

     idVenda := StrToInt(edtVenda.text);

     _Sql := 'SELECT v.id_venda, v.orcamento_id, v.status, c.cli_id, c.cli_nome FROM clientes c, venda v '+
             'WHERE v.cliente_id = c.cli_id AND v.id_venda = :pIDVenda';

           with DM_Pesq.cdsPesqVenda do
           begin

                Close;
                CommandText:= (_Sql);
                Params.ParamByName('pIDVenda').AsInteger :=  idVenda;
                Open;


                if not IsEmpty then
                begin

                    with gridVenda do
                    begin

                      DataSource:=  DM_Pesq.dsPesqVenda;
                      Columns.Clear;

                      Columns.Add;
                      Columns[0].FieldName        := 'ID_VENDA';
                      Columns[0].Width            := 100;
                      Columns[0].Alignment        := taCenter;
                      Columns[0].Title.caption    := 'VENDA';
                      Columns[0].Title.Font.Style := [fsBold];
                      Columns[0].Title.Alignment  := taCenter;


                      Columns.Add;
                      Columns[1].FieldName        := 'ORCAMENTO_ID';
                      Columns[1].Width            := 100;
                      Columns[1].Alignment        := taCenter;
                      Columns[1].Title.caption    := 'OR�AMENTO';
                      Columns[1].Title.Font.Style := [fsBold];
                      Columns[1].Title.Alignment  := taCenter;


                      Columns.Add;
                      Columns[2].FieldName        := 'CLI_NOME';
                      Columns[2].Width            := 420;
                      Columns[2].Alignment        := taLeftJustify;
                      Columns[2].Title.caption    := 'CLIENTE';
                      Columns[2].Title.Font.Style := [fsBold];
                      Columns[2].Title.Alignment  := taLeftJustify;

                    end;
                    
                    NomeDoClienteDaVenda       :=  DM_Pesq.cdsPesqVenda.fieldbyname('cli_nome').asstring;
                    btnVisualizarVenda.Enabled := true;

                end else
                begin

                    Application.MessageBox('Esse n�mero de venda n�o foi encontrado no Sistema!','Venda n�o encontrada', MB_OK);
                    edtVenda.Clear;
                    edtVenda.SetFocus;
                    exit;

                end;

           end;

end;

procedure T_frmPesquisaVenda.rdVendaClick(Sender: TObject);
begin

    edtVenda.SetFocus;

end;

procedure T_frmPesquisaVenda.rdOrcamentoClick(Sender: TObject);
begin

   edtVenda.SetFocus;

end;

procedure T_frmPesquisaVenda.btnVisualizarVendaClick(Sender: TObject);
begin

    Application.CreateForm(T_frmVisualizandoVendaConcluida,  _frmVisualizandoVendaConcluida);
    _frmVisualizandoVendaConcluida.ShowModal;
    FreeAndNil(_frmVisualizandoVendaConcluida);

end;

procedure T_frmPesquisaVenda.gridVendaCellClick(Column: TColumn);
begin

     btnVisualizarVendaClick(self);
     btnLimparClick(self);

end;

end.
