unit U_Metas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit, DateUtils, EditNum, ComCtrls;

type
  T_frmMetas = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    btn_Sair: TSpeedButton;
    btn_Gravar: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    PageControl1: TPageControl;
    TabMetas: TTabSheet;
    pnl_DadosMeta: TPanel;
    GroupBox1: TGroupBox;
    edt_DataInicio: TDateEdit;
    GroupBox2: TGroupBox;
    edt_DataFim: TDateEdit;
    GroupBox3: TGroupBox;
    edtValorMeta: TEditNum;
    TabStatusMeta: TTabSheet;
    GroupBox4: TGroupBox;
    edtMostraDataInicial: TDateEdit;
    edtMostraDataFinal: TDateEdit;
    lbl2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    txtMostraValorDaMeta: TStaticText;
    txtValorAcumulado: TStaticText;
    GroupBox5: TGroupBox;
    txtStatusParcial: TStaticText;
    Label4: TLabel;
    txtDiferenca: TStaticText;
    btnExcluir: TSpeedButton;
    tabRelatorios: TTabSheet;
    GroupBox6: TGroupBox;
    btnImprimirRelatorioMetas: TSpeedButton;
    procedure btn_SairClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FecharAbrirTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_GravarClick(Sender: TObject);
    procedure GravarMeta;
    procedure MostrarDadosMetaAtual;
    procedure TabStatusMetaShow(Sender: TObject);
    procedure MostraAcumulado;
    procedure edtValorMetaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_DataFimChange(Sender: TObject);
    procedure ExcluirMetaAtual;
    procedure btnExcluirClick(Sender: TObject);
    procedure TabMetasShow(Sender: TObject);
    procedure btnImprimirRelatorioMetasClick(Sender: TObject);
    procedure tabRelatoriosShow(Sender: TObject);



  private
    { Private declarations }
    TotalParcialVendas, TotalDaMeta, StatusLiquido : double;

  public
    { Public declarations }


  end;

var
  _frmMetas : T_frmMetas;
  proxNumCaixa : Integer;

implementation

uses U_BiblioSysSalao, U_dmDadosSegundo, U_principal, U_dmDados,
  U_dmPesquisas, SqlExpr, DB, U_ConsMetas;

{$R *.dfm}


procedure T_frmMetas.FormCreate(Sender: TObject);
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
   edt_DataInicio.Date  := now;
   lblDataDoDia.Caption :=  DateToStr(date);
   lblHoraAtual.Caption :=  timetoStr(time);
   AbrirTabelas;

end;


procedure T_frmMetas.TabStatusMetaShow(Sender: TObject);
begin

    MostrarDadosMetaAtual;  

end;

procedure T_frmMetas.TabMetasShow(Sender: TObject);
begin

      FecharAbrirTabelas;
      btnExcluir.Enabled := false;

end;

procedure T_frmMetas.MostrarDadosMetaAtual;
begin

       //seleciona o ultimo registro da tabela metas

       _Sql := 'SELECT * FROM metas WHERE id_meta = (select max(id_meta) from metas) AND status='+QuotedStr('A')+'';

       with DM_Pesq.Qry_Geral do
       begin

           close;
           sql.Clear;
           sql.Add(_Sql);
           open;

           if not IsEmpty then
           begin

                TotalDaMeta                  := DM_Pesq.Qry_Geral.Fields[3].AsFloat;
                txtMostraValorDaMeta.Caption := Transform(DM_Pesq.Qry_Geral.Fields[3].AsFloat);
                edtMostraDataInicial.Text    := DateToStr(DM_Pesq.Qry_Geral.Fields[1].AsDateTime);
                edtMostraDataFinal.Text      := DateToStr(DM_Pesq.Qry_Geral.Fields[2].AsDateTime);
                btnExcluir.Enabled           := true;
                MostraAcumulado;

           end else begin

              btnExcluir.Enabled := false;
              FecharAbrirTabelas;

           end;

        end;

end;

