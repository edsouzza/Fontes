unit U_GerenciarDuplicatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,DateUtils, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus, EditNum;

type
  T_frmGerenciarDuplicatas = class(TForm)
    pan_titulo: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    GridContas: TDBGrid;
    pan_botoes: TPanel;
    btnExcluir: TSpeedButton;
    btnSair: TSpeedButton;
    btnBaixar: TSpeedButton;
    edtNome: TEdit;
    panel_total: TPanel;
    imgUltimoReg: TImage;
    imgPrimeiroReg: TImage;
    lbl37: TLabel;
    cmbAnos: TComboBox;
    cmbMeses: TComboBox;
    edtValorTotal: TStaticText;
    rbPesquisar: TRadioButton;
    txtMsg: TStaticText;
    btnVoltarContinuar: TSpeedButton;
    lblStatusLogoff: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GridContasCellClick(Column: TColumn);
    procedure btnSairClick(Sender: TObject);
    procedure ExcluirDuplicata;
    procedure FormShow(Sender: TObject);
    procedure VerificarContaProximaDoVencimento;
    procedure CalcularValorTotal;
    procedure btnExcluirClick(Sender: TObject);
    procedure MostrarDadosNoGrid;
    procedure BaixarDuplicata;
    procedure PreencherComboAnos;
    procedure AtualizarCaixaAposMovimento;
    procedure imgPrimeiroRegClick(Sender: TObject);
    procedure imgUltimoRegClick(Sender: TObject);
    procedure PopularGridContas;
    procedure btnBaixarClick(Sender: TObject);
    procedure DesabilitarRadios;
    procedure FiltrarPorNome;
    procedure edtNomeChange(Sender: TObject);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbPesquisarClick(Sender: TObject);
    procedure btnVoltarContinuarClick(Sender: TObject);
    procedure edtNomeClick(Sender: TObject);
    procedure FiltrarPorDuplicata;
    procedure FiltrarRegistrosNaDigitacao;


  private
    { Private declarations }
    mesSelecionado, anoSelecionado, mesAnoSelecionado, nome : string;
    DataAtual : TDateEdit;

  public
    { Public declarations }

    ValorSaldoAtualAposMovto,ValorSaldoAnterior,ValorMovimento, valorParcela    : double;
    NumDuplicata : string;
    IDContaSelecionada : integer;

    procedure MostrarDuplicatasAbertasPeloMesAnoSelecionado;
    procedure MostrarDuplicatasPagasPeloMesAnoSelecionado;
    procedure MostrarDuplicatasPeloMesAnoSelecionado;
    procedure MostrarDuplicatasVencidasPeloMesAnoSelecionado;
    procedure MostrarDuplicatasNaoVencidasPeloMesAnoSelecionado;


  end;

var
  _frmGerenciarDuplicatas: T_frmGerenciarDuplicatas;
            

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo, SqlExpr,DBClient, U_principal, DB, U_FecharPedido,
  U_EscolhaTipoPesquisaDuplicatas;


{$R *.dfm}

procedure T_frmGerenciarDuplicatas.FormCreate(Sender: TObject);
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
    DataAtual                    := TDateEdit.Create(self);
    DataAtual.Date               := date;

    AbrirTabelas;

end;

procedure T_frmGerenciarDuplicatas.FormShow(Sender: TObject);
begin     

      PreencherComboAnos;
      Caption := 'LOGADO POR '+NomeDoUsuarioLogado;
      VerificarContaProximaDoVencimento;
      edtNome.SetFocus;

end;


procedure T_frmGerenciarDuplicatas.VerificarContaProximaDoVencimento;
var
  Dia_Atual, Trez_Proximos_Dias, Mes_Atual  : string;
