unit U_ConsOrcamentosCancelados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ToolEdit;

type
  T_frmConsOrcamentosCancelados = class(TForm)
    pan_titulo: TPanel;
    pangrid_atendimentos: TPanel;
    pan_botoes: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    lblStatusLogoff: TLabel;
    grid_Lista: TDBGrid;
    GroupBox1: TGroupBox;
    btnFechar: TSpeedButton;
    btnPesquisar: TSpeedButton;
    grDatas: TGroupBox;
    lbl52: TLabel;
    edt_DataInicio: TDateEdit;
    lbl53: TLabel;
    edt_DataFim: TDateEdit;

    //procedimentos perso
    procedure PesquisarPeriodo(DataInicio, DataFim : TDate);
    procedure PopularGridTelaInicial;
    procedure PopularGridPesquisado;
    procedure ReativarOrcamento;

    //procedimentos padrao
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure grid_ListaCellClick(Column: TColumn);
    procedure edt_DataInicioChange(Sender: TObject);
    procedure grid_ListaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);



  private
    { Private declarations }
    sqlDefalt,sqlPesquisa : string;
  public
    { Public declarations }
     NumOrcamentoSelecionado,IDCliente : integer;
  end;

var
  _frmConsOrcamentosCancelados: T_frmConsOrcamentosCancelados;


implementation

uses U_dmDados,  U_dmPesquisas, U_dmDadosSegundo,
  U_BiblioSysSalao,  U_principal, DBClient, U_QRelCotacaoPeriodo,
  U_FecharCotacao, U_Cotacao, U_orcamento,
  U_AtualizarFecharOrcamento, DB, U_QRelOrcamentoPeriodo;

{$R *.dfm}


procedure T_frmConsOrcamentosCancelados.FormCreate(Sender: TObject);
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
    lblDataDoDia.Caption    :=  DateToStr(date);
    lblHoraAtual.Caption    :=  timetoStr(time);
    lblStatusLogoff.Caption :=  IdentificarUsuarioLogado;
    edt_DataInicio.Date     :=  date;
    edt_DataFim.Date        :=  date;

end;

procedure T_frmConsOrcamentosCancelados.FormShow(Sender: TObject);
begin

    DM_Pesq.cdsPesqListaOrcamentos.Active := true;
    Caption := 'LOGADO POR '+NomeDoUsuarioLogado;
    PopularGridTelaInicial;

end;

procedure T_frmConsOrcamentosCancelados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    DM_Pesq.cdsPesqListaOrcamentos.Active := false;
    Release;

end;

procedure T_frmConsOrcamentosCancelados.btnFecharClick(Sender: TObject);
begin

      if btnFechar.Caption = 'Limpar' then
      begin

          grDatas.Enabled                   := true;
          //edt_DataInicio.Text               := '  /  /    ';
          edt_DataInicio.SetFocus;
          btnFechar.Caption                 := 'Sair';
          grid_Lista.Enabled                := true;
          edt_DataFim.Date                  :=  date;
          btnFechar.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_sair.bmp');
          PopularGridTelaInicial;

      end else
      begin
         Close;                 
      end;         

end;

procedure T_frmConsOrcamentosCancelados.PesquisarPeriodo(DataInicio, DataFim : TDate);
begin

     sqlPesquisa := 'SELECT O.*, CL.CLI_ID, CL.CLI_NOME FROM ORCAMENTO O, CLIENTES CL WHERE O.ID_CLIENTE = CL.CLI_ID '+
                    'AND O.STATUS = :pStatus AND O.DATA BETWEEN :pDATAINICIAL AND :pDATAFINAL ORDER BY O.DATA';


     with DM_Pesq.cdsPesqListaOrcamentos do
     begin

          Close;
          CommandText:= sqlPesquisa;
          params.ParamByName('pStatus').AsString    :='DESAPROVADO';
          Params.ParamByName('pdatainicial').AsDate := DataInicio;
          Params.ParamByName('pdatafinal').AsDate   := DataFim;
          Open;

        if not IsEmpty then
        begin

                 PopularGridPesquisado;
                 grDatas.Enabled     := false;
                 btnFechar.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_inicio.bmp');

         end else
         begin

                  Application.MessageBox('Não foram encontrados  registros  com  status DESAPROVADO  no  período selecionado por favor verifique se o período esta correto!',
                 'Atenção...', MB_OK + MB_ICONWARNING);
                  btnFechar.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_inicio.bmp');
                  grDatas.Enabled     := false;
                  grid_Lista.Enabled  := false;
                  exit;

         end;

     end;  

end;


