unit U_ListarVendasParaImpressaoDeCupons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ToolEdit;

type
  T_frmConsVendasParaImpressao = class(TForm)
    pan_titulo: TPanel;
    pangrid_atendimentos: TPanel;
    pan_botoes: TPanel;
    lblDataDoDia: TLabel;
    gridVendas: TDBGrid;
    lblStatusLogoff: TLabel;
    lbl45: TLabel;
    lblNomeLogado: TLabel;
    edtPesquisa: TEdit;
    rbPorNome: TRadioButton;
    rbPorNumero: TRadioButton;
    rbSair: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PopularGridVendas;
    procedure gridVendasCellClick(Column: TColumn);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbPorNumeroClick(Sender: TObject);
    procedure rbPorNomeClick(Sender: TObject);
    procedure rbSairClick(Sender: TObject);


  private
    { Private declarations }
    procedure ImprimirCupomJato;
    procedure ImprimirCupomMatricial;
    procedure PesquisarPorNome(sNome : string);
    procedure PesquisarPorNumVenda(sNumero : string);
    procedure LimparPesquisa;

  public
    { Public declarations }

  end;

var
  _frmConsVendasParaImpressao: T_frmConsVendasParaImpressao;
   valorPesquisa : string;


implementation

uses U_dmDados,  U_dmPesquisas, U_dmDadosSegundo,
  U_BiblioSysSalao,  U_principal, DBClient, DB, U_QRelCupomVendaImprimir;

{$R *.dfm}


procedure T_frmConsVendasParaImpressao.FormCreate(Sender: TObject);
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
    lblStatusLogoff.Caption    :=  'Impressora : '+retornarTipoImpressora;
    lblNomeLogado.Caption      :=  NomeDoUsuarioLogado;
    lblDataDoDia.Caption       :=  DateToStr(date);   

end;

procedure T_frmConsVendasParaImpressao.FormShow(Sender: TObject);
begin 

    Caption := 'LOGADO POR '+NomeDoUsuarioLogado;
    edtPesquisa.Enabled:=false;
    PopulargridVendas;

end;

procedure T_frmConsVendasParaImpressao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    DM_Pesq.cdsPesqGeral.Active := false;
    FreeAndNil(Q_RelCupomVendaImprimir);
    Release;

end;

procedure T_frmConsVendasParaImpressao.ImprimirCupomJato;
begin

      //Application.MessageBox('Imprimindo cupom...', 'Imprimindo', MB_OK);
      AvisoTemporario('Imprimindo cupom...');
      
      Application.CreateForm(TQ_RelCupomVendaImprimir,  Q_RelCupomVendaImprimir);
      with Q_RelCupomVendaImprimir.cds_RelCupomVenda do
      begin

          Close;
          Params.ParamByName('pIDVenda').value  :=  NumVendaSelecionada;
          Open;

          Q_RelCupomVendaImprimir.cds_RelCupomVenda.Active        := True;
          Q_RelCupomVendaImprimir.QryEmpresa.Active               := true;
          Q_RelCupomVendaImprimir.lblNomeUsuarioLogado.Caption    := sUsuarioLogado;
          Q_RelCupomVendaImprimir.ReportTitle                     := 'Cupom de Venda';
          Q_RelCupomVendaImprimir.Preview;

      end;
      FreeAndNil(Q_RelCupomVendaImprimir);
      LimparPesquisa;

end;

procedure T_frmConsVendasParaImpressao.ImprimirCupomMatricial;
begin

    AvisoTemporario('Imprimindo cupom...');

    //GERA O CUPOM COM AS DEFINIÇÕES
    GerarCupomMatricial(NumVendaSelecionada);
    LimparPesquisa;

end;

procedure T_frmConsVendasParaImpressao.gridVendasCellClick(
  Column: TColumn);
begin

       //peguei os valores do relatorio pq ao clicar o mesmo ja é aberto e contem os valores necessarios
       //o grid foi carregado com os dados desse relatorio

       NumVendaSelecionada := DM_Pesq.cdsPesqGeral.FieldByName('VENDA_ID').AsInteger;

       //Direciona a impressao do cupom
       if(imprimirJato)then
       begin
         ImprimirCupomJato;
       end else if (imprimirMatricial)then
       begin
         ImprimirCupomMatricial;
       end;

end;


