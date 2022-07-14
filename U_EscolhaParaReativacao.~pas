unit U_EscolhaParaReativacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaParaReativacoes = class(TForm)
    pnl_cabecalho: TPanel;
    pnl1: TPanel;
    pnl_rodape: TPanel;
    btnReativarClientes: TSpeedButton;
    btnReativarContatos: TSpeedButton;
    btnReativarProdutos: TSpeedButton;
    btnReativarFuncionarios: TSpeedButton;
    btnReativarFornecedores: TSpeedButton;
    btnReativarOrcamentos: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnReativarClientesClick(Sender: TObject);
    procedure btnReativarContatosClick(Sender: TObject);
    procedure btnReativarFuncionariosClick(Sender: TObject);
    procedure btnReativarProdutosClick(Sender: TObject);
    procedure btnReativarFornecedoresClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure btnReativarOrcamentosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MesEscolhido, nomeDoMes : string;
  end;

var
  _frmEscolhaParaReativacoes: T_frmEscolhaParaReativacoes;

implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelAniversariantes, U_dmDadosSegundo,
  U_ConsTodosPedidos, U_ConsPedidosPorPeriodo, U_CadPedido, U_orcamento,
  U_ConsOrcamentosPorCliente, U_ConsOrcamentosPeriodo,
  U_ConsOrcamentosParaPagamento, U_dmPesquisas,
  U_OrcamentosParaImpressaoDeRecibos, U_principal,
  U_ListaPadraoComUmCampoReativar, U_ConsOrcamentosCancelados;

{$R *.dfm}

procedure T_frmEscolhaParaReativacoes.FormCreate(Sender: TObject);
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

procedure T_frmEscolhaParaReativacoes.btnReativarClientesClick(Sender: TObject);
begin

     _Sql := 'SELECT * FROM clientes WHERE cli_status = :pStatus';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Params.ParamByName('pStatus').AsString   :=  'I';
          Open;

          if IsEmpty then begin

             Application.MessageBox('No momento não existem clientes inativados!!',
             'Atenção...', MB_OK + MB_ICONWARNING);

          end
          else begin

               //dados necessários para acessar lista padrão com apenas um campo para reativacao
               campoID       := 'CLI_ID';
               nomeTabela    := 'CLIENTES';
               campoNome     := 'CLI_NOME';
               campoStatus   := 'CLI_STATUS';

               Application.CreateForm(T_frmListaPadraoReativacao,  _frmListaPadraoReativacao);
               _frmListaPadraoReativacao.ShowModal;
               FreeAndNil(_frmListaPadraoReativacao);   
               close;
          end;

      end;

end;

procedure T_frmEscolhaParaReativacoes.btnReativarContatosClick(Sender: TObject);
begin

     _Sql := 'SELECT * FROM contatos WHERE cont_status = :pStatus';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Params.ParamByName('pStatus').AsString   :=  'I';
          Open;

          if IsEmpty then begin

             Application.MessageBox('No momento não existem contatos inativados!!',
             'Atenção...', MB_OK + MB_ICONWARNING);

          end
          else begin

               //dados necessários para acessar lista padrão com apenas um campo para reativacao
               campoID       := 'CONT_ID';
               nomeTabela    := 'CONTATOS';
               campoNome     := 'CONT_NOME';
               campoStatus   := 'CONT_STATUS';

               Application.CreateForm(T_frmListaPadraoReativacao,  _frmListaPadraoReativacao);
               _frmListaPadraoReativacao.ShowModal;
               FreeAndNil(_frmListaPadraoReativacao);
               close;
               dm_DadosSegundo.cds_Contatos.Active:=false;

          end;

      end;

end;

