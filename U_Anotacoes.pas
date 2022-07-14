unit U_Anotacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr, DateUtils,
  ToolEdit, RXDBCtrl, Midas,DBClient;

type
  TF_ANOTACOES = class(TForm)
    pan_titulo: TPanel;
    pan_botoes: TPanel;
    btnCadastros: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnSair: TSpeedButton;
    pangrid_inclusao: TPanel;
    pangrid_alteracao: TPanel;
    lblHoraAtual: TLabel;
    pangrid_visualizacao: TPanel;
    GridTelaPrincipal: TDBGrid;
    txtMsg: TStaticText;
    GroupBox9: TGroupBox;
    edtFiltro: TEdit;
    memoTelaPrincipal: TDBMemo;
    grp2: TGroupBox;
    grp3: TGroupBox;
    btnConfirmaAlteracao: TSpeedButton;
    btnSairAlteracao: TSpeedButton;
    grp1: TGroupBox;
    Label3: TLabel;
    memoInclusaoObs: TMemo;
    GroupBox1: TGroupBox;
    btnConfirmaInclusao: TSpeedButton;
    btnSairInclusao: TSpeedButton;
    btnCancelarInclusao: TSpeedButton;
    Label45: TLabel;
    memoAlteraObs: TMemo;
    lbl11: TLabel;
    edt_nome: TEdit;
    lbl10: TLabel;
    edtAlteraNome: TEdit;
    dbIDAnotacao: TDBEdit;
    Label10: TLabel;
    btnExcluir: TSpeedButton;
    lblDataDoDia: TLabel;

    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCadastrosClick(Sender: TObject);
    procedure btnConfirmaInclusaoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarInclusaoClick(Sender: TObject);
    procedure btnSairAlteracaoClick(Sender: TObject);
    procedure btnConfirmaAlteracaoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_nomeChange(Sender: TObject);
    procedure btnSairInclusaoClick(Sender: TObject);
    procedure edt_nomeExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairConsClientesClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFiltroChange(Sender: TObject);
    procedure edtFiltroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridTelaPrincipalCellClick(Column: TColumn);
    procedure btnConsPorClienteClick(Sender: TObject);
    procedure memoTelaPrincipalEnter(Sender: TObject);
    procedure edt_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
      
    //procedimentos personalizados
    procedure EstadoInicialDosBotoes;
    procedure AtualizaQde;
    procedure GravaRegs;
    procedure ExcluirAnotacao;
    procedure Limpar;
    procedure BancoParaEdts;
    procedure GravarAlteracoes;
    procedure DesabilitarBotoes;
    procedure HabilitarBotoes;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure MostrandoAnotacaoTelaInicial;
    procedure FiltrarPorNome;
    procedure memoInclusaoObsEnter(Sender: TObject);
    procedure edtFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure memoInclusaoObsKeyPress(Sender: TObject; var Key: Char);
    procedure memoAlteraObsKeyPress(Sender: TObject; var Key: Char);
    procedure memoAlteraObsEnter(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

  private
    { Private declarations }
    nomeInclusao, obsInclusao, altNome, altObs : string;
    idAnotacaoSelecionada: integer;
    
    Function userTemAnotacoes : boolean;

  public
    { Public declarations }

  end;

var
  F_ANOTACOES: TF_ANOTACOES;


implementation

uses U_dmDados, U_dmPesquisas, U_dmDadosSegundo, U_ListaPadraoComUmCampo,
  U_BiblioSysSalao, DB, U_principal, U_QRelContatosCompleto, U_RelContatosIndividual,
  U_CadastroPadraoUmCampo, U_dmNewDataModule, U_dmPesqDados;

{$R *.dfm}


procedure TF_ANOTACOES.FormCreate(Sender: TObject);
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
    EstadoInicialDosBotoes;

end;


procedure TF_ANOTACOES.FormShow(Sender: TObject);
begin

    AbrirTabelas;
    AtualizaQde;
    MostrandoAnotacaoTelaInicial;
    Caption := 'LOGADO POR '+NomeDoUsuarioLogado;
    pan_titulo.Caption:= 'Anotações';

    if (userTemAnotacoes) then
    begin

       edtFiltro.Enabled         := true;
       GridTelaPrincipal.Enabled := true;
       memoTelaPrincipal.Enabled := true;
       edtFiltro.SetFocus;
       FiltrarPorNome;

    end else begin

       edtFiltro.Enabled         := false;
       GridTelaPrincipal.Enabled := false;
       memoTelaPrincipal.Enabled := false;

    end;

end;

procedure TF_ANOTACOES.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    Close;
    Release;

end;

procedure TF_ANOTACOES.btnCadastrosClick(Sender: TObject);
begin

  if (btnCadastros.Caption = 'Voltar')then
   begin
      EstadoInicialDosBotoes;
   end else
   begin

     GridTelaPrincipal.Enabled    := True;
     edt_nome.SetFocus;
     pan_titulo.Caption:= 'Anotações - cadastrando';
     pangrid_inclusao.BringToFront;
     btnCancelarInclusao.Enabled:=true;
     btnSairInclusao.Enabled:=false;
     DesabilitarBotoes;
     cadastrando:=true;
     btnCadastros.Caption := 'Cadastro Inicial';
     btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');

   end;
     
end;


procedure TF_ANOTACOES.btnConfirmaInclusaoClick(Sender: TObject);
begin

     if (( edt_nome.Text = '') and (cadastrando)) then
      begin

           Application.MessageBox('Preencha os campos para continuar o cadastro!', 'Campos vazios', MB_OK);
           edt_nome.SetFocus;

      end else begin

         GravaRegs;
         LogOperacoes(NomeDoUsuarioLogado, 'cadastro de '+nomeTabela+'');  
         btnCancelarInclusao.Enabled:= false;
         DesabilitarBotoes;
         btnSairInclusao.Enabled:= true;
      end;

      F_ANOTACOES.KeyPreview   := true;

end;

procedure TF_ANOTACOES.GravaRegs;
begin

         nomeInclusao     := edt_nome.Text;
         obsInclusao      := memoInclusaoObs.Lines.Text;
         proxNum          := GerarProximoID('id_anotacao','anotacoes');

         _Sql := 'insert into anotacoes (id_anotacao, usuarioid, instituicao, descricao) values (:id_anotacao, :usuarioid, :instituicao, :descricao)';

         with DM_PesqDados.cdsPesqAnotacoes do
         begin

             close;
             CommandText:= (_Sql);
             Params.ParamByName('id_anotacao').AsInteger       :=  proxNum;
             Params.ParamByName('usuarioid').AsInteger         :=  IdDoUsuarioLogado;
             Params.ParamByName('instituicao').AsString        :=  nomeInclusao;
             Params.ParamByName('descricao').AsString          :=  obsInclusao; 
             execute;

        end;

       Application.MessageBox('Registro cadastrado com sucesso!', 'Novo registro', MB_OK);
       Limpar;
       cadastrando:=false;
       EstadoInicialDosBotoes;

end;

procedure TF_ANOTACOES.btnAlterarClick(Sender: TObject);
begin

    pan_titulo.Caption:= 'Anotações - editando';
    pangrid_alteracao.BringToFront;
    BancoParaEdts;
    btnSairAlteracao.Enabled     := true;
    edtFiltro.Text               :='';
    btnConfirmaAlteracao.Enabled := true;
    btnAlterar.Enabled           :=false;
    DesabilitarBotoes;

end;

procedure TF_ANOTACOES.btnCancelarInclusaoClick(Sender: TObject);
begin

    //cancelamento da Inclusao
    cadastrando := false;
    DM_PesqDados.cdsPesqAnotacoes.Cancel;
    Limpar;
    btnSairInclusao.Enabled         := true;
    btnConfirmaInclusao.Enabled  := False;
    btnCancelarInclusao.Enabled  := false;
    MostrandoAnotacaoTelaInicial;    

end;


procedure TF_ANOTACOES.btnSairAlteracaoClick(Sender: TObject);
begin

    //Saindo da Alteração
    MostrandoAnotacaoTelaInicial;
    pangrid_visualizacao.BringToFront;
    pan_titulo.Caption:= 'Anotações';
    HabilitarBotoes;
    edtFiltro.SetFocus;
    EstadoInicialDosBotoes;

end;

procedure TF_ANOTACOES.btnSairInclusaoClick(Sender: TObject);
begin

    //Saindo da Inclusao
    cadastrando := false;
    pangrid_visualizacao.BringToFront;
    AtualizaQde;
    FecharAbrirTabelas;
    pan_titulo.Caption:= 'Anotações';
    HabilitarBotoes;
    edtFiltro.SetFocus;
    EstadoInicialDosBotoes;

end;      


procedure TF_ANOTACOES.Limpar;
var
  i : Integer;
begin

        //Limpando os Edits e Masks
      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TEdit)then
              (Components[i] as TEdit).Clear;

      end;


      edt_nome.SetFocus;
      pan_titulo.Caption:= 'Anotações - cadastrando';
      cadastrando:=false;
      memoInclusaoObs.Clear;


