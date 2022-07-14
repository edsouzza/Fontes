unit U_ListaPadraoComUmCampo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmListaPadraoComUmCampo = class(TForm)
    pnl1: TPanel;
    GroupBox1: TGroupBox;
    edtFiltro: TEdit;
    gridNome: TDBGrid;
    pnl_rodape: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridNomeCellClick(Column: TColumn);
    procedure edtFiltroChange(Sender: TObject);
    procedure edtFiltroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    //procedimentos personalizados
    procedure PopularGridSegmentos;
    procedure Pesquisar;
    procedure GerarColunasDoGrid;
    procedure gridNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  _frmListaPadraoComUmCampo: T_frmListaPadraoComUmCampo;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmDadosSegundo, DB;

{$R *.dfm}

procedure T_frmListaPadraoComUmCampo.FormCreate(Sender: TObject);
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

  lblDataDoDia.Caption      := DateToStr(date);
  lblHoraAtual.Caption      := timetoStr(time);
  self.Caption              := nomeTabela;
  pnl_rodape.Caption        := 'Selecione um ítem para continuar';

end;

procedure T_frmListaPadraoComUmCampo.FormShow(Sender: TObject);
begin

  AbrirTabela(cdsTable);
  gridNome.SetFocus;
  PopularGridSegmentos;

end;

procedure T_frmListaPadraoComUmCampo.Pesquisar;
var
  nome : string;
begin

       nome := edtFiltro.Text;
       _Sql := 'select * from '+nomeTabela+' WHERE '+campoNome+' <> '+QuotedStr('SISTEMA')+' AND '+campoNome+' LIKE (''%'+nome+'%'') ORDER BY '+campoNome+'';
       GerarColunasDoGrid;

end;

procedure T_frmListaPadraoComUmCampo.PopularGridSegmentos;
begin

  _Sql := 'SELECT * FROM '+nomeTabela+' WHERE '+campoNome+' <> '+QuotedStr('SISTEMA')+' ORDER BY '+campoNome+'';
  GerarColunasDoGrid;

end;

procedure T_frmListaPadraoComUmCampo.gridNomeCellClick(Column: TColumn);
begin

  IdGeral     :=  cdsTable.Fields[0].AsInteger;
  sTringGeral :=  cdsTable.Fields[1].AsString;
  close;

end;

procedure T_frmListaPadraoComUmCampo.edtFiltroChange(Sender: TObject);
begin
    Pesquisar;
end;

procedure T_frmListaPadraoComUmCampo.edtFiltroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if KEY = VK_RETURN then
     begin
          edtFiltro.Clear;
     end;

end;

procedure T_frmListaPadraoComUmCampo.GerarColunasDoGrid;
begin

  with cdsTable do
  begin

      Close;
      CommandText:= (_Sql);
      Open;

        if not IsEmpty then
        begin

            with gridNome do
            begin

              DataSource:=  dsTable;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName         := campoNome;
              Columns[0].Width             := 610;
              Columns[0].Alignment         := taLeftJustify;
              Columns[0].Title.caption     := nomeTabela;
              Columns[0].Title.Alignment   := taCenter;
              Columns[0].Title.Font.Style  := [fsBold];

            end;

        end;
   end;        

end;

procedure T_frmListaPadraoComUmCampo.gridNomeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if  (KEY=38) then
      begin
          cdsTable.Prior;  
      end;

      if  (KEY=40) then
      begin
           cdsTable.next;
      end;

      if (KEY=13) then
      begin

          IdGeral     :=  cdsTable.Fields[0].AsInteger;
          sTringGeral :=  cdsTable.Fields[1].AsString;
          close;

      end;

end;

end.
