unit U_AlteraEstoqueMinimo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit;

type
  T_frmAlteraEstoqueMinimo = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    btn_Cancelar: TSpeedButton;
    btn_Sair: TSpeedButton;
    pnl_DadosUsuario: TPanel;
    btn_GravarNovoEstoqueMinimo: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    pnl1: TPanel;
    lbl2: TLabel;
    lbl4: TLabel;
    edt_estoqueminimo: TEdit;
    edt_DESCRICAO: TDBEdit;
    procedure btn_SairClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure AbrirFecharTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PesquisaProduto;
    procedure FormShow(Sender: TObject);
    procedure GravarAlteracaoDoEstoqueMinimo;
    procedure btn_CancelarClick(Sender: TObject);
    procedure edt_estoqueminimoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_estoqueminimoClick(Sender: TObject);
    procedure btn_GravarNovoEstoqueMinimoClick(Sender: TObject);


  private
    { Private declarations }


  public
    { Public declarations }


  end;

var
  _frmAlteraEstoqueMinimo: T_frmAlteraEstoqueMinimo;
  EstoqueMinimo : Integer;

implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo,
  U_principal, U_Produtos;

{$R *.dfm}


procedure T_frmAlteraEstoqueMinimo.FormCreate(Sender: TObject);
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

   lblDataDoDia.Caption:=  DateToStr(date);
   lblHoraAtual.Caption:=  timetoStr(time); 

end;


procedure T_frmAlteraEstoqueMinimo.AbrirTabelas;
begin

    dm_Conexao.cds_CadProduto.Active      := True;

end;


procedure T_frmAlteraEstoqueMinimo.AbrirFecharTabelas;
begin

    dm_Conexao.cds_CadProduto.Active      := False;
    dm_Conexao.cds_CadProduto.Active      := True;

end;


procedure T_frmAlteraEstoqueMinimo.btn_SairClick(Sender: TObject);
begin

    Close;
    btn_Cancelar.Enabled        := False;
    btn_GravarNovoEstoqueMinimo.Enabled := False;

end;


procedure T_frmAlteraEstoqueMinimo.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Release;

end;

procedure T_frmAlteraEstoqueMinimo.FormActivate(Sender: TObject);
begin

    AbrirTabelas;

end;

procedure T_frmAlteraEstoqueMinimo.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmAlteraEstoqueMinimo.PesquisaProduto;
begin
   
    with DM_Pesq.Qry_Geral do
    begin

       Close;
       SQL.Clear;
       SQL.Add('Select EstoqueMinimo from '+
       'Produtos Where Descricao = :pDescr');
       Params.ParamByName('pDescr').AsString := edt_DESCRICAO.Text;
       Open;


       if not IsEmpty then begin

           edt_estoqueminimo.Text := FloatToStr(DM_Pesq.Qry_Geral.Fields[0].AsFloat);

       end;

    end;

end;

procedure T_frmAlteraEstoqueMinimo.FormShow(Sender: TObject);
begin

    PesquisaProduto;

end;

procedure T_frmAlteraEstoqueMinimo.btn_CancelarClick(Sender: TObject);
begin

    btn_Cancelar.Enabled        := False;
    btn_GravarNovoEstoqueMinimo.Enabled := False;
    Close;
    
end;

procedure T_frmAlteraEstoqueMinimo.edt_estoqueminimoKeyPress(Sender: TObject;
  var Key: Char);
begin

    btn_Cancelar.Enabled                := True;
    btn_GravarNovoEstoqueMinimo.Enabled := True;
    

end;

procedure T_frmAlteraEstoqueMinimo.edt_estoqueminimoClick(Sender: TObject);
begin

     edt_estoqueminimo.SelStart := 0;
     edt_estoqueminimo.SelLength:= Length(edt_estoqueminimo.Text);

end;

procedure T_frmAlteraEstoqueMinimo.btn_GravarNovoEstoqueMinimoClick(Sender: TObject);
begin

    GravarAlteracaoDoEstoqueMinimo;
    AbrirFecharTabelas;
    PesquisaProduto;
    btn_GravarNovoEstoqueMinimo.Enabled:= False;
    btn_Cancelar.Enabled:= False;

end;

procedure T_frmAlteraEstoqueMinimo.GravarAlteracaoDoEstoqueMinimo;
begin


    with DM_Pesq.Qry_Geral do
    begin

       Close;
       SQL.Clear;
       SQL.Add('Update Produtos Set EstoqueMinimo = :pEstMinimo '+
       'Where Descricao = :pDescr');
       Params.ParamByName('pEstMinimo').AsFloat    := StrToFloat(edt_estoqueminimo.Text);
       Params.ParamByName('pDescr').AsString       := edt_DESCRICAO.Text;
       ExecSQL();

    end;

    dm_Conexao.cds_CadProduto.ApplyUpdates(0);

    Application.MessageBox('O Estoque Mínimo do produto foi alterado com sucesso!', 'Confirmação', MB_OK);
    LogOperacoes(NomeDoUsuarioLogado, 'alteração no estoque mínimo de um produto');
    close;

end;

end.
