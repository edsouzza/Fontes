unit U_CadContatosFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit;

type
  T_frmCadContatoFornecedores = class(TForm)
    pnl_cabecalho: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    panGridCadCategorias: TPanel;
    gr_CadCategorias: TGroupBox;
    gr_EditarNovo: TGroupBox;
    btnExcluir: TSpeedButton;
    btnNovo: TSpeedButton;
    btnGravar: TSpeedButton;
    btnSair: TSpeedButton;
    btnCancelar: TSpeedButton;
    gridContatos: TDBGrid;
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
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DesabilitarBotoesCredores;
    procedure gridContatosCellClick(Column: TColumn);
    procedure btnSairClick(Sender: TObject);
    procedure FecharAbrirTabelas;
    procedure RetornaEstadoInicialDosBotoes;
    procedure FormShow(Sender: TObject);
    procedure DBNOMEChange(Sender: TObject);
    procedure GravarContato;
    procedure LimparCampos;
    procedure VerificarDuplicidadeNaoDefinido;
    procedure PopularGridContatos;
    procedure DBNOMEExit(Sender: TObject);
    procedure DBFONEChange(Sender: TObject);
    procedure DBCELChange(Sender: TObject);
    procedure DBDDDFONEClick(Sender: TObject);
    procedure DBDDDCELClick(Sender: TObject);
    procedure DBIDNEXTELChange(Sender: TObject);
    procedure GravarSemContato;
    procedure FormKeyPress(Sender: TObject; var Key: Char);


  private
    { Private declarations }
     proxNumContato, IDSelecionado, IDForneCadastrado : integer;

  public
    { Public declarations }


  end;

var
  _frmCadContatoFornecedores : T_frmCadContatoFornecedores;
 

implementation

uses U_BiblioSysSalao, U_dmDadosSegundo, U_principal, U_dmDados,
  U_dmPesquisas, SqlExpr, U_Fornecedores, DBClient,
  U_ConsContatosFornecedores;

{$R *.dfm}


procedure T_frmCadContatoFornecedores.FormCreate(Sender: TObject);
//DESABILITA O BOTAO FECHAR DO FORMUL�RIO
var
  hwndHandle : THANDLE;
  hMenuHandle : HMenu;
begin
//Impede movimenta��o do formul�rio
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

procedure T_frmCadContatoFornecedores.FormShow(Sender: TObject);
begin

    IDForneCadastrado := StrToInt(IDForne);  //passando o id para verifica��o e dele��o se houver duplicidade de nao definidos

    VerificarDuplicidadeNaoDefinido;
    RetornaEstadoInicialDosBotoes;
    GravarSemContato;

end;

procedure T_frmCadContatoFornecedores.AbrirTabelas;
begin

    dm_Conexao.cds_ContatosForne.Active      := True;

end;


procedure T_frmCadContatoFornecedores.FecharTabelas;
begin

    dm_Conexao.cds_ContatosForne.Active       := False;

end;


procedure T_frmCadContatoFornecedores.FecharAbrirTabelas;
begin

    dm_Conexao.cds_ContatosForne.Active       := False;
    dm_Conexao.cds_ContatosForne.Active       := True;

    DM_Pesq.cdsPesqContatos.Active            := false;    //atualizando o grid apos dele��o
    DM_Pesq.cdsPesqContatos.Active            := true;   

end;


procedure T_frmCadContatoFornecedores.btn_SairClick(Sender: TObject);
begin

     close;

end;


procedure T_frmCadContatoFornecedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    close;

end;

procedure T_frmCadContatoFornecedores.edt_nomeKeyPress(Sender: TObject;
  var Key: Char);
begin

    // PARA DBEDIT ACEITAR APENAS NUMEROS
    If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmCadContatoFornecedores.LimparCampos;
begin

    DBNOME.Clear;
    DBFONE.Clear;
    DBCEL.Clear;
    DBNEXTEL.Clear;
    DBIDNEXTEL.Clear;
    gr_campos.Enabled := false;
    RetornaEstadoInicialDosBotoes;

end;

procedure T_frmCadContatoFornecedores.btnGravarClick(Sender: TObject);
begin
    
    if (DBNOME.Text = '') then
    begin

       Application.MessageBox('Preencha os campos corretamente para continuar o cadastro!',
                                    'Informa��o do Sistema', MB_OK + MB_ICONINFORMATION);

    end else begin
       
        GravarContato;
        FecharAbrirTabelas;
        LimparCampos;

    end;  

end;

