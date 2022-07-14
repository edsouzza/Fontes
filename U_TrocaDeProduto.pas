unit U_TrocaDeProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  T_frmTrocaDeProduto = class(TForm)
    G_DEVOLVIDO: TGroupBox;
    Panel1: TPanel;
    edt_CodBarProdutoDeTroca: TEdit;
    Panel2: TPanel;
    G_QDEDEVOLVIDA: TGroupBox;
    edtQdeDevolvida: TEdit;
    Label6: TLabel;
    txtTotalProdDevolvido: TStaticText;
    Label4: TLabel;
    G_TROCADO: TGroupBox;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    edtQdeTrocada: TEdit;
    txtTotalProdTrocado: TStaticText;
    Label13: TLabel;
    Label14: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    txtCodigoProdDevolvido: TStaticText;
    txtDescricaoProdDevolvido: TStaticText;
    txtEstoqueProdDevolvido: TStaticText;
    txtUnitarioProdDevolvido: TStaticText;
    txtIDProdutoDevolvido: TStaticText;
    txtDiferencaEntreProdutos: TStaticText;
    Label15: TLabel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    txtCodigoProdTrocado: TStaticText;
    txtDescricaoProdTrocado: TStaticText;
    txtEstoqueProdTrocado: TStaticText;
    txtUnitarioProdTrocado: TStaticText;
    txtIDProdutoSaindo: TStaticText;
    StatusBar1: TStatusBar;
    pan_titulo: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    lblStatusLogoff: TLabel;
    lbl45: TLabel;
    pnl_rodape: TPanel;
    btnConfirmarOperacao: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    edt_CodBarProdutoDeSaida: TEdit;
    procedure PesquisarCodBarProdutoParaEntrada;
    procedure PesquisarCodBarProdutoParaSaida;
    procedure btnSairClick(Sender: TObject);
    procedure edt_CodBarProdutoDeTrocaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edt_CodBarProdutoDeSaidaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edtQdeDevolvidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQdeTrocadaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edt_CodBarProdutoDeSaidaKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtQdeTrocadaKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarOperacaoClick(Sender: TObject);
    procedure AtualizarEstoqueAposDevolucao;
    procedure AtualizarCaixaAposDevolucao;
    procedure BaixarProdutoTrocadoDoEstoque;
    procedure AtualizarCaixaAposTroca;
    procedure edtQdeDevolvidaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_CodBarProdutoDeTrocaEnter(Sender: TObject);
    procedure edtQdeDevolvidaEnter(Sender: TObject);
    procedure edt_CodBarProdutoDeSaidaEnter(Sender: TObject);
    procedure edtQdeTrocadaEnter(Sender: TObject);
    procedure txtDiferencaEntreProdutosMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure edt_CodBarProdutoDeSaidaClick(Sender: TObject);


  private
    { Private declarations }
    ValorTotalDebitadoAoCaixaPelaDevolucao, ValorTotalCreditadoAoCaixaPelaTroca, ValorDaDiferencaEntreProdutos,
    EstoqueAtualProdutoDevolvido, QdeDevolvida, EstoqueAtualizado, ValorSaldoAnterior, ValorSaldoAtualAposMovto,
    ValorSaldoAnteriorAntesDaTroca   : double;
    id_ProdutoDevolvido, proxNumIdCaixaDevolvido, proxNumIdCaixaTrocado : integer;
  public
    { Public declarations }
  end;

var
  _frmTrocaDeProduto: T_frmTrocaDeProduto;

implementation

uses U_dmPesquisas, U_BiblioSysSalao, DB, U_dmDados,
  U_EscolhaDoProdutoParaVenda, U_EscolhaDoProdutoParaTroca,
  U_dmDadosSegundo;

{$R *.dfm}

{ T_frmTrocaDeProduto }


procedure T_frmTrocaDeProduto.FormCreate(Sender: TObject);
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

  lblDataDoDia.Caption    :=  DateToStr(date);
  lblHoraAtual.Caption    :=  timetoStr(time);
  lblStatusLogoff.Caption := IdentificarUsuarioLogado;

end;

