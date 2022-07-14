unit U_ConsTodosPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ToolEdit, Menus;

type
  T_frmConsTodosPedidos = class(TForm)
    pan_titulo: TPanel;
    pangrid_atendimentos: TPanel;
    pan_botoes: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    lblStatusLogoff: TLabel;
    lbl45: TLabel;
    GroupBox1: TGroupBox;
    btnFechar: TSpeedButton;
    btnPesquisar: TSpeedButton;
    grid_ListaPedidos: TDBGrid;
    panel_opcoes_consulta: TPanel;
    rdNF: TRadioButton;
    panel_datas: TPanel;
    lbl52: TLabel;
    edt_DataInicio: TDateEdit;
    lbl53: TLabel;
    edt_DataFim: TDateEdit;
    GridFornecedores: TDBGrid;
    rdprazo: TRadioButton;
    menExcluir: TPopupMenu;
    mnuEXCLUIRPEDIDO: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure PesquisarPeriodoPedidos;
    procedure grid_ListaPedidosCellClick(Column: TColumn);
    procedure edt_DataInicioChange(Sender: TObject);
    procedure rdNFClick(Sender: TObject);
    procedure ConsultaPorNF;
    procedure ConsultaPorPrazo;
    procedure PopularGridFornecedoresComPrazos;
    procedure Limpar;
    procedure grid_ListaPedidosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure MostrarNFNomeFornecedorNoGrid;
    procedure rdprazoClick(Sender: TObject);
    procedure GridFornecedoresCellClick(Column: TColumn);
    procedure mnuEXCLUIRPEDIDOClick(Sender: TObject);

  private
    { Private declarations }
    NumDaNF : string;
    porFornecedor, porPrazo, PorNF : boolean;
    idPrazo : integer;
  public
    { Public declarations }
       NumPedidoSelecionado, NumeroDaNF, NomeFornecedor, prazoPagto, StatusDoPedido : string;

  end;

var
  _frmConsTodosPedidos: T_frmConsTodosPedidos;


implementation

uses U_dmDados,  U_dmPesquisas, U_dmDadosSegundo,
  U_BiblioSysSalao,  U_principal, DBClient,
  U_QRelPedidoPeriodo, U_FecharPedido, DB,
  U_MostrandoItensDaConsultaGeralDePedidos;

{$R *.dfm}


procedure T_frmConsTodosPedidos.FormCreate(Sender: TObject);
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
    edt_DataFim.Date        :=  date;

end;

procedure T_frmConsTodosPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    DM_Pesq.cdsPesqListaTodosPedidos.Active := false;
    dm_Conexao.cds_Fornecedor.Active        := false;
    DM_Pesq.Qry_Geral.Active                := false;
    Release;

end;

procedure T_frmConsTodosPedidos.btnFecharClick(Sender: TObject);
begin

    Limpar;

end;

procedure T_frmConsTodosPedidos.FormShow(Sender: TObject);
begin

    edt_datainicio.SetFocus;
    dm_Conexao.cds_Fornecedor.Active := true;
    DM_Pesq.Qry_Geral.Active         := true;
    porFornecedor := false;

end;


procedure T_frmConsTodosPedidos.PesquisarPeriodoPedidos;
var
  DataInicio, DataFim : TDate;
begin

       DataInicio     := StrToDate(edt_DataInicio.text);
       DataFim        := StrToDate(edt_DataFim.text);


       _Sql :='SELECT c.numpedido, c.numnf, c.data_entrega, c.vl_totalpedido, c.data_abertura, c.status, '+
              'c.fornecedor_id, f.forne_id, f.forne_nome FROM c_pedido c, fornecedores f '+
              'WHERE c.fornecedor_id = f.forne_id AND c.data_abertura between :datainicial '+
              'AND :datafinal ORDER BY c.data_abertura';


       with DM_Pesq.cdsPesqListaTodosPedidos do
       begin

          close;
          CommandText:= (_Sql);
          Params.ParamByName('datainicial').AsDateTime := DataInicio;
          Params.ParamByName('datafinal').AsDateTime   := DataFim;
          open;

          TFloatField(DM_Pesq.cdsPesqListaTodosPedidos.FieldByName('vl_totalpedido')).DisplayFormat := '##0.00';

       end;
       grid_ListaPedidos.Enabled := true;
       grid_ListaPedidos.Refresh;

end;



procedure T_frmConsTodosPedidos.btnPesquisarClick(Sender: TObject);
begin

        if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
        begin
                  Application.MessageBox('É necessário uma data inicial e uma data final para efetuar a pesquisa !', 'Período Inválido!', MB_OK);
                  edt_datainicio.text          := '  /  /    ';
                  edt_DataFim.Date             := date;
                  edt_DataInicio.SetFocus;
        end
        else if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                 PesquisarPeriodoPedidos;

                 panel_opcoes_consulta.Enabled     := false;
                 panel_datas.Enabled               := false;
                 btnPesquisar.Enabled              := false;
                 btnFechar.Caption                 := 'Limpar';

        end else begin

          Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
          edt_DataInicio.SetFocus;

       end;      

