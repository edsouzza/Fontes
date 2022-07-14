unit U_EditarContatosFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit;

type
  T_frmEditarContatosFornecedores = class(TForm)
    pnl_cabecalho: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    panGridCadCategorias: TPanel;
    gr_CadCategorias: TGroupBox;
    gr_EditarNovo: TGroupBox;
    btnGravar: TSpeedButton;
    btnSair: TSpeedButton;
    gridContatosEditar: TDBGrid;
    gr_campos: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBNOME: TEdit;
    DBDDDFONE: TEdit;
    DBDDDCEL: TEdit;
    DBFONE: TMaskEdit;
    DBCEL: TMaskEdit;
    DBIDNEXTEL: TEdit;
    DBNEXTEL: TMaskEdit;
    Label1: TLabel;
    procedure btn_SairClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edt_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure btnGravarClick(Sender: TObject);
    procedure DesabilitarBotoesCredores;
    procedure gridContatosEditarCellClick(Column: TColumn);
    procedure btnSairClick(Sender: TObject);
    procedure FecharAbrirTabelas;
    procedure FormShow(Sender: TObject);
    procedure DBNOMEChange(Sender: TObject);
    procedure GravarAlteracoes;
    procedure PreencherDadosParaEdicao;
    procedure PopularGridContatos;
    procedure DBNOMEExit(Sender: TObject);
    procedure DBFONEChange(Sender: TObject);
    procedure DBCELChange(Sender: TObject);
    procedure DBDDDFONEClick(Sender: TObject);
    procedure DBDDDCELClick(Sender: TObject);
    procedure DBIDNEXTELChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);


  private
    { Private declarations }
     IDSelecionado : integer;

  public
    { Public declarations }


  end;

var
  _frmEditarContatosFornecedores : T_frmEditarContatosFornecedores;
 

implementation

uses U_BiblioSysSalao, U_dmDadosSegundo, U_principal, U_dmDados,
  U_dmPesquisas, SqlExpr, U_Fornecedores, DBClient,
  U_ConsContatosFornecedores;

{$R *.dfm}


procedure T_frmEditarContatosFornecedores.FormCreate(Sender: TObject);
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

   lblDataDoDia.Caption :=  DateToStr(date);
   lblHoraAtual.Caption :=  timetoStr(time);
   AbrirTabelas;

end;

procedure T_frmEditarContatosFornecedores.FormShow(Sender: TObject);
begin

    PopularGridContatos;

end;

procedure T_frmEditarContatosFornecedores.AbrirTabelas;
begin

    dm_Conexao.cds_ContatosForne.Active      := True;

end;


procedure T_frmEditarContatosFornecedores.FecharTabelas;
begin

    dm_Conexao.cds_ContatosForne.Active       := False;

end;


procedure T_frmEditarContatosFornecedores.FecharAbrirTabelas;
begin

    dm_Conexao.cds_ContatosForne.Active       := False;
    dm_Conexao.cds_ContatosForne.Active       := True;

    DM_Pesq.cdsPesqContatos.Active            := false;    //atualizando o grid apos deleção
    DM_Pesq.cdsPesqContatos.Active            := true;   

end;


procedure T_frmEditarContatosFornecedores.btn_SairClick(Sender: TObject);
begin

     close;

end;


procedure T_frmEditarContatosFornecedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    close;

end;

procedure T_frmEditarContatosFornecedores.edt_nomeKeyPress(Sender: TObject;
  var Key: Char);
begin

    // PARA DBEDIT ACEITAR APENAS NUMEROS
    If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmEditarContatosFornecedores.btnGravarClick(Sender: TObject);
begin

      GravarAlteracoes;
      FecharAbrirTabelas;

end;

