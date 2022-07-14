unit U_Configuracoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ExtDlgs, ShlObj, ShellApi, Grids,
  DBGrids;

type
  TF_CONFIGURACOES = class(TForm)
    pan_topo: TPanel;
    PanGrid: TPanel;
    pan_rodape: TPanel;
    btnSair: TBitBtn;
    btnGravar: TBitBtn;
    grDefinicoesGerais: TGroupBox;
    btnAtualizar: TButton;
    openIMAGE: TOpenPictureDialog;
    pan_atualizacao: TPanel;
    edtEnderecoCadastrada: TEdit;
    grVISUALIZACAO: TGroupBox;
    imgCADASTRADA: TImage;
    grCADASTROS: TGroupBox;
    pan_cadastro: TPanel;
    imgCadastro: TImage;
    edtLOCALIZACAO: TEdit;
    btnCadastrar: TButton;
    grGRID: TGroupBox;
    Label2: TLabel;
    lblHoraAtual: TLabel;
    lblStatusLogoff: TLabel;
    lblDataDoDia: TLabel;
    GridCadastrados: TDBGrid;
    btnVoltar: TBitBtn;
    btnExcluir: TBitBtn;
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridCadastradasCellClick(Column: TColumn);
    procedure GridCadastradosCellClick(Column: TColumn);

    //procedimentos personalizados
    procedure GravarConfig;
    procedure MostrarDadosCadastrados(id:integer);
    procedure AtualizarDados(id:integer);
    procedure PopularGrid;
    procedure ControlesDefault;
    procedure FecharAbrirTabelas;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

  private
    { Private declarations }
    cont, idItemSelecionado : integer;
    descricao : string;

  public
    { Public declarations }
  end;

var
  F_CONFIGURACOES: TF_CONFIGURACOES;

implementation
uses U_dmDados, U_dmDadosSegundo,  U_BiblioSysSalao, U_dmPesqDados,
  U_dmPesquisas, DB;

{$R *.dfm}

procedure TF_CONFIGURACOES.FormCreate(Sender: TObject);
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

   lblDataDoDia.Caption         := DateToStr(date);
   lblHoraAtual.Caption         := timetoStr(time);
   lblStatusLogoff.Caption      := IdentificarUsuarioLogado;
   cdsTable                     := DM_PesqDados.cdsPesqConfiguracoes;

end;

procedure TF_CONFIGURACOES.FormShow(Sender: TObject);
begin
  Caption := 'LOGADO POR '+NomeDoUsuarioLogado;
  ControlesDefault;
  PopularGrid;
end;

procedure TF_CONFIGURACOES.btnAtualizarClick(Sender: TObject);
begin

     cont                     :=1;  //alteração
     btnVoltar.Caption        := 'Cancelar';
     btnExcluir.enabled       := false;
     btnGravar.Enabled        :=true;
     GridCadastrados.Enabled  :=false;

     if openIMAGE.Execute then
     begin
         imgCADASTRADA.Picture.LoadFromFile(openIMAGE.FileName);
         edtEnderecoCadastrada.Text := openIMAGE.FileName;
     end;

end;

procedure TF_CONFIGURACOES.FecharAbrirTabelas;
begin

  cdsTable.Active:= false;
  cdsTable.Active:= true;

end;
                
procedure TF_CONFIGURACOES.btnSairClick(Sender: TObject);
begin
 Close;
end;

procedure TF_CONFIGURACOES.btnGravarClick(Sender: TObject);
begin

     if(cont = 0)then
     begin
        GravarConfig;
     end else
     begin
         AtualizarDados(idItemSelecionado);
     end;

     ControlesDefault;
     FecharAbrirTabelas;

end;

procedure TF_CONFIGURACOES.GravarConfig;
begin

     _Sql := 'insert into configuracoes (config_id, config_descricao, config_endereco, config_data) '+
                 'values (:config_id, :config_descricao, :config_endereco, :config_data)';

         with DM_Pesq.Qry_Auxiliar do
         begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             ParamByName('config_id').AsInteger             := proxNum;
             ParamByName('config_descricao').AsString       := descricao;
             ParamByName('config_endereco').AsString        := edtLOCALIZACAO.Text;
             ParamByName('config_data').AsDate              := Now;
             ExecSQL;

        end;

        Application.MessageBox('Registro gravado com sucesso!', 'Gravando...', MB_OK);

end;

procedure TF_CONFIGURACOES.AtualizarDados(id:integer);
begin

        _Sql := 'UPDATE configuracoes SET config_endereco=:pEnd WHERE config_id = :pId';

           With DM_Pesq.Qry_Geral do
           begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             Params.ParamByName('pEnd').AsString   := edtEnderecoCadastrada.Text;
             Params.ParamByName('pId').AsInteger   := id;
             ExecSQL();

          end;

          Application.MessageBox('Registro atualizado com sucesso!', 'Atualizando...', MB_OK);

end;


procedure TF_CONFIGURACOES.MostrarDadosCadastrados(id:integer);
begin

     //MOSTRA OS DADOS DO REGISTRO SELECIONADO
     with DM_Pesq.Qry_Geral do
     begin

         close;
         sql.Clear;
         sql.Add('SELECT * FROM configuracoes WHERE config_id = :pID');
         Params.ParamByName('pID').AsInteger   := id;
         open;

         if not IsEmpty then
         begin

              edtEnderecoCadastrada.Text     := DM_Pesq.Qry_Geral.Fields[2].AsString;
              imgCADASTRADA.Picture.LoadFromFile(edtEnderecoCadastrada.Text);

         end;

     end;

     if (edtEnderecoCadastrada.Text = '') then
     begin
       Application.MessageBox('Configure todas as imagens do Sistema!', 'Imagem não encontrada!', MB_ICONEXCLAMATION);
     end else begin
        imgCADASTRADA.Picture.LoadFromFile(edtEnderecoCadastrada.Text);
     end;