end;

procedure T_frmConsTodosPedidos.grid_ListaPedidosCellClick(
  Column: TColumn);
begin    
     //se a consulta for por PRAZO

     if DM_Pesq.cdsPesqListaTodosPedidos.Eof then begin

        Application.MessageBox('Nenhuma pesquisa aberta no momento!', 'Inicie uma pesquisa abaixo!', MB_OK);
        exit;

     end else begin

        NumPedidoSelecionado   := DM_Pesq.cdsPesqListaTodosPedidos.fieldbyname('NUMPEDIDO').AsString;
        NomeFornecedor         := DM_Pesq.cdsPesqListaTodosPedidos.fieldbyname('FORNE_NOME').AsString;
        NumeroDaNF             := DM_Pesq.cdsPesqListaTodosPedidos.fieldbyname('NUMNF').AsString;

        //definindo o status para mostrar na visualização do formulario que mostra os ítens do pedido selecionado

      if DM_Pesq.cdsPesqListaTodosPedidos.fieldbyname('STATUS').AsString = 'A' then
        begin

             StatusDoPedido           := 'ABERTO';
             mnuEXCLUIRPEDIDO.Visible := true;

        end else  if DM_Pesq.cdsPesqListaTodosPedidos.fieldbyname('STATUS').AsString = 'F' then
        begin

             StatusDoPedido           := 'FECHADO';
             //mnuEXCLUIRPEDIDO.Enabled := false;

        end else  if DM_Pesq.cdsPesqListaTodosPedidos.fieldbyname('STATUS').AsString = 'C' then

             StatusDoPedido := 'CANCELADO';

        if NumeroDaNF = '0' then
        begin

           Application.MessageBox('Não é possível exibir os ítens deste pedido enquanto não for gerada a sua N.F.', 'Operação não permitida!', MB_OK);
           exit;
        end else begin

            //abrindo um novo formulario que mostra os dados do pedido selecionado
            Application.CreateForm(T_frmMostraItensDaConsPedidos, _frmMostraItensDaConsPedidos);
            _frmMostraItensDaConsPedidos.ShowModal;
            FreeAndNil(_frmMostraItensDaConsPedidos);

            Limpar;
        end;   

     end;

end;

procedure T_frmConsTodosPedidos.edt_DataInicioChange(Sender: TObject);
begin

    btnPesquisar.Enabled          := true;

end;

procedure T_frmConsTodosPedidos.rdNFClick(Sender: TObject);
begin

       MostrarNFNomeFornecedorNoGrid;
       
       GridFornecedores.Visible      := true;
       btnFechar.Caption             := 'Limpar';
       btnPesquisar.Enabled          := false;
       pan_titulo.Caption            := 'Consulta por Número de N.F.';
       porPrazo                      := false;
       PorNF                         := true;
       panel_datas.Enabled           := false;

end;

procedure T_frmConsTodosPedidos.MostrarNFNomeFornecedorNoGrid;
begin

       //AND p.data_abertura BETWEEN :pDataIni and :pDataFim
       _Sql :='SELECT p.numnf, p.fornecedor_id, f.forne_id, f.forne_nome FROM c_pedido p, fornecedores f WHERE '+
              'p.fornecedor_id = f.forne_id AND p.numnf <> '+QuotedStr('0')+' AND p.data_abertura BETWEEN :pDataIni and :pDataFim ORDER BY f.forne_nome';

       with DM_Pesq.cdsPesqGeral do
       begin

          close;
          CommandText := _Sql;
          Params.ParamByName('pDataIni').AsDateTime  := edt_DataInicio.Date;
          Params.ParamByName('pDataFim').AsDateTime  := edt_DataFim.Date;
          open;

       end;

       with GridFornecedores do
       begin

          DataSource:=  DM_Pesq.dsPesqGeral;

          Columns.Clear;
          Columns.Add;
          Columns[0].FieldName         := 'NUMNF';
          Columns[0].Width             := 100;
          Columns[0].Alignment         := taCenter;
          Columns[0].Title.caption     := 'N.F.';
          Columns[0].Title.Alignment   := taCenter;
          Columns[0].Title.Font.Style  := [fsBold];
          Columns[0].Title.Font.Color  := clBlack;

          Columns.Add;
          Columns[1].FieldName         := 'FORNE_NOME';
          Columns[1].Width             := 370;
          Columns[1].Alignment         := taLeftJustify;
          Columns[1].Title.caption     := 'FORNECEDOR';
          Columns[1].Title.Alignment   := taLeftJustify;
          Columns[1].Title.Font.Style  := [fsBold];
          Columns[1].Title.Font.Color  := clBlack;


       end;         
       grid_ListaPedidos.Enabled := true;
