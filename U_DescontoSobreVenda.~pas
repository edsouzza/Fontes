unit U_DescontoSobreVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EditNum, ExtCtrls, Buttons;

type
  T_frmDesconto = class(TForm)
    grp_CadastrarSenha: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    edtPorPercentual: TEditNum;
    edtPorValor: TEditNum;
    btnAplicarDesconto: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure edtPorPercentualClick(Sender: TObject);
    procedure edtPorValorClick(Sender: TObject);
    procedure btnAplicarDescontoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edtPorValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    PorPercentual, PorValor : double;

  end;

var
  _frmDesconto: T_frmDesconto;

implementation

uses
    U_Caixa, U_BiblioSysSalao, U_PagtoDoOrcamento;

{$R *.dfm}

procedure T_frmDesconto.FormCreate(Sender: TObject);
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

end;

procedure T_frmDesconto.FormShow(Sender: TObject);
begin
    PorPercentual              := 0;
    PorValor                   := 0;
    edtPorPercentual.SelStart  := 0;
    edtPorPercentual.SelLength := Length(edtPorPercentual.Text);
    edtPorPercentual.SetFocus;
end;

procedure T_frmDesconto.edtPorPercentualClick(Sender: TObject);
begin
     edtPorPercentual.SelStart  := 0;
     edtPorPercentual.SelLength := Length(edtPorPercentual.Text);
end;

procedure T_frmDesconto.edtPorValorClick(Sender: TObject);
begin
     edtPorValor.SelStart  := 0;
     edtPorValor.SelLength := Length(edtPorValor.Text);
end;

procedure T_frmDesconto.btnAplicarDescontoClick(Sender: TObject);
begin

      PorPercentual := StrToFloat(edtPorPercentual.Text);
      PorValor      := StrToFloat(edtPorValor.Text);

      if (PorPercentual > 0)then    //Por Percentual
      begin
            if(pagandoVenda)then
            begin
               _frmCaixa.AplicarDescontoPorPercentual;
               
            end else if(pagandoOrcamento)then
            begin
               _frmPagarOrcamento.AplicarDescontoPorPercentualOrcamento;
            end;

      end else if (PorPercentual = 0)then   //Por Valor
      begin
            if(pagandoVenda)then
            begin
               _frmCaixa.AplicarDescontoPorValor;
               
            end else if(pagandoOrcamento)then
            begin
               _frmPagarOrcamento.AplicarDescontoPorValorOrcamento;
            end;
      end;
      close;

end;

procedure T_frmDesconto.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If key = #13 then
    Begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure T_frmDesconto.edtPorValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if KEY = VK_RETURN then
      begin

          if(PorPercentual = 0)then
                btnAplicarDescontoClick(self);

      end;

end;

end.