procedure T_frmConsVendasParaImpressao.PopularGridVendas;
begin

            //MOSTRA TODOS OS ORÇAMENTOS ABERTOS PARA PAGAMENTO

            with DM_Pesq.cdsPesqGeral do
            begin

                  Close;
                  CommandText:= ('SELECT r.*, v.id_venda, v.vl_bruto FROM relcupons r, venda v WHERE r.venda_id = v.id_venda ORDER BY venda_id');
                  Open;

                  If not IsEmpty then
                  begin

                      TFloatField(DM_Pesq.cdsPesqGeral.FieldByName('vl_bruto')).DisplayFormat := '#,##0.00';

                      with gridVendas do
                      begin

                        DataSource:=  DM_Pesq.dsPesqGeral;
                        Columns.Clear;

                        Columns.Add;
                        Columns[0].FieldName         := 'VENDA_ID';
                        Columns[0].Width             := 85;
                        Columns[0].Alignment         := taCenter;
                        Columns[0].Title.caption     := 'VENDA';
                        Columns[0].Title.Font.Style  := [fsBold];
                        Columns[0].Title.Alignment   := taCenter;

                        Columns.Add;
                        Columns[1].FieldName         := 'CLIENTE';
                        Columns[1].Width             := 500;
                        Columns[1].Alignment         := taLeftJustify;
                        Columns[1].Title.caption     := 'NOME DO CLIENTE';
                        Columns[1].Title.Font.Style  := [fsBold];
                        Columns[1].Title.Alignment   := taLeftJustify;

                        Columns.Add;
                        Columns[2].FieldName         := 'VL_BRUTO';
                        Columns[2].Width             := 100;
                        Columns[2].Alignment         := taCenter;
                        Columns[2].Title.caption     := 'VALOR';
                        Columns[2].Title.Font.Style  := [fsBold];
                        Columns[2].Title.Alignment   := taCenter;

                        Columns.Add;
                        Columns[3].FieldName         := 'DATA_VENDA';
                        Columns[3].Width             := 130;
                        Columns[3].Alignment         := taCenter;
                        Columns[3].Title.caption     := 'DATA DA VENDA';
                        Columns[3].Title.Font.Style  := [fsBold];
                        Columns[3].Title.Alignment   := taCenter;

                        Columns.Add;
                        Columns[4].FieldName         := 'MESANO';
                        Columns[4].Width             := 130;
                        Columns[4].Alignment         := taCenter;
                        Columns[4].Title.caption     := 'MES/ANO';
                        Columns[4].Title.Font.Style  := [fsBold];
                        Columns[4].Title.Alignment   := taCenter;

                      end;

                  end;
        end;
        
end;

procedure T_frmConsVendasParaImpressao.PesquisarPorNome(sNome : string);
begin

      _Sql  := 'SELECT DISTINCT r.*, v.id_venda, v.vl_bruto FROM relcupons r, venda v WHERE r.venda_id = v.id_venda AND r.cliente LIKE (''%'+sNome+'%'')';

      with DM_Pesq.cdsPesqGeral do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

      TFloatField(DM_Pesq.cdsPesqGeral.FieldByName('vl_bruto')).DisplayFormat := '#,##0.00';
      edtPesquisa.SelStart:= 0;

end;

procedure T_frmConsVendasParaImpressao.PesquisarPorNumVenda(sNumero : string);
begin

      _Sql  := 'SELECT DISTINCT r.*, v.id_venda, v.vl_bruto FROM relcupons r, venda v WHERE r.venda_id = v.id_venda AND r.venda_id = '+sNumero;

      with DM_Pesq.cdsPesqGeral do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

      TFloatField(DM_Pesq.cdsPesqGeral.FieldByName('vl_bruto')).DisplayFormat := '#,##0.00';
      edtPesquisa.SelStart:= 0;
end;


procedure T_frmConsVendasParaImpressao.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

    if key=13 then
    begin

         LimparPesquisa;

    end;
    
end;

procedure T_frmConsVendasParaImpressao.rbPorNumeroClick(Sender: TObject);
var
Resposta : string;
begin

    repeat
    Resposta := InputBox('Entre com o número da venda', 'Digite o número da venda', '');
    until Resposta <> '';              //nao sai da tela enquanto nao digitar um valor
    PesquisarPorNumVenda(UpperCase(Resposta));
    edtPesquisa.Enabled:=true;
    edtPesquisa.SetFocus;
    edtPesquisa.SelStart:= 0;

end;


procedure T_frmConsVendasParaImpressao.rbPorNomeClick(Sender: TObject);
var
Resposta : string;
begin

    repeat
    Resposta := InputBox('Entre com parte do nome', 'Digite o nome do cliente', '');
    until Resposta <> '';              //nao sai da tela enquanto nao digitar um valor
    PesquisarPorNome(UpperCase(Resposta));
    edtPesquisa.Enabled:=true;
    edtPesquisa.SetFocus;
    edtPesquisa.SelStart:= 0;

end;

procedure T_frmConsVendasParaImpressao.rbSairClick(Sender: TObject);
begin
    close;
end;

procedure T_frmConsVendasParaImpressao.LimparPesquisa;
begin

   PopularGridVendas;
   rbPorNome.Checked   := false;
   rbPorNumero.Checked := false;
   edtPesquisa.SelStart:= 0;
   edtPesquisa.Enabled:=false;

end;

end.