end;


procedure T_frmConsTodosPedidos.GridFornecedoresCellClick(Column: TColumn);
begin

    if porNF then
    begin

       NumDaNF                   := DM_Pesq.cdsPesqGeral.Fields[0].Value;
       GridFornecedores.Visible  := false;
       ConsultaPorNF;
       pan_titulo.Caption        :=   'Consulta Pedidos pelo número da N.F.';

    end;

   if porPrazo then
    begin

        idPrazo                  := DM_Pesq.cdsPesqGeral.Fields[0].Value;
        GridFornecedores.Visible := false;
        ConsultaPorPrazo;
        pan_titulo.Caption       :=   'Consulta Pedidos pelo prazo selecionado';

    end;

end;
            

procedure T_frmConsTodosPedidos.ConsultaPorNF;
begin

      if rdnf.Checked then
       begin

             _Sql :='SELECT p.numpedido, p.numnf, p.data_entrega, p.vl_totalpedido, p.data_abertura, p.status, '+
                    'p.fornecedor_id, f.forne_id, f.forne_nome FROM c_pedido p, fornecedores f  WHERE p.fornecedor_id = f.forne_id '+
                    'AND p.numnf = :pnumNF';

             with DM_Pesq.cdsPesqListaTodosPedidos do
             begin

                close;
                CommandText:= (_Sql);
                Params.ParamByName('pnumNF').AsString  := NumDaNF;
                open;

                if not IsEmpty then
                begin

                    grid_ListaPedidos.Refresh;
                    TFloatField(DM_Pesq.cdsPesqListaTodosPedidos.FieldByName('vl_totalpedido')).DisplayFormat := '##0.00';

                end else

                    Application.MessageBox('O número de N.F. digitado não consta em nosso banco de dados!', 'Verifique!', MB_OK);
                    rdNF.Checked := false;
                    NumeroDaNF   := '';
                    exit;

                end;

       end;
      
end;



procedure T_frmConsTodosPedidos.ConsultaPorPrazo;
begin
     //quando der certo incluir perido de datas para esta consulta
     
     _Sql :='SELECT c.numpedido, c.numnf, c.data_entrega, c.vl_totalpedido, c.prazo_id, c.data_abertura, c.status, '+
            'c.fornecedor_id, f.forne_id, f.forne_nome, p.id_prazo, p.prazo FROM c_pedido c, fornecedores f, prazos p '+
            ' WHERE c.fornecedor_id = f.forne_id and p.id_prazo = c.prazo_id and p.id_prazo = :pPrazo and c.data_abertura '+
            'BETWEEN :pDataIni and :pDataFim ORDER BY f.forne_nome';

     with DM_Pesq.cdsPesqListaTodosPedidos do
     begin

        close;
        CommandText:= (_Sql);
        Params.ParamByName('pPrazo').Value         :=  idPrazo;
        Params.ParamByName('pDataIni').AsDateTime  := edt_DataInicio.Date;
        Params.ParamByName('pDataFim').AsDateTime  := edt_DataFim.Date;
        open;

        if not IsEmpty then
        begin

            grid_ListaPedidos.Refresh;
            TFloatField(DM_Pesq.cdsPesqListaTodosPedidos.FieldByName('vl_totalpedido')).DisplayFormat := '##0.00';
            pan_titulo.Caption    :=   'Consulta Pedidos pelo prazo selecionado';

        end else

            Application.MessageBox('Não foram encontrados pedidos com este prazo!', 'Verifique!', MB_OK);
            rdprazo.Checked := false;
            prazoPagto      := '';
            exit;

        end;

end;


procedure T_frmConsTodosPedidos.rdprazoClick(Sender: TObject);
begin

    PopularGridFornecedoresComPrazos;
    
    btnFechar.Caption              := 'Limpar';
    btnPesquisar.Enabled           := false;
    pan_titulo.Caption             := 'Consulta Pedidos pelo prazo selecionado';
    porFornecedor                  := false;
    panel_datas.Enabled            := false;
    porPrazo                       := true;
    PorNF                          := false;

end;

procedure T_frmConsTodosPedidos.PopularGridFornecedoresComPrazos;
begin

      GridFornecedores.Visible := true;

      _Sql :='SELECT * from prazos';

             with DM_Pesq.cdsPesqGeral do
             begin

                close;
                CommandText := _Sql;
                open;

             end;

             with GridFornecedores do
             begin

                DataSource:=  DM_Pesq.dsPesqGeral;

                Columns.Clear;
                Columns.Add;
                Columns[0].FieldName         := 'PRAZO';
                Columns[0].Width             := 470;
                Columns[0].Alignment         := taLeftJustify;
                Columns[0].Title.caption     := 'PRAZOS';
                Columns[0].Title.Alignment   := taCenter;
                Columns[0].Title.Font.Style  := [fsBold];
                Columns[0].Title.Font.Color  := clBlack;

             end;

             DM_Pesq.cdsPesqListaTodosPedidos.Close;
             grid_ListaPedidos.Enabled := true;
