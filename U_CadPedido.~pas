unit U_CadPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,DateUtils, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus, RxGIF;

type
  T_frmCadPedido = class(TForm)
    pan_titulo: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    lbl45: TLabel;
    lblStatusLogoff: TLabel;
    pan_botoes: TPanel;
    btnSairDaComanda: TSpeedButton;
    panel_CabecalhoComanda: TPanel;
    Panel4: TPanel;
    txt_numPedido: TEdit;
    btnSalvar: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    edt_DataEntrega: TDateEdit;
    Label4: TLabel;
    DBIDFornecedor: TDBEdit;
    btnCadFornecedor: TSpeedButton;
    btnCadastraPrazo: TSpeedButton;
    DBContatos: TDBLookupComboBox;
    DBIDContato: TDBEdit;
    GridConsFornecedores: TDBGrid;
    GroupBox2: TGroupBox;
    edtConsFornecedor: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnSairDaComandaClick(Sender: TObject);
    procedure AbriTabelas;
    procedure FecharTabelas;
    procedure SalvarNovoPedido;
    procedure VerificarValidadeDaDataDeEntrega;
    procedure btnSalvarClick(Sender: TObject);
    procedure edt_DataEntregaExit(Sender: TObject);
    procedure edt_DataEntregaChange(Sender: TObject);
    procedure DBPrazosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCadFornecedorClick(Sender: TObject);
    procedure VerificarDuplicidade;
    procedure FormShow(Sender: TObject);
    procedure LimparTabelaPedidoTemp;
    procedure ProximoNumPedido;
    procedure btnCadastraPrazoClick(Sender: TObject);
    procedure GridConsFornecedoresCellClick(Column: TColumn);
    procedure FiltrarPorNome;
    procedure edtConsFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConsFornecedorChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MostrarContatosDoFornecedor;

  private
    { Private declarations }
     DataDoDia           : TDate;

  public
    { Public declarations }
     NumPedidoAtual, idPedidoAberto     : string;
     idFornecedorEntrada, numProxPedido : integer;

  end;

var
  _frmCadPedido: T_frmCadPedido;




implementation

uses U_dmDados, U_Funcionarios,U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo, SqlExpr,
     DBClient, U_CadFornecedorPedido, DB, U_AddItensNoPedido, U_CadPrazos;


{$R *.dfm}

procedure T_frmCadPedido.FormCreate(Sender: TObject);
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

    lblDataDoDia.Caption     := DateToStr(now);
    lblHoraAtual.Caption     := timetoStr(time);
    lblStatusLogoff.Caption  := IdentificarUsuarioLogado;

    AbriTabelas;

end;

procedure T_frmCadPedido.btnSairDaComandaClick(
  Sender: TObject);
begin

  edtConsFornecedor.Clear;
  fechartabelas;
  close;    

end;

procedure T_frmCadPedido.AbriTabelas;
begin

    dm_DadosSegundo.cds_CPedido.Active      := true;
    dm_Conexao.cds_Fornecedor.Active        := true;
    dm_Conexao.cds_Prazos.Active            := true;

end;

procedure T_frmCadPedido.FecharTabelas;
begin

    dm_DadosSegundo.cds_CPedido.Active      := false;
    dm_Conexao.cds_Fornecedor.Active        := false;
    dm_Conexao.cds_Prazos.Active            := false;

end;

procedure T_frmCadPedido.DBPrazosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if key = 13 then
     begin

          VerificarDuplicidade;

      end;

end;


procedure T_frmCadPedido.btnSalvarClick(Sender: TObject);
begin

         VerificarDuplicidade;

end;

procedure T_frmCadPedido.VerificarDuplicidade;
begin

       _Sql := 'SELECT numpedido FROM c_pedido WHERE numpedido = :pNumPedido AND fornecedor_id = :pIDFornecedor AND status = ('+QuotedStr('A')+')';

           with DM_Pesq.Qry_Geral do
           begin

               close;
               sql.Clear;
               sql.Add(_Sql);
               Params.ParamByName('pnumpedido').Value    :=  txt_numPedido.Text;
               Params.ParamByName('pIDFornecedor').Value :=  Strtoint(DBIDFornecedor.Text);
               open;


               if not IsEmpty then
               begin

                    Application.MessageBox('Existe no momento um pedido aberto com esse número!',
                    'Operação Inválida...', MB_OK);  
                    txt_numPedido.SetFocus;

               end else begin

                   SalvarNovoPedido;

               end;

           end;

end;