begin

          // ESSE PROCEDIMENTO MOSTRAR� NA TELA INICIAL AS DUPLICATAS COM VENCIMENTO DO DIA E DOS TRES PROXIMOS

          DataDoDia           := date;
          Trez_Proximos_Dias  := IntToStr(DayOf(DataDoDia)+3);
          Dia_Atual           := IntToStr(DayOf(DataDoDia));
          Mes_Atual           := IntToStr(MonthOf(DataDoDia));   

         _Sql := 'SELECT d.id_duplicata, d.pedido_id, d.num_duplicata, d.valor, d.dtvencimento, d.dtpagamento, d.datacad, d.mesano, d.status, '+
                 'c.id_pedido, c.fornecedor_id, f.forne_id, f.forne_nome, EXTRACT(DAY FROM d.dtvencimento), EXTRACT(MONTH FROM d.dtvencimento) '+
                 'FROM duplicatas d, c_pedido c, fornecedores f WHERE EXTRACT(DAY FROM d.dtvencimento) BETWEEN :pDia AND :pDiasProximos AND '+
                 'EXTRACT(MONTH FROM d.dtvencimento) = :pMes AND d.status = '+QuotedStr('PENDENTE')+' AND d.pedido_id = c.id_pedido AND '+
                 'c.fornecedor_id = f.forne_id ORDER BY EXTRACT(DAY FROM d.dtvencimento) DESC';          


         with DM_Pesq.cdsPesqGeral do
         begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pDia').AsString          := Dia_Atual;
            Params.ParamByName('pDiasProximos').AsString := Trez_Proximos_Dias;
            Params.ParamByName('pMes').AsString          := Mes_Atual;
            Open;

             //se encontrar duplicatas com vencimento de hoje a trez dias
             if not IsEmpty then
             begin

                  with txtMsg do
                  begin

                    Width   := 991;
                    Caption := 'Duplicatas com vencimento do dia e/ou dos tr�s pr�ximos requerem sua aten��o. Clique em continuar...';
                    Visible := True;

                  end;

                  MostrarDadosNoGrid;
                  CalcularValorTotal;

                  GridContas.Enabled         := false;
                  btnVoltarContinuar.Enabled := true;
                  btnVoltarContinuar.Caption := 'Continuar';
                  btnSair.Enabled            := false;
                  pan_titulo.Caption         := 'Duplicatas com vencimento do dia e/ou dos tr�s pr�ximos';


             end else
             begin

                PopularGridContas;
                CalcularValorTotal;      

             end;

         end;

end;

procedure T_frmGerenciarDuplicatas.PreencherComboAnos;
var
  i : integer;
  AnoAtual, mesAtual : string;
begin

     //populando a comboano com os anos
     for i := 2000 to 3000 do
     begin

          cmbAnos.Items.Add(inttostr(i));

     end;

     DataDoDia    := date;

      //setando o ano vigente na comboano
     AnoAtual            := IntToStr(YearOf(DataDoDia));
     cmbAnos.ItemIndex   := Integer( cmbAnos.Items.IndexOf(AnoAtual) );


      //setando o mes vigente na combomes
      mesAtual           := IntToStr(MonthOf(DataDoDia));
      cmbMeses.ItemIndex := StrToInt(mesAtual)-1;
    
end;


