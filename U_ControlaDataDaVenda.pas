unit U_ControlaDataDaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider, DateUtils,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, Registry,MIDASLIB, Mask,
  ToolEdit, RXDBCtrl, EditNum;


type
  T_frmControlaDataDaVenda = class(TForm)
    pnl_Desbloqueio: TPanel;
    grp2: TGroupBox;
    grp1: TGroupBox;
    lbl5: TLabel;
    grp3: TGroupBox;
    btn_Confirmar: TSpeedButton;
    btnSair: TSpeedButton;
    panInfo: TPanel;
    edt_DataVenda: TDateEdit;
    edtAlteraPreco: TEditNum;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btn_ConfirmarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtAlteraPrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAlteraPrecoChange(Sender: TObject);
    procedure edt_DataVendaChange(Sender: TObject);
    procedure AlterarDataDaVenda;
    procedure edt_DataVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
_frmControlaDataDaVenda : T_frmControlaDataDaVenda;



implementation

uses U_Login, U_dmDadosSegundo, U_dmPesquisas, U_BiblioSysSalao, U_Caixa;
{$R *.dfm}

procedure T_frmControlaDataDaVenda.FormCreate(Sender: TObject);
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

procedure T_frmControlaDataDaVenda.btn_ConfirmarClick(Sender: TObject);
begin

     if ( alterouPreco ) then
     begin

        _frmCaixa.edtPrecoAlterado.Text    := edtAlteraPreco.Text;
        _frmCaixa.edtPrecoAlterado.Visible := true;
        _frmCaixa.edtPreco.Visible         := false;

     end;

         if ( DataVendaAlterada <> DataDoDia ) then
          begin

              with DM_Pesq.Qry_Geral do
              begin

                   close;
                   sql.Clear;
                   sql.Add('UPDATE venda SET data_venda = :pNovaData Where id_venda = :pIDVenda');
                   Params.ParamByName('pNovaData').AsDateTime  := DataVendaAlterada;
                   Params.ParamByName('pIDVenda').AsInteger    := IDVendaParaAlterarData;
                   ExecSQL;

              end;

              AlterouDataVenda := true;

          end else begin

              AlterouDataVenda := false;

          end;

    MensagemBtnOk('Alteração executada com sucesso','Alterando data da venda');
    LogOperacoes(NomeDoUsuarioLogado, 'Alteração de data de venda');

    close;

end;


procedure T_frmControlaDataDaVenda.btnSairClick(Sender: TObject);
begin

        _frmCaixa.edtPrecoAlterado.Text    := edtAlteraPreco.Text;
        _frmCaixa.edtPrecoAlterado.Visible := false;
        _frmCaixa.edtPreco.Visible         := true;    

        Close;

end;

procedure T_frmControlaDataDaVenda.FormShow(Sender: TObject);
begin

     edt_DataVenda.Date  := now;
     edtAlteraPreco.Clear;
     edtAlteraPreco.Text := FloatToStr(valorDoItem);

end;

procedure T_frmControlaDataDaVenda.edtAlteraPrecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

      if ( key = vk_return ) then
      begin

          alterouPreco := true;
          btn_ConfirmarClick(self);

      end;

end;

procedure T_frmControlaDataDaVenda.edtAlteraPrecoChange(Sender: TObject);
begin

     alterouPreco := true;

end;

procedure T_frmControlaDataDaVenda.edt_DataVendaChange(Sender: TObject);
begin

    AlterarDataDaVenda;

end;

procedure T_frmControlaDataDaVenda.AlterarDataDaVenda;
begin

     DataVendaAlterada := edt_DataVenda.Date;

end;

procedure T_frmControlaDataDaVenda.edt_DataVendaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

    if key=13 then
    begin

        edtAlteraPreco.SetFocus;

    end;


end;

end.

