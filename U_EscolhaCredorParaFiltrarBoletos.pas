unit U_EscolhaCredorParaFiltrarBoletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaCredorParaFiltrarBoletos = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    GridCredores: TDBGrid;
    GroupBox1: TGroupBox;
    edt_Nome: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure PopulandoGrid;
    procedure pnl_rodapeClick(Sender: TObject);
    procedure GridCredoresCellClick(Column: TColumn);
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
  _frmEscolhaCredorParaFiltrarBoletos: T_frmEscolhaCredorParaFiltrarBoletos;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas,
     DB, U_ContasPagar;

{$R *.dfm}

procedure T_frmEscolhaCredorParaFiltrarBoletos.FormCreate(Sender: TObject);
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

procedure T_frmEscolhaCredorParaFiltrarBoletos.PopulandoGrid;
begin


         _Sql := 'SELECT * FROM credores ORDER BY credor';

            with DM_Pesq.cdsPesqCredores do
            begin

                Close;
                CommandText:= (_Sql);
                Open;

                if IsEmpty then begin

                   GridCredores.Enabled := false;
                   edt_Nome.Enabled   := false;

                end else
                begin

                        with GridCredores do
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

procedure T_frmEscolhaCredorParaFiltrarBoletos.pnl_rodapeClick(Sender: TObject);
begin

   close;

end;

procedure T_frmEscolhaCredorParaFiltrarBoletos.GridCredoresCellClick(
  Column: TColumn);
begin

    nomeDoCredorParaFiltrarBoletos   :=  DM_Pesq.cdsPesqCredores.fieldbyname('CREDOR').AsString;

    if (PorCredor) then begin
          _frmContasPagar.FiltrarPorCredor;
          PorCredor := false;
    end;

    if (PorCredorVencidosPendentes) then begin
              _frmContasPagar.FiltrarPorCredorVencidosPendentes;
              PorCredorVencidosPendentes := false;
    end;

    if (PorCredorVencidosFinalizados) then begin
              _frmContasPagar.FiltrarPorCredorVencidosFinalizados;
              PorCredorVencidosFinalizados := false;
    end;

    if (PorCredorNaoVencidos) then begin
              _frmContasPagar.FiltrarPorCredorNaoVencidos;
              PorCredorNaoVencidos := false;
    end;

    close;
     
end;


procedure T_frmEscolhaCredorParaFiltrarBoletos.PesquisaPeloNomeCredor;
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

                   GridCredores.Enabled := false;
                   edt_Nome.Enabled      := false;

                end else begin

                    with GridCredores do
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


procedure T_frmEscolhaCredorParaFiltrarBoletos.edt_NomeChange(
  Sender: TObject);
begin

     PesquisaPeloNomeCredor;

end;
procedure T_frmEscolhaCredorParaFiltrarBoletos.edt_NomeKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

         if key=13 then
         begin

              nomeDoCredorParaFiltrarBoletos   :=  DM_Pesq.cdsPesqCredores.fieldbyname('CREDOR').AsString;

              if (PorCredor) then begin
                    _frmContasPagar.FiltrarPorCredor;
                    PorCredor := false;
              end;

              if (PorCredorVencidosPendentes) then begin
                        _frmContasPagar.FiltrarPorCredorVencidosPendentes;
                        PorCredorVencidosPendentes := false;
              end;

              if (PorCredorVencidosFinalizados) then begin
                        _frmContasPagar.FiltrarPorCredorVencidosFinalizados;
                        PorCredorVencidosFinalizados := false;
              end;

              if (PorCredorNaoVencidos) then begin
                    _frmContasPagar.FiltrarPorCredorNaoVencidos;
                    PorCredorNaoVencidos := false;
              end;

              close;

         end;

         case Key of

           VK_UP  : DM_Pesq.cdsPesqCredores.Prior;
           VK_DOWN: DM_Pesq.cdsPesqCredores.Next;

         end;         

end;

procedure T_frmEscolhaCredorParaFiltrarBoletos.FormShow(Sender: TObject);
begin

   edt_Nome.SetFocus;

end;

end.


