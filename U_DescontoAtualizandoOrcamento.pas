unit U_DescontoAtualizandoOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  EditNum;

type
  T_frmDescontoAtualizandoOrcamento = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl_DadosUsuario: TPanel;
    grp_CadastrarSenha: TGroupBox;
    GroupBox1: TGroupBox;
    edt_valorUnitarioAtual: TEditNum;
    GroupBox2: TGroupBox;
    edt_valorDesconto: TEditNum;
    edt_percentualDesconto: TEditNum;
    rd_valordireto: TRadioButton;
    rd_porpercentual: TRadioButton;
    edtIdPercentual: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_valorDescontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure CalcularValorComDesconto;
    procedure CalcularValorDescontoPorPercentual;
    procedure FormShow(Sender: TObject);
    procedure edt_percentualDescontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZerarVariaveis;
    procedure edt_valorDescontoEnter(Sender: TObject);
    procedure rd_valordiretoClick(Sender: TObject);
    procedure rd_porpercentualClick(Sender: TObject);

  private
    { Private declarations }


  public
    { Public declarations }

      valorOriginal, percentual, valorDesconto, ValorComDesconto, novoTotalDoItem,quantidade,
      valorDesconto_perc, ValorComDesconto_perc, percentual_perc, novoTotalDoItem_perc : double;
      idDoItem, idDoOrcamento  : integer;

  end;

var
  _frmDescontoAtualizandoOrcamento: T_frmDescontoAtualizandoOrcamento;

implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo,
  U_Cotacao, U_EscolhaDoProdutoParaCotacao, DateUtils, U_orcamento,
  U_AtualizarFecharOrcamento;

{$R *.dfm}


procedure T_frmDescontoAtualizandoOrcamento.FormCreate(Sender: TObject);
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


procedure T_frmDescontoAtualizandoOrcamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    ZerarVariaveis;
    _frmAtualizarFecharOrcamento.AbrirFecharTabelas;
    Close;
    Release;

end;


procedure T_frmDescontoAtualizandoOrcamento.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure T_frmDescontoAtualizandoOrcamento.FormShow(Sender: TObject);
begin

     idDoOrcamento                 := _frmAtualizarFecharOrcamento.NumOrcamento;
     valorOriginal                 :=  StrToFloat(_frmAtualizarFecharOrcamento.txtValorItem.Text);
     quantidade                    :=  StrToFloat(_frmAtualizarFecharOrcamento.edtquantidadeDoItem.text);

     edt_valorUnitarioAtual.Text   :=  _frmAtualizarFecharOrcamento.txtValorItem.Text;

end;


procedure T_frmDescontoAtualizandoOrcamento.pnl_rodapeClick(Sender: TObject);
begin

    close;

end;


procedure T_frmDescontoAtualizandoOrcamento.CalcularValorComDesconto;
begin

        valorDesconto    :=  StrToFloat(edt_valorDesconto.Text);
        ValorComDesconto :=  (valorOriginal - valorDesconto);

        if ( valorDesconto >= valorOriginal )then begin

            Application.MessageBox('O valor de desconto não pode ser maior ou igual ao valor do produto!', 'Informação de Sistema!', MB_OK);
            edt_valorDesconto.Text := '0,00';
            edt_valorDesconto.SetFocus;
            ZerarVariaveis;
            
        end else begin

            novoTotalDoItem  :=  (ValorComDesconto * quantidade);
            close;

        end;

end;


procedure T_frmDescontoAtualizandoOrcamento.edt_valorDescontoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

         if key = 13 then
         begin

              CalcularValorComDesconto;

              _Sql:= 'UPDATE t_orcamento SET valor_item = :pNovoUnitario, total = :pNovoTotalItem WHERE '+
                     'id_detalhesorc = :pIDItem';

               With DM_Pesq.Qry_Geral do begin

                  Close;
                  SQL.Clear;
                  SQL.Add(_Sql);
                  ParamByName('pNovoUnitario').Value  := ValorComDesconto;
                  ParamByName('pIDItem').Value        := StrToInt(_frmAtualizarFecharOrcamento.txtIdDoITEM.text);
                  ParamByName('pNovoTotalItem').Value := novoTotalDoItem;
                  ExecSQL();

                end;


                _Sql:= 'UPDATE i_orcamento SET valor_item = :pNovoUnitario, total = :pNovoTotalItem WHERE '+
                       'id_detalhesorc = :pIDItem';

               With DM_Pesq.Qry_Geral do begin

                  Close;
                  SQL.Clear;
                  SQL.Add(_Sql);
                  ParamByName('pNovoUnitario').Value  := ValorComDesconto;
                  ParamByName('pIDItem').Value        := StrToInt(_frmAtualizarFecharOrcamento.txtIdDoITEM.text);
                  ParamByName('pNovoTotalItem').Value := novoTotalDoItem;
                  ExecSQL();

                end;      

         end;

