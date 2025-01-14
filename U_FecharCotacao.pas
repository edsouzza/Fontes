unit U_FecharCotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,DateUtils, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus, Math;

type
  T_frmFecharCotacao = class(TForm)
    pan_titulo: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    lbl45: TLabel;
    lblStatusLogoff: TLabel;
    pan_botoes: TPanel;
    btnSairDaCotacao: TSpeedButton;
    panel_itensCotacao: TPanel;
    panel_Produtos: TPanel;
    lbl14: TLabel;
    lbl33: TLabel;
    lbl38: TLabel;
    lbl40: TLabel;
    lbl52: TLabel;
    edt_QuantidadeProdutoCotacao: TEdit;
    edt_PrecoProdutoCotacao: TCurrencyEdit;
    edt_EstoqueCotacao: TEdit;
    edt_PrecoDescontoProdutoCotacao: TCurrencyEdit;
    edt_ProdutoCotacao: TEdit;
    Grid_Cotacao: TDBGrid;
    btnInserirProduto: TButton;
    btnPagarCotacao: TSpeedButton;
    panel_CabecalhoCotacao: TPanel;
    btnImprimirCotacao: TSpeedButton;
    btnGravarCotacao: TSpeedButton;
    panel_item: TPanel;
    Label5: TLabel;
    rd_desconto: TRadioButton;
    rd_exclusaodoitem: TRadioButton;
    rd_sair: TRadioButton;
    panel_total: TPanel;
    lbl37: TLabel;
    db_ValorTotal: TDBEdit;
    txt_NomeClienteCotacao: TStaticText;
    txt_NomeProdutoCotacao: TStaticText;
    lblProduto: TLabel;
    Label4: TLabel;
    txt_IDPRODUTO: TEdit;
    lblCliente: TLabel;
    txt_IdDoITEM: TEdit;
    txt_ValorItem: TEdit;
    txt_IDPRODUTODEL: TEdit;
    edt_quantidadeDoItem: TEdit;
    btnAbrirCotacao: TButton;
    txtIDCliente: TEdit;
    txt_NumCotacaoParaAbrir: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure btnSairDaCotacaoClick(Sender: TObject);
    procedure edt_QuantidadeProdutoCotacaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure txt_NomeProdutoCotacaoClick(Sender: TObject);
    procedure edt_QuantidadeProdutoCotacaoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure GravarAtualizacaoDaCotacao;
    procedure rd_exclusaodoitemClick(Sender: TObject);
    procedure rd_sairClick(Sender: TObject);
    procedure rd_descontoClick(Sender: TObject);
    procedure MostrarOsItensDaCotacao;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MostrarNomeDoCliente;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure AbrirFecharTabelas;
    procedure txt_NumCotacaoParaAbrirKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure LimparTabelaTCotacao;
    procedure btnInserirProdutoClick(Sender: TObject);
    procedure InserirProduto;
    procedure btnGravarCotacaoClick(Sender: TObject);
    procedure LimparCotacaDaTela;
    procedure Grid_CotacaoCellClick(Column: TColumn);
    procedure DesabilitarBotoes;
    procedure HabilitarBotoes;
    procedure btnPagarCotacaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAbrirCotacaoClick(Sender: TObject);
    procedure btnImprimirCotacaoClick(Sender: TObject);
    procedure VerificaEstoqueAntesDeInserirProduto;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }               


  public
    { Public declarations }
     NumCotacao, proxNumeDetalhe,cont,IDOperador    : integer;
     CotacaoAberta : Boolean;
     ValorUnitarioItemProdutoCotacao, ValorDescontoItemProdutoCotacao, QuantidadeItemProdutoCotacao,
     ValorLiquidoItemProdutoCotacao, ValorTotalItemProdutoCotacao, EstoqueInicial  : double;

  end;

var
  _frmFecharCotacao: T_frmFecharCotacao;


implementation

uses U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo, DB, U_EscolhaDoProdutoParaCotacao,
   U_EscolhaProdutoFecharCotacao, U_ValorDescontoCotacao,U_Caixa,
   U_DescontoFechamentoCotacao, U_PagamentoDeCotacao,
  U_ConsCotacoesPeriodo, U_principal, U_QRelImprimeCotacao,
  U_QRelCotacaoPeriodoGeral, DBClient;


