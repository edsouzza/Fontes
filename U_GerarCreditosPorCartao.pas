unit U_GerarCreditosPorCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,DateUtils, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus, EditNum;

type
  T_frmGerarCreditosPorCartao = class(TForm)
    pan_titulo: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    lbl45: TLabel;
    lblStatusLogoff: TLabel;
    pan_botoes: TPanel;
    btnGerarCreditos: TSpeedButton;
    grCabecalho: TGroupBox;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    lblTipoOperacao: TLabel;
    edtVenda: TStaticText;
    Label1: TLabel;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edtQdeParcelas: TEdit;
    Label2: TLabel;
    edtDOC: TEdit;
    Label4: TLabel;
    edtALT: TEdit;
    edtValor: TEditNum;
    procedure FormCreate(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure LimparCampos;
    procedure FecharAbrirTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure GerarCabecalho;
    procedure GerarNumerosDosCredidos;
    procedure CalcularQdeParcelas;
    procedure GerarCreditos;
    procedure GravarCreditosAPrazo;
    procedure btnGerarCreditosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtQdeParcelasChange(Sender: TObject);
    procedure edtQdeParcelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VerificarSeTemCreditosComEstaVenda;

  private
    { Private declarations }

  public
    { Public declarations }
    valorParcela, valorTotalDaVenda : double;
    qdeParcelas, idDaVenda : integer;
    vencimentoDoCredito    : TDate;
    NumVendaGerarCreditos  : string;
    pagtoAvista : Boolean;

  end;

var
  _frmGerarCreditosPorCartao: T_frmGerarCreditosPorCartao;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo, SqlExpr,DBClient, U_principal, DB,
     U_CadCredores, U_EscolhaDoCredorParaPagamento, U_FecharPedido, U_Caixa, U_PagtoDoOrcamento;


{$R *.dfm}

procedure T_frmGerarCreditosPorCartao.FormCreate(Sender: TObject);
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

    //Recebe a data atual por padr�o

    lblDataDoDia.Caption         := DateToStr(now);
    lblHoraAtual.Caption         := timetoStr(time);
    lblStatusLogoff.Caption      := IdentificarUsuarioLogado;

    AbrirTabelas;

end;

procedure T_frmGerarCreditosPorCartao.FormShow(Sender: TObject);
begin
     GerarCabecalho;

     if ( pagandoVenda ) then
     begin
          idDaVenda := _frmCaixa.idVenda;
          lblTipoOperacao.Caption := 'VENDA';

     end else  if ( pagandoOrcamento ) then
     begin
          idDaVenda := 0;
          lblTipoOperacao.Caption := 'OR�AMENTO';

     end;

     dtDataDoDia        := TDateEdit.Create(self);
     dtDataDoDia.Date   := date;
     MostrarMesEAno(dtDataDoDia.Text);
     
end;

procedure T_frmGerarCreditosPorCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if ( pagandoVenda ) then
     begin
           //_frmCaixa.EditNum4.Text := FloatToStr(valorTotalDaVenda);

     end else  if ( pagandoOrcamento ) then
     begin
         //_frmPagarOrcamento.valorCREDITO.Text := FloatToStr(valorTotalDaVenda);

     end;

    pagandoVenda            := false;
    pagandoOrcamento        := false;
    vendaCredito            := true;

    if ( pagandoVenda ) then
     begin
           _frmCaixa.TotalDosPagamentos;

     end else  if ( pagandoOrcamento ) then
     begin
         _frmPagarOrcamento.valorCREDITO.SetFocus;

     end;

    FreeAndNil(dtDataDoDia);

end;

procedure T_frmGerarCreditosPorCartao.btnSairClick(Sender: TObject);
begin
     if ( pagandoVenda ) then
     begin
           //_frmCaixa.EditNum4.Text := '0,00';
           //_frmCaixa.EditNum4.SetFocus;

     end else  if ( pagandoOrcamento ) then
     begin
         _frmPagarOrcamento.valorCREDITO.Text := '0,00';

     end;

    VerificarSeTemCreditosComEstaVenda;
    close; 

end;

procedure T_frmGerarCreditosPorCartao.GerarCabecalho;
begin

     if ( pagandoVenda ) then
     begin
           edtVenda.Caption   := NumVendaParaCreditos;
           edtValor.text      := ValorVendaParaCreditos;

     end else if ( pagandoOrcamento ) then
     begin
           edtVenda.Caption   := NumOrcParaCreditos;
           edtValor.text      := ValorOrcParaCreditos;

     end;
     
     edtDOC.SetFocus;

end;

procedure T_frmGerarCreditosPorCartao.AbrirTabelas;
begin

    dm_DadosSegundo.cds_Ativos_Credito.Active   := true;

end;

procedure T_frmGerarCreditosPorCartao.FecharTabelas;
begin

    dm_DadosSegundo.cds_Ativos_Credito.Active   := false;

end;

procedure T_frmGerarCreditosPorCartao.FecharAbrirTabelas;
begin

    dm_DadosSegundo.cds_Ativos_Credito.Active := false;
    dm_DadosSegundo.cds_Ativos_Credito.Active := true;

end;


procedure T_frmGerarCreditosPorCartao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin

      // Enter por Tab
      //verifica se a tecla pressionada � a tecla ENTER, conhecida pelo Delphi como #13
      If key = #13 then
      Begin
      //se for, passa o foco para o pr�ximo campo, zerando o valor da vari�vel Key
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
      end;

end;


procedure T_frmGerarCreditosPorCartao.LimparCampos;
begin

    edtValor.text              := '';
    btnGerarCreditos.Enabled   := false;

end;

procedure T_frmGerarCreditosPorCartao.VerificarSeTemCreditosComEstaVenda;
begin
     //verifica e exclui toda e qualquer venda na tabela ativos_credito que contenha o numero da venda que esta sendo passado
     With DM_Pesq.Qry_Geral do
     begin

          Close;
          SQL.Clear;
          SQL.Add('select venda_id from ativos_credito WHERE venda_id = :pIDVenda');
          ParamByName('pIDVenda').AsInteger := idDaVenda;
          Open;

          if not IsEmpty then
          begin
                 With DM_Pesq.Qry_Auxiliar do
                 begin

                      Close;
                      SQL.Clear;
                      SQL.Add('delete FROM ativos_credito WHERE venda_id = :pIDVenda');
                      ParamByName('pIDVenda').AsInteger := idDaVenda;
                      ExecSQL;

                 end;
          end;

       end;

end;

procedure T_frmGerarCreditosPorCartao.btnGerarCreditosClick(Sender: TObject);
begin
   GerarCreditos;
end;

procedure T_frmGerarCreditosPorCartao.GerarCreditos;
begin

   CalcularQdeParcelas;
   GerarNumerosDosCredidos;

end;

procedure T_frmGerarCreditosPorCartao.CalcularQdeParcelas;
begin
        //se escolheu um tipo de prazo que n�o a vista ent�o...
        qdeParcelas              := StrToInt(edtQdeParcelas.Text);
        valorTotalDaVenda        := StrToFloat(edtValor.text);
        valorParcela             := ( valorTotalDaVenda / qdeParcelas );  

end;

procedure T_frmGerarCreditosPorCartao.GerarNumerosDosCredidos;
var  i, qdeDias : integer;
begin
         VerificarSeTemCreditosComEstaVenda;

         for i := 1 to qdeParcelas do   //o valor inicial deve ser a partir do zero pois os indices do explode come�am do zero
         begin
             qdeDias  := ( i * 30);
             vencimentoDoCredito    := IncDay(dtDataDoDia.Date,qdeDias);
             NumVendaGerarCreditos  := edtVenda.Caption +'/'+ IntToStr(i);
             GravarCreditosAPrazo;
         end;

         if ( pagandoVenda ) then
         begin
               texto := 'Os cr�ditos referente � venda n� '+ edtVenda.Caption +' e suas parcelas foram geradas com sucesso!';
               Application.MessageBox(PChar(texto),'Sucesso!', MB_OK);

         end else  if ( pagandoOrcamento ) then
         begin
             texto := 'Os cr�ditos referente ao Or�amento n� '+ edtVenda.Caption +' e suas parcelas foram geradas com sucesso!';
             Application.MessageBox(PChar(texto),'Sucesso!', MB_OK);

         end;

         close;

end;


procedure T_frmGerarCreditosPorCartao.GravarCreditosAPrazo;
begin
       //grava creditos a prazo de or�amentos e vendas
       proxNum:= GerarProximoID('id_credito','ativos_credito');

       _Sql := 'INSERT INTO ativos_credito (id_credito, orc_id, venda_id, parcela, doc, aut, valor, qde_parcelas, dtvencimento, datacad, mesano, status) '+
               'VALUES (:pIDCredito, :pOrc, :pVenda, :pSeqParcela, :pNumDoc, :pNumAut, :pValor, :pQdeParcelas, :pVencto, :pDataCad, :pMesano, :pStatus)';

       with DM_Pesq.Qry_Geral do
       begin

           close;
           sql.Clear;
           sql.Add(_Sql);
           Params.ParamByName('pIDCredito').AsInteger   := proxNum;

           if(pagandoOrcamento)then
           begin
              Params.ParamByName('pOrc').AsInteger        := NumOrcamentoSelecionado;
              Params.ParamByName('pVenda').AsInteger      := 0;
           end else begin
              Params.ParamByName('pOrc').AsInteger        := 0;
              Params.ParamByName('pVenda').AsInteger      := idDaVenda;
           end;

           Params.ParamByName('pSeqParcela').AsString   := NumVendaGerarCreditos;
           Params.ParamByName('pNumDoc').AsString       := edtDOC.Text;
           Params.ParamByName('pNumAut').AsString       := edtALT.Text;
           Params.ParamByName('pValor').AsFloat         := valorParcela;
           Params.ParamByName('pQdeParcelas').AsFloat   := StrToInt(edtQdeParcelas.Text);
           Params.ParamByName('pVencto').AsDateTime     := vencimentoDoCredito;
           Params.ParamByName('pDataCad').AsDateTime    := date;
           Params.ParamByName('pMesano').AsString       := mes_ano;
           Params.ParamByName('pStatus').AsString       := 'PENDENTE';
           ExecSQL();

       end;

       FecharAbrirTabelas;
end;



procedure T_frmGerarCreditosPorCartao.edtQdeParcelasChange(
  Sender: TObject);
begin

    btnGerarCreditos.Enabled := true;

end;

procedure T_frmGerarCreditosPorCartao.edtQdeParcelasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

      if ( key = vk_return ) then
      begin
          btnGerarCreditosClick(Self);

      end;

end;

end.





