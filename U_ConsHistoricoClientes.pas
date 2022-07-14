unit U_ConsHistoricoClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr, Printers;

type
  T_frmConsHistorico = class(TForm)
    pan_titulo: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    DBGridClientes: TDBGrid;
    grp10: TGroupBox;
    btn_Sair: TSpeedButton;
    btnGravarHistorico: TSpeedButton;
    GroupBox2: TGroupBox;
    edt_NomeCliente: TEdit;
    DBMemoHistorico: TDBMemo;
    btnImprimirCupom: TSpeedButton;
    btnMostrarTodos: TSpeedButton;

    //procedimentos perso
    procedure AbrirTabelas;
    procedure ImpressaoDoCupom;
    procedure MostrarUltimaOcorrenciaNoMemo;
    procedure MostrarPorClientesOuPlacas;
    procedure DBMemoEnterMaisData;
    procedure PesquisarPorNome;
    procedure LimparPesquisa;
    procedure ListarPorNome;
    procedure MostrarDadosClienteSelecionado(idClienteSelecionado:integer);


    //procedimentos padrao
    procedure btnGravarHistoricoClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure DBGridClientesCellClick(Column: TColumn);
    procedure DBMemoHistoricoClick(Sender: TObject);
    procedure edt_NomeClienteChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirCupomClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edt_NomeClienteEnter(Sender: TObject);
    procedure edt_NomeClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edt_NomeClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnMostrarTodosClick(Sender: TObject);


  private
    { Private declarations }
    DataHistorico, horaHistorico : string;
    ultimaLinha   : integer;

  public
    { Public declarations }

  end;

var
  _frmConsHistorico: T_frmConsHistorico;


implementation

uses U_dmDados, U_dmPesquisas, U_dmDadosSegundo,
  U_BiblioSysSalao, U_QRelClienteCompleto, U_QRelClienteParcial,
  U_Funcionarios, U_principal, U_Caixa, U_QRelCupomVenda, DBClient,
  U_Clientes;

{$R *.dfm}


procedure T_frmConsHistorico.FormCreate(Sender: TObject);
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
    AbrirTabelas;
    btnGravarHistorico.Enabled := false;

end;


procedure T_frmConsHistorico.FormShow(Sender: TObject);
begin  

    if(pagandoOrcamento)then
    begin

      GroupBox2.Enabled          := false;
      btnMostrarTodos.Enabled    := false;
      edt_NomeCliente.Clear;

    end;

    MostrarPorClientesOuPlacas;
    Caption := 'LOGADO POR '+NomeDoUsuarioLogado;

   //se nao for cliente bloqueia impressao se for cliente libera impressao do cupom
    if not ECliente then
    begin

      btnImprimirCupom.Enabled := true;

    end else begin

        if vendeu then begin

            btnImprimirCupom.Enabled := true;

        end else begin  btnImprimirCupom.Enabled := false; end;      

    end;

    MostrarUltimaOcorrenciaNoMemo;

end;



procedure T_frmConsHistorico.MostrarUltimaOcorrenciaNoMemo;
begin

    //setar a ultima linha do DBMemoHistorico e mostrar a ultima ocorrencia
    ultimaLinha := (DBMemoHistorico.Lines.Count - 1);
    SendMessage(DBMemoHistorico.Handle, EM_LINESCROLL, 0, ultimaLinha);

end;


procedure T_frmConsHistorico.AbrirTabelas;
begin

    DM_Pesq.cdsPesqCliente.Active   := True;

end;


procedure T_frmConsHistorico.btnGravarHistoricoClick(Sender: TObject);
begin

    DM_Pesq.cdsPesqCliente.ApplyUpdates(0);
    DM_Pesq.cdsPesqCliente.Next;
    LogOperacoes(NomeDoUsuarioLogado, 'alteração no histórico de um cliente');
    btnGravarHistorico.Enabled:= false;
    LimparPesquisa;
    
end;

procedure T_frmConsHistorico.btn_SairClick(Sender: TObject);
begin

    LimparPesquisa;
    btnImprimirCupom.Enabled           := false;
    vendeu                             := false;
    close;
    
end;

procedure T_frmConsHistorico.DBGridClientesCellClick(Column: TColumn);
begin

    idCliente := DM_Pesq.cdsPesqCliente.Fields[0].AsInteger;
    MostrarDadosClienteSelecionado(idCliente);

    btnGravarHistorico.Enabled := false;    
    MostrarUltimaOcorrenciaNoMemo;

end;

procedure T_frmConsHistorico.DBMemoEnterMaisData;
var
   posicaoAtual    : integer;
   conteudoAtual   : string;
begin

  //passando a dataAtual e horaAtual
  horaHistorico := TimeToStr(time);
  dataHistorico := DateToStr(date);

  DM_Pesq.cdsPesqCliente.Edit;

  // Armazena a coluna atual em que se encontra no dbMemo
  posicaoAtual :=  DBMemoHistorico.SelStart;

  // Armazena o texto contido anteriormente no dbMemo - Copy(objeto,inicio,fim);
  conteudoAtual := Copy(DBMemoHistorico.Text,1,posicaoAtual);

  //Preenchendo o dbMemo com o conteudo
  DBMemoHistorico.SelStart := Length(conteudoAtual);

  //Entrando com a data atual e um espaço á sua frente
  DBMemoHistorico.Lines.Add(dataHistorico + ' ' + horaHistorico + ' ..:  ');    