procedure T_frmEscolhaParaReativacoes.btnReativarFuncionariosClick(Sender: TObject);
begin

       _Sql := 'SELECT * FROM funcionarios WHERE func_status = :pStatus';

        with DM_Pesq.cdsPesqGeral do
        begin

            Close;
            CommandText:=(_Sql);
            Params.ParamByName('pStatus').AsString   :=  'I';
            Open;

            if IsEmpty then begin

               Application.MessageBox('No momento não existem funcionarios inativados!!',
               'Atenção...', MB_OK + MB_ICONWARNING);

            end
            else begin

                 //dados necessários para acessar lista padrão com apenas um campo para reativacao
                 campoID       := 'FUNC_ID';
                 nomeTabela    := 'FUNCIONARIOS';
                 campoNome     := 'FUNC_NOME';
                 campoStatus   := 'FUNC_STATUS';

                 reativandoFuncionario := true;
                 Application.CreateForm(T_frmListaPadraoReativacao,  _frmListaPadraoReativacao);
                 _frmListaPadraoReativacao.ShowModal;
                 FreeAndNil(_frmListaPadraoReativacao);
                 close;

            end;

        end;

end;

procedure T_frmEscolhaParaReativacoes.btnReativarProdutosClick(Sender: TObject);
begin

     _Sql := 'SELECT * FROM produtos WHERE status = :pStatus';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Params.ParamByName('pStatus').AsString   :=  'I';
          Open;

          if IsEmpty then begin

             Application.MessageBox('No momento não existem produtos inativados!!',
             'Atenção...', MB_OK + MB_ICONWARNING);

          end
          else begin

               //dados necessários para acessar lista padrão com apenas um campo para reativacao
               campoID       := 'ID_PRODUTO';
               nomeTabela    := 'PRODUTOS';
               campoNome     := 'DESCRICAO';
               campoStatus   := 'STATUS';

               reativandoProduto := true;
               Application.CreateForm(T_frmListaPadraoReativacao,  _frmListaPadraoReativacao);
               _frmListaPadraoReativacao.ShowModal;
               FreeAndNil(_frmListaPadraoReativacao);
               close;

          end;

      end;

end;

procedure T_frmEscolhaParaReativacoes.btnReativarFornecedoresClick(Sender: TObject);
begin

  _Sql := 'SELECT * FROM fornecedores WHERE forne_status = :pStatus';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Params.ParamByName('pStatus').AsString   :=  'I';
          Open;

          if IsEmpty then begin

             Application.MessageBox('No momento não existem fornecedores inativados!!',
             'Atenção...', MB_OK + MB_ICONWARNING);

          end
          else begin

               //dados necessários para acessar lista padrão com apenas um campo para reativacao
               campoID       := 'FORNE_ID';
               nomeTabela    := 'FORNECEDORES';
               campoNome     := 'FORNE_NOME';
               campoStatus   := 'FORNE_STATUS';

               reativandoFuncionario := true;
               Application.CreateForm(T_frmListaPadraoReativacao,  _frmListaPadraoReativacao);
               _frmListaPadraoReativacao.ShowModal;
               FreeAndNil(_frmListaPadraoReativacao);
               close;

          end;

      end;

end;

procedure T_frmEscolhaParaReativacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     _frmPrincipal.logo.Visible := true;
end;

procedure T_frmEscolhaParaReativacoes.pnl_rodapeClick(Sender: TObject);
begin
  _frmPrincipal.logo.Visible := true;
  DM_Pesq.cdsPesqGeral.Active := false;    
  close;
end;

procedure T_frmEscolhaParaReativacoes.btnReativarOrcamentosClick(
  Sender: TObject);
begin

      _Sql := 'SELECT * FROM orcamento WHERE status = :pStatus';

      with DM_Pesq.cdsPesqGeral do
      begin

          Close;
          CommandText:=(_Sql);
          Params.ParamByName('pStatus').AsString   :=  'DESAPROVADO';
          Open;

          if not IsEmpty then
          begin

             Application.CreateForm(T_frmConsOrcamentosCancelados,  _frmConsOrcamentosCancelados);
             _frmConsOrcamentosCancelados.ShowModal;
             FreeAndNil(_frmConsOrcamentosCancelados);
             close;

          end else
          begin

             Application.MessageBox('No momento não existem orçamentos com status DESAPROVADO!',
             'Atenção...', MB_OK + MB_ICONWARNING);

          end;

      end;

end;

end.
