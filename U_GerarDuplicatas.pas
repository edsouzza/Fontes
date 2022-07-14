unit U_GerarDuplicatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,ToolEdit,U_CADDUPLICATAS,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DateUtils, Grids, DBGrids, Menus;

type
  T_frmGerarDuplicatas = class(TForm)
    pan_titulo: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    lbl45: TLabel;
    lblStatusLogoff: TLabel;
    pan_botoes: TPanel;
    btnGerarDuplicatas: TSpeedButton;
    grCabecalho: TGroupBox;
    btnSair: TSpeedButton;
    lbl52: TLabel;
    edtCredor: TStaticText;
    Label4: TLabel;
    edtPedido: TStaticText;
    Label3: TLabel;
    edtNF: TStaticText;
    Label1: TLabel;
    edtValor: TStaticText;
    DBIDPrazos: TDBEdit;
    DBPrazos: TDBLookupComboBox;
    Label2: TLabel;
    Label5: TLabel;
    edtQdeParcelas: TEdit;
    edtValorParcela: TEdit;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure LimparCampos;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure GerarCabecalhoDuplicata;
    procedure GerarNumerosDasDuplicatas;
    procedure GerarQdeParcelas;
    procedure GerarDuplicatas;
    procedure GravarDuplicatasAPrazo;
    procedure AtualizarPedido;
    procedure AtualizarEstoqueEHistorico;
    procedure btnGerarDuplicatasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBPrazosClick(Sender: TObject);

  private
    { Private declarations }
    umaDuplicata : TDuplicata;

  public
    { Public declarations }
    valorParcela, valorTotalDuplicata : double;
    qdeParcelas         : integer;
    AtualizandoPedido   : Boolean;
    vencimentoDuplicata : TDate;
    qdeDias             : string;

  end;

var
  _frmGerarDuplicatas : T_frmGerarDuplicatas;
  vl : array of integer;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas, U_dmDadosSegundo, SqlExpr,DBClient, U_principal, DB,
     U_CadCredores, U_EscolhaDoCredorParaPagamento, U_FecharPedido;


{$R *.dfm}

procedure T_frmGerarDuplicatas.FormCreate(Sender: TObject);
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
    dtDataDoDia                  := TDateEdit.Create(self);   //instanciando um dataEdit com a data do dia para uso no sistema
    dtDataDoDia.Date             := date;
    DataDoDia                    := date;

end;

procedure T_frmGerarDuplicatas.FormShow(Sender: TObject);
begin
     GerarCabecalhoDuplicata;                               //preenche os dados iniciais do formulario
     umaDuplicata := TDuplicata.criarObj;                   //instanciando o objeto

end;

procedure T_frmGerarDuplicatas.GerarCabecalhoDuplicata;
begin   
     //preenche os dados iniciais do formulario
     edtCredor.Caption  := NomeFornecedorGerarDuplicata;
     edtPedido.Caption  := IntToStr(IDPedidoGerarDuplicatas);
     edtNF.Caption      := NumNFGerarDuplicatas;
     edtValor.Caption   := ValorDuplicata;

end;

