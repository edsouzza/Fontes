unit U_ListaSegmentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmListaSegmentos = class(TForm)
    pnl_cabecalho: TPanel;
    pnl1: TPanel;
    pnl_rodape: TPanel;
    gridSegmentos: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure pnl_rodapeClick(Sender: TObject);
    procedure PopularGridSegmentos;
    procedure FecharAbrirTabelas;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FormShow(Sender: TObject);
    procedure gridSegmentosCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  _frmListaSegmentos: T_frmListaSegmentos;

implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelAniversariantes, U_dmDadosSegundo,
  U_ConsTodosPedidos, U_ConsPedidosPorPeriodo, U_CadPedido, U_ContasPagar,
  U_CadCredores, DB;

{$R *.dfm}

procedure T_frmListaSegmentos.FormCreate(Sender: TObject);
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

procedure T_frmListaSegmentos.pnl_rodapeClick(
  Sender: TObject);
begin

     close;
     Release;

end;

procedure T_frmListaSegmentos.AbrirTabelas;
begin

    dm_DadosSegundo.cds_Segmentos.Active      := True;

end;


procedure T_frmListaSegmentos.FecharTabelas;
begin

    dm_DadosSegundo.cds_Segmentos.Active       := False;

end;


procedure T_frmListaSegmentos.FecharAbrirTabelas;
begin

    dm_DadosSegundo.cds_Segmentos.Active       := False;
    dm_DadosSegundo.cds_Segmentos.Active       := True;

end;

procedure T_frmListaSegmentos.PopularGridSegmentos;
begin

  //MOSTRA TODOS OS SEGMENTOS

  with dm_DadosSegundo.cds_Segmentos do
  begin

      Close;
      CommandText:= ('SELECT * FROM segmentos');
      Open;

        if not IsEmpty then
        begin

            with gridSegmentos do
            begin

              DataSource:=  dm_DadosSegundo.ds_Segmentos;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName         := 'SEG_NOME';
              Columns[0].Width             := 600;
              Columns[0].Alignment         := taLeftJustify;
              Columns[0].Title.caption     := 'SEGMENTOS';
              Columns[0].Title.Font.Style  := [fsBold];

            end;

        end;
   end;
end;

procedure T_frmListaSegmentos.FormShow(Sender: TObject);
begin
  AbrirTabelas;
  PopularGridSegmentos;
end;

procedure T_frmListaSegmentos.gridSegmentosCellClick(Column: TColumn);
begin
  IdGeral     :=  dm_DadosSegundo.cds_Segmentos.fieldbyname('seg_id').AsInteger;
  sTringGeral :=  dm_DadosSegundo.cds_Segmentos.fieldbyname('seg_nome').AsString;
  close;

end;

procedure T_frmListaSegmentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FecharAbrirTabelas;
  FecharTabelas;
end;

end.
