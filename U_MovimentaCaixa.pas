unit U_MovimentaCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit, DateUtils;

type
  T_frmMovimentaCaixa = class(TForm)
    pnl_cabecalho: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    pnl1: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edtHistoricoCaixa: TMemo;
    pnl_rodape: TPanel;
    Panel1: TPanel;
    rdEntadaCaixa: TRadioButton;
    rdSaidaCaixa: TRadioButton;
    edtValorMovimentoCaixa: TEdit;
    btn_Gravar: TSpeedButton;

    //procedimentos perso
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure AbrirFecharTabelas;
    procedure GravarMovimentacao;
    procedure Sair;


    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorMovimentoCaixaKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorMovimentoCaixaClick(Sender: TObject);
    procedure btn_GravarClick(Sender: TObject);
    procedure AtualizaCaixaAposMovimentoExterno;
    procedure AtualizarTabelaMovimentacaoCaixa;
    procedure MovimentacaoComDespesa;
    procedure rdEntadaCaixaClick(Sender: TObject);
    procedure edtHistoricoCaixaKeyPress(Sender: TObject; var Key: Char);
    procedure rdSaidaCaixaClick(Sender: TObject);
    procedure edtValorMovimentoCaixaExit(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure edtHistoricoCaixaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtHistoricoCaixaEnter(Sender: TObject);
    procedure edtValorMovimentoCaixaEnter(Sender: TObject);
    procedure pnl_rodapeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);



  private
    { Private declarations }
    tipoMovimento : string;
    ValorSaldoAnterior, ValorSaldoAtualAposMovto, ValorMovimento : double;

  public
    { Public declarations }


  end;

var
  _frmMovimentaCaixa : T_frmMovimentaCaixa;
  proxNumCaixa : Integer;

implementation

uses U_BiblioSysSalao, U_dmDadosSegundo, U_principal, U_dmDados,
  U_dmPesquisas;

{$R *.dfm}


procedure T_frmMovimentaCaixa.FormCreate(Sender: TObject);
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

   lblDataDoDia.Caption:=  DateToStr(date);
   lblHoraAtual.Caption:=  timetoStr(time);
   AbrirTabelas;

end;

procedure T_frmMovimentaCaixa.btn_GravarClick(Sender: TObject);
var tamanho : integer;
begin

   tamanho:= Length(edtHistoricoCaixa.Text);
   if(verificaCaption('Sair',btn_Gravar))then
   begin
       Sair;
   end else
   begin
       if (tamanho = 0)then
          Application.MessageBox('Favor justificar a movimentação para continuar!', 'Digite o motivo da movimentação!', MB_ICONEXCLAMATION)
       else
          GravarMovimentacao;
   end;

end;

procedure T_frmMovimentaCaixa.GravarMovimentacao;
begin

     if(rdEntadaCaixa.Checked)then
     begin
      tipoMovimento := 'C';
     end else begin
      tipoMovimento := 'D';
     end;

    //ATUALIZANDO TABELAS
    AtualizaCaixaAposMovimentoExterno;
    //MovimentacaoComDespesa;
    AtualizarTabelaMovimentacaoCaixa;

    AbrirFecharTabelas;
    btn_Gravar.Enabled   := False;
    ShowMessage('Movimentação cadastrada com sucesso!');
    LogOperacoes(NomeDoUsuarioLogado, 'movimentação de caixa');
    close;

end;


procedure T_frmMovimentaCaixa.AtualizaCaixaAposMovimentoExterno;
var
   proxNumIdCaixa : integer;