procedure T_frmCadPedido.SalvarNovoPedido;
begin

        With DM_Pesq.qry_Cod do
        begin

            Close;
            SQL.Clear;
            SQL.Add('select max(id_pedido) from c_pedido');
            Open;

            if not IsEmpty then begin

               proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

            end;

         end;


          with  dm_DadosSegundo.cds_CPedido do
          begin

            Append;
            FieldByName('id_pedido').AsInteger       := proxnum;
            FieldByName('id_operador').AsInteger     := IdFuncionarioLogado(lblStatusLogoff.Caption);
            FieldByName('numpedido').AsString        := txt_numpedido.text;
            FieldByName('fornecedor_id').AsInteger   := Strtoint(DBIDFornecedor.text);
            FieldByName('contato_id').AsInteger      := Strtoint(DBIDContato.text);
            FieldByName('data_abertura').AsDateTime  := date;
            FieldByName('data_entrega').AsDateTime   := edt_DataEntrega.date;
            FieldByName('status').AsString           := 'A';

            // o valor total do pedido será cadastrado automaticamente ao final da inclusao dos ítens //

            ApplyUpdates(0);

            NumPedidoAtual := txt_numpedido.text;
            idPedidoAberto := inttostr(proxnum);

            Application.MessageBox('Pedido inicializado com Sucesso!', 'Abertura de Pedido!', MB_OK);
            LogOperacoes(NomeDoUsuarioLogado, 'gravação de abertura de um novo pedido');
            edtConsFornecedor.Clear;

            // abrir formulario para inserção dos ítens
            Application.CreateForm(T_frmAddItensNoPedido, _frmAddItensNoPedido);
            _frmAddItensNoPedido.ShowModal;
            FreeAndNil(_frmAddItensNoPedido);

          end;

          close;

end;


procedure T_frmCadPedido.edt_DataEntregaExit(Sender: TObject);
begin

    VerificarValidadeDaDataDeEntrega;

end;

procedure T_frmCadPedido.VerificarValidadeDaDataDeEntrega;
begin

     DataDoDia := date;

     if ( edt_DataEntrega.Date < DataDoDia ) then
     begin

         Application.MessageBox('A data de entrega deve ser maior ou igual a data atual!', 'Verifique!', MB_OK);
         edt_DataEntrega.Date := now;
         edt_DataEntrega.SetFocus;

     end;


end;

procedure T_frmCadPedido.edt_DataEntregaChange(Sender: TObject);
begin

    VerificarValidadeDaDataDeEntrega;
   
end;

procedure T_frmCadPedido.btnCadFornecedorClick(Sender: TObject);
begin

    Application.CreateForm(T_frmCadFornecedorPedido, _frmCadFornecedorPedido);
    _frmCadFornecedorPedido.ShowModal;
    FreeAndNil(_frmCadFornecedorPedido);

end;

procedure T_frmCadPedido.FormShow(Sender: TObject);
begin

    LimparTabelaPedidoTemp;
    edt_DataEntrega.Date  := now;
    edtConsFornecedor.SetFocus;

end;

procedure T_frmCadPedido.LimparTabelaPedidoTemp;
begin

     With DM_Pesq.Qry_Geral do
     begin

        Close;
        SQL.Clear;
        SQL.Add('Delete FROM t_pedido');
        ExecSQL;

     end;        

     ProximoNumPedido;
     edt_DataEntrega.SetFocus;

end;

procedure T_frmCadPedido.ProximoNumPedido;
begin

   //Entra com o numero do atual pedido, que é o numero do ultimo + 1

    With DM_Pesq.qry_Cod do
    begin

        Close;
        SQL.Clear;
        SQL.Add('select max(id_pedido) from c_pedido');
        Open;

        if not IsEmpty then begin

           numProxPedido      := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;
           txt_numPedido.Text := inttostr(numProxPedido);

        end;

     end;

end;

procedure T_frmCadPedido.btnCadastraPrazoClick(Sender: TObject);
begin

      Application.CreateForm(T_frmPrazos, _frmPrazos);
      _frmPrazos.ShowModal;
      FreeAndNil(_frmPrazos);

end;

procedure T_frmCadPedido.GridConsFornecedoresCellClick(Column: TColumn);
begin

    MostrarContatosDoFornecedor;

end;

procedure T_frmCadPedido.FiltrarPorNome;
var
  nome : string;
begin

      nome := edtConsFornecedor.Text;

      _Sql  := 'SELECT * FROM fornecedores WHERE forne_status = '+QuotedStr('A')+' '+
                'AND forne_nome LIKE (''%'+nome+'%'') ORDER BY forne_nome';

      with dm_Conexao.cds_Fornecedor do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

      idFornecedorEntrada :=  dm_Conexao.cds_Fornecedor.Fields[0].AsInteger;
      MostrarContatosDoFornecedor;

end;

procedure T_frmCadPedido.MostrarContatosDoFornecedor;
begin

     idFornecedorEntrada :=  dm_Conexao.cds_Fornecedor.Fields[0].AsInteger;

     _Sql := 'SELECT * FROM contatos_fornecedores WHERE forne_id = :pForneID';

     with DM_Pesq.cdsPesqContatos do
     begin

         close;
         CommandText:= (_Sql);
         Params.ParamByName('pForneID').AsInteger  := idFornecedorEntrada;
         Open;

          if not IsEmpty then
          begin

             DBIDContato.DataSource   := DM_Pesq.dsPesqContatos;
             DBContatos.ListSource    := DM_Pesq.dsPesqContatos;
             DBContatos.KeyValue      := DM_Pesq.cdsPesqContatos.Fields[0].AsInteger;

          end;

     end;

      btnSalvar.Enabled := true;

end;


procedure T_frmCadPedido.edtConsFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if KEY = VK_RETURN then
      begin

          edtConsFornecedor.Clear;

      end;

end;

procedure T_frmCadPedido.edtConsFornecedorChange(Sender: TObject);
begin

    FiltrarPorNome;

end;

procedure T_frmCadPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    fechartabelas;

end;



end.