procedure T_frmTrocaDeProduto.PesquisarCodBarProdutoParaEntrada;
begin

    _Sql := 'SELECT id_produto, descricao, cod_barras, estoque_atual, precovenda, status FROM produtos '+
            'WHERE cod_barras = :pCodBarras AND status = :pStatus';

         with DM_Pesq.cdsPesqProduto do begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pCodBarras').AsString     := edt_CodBarProdutoDeTroca.text;
            Params.ParamByName('pStatus').AsString        := 'A';
            Open;

          //se o codigo do produto existir
          if not DM_Pesq.cdsPesqProduto.IsEmpty then
          begin

              txtIDProdutoDevolvido.Caption       := IntToStr(DM_Pesq.cdsPesqProduto.Fieldbyname('id_produto').AsInteger);
              txtCodigoProdDevolvido.Caption      := DM_Pesq.cdsPesqProduto.Fieldbyname('cod_barras').AsString;
              txtDescricaoProdDevolvido.Caption   := DM_Pesq.cdsPesqProduto.Fieldbyname('descricao').AsString;
              txtEstoqueProdDevolvido.Caption     := FloatToStr(DM_Pesq.cdsPesqProduto.Fieldbyname('estoque_atual').AsFloat);
              txtUnitarioProdDevolvido.Caption    := FloatToStrF(DM_Pesq.cdsPesqProduto.Fieldbyname('precovenda').AsFloat,ffNumber,4,2);
              G_QDEDEVOLVIDA.Enabled              := true;
              btnCancelar.Enabled                 := true;
              btnSair.Enabled                     := false;
              edtQdeDevolvida.SetFocus;

          end
          else begin

                texto := 'Esse produto não esta cadastrado deseja sair?';

                if Application.MessageBox(PChar(texto),'Produto não cadastrado',MB_YESNO + MB_ICONQUESTION) = IdYes then
                begin

                   btnSairClick(self);

                end
                else begin

                   edt_CodBarProdutoDeTroca.Text := '';
                   edt_CodBarProdutoDeTroca.SetFocus;

             end;

          end;

        end;

end;

procedure T_frmTrocaDeProduto.PesquisarCodBarProdutoParaSaida;
begin

        _Sql := 'SELECT id_produto, descricao, cod_barras, estoque_atual, precovenda, status FROM produtos '+
                'WHERE cod_barras = :pCodBarras AND status = :pStatus';

         with DM_Pesq.cdsPesqProduto do begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pCodBarras').AsString     := edt_CodBarProdutoDeSaida.text;
            Params.ParamByName('pStatus').AsString        := 'A';
            Open;

          //se o codigo do produto existir
          if not DM_Pesq.cdsPesqProduto.IsEmpty then
          begin

              txtIDProdutoSaindo.Caption        := IntToStr(DM_Pesq.cdsPesqProduto.Fieldbyname('id_produto').AsInteger);
              txtCodigoProdTrocado.Caption      := DM_Pesq.cdsPesqProduto.Fieldbyname('cod_barras').AsString;
              txtDescricaoProdTrocado.Caption   := DM_Pesq.cdsPesqProduto.Fieldbyname('descricao').AsString;
              txtEstoqueProdTrocado.Caption     := FloatToStr(DM_Pesq.cdsPesqProduto.Fieldbyname('estoque_atual').AsFloat);
              txtUnitarioProdTrocado.Caption    := FloatToStrF(DM_Pesq.cdsPesqProduto.Fieldbyname('precovenda').AsFloat,ffNumber,4,2);

              edtQdeTrocada.SetFocus;

          end
          else begin

                texto := 'Esse produto não esta cadastrado deseja sair?';

                if Application.MessageBox(PChar(texto),'Produto não cadastrado',MB_YESNO + MB_ICONQUESTION) = IdYes then
                begin

                    btnSairClick(self);

                end
                else begin

                   edt_CodBarProdutoDeSaida.Text := '';
                   edt_CodBarProdutoDeSaida.SetFocus;

             end;

          end;

        end; 

end;

procedure T_frmTrocaDeProduto.btnSairClick(Sender: TObject);
begin
    close;
end;

procedure T_frmTrocaDeProduto.edt_CodBarProdutoDeTrocaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

    if key = vk_return then
    begin

         // procura o produto que entrara a titulo de devolução no estoque
         PesquisarCodBarProdutoParaEntrada;


    end;

end;

procedure T_frmTrocaDeProduto.edt_CodBarProdutoDeSaidaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

    if key = vk_return then
    begin

         // procura o produto que será trocado
         PesquisarCodBarProdutoParaSaida;


    end;

     if Key = VK_F4 then begin

          //abre tela com produtos cadastrados para entrar sem o cod barras     F4
          Application.CreateForm(T_frmEscolhaDoProdutoParaTroca, _frmEscolhaDoProdutoParaTroca);
          _frmEscolhaDoProdutoParaTroca.ShowModal;
          FreeAndNil(_frmEscolhaDoProdutoParaTroca);  

      end;