end;


procedure T_frmDescontoAtualizandoOrcamento.CalcularValorDescontoPorPercentual;
begin

         percentual_perc  :=  StrToFloat(edt_percentualDesconto.Text);


         if ( percentual_perc >= 99 )then begin

            Application.MessageBox('Desculpe, o valor aceitável para desconto é de 98% no máximo!', 'Informação de Sistema!', MB_OK);
            edt_percentualDesconto.Text := '0,00';
            edt_percentualDesconto.SetFocus;
            ZerarVariaveis;

        end else begin

           valorDesconto_perc    :=  ((valorOriginal * percentual_perc) / 100 );
           ValorComDesconto_perc :=  (valorOriginal - valorDesconto_perc);
           novoTotalDoItem_perc  :=  (ValorComDesconto_perc * quantidade);

           close;

        end;

end;  


procedure T_frmDescontoAtualizandoOrcamento.edt_percentualDescontoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin


   if key = 13 then
   begin

        CalcularValorDescontoPorPercentual;

        _Sql:= 'UPDATE t_orcamento SET valor_item = :pNovoUnitario, total = :pNovoTotalItem WHERE '+
               'id_detalhesorc = :pIDItem';

         With DM_Pesq.Qry_Geral do begin

            Close;
            SQL.Clear;
            SQL.Add(_Sql);
            ParamByName('pNovoUnitario').Value  := ValorComDesconto_perc;
            ParamByName('pIDItem').Value        := StrToInt(_frmAtualizarFecharOrcamento.txtIdDoITEM.text);
            ParamByName('pNovoTotalItem').Value := novoTotalDoItem_perc;
            ExecSQL();

          end;



          _Sql:= 'UPDATE i_orcamento SET valor_item = :pNovoUnitario, total = :pNovoTotalItem WHERE '+
                 'id_detalhesorc = :pIDItem';

         With DM_Pesq.Qry_Geral do begin

            Close;
            SQL.Clear;
            SQL.Add(_Sql);
            ParamByName('pNovoUnitario').Value  := ValorComDesconto_perc;
            ParamByName('pIDItem').Value        := StrToInt(_frmAtualizarFecharOrcamento.txtIdDoITEM.text);
            ParamByName('pNovoTotalItem').Value := novoTotalDoItem_perc;
            ExecSQL();

          end;

   end;


end;



procedure T_frmDescontoAtualizandoOrcamento.ZerarVariaveis;
begin

    percentual             := 0;
    valorDesconto          := 0;
    ValorComDesconto       := 0;
    novoTotalDoItem        := 0;
    valorDesconto_perc     := 0;
    ValorComDesconto_perc  := 0;
    percentual_perc        := 0;
    novoTotalDoItem_perc   := 0;

end;

procedure T_frmDescontoAtualizandoOrcamento.edt_valorDescontoEnter(Sender: TObject);
begin

    ZerarVariaveis;
    
end;

procedure T_frmDescontoAtualizandoOrcamento.rd_valordiretoClick(Sender: TObject);
begin

      if rd_valordireto.Checked then
      begin

          edt_percentualDesconto.Visible  := false;

          edt_valorDesconto.Visible       := true;
          edt_valorDesconto.Left          := 201;
          edt_valorDesconto.Top           := 60;
          edt_valorDesconto.Width         := 177;
          edt_valorDesconto.SetFocus;

      end;

end;

procedure T_frmDescontoAtualizandoOrcamento.rd_porpercentualClick(Sender: TObject);
begin

      if rd_porpercentual.Checked then
      begin

          edt_valorDesconto.Visible      := false;

          edt_percentualDesconto.Visible := true;
          edt_percentualDesconto.Left    := 201;
          edt_percentualDesconto.Top     := 60;
          edt_percentualDesconto.Width   := 177;
          edt_percentualDesconto.SetFocus;

      end;

end;

end.