procedure T_frmMetas.MostraAcumulado;
begin

     //mostrar acumulado de PV (pagamento de vendas) dentro do periodo da meta

     DataInicio           := edtMostraDataInicial.date;
     DataFim              := edtMostraDataFinal.date;

    _Sql := 'SELECT flag_pagto, SUM(vl_liquido) FROM historico_ativos WHERE data BETWEEN '+
            ':dataInicial AND :dataFinal AND flag_pagto = '+QuotedStr('PV')+' GROUP BY flag_pagto ';       

    with DM_Pesq.Qry_Geral do
    begin

       close;
       sql.Clear;
       sql.Add(_Sql);
       Params.ParamByName('dataInicial').AsDate := DataInicio;
       Params.ParamByName('dataFinal').AsDate   := DataFim;
       open;

       if not IsEmpty then
       begin

            TotalParcialVendas        := DM_Pesq.Qry_Geral.Fields[1].VALUE;
            txtValorAcumulado.Caption := Transform(TotalParcialVendas);  //transforma o valor double em string

       end;

       StatusLiquido :=   ( TotalDaMeta - TotalParcialVendas );

       if ( TotalParcialVendas < TotalDaMeta ) then
       begin

           txtStatusParcial.Caption      := 'META DA SEMANA AINDA N�O ALCAN�ADA'; //, voc� esta ' + StatusLiquido + 'de alcan��-la';
           txtStatusParcial.font.Color   := clRed;
           txtDiferenca.Font.Color       := clRed;
           txtDiferenca.Caption          := Transform(-StatusLiquido);

       end else  if ( TotalParcialVendas = TotalDaMeta ) AND ( TotalParcialVendas > 0 ) then
       begin
           txtStatusParcial.Caption      := 'PARAB�NS VOC� ALCAN�OU A META DA SEMANA'; // + StatusLiquido + 'acima da meta';
           txtStatusParcial.font.Color   := clBlue;
           txtDiferenca.Font.Color       := clBlue;
           txtDiferenca.Caption          := Transform(StatusLiquido);

       end else  if ( TotalParcialVendas > TotalDaMeta ) then
       begin

           txtStatusParcial.Caption      := 'PARAB�NS VOC� ESTA ACIMA DA META DA SEMANA'; // + StatusLiquido + 'acima da meta';
           txtStatusParcial.font.Color   := clBlue;
           txtDiferenca.Font.Color       := clBlue;
           txtDiferenca.Caption          := Transform(-StatusLiquido);

      end;
      
   end;

end;


procedure T_frmMetas.btn_GravarClick(Sender: TObject);
var
  statusAtual : string;
begin

           if ( dm_Conexao.cds_Metas.Eof ) then
           begin

              GravarMeta;

           end else
           begin

               //seleciona o ultimo registro da tabela metas
               _Sql := 'SELECT max(id_meta),status FROM metas GROUP BY status';

               with DM_Pesq.Qry_Auxiliar do
               begin

                   close;
                   sql.Clear;
                   sql.Add(_Sql);
                   open;

                   if not IsEmpty then
                   begin

                       statusAtual :=  DM_Pesq.Qry_Auxiliar.Fields[1].AsString;

                       if ( statusAtual = 'F' )then
                       begin

                           //GRAVA NOVA META
                           GravarMeta;

                       end else
                       begin

                           Application.MessageBox('Grava��o n�o permitida, existe uma meta aberta!', 'Meta j� esta aberta!', MB_OK + MB_ICONWARNING);
                           btn_Gravar.Enabled    := false;
                           edtValorMeta.Text     := '0,00';
                           edt_DataInicio.Clear;
                           edt_DataFim.Clear;
                           TabStatusMeta.show;

                       end;
                  end;
             end;
         end;
end;

