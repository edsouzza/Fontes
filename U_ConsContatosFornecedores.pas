unit U_ConsContatosFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  T_frmConsContatosFornecedores = class(TForm)
    panGridAlteraFabricantes: TPanel;
    GroupBox15: TGroupBox;
    GroupBox17: TGroupBox;
    btnSairAteracaoFornecedores: TSpeedButton;
    GroupBox9: TGroupBox;
    edtFiltraFornecedor: TEdit;
    btnInativar: TSpeedButton;
    GridContatos: TDBGrid;
    GridConsFornecedores: TDBGrid;
    txtMSG: TStaticText;
    btnCadastrarContatos: TSpeedButton;
    btnVoltar: TSpeedButton;
    btnEditarContato: TSpeedButton;
    procedure btnSairAteracaoFornecedoresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtFiltraFornecedorChange(Sender: TObject);
    procedure GridConsFornecedoresCellClick(Column: TColumn);
    procedure MostrarContatosDoFornecedor;
    procedure PesquisarPorNome;
    procedure edtFiltraFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridContatosCellClick(Column: TColumn);
    procedure InativarContato;
    procedure btnInativarClick(Sender: TObject);
    procedure btnCadastrarContatosClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarContatoClick(Sender: TObject);


  private
    { Private declarations }

    nomeDoContato : String;

  public
    { Public declarations }
    IDFornecedor  : integer;

  end;

var
  _frmConsContatosFornecedores: T_frmConsContatosFornecedores;

implementation

uses Q_RelImprimeEtiquetas, U_dmDados, U_dmDadosSegundo, U_dmPesquisas,
  U_BiblioSysSalao, DB, DBClient, U_CadContatosFornecedores,
  U_EditarContatosFornecedores;

{$R *.dfm}

procedure T_frmConsContatosFornecedores.btnSairAteracaoFornecedoresClick(
  Sender: TObject);
begin

    edtFiltraFornecedor.Clear;
    Close;
        
end;

procedure T_frmConsContatosFornecedores.FormCreate(Sender: TObject);
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

     dm_Conexao.cds_Fornecedor.Active := true;
     DM_Pesq.cdsPesqContatos.Active   := true;

end;

procedure T_frmConsContatosFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

     dm_Conexao.cds_Fornecedor.Active := false;
     DM_Pesq.cdsPesqContatos.Active   := false;

end;

procedure T_frmConsContatosFornecedores.edtFiltraFornecedorChange(
  Sender: TObject);
begin

   PesquisarPorNome;

end;

procedure T_frmConsContatosFornecedores.GridConsFornecedoresCellClick(
  Column: TColumn);
begin

    IDFornecedor :=  dm_Conexao.cds_Fornecedor.Fields[0].AsInteger;
    IDForne      :=  IntToStr(IDFornecedor);
    btnCadastrarContatos.Enabled := true;
    MostrarContatosDoFornecedor;      

end;