end;

procedure T_frmConsHistorico.DBMemoHistoricoClick(Sender: TObject);
begin

    DBMemoEnterMaisData;
    btnGravarHistorico.Enabled:= true;

end;

procedure T_frmConsHistorico.edt_NomeClienteChange(Sender: TObject);
begin

     PesquisarPorNome;

end;


procedure T_frmConsHistorico.PesquisarPorNome;
var
  nome : string;
begin

       nome := edt_NomeCliente.Text;

       with DM_Pesq.cdsPesqCliente do
       begin

            Close;
            CommandText:= 'SELECT * FROM clientes WHERE cli_status = '+QuotedStr('A')+' '+
                          'AND  cli_nome LIKE (''%'+nome+'%'') AND cli_id > 1 ';
            Open;

       end;

       MostrarUltimaOcorrenciaNoMemo;

end;

procedure T_frmConsHistorico.LimparPesquisa;
begin
    if not(pagandoOrcamento)then
    begin
       edt_NomeCliente.Clear;
       edt_NomeCliente.SetFocus;
    end;

end;

procedure T_frmConsHistorico.ImpressaoDoCupom;
begin

      with Q_RelCupomVenda.cds_RelCupomVenda do
      begin

          Close;
          Params.ParamByName('pIDVenda').value  :=  _frmCaixa.idVenda;
          Open;

          Q_RelCupomVenda.cds_RelCupomVenda.Active        := True;
          Q_RelCupomVenda.QryEmpresa.Active               := true;
          Q_RelCupomVenda.lblNomeUsuarioLogado.Caption    := NomeDoUsuarioLogado;
          Q_RelCupomVenda.Preview;
          Q_RelCupomVenda.ReportTitle                     := 'Cupom de Venda';

      end;

end;

procedure T_frmConsHistorico.btnImprimirCupomClick(Sender: TObject);
begin

   ImpressaoDoCupom;
   LogOperacoes(NomeDoUsuarioLogado, 'impressão de cupom de venda');

end;

procedure T_frmConsHistorico.MostrarPorClientesOuPlacas;
begin

   if ( ConsultouPorCliente ) then
   begin
      
       MostrarDadosClienteSelecionado(idCliente);

      with DBGridClientes do
      begin

        DataSource:=  DM_Pesq.dsPesqCliente;
        Columns.Clear;

        Columns.Add;
        Columns[0].FieldName         := 'CLI_NOME';
        Columns[0].Width             := 460;   
        Columns[0].Alignment         := taLeftJustify;

      end;

      with DBMemoHistorico do
      begin

        DataSource  :=  DM_Pesq.dsPesqCliente;
        DataField   := 'CLI_HISTORICO';

      end;

   end else begin  

      MostrarDadosClienteSelecionado(idCliente);

      with DBGridClientes do
      begin

        DataSource:=  DM_Pesq.dsPesqCliente;
        Columns.Clear;

        Columns.Add;
        Columns[0].FieldName         := 'CLI_NOME';
        Columns[0].Width             := 460;
        Columns[0].Alignment         := taLeftJustify;

      end;

      with DBMemoHistorico do
      begin

        DataSource  :=  DM_Pesq.dsPesqCliente;
        DataField   := 'CLI_HISTORICO';

      end;

   end;

end;

procedure T_frmConsHistorico.edt_NomeClienteEnter(Sender: TObject);
begin
   btnMostrarTodosClick(self);
end;

procedure T_frmConsHistorico.edt_NomeClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
    edt_NomeCliente.CharCase   := ecUpperCase;
    edt_NomeCliente.Font.Color := clBlack;
end;

procedure T_frmConsHistorico.edt_NomeClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(key=13)then
    btnMostrarTodosClick(self);
end;

procedure T_frmConsHistorico.btnMostrarTodosClick(Sender: TObject);
begin

     edt_NomeCliente.Clear;
     ListarPorNome;

end;

procedure T_frmConsHistorico.ListarPorNome;
begin

     with DM_Pesq.cdsPesqCliente do
     begin

          Close;
          CommandText:= 'SELECT * FROM clientes WHERE cli_status = '+QuotedStr('A')+' AND cli_id > 1 ORDER BY cli_nome';
          Open;

     end;

end;

procedure T_frmConsHistorico.MostrarDadosClienteSelecionado(idClienteSelecionado:integer);
begin

     with DM_Pesq.cdsPesqCliente do
     begin

          Close;
          CommandText:= 'SELECT * FROM clientes WHERE cli_status = '+QuotedStr('A')+' AND cli_id = :pIDCliente AND cli_id > 1 ORDER BY cli_nome';
          Params.ParamByName('pIDCliente').AsInteger := idClienteSelecionado;
          Open;

     end;

end;

end.

