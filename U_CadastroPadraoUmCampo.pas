unit U_CadastroPadraoUmCampo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  T_frmCadastroPadraoUmCampo = class(TForm)
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
    procedure edt_nomeChange(Sender: TObject);


  private
    { Private declarations }
    
  public
    { Public declarations }
  end;

var
  _frmCadastroPadraoUmCampo: T_frmCadastroPadraoUmCampo;

implementation

uses U_BiblioSysSalao, U_dmDadosSegundo, U_principal, U_dmDados,
  U_dmPesquisas, SqlExpr, DB;

{$R *.dfm}


procedure T_frmCadastroPadraoUmCampo.FormCreate(Sender: TObject);
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

procedure T_frmCadastroPadraoUmCampo.FormShow(Sender: TObject);
begin    
  edtFiltro.SetFocus;
  GerarTitulosFormulario;
  AbrirTabela;
  PopularGrid;
  
end;

procedure T_frmCadastroPadraoUmCampo.GerarTitulosFormulario;
begin
      
    pnl_cabecalho.Caption      := 'CADASTRO DE '+nomeTabela;
    self.grBox.Caption         := campoNome;

end;

procedure T_frmCadastroPadraoUmCampo.GravarNovoRegistro;
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
            SQL.Add('select '+campoNome+' from '+nomeTabela+' WHERE '+campoNome+' = :pCampo'+' ORDER BY '+campoNome+'');
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

procedure T_frmCadastroPadraoUmCampo.SalvarAlteracaoRegistro;
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

procedure T_frmCadastroPadraoUmCampo.btnGravarClick(Sender: TObject);
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
            SQL.Add('select '+campoNome+' from '+nomeTabela+' WHERE '+campoNome+' = :pCampo'+' ORDER BY '+campoNome+'');
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

 
procedure T_frmCadastroPadraoUmCampo.btnSairClick(Sender: TObject);
begin
    _frmPrincipal.logo.Visible := true;
    FecharTabela;
    close;
end;
       
procedure T_frmCadastroPadraoUmCampo.AbrirTabela;
begin
  cdsTable.Active := TRUE;
end;

procedure T_frmCadastroPadraoUmCampo.FecharTabela;
begin
  cdsTable.Active := FALSE;
end;


procedure T_frmCadastroPadraoUmCampo.FecharAbrirTabela;
begin
  cdsTable.Active := FALSE;
  cdsTable.Active := TRUE;
end;


procedure T_frmCadastroPadraoUmCampo.btnNovoClick(Sender: TObject);
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

procedure T_frmCadastroPadraoUmCampo.LimparCampos;
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

procedure T_frmCadastroPadraoUmCampo.btnCancelarClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure T_frmCadastroPadraoUmCampo.Pesquisar;
var
  nome : string;
begin

       nome := edtFiltro.Text;

       _Sql := 'SELECT * FROM '+nomeTabela+' WHERE '+campoNome+' LIKE (''%'+nome+'%'') ORDER BY '+campoNome+'';
       GerarColunasDoGrid;

end;

procedure T_frmCadastroPadraoUmCampo.edtFiltroChange(Sender: TObject);
begin
   Pesquisar;
end;

procedure T_frmCadastroPadraoUmCampo.edtFiltroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if KEY = VK_RETURN then
     begin
           
          LimparCampos;

      end;

end;

procedure T_frmCadastroPadraoUmCampo.PopularGrid;
begin

   if not(TabelaEstaVazia(nomeTabela))then
   begin

         if(nomeTabela = 'CATEGORIAS')then
         begin
             _Sql := 'SELECT * FROM '+nomeTabela+' WHERE id_categoria > 1 ORDER BY '+campoNome+'';

         end else
         if(nomeTabela = 'FABRICANTES')then
         begin
             _Sql := 'SELECT * FROM '+nomeTabela+' WHERE id_fabricante > 1 ORDER BY '+campoNome+'';

         end else
              _Sql := 'SELECT * FROM '+nomeTabela+' ORDER BY '+campoNome+'';   

         GerarColunasDoGrid;

    end else begin

        edtFiltro.Enabled:=false;
        gridDados.DataSource:= nil;

    end;

    if (cadastrandoContato)then
    begin
       btnSair.Enabled:=false;
    end;

end;

procedure T_frmCadastroPadraoUmCampo.btnAlterarClick(Sender: TObject);
begin
  editando :=true;
  inserindo:=false;
  edt_nome.Enabled:=true;
  edt_nome.SetFocus;
end;


procedure T_frmCadastroPadraoUmCampo.gridDadosCellClick(Column: TColumn);
begin

    IdGeral             := cdsTable.fieldbyname(campoID).AsInteger;
    sTringGeral         := cdsTable.fieldbyname(campoNome).AsString;
    edt_nome.Text       := sTringGeral;
    btnNovo.Enabled     := false;
    btnAlterar.Enabled  := true;
    btnSair.Enabled     := false;
    btnCancelar.Enabled := true;

    if(cadastrandoContato)then
    begin  
       if MessageDlg('Confirma o uso deste segmento para o cadastro do contato em andamento?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
          sSegmentoContato   := sTringGeral;
          cadastrandoContato := false;
          close;
       end;
    end;

end;

procedure T_frmCadastroPadraoUmCampo.edt_nomeKeyPress(Sender: TObject;
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

procedure T_frmCadastroPadraoUmCampo.GerarColunasDoGrid;
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



procedure T_frmCadastroPadraoUmCampo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cadastrandoContato := false;
  FecharTabela;
  release;
end;

procedure T_frmCadastroPadraoUmCampo.edt_nomeChange(Sender: TObject);
var
    vl_label : TLabel; //variável do tipo Label
begin

      vl_label := TLabel.Create(self); //criamos um label

      with vl_label do
      begin

          //pegamos a fonte usada no edit
          Font.Name := TEdit(sender).Font.Name;

          //pegamos o conteúdo do edit
          Caption   := TEdit(sender).Text;

         //centraliza no label e retorna para o edit
          SendMessage(TEdit(sender).Handle, EM_SETMARGINS, EC_LEFTMARGIN,
          (TEdit(sender).Width-vl_label.Width) div 2);

      end;

      vl_label.Free;

end;

end.
