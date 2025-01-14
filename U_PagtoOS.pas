unit U_PagtoOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_PagamentoDeCotacao, StdCtrls, Buttons, EditNum, ExtCtrls, DateUtils;

type
  T_frmPagarOS = class(T_frmPagarCotacao)
    lbl45: TLabel;
    lblStatusLogoff: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnPagarCotacaoClick(Sender: TObject);
    procedure PagarOS;
    procedure ImprimeCupom;
    procedure AtualizaHistoricoAtivos;
    procedure MovimentacaoComTroco;
    procedure AtualizaCaixaAposMovimento;
    procedure gravatipo(EditNum,tipo:string);
    procedure ExcluirTiposPgtos;
  private
    { Private declarations }
    valorPago, valorTroco,
    ValorSaldoAnterior, ValorSaldoAtualAposMovto  : double;
    numDaOS, idDoCliente, IDOperador : integer;

  public
    { Public declarations }
  end;

var
  _frmPagarOS: T_frmPagarOS;

implementation

uses U_OrdemDeServico, U_dmPesquisas, U_QRelCupomOS, U_dmDados,
  U_dmDadosSegundo, U_BiblioSysSalao;

{$R *.dfm}

procedure T_frmPagarOS.FormShow(Sender: TObject);
begin
  //inherited;

     numDaOS                       := _frmOrdemServico.numOS;
     txtNomeClienteCotacao.Caption := _frmOrdemServico.nomeCliente;
     edt_ValorDebito.Text          := FloatToStr(_frmOrdemServico.valorDaOs);
     idDoCliente                   := _frmOrdemServico.IDCliente;
     IDOperador                    := IdFuncionarioLogado(_frmOrdemServico.lblStatusLogoff.Caption);
     pan_cabecalho.Caption         := 'Pagamento da Ordem de Servi�o N� ' + IntToStr(numDaOS);
     AbrirTabelas;
     ConfCaptionDosPagamentos;

end;

procedure T_frmPagarOS.btnPagarCotacaoClick(Sender: TObject);
begin
 // inherited;

    texto:= 'Confirma o pagamento da O.S. atual?';

    if Application.MessageBox(PChar(texto),'Pagamento de Ordem de Servi�o',MB_YESNO + MB_ICONQUESTION) = IdYes then
    begin

        PagarOS;

    end else begin

        exit;

    end;

end;

procedure T_frmPagarOS.PagarOS;
begin

      _Sql:= 'UPDATE os SET vl_desconto = :pValorDesconto, vl_recebido = :pValorRecebido, '+
              'vl_troco = :pValorTroco, vl_liquido = :pValorLiquido, vl_total = :pValorTotal, '+
              'status = '+QuotedStr('F')+', data_fechamento = :pDataFechamento where id_os = :pIDOS';

       With DM_Pesq.Qry_Geral do
       begin

          Close;
          SQL.Clear;
          SQL.Add(_Sql);
          ParamByName('pValortotal').AsFloat         := StrToFloat(edtTotalpagar.Text);
          ParamByName('pValorDesconto').AsFloat      := StrToFloat(edt_ValorDesconto.text);
          ParamByName('pValorRecebido').AsFloat      := StrToFloat(edtValorpago.Text);
          ParamByName('pValorTroco').AsFloat         := StrToFloat(edtvalorTroco.Text);
          ParamByName('pValorLiquido').AsFloat       := StrToFloat(edtValorpago.Text) - StrToFloat(edtvalorTroco.Text);
          ParamByName('pDataFechamento').AsDateTime  := date;
          ParamByName('pIDOS').AsInteger             := numDaOS;
          ExecSQL();

        end;

        AtualizaCaixaAposMovimento;
        AtualizaHistoricoAtivos;
        ImprimeCupom;
        FecharAbrirTabelas;
        LogOperacoes(NomeDoUsuarioLogado, 'pagamento de O.S.');

end;

procedure T_frmPagarOS.ImprimeCupom;
begin

      Application.MessageBox('Imprimindo cupom...', 'Imprimindo', MB_OK);

      with  Q_RelCupomOS.cds_RelCupomOS do
      begin

          Close;
          Params.ParamByName('pIDOS').value  :=  numDaOS;
          Open;

          Q_RelCupomOS.cds_RelCupomOS.Active           := True;
          Q_RelCupomOS.QryEmpresa.Active               := true;
          Q_RelCupomOS.lblNomeUsuarioLogado.Caption    := _frmOrdemServico.lblStatusLogoff.Caption;
          Q_RelCupomOS.Preview;
          Q_RelCupomOS.ReportTitle := 'Cupom de Ordem de Servi�o';
          LogOperacoes(NomeDoUsuarioLogado, 'impress�o de cupom de O.S.');

      end;


end;

