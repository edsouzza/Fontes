unit U_GerarCreditosPorPendencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,DateUtils, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus, EditNum;

type
  T_frmGerarCreditosPorPendencia = class(TForm)
    pan_titulo: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    lbl45: TLabel;
    lblStatusLogoff: TLabel;
    pan_botoes: TPanel;
    grCabecalho: TGroupBox;
    grDados: TGroupBox;
    lblTipoOperacao: TLabel;
    edtNumeroDocto: TStaticText;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edtQdeParcelas: TEdit;
    edtValor: TEditNum;
    procedure FormCreate(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure LimparCampos;
    procedure FecharAbrirTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GerarCabecalho;
    procedure GerarNumerosDosCreditos;
    procedure CalcularQdeParcelas;
    procedure GerarCreditoPorPendencia;
    procedure GravarCreditosAPrazo;
    procedure FormShow(Sender: TObject);
    procedure edtQdeParcelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQdeParcelasEnter(Sender: TObject);


  private
    { Private declarations }

  public
    { Public declarations }
    valorParcela, valorTotalPendencia, valorTotalDaVenda : double;
    qdeParcelas, idOrcamento, idDaVenda : integer;
    vencimentoDoCredito    : TDate;
    NumOrcGerarCreditos,sIDOrcamento,NumParcelaCreditos,qdedias  : string;
    pagtoAvista : Boolean;
    qd1, qd2, qd3, qd4, qd5, qd6, qd7, qd8, qd9, qd10, qd11, qd12 :  TEdit;

  end;

var
  _frmGerarCreditosPorPendencia: T_frmGerarCreditosPorPendencia;
  qdeDiasVencto : array of integer;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo, SqlExpr,DBClient, U_principal, DB,
     U_CadCredores, U_EscolhaDoCredorParaPagamento, U_FecharPedido, U_Caixa, U_orcamento,
  U_PagtoDoOrcamento;


{$R *.dfm}

procedure T_frmGerarCreditosPorPendencia.FormCreate(Sender: TObject);
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

    AbrirTabelas;      

end;

procedure T_frmGerarCreditosPorPendencia.FormShow(Sender: TObject);
begin

     GerarCabecalho;

     if ( pagandoVenda ) then
     begin
          idDaVenda               := _frmCaixa.idVenda;
          lblTipoOperacao.Caption := 'VENDA';
          edtNumeroDocto.Left     := 80;
          grDados.Caption         := 'Dados da Venda';

     end else  if ( pagandoOrcamento ) then
     begin
          idDaVenda := 0;
          lblTipoOperacao.Caption := 'ORÇAMENTO';
          grDados.Caption         := 'Dados do Orçamento';

     end;

     dtDataDoDia        := TDateEdit.Create(self);
     dtDataDoDia.Date   := date;
     MostrarMesEAno(dtDataDoDia.Text);
     
end;

procedure T_frmGerarCreditosPorPendencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    if ( pagandoVenda ) then
     begin
           _frmCaixa.edtTroco.SetFocus;

     end else  if ( pagandoOrcamento ) then
     begin
         _frmPagarOrcamento.edtTroco.SetFocus;

     end;

    pagandoVenda            := false;
    pagandoOrcamento        := false;
    vendaCredito            := true;
    GerouPendencia          := true;

    FreeAndNil(qdeDiasVencto);    //liberando o objeto criado da memoria
    FreeAndNil(dtDataDoDia);

end;

procedure T_frmGerarCreditosPorPendencia.GerarCabecalho;
begin

     if ( pagandoVenda ) then
     begin
           edtNumeroDocto.Caption   := NumVendaParaCreditos;
           edtValor.text            := ValorVendaParaCreditos;

     end else if ( pagandoOrcamento ) then
     begin
           edtNumeroDocto.Caption   := NumOrcParaCreditos;
           edtValor.text            := ValorPendenciaParaCreditos;

     end;

     edtQdeParcelas.SetFocus;

end;

procedure T_frmGerarCreditosPorPendencia.AbrirTabelas;
begin
    dm_DadosSegundo.cds_Ativos_Credito.Active   := true;

end;

procedure T_frmGerarCreditosPorPendencia.FecharTabelas;
begin
    dm_DadosSegundo.cds_Ativos_Credito.Active   := false;

end;

procedure T_frmGerarCreditosPorPendencia.FecharAbrirTabelas;
begin
    dm_DadosSegundo.cds_Ativos_Credito.Active := false;
    dm_DadosSegundo.cds_Ativos_Credito.Active := true;

end;

procedure T_frmGerarCreditosPorPendencia.FormKeyPress(Sender: TObject;
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

procedure T_frmGerarCreditosPorPendencia.LimparCampos;
begin

    edtValor.text  := '';

end;

procedure T_frmGerarCreditosPorPendencia.GerarCreditoPorPendencia;
begin

      CalcularQdeParcelas;
      GerarNumerosDosCreditos;

end;

procedure T_frmGerarCreditosPorPendencia.CalcularQdeParcelas;
begin

        //se escolheu um tipo de prazo que não a vista então...
        qdeParcelas              := StrToInt(edtQdeParcelas.Text);
        valorTotalPendencia      := StrToFloat(edtValor.text);
        valorParcela             := ( valorTotalPendencia / qdeParcelas );

end;

procedure T_frmGerarCreditosPorPendencia.GerarNumerosDosCreditos;
var  i, qdeDias : integer;
begin

         for i := 1 to qdeParcelas do   //o valor inicial deve ser a partir do zero pois os indices do explode começam do zero
         begin
             qdeDias  := ( i * 30);
             vencimentoDoCredito    := IncDay(dtDataDoDia.Date,qdeDias);
             NumParcelaCreditos     := IntToStr(i)+'/'+ IntToStr(qdeParcelas);
             GravarCreditosAPrazo;
         end;

         if ( pagandoVenda ) then
         begin
               texto := 'Os créditos referente á venda nº '+ edtNumeroDocto.Caption +' e suas parcelas foram geradas com sucesso!';
               Application.MessageBox(PChar(texto),'Sucesso!', MB_OK);
               close;

         end else  if ( pagandoOrcamento ) then
         begin
             texto := 'Os créditos referente ao Orçamento nº '+ edtNumeroDocto.Caption +' e suas parcelas foram geradas com sucesso!';
             Application.MessageBox(PChar(texto),'Sucesso!', MB_OK);
             close;
         end;    

end;

procedure T_frmGerarCreditosPorPendencia.GravarCreditosAPrazo;
begin
       proxNum:= GerarProximoID('id_credito','ativos_credito');

          _Sql := 'INSERT INTO ativos_credito (id_credito, cliente_id, orc_id, venda_id, parcela, doc, aut, valor, qde_parcelas, dtvencimento, datacad, mesano, status) '+
               'VALUES (:pIDCredito, :pClienteId, :pOrc, :pVenda, :pSeqParcela, :pNumDoc, :pNumAut, :pValor, :pQdeParcelas, :pVencto, :pDataCad, :pMesano, :pStatus)';

       with DM_Pesq.Qry_Geral do
       begin

           close;
           sql.Clear;
           sql.Add(_Sql);
           Params.ParamByName('pIDCredito').AsInteger   := proxNum;

           if(pagandoOrcamento)then
           begin
              Params.ParamByName('pOrc').AsInteger        := NumOrcamentoSelecionado;
              Params.ParamByName('pVenda').AsInteger      := _frmPagarOrcamento.IdVenda;
              Params.ParamByName('pClienteId').AsInteger  := idCliente;
              Params.ParamByName('pNumDoc').AsString      := IntToStr(_frmPagarOrcamento.IdVenda);
              Params.ParamByName('pNumAut').AsString      := 'ORCAMENTO';
           end else if(pagandoVenda)then
           begin
              Params.ParamByName('pOrc').AsInteger        := 0;
              Params.ParamByName('pVenda').AsInteger      := idDaVenda;
              Params.ParamByName('pClienteId').AsInteger  := idCliente;
              Params.ParamByName('pNumDoc').AsString      := IntToStr(idDaVenda);
              Params.ParamByName('pNumAut').AsString      := 'VENDA';
           end;

           Params.ParamByName('pSeqParcela').AsString   := NumParcelaCreditos;
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

procedure T_frmGerarCreditosPorPendencia.edtQdeParcelasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
      if ( key = vk_return ) then
      begin
           GerarCreditoPorPendencia;
      end;
end;       

procedure T_frmGerarCreditosPorPendencia.edtQdeParcelasEnter(
  Sender: TObject);
var
    vl_label : TLabel; //variável do tipo Label
begin
      //CENTRALIZANDO A DIGITAÇÃO DO EDIT DA SENHA
      vl_label := TLabel.Create(self); //criamos um label

      with vl_label do
      begin

          //pegamos a fonte usada no edit
          Font.Name := TEdit(sender).Font.Name;

          //pegamos o conteúdo do edit
          Caption   := TEdit(sender).Text;

         //centraliza no label e retorna para o edit
          SendMessage(TEdit(sender).Handle, EM_SETMARGINS, EC_LEFTMARGIN,
          (TEdit(sender).Width-vl_label.Width) div 2);

      end;

      vl_label.Free;   

end;

end.





