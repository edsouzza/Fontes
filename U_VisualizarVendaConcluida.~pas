unit U_VisualizarVendaConcluida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,DateUtils, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus;

type
  T_frmVisualizandoVendaConcluida = class(TForm)
    pan_titulo: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    lbl45: TLabel;
    lblStatusLogoff: TLabel;
    panel_Produtos: TPanel;
    panel_total: TPanel;
    gridVenda: TDBGrid;
    pan_botoes: TPanel;
    GroupBox1: TGroupBox;
    edt_venda: TLabel;
    GroupBox2: TGroupBox;
    btnSair: TSpeedButton;
    GroupBox3: TGroupBox;
    btnImprimirPedido: TSpeedButton;
    lblCliente: TStaticText;
    lblStatus: TStaticText;
    Label1: TLabel;
    lblVALORTOTAL: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edt_QuantidadeProdutoPedidoKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MostrarOsItensDVenda;
    procedure btnImprimirPedidoClick(Sender: TObject);


  private
    { Private declarations }

  public
    { Public declarations }

    ValorUnitarioItemProdutoPedido, ValorAtualizadoAposCadastro,ValorTotalPedido,
    ValorAtualizadoAposDelecao, ValorLiquidoItemProdutoPedido, ValorTotalItemProdutoPedido,ValorItemDeletado,
    Qde_deletada, QuantidadeItemProdutoPedido, ValorTotalInicial, ValorTotalConvertido,ValorItemPraDeletarNaExclusao  : double;

    proxNumeDetalhe, proxNumItens, NumeroDaComandaAberta, proxNumComanda,Id_Produto, Id_FuncLogado, Id_Pedido : integer;
    DataDoDia         : TDate;
    PedidoSemItens    : boolean;

  end;

var
  _frmVisualizandoVendaConcluida: T_frmVisualizandoVendaConcluida;
            

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo,
  SqlExpr,DBClient, U_principal, DB, U_EscolhaDoProdutoParaPedido,
  U_ConsPedidosPorPeriodo, U_EscolhaProdutoParaAtualizarPedido,
  U_ConsTodosPedidos, U_QRelImprimePedido,U_QRelCupomVenda,
  U_ConsVendasComOrcamentos;


{$R *.dfm}

procedure T_frmVisualizandoVendaConcluida.FormCreate(Sender: TObject);
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

    lblDataDoDia.Caption         := DateToStr(now);
    lblHoraAtual.Caption         := timetoStr(time);
    lblStatusLogoff.Caption      := IdentificarUsuarioLogado;


end;

procedure T_frmVisualizandoVendaConcluida.FormShow(Sender: TObject);
begin

    edt_venda.Caption     :=  inttostr(idVenda);
    pan_titulo.Caption    :=  'Visualizando os Ítens da venda nº '+inttostr(idVenda);
    lblCliente.Caption    :=  NomeDoClienteDaVenda;
    lblStatus.Caption     := 'FECHADO';

    MostrarOsItensDVenda;

end;

procedure T_frmVisualizandoVendaConcluida.MostrarOsItensDVenda;
begin

          //IDENTIFICANDO A VENDA A SER MOSTRADO OS ITENS

          _Sql := 'SELECT v.id_produto,v.quantidade, v.vl_unitario, v.vl_totalitem, p.descricao FROM '+
                  'itens_vendas v, produtos p WHERE v.id_produto = p.id_produto '+
                  'AND v.id_venda = :pIDVenda';


          with DM_Pesq.cdsPesqVenda do
          begin

              close;
              CommandText :=(_SQL);
              Params.ParamByName('pIDVenda').AsInteger := idVenda;
              open;

              if not IsEmpty then
              begin

                  with gridVenda do
                  begin

                    TFloatField(DM_Pesq.cdsPesqVenda.FieldByName('vl_unitario')).DisplayFormat := '#,##0.00';
                    TFloatField(DM_Pesq.cdsPesqVenda.FieldByName('vl_totalitem')).DisplayFormat := '#,##0.00';


                    DataSource:=  DM_Pesq.dsPesqVenda;
                    Columns.Clear;

                    Columns.Add;
                    Columns[0].FieldName        := 'DESCRICAO';
                    Columns[0].Width            := 610;
                    Columns[0].Alignment        := taLeftJustify;
                    Columns[0].Title.caption    := 'PRODUTO';
                    Columns[0].Title.Font.Style := [fsBold];
                    Columns[0].Title.Alignment  := taLeftJustify;

                    Columns.Add;
                    Columns[1].FieldName        := 'QUANTIDADE';
                    Columns[1].Width            := 120;
                    Columns[1].Alignment        := taCenter;
                    Columns[1].Title.caption    := 'QDE';
                    Columns[1].Title.Font.Style := [fsBold];
                    Columns[1].Title.Alignment  := taCenter;

                    Columns.Add;
                    Columns[2].FieldName        := 'VL_UNITARIO';
                    Columns[2].Width            := 120;
                    Columns[2].Alignment        := taRightJustify;
                    Columns[2].Title.caption    := 'PREÇO';
                    Columns[2].Title.Font.Style := [fsBold];
                    Columns[2].Title.Alignment  := taRightJustify;

                    Columns.Add;
                    Columns[3].FieldName        := 'VL_TOTALITEM';
                    Columns[3].Width            := 120;
                    Columns[3].Alignment        := taRightJustify;
                    Columns[3].Title.caption    := 'TOTAL';
                    Columns[3].Title.Font.Style := [fsBold];
                    Columns[3].Title.Alignment  := taRightJustify;

                  end;

          end;
    end;

    //mostrando o total no label TOTAL
    _Sql := 'SELECT v.flag_devolucao, sum(v.vl_totalitem) as total FROM itens_vendas v WHERE v.id_venda = :pID '+
            'GROUP BY v.flag_devolucao';

     with DM_Pesq.Qry_Geral do
     begin

        close;
        sql.Clear;
        sql.Add(_SQL);
        Params.ParamByName('pID').AsInteger := idVenda;
        open;

        if not IsEmpty then
        begin

           lblVALORTOTAL.caption := Transform(DM_Pesq.Qry_Geral.FieldByName('total').AsFloat);

        end;

      end;

end;


procedure T_frmVisualizandoVendaConcluida.edt_QuantidadeProdutoPedidoKeyPress(
  Sender: TObject; var Key: Char);
begin

     // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;


procedure T_frmVisualizandoVendaConcluida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    release;

end;

procedure T_frmVisualizandoVendaConcluida.FormKeyPress(Sender: TObject;
  var Key: Char);
begin

      // Enter por Tab
      //verifica se a tecla pressionada é a tecla ENTER, conhecida pelo Delphi como #13
      If key = #13 then
      Begin
      //se for, passa o foco para o próximo campo, zerando o valor da variável Key
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
      end;

end;

procedure T_frmVisualizandoVendaConcluida.btnSairClick(Sender: TObject);
begin
    close;
    release;
end;


procedure T_frmVisualizandoVendaConcluida.btnImprimirPedidoClick(
  Sender: TObject);
begin

     with Q_RelCupomVenda.cds_RelCupomVenda do
      begin

          Close;
          Params.ParamByName('pIDVenda').value  :=  idVenda;
          Open;

          Q_RelCupomVenda.cds_RelCupomVenda.Active        := True;
          Q_RelCupomVenda.QryEmpresa.Active               := true;
          Q_RelCupomVenda.lblNomeUsuarioLogado.Caption    := NomeDoUsuarioLogado;
          Q_RelCupomVenda.Preview;
          Q_RelCupomVenda.ReportTitle                     := 'Cupom de Venda';

      end;
end;

end.