begin

          //VERIFICAR O VALOR DO SALDO ANTERIOR (ULTIMO REGISTRO)

            _Sql := 'select id_caixa, saldo_atual from caixa WHERE '+
                    'id_caixa = (select max(id_caixa) from caixa)';


           With DM_Pesq.qry_Cod do
           begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              Open;

                  if not IsEmpty then begin

                       ValorSaldoAnterior := DM_Pesq.qry_Cod.Fields[1].Value;

                  end;

           end;

            if ( rdEntadaCaixa.Checked ) then
            begin

               ValorMovimento           := StrToFloat(edtValorMovimentoCaixa.text);
               ValorSaldoAtualAposMovto := ( ValorSaldoAnterior + ValorMovimento );

            end else if ( rdSaidaCaixa.Checked ) then
            begin

               ValorMovimento           := -StrToFloat(edtValorMovimentoCaixa.text);
               ValorSaldoAtualAposMovto := ( ValorSaldoAnterior + ValorMovimento );

            end;

           proxNumIdCaixa := GerarProximoID('id_caixa','caixa');

           with  dm_Conexao.cds_Caixa do
           begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNumIdCaixa;
                FieldByName('id_venda').AsInteger        := 0;
                FieldByName('saldo_anterior').AsFloat    := ValorSaldoAnterior;
                FieldByName('valor_movimento').AsFloat   := ValorMovimento;
                FieldByName('saldo_atual').AsFloat       := ValorSaldoAtualAposMovto;
                FieldByName('data').AsDateTime           := date;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := UpperCase(edtHistoricoCaixa.Text);

                ApplyUpdates(0);

            end;


end;

procedure T_frmMovimentaCaixa.MovimentacaoComDespesa;
var
  proxNumIdVenda : integer;
begin

            DataDoDia       := date;
            numMes          := MonthOf(DataDoDia); //retorna o numero do mes corrente

            case (numMes) of

                1 : nomeMes := 'JAN';
                2 : nomeMes := 'FEV';
                3 : nomeMes := 'MAR';
                4 : nomeMes := 'ABR';
                5 : nomeMes := 'MAI';
                6 : nomeMes := 'JUN';
                7 : nomeMes := 'JUL';
                8 : nomeMes := 'AGO';
                9 : nomeMes := 'SET';
               10 : nomeMes := 'OUT';
               11 : nomeMes := 'NOV';
               12 : nomeMes := 'DEZ';

            end;


           proxNumIdVenda := GerarProximoID('id_venda','venda');

           with  dm_DadosSegundo.cds_Venda do
           begin

                Append;

                FieldByName('id_venda').AsInteger          := proxNumIdVenda;
                FieldByName('id_vendedor').AsInteger       := IdDoUsuarioLogado;

                if( tipoMovimento = 'D')then
                begin
                    FieldByName('vl_despesa').AsFloat      := ValorMovimento;
                end else if( tipoMovimento = 'C')then
                begin
                    FieldByName('vl_recebido').AsFloat     := ValorMovimento;
                    FieldByName('vl_totalpagar').AsFloat   := ValorMovimento;
                end;

                FieldByName('data_venda').AsDateTime       := date;
                FieldByName('hora_venda').AsString         := timeToStr(time);
                FieldByName('status').AsString             := 'F';
                mes_ano                                    := nomeMes + '/' +  IntToStr(YearOf(DataDoDia));
                FieldByName('mesano').AsString             := mes_ano;
                FieldByName('nummes').AsInteger            := numMes;
                FieldByName('tipo').AsString               := tipoMovimento;

                DataDoDia       := date;
                numMes          := MonthOf(DataDoDia); //retorna o numero do mes corrente

                ApplyUpdates(0);

            end;  

end;

procedure T_frmMovimentaCaixa.AtualizarTabelaMovimentacaoCaixa;
begin
           ValorMovimento := StrToFloat(edtValorMovimentoCaixa.Text);

           // ATUALIZANDO TABELA DE MOVIMENTACAO DO CAIXA COM ENTRADAS E SAIDAS
           GerarProximoID('id_movimento','MOVIMENTACAOCAIXA');

            with dm_DadosSegundo.cds_MovCaixa do
            begin

                Append;
                FieldByName('id_movimento').AsInteger    := proxNum;
                FieldByName('valor').AsFloat             := ValorMovimento;
                FieldByName('historico').AsString        := UpperCase(edtHistoricoCaixa.Text);
                FieldByName('tipo').AsString             := tipoMovimento;
                FieldByName('data').AsDateTime           := date;
                ApplyUpdates(0);

            end;

