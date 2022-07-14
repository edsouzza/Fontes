unit U_ConsultaPrazos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ToolEdit, Buttons, ComCtrls;

type
  T_frmConsPrazos = class(TForm)
    pan_titulo: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    lblStatusLogoff: TLabel;
    lbl45: TLabel;
    panel_Produtos: TPanel;
    pan_botoes: TPanel;
    btnSair: TSpeedButton;
    btnLimpar: TSpeedButton;
    PageControl1: TPageControl;
    TabPorDigitacao: TTabSheet;
    TabPorDatas: TTabSheet;
    GroupBox6: TGroupBox;
    dtaInicio: TDateEdit;
    grDataInicial: TGroupBox;
    dtDataInicial: TDateEdit;
    edtQdeParcelas: TStaticText;
    grPorDigitacao: TGroupBox;
    lstPrazos: TListBox;
    GroupBox5: TGroupBox;
    lblPrazo: TStaticText;
    lstDatas: TListBox;
    dtGerarPrazo: TDateEdit;
    btnGerarPrazo: TSpeedButton;
    edtPrazos: TEdit;
    btnGerarDatas: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edtPrazosClick(Sender: TObject);
    procedure btnGerarDatasClick(Sender: TObject);
    procedure GerarQdeParcelas;
    procedure GerarDatasDeVencimentos;
    procedure btnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPrazosKeyPress(Sender: TObject; var Key: Char);
    procedure btnGerarPrazoClick(Sender: TObject);
    procedure PageControl1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtGerarPrazoButtonClick(Sender: TObject);
    procedure dtGerarPrazoChange(Sender: TObject);
    procedure dtaInicioChange(Sender: TObject);
    procedure dtaInicioButtonClick(Sender: TObject);
    procedure TabPorDatasShow(Sender: TObject);
    procedure TabPorDigitacaoShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmConsPrazos: T_frmConsPrazos;
  qdedias, textoInicial : string;
  qdeDiasVencto         : array of integer;
  vl                    : array of integer;
  vencimentoGerado      : TDate;


implementation

uses U_BiblioSysSalao, DateUtils;

{$R *.dfm}

procedure T_frmConsPrazos.FormCreate(Sender: TObject);
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
    DataDoDia                    := now;
    dtDataInicial.Date           := DataDoDia;
    dtaInicio.Date               := DataDoDia;
    dtGerarPrazo.Date            := IncDay(DataDoDia,30); //soma 30 dias á data atual ou now+30 ou DataDoDia+30

end;

procedure T_frmConsPrazos.btnSairClick(Sender: TObject);
begin
Finalize(vl);
close;
end;

procedure T_frmConsPrazos.edtPrazosClick(Sender: TObject);
begin
    edtPrazos.Clear;
end;

procedure T_frmConsPrazos.btnGerarDatasClick(Sender: TObject);
begin
GerarQdeParcelas;
GerarDatasDeVencimentos;

//controlando os elementos
btnGerarDatas.Enabled := false;
btnLimpar.Enabled     := true;
grDataInicial.Enabled := false;
edtPrazos.Enabled     := false;

end;

procedure T_frmConsPrazos.GerarQdeParcelas;
begin
    lstPrazos.Clear;                             //limpando a lista logo que aperta o botão
    texto := edtPrazos.Text;
    qdeParcelas := (ContaChar(texto,'/'))+1;     //conta qtas vezes aparece a barra(/) na string ex:se aparece 3 vezes a qde de parcelas é = 4  => 30/40/120/240

    //ShowMessage('quantidade de parcelas = '+IntToStr(qdeParcelas));

end;
                                                              
procedure T_frmConsPrazos.GerarDatasDeVencimentos;
var i : integer;
begin
     texto := edtPrazos.Text;
     //alimentar o vetor vl com a qdeParcelas
     SetLength(vl,qdeParcelas);

     for i := 0 to qdeParcelas-1 do   //o valor inicial deve ser a partir do zero pois os indices do explode começam do zero
     begin
         //explode o texto na barra
         vl[i]            := strtoint(Explode(Texto, '/')[i]);
         vencimentoGerado := IncDay(dtDataInicial.Date,vl[i]);
         lstPrazos.Items.Add(IntToStr( vl[i] )+' Dias : '+DateToStr(vencimentoGerado));
         
         //ShowMessage('Tamanho do array: '+IntToStr(length(vl)));
     end;

end;


procedure T_frmConsPrazos.btnLimparClick(Sender: TObject);
begin
//Por digitação
edtPrazos.Clear;
lstPrazos.Clear;
edtQdeParcelas.Caption := '';
btnGerarDatas.Enabled  := false;
btnLimpar.Enabled      := false;
dtDataInicial.Date     := DataDoDia;
grDataInicial.Enabled  := true;
edtPrazos.Enabled      := true;
dtaInicio.Enabled      := true;
edtPrazos.Text         := 'Entre com as quantidades de dias';

//Por datas
lblPrazo.Caption       := '';
dtGerarPrazo.Date      := IncDay(DataDoDia,30);
dtaInicio.Date         := DataDoDia;
lstDatas.Clear;

end;

procedure T_frmConsPrazos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    release;
end;

procedure T_frmConsPrazos.edtPrazosKeyPress(Sender: TObject;
  var Key: Char);
begin
    btnGerarDatas.Enabled := true;
    // Só aceita digitação de Números
     If NOT (Key in['0'..'9',#8,#13,'-','/']) then begin Key:=#0;end;

end;

procedure T_frmConsPrazos.btnGerarPrazoClick(Sender: TObject);
var diasEntreAsDatas : integer;
begin
    btnLimpar.Enabled     := true;
    btnGerarPrazo.Enabled := false;
    dtaInicio.Enabled     := false;

    //gerando a string de dias ex: 30/60/90
    diasEntreAsDatas  := DaysBetween(dtaInicio.Date, dtGerarPrazo.date);
    lblPrazo.Caption  := lblPrazo.Caption + IntToStr(diasEntreAsDatas)+'/';

    //incrementar a lista
    lstDatas.Items.Add(IntToStr( diasEntreAsDatas )+' Dias  :  '+DateToStr(dtGerarPrazo.date));

end;

procedure T_frmConsPrazos.PageControl1Enter(Sender: TObject);
begin
  lstDatas.Clear;
end;

procedure T_frmConsPrazos.FormShow(Sender: TObject);
begin
    PageControl1.ActivePage := TabPorDigitacao;
end;

procedure T_frmConsPrazos.dtGerarPrazoButtonClick(Sender: TObject);
begin
btnGerarPrazo.Enabled := true;
end;

procedure T_frmConsPrazos.dtGerarPrazoChange(Sender: TObject);
begin
btnGerarPrazo.Enabled := true;
end;

procedure T_frmConsPrazos.dtaInicioChange(Sender: TObject);
begin
dtGerarPrazo.Date      := IncDay(dtaInicio.Date,30);
end;

procedure T_frmConsPrazos.dtaInicioButtonClick(Sender: TObject);
begin
dtGerarPrazo.Date      := IncDay(dtaInicio.Date,30);
end;

procedure T_frmConsPrazos.TabPorDatasShow(Sender: TObject);
begin
btnLimparClick(self);
end;

procedure T_frmConsPrazos.TabPorDigitacaoShow(Sender: TObject);
begin
btnLimparClick(self);
end;

end.
