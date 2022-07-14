unit U_EscolhaTipoAcao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  T_frmEscolhaTipoAcao = class(TForm)
    lstOpcoes: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure lstOpcoesClick(Sender: TObject);
    procedure lstOpcoesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     procedure PreencherListaOpcoes;
     procedure SelecionarItem;
  public
    { Public declarations }
  end;

var
  _frmEscolhaTipoAcao: T_frmEscolhaTipoAcao;

implementation

uses U_BiblioSysSalao, U_Clientes, U_orcamento, U_EscolhaParaOrcamentos;

{$R *.dfm}

procedure T_frmEscolhaTipoAcao.FormCreate(Sender: TObject);
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

procedure T_frmEscolhaTipoAcao.FormShow(Sender: TObject);
begin
   PreencherListaOpcoes;
end;

procedure T_frmEscolhaTipoAcao.lstOpcoesClick(Sender: TObject);
begin

     SelecionarItem;

end;

procedure T_frmEscolhaTipoAcao.PreencherListaOpcoes;
begin

       if(ModuloFrenteCaixaAtivado) then
       begin
           lstOpcoes.Items.Add('ORÇAMENTO : '+sNomeClienteVenda);
           lstOpcoes.Items.Add('VENDA : '+sNomeClienteVenda);

       end else
       begin
           lstOpcoes.Items.Add('ORÇAMENTO',);
       end;
       lstOpcoes.Selected[0]:= true;  //selecionando o primeiro ítem

end;

procedure T_frmEscolhaTipoAcao.SelecionarItem;
begin

     if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'ORÇAMENTO : '+sNomeClienteVenda then
     begin

           //abrir orçamento
           abrindoOrcamento:=true;

           Application.CreateForm(T_frmOrcamento,  _frmOrcamento);

           _frmOrcamento.txtNomeCliente.Caption     :=  sNomeClienteVenda;
           _frmOrcamento.txt_IDCLIENTE.Text         :=  sIdClienteVenda;
           _frmOrcamento.panel_detalhes.Visible     :=  true;
           _frmOrcamento.AbreNovoOrcamento;
           _frmOrcamento.ShowModal;
           FreeAndNil(_frmOrcamento);

           close;


     end else if lstOpcoes.Items[lstOpcoes.ItemIndex] = 'VENDA : '+sNomeClienteVenda then
     begin

           _frmClientes.IniciarVenda;
           close;

     end;

end;

procedure T_frmEscolhaTipoAcao.lstOpcoesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if key=vk_return then
      SelecionarItem;

end;

end.