procedure T_frmCadContatoFornecedores.GravarContato;
begin

     With DM_Pesq.qry_Cod do
     begin

        Close;
        SQL.Clear;
        SQL.Add('select max(id_contato) from contatos_fornecedores');
        Open;

        if not IsEmpty then
        begin

           proxNumContato := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

        end;

      end;

     with dm_Conexao.cds_ContatosForne do
     begin

        Append;

        FieldByName('id_contato').AsInteger   := proxNumContato;
        FieldByname('forne_id').AsInteger     := StrToInt(IDForne);
        FieldByname('nome').AsString          := DBNOME.Text;
        FieldByname('dddfone').AsString       := DBDDDFONE.Text;
        FieldByname('fone').AsString          := DBFONE.Text;
        FieldByname('dddcel').AsString        := DBDDDCEL.Text;
        FieldByname('cel').AsString           := DBCEL.Text;
        FieldByname('idnextel').AsString      := DBIDNEXTEL.Text;
        FieldByname('nextel').AsString        := DBNEXTEL.Text;
        FieldByname('status').AsString        := 'A';
        FieldByname('datacad').AsDateTime     := now;

     end;

     dm_Conexao.cds_ContatosForne.ApplyUpdates(0);
     LogOperacoes(NomeDoUsuarioLogado, 'cadastro de contato de fornecedores');
     PopularGridContatos;

end;



procedure T_frmCadContatoFornecedores.PopularGridContatos;
begin

     IDForneCadastrado := StrToInt(IDForne);

     _Sql := 'SELECT * FROM contatos_fornecedores WHERE forne_id = :pForneID AND status = '+QuotedStr('A')+' AND '+
             'nome <> '+QuotedStr('SEM CONTATO DEFINIDO')+' ';

     with DM_Pesq.cdsPesqContatos do
     begin

         close;
         CommandText:= (_Sql);
         Params.ParamByName('pForneID').AsInteger  := IDForneCadastrado;
         Open;

          if not IsEmpty then
          begin

                  with gridContatos do
                  begin

                    DataSource:=  DM_Pesq.dsPesqContatos;
                    Columns.Clear;

                    Columns.Add;
                    Columns[0].FieldName         := 'ID_CONTATO';
                    Columns[0].Width             := 70;
                    Columns[0].Alignment         := taCenter;
                    Columns[0].Title.caption     := 'C�DIGO';
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

end;


procedure T_frmCadContatoFornecedores.btnNovoClick(Sender: TObject);
begin

      gr_campos.Enabled   := true;
      btnGravar.Enabled   := true;
      btnCancelar.Enabled := true;
      btnNovo.Enabled     := false;

      DBNOME.ReadOnly     := false;
      DBDDDFONE.ReadOnly  := false;
      DBFONE.ReadOnly     := false;
      DBDDDCEL.ReadOnly   := false;
      DBCEL.ReadOnly      := false;
      DBNEXTEL.ReadOnly   := false;

      DBNOME.SetFocus;     

end;

