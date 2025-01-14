unit U_EscolhaDoFuncionarioParaCotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaFuncionarioParaCotacao = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    Grid_FuncionariosCotacao: TDBGrid;
    GroupBox1: TGroupBox;
    edt_NomeFuncionario: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure PopulandoGridFuncionarios;
    procedure pnl_rodapeClick(Sender: TObject);
    procedure PesquisaPeloNomeFuncionario;
    procedure edt_NomeFuncionarioChange(Sender: TObject);
    procedure edt_NomeFuncionarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    MesEscolhido : string;
  end;

var
  _frmEscolhaFuncionarioParaCotacao: T_frmEscolhaFuncionarioParaCotacao;

implementation

uses U_dmDados, U_BiblioSysSalao,U_dmPesquisas,
   U_Cotacao;

{$R *.dfm}

procedure T_frmEscolhaFuncionarioParaCotacao.FormCreate(Sender: TObject);
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

  PopulandoGridFuncionarios;

end;

procedure T_frmEscolhaFuncionarioParaCotacao.PopulandoGridFuncionarios;
begin

            with DM_Pesq.cdsPesqFuncionariosCotacao do begin

                Close;
                CommandText:= ('SELECT * FROM funcionarios WHERE func_nome <> :pFuncNome ORDER BY func_nome');
                Params.ParamByName('pFuncNome').AsString := 'ADMINISTRADOR';
                Open;

            end;

            with Grid_FuncionariosCotacao do
            begin

              DataSource:=  DM_Pesq.dsPesqFuncionariosCotacao;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName       := 'FUNC_NOME';
              Columns[0].Width           := 540;
              Columns[0].Alignment       := taLeftJustify;

            end;

end;

procedure T_frmEscolhaFuncionarioParaCotacao.pnl_rodapeClick(Sender: TObject);
begin
   close;
end;

procedure T_frmEscolhaFuncionarioParaCotacao.PesquisaPeloNomeFuncionario;
var
  nome : string;
begin

      nome := edt_NomeFuncionario.Text;

      with DM_Pesq.cdsPesqFuncionariosCotacao do begin

            Close;
            CommandText:= 'SELECT Func_nome, Func_id FROM funcionarios WHERE Func_nome LIKE (''%'+nome+'%'') ORDER BY Func_nome';
            Open;

      end;

end;

procedure T_frmEscolhaFuncionarioParaCotacao.edt_NomeFuncionarioChange(
  Sender: TObject);
begin

   PesquisaPeloNomeFuncionario;

end;

procedure T_frmEscolhaFuncionarioParaCotacao.edt_NomeFuncionarioKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

         if key=13 then begin



       end;

end;

end.