procedure T_frmGerarDuplicatas.FormKeyPress(Sender: TObject;
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

procedure T_frmGerarDuplicatas.btnSairClick(Sender: TObject);
begin

    close;

end;

procedure T_frmGerarDuplicatas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    //destroi os objetos criados ao fechar o formulario
    FreeAndNil(dtDataDoDia);
    umaDuplicata.Destroy;
    Finalize(vl);
    release;

end;

procedure T_frmGerarDuplicatas.LimparCampos;
begin
    edtCredor.Caption          := '';
    edtPedido.Caption          := '';
    edtNF.Caption              := '';
    edtValor.Caption           := '';
    dbPrazos.keyvalue          := -1;
    btnGerarDuplicatas.Enabled := false;
    grCabecalho.Enabled        := false;

end;

procedure T_frmGerarDuplicatas.DBPrazosClick(Sender: TObject);
begin
   btnGerarDuplicatas.Enabled := true;
   texto                      := DBPrazos.Text;

end;

procedure T_frmGerarDuplicatas.btnGerarDuplicatasClick(Sender: TObject);
begin
   GerarDuplicatas;

end;

procedure T_frmGerarDuplicatas.GerarDuplicatas;
begin
     GerarQdeParcelas;
     GerarNumerosDasDuplicatas;
     vendaCredito := true;

end;

procedure T_frmGerarDuplicatas.GerarQdeParcelas;
begin 
    //qdeParcelas         := (ContaChar(texto,'/')+1);                //conta qtas vezes aparece a barra(/) na string ex:se aparece 3 vezes soma-se 1 e a qde de parcelas é = 4  => 30/40/120/240
    qdeParcelas           := ObterQtdeOcorrencias(texto);            //retorna exatamente a quantidade de parcelas digitadas mesmo com as barras
    edtQdeParcelas.Text   := IntToStr(qdeParcelas);

    valorTotalDuplicata   := StrToFloat(edtValor.Caption);           //calcula o valor total da duplicata
    valorParcela          := ( valorTotalDuplicata / qdeParcelas );  //calcula o valor de cada duplicata
    edtValorParcela.Text  := FloatToStr(valorParcela);

    //ShowMessage('quantidade de parcelas = '+IntToStr(qdeParcelas));

end;

procedure T_frmGerarDuplicatas.GerarNumerosDasDuplicatas;
var  i : integer;
begin
         texto := DBPrazos.Text;
         SetLength(vl,qdeParcelas);       //alimenta o vetor (vl) numerico com a qdeParcelas

         for i := 0 to qdeParcelas-1 do   //o valor inicial deve ser a partir do zero pois os indices do explode começam do zero
         begin
             vl[i]                  := StrToInt(Explode(Texto, '/')[i]);    //o vetor(vl) recebe o valor gerado pelo explode do texto que retira a barra do texto deixando apenas o numero da parcela
             vencimentoDuplicata    := IncDay(DataDoDia,vl[i]);             //vencimentoDuplicata recebe a data do dia incrementada pela qde de dias passada pelo vetor
             NumNFGerarDuplicatas   := edtNF.Caption +'/'+ (IntToStr(i+1)); //Gera o numero para NF incrementada por uma barra e a sequencia da duplicata  ex: 12345/1  12345/2 etc...
             GravarDuplicatasAPrazo;                                        //Grava os dados no banco de dados

             //ShowMessage('Tamanho do array: '+IntToStr(length(vl)));
         end;

         texto := 'A N.F. nº '+ edtNF.Caption +' e suas duplicatas foram geradas com sucesso os itens foram enviados ao estoque!';
         Application.MessageBox(PChar(texto),'Sucesso!', MB_OK);
         AtualizarPedido;
         AtualizarEstoqueEHistorico;
         close;

end;


procedure T_frmGerarDuplicatas.GravarDuplicatasAPrazo;
begin
   MostrarMesEAno(dtDataDoDia.Text);                        //Gera JAN/2016 para gravar no banco de dados
   proxNum := GerarProximoID('id_duplicata','duplicatas');  //Gera o proximo ID do novo registro

   with umaDuplicata do
   begin
        id_duplicata  := proxNum;
        pedido_id     := IDPedidoGerarDuplicatas;
        num_duplicata := NumNFGerarDuplicatas;
        valor         := valorParcela;
        dtvencimento  := vencimentoDuplicata;
        datacad       := DataDoDia;
        mesano        := mes_ano;
        status        := 'PENDENTE';
        inserir;
   end;

end;


procedure T_frmGerarDuplicatas.AtualizarEstoqueEHistorico;
begin  
     _frmFecharPedido.EnviarQdesAoEstoque;
     _frmFecharPedido.AtualizarHistoricoEP;
     _frmFecharPedido.LimparTabelaPedidoTemp;

end;

procedure T_frmGerarDuplicatas.AtualizarPedido;
begin
     //atualizando o numero da NF , total do pedido, status e id do prazo na tabela c_pedido
     with DM_Pesq.Qry_Geral do
     begin

          close;
          sql.Clear;
          sql.Add('UPDATE c_pedido SET numnf = :pNumNF, status = '+QuotedStr('F')+', prazo_id = :pPrazo WHERE id_pedido = :pIdPedido');
          Params.ParamByName('pIdPedido').AsInteger   := IDPedidoGerarDuplicatas;
          Params.ParamByName('pNumNF').AsString       := edtNF.Caption;
          Params.ParamByName('pPrazo').AsInteger      := StrToInt(DBIDPrazos.Text);
          ExecSQL();

     end;

end;

end.