procedure T_frmGerenciarDuplicatas.PopularGridContas;
begin

       _Sql := 'SELECT d.*, c.id_pedido, c.fornecedor_id, f.forne_id, f.forne_nome FROM duplicatas d, c_pedido c, fornecedores f '+
               'WHERE d.pedido_id = c.id_pedido AND c.fornecedor_id = f.forne_id AND d.status = '+QuotedStr('PENDENTE')+' ORDER BY d.dtvencimento';

       with DM_Pesq.cdsPesqGeral do
       begin

            Close;
            CommandText:= (_Sql);
            Open;

        end;

        TFloatField(DM_Pesq.cdsPesqGeral.FieldByName('valor')).DisplayFormat := '#,##0.00';

        with GridContas do
        begin

          DataSource:=  DM_Pesq.dsPesqGeral;
          Columns.Clear;

          Columns.Add;
          Columns[0].FieldName         := 'NUM_DUPLICATA';
          Columns[0].Width             := 100;
          Columns[0].Font.color        := clblue;
          Columns[0].Font.Style        := [fsBold];
          Columns[0].Alignment         := taLeftJustify;
          Columns[0].Title.caption     := 'DUPLICATA';
          Columns[0].Title.Font.Style  := [fsBold];
          Columns[0].Title.Alignment   := taLeftJustify;

          Columns.Add;
          Columns[1].FieldName         := 'FORNE_NOME';
          Columns[1].Width             := 350;
          Columns[1].Font.color        := clblue;
          Columns[1].Font.Style        := [fsBold];
          Columns[1].Alignment         := taLeftJustify;
          Columns[1].Title.caption     := 'CREDOR';
          Columns[1].Title.Font.Style  := [fsBold];
          Columns[1].Title.Alignment   := taLeftJustify;

          Columns.Add;
          Columns[2].FieldName         := 'MESANO';
          Columns[2].Width             := 100;
          Columns[2].Font.color        := clblue;
          Columns[2].Font.Style        := [fsBold];
          Columns[2].Alignment         := taCenter;
          Columns[2].Title.caption     := 'MES';
          Columns[2].Title.Font.Style  := [fsBold];
          Columns[2].Title.Alignment   := taCenter;

          Columns.Add;
          Columns[3].FieldName         := 'DTVENCIMENTO';
          Columns[3].Width             := 110;
          Columns[3].Font.color        := clblue;
          Columns[3].Font.Style        := [fsBold];
          Columns[3].Alignment         := taCenter;
          Columns[3].Title.caption     := 'VENCIMENTO';
          Columns[3].Title.Font.Style  := [fsBold];
          Columns[3].Title.Alignment   := taCenter;

          Columns.Add;
          Columns[4].FieldName         := 'DTPAGAMENTO';
          Columns[4].Width             := 110;
          Columns[4].Font.color        := clblue;
          Columns[4].Font.Style        := [fsBold];
          Columns[4].Alignment         := taCenter;
          Columns[4].Title.caption     := 'PAGAMENTO';
          Columns[4].Title.Font.Style  := [fsBold];
          Columns[4].Title.Alignment   := taCenter;

          Columns.Add;
          Columns[5].FieldName         := 'STATUS';
          Columns[5].Width             := 100;
          Columns[5].Font.color        := clblue;
          Columns[5].Font.Style        := [fsBold];
          Columns[5].Alignment         := taCenter;
          Columns[5].Title.caption     := 'STATUS';
          Columns[5].Title.Font.Style  := [fsBold];
          Columns[5].Title.Alignment   := taCenter;

          Columns.Add;
          Columns[6].FieldName         := 'VALOR';
          Columns[6].Width             := 100;
          Columns[6].Font.color        := clblue;
          Columns[6].Font.Style        := [fsBold];
          Columns[6].Alignment         := taRightJustify;
          Columns[6].Title.caption     := 'VALOR';
          Columns[6].Title.Font.Style  := [fsBold];
          Columns[6].Title.Alignment   := taRightJustify;

          Options := [dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection];

        end;

        pan_titulo.Caption := 'Lista de todos as duplicatas que est�o em aberto';

end;


procedure T_frmGerenciarDuplicatas.AbrirTabelas;
begin

    dm_Conexao.cds_Duplicatas.Active   := true;
    dm_Conexao.cds_Caixa.Active        := true;

end;

procedure T_frmGerenciarDuplicatas.FecharTabelas;
begin

    dm_Conexao.cds_Duplicatas.Active   := false;
    dm_Conexao.cds_Caixa.Active        := false;

end;

procedure T_frmGerenciarDuplicatas.FecharAbrirTabelas;
begin

    dm_Conexao.cds_Duplicatas.Active  := false;
    dm_Conexao.cds_Duplicatas.Active  := true;

    dm_Conexao.cds_Caixa.Active       := false;
    dm_Conexao.cds_Caixa.Active       := true;

end;

procedure T_frmGerenciarDuplicatas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    release;

end;

