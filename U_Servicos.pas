unit U_Servicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  EditNum, DateUtils, ComCtrls,ToolEdit;

type
  T_frmServicos = class(TForm)
    pan_titulo: TPanel;
    pangrid_visualizacao: TPanel;
    pan_botoes: TPanel;
    btnCadastros: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnInativar: TSpeedButton;
    btnConsultar: TSpeedButton;
    btnSair: TSpeedButton;
    btnimprimir: TSpeedButton;
    pangrid_inclusao: TPanel;
    GroupBox1: TGroupBox;
    btnConfirmaInclusao: TSpeedButton;
    grp1: TGroupBox;
    lbl11: TLabel;
    lbl13: TLabel;
    lbl12: TLabel;
    pangrid_alteracao: TPanel;
    grp2: TGroupBox;
    lbl10: TLabel;
    lbl20: TLabel;
    lbl27: TLabel;
    dbALTERADESCRICAO: TDBEdit;
    dbALTERAVALOR: TDBEdit;
    dbALTERACODBARRAS: TDBEdit;
    grp3: TGroupBox;
    btnConfirmaAlteracao: TSpeedButton;
    edtDescricao: TEdit;
    btnSairAlteracao: TSpeedButton;
    btnSairDaInclusao: TSpeedButton;
    btnCancelarAlteracao: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    lstEscolheTipoRel: TListBox;
    lblStatusLogoff: TLabel;
    lbl45: TLabel;
    GroupBox9: TGroupBox;
    edtNome: TEdit;
    GroupBox5: TGroupBox;
    lbl28: TLabel;
    dbIDServico: TDBEdit;
    lbl1: TLabel;
    dbCodBarrasServico: TDBEdit;
    lbl2: TLabel;
    dbDescricaoServico: TDBEdit;
    lbl5: TLabel;
    dbValorServico: TDBEdit;
    pangrid_listaServicos: TPanel;
    grid_Servicos: TDBGrid;
    edtValor: TEditNum;
    edt_CodigoEntradaInicial: TEdit;
    btnCancelarInclusao: TSpeedButton;
    GridListaServicos: TDBGrid;
    txtNomeDoSevico: TStaticText;
    btnRetornar: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInativarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCadastrosClick(Sender: TObject);
    procedure btnConfirmaInclusaoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSairAlteracaoClick(Sender: TObject);
    procedure GravaNovoServico;
    procedure btnConfirmaAlteracaoClick(Sender: TObject);
    procedure Limpar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnConsultarClick(Sender: TObject);
    procedure HabilitarBotoes;
    procedure DesabilitarBotoes;
    procedure btnCancelarAlteracaoClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure GerarCodigoBarraServico;
    procedure lstEscolheTipoRelClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnSairDaInclusaoClick(Sender: TObject);
    procedure msk_FoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FiltrarPorNome;
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtDescricaoExit(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnCancelarInclusaoClick(Sender: TObject);
    procedure dbALTERADESCRICAOClick(Sender: TObject);
    procedure dbALTERAVALORClick(Sender: TObject);
    procedure dbALTERADESCRICAOChange(Sender: TObject);
    procedure dbALTERAVALORChange(Sender: TObject);
    procedure GravarServicoNaTabelaProdutos;
    procedure AlterarServicoNaTabelaProdutosEServicos;
    procedure btnRetornarClick(Sender: TObject);
    procedure GridListaServicosCellClick(Column: TColumn);

  private
    { Private declarations }
    cadastrando : Boolean;
    CodBarServico : string;

  public
    { Public declarations }
  end;

var
  _frmServicos: T_frmServicos;


implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo,
  U_QRelServicoParcial, U_QRelServicoCompleto, DBClient;

{$R *.dfm}


procedure T_frmServicos.FormCreate(Sender: TObject);
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


    //Recebe a data atual por padr�o

    lblDataDoDia.Caption    :=  DateToStr(now);
    lblHoraAtual.Caption    :=  timetoStr(time);
    lblStatusLogoff.Caption := IdentificarUsuarioLogado;
    AbrirTabelas;

end;

procedure T_frmServicos.btnInativarClick(Sender: TObject);
begin

      if dm_DadosSegundo.cds_Servicos.RecordCount = 0 then begin

            Application.MessageBox('No momento n�o h� registros a serem exibidos!', 'Tabela vazia', MB_OK);

      end
      else begin


          DesabilitarBotoes; 

          pan_titulo.Caption:= 'Controle de Servi�os - Inativando...';

          texto:= 'Confirma o desejo de inativar o Servi�o '+dbDescricaoServico.Text+ '?';

          if Application.MessageBox(PChar(texto),'Inativar Servi�o',MB_YESNO + MB_ICONQUESTION) = IdYes then
          begin

              with dm_DadosSegundo.cds_Servicos do
              begin

                edit;
                Fieldbyname('status').AsString := 'I';
                ApplyUpdates(0);

              end;

              //Inativando o servi�o tamb�m na tabela produtos
              with DM_Pesq.Qry_Geral do
              begin

                   close;
                   sql.Clear;
                   sql.Add('UPDATE produtos SET status = '+QuotedStr('I')+' WHERE cod_barras = :pCODBarras');
                   params.ParamByName('pCODBarras').Value  := dbCodBarrasServico.Text;
                   ExecSQL();

             end;

              Application.MessageBox('O Servi�o foi inativado com sucesso!', 'Inativo', MB_OK);
              LogOperacoes(NomeDoUsuarioLogado, 'inativa��o de servi�o cadastrado');
              pan_titulo.Caption:= 'Controle de Servi�os - Visualizando...';
              HabilitarBotoes;

          end else begin

              dm_DadosSegundo.cds_Servicos.CancelUpdates;
              pan_titulo.Caption:= 'Controle de Servi�os - Visualizando...';
              HabilitarBotoes;

         end;
    end; 

    FecharAbrirTabelas;

end;


procedure T_frmServicos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  FecharTabelas;
  
end;

procedure T_frmServicos.btnCadastrosClick(Sender: TObject);
begin

     edtDescricao.SetFocus;
     pan_titulo.Caption:= 'Controle de Servi�os - Incluindo...';
     pangrid_visualizacao.SendToBack;
     pangrid_inclusao.BringToFront;
     GerarCodigoBarraServico;
     DesabilitarBotoes;
     cadastrando := true;

end;

procedure T_frmServicos.GerarCodigoBarraServico;
begin

        With DM_Pesq.qry_Cod do
        begin

            Close;
            SQL.Clear;
            SQL.Add('select max(idcodbarservico) from codbarservico');
            Open;

            if not IsEmpty then begin

               proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

            end;

         end;

         CodBarServico := IntToStr(proxNum);

         with dm_DadosSegundo.cds_CodBarServicos do
         begin

            Append;
            FieldByName('idcodbarservico').AsInteger  := proxNum;
            FieldByName('codbarservico').AsString     := StringOfChar('0',13-Length(CodBarServico))+ CodBarServico;
            FieldByName('tipo').AsString              := 'S'; //S = SERVI�O => POR CONTA DE UTILIZARMOS ESSES CODIGOS PARA SERVI�OS E TB PARA PRODUTOS SEM CODIGO DE BARRAS
            ApplyUpdates(0);

         end;

        edt_CodigoEntradaInicial.text   := StringOfChar('0',13-Length(CodBarServico))+ CodBarServico;
        edtDescricao.SetFocus;

end;


procedure T_frmServicos.btnAlterarClick(Sender: TObject);
begin

      if dm_DadosSegundo.cds_Servicos.RecordCount = 0 then begin

            Application.MessageBox('No momento n�o h� registros a serem exibidos!', 'Tabela vazia', MB_OK);

      end
      else begin

          pan_titulo.Caption:= 'Controle de Servi�os - Alterando...';
          pangrid_visualizacao.SendToBack;
          pangrid_alteracao.BringToFront;

          DesabilitarBotoes;
          dbALTERADESCRICAO.SetFocus;
          btnSairAlteracao.Enabled:= true;

      end;

end;


procedure T_frmServicos.btnSairAlteracaoClick(Sender: TObject);
begin  

    pangrid_visualizacao.BringToFront;
    pan_titulo.Caption:= 'Controle de Servi�os - Visualizando...';
    HabilitarBotoes;

end;

procedure T_frmServicos.btnConfirmaInclusaoClick(Sender: TObject);
begin

   GravaNovoServico;
   Limpar;
   DesabilitarBotoes;
   btnSairDaInclusao.Enabled:= true;

end;


procedure T_frmServicos.GravaNovoServico;
begin
    
      With DM_Pesq.qry_Cod do
      begin

        Close;
        SQL.Clear;
        SQL.Add('select max(id_servico) from Servicos');
        Open;

        if not IsEmpty then begin
           proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger+1;
        end;

      end;


     // Formatando a Data para a grava��o
     DateSeparator := '/';
     ShortDateFormat := 'dd/mm/yyyy';


     // Abrindo um registro novo e gravando no bd
     with dm_DadosSegundo.cds_Servicos do
     begin

        Append;
        FieldByName('id_servico').AsInteger  := proxNum;
        FieldByName('operador_id').AsInteger := IdFuncionarioLogado(lblStatusLogoff.Caption);
        FieldByname('codbarras').AsString    := edt_CodigoEntradaInicial.text;
        FieldByname('descricao').AsString    := edtDescricao.Text;
        FieldByname('valor').AsFloat         := StrToFloat(edtValor.Text);
        FieldByname('tipo').AsString         := 'S';
        FieldByname('status').AsString       := 'A';
        FieldByname('data').AsDateTime       :=  date;
        ApplyUpdates(0);

     end;

     GravarServicoNaTabelaProdutos;

     edtDescricao.Clear;
     edtValor.Clear;

     Application.MessageBox('O servi�o foi cadastrado com sucesso!', 'Cadastrando...', MB_OK);
     LogOperacoes(NomeDoUsuarioLogado, 'cadastro de novo servi�o');

end;

procedure T_frmServicos.GravarServicoNaTabelaProdutos;
var
  proximoId     : Integer;
  dataEscolhida : string;

begin

       proximoId          := 0;

       //PARA MOSTRAR MES ANO EX:  OUT/2014
       dtDataDoDia        := TDateEdit.Create(self);
       dtDataDoDia.Date   := date;
       dataEscolhida := DateToStr(dtDataDoDia.Date);
       MostrarMesEAno(dataEscolhida);

       With DM_Pesq.qry_Cod do begin

            Close;
            SQL.Clear;
            SQL.Add('select max(ID_PRODUTO) from PRODUTOS');
            Open;

            if not IsEmpty then begin

               proximoId := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

            end;

       end;

       // Formatando a Data para a grava��o
       DateSeparator := '/';
       ShortDateFormat := 'dd/mm/yyyy';

       // Abrindo um registro novo e gravando no bd
       with dm_Conexao.cds_CadProduto do
       begin

          Append;

          FieldByName('id_produto').AsInteger         := proximoId;
          FieldByName('categoria_id').AsInteger       := 1;
          FieldByName('fabricante_id').AsInteger      := 0;
          FieldByname('cod_barras').AsString          := edt_CodigoEntradaInicial.text;
          FieldByname('descricao').AsString           := edtDescricao.Text;
          FieldByname('precovenda').AsFloat           := StrToFloat(edtValor.Text);
          FieldByname('valordelucro').AsFloat         := StrToFloat(edtValor.Text);
          FieldByname('estoque_atual').AsInteger      := 1;  //valor simbolico pois se trata de cadastro de servi�o e nao havera baixa de estoque
          FieldByname('datacad').AsDateTime           := TDateTime(now);
          FieldByname('status').AsString              := 'A';
          FieldByname('tipo').AsString                := 'S';
          DataDoDia                                   := date;
          FieldByName('mesano').AsString              := mes_ano;
          FieldByname('obs').AsString                 := 'CADASTRO DE SERVICO';
          ApplyUpdates(0);

       end;

end;


procedure T_frmServicos.Limpar;
var
  i : Integer;
begin

      //Limpando os Edits e Masks
      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TEdit)then
              (Components[i] as TEdit).Clear;
      end;

      pan_titulo.Caption:= 'Controle de Servi�os - Incluindo...';

      GerarCodigoBarraServico;
      edtDescricao.SetFocus;
      cadastrando := true;

