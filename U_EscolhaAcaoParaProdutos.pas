unit U_EscolhaAcaoParaProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaAcaoParaProdutos = class(TForm)
    pnl_cabecalho: TPanel;
    pnl1: TPanel;
    pnl_rodape: TPanel;
    btnProdutos: TSpeedButton;
    btnCategorias: TSpeedButton;
    btnFabricantes: TSpeedButton;
    btnFornecedores: TSpeedButton;
    btnImprimirCupomVendas: TSpeedButton;
    btnSair: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnCategoriasClick(Sender: TObject);
    procedure btnFornecedoresClick(Sender: TObject);
    procedure btnFabricantesClick(Sender: TObject);
    procedure btnImprimirCupomVendasClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    MesEscolhido, nomeDoMes : string;
  end;

var
  _frmEscolhaAcaoParaProdutos: T_frmEscolhaAcaoParaProdutos;

implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelAniversariantes, U_dmDadosSegundo,
  U_ConsTodosPedidos, U_ConsPedidosPorPeriodo, U_CadPedido, U_orcamento,
  U_ConsOrcamentosPorCliente, U_ConsOrcamentosPeriodo,
  U_ConsOrcamentosParaPagamento, U_dmPesquisas,
  U_OrcamentosParaImpressaoDeRecibos, U_principal, U_Produtos,
  U_CadastroPadraoUmCampo;

{$R *.dfm}

procedure T_frmEscolhaAcaoParaProdutos.FormCreate(Sender: TObject);
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

  lblDataDoDia.Caption      := DateToStr(date);
  lblHoraAtual.Caption      := timetoStr(time);

end;

procedure T_frmEscolhaAcaoParaProdutos.btnProdutosClick(Sender: TObject);
begin

     if(TabelaEstaVazia('categorias'))then
     begin

         Application.MessageBox('As tabelas categorias ou fabricantes estão vazias, cadastre  primeiro  as  categorias  dos  produtos e seus fabricantes!',
                  'Informação do Sistema!', MB_OK + MB_ICONWARNING);
     end else
          if(TabelaEstaVazia('fabricantes'))then
          begin
               Application.MessageBox('As tabelas categorias ou fabricantes estão vazias, cadastre  primeiro  as  categorias  dos  produtos e seus fabricantes!',
                  'Informação do Sistema!', MB_OK + MB_ICONWARNING);
          end
     else
     begin
            Application.CreateForm(T_frmProdutos,  _frmProdutos);
            _frmProdutos.ShowModal;
            FreeAndNil(_frmProdutos);
     end;


end;

procedure T_frmEscolhaAcaoParaProdutos.btnCategoriasClick(Sender: TObject);
begin

   //dados necessários para acessar cadastro em tabela com apenas um campo
   nomeTabela    := 'CATEGORIAS';
   campoNome     := 'CATEGORIA';
   campoID       := 'ID_CATEGORIA';
   cdsTable      := dm_DadosSegundo.cds_Categorias;
   dsTable       := dm_DadosSegundo.ds_Categorias;

   Application.CreateForm(T_frmCadastroPadraoUmCampo,  _frmCadastroPadraoUmCampo);
   _frmCadastroPadraoUmCampo.ShowModal;
   FreeAndNil(_frmCadastroPadraoUmCampo);

end;

procedure T_frmEscolhaAcaoParaProdutos.btnFornecedoresClick(Sender: TObject);
begin

   _frmPrincipal.btnFornecedoresClick(self);

end;

procedure T_frmEscolhaAcaoParaProdutos.btnFabricantesClick(Sender: TObject);
begin

    _frmPrincipal.btnFabricantesClick(self);

end;

procedure T_frmEscolhaAcaoParaProdutos.btnImprimirCupomVendasClick(Sender: TObject);
begin

    _frmPrincipal.btnImprimirCupomClick(self);

end;

procedure T_frmEscolhaAcaoParaProdutos.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure T_frmEscolhaAcaoParaProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     _frmPrincipal.logo.Visible := true;
end;

end.
