unit U_ValorPagamentoDePendencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,DateUtils, ToolEdit, StrUtils,
  CurrEdit, Grids, DBGrids, Menus, EditNum;

type
  T_frmValorCreditoPago = class(TForm)
    pan_titulo: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    lbl45: TLabel;
    lblStatusLogoff: TLabel;
    pan_botoes: TPanel;
    btnGerarCreditos: TSpeedButton;
    grCabecalho: TGroupBox;
    GroupBox1: TGroupBox;
    edtValor: TEditNum;
    procedure FormCreate(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure PagarPendenciaParcial;
    procedure PagarPendenciaTotal;
    procedure edtQdeParcelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGerarCreditosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    //FUNÇÕES
    Function getValorPendencia(idCredito:integer):double;
    Function RetornarNovaParcela(descricaoParcela:string):string;
    Function RetornaParcelaParaCadastro(pOrcId:integer):string;
    Function RetornaUltimaParcelaPendenteDoOrcamento(pOrcId:integer):string;


  private
    { Private declarations }
    valorAtualParcela    : double;
    DataAtual            : TDateEdit;
    vencimentoDoCredito  : TDate;
    descricaoParcela, novaParcela, sParcela : String;
    idUltimaParcelaDoOrcamento : integer;

  public
    { Public declarations }


  end;

var
  _frmValorCreditoPago: T_frmValorCreditoPago;


implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo, SqlExpr,DBClient, U_principal, DB,
     U_CadCredores, U_EscolhaDoCredorParaPagamento, U_FecharPedido, U_Caixa,
  U_PagtoDoOrcamento;


{$R *.dfm}

procedure T_frmValorCreditoPago.FormCreate(Sender: TObject);
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
    DataAtual                    := TDateEdit.Create(self);
    DataAtual.Date               := date;
    lblStatusLogoff.Caption      := IdentificarUsuarioLogado;
    AbrirTabelas;      

end;

procedure T_frmValorCreditoPago.FormShow(Sender: TObject);
begin

  valorAtualParcela := getValorPendencia(idCreditoSelecionado);
  valorDoPagamento  := StrToFloat(edtValor.Text);
  edtValor.Text     := FloatToStr(valorAtualParcela);

end;

Function T_frmValorCreditoPago.getValorPendencia(idCredito:integer):double;
begin

   //Esta função retorna o valor da pendência juntamente com o número da parcela
   With DM_Pesq.Qry_Geral do
   begin

        Close;
        SQL.Clear;
        SQL.Add('SELECT valor,parcela FROM ativos_credito WHERE id_credito = '+IntToStr(idCredito)+'');
        Open;
        
   end;

   Result           := DM_Pesq.Qry_Geral.Fields[0].AsFloat;
   descricaoParcela := DM_Pesq.Qry_Geral.Fields[1].AsString;

end;

procedure T_frmValorCreditoPago.AbrirTabelas;
begin

    dm_DadosSegundo.cds_Ativos_Credito.Active   := true;

end;

procedure T_frmValorCreditoPago.FecharTabelas;
begin

    dm_DadosSegundo.cds_Ativos_Credito.Active   := false;

end;

procedure T_frmValorCreditoPago.FecharAbrirTabelas;
begin

    dm_DadosSegundo.cds_Ativos_Credito.Active := false;
    dm_DadosSegundo.cds_Ativos_Credito.Active := true;

end;

Function T_frmValorCreditoPago.RetornaUltimaParcelaPendenteDoOrcamento(pOrcId:integer):string;
begin
        //ShowMessage('ID ORÇAMENTO PASSADO = '+IntToStr(pOrcId));
       {========================================================Função retorna a string da ultima parcela pendente=================================================}
       {========================================================A Qry_Geral filtra o ultimo registro do ID passado=================================================}

       with DM_Pesq.Qry_Geral do
       begin

            close;
            sql.Clear;
            sql.Add('select max(id_credito) as id_credito from ativos_credito where status='+QuotedStr('PENDENTE')+' and ORC_ID = '+IntToStr(pOrcId)+' group by status');
            open();

            if not IsEmpty then
            begin
                idUltimaParcelaDoOrcamento := DM_Pesq.Qry_Geral.FieldByName('id_credito').AsInteger;
            end;
       end;

       //ShowMessage('ULTIMO ID DESTE ORÇAMENTO = '+IntToStr(idUltimaParcelaDoOrcamento));

       {==============A Qry_Auxiliar filtra a parcela do ID passado, não consegui pegar a parcela na Query anterior por isso fiz em duas etapas==========================}

       with DM_Pesq.Qry_Auxiliar do
       begin

            close;
            sql.Clear;
            sql.Add('select parcela from ativos_credito where id_credito = '+IntToStr(idUltimaParcelaDoOrcamento)+'');
            open();

            if not IsEmpty then
            begin
                Result := DM_Pesq.Qry_Auxiliar.Fields[0].AsString;
            end;
       end;

       //ShowMessage('PARCELA DO ULTIMO ORÇAMENTO É = '+Result);
         
end;

Function T_frmValorCreditoPago.RetornaParcelaParaCadastro(pOrcId:integer):string;
var sUltimaParcelaPendente : string;
begin

      {==============Com a ultima Parcela passada na Função acima eu incremento sempre em 1 o seu valor tipo 3/10 para 3/11 quem faz isso é a Função RetornarNovaParcela==============}
      {=============================================================Retornando em fim a nova Pacela que deverá ser cadastrada=========================================================}

      sUltimaParcelaPendente := RetornaUltimaParcelaPendenteDoOrcamento(pOrcId);

      Result := RetornarNovaParcela(sUltimaParcelaPendente);

      //ShowMessage('PARCELA PARA CADASTRO É : '+Result);

end;

function T_frmValorCreditoPago.RetornarNovaParcela(descricaoParcela:string):string;
var numParcela : string;
    inicio, iParcela : integer;
begin
       {ESTA FUNCAO RECEBE UMA STRING COM A PARCELA EX:1/1 E RETORNA OUTRA STRING COM O NUMERO DA PARCELA AUMENTADO EM 1 EX: 1/2

       pra usar o copy preciso da posição apos a barra começando do indice zero  1020/6  copy(string, apartir de , qtde) }
       inicio      := pos('/',descricaoParcela)+1;
       numParcela  := copy(descricaoParcela,inicio,Length(descricaoParcela));
       iParcela    := StrToInt(numParcela)+1;
       novaParcela := IntToStr(iParcela);
       Result      := novaParcela;

end;


procedure T_frmValorCreditoPago.PagarPendenciaTotal;
begin

     with DM_Pesq.Qry_Geral do
     begin

          close;
          sql.Clear;
          sql.Add('UPDATE ativos_credito SET dtrecebimento = :datarecebida, status = '+QuotedStr('FINALIZADO')+' WHERE id_credito = :pIDCredito');
          Params.ParamByName('datarecebida').AsDate       := date;
          Params.ParamByName('pIDCredito').AsInteger      := idCreditoSelecionado;
          ExecSQL();

     end;

end;


procedure T_frmValorCreditoPago.PagarPendenciaParcial;
begin
     
       {===========================================================Gerando a nova pendência========================================================================}

       valorDoPagamento := StrToFloat(edtValor.Text);

       if( valorDoPagamento < valorAtualParcela )then
       begin

           proxNum:= GerarProximoID('id_credito','ativos_credito');
           valorNovaParcela       := (valorAtualParcela-valorDoPagamento);
           vencimentoDoCredito    := IncDay(DataAtual.Date,30);
           sParcela               := IntToStr(idOrcamentoSelecionado)+'/'+RetornaParcelaParaCadastro(idOrcamentoSelecionado);

           _Sql := 'INSERT INTO ativos_credito (id_credito, orc_id, parcela, doc, aut, valor, qde_parcelas, dtvencimento, datacad, mesano, status) '+
                   'VALUES (:pIDCredito, :pOrc, :pSeqParcela, :pNumDoc, :pNumAut, :pValor, :pQdeParcelas, :pVencto, :pDataCad, :pMesano, :pStatus)';

           with DM_Pesq.Qry_Geral do
           begin

               close;
               sql.Clear;
               sql.Add(_Sql);
               Params.ParamByName('pIDCredito').AsInteger   := proxNum;
               Params.ParamByName('pOrc').AsInteger         := idOrcamentoSelecionado;
               Params.ParamByName('pSeqParcela').AsString   := sParcela;
               Params.ParamByName('pNumDoc').AsString       := 'PENDENCIA';
               Params.ParamByName('pNumAut').AsString       := 'PENDENCIA';
               Params.ParamByName('pValor').AsFloat         := valorNovaParcela;
               Params.ParamByName('pQdeParcelas').AsFloat   := 1;
               Params.ParamByName('pVencto').AsDateTime     := vencimentoDoCredito;
               Params.ParamByName('pDataCad').AsDateTime    := date;
               Params.ParamByName('pMesano').AsString       := gerarMesAno;
               Params.ParamByName('pStatus').AsString       := 'PENDENTE';
               ExecSQL();

           end;
           
           FecharAbrirTabelas;

       end;

       {================A Query abaixo finaliza a pendencia atual com o valor pago atualiza o status como FINALIZADO para depois gerar a nova pendência============}

       with DM_Pesq.Qry_Geral do
       begin

            close;
            sql.Clear;
            sql.Add('UPDATE ativos_credito SET dtrecebimento = :datarecebida, valor = :valor, status = '+QuotedStr('FINALIZADO')+' WHERE id_credito = :pIDCredito');
            Params.ParamByName('datarecebida').AsDate     := date;
            Params.ParamByName('valor').asfloat           := valorDoPagamento;
            Params.ParamByName('pIDCredito').AsInteger    := idCreditoSelecionado;
            ExecSQL();

       end;

end;

procedure T_frmValorCreditoPago.btnGerarCreditosClick(Sender: TObject);
begin

  //executar a operação de pagamento verificando: se tratar de pagamento total ou pagamento parcial onde será gerada nova parcela a ser paga posteriormente
  valorDoPagamento := StrToFloat(edtValor.Text);

  if(valorAtualParcela <= valorDoPagamento)then
  begin

      PagarPendenciaTotal;
      Application.MessageBox('O crédito foi recebido e baixado com sucesso!', 'OK!', MB_OK);

  end else begin

      PagarPendenciaParcial;
      Application.MessageBox('Parcela quitada a menor, gerada nova pendência!', 'Atenção!', MB_OK);

  end;

  LogOperacoes(NomeDoUsuarioLogado, 'baixa de pendência de crédito quitada!');
  close;

end;


procedure T_frmValorCreditoPago.edtQdeParcelasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

      if ( key = vk_return ) then
      begin

          btnGerarCreditosClick(Self);

      end;

end;


end.