end;


procedure T_frmConsTodosPedidos.Limpar;
begin

      if verificaCaption('Limpar',btnFechar)then
        begin

          DM_Pesq.cdsPesqListaTodosPedidos.Close;
          btnFechar.Caption              := 'Sair';
          btnPesquisar.Enabled           := true;
          rdNF.Checked                   := false;
          rdprazo.Checked                := false;
          panel_opcoes_consulta.Enabled  := true;
          panel_datas.Enabled            := true;
          GridFornecedores.Visible       := false;
          porFornecedor                  := false;
          edt_DataInicio.Text            := '  /  /    ';
          pan_titulo.Caption             :=   'Consulta Pedidos';
          grid_ListaPedidos.Enabled      := false;
          mnuEXCLUIRPEDIDO.Visible       := false;
          edt_DataInicio.SetFocus;

      end else begin

         Close;

      end;

end;   


procedure T_frmConsTodosPedidos.grid_ListaPedidosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

            with grid_ListaPedidos do
            begin

              if DataSource.DataSet.FieldByName('status').AsString = 'A' then
              begin

                  if (gdSelected in State) then

                    Canvas.Brush.Color := clMaroon   // cor do fundo da linha que estiver selecionada

                  else
                  begin

                    // configuração das linhas que atendem o primeiro if, ou seja com STATUS A
                    Canvas.Font.Style  := [fsBold];
                    Canvas.Font.Color  := clBlue;

                    // cor do fundo de todas as linhas
                    Canvas.Brush.Color := clInfoBk;

                  end
                  end else begin

                    // configuração das linhas que não atendem o primeiro if, ou seja com STATUS F ou C
                    Canvas.Font.Color  := clRed;
                    Canvas.Brush.Color := clInfoBk;

                  end;

                  DefaultDrawColumnCell(Rect,DataCol,Column,State);

            end;
end;


procedure T_frmConsTodosPedidos.mnuEXCLUIRPEDIDOClick(Sender: TObject);
begin
//ShowMessage(NumPedidoSelecionado);
if ( PedidoAberto(StrToInt( NumPedidoSelecionado )) ) then
begin  
        texto:= 'Confirma a exclusão do Pedido selecionado?';
        if Application.MessageBox(PChar(texto),'Exclusão de Pedido',MB_YESNO + MB_ICONQUESTION) = IdYes then
        begin
          if not( PedidoTemItens(StrToInt( NumPedidoSelecionado ))) then
          begin
              //DELETANDO O PEDIDO SELECIONADO SE NÃO CONTIVER ITENS
               with DM_Pesq.Qry_Geral do
               begin

                    close;
                    sql.Clear;
                    sql.Add('DELETE FROM c_pedido WHERE id_pedido = :pIdPedido AND status='+QuotedStr('A')+'');
                    Params.ParamByName('pIdPedido').AsInteger  := StrToInt( NumPedidoSelecionado );
                    ExecSQL();

               end;

          end else
          begin
               //DELETANDO O PEDIDO COM ITENS E QUE NÃO FOI FECHADO
               with DM_Pesq.Qry_Geral do
               begin

                    close;
                    sql.Clear;
                    sql.Add('DELETE FROM c_pedido WHERE id_pedido = :pIdPedido AND status='+QuotedStr('A')+'');
                    Params.ParamByName('pIdPedido').AsInteger  := StrToInt( NumPedidoSelecionado );
                    ExecSQL();

               end;

               //DELETANDO OS ÍTENS DA TABELA I_PEDIDO
               with DM_Pesq.Qry_Auxiliar do
               begin

                    close;
                    sql.Clear;
                    sql.Add('DELETE FROM i_pedido WHERE pedido_id = :pIdPedido');
                    Params.ParamByName('pIdPedido').AsInteger  := StrToInt( NumPedidoSelecionado );
                    ExecSQL();

               end;

          end;

          DM_Pesq.cdsPesqListaTodosPedidos.Active := False;
          DM_Pesq.cdsPesqListaTodosPedidos.Active := true;
          Application.MessageBox('O pedido foi excluído com sucesso!', 'Exclusão de pedido', MB_OK);
          grid_ListaPedidos.Enabled := false;
          mnuEXCLUIRPEDIDO.Visible  := false;

        end else begin

           exit;

        end;

end else begin

      Application.MessageBox('O pedido selecionado não pode ser excluído pois o mesmo encontra-se fechado!', 'Exclusão não permitida', MB_OK);
      exit;

end;

end;

end.