{$R *.dfm}

procedure T_frmFecharCotacao.FormCreate(Sender: TObject);
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
    panel_total.Top              := 422;
    pan_titulo.Caption           := 'Atualizar cota��o de Pre�os N� '+ IntToStr(NumCotacao);
    IDOperador                   := IdFuncionarioLogado(lblStatusLogoff.Caption);
    DesabilitarBotoes;
    AbrirTabelas;
   
end;

procedure T_frmFecharCotacao.FormShow(Sender: TObject);
begin

     txt_NumCotacaoParaAbrir.Caption := IntToStr(_frmConsCotacoesPeriodo.NumCotacaoSelecionada);
     txtIDCliente.Text               := IntToStr(_frmConsCotacoesPeriodo.IDCliente);

     _frmConsCotacoesPeriodo.Close;   
     btnAbrirCotacaoClick(self);

end;

procedure T_frmFecharCotacao.btnAbrirCotacaoClick(Sender: TObject);
begin

    MostrarOsItensDaCotacao;
    
end;


procedure T_frmFecharCotacao.MostrarOsItensDaCotacao;
begin

         //COPIANDO OS ITENS DA TABELA I_COTACAO PARA TABELA T_COTACAO ATRAVES DO ID DA COTACAO E MOSTRANDO NO GRID

         NumCotacao  := StrToInt(txt_NumCotacaoParaAbrir.Caption);

         dm_DadosSegundo.cds_ICotacao.Active := true;

         if dm_DadosSegundo.cds_ICotacao.Locate('cotacao_id',NumCotacao,[]) then
         begin

                _Sql := 'INSERT INTO t_cotacao (id_detalhescotacao, cotacao_id, produto_id, unitario, quantidade, '+
                        'totalitem, flag) select * FROM i_cotacao WHERE cotacao_id = :pNumCotacao';

                 with DM_Pesq.Qry_Geral do
                 begin

                     close;
                     sql.Clear;
                     sql.Add(_Sql);
                     Params.ParamByName('pNumCotacao').AsInteger := NumCotacao;
                     ExecSQL();

                 end;

                 MostrarNomeDoCliente;
                 panel_itensCotacao.Visible   := true;
                 AbrirFecharTabelas;
                 pan_titulo.Caption           := 'Atualizar cota��o de Pre�os N� '+ IntToStr(NumCotacao);
                 txt_NumCotacaoParaAbrir.Top  := 12;
                 txt_NumCotacaoParaAbrir.Left := 29;
                 HabilitarBotoes;

         end else begin

              Application.MessageBox('Ops, digite o n�mero da cota��o desejada!!!', 'Cota��o n�o encontrada!', MB_OK);
              txt_NumCotacaoParaAbrir.Caption := '';

         end;


end;



procedure T_frmFecharCotacao.btnSairDaCotacaoClick(
  Sender: TObject);
begin

  close;
  release;
  
end;

procedure T_frmFecharCotacao.edt_QuantidadeProdutoCotacaoKeyPress(
  Sender: TObject; var Key: Char);
begin

        // PARA DBEDIT ACEITAR APENAS NUMEROS
        If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;    


procedure T_frmFecharCotacao.rd_exclusaodoitemClick(Sender: TObject);
var
  texto : string;