procedure T_frmConsContatosFornecedores.MostrarContatosDoFornecedor;
begin

      // Mostra todos os contatos do fornecedor selecionado

       _Sql := 'SELECT * FROM contatos_fornecedores WHERE forne_id = :pIDForne AND status = '+QuotedStr('A')+' AND '+
               'nome <> '+QuotedStr('SEM CONTATO DEFINIDO')+'';

       with DM_Pesq.cdsPesqContatos do
       begin

           close;
           CommandText:= _Sql;
           Params.ParamByName('pIDForne').AsInteger := IDFornecedor;
           open;

           if not IsEmpty then
           begin

               with GridContatos do
                begin

                  DataSource :=  DM_Pesq.dsPesqContatos;
                  Columns.Clear;

                  Columns.Add;
                  Columns[0].FieldName         := 'NOME';
                  Columns[0].Width             := 145;
                  Columns[0].Font.Color        := clBlue;
                  Columns[0].Alignment         := taLeftJustify;
                  Columns[0].Title.caption     := 'CONTATOS';
                  Columns[0].Title.Font.Style  := [fsBold];
                  Columns[0].Title.Font.Color  := clBlack;
                  Columns[0].Title.Alignment   := taCenter;

                  Columns.Add;
                  Columns[1].FieldName         := 'DDDFONE';
                  Columns[1].Width             := 45;
                  Columns[1].Font.Color        := clBlue;
                  Columns[1].Alignment         := taCenter;
                  Columns[1].Title.caption     := 'DDD';
                  Columns[1].Title.Font.Style  := [fsBold];
                  Columns[1].Title.Font.Color  := clBlack;
                  Columns[1].Title.alignment   := taCenter;

                  Columns.Add;
                  Columns[2].FieldName         := 'FONE';
                  Columns[2].Width             := 80;
                  Columns[2].Font.Color        := clBlue;
                  Columns[2].Alignment         := taCenter;
                  Columns[2].Title.caption     := 'TELEFONE';
                  Columns[2].Title.Font.Style  := [fsBold];
                  Columns[2].Title.Font.Color  := clBlack;
                  Columns[2].Title.alignment   := taCenter;

                  Columns.Add;
                  Columns[3].FieldName         := 'CEL';
                  Columns[3].Width             := 80;
                  Columns[3].Font.Color        := clBlue;
                  Columns[3].Alignment         := taCenter;
                  Columns[3].Title.caption     := 'CEL';
                  Columns[3].Title.Font.Style  := [fsBold];
                  Columns[3].Title.Font.Color  := clBlack;
                  Columns[3].Title.alignment   := taCenter;

                  Columns.Add;
                  Columns[4].FieldName         := 'IDNEXTEL';
                  Columns[4].Width             := 75;
                  Columns[4].Font.Color        := clBlue;
                  Columns[4].Alignment         := taCenter;
                  Columns[4].Title.caption     := 'ID';
                  Columns[4].Title.Font.Style  := [fsBold];
                  Columns[4].Title.Font.Color  := clBlack;
                  Columns[4].Title.alignment   := taCenter;

                  Columns.Add;
                  Columns[5].FieldName         := 'NEXTEL';
                  Columns[5].Width             := 80;
                  Columns[5].Font.Color        := clBlue;
                  Columns[5].Alignment         := taCenter;
                  Columns[5].Title.caption     := 'NEXTEL';
                  Columns[5].Title.Font.Style  := [fsBold];
                  Columns[5].Title.Font.Color  := clBlack;
                  Columns[5].Title.alignment   := taCenter;  


                  if ( DM_Pesq.cdsPesqContatos.RecordCount = 1 )then
                  begin

                      txtMSG.Caption     := IntToStr(DM_Pesq.cdsPesqContatos.RecordCount)+' contato cadastrado e ativo';
                      txtMSG.font.Color  := clBlue;

                  end else begin

                      txtMSG.Caption     := IntToStr(DM_Pesq.cdsPesqContatos.RecordCount)+' contatos cadastrados e ativos';
                      txtMSG.font.Color  := clBlue;

                 end;
             end
           end else begin

                txtMSG.Caption      := 'No momento n�o existem contatos cadastrados e ativos com esse fornecedor';
                txtMSG.font.Color   := clRed;

           end;

      end;

end;

procedure T_frmConsContatosFornecedores.PesquisarPorNome;
var
  nome : string;
begin

      nome := edtFiltraFornecedor.Text;

      _Sql  := 'SELECT * FROM fornecedores WHERE forne_status = '+QuotedStr('A')+' '+
                'AND forne_nome LIKE (''%'+nome+'%'') ORDER BY forne_nome';

      with dm_Conexao.cds_Fornecedor do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

            if not IsEmpty then
            begin

                 IDFornecedor :=  dm_Conexao.cds_Fornecedor.Fields[0].AsInteger;
                 MostrarContatosDoFornecedor;

            end;

      end;