end;

procedure T_frmTrocaDeProduto.edtQdeDevolvidaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

    if key = vk_return then
    begin

        G_DEVOLVIDO.Enabled                    := false;
        G_TROCADO.Enabled                      := true;
        ValorTotalDebitadoAoCaixaPelaDevolucao :=  ( StrToFloat(txtUnitarioProdDevolvido.Caption) * StrToFloat(edtQdeDevolvida.text) );
        txtTotalProdDevolvido.Caption          :=  FloatToStrF(ValorTotalDebitadoAoCaixaPelaDevolucao,ffNumber,4,2);
        edt_CodBarProdutoDeSaida.SetFocus;

    end;

end;

procedure T_frmTrocaDeProduto.edtQdeTrocadaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

    if key = vk_return then
    begin

        ValorTotalCreditadoAoCaixaPelaTroca :=  ( StrToFloat(txtUnitarioProdTrocado.Caption) * StrToFloat(edtQdeTrocada.text) );
        txtTotalProdTrocado.Caption         :=  FloatToStrF(ValorTotalCreditadoAoCaixaPelaTroca,ffNumber,4,2);
        ValorDaDiferencaEntreProdutos       :=  ( StrToFloat(txtTotalProdTrocado.Caption) - StrToFloat(txtTotalProdDevolvido.Caption) );
        txtDiferencaEntreProdutos.Caption   :=  FloatToStrF(ValorDaDiferencaEntreProdutos,ffNumber,4,2);

              //VERIFICA SE O VALOR DA TROCA É MAIOR QUE O VALOR DA COMPRA INICIAL
              if ( StrToFloat(txtTotalProdDevolvido.Caption) > StrToFloat(txtTotalProdTrocado.Caption ) ) then
              begin

                   Application.MessageBox('É necessário que o valor de troca seja maior que o valor da compra inicial!',
                             'Valor de troca inválido...', MB_OK + MB_ICONEXCLAMATION);
                   StatusBar1.Panels.Clear;
                   StatusBar1.Panels.Add.Text :='Valor de troca não pode ser menor que o valor da compra inicial';
                   txtTotalProdTrocado.Caption       := '';
                   txtDiferencaEntreProdutos.Caption := '';
                   edtQdeTrocada.Clear;
                   edtQdeTrocada.SetFocus;

              end else begin

                    edt_CodBarProdutoDeSaida.SetFocus;
                    btnConfirmarOperacao.Enabled := true;
                    StatusBar1.Panels.Clear;
                    StatusBar1.Panels.Add.Text :='Confirme ou cancele a operação de troca nos botões acima';

              end;

     end;

end;



procedure T_frmTrocaDeProduto.btnCancelarClick(Sender: TObject);
begin

      edt_CodBarProdutoDeTroca.Clear;
      edt_CodBarProdutoDeSaida.Clear;
      edtQdeDevolvida.Clear;
      edtQdeTrocada.Clear;

      txtCodigoProdDevolvido.Caption    := '';
      txtDescricaoProdDevolvido.Caption := '';
      txtEstoqueProdDevolvido.Caption   := '';
      txtUnitarioProdDevolvido.Caption  := '';
      txtTotalProdDevolvido.Caption     := '';

      txtCodigoProdTrocado.Caption      := '';
      txtDescricaoProdTrocado.Caption   := '';
      txtEstoqueProdTrocado.Caption     := '';
      txtUnitarioProdTrocado.Caption    := '';
      txtTotalProdTrocado.Caption       := '';
      txtDiferencaEntreProdutos.Caption := '';

      G_DEVOLVIDO.Enabled               := true;
      G_QDEDEVOLVIDA.Enabled            := false;
      G_TROCADO.Enabled                 := false;
      btnCancelar.Enabled               := false;
      btnSair.Enabled                   := true;
      btnConfirmarOperacao.Enabled      := false;

      edt_CodBarProdutoDeTroca.SetFocus;

end;

procedure T_frmTrocaDeProduto.edt_CodBarProdutoDeSaidaKeyPress(
  Sender: TObject; var Key: Char);
begin

     edt_CodBarProdutoDeSaida.SelStart  := 0;
     edt_CodBarProdutoDeSaida.SelLength := Length(edt_CodBarProdutoDeSaida.Text);

end;