begin

       texto:= 'Confirma a exclus�o do �tem selecionado?';

       if Application.MessageBox(PChar(texto),'Exclu�ndo �tem',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin


            //EXCLUINDO OS �TENS SELECIONADOS DA TABELA t_cotacao  (itens do grid)

           _Sql:= 'Delete FROM t_cotacao WHERE id_detalhescotacao = :pCodigo';

            with DM_Pesq.Qry_Geral do begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              ParamByName('pCodigo').AsInteger:= StrToInt(txt_IdDoITEM.Text);
              ExecSQL();

           end;


            //EXCLUINDO OS �TENS SELECIONADOS DA TABELA i_cotacao

           _Sql:= 'Delete FROM i_cotacao WHERE cotacao_id = :pCotacao AND produto_id = :pIDProduto';

           with DM_Pesq.Qry_Geral do begin

            Close;
            SQL.Clear;
            SQL.Add(_Sql);
            ParamByName('pCotacao').AsInteger  := NumCotacao;
            ParamByName('pIDProduto').AsInteger:= StrToInt(txt_IDPRODUTODEL.Text);
            ExecSQL();

          end;
                      

           AbrirFecharTabelas;

           btnPagarCotacao.Enabled   := false;
           txt_IdDoITEM.Text         := '0';
           txt_ValorItem.Clear;

           Application.MessageBox('�tem exclu�do com sucesso!', 'Excluindo �tem!', MB_OK);
           HabilitarBotoes;

       end
       else begin


          panel_item.Visible  := false;
          panel_total.Visible := true;
          HabilitarBotoes;

       end;          

       rd_exclusaodoitem.Checked := false;
       panel_item.Visible        := false;
       panel_total.Visible       := true;

end;

procedure T_frmFecharCotacao.rd_sairClick(Sender: TObject);
begin

     btnSairDaCotacao.Enabled := false;
     rd_sair.Checked          := false;
     panel_item.Visible       := false;
     panel_total.Visible      := true;

     HabilitarBotoes;

end;


procedure T_frmFecharCotacao.rd_descontoClick(Sender: TObject);
begin

     Application.CreateForm(T_frmDescontoFechamentoCotacao,  _frmDescontoFechamentoCotacao);
     _frmDescontoFechamentoCotacao.ShowModal;
     FreeAndNil(_frmDescontoFechamentoCotacao);

     rd_desconto.Checked      := false;
     panel_item.Visible       := false;
     panel_total.Visible      := true;
     btnSairDaCotacao.Enabled := false;    

end;


procedure T_frmFecharCotacao.LimparCotacaDaTela;
begin

     //LIMPA A COTA��O DA TELA

   dm_DadosSegundo.cds_TCotacao.Close;
   txt_NumCotacaoParaAbrir.Caption:= '';
   txt_NumCotacaoParaAbrir.Left   := 429;
   pan_titulo.Caption             := 'Atualizar cota��o de Pre�os N� ';
   txt_NomeClienteCotacao.Caption := '';
   txt_NomeClienteCotacao.Visible := false;
   txt_NomeProdutoCotacao.Visible := false;
   lblCliente.Visible             := false;
   lblProduto.Visible             := false;
   panel_itensCotacao.Visible     := false;
   LimparTabelaTCotacao;           //limpa a tabela temporaria tcotacao
   close;


end;

procedure T_frmFecharCotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  //controla abertura ou nao de uma nova cota��o
  if CotacaoAberta then
  begin

       Application.MessageBox('Existe uma cota��o em andamento, cancele ou grave para sair!', 'Opera��o Negada!', MB_OK);

  end else begin

      close;
      release;
      FecharTabelas;
      LimparTabelaTCotacao;

  end;    
    
end;


procedure T_frmFecharCotacao.AbrirTabelas;
begin

    dm_DadosSegundo.cds_ICotacao.Active                 := true;
    dm_DadosSegundo.cds_cotacao.Active                  := true;
    dm_DadosSegundo.cds_TCotacao.Active                 := true;

end;

procedure T_frmFecharCotacao.FecharTabelas;
begin

    dm_DadosSegundo.cds_ICotacao.Active                 := false;
    dm_DadosSegundo.cds_cotacao.Active                  := false;
    dm_DadosSegundo.cds_TCotacao.Active                 := false;

end;


procedure T_frmFecharCotacao.AbrirFecharTabelas;
begin

    dm_DadosSegundo.cds_ICotacao.Active                 := false;
    dm_DadosSegundo.cds_cotacao.Active                  := false;
    dm_DadosSegundo.cds_TCotacao.Active                 := false;

    dm_DadosSegundo.cds_ICotacao.Active                 := true;
    dm_DadosSegundo.cds_cotacao.Active                  := true;
    dm_DadosSegundo.cds_TCotacao.Active                 := true;

end;

procedure T_frmFecharCotacao.txt_NumCotacaoParaAbrirKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

      if key = 13 then
      begin

           if txt_NumCotacaoParaAbrir.Caption = '' then begin

                Application.MessageBox('Digite o n�mero da cota��o!', 'Ops, n�mero inv�lido!!!', MB_OK);

           end else begin

                MostrarOsItensDaCotacao;

           end;

      end;


end;

procedure T_frmFecharCotacao.MostrarNomeDoCliente;
begin

     _Sql:='SELECT c.id_cliente, c.id_cotacao, cl.cli_id, cl.cli_nome FROM cotacao c, clientes cl '+
           'WHERE c.id_cliente = cl.cli_id AND c.id_cotacao = :pNumCotacao';

     with DM_Pesq.Qry_Geral do
     begin

         Close;
         SQL.Clear;
         sql.Add(_Sql);
         Params.ParamByName('pNumCotacao').AsInteger := StrToInt(txt_NumCotacaoParaAbrir.Caption);
         open;

         if not IsEmpty then
         begin

             txt_NomeClienteCotacao.Caption := DM_Pesq.Qry_Geral.Fields[3].AsString;

         end;

     end;

     txt_NomeClienteCotacao.Visible := true;
     txt_NomeProdutoCotacao.Visible := true;
     lblCliente.Visible             := true;
     lblProduto.Visible             := true;

end;


procedure T_frmFecharCotacao.LimparTabelaTCotacao;
begin

         With DM_Pesq.Qry_Geral do begin

            Close;
            SQL.Clear;
            SQL.Add('Delete FROM t_cotacao');
            ExecSQL;

         end;

         AbrirFecharTabelas;

end;


procedure T_frmFecharCotacao.btnInserirProdutoClick(Sender: TObject);
begin

   VerificaEstoqueAntesDeInserirProduto;

end;


procedure T_frmFecharCotacao.VerificaEstoqueAntesDeInserirProduto;
begin

          //verificando se � um produto ou servi�o. Se for produto verifica estoque senao segue em frente
          VerificaSeEProduto(StrToInt(txt_IDPRODUTO.Text));

          if EProduto then
          begin

              //essa verificacao nao deve servir para servicos

              if StrToInt(edt_QuantidadeProdutoCotacao.Text) > StrToInt(edt_EstoqueCotacao.Text) then
               begin

                      Application.MessageBox('Estoque insuficiente para esta transa��o.Verifique!', 'Estoque Insuficiente', MB_OK);
                      edt_QuantidadeProdutoCotacao.Clear;
                      txt_NomeProdutoCotacao.Caption := '';
                      Exit;

              end else begin


                    if dm_DadosSegundo.cds_TCotacao.Locate('produto_id',txt_IDPRODUTO.Text,[]) then
                     begin

                       Application.MessageBox('Esse produto j� foi inserido, delete o �tem anterior e insira novamente com a nova quantidade!', 'Duplicidade', MB_OK);
                       txt_NomeProdutoCotacao.Caption := '';
                       exit;

                     end
                     else begin

                        InserirProduto;     

                     end;
              end;
          end else begin

                     //mesmo procedimento de insercao mas sem a verificacao de estoque para os servi�os
                     if dm_DadosSegundo.cds_TCotacao.Locate('produto_id',txt_IDPRODUTO.Text,[]) then
                     begin

                       Application.MessageBox('Esse produto j� foi inserido, delete o �tem anterior e insira novamente com a nova quantidade!', 'Duplicidade', MB_OK);
                       txt_NomeProdutoCotacao.Caption := '';
                       exit;

                     end
                     else begin

                        InserirProduto;

                     end;    
          end;


end;

procedure T_frmFecharCotacao.txt_NomeProdutoCotacaoClick(Sender: TObject);
begin

     Application.CreateForm(T_frmEscolhaProdutoParaFecharCotacao, _frmEscolhaProdutoParaFecharCotacao);
     _frmEscolhaProdutoParaFecharCotacao.ShowModal;
     FreeAndNil(_frmEscolhaProdutoParaFecharCotacao);

end;


procedure T_frmFecharCotacao.edt_QuantidadeProdutoCotacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     //se teclar enter e o campo qde tiver valor, insere o produto caso contrario nao faz nada

     if key = 13 then
      begin

         if not (edt_QuantidadeProdutoCotacao.Text = '') then begin

             btnInserirProdutoClick(Self);

         end else begin exit; end;

      end;

end;    



procedure T_frmFecharCotacao.InserirProduto;
var proxNumICotacao, proxNumIDParaAtualizar : integer;
begin    

    Grid_Cotacao.Enabled := true;
    proxNumICotacao      := 0;

    QuantidadeItemProdutoCotacao      := StrToFloat(edt_QuantidadeProdutoCotacao.Text);
    ValorUnitarioItemProdutoCotacao   := StrToFloat(edt_PrecoProdutoCotacao.Text);
    ValorDescontoItemProdutoCotacao   := StrToFloat(edt_PrecoDescontoProdutoCotacao.text);
    ValorLiquidoItemProdutoCotacao    := (ValorUnitarioItemProdutoCotacao - ValorDescontoItemProdutoCotacao );

    ValorTotalItemProdutoCotacao      := (ValorLiquidoItemProdutoCotacao * QuantidadeItemProdutoCotacao);



    {verifica qual o ultimo id de i_cotacao para inserir o produto com um id maior q aqueles ja estao gravados para nao dar conflito de id qdo
    voltar os registros atraves o INTO}

   if cont = 0 then
   begin

       With DM_Pesq.qry_Cod do
       begin

            Close;
            SQL.Clear;
            SQL.Add('select max(id_detalhescotacao) from i_cotacao');
            Open;

            if not IsEmpty then begin

                  proxNumICotacao := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

            end;

            cont := cont + 1;

       end;

   end else if cont > 0 then begin

       With DM_Pesq.qry_Cod do
       begin

            Close;
            SQL.Clear;
            SQL.Add('select max(id_detalhescotacao) from t_cotacao');
            Open;

            if not IsEmpty then begin

                  proxNumICotacao := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

            end;

       end;

    end;

      with dm_DadosSegundo.cds_TCotacao do
      begin

           Append;

           FieldByName('id_detalhescotacao').AsInteger   := proxNumICotacao;
           FieldByName('cotacao_id').AsInteger           := Strtoint(txt_NumCotacaoParaAbrir.Caption);
           FieldByName('produto_id').AsInteger           := strtoint(txt_IDPRODUTO.text);
           FieldByName('unitario').AsCurrency            := ValorLiquidoItemProdutoCotacao;
           FieldByName('quantidade').AsFloat             := QuantidadeItemProdutoCotacao;
           FieldByName('totalitem').AsFloat              := ValorTotalItemProdutoCotacao;
           FieldByName('flag').AsString                  := 'C';         //significa comitar o item ou seja gravar itens acrescentados em i_cotacao

           ApplyUpdates(0);

      end;


      while dm_DadosSegundo.cds_TCotacao.Eof do
      begin

            proxNumIDParaAtualizar :=  proxNumICotacao+1;

            //alterando os registro que foram gravados com flag = C em t_cotacao para flag = N
            
             _Sql:= 'UPDATE T_cotacao SET id_detalhescotacao = :proxNumID WHERE flag = '+QuotedStr('N')+'';

             With DM_Pesq.Qry_Geral do begin

                Close;
                SQL.Clear;
                SQL.Add(_Sql);
                 Params.ParamByName('proxNumID').AsInteger := proxNumIDParaAtualizar;
                ExecSQL();

              end;

      next;

             AbrirFecharTabelas;

             panel_itensCotacao.Visible := true;

      end;


end;


procedure T_frmFecharCotacao.btnGravarCotacaoClick(Sender: TObject);
begin

    GravarAtualizacaoDaCotacao;

end;

procedure T_frmFecharCotacao.GravarAtualizacaoDaCotacao;
var totalgeral : double;
begin

            totalgeral := 0;
            cont       := 0;

              //SOMANDO OS VALORES E TOTALIZANDO O VALOR DA COTACAO PARA ATUALIZACAO
           _Sql:= 'SELECT cotacao_id, sum(totalitem) FROM t_cotacao GROUP BY cotacao_id';

            With DM_Pesq.Qry_Auxiliar do begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              open;

                if not IsEmpty then
                begin

                     totalgeral :=  DM_Pesq.Qry_Auxiliar.Fields[1].Value;

                end;


            end;

           //deletando todos os registros com flag = N
           _Sql:= 'DELETE FROM t_cotacao WHERE flag = '+QuotedStr('N')+'';

            With DM_Pesq.Qry_Auxiliar do begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              ExecSQL();

            end;

             AbrirFecharTabelas;

            //copiando os registro acrescentados com flag = C
             _Sql := 'INSERT INTO i_cotacao (id_detalhescotacao, cotacao_id, produto_id, unitario, quantidade, '+
                    'totalitem, flag) select * FROM t_cotacao ';

             with DM_Pesq.Qry_Geral do
             begin

                 close;
                 sql.Clear;
                 sql.Add(_Sql);
                 ExecSQL();

             end;


             //alterando os registro que foram gravados com flag = C em i_cotacao para flag = N
             _Sql:= 'UPDATE i_cotacao SET flag = '+QuotedStr('N')+' where flag = '+QuotedStr('C')+'';

             With DM_Pesq.Qry_Geral do begin

                Close;
                SQL.Clear;
                SQL.Add(_Sql);
                ExecSQL();

              end;



           //ATUALIZANDO O VALOR DA COTACAO APOS INSER��O DE NOVOS ITENS

           _Sql:= 'UPDATE cotacao SET total = :pTotalCotacao where id_cotacao = :pIDCotacao';

           With DM_Pesq.Qry_Geral do begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              ParamByName('pTotalCotacao').Value := totalgeral;
              ParamByName('pIDCotacao').Value    := NumCotacao;
              ExecSQL();

            end;

            AbrirFecharTabelas;

            Application.MessageBox('Cota��o gravada com sucesso!', 'Gravando cota��o...', MB_OK);
            LogOperacoes(NomeDoUsuarioLogado, 'atualiza��o de cota��o');

            LimparCotacaDaTela;

            CotacaoAberta := false;

            DesabilitarBotoes;

            btnSairDaCotacao.Enabled := true;

end;



procedure T_frmFecharCotacao.Grid_CotacaoCellClick(Column: TColumn);
begin

    panel_item.Visible         := true;
    panel_total.Visible        := false;
    btnGravarCotacao.Enabled   := true;

    txt_IdDoITEM.Text          := IntToStr(dm_DadosSegundo.cds_TCotacao.FieldByName('id_detalhescotacao').AsInteger);
    txt_ValorItem.Text         := FloatToStr(dm_DadosSegundo.cds_TCotacao.FieldByName('unitario').AsFloat);
    txt_IDPRODUTODEL.Text      := IntToStr(dm_DadosSegundo.cds_TCotacao.FieldByName('produto_id').AsInteger);
    edt_quantidadeDoItem.text  := FloatToStr(dm_DadosSegundo.cds_TCotacao.FieldByName('quantidade').AsFloat);

    DesabilitarBotoes;

end;

procedure T_frmFecharCotacao.DesabilitarBotoes;
begin


      panel_item.Visible                   := true;
      panel_total.Visible                  := false;
      btnGravarCotacao.Enabled             := false;
      btnPagarCotacao.Enabled              := false;
      btnImprimirCotacao.Enabled           := false;
      btnSairDaCotacao.Enabled             := false;
      rd_desconto.Checked                  := false;
      rd_exclusaodoitem.Checked            := false;
      rd_sair.Checked                      := false;


end;

procedure T_frmFecharCotacao.HabilitarBotoes;
begin

      panel_item.Visible                   := false;
      panel_total.Visible                  := true;
      btnGravarCotacao.Enabled             := true;
      btnPagarCotacao.Enabled              := true;
      btnImprimirCotacao.Enabled           := true;
      btnSairDaCotacao.Enabled             := true;


end;

procedure T_frmFecharCotacao.btnPagarCotacaoClick(Sender: TObject);
begin

     Application.CreateForm(T_frmPagarCotacao, _frmPagarCotacao);
     _frmPagarCotacao.ShowModal;
     FreeAndNil(_frmPagarCotacao);
     
     close;

end;


procedure T_frmFecharCotacao.btnImprimirCotacaoClick(Sender: TObject);
begin

     with Q_RelImprimeCotacao.cds_RelImprimeCotacao do
     begin

        Close;
        Params.ParamByName('pIDCotacao').value  :=  NumCotacao;
        Open;

        Q_RelImprimeCotacao.cds_RelImprimeCotacao.Active := True;
        Q_RelImprimeCotacao.lblNomeUsuarioLogado.Caption := lblStatusLogoff.Caption;
        Q_RelImprimeCotacao.Preview;

     end;
     LogOperacoes(NomeDoUsuarioLogado, 'acesso a impress�o de cota��o');

end;



procedure T_frmFecharCotacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if ((ssAlt in Shift) and (Key = VK_RETURN)) then 
          Key := 0;


end;

end.