procedure T_frmEditarContatosFornecedores.GravarAlteracoes;
begin


     _Sql:= 'UPDATE contatos_fornecedores SET nome = :pNome, dddfone = :pDddfone,  fone = :pfone, '+
            'dddcel = :pDddcel,  cel = :pCel, idnextel = :pIDNextel, nextel=:pNextel WHERE id_contato = :pIDContato';

     With DM_Pesq.Qry_Geral do
     begin

        Close;
        SQL.Clear;
        SQL.Add(_Sql);
        ParamByName('pIDContato').AsInteger  := IdContatoSelecionado;
        ParamByName('pNome').AsString        := DBNOME.Text;
        ParamByName('pDddfone').AsString     := DBDDDFONE.Text;
        ParamByName('pfone').AsString        := DBFONE.Text;
        ParamByName('pDddcel').AsString      := DBDDDCEL.Text;
        ParamByName('pCel').AsString         := DBCEL.Text;
        ParamByName('pIDNextel').AsString    := DBIDNEXTEL.Text;
        ParamByName('pNextel').AsString      := DBNEXTEL.Text;
        ExecSQL();

      end;

      FecharAbrirTabelas;    

      Application.MessageBox('Alterações efetuadas com sucesso!', 'OK!', MB_OK + MB_ICONINFORMATION);
      LogOperacoes(NomeDoUsuarioLogado, 'alteração no contato de fornecedores');
      close;

end;



procedure T_frmEditarContatosFornecedores.PopularGridContatos;
begin


     _Sql := 'SELECT * FROM contatos_fornecedores WHERE id_contato = :pIDContato AND status = '+QuotedStr('A')+' '+
             'AND nome <> '+QuotedStr('SEM CONTATO DEFINIDO')+' ';
             
     with DM_Pesq.cdsPesqContatos do
     begin

         close;
         CommandText:= (_Sql);
         Params.ParamByName('pIDContato').AsInteger  := IdContatoSelecionado;
         Open;

          if not IsEmpty then
          begin

                  with gridContatosEditar do
                  begin

                    DataSource:=  DM_Pesq.dsPesqContatos;
                    Columns.Clear;

                    Columns.Add;
                    Columns[0].FieldName         := 'ID_CONTATO';
                    Columns[0].Width             := 70;
                    Columns[0].Alignment         := taCenter;
                    Columns[0].Title.caption     := 'CÓDIGO';
                    Columns[0].Title.Font.Style  := [fsBold];
                    Columns[0].Title.Font.Color  := clBlack;
                    Columns[0].Title.Alignment   := taCenter;

                    Columns.Add;
                    Columns[1].FieldName         := 'NOME';
                    Columns[1].Width             := 320;
                    Columns[1].Alignment         := taLeftJustify;
                    Columns[1].Title.caption     := 'NOME';
                    Columns[1].Title.Font.Style  := [fsBold];
                    Columns[1].Title.Font.Color  := clBlack;
                    Columns[1].Title.alignment   := taCenter;

                    Columns.Add;
                    Columns[2].FieldName         := 'DDDFONE';
                    Columns[2].Width             := 40;
                    Columns[2].Alignment         := taCenter;
                    Columns[2].Title.caption     := 'DDD';
                    Columns[2].Title.Font.Style  := [fsBold];
                    Columns[2].Title.Font.Color  := clBlack;
                    Columns[2].Title.alignment   := taCenter;

                    Columns.Add;
                    Columns[3].FieldName         := 'FONE';
                    Columns[3].Width             := 80;
                    Columns[3].Alignment         := taCenter;
                    Columns[3].Title.caption     := 'TELEFONE';
                    Columns[3].Title.Font.Style  := [fsBold];
                    Columns[3].Title.Font.Color  := clBlack;
                    Columns[3].Title.alignment   := taCenter;

                    Columns.Add;
                    Columns[4].FieldName         := 'CEL';
                    Columns[4].Width             := 80;
                    Columns[4].Alignment         := taCenter;
                    Columns[4].Title.caption     := 'CEL';
                    Columns[4].Title.Font.Style  := [fsBold];
                    Columns[4].Title.Font.Color  := clBlack;
                    Columns[4].Title.alignment   := taCenter;

                    Columns.Add;
                    Columns[5].FieldName         := 'IDNEXTEL';
                    Columns[5].Width             := 80;
                    Columns[5].Alignment         := taCenter;
                    Columns[5].Title.caption     := 'ID';
                    Columns[5].Title.Font.Style  := [fsBold];
                    Columns[5].Title.Font.Color  := clBlack;
                    Columns[5].Title.alignment   := taCenter;

                    Columns.Add;
                    Columns[6].FieldName         := 'NEXTEL';
                    Columns[6].Width             := 80;
                    Columns[6].Alignment         := taCenter;
                    Columns[6].Title.caption     := 'NEXTEL';
                    Columns[6].Title.Font.Style  := [fsBold];
                    Columns[6].Title.Font.Color  := clBlack;
                    Columns[6].Title.alignment   := taCenter;

                  end;

          end;

     end;

     PreencherDadosParaEdicao;