procedure T_frmTrocaDeProduto.edtQdeTrocadaKeyPress(Sender: TObject;
  var Key: Char);
begin

     // PARA DBEDIT ACEITAR APENAS NUMEROS
     If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;        

end;

procedure T_frmTrocaDeProduto.btnConfirmarOperacaoClick(Sender: TObject);
begin

       AtualizarEstoqueAposDevolucao;

       AtualizarCaixaAposDevolucao;


       BaixarProdutoTrocadoDoEstoque;

       AtualizarCaixaAposTroca;


        if Application.MessageBox('Confirma a troca dos produtos e o pagamento da diferença entre eles pelo cliente?',
            'Troca de Mercadoria', MB_YESNO +
            MB_ICONQUESTION) = IDYES then begin

                Application.MessageBox('Esta operação foi concluída com êxito, os estoques e o caixa foram atualizados!',
                   'OK...', MB_OK + MB_ICONINFORMATION);

                   btnCancelarClick(Self);

         end else begin

                exit;

         end;

end;

procedure T_frmTrocaDeProduto.AtualizarEstoqueAposDevolucao;
begin

      { DESCOBRIR A QUANTIDADE ATUAL DO PRODUTO NO ESTOQUE, DEVOLVER A QUANTIDADE DEVOLVIDA AO ESTOQUE }

    //verifica se o produto existe no estoque e qual a sua quantidade atual
     with DM_Pesq.Qry_Geral do
     begin

         close;
         SQL.Clear;
         SQL.Add('select * from produtos where id_produto ='+chr(39)+txtIDProdutoDevolvido.Caption+chr(39));
         open;

         If not IsEmpty then      //se encontrou um produto com o codigo entrado...
         begin

              id_ProdutoDevolvido          := DM_Pesq.Qry_Geral.Fields[0].AsInteger;
              EstoqueAtualProdutoDevolvido := DM_Pesq.Qry_Geral.Fields[3].AsFloat;

         end;

     end;

     QdeDevolvida        := StrToFloat(edtQdeDevolvida.Text);
     EstoqueAtualizado   :=  ( EstoqueAtualProdutoDevolvido +  QdeDevolvida );

     //ATUALIZANDO O ESTOQUE NA TABELA PRODUTOS
     with DM_Pesq.Qry_Geral do
     begin

          close;
          sql.Clear;
          sql.Add('UPDATE produtos SET Estoque_atual = :pEstoqueAtual WHERE id_produto = :pIdProduto');
          Params.ParamByName('pEstoqueAtual').AsFloat    := EstoqueAtualizado;
          Params.ParamByName('pIdProduto').AsInteger     := id_ProdutoDevolvido;
          ExecSQL();

     end;


end;

procedure T_frmTrocaDeProduto.AtualizarCaixaAposDevolucao;
begin

          //ATUALIZA CAIXA APOS MOVIMENTO DE DEVOLUÇÃO

          proxNumIdCaixaDevolvido := 0;

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

           ValorSaldoAtualAposMovto := ( ValorSaldoAnterior - ValorTotalDebitadoAoCaixaPelaDevolucao );

           // ATUALIZANDO O CAIXA
           With DM_Pesq.qry_Cod do begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_caixa) from caixa');
              Open;

              if not IsEmpty then begin

                 proxNumIdCaixaDevolvido := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;


            with  dm_Conexao.cds_Caixa do begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNumIdCaixaDevolvido;
                FieldByName('saldo_anterior').AsFloat    := ValorSaldoAnterior;
                FieldByName('valor_movimento').AsFloat   := -ValorTotalDebitadoAoCaixaPelaDevolucao;
                FieldByName('saldo_atual').AsFloat       := ValorSaldoAtualAposMovto;
                FieldByName('data').AsDateTime           := date;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := 'ESTORNO :DEVOLUCAO DE MERCADORIA';

                ApplyUpdates(0);

            end;


end;

procedure T_frmTrocaDeProduto.BaixarProdutoTrocadoDoEstoque;
var
  EstoqueAtualProdutoTrocado, QuantidadeSaidaProdutoTrocado, EstoqueAtualizadoProdutoTrocado, IDProdutoTrocado : integer;