end;

procedure T_frmServicos.btnConfirmaAlteracaoClick(Sender: TObject);
begin

   AlterarServicoNaTabelaProdutosEServicos;

   pangrid_visualizacao.BringToFront;
   pan_titulo.Caption:= 'Controle de Servi�os - Visualizando...';
   HabilitarBotoes;

end;


procedure T_frmServicos.AlterarServicoNaTabelaProdutosEServicos;
begin

     //se houver alteracao em servicos quanto a descricao ou valor do servico surtira efeito tb na tabela produtos
     with DM_Pesq.Qry_Geral do
     begin

         close;
         sql.Clear;
         sql.Add('UPDATE produtos SET descricao = :pdescricao, precovenda = :pprecovenda, valordelucro=:pLucro WHERE '+
         'cod_barras = :pCODBarras');
         params.ParamByName('pCODBarras').Value  := dbALTERACODBARRAS.Text;
         params.ParamByName('pdescricao').Value  := dbALTERADESCRICAO.Text;
         params.ParamByName('pprecovenda').Value := StrToFloat(dbALTERAVALOR.Text);
         params.ParamByName('pLucro').Value      := StrToFloat(dbALTERAVALOR.Text);
         ExecSQL();

     end;


     with DM_Pesq.Qry_Auxiliar do
     begin

         close;
         sql.Clear;
         sql.Add('UPDATE servicos SET descricao = :pdescricao, valor = :pvalor WHERE codbarras = :pCODBarras');
         params.ParamByName('pCODBarras').Value  := dbALTERACODBARRAS.Text;
         params.ParamByName('pdescricao').Value  := dbALTERADESCRICAO.Text;
         params.ParamByName('pvalor').Value      := StrToFloat(dbALTERAVALOR.Text);
         ExecSQL();

     end;

     Application.MessageBox('As altera��es foram efetivadas com sucesso!', 'Alterando!', MB_OK);
     LogOperacoes(NomeDoUsuarioLogado, 'altera��o nos dados de servi�o cadastrado');
     FecharAbrirTabelas;