end;

procedure T_frmConsContatosFornecedores.edtFiltraFornecedorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

    if KEY = VK_RETURN then
      begin

          edtFiltraFornecedor.Clear;

      end;

end;

procedure T_frmConsContatosFornecedores.GridContatosCellClick(
  Column: TColumn);
begin

    btnInativar.Enabled          := true;
    IdContatoSelecionado         :=  DM_Pesq.cdsPesqContatos.Fields[0].AsInteger;
    nomeDoContato                :=  DM_Pesq.cdsPesqContatos.Fields[2].AsString;
    btnCadastrarContatos.Enabled := false;
    btnVoltar.Enabled            := true;
    btnEditarContato.Enabled     := true;

end;

procedure T_frmConsContatosFornecedores.InativarContato;
begin

     with DM_Pesq.Qry_Geral do
     begin

          close;
          sql.Clear;
          sql.Add('UPDATE contatos_fornecedores SET status = '+QuotedStr('I')+' WHERE id_contato = :pIdContato');
          Params.ParamByName('pIdContato').AsInteger  := IdContatoSelecionado;
          ExecSQL();

     end;

     Application.MessageBox('O contato foi inativado com sucesso!', 'Inativar contato', MB_OK);
     LogOperacoes(NomeDoUsuarioLogado, 'inativa��o de contato de fornecedor');
     DM_Pesq.cdsPesqContatos.Active   := false;
     DM_Pesq.cdsPesqContatos.Active   := true;

     if ( DM_Pesq.cdsPesqContatos.RecordCount = 1 )then
      begin

          txtMSG.Caption     := IntToStr(DM_Pesq.cdsPesqContatos.RecordCount)+' contato cadastrado e ativo';
          txtMSG.font.Color  := clBlue;

      end else begin

          txtMSG.Caption     := IntToStr(DM_Pesq.cdsPesqContatos.RecordCount)+' contatos cadastrados e ativos';
          txtMSG.font.Color  := clBlue;

     end;

     btnInativar.Enabled  := false;

end;

procedure T_frmConsContatosFornecedores.btnInativarClick(Sender: TObject);
begin

          texto:= 'Confirma o desejo de inativar o contato '+nomeDoContato+'?';

          if Application.MessageBox(PChar(texto),'Inativar Contato',MB_YESNO + MB_ICONQUESTION) = IdYes then
          begin

              InativarContato;

          end else begin

               btnInativar.Enabled  := false;
               exit;

          end;

          btnCadastrarContatos.Enabled := true;
          btnEditarContato.Enabled     := false;
          btnVoltar.Enabled            := false;

end;

procedure T_frmConsContatosFornecedores.btnCadastrarContatosClick(
  Sender: TObject);
begin

     Application.CreateForm(T_frmCadContatoFornecedores,  _frmCadContatoFornecedores);
     _frmCadContatoFornecedores.ShowModal;
     FreeAndNil(_frmCadContatoFornecedores);

     btnCadastrarContatos.Enabled := false;

end;

procedure T_frmConsContatosFornecedores.btnVoltarClick(Sender: TObject);
begin

    btnCadastrarContatos.Enabled := true;
    btnInativar.Enabled          := false;
    btnVoltar.Enabled            := false;

end;

procedure T_frmConsContatosFornecedores.FormShow(Sender: TObject);
begin
  MostrarContatosDoFornecedor;
end;

procedure T_frmConsContatosFornecedores.btnEditarContatoClick(
  Sender: TObject);
begin

     Application.CreateForm(T_frmEditarContatosFornecedores,  _frmEditarContatosFornecedores);
     _frmEditarContatosFornecedores.ShowModal;
     FreeAndNil(_frmEditarContatosFornecedores);

     btnCadastrarContatos.Enabled := true;
     btnEditarContato.Enabled     := false;
     btnInativar.Enabled          := false;


end;

end.