end;

procedure TF_ANOTACOES.BancoParaEdts;
begin

     //setando todos os valores do banco em edits para alterações

     _Sql := 'select * FROM anotacoes WHERE id_anotacao=:idAnotacao';

     with DM_PesqDados.cdsPesqAnotacoes do
     begin

         close;
         CommandText:= (_Sql);
         Params.ParamByName('idAnotacao').AsInteger :=  idAnotacaoSelecionada;
         open;

         if not IsEmpty then
         begin
             edtAlteraNome.Text           := DM_PesqDados.cdsPesqAnotacoes.FieldByname('instituicao').AsString;
             memoAlteraObs.Text           := DM_PesqDados.cdsPesqAnotacoes.FieldByname('descricao').AsString;     
         end;

     end;

     edtAlteraNome.SetFocus;

end;

procedure TF_ANOTACOES.ExcluirAnotacao;
begin

     _Sql := 'Delete FROM anotacoes WHERE id_anotacao=:idAnotacao';

     with DM_PesqDados.cdsPesqAnotacoes do
     begin

         close;
         CommandText:= (_Sql);
         Params.ParamByName('idAnotacao').AsInteger :=  idAnotacaoSelecionada;
         Execute;

     end;
     AtualizaQde;
     Application.MessageBox('A anotação foi excluída com sucesso!', 'Exclusão', MB_OK);
     LogOperacoes(NomeDoUsuarioLogado, 'executou exclusão da anotação'+IntToStr(idAnotacaoSelecionada));