end;


procedure T_frmServicos.FormKeyPress(Sender: TObject; var Key: Char);
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



procedure T_frmServicos.btnConsultarClick(Sender: TObject);
begin

  if dm_DadosSegundo.cds_Servicos.RecordCount = 0 then begin

       Application.MessageBox('No momento n�o h� registros a serem exibidos!', 'Tabela vazia', MB_OK);

  end
  else begin     

     pangrid_listaServicos.BringToFront;
     DesabilitarBotoes;
     btnRetornar.Enabled := true;
     pan_titulo.Caption := 'Lista de todos servi�os cadastrados';
     LogOperacoes(NomeDoUsuarioLogado, 'acesso a consulta de servi�os cadastrados');
     
  end;

end;


procedure T_frmServicos.HabilitarBotoes;
var
  i : Integer;
begin

       //Habilitando os bot�es

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= true;
      end;


      btnSairDaInclusao.Enabled:= True;
      btnConfirmaAlteracao.Enabled:= true;


end;

procedure T_frmServicos.DesabilitarBotoes;
var
  i : Integer;
begin

   //Desabilitando os bot�es

      for i := 0 to ComponentCount -1 do begin

           if (Components[i] is TSpeedButton)then
              (Components[i] as TSpeedButton).Enabled:= false;
      end;


      btnSairDaInclusao.Enabled:= True;

