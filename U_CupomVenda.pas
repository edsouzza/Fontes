unit U_CupomVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmCupomVenda = class(TForm)
    pnl_cabecalho: TPanel;
    pnl1: TPanel;
    pnl_rodape: TPanel;
    GroupBox9: TGroupBox;
    edtVenda: TEdit;
    gridVenda: TDBGrid;
    btnLimpar: TButton;
    rdVenda: TRadioButton;
    rdOrcamento: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure PopulandoGridVendas;
    procedure PesquisaPorVendas;
    procedure PesquisaPorOrcamentos;
    procedure edtVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtVendaClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdVendaClick(Sender: TObject);
    procedure rdOrcamentoClick(Sender: TObject);
    procedure LimparPesquisa;
    procedure ImprimirCupom;
    procedure gridVendaCellClick(Column: TColumn);


  private
    { Private declarations }
    idVenda, NumOrcamento : integer;
  public
    { Public declarations }

  end;

var
  _frmCupomVenda: T_frmCupomVenda;

implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelAniversariantes, U_dmDadosSegundo,
  U_ConsTodosPedidos, U_ConsPedidosPorPeriodo, U_CadPedido, U_orcamento,
  U_ConsOrcamentosPorCliente, U_ConsOrcamentosPeriodo, U_Produtos,
  U_AlteraFornecedorDoProduto, U_AlteraFotoDoProduto,
  U_CadCategoriasProdutos, U_CadFabricantesProdutos, U_ConsSimilares,
  U_GerenciarSimilares, U_GerenciarCreditosPagamentosComCartao,
  U_dmPesquisas, DB, DBClient, U_QRelPagtoOrcamento, U_QRelCupomVenda,
  U_principal;

{$R *.dfm}

procedure T_frmCupomVenda.FormCreate(Sender: TObject);
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

procedure T_frmCupomVenda.PopulandoGridVendas;
begin

     if rdVenda.Checked then
     begin

        PesquisaPorVendas;

     end else if rdOrcamento.Checked then
     begin

         PesquisaPorOrcamentos;

     end;      

end;


procedure T_frmCupomVenda.pnl_rodapeClick(
  Sender: TObject);
begin

     close;
     Release;

end;

procedure T_frmCupomVenda.edtVendaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if key = 13 then
     begin

          PopulandoGridVendas;

     end;

end;

procedure T_frmCupomVenda.edtVendaClick(Sender: TObject);
begin

     btnLimparClick(self);

end;

procedure T_frmCupomVenda.btnLimparClick(Sender: TObject);
begin

    LimparPesquisa;

end;

procedure T_frmCupomVenda.FormShow(Sender: TObject);
begin

     rdVenda.Checked := true;

end;

procedure T_frmCupomVenda.PesquisaPorOrcamentos;
begin

       _Sql := 'SELECT v.id_venda, v.orcamento_id, c.cli_id, c.cli_nome FROM clientes c, venda v '+
               'WHERE v.cliente_id = c.cli_id AND v.orcamento_id > 0 AND v.orcamento_id = :pIDOrcamento';

           with DM_Pesq.cdsPesqVenda do
           begin

                Close;
                CommandText:= (_Sql);
                Params.ParamByName('pIDOrcamento').AsInteger := StrToInt(edtVenda.text);
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

                    gridVenda.Enabled    := true;

                end else
                begin

                    Application.MessageBox('Esse n�mero de or�amento n�o foi encontrado no Sistema!','Or�amento n�o encontrado', MB_OK);
                    LimparPesquisa;
                    exit;

                end;

           end;


end;


procedure T_frmCupomVenda.PesquisaPorVendas;
begin

     _Sql := 'SELECT v.id_venda, v.orcamento_id, c.cli_id, c.cli_nome FROM clientes c, venda v '+
             'WHERE v.cliente_id = c.cli_id AND v.id_venda = :pIDVenda';

           with DM_Pesq.cdsPesqVenda do
           begin

                Close;
                CommandText:= (_Sql);
                Params.ParamByName('pIDVenda').AsInteger := StrToInt(edtVenda.text);
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

                     gridVenda.Enabled    := true;

                end else
                begin

                    Application.MessageBox('Esse n�mero de venda n�o foi encontrado no Sistema!','Venda n�o encontrada', MB_OK);
                    LimparPesquisa;
                    exit;

                end;

           end;

end;

procedure T_frmCupomVenda.gridVendaCellClick(Column: TColumn);
begin

    idVenda      := DM_Pesq.cdsPesqVenda.FieldByName('id_venda').AsInteger;
    NumOrcamento := DM_Pesq.cdsPesqVenda.FieldByName('orcamento_id').AsInteger;

    ImprimirCupom;

end;

procedure T_frmCupomVenda.ImprimirCupom;
begin

     if rdOrcamento.Checked then
     begin

          with Q_RelCupomPagtoOrcamento.cds_RelCupomPagtoOrcamento do
          begin

            Close;
            Params.ParamByName('pIDOrcamento').value  :=  NumOrcamento;
            Open;
            Q_RelCupomPagtoOrcamento.cds_RelCupomPagtoOrcamento.Active := True;
            Q_RelCupomPagtoOrcamento.ReportTitle := 'Cupom de Pagamento';
            Q_RelCupomPagtoOrcamento.Preview;

          end;

     end;

     if rdVenda.Checked then
     begin

           with Q_RelCupomVenda.cds_RelCupomVenda do
            begin

                Close;
                Params.ParamByName('pIDVenda').value  :=  idVenda;
                Open;

                Q_RelCupomVenda.cds_RelCupomVenda.Active        := True;
                Q_RelCupomVenda.QryEmpresa.Active               := true;
                Q_RelCupomVenda.lblNomeUsuarioLogado.Caption    := _frmprincipal.lblStatusLogoff.Caption;
                Q_RelCupomVenda.Preview;
                Q_RelCupomVenda.ReportTitle := 'Cupom de Venda';

            end;

     end;

end;


procedure T_frmCupomVenda.rdVendaClick(Sender: TObject);
begin

    LimparPesquisa;
    rdVenda.Checked;
    edtVenda.SetFocus;

end;

procedure T_frmCupomVenda.rdOrcamentoClick(Sender: TObject);
begin

   LimparPesquisa;
   rdOrcamento.Checked;
   edtVenda.SetFocus;

end;

procedure T_frmCupomVenda.LimparPesquisa;
begin

    edtVenda.Clear;
    edtVenda.SetFocus;
    gridVenda.DataSource := nil;   
    gridVenda.Enabled    := false;

end;



end.