begin

        EstoqueAtualProdutoTrocado      := 0;
        IDProdutoTrocado                := 0;
        QuantidadeSaidaProdutoTrocado   := StrToInt(edtQdeTrocada.Text);

         with DM_Pesq.Qry_Geral do
         begin

             close;
             SQL.Clear;
             SQL.Add('select * from produtos where id_produto ='+chr(39)+txtIDProdutoSaindo.Caption+chr(39));
             open;

             If not IsEmpty then      //se encontrou um produto com o codigo entrado...
             begin

                  IDProdutoTrocado             := DM_Pesq.Qry_Geral.Fields[0].AsInteger;
                  EstoqueAtualProdutoTrocado   := DM_Pesq.Qry_Geral.Fields[3].AsInteger;

             end;

         end;


         EstoqueAtualizadoProdutoTrocado := ( EstoqueAtualProdutoTrocado - QuantidadeSaidaProdutoTrocado );


        //ATUALIZANDO O ESTOQUE NA TABELA PRODUTOS
         with DM_Pesq.Qry_Geral do
         begin

              close;
              sql.Clear;
              sql.Add('UPDATE produtos SET Estoque_atual = :pEstoqueAtual WHERE id_produto = :pIdProduto');
              Params.ParamByName('pEstoqueAtual').AsInteger  := EstoqueAtualizadoProdutoTrocado;
              Params.ParamByName('pIdProduto').AsInteger     := IDProdutoTrocado;
              ExecSQL();

         end;


end;

procedure T_frmTrocaDeProduto.AtualizarCaixaAposTroca;
begin

            //ATUALIZA CAIXA APOS MOVIMENTO DE DEVOLUÇÃO

            proxNumIdCaixaDevolvido := 0;

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

                         ValorSaldoAnteriorAntesDaTroca := DM_Pesq.qry_Cod.Fields[1].Value;

                    end;

             end;



             ValorSaldoAtualAposMovto := ( ValorSaldoAnteriorAntesDaTroca + ValorTotalCreditadoAoCaixaPelaTroca );



           // ATUALIZANDO O CAIXA APOS A TROCA PELO NOVO PRODUTO
           With DM_Pesq.qry_Cod do begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_caixa) from caixa');
              Open;

              if not IsEmpty then begin

                 proxNumIdCaixaTrocado := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;


            with  dm_Conexao.cds_Caixa do begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNumIdCaixaTrocado;
                FieldByName('saldo_anterior').AsFloat    := ValorSaldoAnteriorAntesDaTroca;
                FieldByName('valor_movimento').AsFloat   := ValorTotalCreditadoAoCaixaPelaTroca;
                FieldByName('saldo_atual').AsFloat       := ValorSaldoAtualAposMovto;
                FieldByName('data').AsDateTime           := date;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := 'CREDITO   :DEVOLUCAO DE MERCADORIA';

                ApplyUpdates(0);

            end;


end;

procedure T_frmTrocaDeProduto.edtQdeDevolvidaKeyPress(Sender: TObject;
  var Key: Char);
begin

    // PARA DBEDIT ACEITAR APENAS NUMEROS
         If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;


end;

procedure T_frmTrocaDeProduto.edt_CodBarProdutoDeTrocaEnter(
  Sender: TObject);
begin   
    StatusBar1.Panels.Clear;
    StatusBar1.Panels.Add.Text :='Entre com o código do produto devolvido';
end;

procedure T_frmTrocaDeProduto.edtQdeDevolvidaEnter(Sender: TObject);
begin
  StatusBar1.Panels.Clear;
  StatusBar1.Panels.Add.Text :='Entre com a quantidade devolvida do produto';
end;

procedure T_frmTrocaDeProduto.edt_CodBarProdutoDeSaidaEnter(
  Sender: TObject);
begin
    StatusBar1.Panels.Clear;
    StatusBar1.Panels.Add.Text :='Entre com o código do produto a ser trocado < F4 > para escolher na lista';
end;

procedure T_frmTrocaDeProduto.edtQdeTrocadaEnter(Sender: TObject);
begin
    StatusBar1.Panels.Clear;
    StatusBar1.Panels.Add.Text :='Entre com a quantidade do produto trocado';
end;

procedure T_frmTrocaDeProduto.txtDiferencaEntreProdutosMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    StatusBar1.Panels.Clear;
    StatusBar1.Panels.Add.Text :='Valor a ser pago pelo cliente a título de diferença entre os produtos';
end;

procedure T_frmTrocaDeProduto.edt_CodBarProdutoDeSaidaClick(
  Sender: TObject);
begin

   edt_CodBarProdutoDeSaida.SelStart  := 0;
   edt_CodBarProdutoDeSaida.SelLength :=  Length(edt_CodBarProdutoDeSaida.Text);

end;

end.
