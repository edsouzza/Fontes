unit U_CadastraCredor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  T_frmCadastraCredor = class(TForm)
    pnl_cabecalho: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    pnl_DadosUsuario: TPanel;
    gr_EditarNovo: TGroupBox;
    btnAlterar: TSpeedButton;
    btnNovo: TSpeedButton;
    btnGravar: TSpeedButton;
    btnSair: TSpeedButton;
    btnCancelar: TSpeedButton;
    gridDados: TDBGrid;
    grBox: TGroupBox;
    edt_nome: TEdit;
    edtFiltro: TEdit;
    
    procedure GravarNovoRegistro;
    procedure AbrirTabela;
    procedure FecharTabela;
    procedure FecharAbrirTabela;
    procedure LimparCampos;
    procedure Pesquisar;
    procedure GerarColunasDoGrid;
    procedure PopularGrid;
    procedure SalvarAlteracaoRegistro;
    procedure GerarTitulosFormulario;

    procedure btnGravarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtFiltroChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtFiltroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure gridDadosCellClick(Column: TColumn);
    procedure edt_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }
    
  public
    { Public declarations }
  end;

var
  _frmCadastraCredor: T_frmCadastraCredor;

implementation

uses U_BiblioSysSalao, U_dmDadosSegundo, U_principal, U_dmDados,
  U_dmPesquisas, SqlExpr, DB;

{$R *.dfm}


procedure T_frmCadastraCredor.FormCreate(Sender: TObject);
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

   lblDataDoDia.Caption:=  DateToStr(date);
   lblHoraAtual.Caption:=  timetoStr(time);


end;

procedure T_frmCadastraCredor.FormShow(Sender: TObject);
begin
  ShowMessage(nomeTabela);
  edtFiltro.SetFocus;
  GerarTitulosFormulario;
  AbrirTabela;
  PopularGrid;
  
end;

procedure T_frmCadastraCredor.GerarTitulosFormulario;
begin

    self.pnl_cabecalho.Caption := 'CADASTRO DE '+nomeTabela;
    self.Caption               := 'CADASTRO DE '+nomeTabela;
    self.grBox.Caption         := campoNome;

end;