end;


procedure T_frmEditarContatosFornecedores.DesabilitarBotoesCredores;
begin

     btnGravar.Enabled    := false;
     btnSair.Enabled      := false;

end;

procedure T_frmEditarContatosFornecedores.gridContatosEditarCellClick(Column: TColumn);
begin

    gr_campos.Enabled   := true;

    IDSelecionado :=  DM_Pesq.cdsPesqContatos.Fields[0].AsInteger;

end;

procedure T_frmEditarContatosFornecedores.btnSairClick(Sender: TObject);
begin

    close;     

end;  

procedure T_frmEditarContatosFornecedores.DBNOMEChange(Sender: TObject);
begin

    btnGravar.Enabled    := true;

end;

procedure T_frmEditarContatosFornecedores.DBNOMEExit(Sender: TObject);
begin

   dbfone.SetFocus;
   btnGravar.Enabled   := true;

end;

procedure T_frmEditarContatosFornecedores.DBFONEChange(Sender: TObject);
begin

    if Length(Trim(DBFONE.Text)) = 9 then  DBCEL.setfocus;

end;

procedure T_frmEditarContatosFornecedores.DBCELChange(Sender: TObject);
begin

  if Length(Trim(DBCEL.Text)) = 10 then  DBIDNEXTEL.setfocus;

end;

procedure T_frmEditarContatosFornecedores.DBDDDFONEClick(Sender: TObject);
begin

    DBDDDFONE.SelStart  :=0;
    DBDDDFONE.SelLength := Length(DBDDDFONE.Text);

end;

procedure T_frmEditarContatosFornecedores.DBDDDCELClick(Sender: TObject);
begin

    DBDDDCEL.SelStart  :=0;
    DBDDDCEL.SelLength := Length(DBDDDCEL.Text);

end;

procedure T_frmEditarContatosFornecedores.DBIDNEXTELChange(Sender: TObject);
begin

    if Length(Trim(DBIDNEXTEL.Text)) = 9 then  DBNEXTEL.setfocus;
    
end;

procedure T_frmEditarContatosFornecedores.FormKeyPress(Sender: TObject;
  var Key: Char);
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

procedure T_frmEditarContatosFornecedores.PreencherDadosParaEdicao;
begin

      DBNOME.Text        := DM_Pesq.cdsPesqContatos.FieldByname('nome')    .AsString;
      DBDDDFONE.Text     := DM_Pesq.cdsPesqContatos.FieldByname('dddfone') .AsString;
      DBFONE.Text        := DM_Pesq.cdsPesqContatos.FieldByname('fone')    .AsString;
      DBDDDCEL.Text      := DM_Pesq.cdsPesqContatos.FieldByname('dddcel')  .AsString;
      DBCEL.Text         := DM_Pesq.cdsPesqContatos.FieldByname('cel')     .AsString;
      DBIDNEXTEL.Text    := DM_Pesq.cdsPesqContatos.FieldByname('idnextel').AsString;
      DBNEXTEL.Text      := DM_Pesq.cdsPesqContatos.FieldByname('nextel')  .AsString;

      DBNOME.SetFocus;

end;

end.