procedure T_frmConsOrcamentosCancelados.btnPesquisarClick(Sender: TObject);
begin
        DataInicio := edt_datainicio.Date;
        DataFim    := edt_DataFim.Date;

        if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
        begin
                  Application.MessageBox('É necessário uma data inicial e uma data final para efetuar a pesquisa !', 'Período Inválido!', MB_OK);
                  //edt_datainicio.text          := '  /  /    ';
                  edt_DataFim.Date             := date;
                  edt_DataInicio.SetFocus;

        end
        else if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                 PesquisarPeriodo(DataInicio,DataFim);
                 grid_Lista.Enabled                := true;
                 btnPesquisar.Enabled              := false;
                 btnFechar.Caption                 := 'Limpar';

        end else begin

          Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
          //edt_datainicio.text := '  /  /    ';
          edt_DataFim.Date    := date;
          edt_DataInicio.SetFocus;

       end;

end;

procedure T_frmConsOrcamentosCancelados.grid_ListaCellClick(
  Column: TColumn);
begin

       //peguei os valores do relatorio pq ao clicar o mesmo ja é aberto e contem os valores necessarios
       //o grid foi carregado com os dados desse relatorio

       NumOrcamentoSelecionado   := DM_Pesq.cdsPesqListaOrcamentos.FieldByName('ID_ORCAMENTO').AsInteger;
       IDCliente                 := DM_Pesq.cdsPesqListaOrcamentos.FieldByName('ID_CLIENTE').AsInteger;
       nomeCliente               := DM_Pesq.cdsPesqListaOrcamentos.FieldByName('CLI_NOME').AsString;
       ReativarOrcamento;


end;

procedure T_frmConsOrcamentosCancelados.ReativarOrcamento;
var texto : string;
begin

         texto:= 'Confirma o desejo de reativar o orçamento Nº '+IntToStr(NumOrcamentoSelecionado)+' do cliente '+nomeCliente+'?';

         if Application.MessageBox(PChar(texto),'Reativando orçamento',MB_YESNO + MB_ICONQUESTION) = IdYes then
         begin

              _Sql:= 'UPDATE orcamento SET status = :pStatus where id_orcamento = :pID';

               With DM_Pesq.Qry_Geral do begin

                  Close;
                  SQL.Clear;
                  SQL.Add(_Sql);
                  ParamByName('pStatus').Value       := 'PENDENTE';
                  ParamByName('pID').Value           := NumOrcamentoSelecionado;
                  ExecSQL();

                end;

                _Sql1:= 'UPDATE i_orcamento SET flag = :pFlag where orc_id = :pID';

               With DM_Pesq.Qry_Geral do begin

                  Close;
                  SQL.Clear;
                  SQL.Add(_Sql1);
                  ParamByName('pFlag').Value         := 'N';
                  ParamByName('pID').Value           := NumOrcamentoSelecionado;
                  ExecSQL();

                end;
                Application.MessageBox('Orçamento    reativado   com   sucesso,  você   pode'#13'agora acessá-lo e dar continuidade nesta demanda!',
                'Reativação de orçamento', MB_OK + MB_ICONINFORMATION);
                PopularGridTelaInicial;
                exit;

         end
         else begin

                PopularGridTelaInicial;
                exit;

         end;

end;     


procedure T_frmConsOrcamentosCancelados.edt_DataInicioChange(Sender: TObject);
begin

   btnPesquisar.Enabled := true;

end;

procedure T_frmConsOrcamentosCancelados.grid_ListaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

      with grid_Lista do
      begin

        if DataSource.DataSet.FieldByName('status').AsString = 'DESAPROVADO' then
        begin

            if (gdSelected in State) then

              Canvas.Brush.Color := clMaroon   // cor do fundo da linha que estiver selecionada

            else
            begin

              // configuração das linhas que atendem o primeiro if, ou seja com STATUS DESAPROVADO
              Canvas.Font.Style  := [fsBold];
              Canvas.Font.Color  := clBlack;

              // cor do fundo de todas as linhas
              Canvas.Brush.Color := clInfoBk;

            end
            end else begin

              // configuração das linhas que atendem o primeiro if, ou seja com STATUS DESAPROVADO
              Canvas.Font.Style  := [fsBold];
              Canvas.Font.Color  := clBlack;

              // cor do fundo de todas as linhas
              Canvas.Brush.Color := clInfoBk;

            end;

            DefaultDrawColumnCell(Rect,DataCol,Column,State);

      end;

end;