procedure T_frmPagarOS.AtualizaHistoricoAtivos;
begin

    //PAGAMENTO DE COTA��O SAI COMO UMA VENDA POIS OS PRODUTOS SAO VENDIDOS

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


  // ATUALIZANDO O HISTORICO DE ATIVOS

  With DM_Pesq.qry_Cod do begin

    Close;
    SQL.Clear;
    SQL.Add('select max(id_historicoativos) from historico_ativos');
    Open;

    if not IsEmpty then begin

       proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

    end;

  end;
  with dm_Conexao.cds_HistoricoAtivos do begin

    append;
    FieldByname('id_historicoativos').AsInteger   := proxNum;
    FieldByname('cliente_id').AsInteger           := idDoCliente;
    FieldByname('vendedor_id').AsInteger          := IDOperador;
    FieldByname('id_OS').AsInteger                := NumDAOS;
    FieldByname('vl_liquido').AsFloat             := StrToFloat(edtValorpago.Text) - StrToFloat(edtvalorTroco.Text);
    FieldByName('historico').AsString             := 'PAGAMENTO DA O.S.  N : '+ Inttostr(NumDAOS);
    FieldByName('flag_pagto').AsString            := 'PV';  //entra como PV para constar como ativo na meta
    mes_ano                                       := nomeMes + '/' +  IntToStr(YearOf(DataDoDia));
    FieldByName('mesano').AsString                := mes_ano;
    FieldByname('data').AsDateTime                := date;

    ApplyUpdates(0);

  end;

end;

procedure T_frmPagarOS.AtualizaCaixaAposMovimento;
var
  proxNumIdCaixa  : integer;
begin

           proxNumIdCaixa := 0;

           //VERIFICAR O VALOR DO SALDO ANTERIOR (ULTIMO REGISTRO)

            _Sql := 'select id_caixa, saldo_atual from caixa WHERE '+
                    'id_caixa = (select max(id_caixa) from caixa)';

           With DM_Pesq.Qry_Auxiliar do
           begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              Open;

                  if not IsEmpty then begin

                       ValorSaldoAnterior := DM_Pesq.Qry_Auxiliar.Fields[1].Value;

                  end;

           end;

           valorPago                := StrToFloat(edtValorpago.Text);
           ValorSaldoAtualAposMovto := ( ValorSaldoAnterior + valorPago );

           // ATUALIZANDO O CAIXA
           With DM_Pesq.qry_Cod do begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_caixa) from caixa');
              Open;

              if not IsEmpty then begin

                 proxNumIdCaixa := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;


            with  dm_Conexao.cds_Caixa do begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNumIdCaixa;
                FieldByName('id_venda').AsInteger        := 0;
                FieldByName('saldo_anterior').AsFloat    := ValorSaldoAnterior;
                FieldByName('valor_movimento').AsFloat   := valorPago;
                FieldByName('saldo_atual').AsFloat       := ValorSaldoAtualAposMovto;
                FieldByName('data').AsDateTime           := date;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := 'PAGAMENTO DA O.S.  N : '+ Inttostr(NumDAOS);
                                                         
                ApplyUpdates(0);

            end;

            MovimentacaoComTroco;

end;


procedure T_frmPagarOS.MovimentacaoComTroco;
var
  proxNumIdCaixa : integer;
begin

     proxNumIdCaixa :=0;

     valorTroco     := StrToFloat(edtvalorTroco.Text);

     if valorTroco > 0 then
     begin

          //VERIFICAR O VALOR DO SALDO ANTERIOR (ULTIMO REGISTRO)

            _Sql := 'select id_caixa, saldo_atual from caixa WHERE '+
                    'id_caixa = (select max(id_caixa) from caixa)';


           With DM_Pesq.Qry_Auxiliar do
           begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              Open;

                  if not IsEmpty then begin

                       ValorSaldoAnterior := DM_Pesq.Qry_Auxiliar.Fields[1].Value;

                  end;

           end;    

           ValorSaldoAtualAposMovto := ( ValorSaldoAnterior - valorTroco );

           // ATUALIZANDO O CAIXA
           With DM_Pesq.qry_Cod do begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_caixa) from caixa');
              Open;

              if not IsEmpty then begin

                 proxNumIdCaixa := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;


            with  dm_Conexao.cds_Caixa do begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNumIdCaixa;
                FieldByName('id_venda').AsInteger        := 0;
                FieldByName('saldo_anterior').AsFloat    := ValorSaldoAnterior;
                FieldByName('valor_movimento').AsFloat   := -valorTroco;
                FieldByName('saldo_atual').AsFloat       := ValorSaldoAtualAposMovto;
                FieldByName('data').AsDateTime           := date;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := 'TROCO';

                ApplyUpdates(0);

            end;
     end;

      dm_Conexao.cds_Caixa.Active   := false;
      dm_Conexao.cds_Caixa.Active   := true;
      dm_DadosSegundo.cds_OS.Active := false;
      dm_DadosSegundo.cds_OS.Active := true;     
      close;

end;

procedure T_frmPagarOS.gravatipo(EditNum,tipo:string);
begin

     if StrToFloat(EditNum) <> 0 then
     begin

         with dm_DadosSegundo.cds_TiposPgtos do
         begin

              append;
              FieldByName('id_os').AsString      := IntToStr(numDaOS);
              FieldByName('data').AsDateTime     := date;
              FieldByName('tipo').AsString       := tipo;
              FieldByName('valor').AsString      := editnum;
              ApplyUpdates(0);

         end;


     end;

end;

procedure T_frmPagarOS.ExcluirTiposPgtos;
begin

     // se passou direto sem problemas com a soma dos valores j� gravou em tipos mas se o valor nao bateu,
     //exclui os tipos gravados para gravar novamente ate bater o valor do total

     with DM_Pesq.Qry_Geral do
     begin

         close;
         sql.Clear;
         sql.Add('DELETE FROM tipospgtos WHERE id_os = :pIDOS');
         Params.ParamByName('pIDOS').AsString          := IntToStr(numDaOS);
         ExecSQL();

     end;

end;

end.