procedure T_frmGerenciarDuplicatas.FormKeyPress(Sender: TObject;
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

procedure T_frmGerenciarDuplicatas.GridContasCellClick(
  Column: TColumn);
begin

    IDContaSelecionada           := DM_Pesq.cdsPesqGeral.FieldByName('ID_DUPLICATA').AsInteger;   //ID_DUPLICATA
    ValorMovimento               := DM_Pesq.cdsPesqGeral.FieldByName('VALOR').AsFloat;
    NomeFornecedorGerarDuplicata := DM_Pesq.cdsPesqGeral.FieldByName('FORNE_NOME').AsString;
    NumDuplicata                 := DM_Pesq.cdsPesqGeral.FieldByName('NUM_DUPLICATA').AsString;
    btnExcluir.Enabled           := true;
    btnBaixar.Enabled            := true;

end;

procedure T_frmGerenciarDuplicatas.btnBaixarClick(Sender: TObject);
begin

      With DM_Pesq.Qry_Geral do
      begin

          Close;
          SQL.Clear;
          SQL.Add('SELECT id_duplicata,status FROM duplicatas WHERE id_duplicata = :pIDDuplicata AND status = '+QuotedStr('PENDENTE')+'');
          Params.ParamByName('pIDDuplicata').AsInteger :=  IDContaSelecionada;
          Open;

              if not IsEmpty then begin

                 BaixarDuplicata;
                 AtualizarCaixaAposMovimento;
                 CalcularValorTotal;

              end else begin

                 Application.MessageBox('A duplicata selecionada j� esta finalizada!', 'Aten��o verifique...!', MB_OK);

              end;

       end;

       DesabilitarRadios;

end;

procedure T_frmGerenciarDuplicatas.BaixarDuplicata;
begin

       //baixar duplicata significa que o operador esta pagando-a e o valor deve ser debitado no caixa
       
       texto:= 'Confirma a baixa da duplicata selecionada?';

       if Application.MessageBox(PChar(texto),'Pagando a duplicata',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

           with DM_Pesq.Qry_Geral do
           begin

                close;
                sql.Clear;
                sql.Add('UPDATE duplicatas SET dtpagamento = :datapagto, status = '+QuotedStr('FINALIZADO')+' WHERE id_duplicata = :pIDDuplicata');
                Params.ParamByName('datapagto').AsDate       := date;
                Params.ParamByName('pIDDuplicata').AsInteger := IDContaSelecionada;
                ExecSQL();

           end;

           Application.MessageBox('A duplicata foi baixada com sucesso!', 'OK!', MB_OK);
           LogOperacoes(NomeDoUsuarioLogado, 'baixa de duplicata');
           DesabilitarRadios;
           FecharAbrirTabelas;
           
       end else begin

           DesabilitarRadios;

       end;

       VerificarContaProximaDoVencimento;

end;

procedure T_frmGerenciarDuplicatas.AtualizarCaixaAposMovimento;
begin

          //VERIFICAR O VALOR DO SALDO ANTERIOR (ULTIMO REGISTRO)

            _Sql := 'select id_caixa, saldo_atual from caixa WHERE '+
                    'id_caixa = (select max(id_caixa) from caixa)';


           With DM_Pesq.Qry_Geral do
           begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              Open;

                  if not IsEmpty then begin

                       ValorSaldoAnterior := DM_Pesq.Qry_Geral.Fields[1].Value;

                  end;

           end;

           ValorSaldoAtualAposMovto := ( ValorSaldoAnterior - ValorMovimento );

           // ATUALIZANDO O CAIXA
           With DM_Pesq.qry_Cod do begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_caixa) from caixa');
              Open;

              if not IsEmpty then begin

                 proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;


            with dm_Conexao.cds_Caixa do
            begin

                Append;
                FieldByName('id_caixa').AsInteger        := proxNum;
                FieldByName('id_venda').AsInteger        := 0;
                FieldByName('saldo_anterior').AsFloat    := ValorSaldoAnterior;
                FieldByName('valor_movimento').AsFloat   := -ValorMovimento;
                FieldByName('saldo_atual').AsFloat       := ValorSaldoAtualAposMovto;
                FieldByName('data').AsDateTime           := date;
                FieldByName('status').AsString           := 'A';
                FieldByName('historico').AsString        := 'PAGAMENTO DA DUPLICATA N�'+NumDuplicata;

                ApplyUpdates(0);

            end;

            FecharAbrirTabelas;

end;


procedure T_frmGerenciarDuplicatas.btnSairClick(Sender: TObject);
begin

    DataAtual.Free;
    close;
    release;

end;

procedure T_frmGerenciarDuplicatas.btnExcluirClick(Sender: TObject);
begin

    ExcluirDuplicata;

end;

procedure T_frmGerenciarDuplicatas.ExcluirDuplicata;
var
  texto : string;
begin

       texto:= 'Confirma a exclus�o da duplicata selecionada?';

       if Application.MessageBox(PChar(texto),'Exclus�o de duplicatas',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

           with DM_Pesq.Qry_Geral do
           begin

                close;
                sql.Clear;
                sql.Add('DELETE FROM duplicatas WHERE id_duplicata = :pIDDuplicata');
                Params.ParamByName('pIDDuplicata').AsInteger         := IDContaSelecionada;
                ExecSQL();

           end;

           Application.MessageBox('A duplicata foi exclu�da com sucesso!', 'OK!', MB_OK);
           LogOperacoes(NomeDoUsuarioLogado, 'exclus�o de duplicata');
           DesabilitarRadios;
           VerificarContaProximaDoVencimento;
           CalcularValorTotal;

       end else
       begin

          btnExcluir.Enabled := false;
          FecharAbrirTabelas;
          DesabilitarRadios;
          CalcularValorTotal;

      end;   
      
end;

procedure T_frmGerenciarDuplicatas.CalcularValorTotal;
var
   Total : double;
begin

      Total := 0;

      while not DM_Pesq.cdsPesqGeral.eof do
      begin

           Total := ( Total + DM_Pesq.cdsPesqGeral.fieldbyname('valor').asFloat );
           DM_Pesq.cdsPesqGeral.Next;
           edtValorTotal.Caption := Transform(Total);

      end;

end;

procedure T_frmGerenciarDuplicatas.imgPrimeiroRegClick(Sender: TObject);
begin

    DM_Pesq.cdsPesqGeral.First;

end;

procedure T_frmGerenciarDuplicatas.imgUltimoRegClick(Sender: TObject);
begin

    DM_Pesq.cdsPesqGeral.last;    
    
end;    


procedure T_frmGerenciarDuplicatas.MostrarDadosNoGrid;
begin

        TFloatField(DM_Pesq.cdsPesqGeral.FieldByName('valor')).DisplayFormat := '##0.00';

        with GridContas do
        begin

              DataSource:=  DM_Pesq.dsPesqGeral;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName         := 'NUM_DUPLICATA';
              Columns[0].Width             := 100;
              Columns[0].Font.color        := clblue;
              Columns[0].Font.Style        := [fsBold];
              Columns[0].Alignment         := taLeftJustify;
              Columns[0].Title.caption     := 'DUPLICATA';
              Columns[0].Title.Font.Style  := [fsBold];
              Columns[0].Title.Alignment   := taLeftJustify;

              Columns.Add;
              Columns[1].FieldName         := 'FORNE_NOME';
              Columns[1].Width             := 350;
              Columns[1].Font.color        := clblue;
              Columns[1].Font.Style        := [fsBold];
              Columns[1].Alignment         := taLeftJustify;
              Columns[1].Title.caption     := 'CREDOR';
              Columns[1].Title.Font.Style  := [fsBold];
              Columns[1].Title.Alignment   := taLeftJustify;

              Columns.Add;
              Columns[2].FieldName         := 'MESANO';
              Columns[2].Width             := 100;
              Columns[2].Font.color        := clblue;
              Columns[2].Font.Style        := [fsBold];
              Columns[2].Alignment         := taCenter;
              Columns[2].Title.caption     := 'MES';
              Columns[2].Title.Font.Style  := [fsBold];
              Columns[2].Title.Alignment   := taCenter;

              Columns.Add;
              Columns[3].FieldName         := 'DTVENCIMENTO';
              Columns[3].Width             := 110;
              Columns[3].Font.color        := clblue;
              Columns[3].Font.Style        := [fsBold];
              Columns[3].Alignment         := taCenter;
              Columns[3].Title.caption     := 'VENCIMENTO';
              Columns[3].Title.Font.Style  := [fsBold];
              Columns[3].Title.Alignment   := taCenter;

              Columns.Add;
              Columns[4].FieldName         := 'DTPAGAMENTO';
              Columns[4].Width             := 110;
              Columns[4].Font.color        := clblue;
              Columns[4].Font.Style        := [fsBold];
              Columns[4].Alignment         := taCenter;
              Columns[4].Title.caption     := 'PAGAMENTO';
              Columns[4].Title.Font.Style  := [fsBold];
              Columns[4].Title.Alignment   := taCenter;

              Columns.Add;
              Columns[5].FieldName         := 'STATUS';
              Columns[5].Width             := 100;
              Columns[5].Font.color        := clblue;
              Columns[5].Font.Style        := [fsBold];
              Columns[5].Alignment         := taCenter;
              Columns[5].Title.caption     := 'STATUS';
              Columns[5].Title.Font.Style  := [fsBold];
              Columns[5].Title.Alignment   := taCenter;

              Columns.Add;
              Columns[6].FieldName         := 'VALOR';
              Columns[6].Width             := 100;
              Columns[6].Font.color        := clblue;
              Columns[6].Font.Style        := [fsBold];
              Columns[6].Alignment         := taRightJustify;
              Columns[6].Title.caption     := 'VALOR';
              Columns[6].Title.Font.Style  := [fsBold];
              Columns[6].Title.Alignment   := taRightJustify;

        end;

        CalcularValorTotal;

end;

procedure T_frmGerenciarDuplicatas.rbPesquisarClick(Sender: TObject);
begin

   Application.CreateForm(T_frmEscolhaTipoDePesquisaDuplicatas,  _frmEscolhaTipoDePesquisaDuplicatas);
   _frmEscolhaTipoDePesquisaDuplicatas.ShowModal;
   FreeAndNil(_frmEscolhaTipoDePesquisaDuplicatas);
   LogOperacoes(NomeDoUsuarioLogado, 'acesso as pesquisas de duplicatas');

   rbPesquisar.Checked := false;


end;

procedure T_frmGerenciarDuplicatas.DesabilitarRadios;
begin

    btnExcluir.Enabled    := false;
    btnBaixar.Enabled     := false;

end;


procedure T_frmGerenciarDuplicatas.edtNomeChange(Sender: TObject);
begin

   FiltrarRegistrosNaDigitacao;

end;

procedure T_frmGerenciarDuplicatas.FiltrarPorNome;
var
  nome : string;
begin

       nome := edtNome.Text;

       _Sql := 'SELECT d.*, c.id_pedido, c.fornecedor_id, f.forne_id, f.forne_nome FROM duplicatas d, c_pedido c, fornecedores f '+
               'WHERE d.pedido_id = c.id_pedido AND c.fornecedor_id = f.forne_id AND d.status = '+QuotedStr('PENDENTE')+' '+
               'AND f.forne_nome LIKE (''%'+nome+'%'') ORDER BY d.dtvencimento';


      with DM_Pesq.cdsPesqGeral do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

       TFloatField(DM_Pesq.cdsPesqGeral.FieldByName('valor')).DisplayFormat := '#,##0.00';
       CalcularValorTotal;

end;

procedure T_frmGerenciarDuplicatas.FiltrarPorDuplicata;
begin

      nome := edtNome.Text;

      _Sql := 'SELECT d.*, c.id_pedido, c.fornecedor_id, f.forne_id, f.forne_nome FROM duplicatas d, c_pedido c, fornecedores f '+
               'WHERE d.pedido_id = c.id_pedido AND c.fornecedor_id = f.forne_id AND d.status = '+QuotedStr('PENDENTE')+' '+
               'AND d.num_duplicata LIKE (''%'+nome+'%'') ORDER BY d.dtvencimento';

      with DM_Pesq.cdsPesqGeral do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

      TFloatField(DM_Pesq.cdsPesqGeral.FieldByName('valor')).DisplayFormat := '#,##0.00';
      CalcularValorTotal;

end;

procedure T_frmGerenciarDuplicatas.FiltrarRegistrosNaDigitacao;
begin

     if ( StrToIntDef(edtNome.Text, 0) = 0 ) then
      begin

         FiltrarPorNome;        //so digitou letras

      end else
      begin

         FiltrarPorDuplicata;  //so digitou n�meros

      end;


end;


procedure T_frmGerenciarDuplicatas.edtNomeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if KEY = VK_RETURN then
     begin

          edtNome.Clear;
          TFloatField(DM_Pesq.cdsPesqGeral.FieldByName('valor')).DisplayFormat := '#,##0.00';

      end;

end;

procedure T_frmGerenciarDuplicatas.MostrarDuplicatasPeloMesAnoSelecionado;
begin

     mesSelecionado    := cmbMeses.Text;
     anoSelecionado    := cmbAnos.Text;
     mesAnoSelecionado := mesSelecionado +'/'+ anoSelecionado;


     _Sql := 'SELECT d.*, c.id_pedido, c.fornecedor_id, f.forne_id, f.forne_nome FROM duplicatas d, c_pedido c, fornecedores f '+
            'WHERE d.pedido_id = c.id_pedido AND c.fornecedor_id = f.forne_id '+
            'AND d.mesano = :pMesAno ORDER BY d.dtvencimento';

         with DM_Pesq.cdsPesqGeral do
         begin

             close;
             CommandText := _Sql;
             Params.ParamByName('pMesAno').AsString := mesAnoSelecionado;
             open;

            if not IsEmpty then
            begin

                  MostrarDadosNoGrid;
                  pan_titulo.Caption := 'Duplicatas do m�s e ano selecionados';

            end else begin

                GridContas.DataSource      := nil;
                edtValorTotal.Caption      := '0,00';
                btnVoltarContinuar.Enabled := true;
                btnVoltarContinuar.Caption := 'Voltar';
                btnSair.Enabled            := false;
                PreencherComboAnos;

                with txtMsg do
                begin

                  Width   := 991;
                  Caption := 'A consulta n�o retornou resultados de duplicatas cadastradas em '+ mesAnoSelecionado;
                  Visible := True;

                end;

                pan_titulo.Caption := 'Duplicatas pelo m�s e ano selecionados';

           end;  

     end;

end;


procedure T_frmGerenciarDuplicatas.MostrarDuplicatasVencidasPeloMesAnoSelecionado;
begin

     mesSelecionado    := cmbMeses.Text;
     anoSelecionado    := cmbAnos.Text;
     mesAnoSelecionado := mesSelecionado +'/'+ anoSelecionado;    // se refere a data de cadastramento


    _Sql := 'SELECT d.*, c.id_pedido, c.fornecedor_id, f.forne_id, f.forne_nome FROM duplicatas d, c_pedido c, fornecedores f '+
            'WHERE d.pedido_id = c.id_pedido AND c.fornecedor_id = f.forne_id AND d.status = '+QuotedStr('PENDENTE')+' AND d.dtvencimento < :dataAtual '+
            'AND d.mesano = :pMesAno ORDER BY d.dtvencimento';


     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText := _Sql;
         Params.ParamByName('pMesAno').AsString     := mesAnoSelecionado;
         Params.ParamByName('dataAtual').AsDateTime := DataAtual.Date;
         open;

         if not IsEmpty then
         begin

              MostrarDadosNoGrid;
              pan_titulo.Caption := 'Duplicatas vencidas do m�s e ano selecionados';

        end else begin

            GridContas.DataSource      := nil;
            edtValorTotal.Caption      := '0,00';
            btnVoltarContinuar.Enabled := true;
            btnVoltarContinuar.Caption := 'Voltar';
            btnSair.Enabled            := false;
            PreencherComboAnos;

            with txtMsg do
            begin

              Width   := 991;
              Caption := 'A consulta n�o retornou resultados de duplicatas vencidas e cadastradas em '+ mesAnoSelecionado;
              Visible := True;

            end;

            pan_titulo.Caption := 'Duplicatas vencidas do m�s e ano selecionados';

       end;

     end;
end;


procedure T_frmGerenciarDuplicatas.MostrarDuplicatasNaoVencidasPeloMesAnoSelecionado;
begin

     mesSelecionado    := cmbMeses.Text;
     anoSelecionado    := cmbAnos.Text;
     mesAnoSelecionado := mesSelecionado +'/'+ anoSelecionado;    // se refere a data de cadastramento


    _Sql := 'SELECT d.*, c.id_pedido, c.fornecedor_id, f.forne_id, f.forne_nome FROM duplicatas d, c_pedido c, fornecedores f '+
            'WHERE d.pedido_id = c.id_pedido AND c.fornecedor_id = f.forne_id AND d.status = '+QuotedStr('PENDENTE')+' AND d.dtvencimento >= :dataAtual '+
            'AND d.mesano = :pMesAno ORDER BY d.dtvencimento';


     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText := _Sql;
         Params.ParamByName('pMesAno').AsString     := mesAnoSelecionado;
         Params.ParamByName('dataAtual').AsDateTime := DataAtual.Date;
         open;

        if not IsEmpty then
        begin

              MostrarDadosNoGrid;
              pan_titulo.Caption := 'Duplicatas n�o vencidas do m�s e ano selecionados';

        end else begin

            GridContas.DataSource      := nil;
            edtValorTotal.Caption      := '0,00';
            btnVoltarContinuar.Enabled := true;
            btnVoltarContinuar.Caption := 'Voltar';
            btnSair.Enabled            := false;
            PreencherComboAnos;

            with txtMsg do
            begin

              Width   := 991;
              Caption := 'A consulta n�o retornou resultados de duplicatas n�o vencidas e cadastradas em '+ mesAnoSelecionado;
              Visible := True;

            end;

            pan_titulo.Caption := 'Duplicatas n�o vencidas do m�s e ano selecionados';

       end;

     end;

end;


procedure T_frmGerenciarDuplicatas.MostrarDuplicatasPagasPeloMesAnoSelecionado;
begin


     mesSelecionado    := cmbMeses.Text;
     anoSelecionado    := cmbAnos.Text;
     mesAnoSelecionado := mesSelecionado +'/'+ anoSelecionado;    // se refere a data de cadastramento


    _Sql := 'SELECT d.*, c.id_pedido, c.fornecedor_id, f.forne_id, f.forne_nome FROM duplicatas d, c_pedido c, fornecedores f '+
            'WHERE d.pedido_id = c.id_pedido AND c.fornecedor_id = f.forne_id AND d.status = '+QuotedStr('FINALIZADO')+' '+
            'AND d.mesano = :pMesAno ORDER BY d.dtvencimento';


    with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText := _Sql;
         Params.ParamByName('pMesAno').AsString := mesAnoSelecionado;
         open;

        if not IsEmpty then
        begin

              MostrarDadosNoGrid;
              pan_titulo.Caption := 'Duplicatas baixadas e quitadas do m�s e ano selecionados';

        end else begin

            GridContas.DataSource      := nil;
            edtValorTotal.Caption      := '0,00';
            btnVoltarContinuar.Enabled := true;
            btnVoltarContinuar.Caption := 'Voltar';
            btnSair.Enabled            := false;
            PreencherComboAnos;

            with txtMsg do
            begin

              Width   := 991;
              Caption := 'A consulta n�o retornou resultados de duplicatas baixadas e cadastradas em '+ mesAnoSelecionado;
              Visible := True;

            end;

            pan_titulo.Caption := 'Duplicatas baixadas e quitadas do m�s e ano selecionados';

       end;

     end;

end;


procedure T_frmGerenciarDuplicatas.MostrarDuplicatasAbertasPeloMesAnoSelecionado;
begin

     mesSelecionado    := cmbMeses.Text;
     anoSelecionado    := cmbAnos.Text;
     mesAnoSelecionado := mesSelecionado +'/'+ anoSelecionado;    // se refere a data de cadastramento


    _Sql := 'SELECT d.*, c.id_pedido, c.fornecedor_id, f.forne_id, f.forne_nome FROM duplicatas d, c_pedido c, fornecedores f '+
            'WHERE d.pedido_id = c.id_pedido AND c.fornecedor_id = f.forne_id AND d.status = '+QuotedStr('PENDENTE')+' '+
            'AND d.mesano = :pMesAno ORDER BY d.dtvencimento';


     with DM_Pesq.cdsPesqGeral do
     begin

         close;
         CommandText := _Sql;
         Params.ParamByName('pMesAno').AsString := mesAnoSelecionado;
         open;

        if not IsEmpty then
        begin

              MostrarDadosNoGrid;
              pan_titulo.Caption := 'Duplicatas em aberto do m�s e ano selecionados';

        end else begin

            GridContas.DataSource      := nil;
            edtValorTotal.Caption      := '0,00';
            btnVoltarContinuar.Enabled := true;
            btnVoltarContinuar.Caption := 'Voltar';
            btnSair.Enabled            := false;
            PreencherComboAnos;

            with txtMsg do
            begin

              Width   := 991;
              Caption := 'A consulta n�o retornou resultados de duplicatas em aberto e cadastradas em '+ mesAnoSelecionado;
              Visible := True;

            end;

            pan_titulo.Caption := 'Duplicatas em aberto do m�s e ano selecionados';


       end;

     end;


end;

procedure T_frmGerenciarDuplicatas.btnVoltarContinuarClick(
  Sender: TObject);
begin

     GridContas.Enabled         := true;
     txtMsg.Visible             := false;
     pan_botoes.Enabled         := true;
     btnSair.Enabled            := true;
     btnVoltarContinuar.Caption := 'Voltar';
     btnVoltarContinuar.Enabled := false;

     PopularGridContas;
     CalcularValorTotal;

end;

procedure T_frmGerenciarDuplicatas.edtNomeClick(Sender: TObject);
begin

  edtNome.Clear;
  
end;



end.