procedure T_frmConsOrcamentosCancelados.PopularGridTelaInicial;
begin

      //MOSTRA TODOS OS ORÇAMENTOS NÃO APROVADOS PELOS CLIENTES
      sqlDefalt  := 'SELECT O.*, CL.CLI_ID, CL.CLI_NOME FROM ORCAMENTO O, CLIENTES CL WHERE O.ID_CLIENTE = CL.CLI_ID '+
                    'AND O.STATUS = :pStatus ORDER BY O.DATA';

      with DM_Pesq.cdsPesqListaOrcamentos do
      begin

          Close;
          CommandText:= sqlDefalt;
          params.ParamByName('pStatus').AsString:='DESAPROVADO';
          Open;

      end;


      with grid_Lista do
      begin

        DataSource:=  DM_Pesq.dsPesqListaOrcamentos;
        Columns.Clear;

        Columns.Add;
        Columns[0].FieldName         := 'ID_ORCAMENTO';
        Columns[0].Width             := 80;
        Columns[0].Alignment         := taCenter;
        Columns[0].Title.caption     := 'CÓDIGO';
        Columns[0].Title.Font.Style  := [fsBold];
        Columns[0].Title.Alignment   := taCenter;

        Columns.Add;
        Columns[1].FieldName         := 'CLI_NOME';
        Columns[1].Width             := 470;
        Columns[1].Alignment         := taLeftJustify;
        Columns[1].Title.caption     := 'CLIENTE';
        Columns[1].Title.Font.Style  := [fsBold];
        Columns[1].Title.Alignment   := taLeftJustify;

        Columns.Add;
        Columns[2].FieldName         := 'DATA';
        Columns[2].Width             := 120;
        Columns[2].Alignment         := taCenter;
        Columns[2].Title.caption     := 'DATA';
        Columns[2].Title.Font.Style  := [fsBold];
        Columns[2].Title.Alignment   := taCenter;

        Columns.Add;
        Columns[3].FieldName         := 'TOTAL';
        Columns[3].Width             := 120;
        Columns[3].Alignment         := taCenter;
        Columns[3].Title.caption     := 'TOTAL';
        Columns[3].Title.Font.Style  := [fsBold];
        Columns[3].Title.Alignment   := taCenter;

        Columns.Add;
        Columns[4].FieldName         := 'STATUS';
        Columns[4].Width             := 150;
        Columns[4].Alignment         := taCenter;
        Columns[4].Title.caption     := 'STATUS';
        Columns[4].Title.Font.Style  := [fsBold];
        Columns[4].Title.Alignment   := taCenter;

      end;

      TCurrencyField(DM_Pesq.cdsPesqListaOrcamentos.FieldByName('TOTAL'))   .DisplayFormat:= '###,##0.00';

end;

procedure T_frmConsOrcamentosCancelados.PopularGridPesquisado;
begin

      //MOSTRA TODOS OS ORÇAMENTOS NÃO APROVADOS PELOS CLIENTES NO PERÍODO SELECIONADO

      with grid_Lista do
      begin

        DataSource:=  DM_Pesq.dsPesqListaOrcamentos;
        Columns.Clear;

        Columns.Add;
        Columns[0].FieldName         := 'ID_ORCAMENTO';
        Columns[0].Width             := 80;
        Columns[0].Alignment         := taCenter;
        Columns[0].Title.caption     := 'CÓDIGO';
        Columns[0].Title.Font.Style  := [fsBold];
        Columns[0].Title.Alignment   := taCenter;

        Columns.Add;
        Columns[1].FieldName         := 'CLI_NOME';
        Columns[1].Width             := 470;
        Columns[1].Alignment         := taLeftJustify;
        Columns[1].Title.caption     := 'CLIENTE';
        Columns[1].Title.Font.Style  := [fsBold];
        Columns[1].Title.Alignment   := taLeftJustify;

        Columns.Add;
        Columns[2].FieldName         := 'DATA';
        Columns[2].Width             := 120;
        Columns[2].Alignment         := taCenter;
        Columns[2].Title.caption     := 'DATA';
        Columns[2].Title.Font.Style  := [fsBold];
        Columns[2].Title.Alignment   := taCenter;

        Columns.Add;
        Columns[3].FieldName         := 'TOTAL';
        Columns[3].Width             := 120;
        Columns[3].Alignment         := taCenter;
        Columns[3].Title.caption     := 'TOTAL';
        Columns[3].Title.Font.Style  := [fsBold];
        Columns[3].Title.Alignment   := taCenter;

        Columns.Add;
        Columns[4].FieldName         := 'STATUS';
        Columns[4].Width             := 150;
        Columns[4].Alignment         := taCenter;
        Columns[4].Title.caption     := 'STATUS';
        Columns[4].Title.Font.Style  := [fsBold];
        Columns[4].Title.Alignment   := taCenter;

      end;

      TCurrencyField(DM_Pesq.cdsPesqListaOrcamentos.FieldByName('TOTAL'))   .DisplayFormat:= '###,##0.00';

end;

end.