procedure T_frmCadastraCredor.GravarNovoRegistro;
begin

   if (edt_nome.Text = '') then
    begin

       Application.MessageBox('Preencha os campos corretamente para continuar o cadastro!',
                                    'Informação do Sistema', MB_OK + MB_ICONINFORMATION);

    end else begin

        With DM_Pesq.Qry_Geral do
        begin

            Close;
            SQL.Clear;
            SQL.Add('select '+campoNome+' from '+nomeTabela+' WHERE '+campoNome+' = :pCampo');
            ParamByName('pCampo').AsString := edt_nome.Text;
            Open;

            if not IsEmpty then begin

                  Application.MessageBox('Um registro com este nome já esta cadastrado, verifique!',
                                          'Informação do Sistema', MB_OK + MB_ICONEXCLAMATION);
                  LimparCampos;


              end else begin

                  proxNum := GerarProximoID(campoID,nomeTabela);

                   with cdsTable do
                     begin

                         Append;
                         FieldByName(campoID).AsInteger     :=  proxNum;
                         FieldByName(campoNome).AsString    :=  edt_nome.Text;
                         ApplyUpdates(0);

                     end;


                   Application.MessageBox('Registro cadastrado com sucesso!',
                                          'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
                  LimparCampos;
                  
              end;
          end;
    end;

end;

procedure T_frmCadastraCredor.SalvarAlteracaoRegistro;
begin

    with DM_Pesq.Qry_Geral do
    begin

        close;
        sql.Clear;
        sql.Add('UPDATE '+nomeTabela+' SET '+campoNome+' = :pNome WHERE '+campoID+' = :pID');
        params.ParamByName('pNome').AsString     := edt_nome.Text;
        params.ParamByName('pID').AsInteger      := IdGeral;
        ExecSQL();

    end;
    FecharAbrirTabela;
end;

procedure T_frmCadastraCredor.btnGravarClick(Sender: TObject);
begin

    if(inserindo)then
    begin
      GravarNovoRegistro;
      PopularGrid;
    end else begin
       //se estiver editando
       With DM_Pesq.Qry_Geral do
        begin

            Close;
            SQL.Clear;
            SQL.Add('select '+campoNome+' from '+nomeTabela+' WHERE '+campoNome+' = :pCampo');
            ParamByName('pCampo').AsString := edt_nome.Text;
            Open;

            if not IsEmpty then begin

                  Application.MessageBox('Um registro com este nome já esta cadastrado!',
                                          'Informação do Sistema', MB_OK + MB_ICONEXCLAMATION);
                  LimparCampos;       

              end else begin
                  SalvarAlteracaoRegistro;
                  Application.MessageBox('Registro alterado com sucesso!',
                              'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
                  LimparCampos;

              end;
          end;
    end;
end;

 
procedure T_frmCadastraCredor.btnSairClick(Sender: TObject);
begin
    FecharTabela;
    close;
end;
       
procedure T_frmCadastraCredor.AbrirTabela;
begin
  cdsTable.Active := TRUE;
end;

procedure T_frmCadastraCredor.FecharTabela;
begin
  cdsTable.Active := FALSE;
end;


procedure T_frmCadastraCredor.FecharAbrirTabela;
begin
  cdsTable.Active := FALSE;
  cdsTable.Active := TRUE;
end;


procedure T_frmCadastraCredor.btnNovoClick(Sender: TObject);
begin
    edt_nome.Enabled    :=true;
    edtFiltro.Enabled   :=false;
    btnGravar.Enabled   :=true;
    btnNovo.Enabled     :=false;
    btnCancelar.Enabled :=true;
    btnSair.Enabled     :=false;
    inserindo:= true;
    editando := false;
    edt_nome.SetFocus;
end;

procedure T_frmCadastraCredor.LimparCampos;
begin
    edt_nome.Enabled    :=false;
    edtFiltro.Enabled   :=true;
    btnGravar.Enabled   :=false;
    btnNovo.Enabled     :=true;
    btnCancelar.Enabled :=false;
    btnAlterar.Enabled  :=false;
    btnSair.Enabled     :=true;
    edt_nome.Text       := '';
    edtFiltro.Text      := '';
    edtFiltro.SetFocus;
    PopularGrid;
end;

procedure T_frmCadastraCredor.btnCancelarClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure T_frmCadastraCredor.Pesquisar;
var
  nome : string;
begin

       nome := edtFiltro.Text;

       _Sql := 'SELECT * FROM '+nomeTabela+' WHERE '+campoNome+' LIKE (''%'+nome+'%'') ORDER BY '+campoNome+'';
       GerarColunasDoGrid;

end;

procedure T_frmCadastraCredor.edtFiltroChange(Sender: TObject);
begin
   Pesquisar;
end;

procedure T_frmCadastraCredor.edtFiltroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if KEY = VK_RETURN then
     begin
           
          LimparCampos;

      end;

end;

procedure T_frmCadastraCredor.PopularGrid;
begin

   if not(TabelaEstaVazia(nomeTabela))then
   begin

         _Sql := 'SELECT * FROM '+nomeTabela+'';
         GerarColunasDoGrid;

    end else begin

        edtFiltro.Enabled:=false;
        gridDados.DataSource:= nil;

    end;

end;

procedure T_frmCadastraCredor.btnAlterarClick(Sender: TObject);
begin
  editando :=true;
  inserindo:=false;
  edt_nome.Enabled:=true;
  edt_nome.SetFocus;
end;


procedure T_frmCadastraCredor.gridDadosCellClick(Column: TColumn);
begin

    IdGeral             := cdsTable.fieldbyname(campoID).AsInteger;
    sTringGeral         := cdsTable.fieldbyname(campoNome).AsString;
    edt_nome.Text       := sTringGeral;
    btnNovo.Enabled     := false;
    btnAlterar.Enabled  := true;
    btnSair.Enabled     := false;
    btnCancelar.Enabled := true;

end;

procedure T_frmCadastraCredor.edt_nomeKeyPress(Sender: TObject;
  var Key: Char);
begin
   if(editando)then
   begin
    btnGravar.Enabled   :=true;
    btnNovo.Enabled     :=false;
    btnCancelar.Enabled :=false;
    btnAlterar.Enabled  :=false;
    btnSair.Enabled     :=false;
   end;
end;

procedure T_frmCadastraCredor.GerarColunasDoGrid;
begin

     with cdsTable do
      begin

          Close;
          CommandText:=(_Sql);
          Open;

          if not IsEmpty then begin

              with gridDados do
              begin

                DataSource:=  dsTable;
                Columns.Clear;

                Columns.Add;
                Columns[0].FieldName         := campoID;
                Columns[0].Width             := 80;
                Columns[0].Alignment         := taCenter;
                Columns[0].Title.caption     := 'CODIGO';
                Columns[0].Title.Font.Style  := [fsBold];
                Columns[0].Title.Alignment   := taCenter;

                Columns.Add;
                Columns[1].FieldName         := campoNome;
                Columns[1].Width             := 610;
                Columns[1].Alignment         := taLeftJustify;
                Columns[1].Title.caption     := nomeTabela;
                Columns[1].Title.Font.Style  := [fsBold];
                Columns[1].Title.Alignment   := taCenter;

              end;

          end;

        end;         
end;



procedure T_frmCadastraCredor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FecharTabela;
end;

end.
