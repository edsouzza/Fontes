unit U_EscolhaDoCredorParaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaCredorParaPagamento = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    gridCredor: TDBGrid;
    GroupBox1: TGroupBox;
    edt_Nome: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure PopulandoGrid;
    procedure pnl_rodapeClick(Sender: TObject);
    procedure gridCredorCellClick(Column: TColumn);
    procedure PesquisaPeloNomeCredor;
    procedure edt_NomeChange(Sender: TObject);
    procedure edt_NomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    

  end;

var
  _frmEscolhaCredorParaPagamento: T_frmEscolhaCredorParaPagamento;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas,
  DB, U_Cotacao, U_dmDadosSegundo,U_Clientes, U_ContasPagar;

{$R *.dfm}

procedure T_frmEscolhaCredorParaPagamento.FormCreate(Sender: TObject);
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

  PopulandoGrid;

end;

procedure T_frmEscolhaCredorParaPagamento.PopulandoGrid;
begin

        _Sql := 'SELECT * FROM credores ORDER BY credor';

            with DM_Pesq.cdsPesqCredores do
            begin

                Close;
                CommandText:= (_Sql);
                Open;

                if IsEmpty then begin

                   gridCredor.Enabled := false;
                   edt_Nome.Enabled   := false;

                end else
                begin

                        with gridCredor do
                        begin

                          DataSource:=  DM_Pesq.dsPesqCredores;
                          Columns.Clear;

                          Columns.Add;
                          Columns[0].FieldName       := 'CREDOR';
                          Columns[0].Width           := 540;
                          Columns[0].Alignment       := taLeftJustify;

                        end;

                end;

          end;

end;

procedure T_frmEscolhaCredorParaPagamento.pnl_rodapeClick(Sender: TObject);
begin

   close;

end;

procedure T_frmEscolhaCredorParaPagamento.gridCredorCellClick(
  Column: TColumn);
begin
      nomeDoCredorParaFiltrarBoletos          :=  DM_Pesq.cdsPesqCredores.fieldbyname('CREDOR').AsString;
      _frmContasPagar.edtCredor.Caption       :=  DM_Pesq.cdsPesqCredores.fieldbyname('CREDOR').AsString;
      _frmContasPagar.edtIDCredor.Text        :=  IntToStr(DM_Pesq.cdsPesqCredores.fieldbyname('ID_CREDOR').AsInteger);
      _frmContasPagar.edtValorConta.Enabled   :=  true;
      _frmContasPagar.edtVencimento.Enabled   :=  true;
      _frmContasPagar.btnGravarBoleto.Enabled :=  true;
      _frmContasPagar.edtValorConta.SetFocus;
      close;


end;

procedure T_frmEscolhaCredorParaPagamento.PesquisaPeloNomeCredor;
var
  nome : string;
begin

      nome := edt_Nome.Text;

       _Sql := 'SELECT * FROM credores WHERE credor LIKE (''%'+nome+'%'')';

        with DM_Pesq.cdsPesqCredores do begin

                Close;
                CommandText:=(_Sql);
                Open;

                if IsEmpty then begin

                   gridCredor.Enabled := false;
                   edt_Nome.Enabled      := false;

                end else begin

                    with gridCredor do
                    begin

                      DataSource:=  DM_Pesq.dsPesqCredores;
                      Columns.Clear;

                      Columns.Add;
                      Columns[0].FieldName       := 'CREDOR';
                      Columns[0].Width           := 540;
                      Columns[0].Alignment       := taLeftJustify;

                    end;

                end;

            end;

end;


procedure T_frmEscolhaCredorParaPagamento.edt_NomeChange(
  Sender: TObject);
begin

    PesquisaPeloNomeCredor;

end;

procedure T_frmEscolhaCredorParaPagamento.edt_NomeKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin


         if key=13 then begin

                _frmContasPagar.edtCredor.Caption       :=  DM_Pesq.cdsPesqCredores.fieldbyname('CREDOR').AsString;
                _frmContasPagar.edtIDCredor.Text        :=  IntToStr(DM_Pesq.cdsPesqCredores.fieldbyname('ID_CREDOR').AsInteger);
                _frmContasPagar.edtValorConta.Enabled   :=  true;
                _frmContasPagar.edtVencimento.Enabled   :=  true;
                _frmContasPagar.btnGravarBoleto.Enabled :=  true;
                _frmContasPagar.edtValorConta.SetFocus;
                close;

         end;

         case Key of

           VK_UP  : DM_Pesq.cdsPesqCredores.Prior;
           VK_DOWN: DM_Pesq.cdsPesqCredores.Next;

         end;

end;

procedure T_frmEscolhaCredorParaPagamento.FormShow(Sender: TObject);
begin

  edt_Nome.SetFocus;
  
end;

end.