procedure T_frmMetas.GravarMeta;
begin

      DataInicio :=  edt_DataInicio.Date;
      DataFim    :=  edt_DataFim.Date;

      //esta fun��o retorna o mes e o ano da data solicitada ex: 06/2013 para JUN/2013
      MostrarMesEAno(edt_DataInicio.text);


      if ( DataInicio > DataFim ) then
      begin

           Application.MessageBox('A data final deve ser maior que a data inicial!', 'Per�odo inv�lido!', MB_OK + MB_ICONWARNING);
           edt_DataFim.SetFocus;

      end else begin

           With DM_Pesq.qry_Cod do
           begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_meta) from metas');
              Open;

              if not IsEmpty then
              begin

                  proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;

             with dm_Conexao.cds_Metas do
             begin

                Append;
                FieldByName('id_meta').AsInteger         := proxNum;
                FieldByName('vl_aberturameta').AsFloat   := StrToFloat(edtValorMeta.Text);
                FieldByName('vl_fechamentometa').AsFloat := 0;
                FieldByName('dtinicial').AsDateTime      := edt_DataInicio.Date;
                FieldByName('dtfinal').AsDateTime        := edt_DataFim.Date;
                FieldByName('Mesano').AsString           := mes_ano;
                FieldByName('status').AsString           := 'A';
                FieldByName('resultado').AsString        := 'SEM AVALIACAO';     //define o resultado no alcance da meta

                ApplyUpdates(0);

             end;

             btn_Gravar.Enabled   := False;
             ShowMessage('Meta definida com sucesso!');
             LogOperacoes(NomeDoUsuarioLogado, 'cadastro de nova meta');

             close;

      end;

end;

procedure T_frmMetas.AbrirTabelas;
begin

    dm_Conexao.cds_Metas.Active   := True;

end;


procedure T_frmMetas.FecharTabelas;
begin

    dm_Conexao.cds_Metas.Active    := False;

end;

procedure T_frmMetas.FecharAbrirTabelas;
begin

     dm_Conexao.cds_Metas.Active    := False;
     dm_Conexao.cds_Metas.Active    := True;

end;


procedure T_frmMetas.btn_SairClick(Sender: TObject);
begin

    Close;

end;


procedure T_frmMetas.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Release;

end;

procedure T_frmMetas.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmMetas.edtValorMetaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if key=13 then
     begin

         btn_Gravar.Enabled := true;

     end;

end;

procedure T_frmMetas.edt_DataFimChange(Sender: TObject);
begin

    edtValorMeta.SetFocus;

end;

procedure T_frmMetas.ExcluirMetaAtual;
begin

        _Sql := 'DELETE FROM metas WHERE status='+QuotedStr('A')+'';

         with DM_Pesq.Qry_Auxiliar do
         begin

             close;
             sql.Clear;
             sql.Add(_Sql);
             ExecSQL;

         end;

         ShowMessage('Meta atual exclu�da com sucesso!');
         LogOperacoes(NomeDoUsuarioLogado, 'exclus�o de meta');
         btnExcluir.Enabled := false;
         close;

end;

procedure T_frmMetas.btnExcluirClick(Sender: TObject);
begin

     //VERIFICANDO SE TEM UMA META ABERTA
     _Sql := 'SELECT * FROM metas WHERE status='+QuotedStr('A')+'';

     with DM_Pesq.Qry_Auxiliar do
     begin

         close;
         sql.Clear;
         sql.Add(_Sql);
         open;

         if not IsEmpty then
         begin

              if Application.MessageBox('Confirma exclus�o da meta atual?', 'Excluindo meta' ,Mb_OkCancel) = IDOk then
              begin

                ExcluirMetaAtual;

              end else exit;

         end else begin

            Application.MessageBox('No momento n�o existe uma meta aberta!', 'Exclus�o cancelada!', MB_OK + MB_ICONWARNING);
            exit;

         end;
     end;
end;

procedure T_frmMetas.btnImprimirRelatorioMetasClick(Sender: TObject);
begin

     Application.CreateForm(T_frmConsMetas,  _frmConsMetas);
     _frmConsMetas.ShowModal;
     FreeAndNil(_frmConsMetas);

     LogOperacoes(NomeDoUsuarioLogado, 'acesso a impress�o de metas');

end;

procedure T_frmMetas.tabRelatoriosShow(Sender: TObject);
begin

    btnExcluir.Enabled := false;
    
end;

end.