end;

procedure TF_ANOTACOES.btnExcluirClick(Sender: TObject);
begin

   if MessageDlg('Confirma o desejo de excluir o registro selecionado?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
   Begin
       ExcluirAnotacao;
   End;
   EstadoInicialDosBotoes;

end;

procedure TF_ANOTACOES.GravarAlteracoes;
begin

         altNome           := edtAlteraNome.Text;
         altObs            := memoAlteraObs.Text;

         _Sql :='UPDATE anotacoes SET instituicao = :instituicao, descricao = :descricao WHERE id_anotacao = :pIDAnotacao';

         with DM_Pesq.Qry_Geral do
         begin

             sql.Clear;
             sql.Add(_Sql);
             Params.ParamByName('instituicao').AsString        :=  altNome;
             Params.ParamByName('descricao').AsString          :=  altObs;
             Params.ParamByName('pIDAnotacao').AsInteger       :=  idAnotacaoSelecionada;
             ExecSQL();

        end;

        FecharAbrirTabelas;
        Application.MessageBox('Alterações feitas com sucesso!', 'OK!', MB_OK + MB_ICONWARNING);


end;

procedure TF_ANOTACOES.btnConfirmaAlteracaoClick(Sender: TObject);
begin

     GravarAlteracoes;
     LogOperacoes(NomeDoUsuarioLogado, 'alteração nos dados de cliente cadastrado');
     MostrandoAnotacaoTelaInicial;
     pangrid_visualizacao.BringToFront;
     edtFiltro.Clear;
     edtFiltro.SetFocus;
     pan_titulo.Caption:= 'Anotações';
     HabilitarBotoes;
     EstadoInicialDosBotoes;
     F_ANOTACOES.KeyPreview   := true;
     btnConfirmaAlteracao.Enabled:=false;

end;


procedure TF_ANOTACOES.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure TF_ANOTACOES.DesabilitarBotoes;
var
  i : Integer;
begin

      //Desabilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= false;
      end;


      btnSairAlteracao.Enabled:= True;

end;

procedure TF_ANOTACOES.HabilitarBotoes;
var
  i : Integer;
begin

       //Habilitando os botões

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= true;
      end;


      btnSairAlteracao.Enabled:= True;

end;

procedure TF_ANOTACOES.edt_nomeChange(Sender: TObject);
begin

    btnCancelarInclusao.Enabled:= True;
    btnSairInclusao.Enabled    := False;
    
end;

procedure TF_ANOTACOES.btnSairClick(Sender: TObject);
begin

   cadastrando        :=false;
   cadastrandoContato := false;
   HabilitarBotoes;
   close;

end;

procedure TF_ANOTACOES.AbrirTabelas;
begin

   DM_PesqDados.cdsPesqAnotacoes.Active  := true;

end;

procedure TF_ANOTACOES.FecharTabelas;
begin

     DM_PesqDados.cdsPesqAnotacoes.Active := false;

end;

procedure TF_ANOTACOES.FecharAbrirTabelas;
begin

  DM_PesqDados.cdsPesqAnotacoes.Active:= false;
  DM_PesqDados.cdsPesqAnotacoes.Active:= true;
  MostrandoAnotacaoTelaInicial;
  AtualizaQde;

end;

procedure TF_ANOTACOES.edt_nomeExit(Sender: TObject);
begin

   if not(edt_nome.Text = '')then
      begin
         cadastrando := true;
         if(TemDuplicidade(DM_PesqDados.cdsPesqAnotacoes,'instituicao',edt_nome.Text))then
         begin

              Application.MessageBox('Atenção já existe uma anotação cadastrada com este assunto!', 'Duplicidade no nome', MB_ICONEXCLAMATION);
              edt_nome.SetFocus;

         end;

    end else
      begin
          if(cadastrando)then
          begin
             Application.MessageBox('Digite um assunto para continuar!!',
                                  'Nome inválido!', MB_OK + MB_ICONWARNING);
           edt_nome.SetFocus;
           btnSairInclusao.Enabled:=true;
          end;
    end;      

end;

procedure TF_ANOTACOES.btnSairConsClientesClick(Sender: TObject);
begin

    pangrid_visualizacao.BringToFront;
    pan_titulo.Caption:= 'Anotações';
    HabilitarBotoes;

end;

procedure TF_ANOTACOES.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

       if key= vk_F5 then
       begin

           HabilitarBotoes;
           txtMsg.Visible           := false;    
           edtFiltro.Enabled       := true;
           edtFiltro.SetFocus;

       end;
              
end;


procedure TF_ANOTACOES.MostrandoAnotacaoTelaInicial;
begin

      with DM_PesqDados.cdsPesqAnotacoes do
      begin

          Close;
          CommandText:= ('select l.*, a.* FROM login l, anotacoes a WHERE l.func_id = a.usuarioid AND l.func_id=:user ORDER BY a.instituicao');
          Params.ParamByName('user').AsInteger := IdDoUsuarioLogado;
          Open;

            if not IsEmpty then
            begin

                memoTelaPrincipal.DataSource        :=  DM_PesqDados.dsPesqAnotacoes;
                memoTelaPrincipal.DataField         := 'DESCRICAO';

                with GridTelaPrincipal do
                begin

                  DataSource:=  DM_PesqDados.dsPesqAnotacoes;
                  Columns.Clear;

                  Columns.Add;
                  Columns[0].FieldName         := 'INSTITUICAO';
                  Columns[0].Width             := 307;
                  Columns[0].Alignment         := taLeftJustify;
                  Columns[0].Title.caption     := '';
                  Columns[0].Title.Font.Style  := [fsBold];

                end;

            end;

            dbIDAnotacao.DataSource        :=  DM_PesqDados.dsPesqAnotacoes;
            dbIDAnotacao.DataField         := 'ID_ANOTACAO';

      end;

end;


procedure TF_ANOTACOES.btnConsPorClienteClick(Sender: TObject);
begin

       edtFiltro.Clear;
       edtFiltro.SetFocus;
       MostrandoAnotacaoTelaInicial;

end;

procedure TF_ANOTACOES.edtFiltroChange(Sender: TObject);
begin
   //verificar se o usuario logado tiver algo cadastrado libera filtragem caso contrario travar filtragem Key := #0;
   if (userTemAnotacoes) then
   begin

       edtFiltro.Enabled := true;
       edtFiltro.SetFocus;
       FiltrarPorNome;


   end else
   begin
       edtFiltro.Clear;
       edtFiltro.Enabled := false;
       GridTelaPrincipal.Enabled := false;
   end;
end;


procedure TF_ANOTACOES.FiltrarPorNome;
var
  nome : string;
begin

       nome := edtFiltro.Text;

      _Sql  := 'select l.*, a.* FROM login l, anotacoes a WHERE l.func_id = a.usuarioid AND l.func_id=:user AND a.instituicao LIKE (''%'+nome+'%'') ORDER BY a.instituicao';

      with DM_PesqDados.cdsPesqAnotacoes do
      begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('user').AsInteger := IdDoUsuarioLogado;
            Open;

      end;

end;


procedure TF_ANOTACOES.edtFiltroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if KEY = VK_RETURN then
     begin
          edtFiltro.Clear;
          btnCadastros.Caption := 'Cadastro Inicial';
          btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');
          EstadoInicialDosBotoes;
      end;

end;


procedure TF_ANOTACOES.GridTelaPrincipalCellClick(Column: TColumn);
begin

    idAnotacaoSelecionada    :=  DM_PesqDados.cdsPesqAnotacoes.fieldbyname('id_anotacao').AsInteger;
    edtFiltro.SetFocus;
    btnCadastros.Caption := 'Voltar';
    btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Ok.bmp');
    btnAlterar.Enabled:=true;
    btnExcluir.Enabled:=true;

end;

procedure TF_ANOTACOES.AtualizaQde;
begin

    //procedimento local que informa a quantidade de registros na tabela
    qdeRegs               := retornaQuantidadeRegsUserLogado('id_anotacao','usuarioid',inttostr(IdDoUsuarioLogado),'anotacoes');
    txtMsg.Caption        := 'Total de anotações cadastradas '+ IntToStr( qdeRegs );
    txtMsg.Color          := clWhite;
    txtMsg.Visible        := true;
    txtMsg.Font.Color     := clBlue;

end;

procedure TF_ANOTACOES.memoTelaPrincipalEnter(Sender: TObject);
begin
edtFiltro.SetFocus;
end;

procedure TF_ANOTACOES.edt_nomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if(key = 13)then
  begin
      cadastrando:=true;
      memoInclusaoObs.SetFocus;
  end;
end;

procedure TF_ANOTACOES.memoInclusaoObsEnter(Sender: TObject);
begin

   //posicionando o cursor na primeira linha do Memo
   memoInclusaoObs.SelStart := Perform(EM_LINEINDEX, 0, 0);
   F_ANOTACOES.KeyPreview   := false;

end;

procedure TF_ANOTACOES.EstadoInicialDosBotoes;
begin

    btnCadastros  .Enabled := true;
    btnAlterar    .Enabled := false;
    btnExcluir    .Enabled :=false;
    btnSair       .Enabled := true;
    btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_marcar.bmp');
    btnCadastros.Caption:='Cadastrar';
    btnSair.Caption :='Sair';
    btnSair.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Sair.bmp');
    edtFiltro.Text :='';
    MostrandoAnotacaoTelaInicial;

end;
procedure TF_ANOTACOES.edtFiltroKeyPress(Sender: TObject; var Key: Char);
begin
      btnCadastros.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'\imagens\'+'btn_Ok.bmp');
      btnAlterar.Enabled  :=false;
      btnCadastros.Caption:='Voltar';
end;

function TF_ANOTACOES.userTemAnotacoes : boolean;
begin

     //verifica se o usuário logado tem alguma anotação cadastrada

     _Sql  := 'select id_anotacao FROM anotacoes WHERE usuarioid =:user';

      with DM_Pesq.cdsPesqGeral do
      begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('user').AsInteger := IdDoUsuarioLogado;
            Open;

            if not IsEmpty then
            begin

                Result := true;

            end else
            begin

                Result := false;

            end;

      end;

end;

procedure TF_ANOTACOES.memoInclusaoObsKeyPress(Sender: TObject;
  var Key: Char);
begin

    btnConfirmaInclusao.Enabled:=true;

    //quebrar para proxima linha ao teclar enter
    if(key = #13)then
    begin
      key := #13; //enter
    end;


end;

procedure TF_ANOTACOES.memoAlteraObsKeyPress(Sender: TObject;
  var Key: Char);
begin

     btnConfirmaAlteracao.Enabled:=true;

    //quebrar para proxima linha ao teclar enter
    if(key = #13)then
    begin
      key := #13; //enter
    end;

end;

procedure TF_ANOTACOES.memoAlteraObsEnter(Sender: TObject);
begin
    F_ANOTACOES.KeyPreview   := false;
end;

end.