end;

procedure T_frmMovimentaCaixa.AbrirTabelas;
begin

    dm_Conexao.cds_Caixa.Active          := True;
    dm_DadosSegundo.cds_Venda.Active     := True;
    dm_DadosSegundo.cds_MovCaixa.Active  := True;

end;


procedure T_frmMovimentaCaixa.FecharTabelas;
begin

    dm_Conexao.cds_Caixa.Active          := False;
    dm_DadosSegundo.cds_Venda.Active     := False;
    dm_DadosSegundo.cds_MovCaixa.Active  := false;

end;


procedure T_frmMovimentaCaixa.AbrirFecharTabelas;
begin

    dm_Conexao.cds_Caixa.Active   := False;
    dm_Conexao.cds_Caixa.Active   := True;

    dm_DadosSegundo.cds_Venda.Active := False;
    dm_DadosSegundo.cds_Venda.Active := True;

    dm_DadosSegundo.cds_MovCaixa.Active  := false;
    dm_DadosSegundo.cds_MovCaixa.Active  := True;

end;


procedure T_frmMovimentaCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    _frmPrincipal.logo.Visible := true;
    Release;

end;

procedure T_frmMovimentaCaixa.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmMovimentaCaixa.edtValorMovimentoCaixaKeyPress(Sender: TObject;
  var Key: Char);
begin

    // PARA DBEDIT ACEITAR APENAS NUMEROS
    If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;   

end;

procedure T_frmMovimentaCaixa.edtValorMovimentoCaixaClick(Sender: TObject);
begin

     edtValorMovimentoCaixa.SelStart := 0;
     edtValorMovimentoCaixa.SelLength:= Length(edtValorMovimentoCaixa.Text);

end;


procedure T_frmMovimentaCaixa.rdEntadaCaixaClick(Sender: TObject);
begin

    edtValorMovimentoCaixa.Enabled:=true;
    edtValorMovimentoCaixa.SetFocus;
    pnl_rodape.Enabled:=true;

end;

procedure T_frmMovimentaCaixa.edtHistoricoCaixaKeyPress(Sender: TObject;
  var Key: Char);
begin

     btn_Gravar.Enabled := true;

end;


procedure T_frmMovimentaCaixa.rdSaidaCaixaClick(Sender: TObject);
begin

    edtValorMovimentoCaixa.Enabled:=true;
    edtValorMovimentoCaixa.SetFocus;
    pnl_rodape.Enabled:=true;

end;

procedure T_frmMovimentaCaixa.edtValorMovimentoCaixaExit(Sender: TObject);
begin

  btn_Gravar.Caption:='Gravar';
  btn_Gravar.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_gravar.bmp');
  edtHistoricoCaixa.Enabled:=true;
  edtHistoricoCaixa.SetFocus;

end;

procedure T_frmMovimentaCaixa.Sair;
begin

    _frmPrincipal.logo.Visible := true;
    Close;

end;

procedure T_frmMovimentaCaixa.pnl_rodapeClick(Sender: TObject);
begin
    _frmPrincipal.logo.Visible := true;
    Close;
end;

procedure T_frmMovimentaCaixa.edtHistoricoCaixaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if(key=13)then
         btn_GravarClick(self);
end;

procedure T_frmMovimentaCaixa.edtHistoricoCaixaEnter(Sender: TObject);
begin

   pnl_rodape.Caption := '< Cancelar >';
   pnl_rodape.Cursor  := crHandPoint;
   pnl_rodape.Caption :='Justifique a operação ou clique aqui para <Cancelar>';

end;

procedure T_frmMovimentaCaixa.edtValorMovimentoCaixaEnter(Sender: TObject);
begin
   edtValorMovimentoCaixa.SelectAll;
   pnl_rodape.Caption:='Digite o valor da operação <Enter>';
end;

procedure T_frmMovimentaCaixa.pnl_rodapeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
        pnl_rodape.Caption := '< Sair >';
end;

end.