end;


procedure T_frmServicos.btnSairClick(Sender: TObject);
begin

   FreeAndNil ( dtDataDoDia );
   HabilitarBotoes;
   close;

end;


procedure T_frmServicos.btnCancelarAlteracaoClick(Sender: TObject);
begin

  dm_DadosSegundo.cds_Servicos.CancelUpdates;
  FecharAbrirTabelas;
  HabilitarBotoes;
  pangrid_visualizacao.BringToFront;
 
end;


procedure T_frmServicos.AbrirTabelas;
begin

     dm_DadosSegundo.cds_Servicos.Active       := True;
     dm_DadosSegundo.cds_CodBarServicos.Active := true;
     dm_Conexao.cds_CadProduto.Active          := true;

end;

procedure T_frmServicos.FecharTabelas;
begin

     dm_DadosSegundo.cds_Servicos.Active        := False;
     dm_DadosSegundo.cds_CodBarServicos.Active  := False;
     dm_Conexao.cds_CadProduto.Active           := false;

end;

procedure T_frmServicos.FecharAbrirTabelas;
begin

     dm_DadosSegundo.cds_Servicos.Active        := False;
     dm_DadosSegundo.cds_Servicos.Active        := True;

     dm_DadosSegundo.cds_CodBarServicos.Active  := False;
     dm_DadosSegundo.cds_CodBarServicos.Active  := true;

     dm_Conexao.cds_CadProduto.Active           := false;
     dm_Conexao.cds_CadProduto.Active           := true;