procedure T_frmCadContatoFornecedores.btnExcluirClick(Sender: TObject);
begin

       texto:= 'Confirma a exclus�o do �tem selecionado?';

       if Application.MessageBox(PChar(texto),'Exclu�ndo �tem',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

           _Sql:= 'Delete FROM contatos_fornecedores WHERE id_contato = :pIDcontato';

            with DM_Pesq.Qry_Geral do begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              ParamByName('pIDcontato').AsInteger := IDSelecionado;
              ExecSQL();

           end;

           Application.MessageBox('Contato exclu�do com sucesso!',
           'Exclus�o', MB_OK + MB_ICONINFORMATION);
           LogOperacoes(NomeDoUsuarioLogado, 'exclus�o de contato de fornecedor');
           FecharAbrirTabelas;
           RetornaEstadoInicialDosBotoes;

      end else begin

          RetornaEstadoInicialDosBotoes;
          exit;

      end;

end;

procedure T_frmCadContatoFornecedores.btnCancelarClick(Sender: TObject);
begin

    dm_Conexao.cds_ContatosForne.CancelUpdates;
    dm_Conexao.cds_ContatosForne.Prior;

    FecharAbrirTabelas;
    RetornaEstadoInicialDosBotoes;
    DBNOME.ReadOnly     := true;
    DBDDDFONE.ReadOnly  := true;
    DBFONE.ReadOnly     := true;
    DBDDDCEL.ReadOnly   := true;
    DBCEL.ReadOnly      := true;
    DBNEXTEL.ReadOnly   := true;

end;

procedure T_frmCadContatoFornecedores.DesabilitarBotoesCredores;
begin

     btnGravar.Enabled    := false;
     btnNovo.Enabled      := false;
     btnSair.Enabled      := false;
     btnCancelar.Enabled  := true;

end;

procedure T_frmCadContatoFornecedores.RetornaEstadoInicialDosBotoes;
begin

     btnGravar.Enabled    := false;
     btnNovo.Enabled      := true;
     btnCancelar.Enabled  := false;
     btnSair.Enabled      := true;
     btnExcluir.Enabled   := false;

end;


procedure T_frmCadContatoFornecedores.gridContatosCellClick(Column: TColumn);
begin

    gr_campos.Enabled   := true;
    RetornaEstadoInicialDosBotoes;
    btnNovo.Enabled     := false;
    btnExcluir.Enabled  := true;
    btnCancelar.Enabled := true;

    IDSelecionado :=  DM_Pesq.cdsPesqContatos.Fields[0].AsInteger;

end;

procedure T_frmCadContatoFornecedores.btnSairClick(Sender: TObject);
begin

    close;

end;  

procedure T_frmCadContatoFornecedores.DBNOMEChange(Sender: TObject);
begin

    btnGravar.Enabled    := true;

end;

procedure T_frmCadContatoFornecedores.DBNOMEExit(Sender: TObject);
begin

   dbfone.SetFocus;    

end;

procedure T_frmCadContatoFornecedores.DBFONEChange(Sender: TObject);
begin

    if Length(Trim(DBFONE.Text)) = 9 then  DBCEL.setfocus;

end;

procedure T_frmCadContatoFornecedores.DBCELChange(Sender: TObject);
begin

  if Length(Trim(DBCEL.Text)) = 10 then  DBIDNEXTEL.setfocus;

end;

procedure T_frmCadContatoFornecedores.DBDDDFONEClick(Sender: TObject);
begin

    DBDDDFONE.SelStart  :=0;
    DBDDDFONE.SelLength := Length(DBDDDFONE.Text);

end;

procedure T_frmCadContatoFornecedores.DBDDDCELClick(Sender: TObject);
begin

    DBDDDCEL.SelStart  :=0;
    DBDDDCEL.SelLength := Length(DBDDDCEL.Text);

end;

procedure T_frmCadContatoFornecedores.DBIDNEXTELChange(Sender: TObject);
begin

    if Length(Trim(DBIDNEXTEL.Text)) = 9 then  DBNEXTEL.setfocus;
    
end;

procedure T_frmCadContatoFornecedores.GravarSemContato;
begin

      With DM_Pesq.qry_Cod do
      begin

        Close;
        SQL.Clear;
        SQL.Add('select max(id_contato) from contatos_fornecedores');
        Open;

        if not IsEmpty then
        begin

           proxNumContato := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

        end;

      end;

     with dm_Conexao.cds_ContatosForne do
     begin

        Append;

        FieldByName('id_contato').AsInteger   := proxNumContato;
        FieldByname('forne_id').AsInteger     := StrToInt(IDForne);
        FieldByname('nome').AsString          := 'SEM CONTATO DEFINIDO';
        FieldByname('dddfone').AsString       := DBDDDFONE.Text;
        FieldByname('fone').AsString          := DBFONE.Text;
        FieldByname('dddcel').AsString        := DBDDDCEL.Text;
        FieldByname('cel').AsString           := DBCEL.Text;
        FieldByname('idnextel').AsString      := DBIDNEXTEL.Text;
        FieldByname('nextel').AsString        := DBNEXTEL.Text;
        FieldByname('status').AsString        := 'A';
        FieldByname('datacad').AsDateTime     := now;

     end;

     dm_Conexao.cds_ContatosForne.ApplyUpdates(0);

     PopularGridContatos;

end;

procedure T_frmCadContatoFornecedores.VerificarDuplicidadeNaoDefinido;
begin


      With DM_Pesq.cdsPesqGeral do
      begin

        Close;
        CommandText := 'SELECT forne_id FROM contatos_fornecedores WHERE forne_id = :pIdForne';
        Params.ParamByName('pIdForne').AsInteger := IDForneCadastrado;
        Open;

        if not IsEmpty then
        begin

               with DM_Pesq.Qry_Geral do
               begin

                    close;
                    sql.Clear;
                    sql.Add('DELETE FROM contatos_fornecedores WHERE forne_id = :pIdForne');
                    Params.ParamByName('pIdForne').AsInteger  := IDForneCadastrado;
                    ExecSQL();

               end;

        end else begin

            exit;

        end;

      end;

  end;


procedure T_frmCadContatoFornecedores.FormKeyPress(Sender: TObject;
  var Key: Char);
begin         

      // Enter por Tab
      //verifica se a tecla pressionada � a tecla ENTER, conhecida pelo Delphi como #13
      If key = #13 then
      Begin
      //se for, passa o foco para o pr�ximo campo, zerando o valor da vari�vel Key
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
      end;


end;

end.