end;

procedure TF_CONFIGURACOES.btnCadastrarClick(Sender: TObject);
var
  ClickedOK: Boolean;

begin
      descricao := '';
      ClickedOK := InputQuery('Entre com a descrição', 'Descrição:', descricao);
      descricao := UpperCase(descricao);

      if ClickedOK then
      begin
      
         cont                     :=0;   //primeira configuração
         btnGravar.Enabled        := true;
         btnVoltar.enabled        := true;
         btnSair.Enabled          := false;
         GridCadastrados.Enabled  := false;
         grCADASTROS.Enabled      := false;

         if(edtLOCALIZACAO.Text = '')then
         begin
             //ShowMessage('CONTADOR = '+IntToStr(cont));
             proxNum := GerarProximoID('config_id','CONFIGURACOES');
             idItemSelecionado := proxNum;
         end;

         if openIMAGE.Execute then
         begin
             imgCadastro.Picture.LoadFromFile(openIMAGE.FileName);
             edtLOCALIZACAO.Text    := openIMAGE.FileName;
             grVISUALIZACAO.Enabled := false;
         end;

      end else
      begin

        ShowMessage('Operação Cancelada pelo Usuário!');
        ControlesDefault;

      end;

end;

procedure TF_CONFIGURACOES.PopularGrid;
begin

       with cdsTable do
       begin

          Close;
          _Sql := 'SELECT * FROM configuracoes';
          CommandText:= (_Sql);
          Open;

       end;

          with GridCadastrados do
          begin

            DataSource:=  DM_PesqDados.dsPesqConfiguracoes;
            Columns.Clear;

            Columns.Add;
            Columns[0].FieldName         := 'CONFIG_ID';
            Columns[0].Title.Caption     := 'CODIGO';
            Columns[0].Width             := 60;
            Columns[0].Alignment         := taCenter;
            Columns[0].Title.Alignment   := taCenter;
            Columns[0].Title.Font.Style  := [fsBold];
            Columns[0].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[1].FieldName         := 'CONFIG_DESCRICAO';
            Columns[1].Title.Caption     := 'DESCRIÇÃO';
            Columns[1].Width             := 300;
            Columns[1].Alignment         := taLeftJustify;
            Columns[1].Title.Alignment   := taLeftJustify;
            Columns[1].Title.Font.Style  := [fsBold];
            Columns[1].Title.Font.Color  := clWhite;

            Columns.Add;
            Columns[2].FieldName         := 'CONFIG_ENDERECO';
            Columns[2].Title.Caption     := 'LOCALIZAÇÃO';
            Columns[2].Width             := 480;
            Columns[2].Alignment         := taLeftJustify;
            Columns[2].Title.Alignment   := taLeftJustify;
            Columns[2].Title.Font.Style  := [fsBold];
            Columns[2].Title.Font.Color  := clWhite;

          end;

end;



procedure TF_CONFIGURACOES.gridCadastradasCellClick(Column: TColumn);
begin

     idItemSelecionado :=  DM_Pesq.Qry_Geral.Fields[0].AsInteger;
     MostrarDadosCadastrados(idItemSelecionado);

end;

procedure TF_CONFIGURACOES.GridCadastradosCellClick(Column: TColumn);
begin

    grVISUALIZACAO.Enabled := true;
    btnExcluir.enabled     := true;
    btnVoltar.enabled      := true;
    grCADASTROS.Enabled    := false;
    btnSair.Enabled        := false;
    btnVoltar.Caption      := 'Voltar';
    idItemSelecionado      := cdsTable.Fields[0].AsInteger;  //campo ID
    MostrarDadosCadastrados(idItemSelecionado);

end;

procedure TF_CONFIGURACOES.ControlesDefault;
begin

    btngravar.enabled          := false;
    btnVoltar.enabled          := false;
    btnExcluir.enabled         := false;
    grVISUALIZACAO.enabled     := false;
    grCADASTROS.enabled        := true;
    btnSair.Enabled            := true;
    GridCadastrados.Enabled    := true;
    edtEnderecoCadastrada.Text := '';
    edtLOCALIZACAO.Text        := '';
    imgCADASTRADA.Picture.Assign(nil);
    imgCadastro.Picture.Assign(nil);
    btnVoltar.Caption      := 'Cancelar';
    FecharAbrirTabelas;

end;

procedure TF_CONFIGURACOES.btnVoltarClick(Sender: TObject);
begin
  ControlesDefault;
end;

procedure TF_CONFIGURACOES.btnExcluirClick(Sender: TObject);
begin

   texto:= 'Confirma a exclusão do registro selecionado?';

   if Application.MessageBox(PChar(texto),'Exclusão de registro',MB_YESNO + MB_ICONQUESTION) = IdYes then
   begin

      DeletarRegistro('configuracoes','config_id',IntToStr(idItemSelecionado));
      Application.MessageBox('Registro excluído com sucesso!', 'Exclusão de registro...', MB_OK);

   end;

   ControlesDefault;

end;

end.