end;


procedure T_frmServicos.lstEscolheTipoRelClick(Sender: TObject);
begin

    pan_titulo.Caption:= 'Controle de Servi�os - Visualizndo...';
    lstEscolheTipoRel.Visible:= False;
    lstEscolheTipoRel.Align:= alNone;
    pangrid_visualizacao.Enabled:= True;

    if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELAT�RIO   DE  TODOS   OS   SERVI�OS' then
    begin

        TotalRegs := 0;

        //PESQUISANDO A QUANTIDADE DE REGISTROS RETORNADO PELO QRY

       _Sql := 'SELECT * FROM Servicos WHERE status = '+QuotedStr('A')+' AND tipo = '+QuotedStr('S')+' ORDER BY id_servico'; 

       with Q_RelServicoCompleto.cds_Servicos do
       begin

          Close;
          CommandText:= _Sql;
          Open;

          if not IsEmpty then begin

             TotalRegs := Q_RelServicoCompleto.cds_Servicos.RecordCount;

          end;

     end;

       Q_RelServicoCompleto.cds_Servicos.Active   := True;
       Q_RelServicoCompleto.QRLabelTotal.Caption  := IntToStr(TotalRegs);
       Q_RelServicoCompleto.Preview;


    end else if lstEscolheTipoRel.Items[lstEscolheTipoRel.ItemIndex] = 'RELAT�RIO   DO  SERVI�O SELECIONADO' then
    begin

       with Q_RelServicoParcial.Qry_Servicos do
       begin

          Close;
          ParamByName('pIDServico').asinteger := StrToInt(dbIDServico.Text);
          Open;

       end;

       Q_RelServicoParcial.Qry_Servicos.Active:= true;
       Q_RelServicoParcial.Preview;

    end;

end;

procedure T_frmServicos.btnimprimirClick(Sender: TObject);
begin

   if dm_DadosSegundo.cds_Servicos.RecordCount = 0 then begin

       Application.MessageBox('No momento n�o h� registros a serem exibidos!', 'Tabela vazia', MB_OK);

  end
  else begin

    pan_titulo.Caption           := 'Controle de Servi�os - Imprimindo...';
    lstEscolheTipoRel.Visible    := True;
    lstEscolheTipoRel.Align      := alClient;
    pangrid_visualizacao.Enabled := False;
    LogOperacoes(NomeDoUsuarioLogado, 'acesso a impress�o de relat�rios de servi�os');

  end;

end;

procedure T_frmServicos.btnSairDaInclusaoClick(Sender: TObject);
begin

       if cadastrando then
       begin

            texto:= 'Confirma o cancelamento do cadastro em andamento ou deseja sair?';

            if Application.MessageBox(PChar(texto),'Cancelando cadastro...',MB_YESNO + MB_ICONQUESTION) = IdYes then
            begin

                 dm_DadosSegundo.cds_Servicos.CancelUpdates;

                 with DM_Pesq.Qry_Geral do
                 begin

                      close;
                      sql.Clear;
                      sql.Add('DELETE FROM codbarservico WHERE codbarservico = :codigodebarras');
                      params.ParamByName('codigodebarras').Value := edt_CodigoEntradaInicial.Text;
                      ExecSQL();

                 end;

                 cadastrando := false;
                 FecharAbrirTabelas;
                 edtDescricao.Clear;
                 edtValor.Clear;
                 HabilitarBotoes;
                 pangrid_visualizacao.BringToFront;    

            end;

       end else begin

        pangrid_visualizacao.BringToFront;
        pan_titulo.Caption:= 'Controle de Servi�os - Visualizando...';
        HabilitarBotoes;

       end;

end;

procedure T_frmServicos.msk_FoneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

    if key=13 then
    begin

       exit;

    end;

end;

procedure T_frmServicos.FiltrarPorNome;
var
  nome : string;
begin

       nome := edtNome.Text;

      _Sql  := 'SELECT * FROM Servicos WHERE status = '+QuotedStr('A')+' '+
                'AND descricao LIKE (''%'+nome+'%'') ORDER BY descricao';

      with dm_DadosSegundo.cds_Servicos do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

end;


procedure T_frmServicos.edtNomeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if KEY = VK_RETURN then
      begin

          edtNome.Clear;

      end;

end;

procedure T_frmServicos.FormShow(Sender: TObject);
begin
      edtNome.SetFocus;
end;

procedure T_frmServicos.edtDescricaoExit(Sender: TObject);
begin

     VerificarDuplicidade(dm_DadosSegundo.cds_Servicos,'descricao',edtDescricao);

end;

procedure T_frmServicos.edtNomeChange(Sender: TObject);
begin

   FiltrarPorNome;
   
end;

procedure T_frmServicos.edtValorChange(Sender: TObject);
begin

       btnConfirmaInclusao.Enabled := true;
       btnSairDaInclusao.Enabled   := true;
       btnCancelarInclusao.Enabled := true;

end;

procedure T_frmServicos.btnCancelarInclusaoClick(Sender: TObject);
begin

     if cadastrando then
     begin

          texto:= 'Confirma o cancelamento do cadastro em andamento?';

          if Application.MessageBox(PChar(texto),'Cancelando cadastro...',MB_YESNO + MB_ICONQUESTION) = IdYes then
          begin

               dm_DadosSegundo.cds_Servicos.CancelUpdates;

               with DM_Pesq.Qry_Geral do
               begin

                    close;
                    sql.Clear;
                    sql.Add('DELETE FROM codbarservico WHERE codbarservico = :codigodebarras');
                    params.ParamByName('codigodebarras').Value := edt_CodigoEntradaInicial.Text;
                    ExecSQL();

               end;

               cadastrando := false;
               FecharAbrirTabelas;
               edtDescricao.Clear;
               edtValor.Clear;
               HabilitarBotoes;
               pangrid_visualizacao.BringToFront;

          end;
     end;
end;

procedure T_frmServicos.dbALTERADESCRICAOClick(Sender: TObject);
begin

    dbALTERADESCRICAO.SelStart:=0;
    dbALTERADESCRICAO.SelLength:= Length(dbALTERADESCRICAO.Text);

end;

procedure T_frmServicos.dbALTERAVALORClick(Sender: TObject);
begin

    dbALTERAVALOR.SelStart:=0;
    dbALTERAVALOR.SelLength:= Length(dbALTERAVALOR.Text);

end;

procedure T_frmServicos.dbALTERADESCRICAOChange(Sender: TObject);
begin

      btnConfirmaAlteracao.Enabled := true;
      btnCancelarAlteracao.Enabled := true;
      btnSairAlteracao.Enabled     := false;

end;

procedure T_frmServicos.dbALTERAVALORChange(Sender: TObject);
begin

      btnConfirmaAlteracao.Enabled := true;
      btnCancelarAlteracao.Enabled := true;
      btnSairAlteracao.Enabled     := false;

end;

procedure T_frmServicos.btnRetornarClick(Sender: TObject);
begin  
    
   HabilitarBotoes;
   pangrid_visualizacao.BringToFront;

end;

procedure T_frmServicos.GridListaServicosCellClick(Column: TColumn);
begin

   txtNomeDoSevico.Caption := dm_DadosSegundo.cds_ServicosDESCRICAO.Value;

end;

end.



