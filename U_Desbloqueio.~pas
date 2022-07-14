unit U_Desbloqueio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider, DateUtils,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, Registry, MIDASLIB;


type
  T_frmDesbloqueio = class(TForm)
    pnl_Desbloqueio: TPanel;
    grp2: TGroupBox;
    grp1: TGroupBox;
    lbl5: TLabel;
    lbl6: TLabel;
    edt_ContraChave: TEdit;
    edt_Chave: TEdit;
    grp3: TGroupBox;
    btn_ConfirmarContraChave: TSpeedButton;
    btn_Testar: TSpeedButton;
    edt_ChaveComparacao: TEdit;
    btnSair: TSpeedButton;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btn_TestarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_ConfirmarContraChaveClick(Sender: TObject);
    procedure VerificarDataDeExpiracao;
    procedure AtualizarDataAtual;
    function  DifDias(DataVenc:TDateTime; DataAtual:TDateTime): Extended;
    procedure GerarCodigo;
    procedure edt_ContraChaveChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure LimparExpiracao;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  _frmDesbloqueio : T_frmDesbloqueio;
  dataExpira      : TDateTime;
  Dia, mes, ano   : Integer;
  DT_Sistema      : TDateTime;
  DT_BancoDados   : TDateTime;
  cod1,cod2,cod3,cod4,cod5,cod6,cod7 : string;


implementation

uses U_Login, U_dmDadosSegundo, U_dmPesquisas, U_BiblioSysSalao;

{$R *.dfm}

procedure T_frmDesbloqueio.FormCreate(Sender: TObject);
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

end;

procedure T_frmDesbloqueio.LimparExpiracao;
begin

    close;

end;

procedure T_frmDesbloqueio.btn_TestarClick(Sender: TObject);
var _frmLogin  : T_frmLogin;
begin

          texto:= 'Atenção se você já é usuário do Sistema não prossiga com esta opção, saia e entre em contato conosco. '+
                  'Risco de perda de dados. Continuar?';

          if Application.MessageBox(PChar(texto),'Iniciando o Sistema!',MB_YESNO + MB_ICONERROR) = IdYes then
          begin

              if dm_DadosSegundo.cds_Expiracao.FieldByName('ACESSO').AsInteger = 0 then
              begin

                //PRIMEIRO ACESSO AO SISTEMA E GRAVANDO O PRIMEIRO REGISTRO SE A TABELA ESTIVER VAZIA
                //CONCEDENDO TRINTA DIAS DE USO PARA TESTE

                with dm_DadosSegundo.cds_Expiracao do
                begin

                  Edit;
                  FieldByName('DT_EXPIRACAO').AsDateTime := Date + 30;
                  FieldByName('ACESSO').AsInteger := 1;
                  Post;
                  applyupdates(0);
                end;

                 _frmLogin := T_frmLogin.Create(Self);
                    _frmLogin.ShowModal;
                      FreeAndNil(_frmLogin);
                      AtualizarDataAtual;
                         _frmDesbloqueio.Close;
                            _frmDesbloqueio.Release;


              end else if dm_DadosSegundo.cds_Expiracao.FieldByName('ACESSO').AsInteger <> 0 then
              begin

                  Application.Terminate;

              end;

          end else begin

                Application.Terminate;

          end;

end;

procedure T_frmDesbloqueio.FormShow(Sender: TObject);
begin

   dm_DadosSegundo.cds_Expiracao.Active := true;

   if ( dm_DadosSegundo.cds_Expiracao.RecordCount = 0 ) then
   begin

        with dm_DadosSegundo.cds_Expiracao do
        begin

          append;
          FieldByName('ID_DIA').AsInteger        := 1;
          FieldByName('DT_ATUAL').AsDateTime     := Date;
          FieldByName('DT_EXPIRACAO').AsDateTime := Date;
          FieldByName('ACESSO').AsInteger        := 0;
          Post;
          ApplyUpdates(0);

        end;

        btn_Testar.Enabled := true;
        GerarCodigo;

   end else
   begin

       VerificarDataDeExpiracao;
       GerarCodigo;

   end;

end;


procedure T_frmDesbloqueio.VerificarDataDeExpiracao;
var
     texto                     : string;
     QdeDiasParaExpirar        : double;
     DataAtual, DataExpiracao  : TDateTime;
     _frmLogin                 : T_frmLogin;
begin

        dm_DadosSegundo.cds_Expiracao.Open;

        DataAtual           :=  dm_DadosSegundo.cds_Expiracao.FieldByName('DT_ATUAL').AsDateTime;
        DataExpiracao       :=  dm_DadosSegundo.cds_Expiracao.FieldByName('DT_EXPIRACAO').AsDateTime ;
        QdeDiasParaExpirar  :=  DifDias(DataExpiracao,DataAtual);
        DT_Sistema          :=  Date;
        DT_BancoDados       :=  dm_DadosSegundo.cds_Expiracao.FieldByName('DT_ATUAL').AsDateTime;


        if DT_Sistema < DT_BancoDados then   // Data do Sistema Alterada
        begin

          Application.MessageBox('Seu Sistema está com a Data Desatualizada!',
               'Data de Sistema Inválida!', MB_OK + MB_ICONWARNING);
          Application.Terminate;


        end else if DT_Sistema >= DT_BancoDados then
        begin

           //SE A TABELA NAO ESTIVER VAZIA VERIFICA A QDE PARA EXPIRAR SENAO GRAVA O PRIMEIRO REGISTRO NA TABELA
           if (QdeDiasParaExpirar >= 1) and (QdeDiasParaExpirar <= 7) then
           begin

              texto := 'Faltam '+floattostr(QdeDiasParaExpirar)+' dia(s) para sua licença expirar! Deseja Renová-la Agora?';

              if Application.MessageBox(PChar(texto),'Licenciamento',MB_YESNO + MB_ICONWARNING) = IdYes then
              begin

                  Exit;
                  edt_ContraChave.SetFocus;

              end else
              begin

                  _frmLogin := T_frmLogin.Create(Self);
                   _frmLogin.ShowModal;
                     FreeAndNil(_frmLogin);
                     AtualizarDataAtual;
                      _frmDesbloqueio.Close;
                        _frmDesbloqueio.Release;

              end;

           end else if (QdeDiasParaExpirar <= 0) then
           begin

                Application.MessageBox('Licença expirada, entre com a chave de liberação ou fale conosco para regularização.',
                'Licenciamento!', MB_OK + MB_ICONWARNING);

                 if dm_DadosSegundo.cds_Expiracao.RecordCount = 0 then
                 begin

                    //GRAVANDO O PRIMEIRO REGISTRO SE A TABELA ESTIVER VAZIA
                    with dm_DadosSegundo.cds_Expiracao do
                    begin

                      Append;
                      Edit;
                      FieldByName('ID_DIA').AsInteger        := 1;
                      FieldByName('DT_ATUAL').AsDateTime     := Date;
                      FieldByName('DT_EXPIRACAO').AsDateTime := Date;
                      FieldByName('ACESSO').AsInteger        := 0;
                      Post;
                      ApplyUpdates(0);

                    end;

                 end;   

                AtualizarDataAtual;
                Exit;

           end else begin

               _frmLogin := T_frmLogin.Create(Self);
                 _frmLogin.ShowModal;
                  FreeAndNil(_frmLogin);
                  AtualizarDataAtual;
                    _frmDesbloqueio.Close;
                      _frmDesbloqueio.Release;
                
           end;

        end;


end;

procedure T_frmDesbloqueio.btn_ConfirmarContraChaveClick(Sender: TObject);
var _frmLogin                 : T_frmLogin;
    QdeDiasParaExpirar        : double;
    DataAtual, DataExpiracao  : TDateTime;
    keyPermanente             : string;
begin

    keyPermanente             :=  '170867231220080474';     //niver edi, vo, nane
    dm_DadosSegundo.cds_Expiracao.Open;

    DataAtual           :=  dm_DadosSegundo.cds_Expiracao.FieldByName('DT_ATUAL').AsDateTime;
    DataExpiracao       :=  dm_DadosSegundo.cds_Expiracao.FieldByName('DT_EXPIRACAO').AsDateTime ;
    QdeDiasParaExpirar  :=  DifDias(DataExpiracao,DataAtual);
    DT_Sistema          :=  Date;


   if edt_ContraChave.Text = edt_ChaveComparacao.Text then
   begin

        //SE DIGITAR A CHAVE CORRETA ABRE ACESSO DE 90 DIAS DE USO AO SISTEMA
        Application.MessageBox('Sistema Desbloqueado com Sucesso!', 'Seja Bem Vindo', MB_OK);

        with dm_DadosSegundo.cds_Expiracao do
        begin

          Open;
          Edit;
          FieldByName('DT_ATUAL').AsDateTime     := Date;
          FieldByName('DT_EXPIRACAO').AsDateTime := (DT_Sistema + QdeDiasParaExpirar) + 60;
          FieldByName('ACESSO').AsInteger        := 1;
          Post;
          ApplyUpdates(0);

          _frmLogin := T_frmLogin.Create(Self);
            _frmLogin.ShowModal;
              FreeAndNil(_frmLogin);
              _frmDesbloqueio.Close;
                _frmDesbloqueio.Release;

        end;

   end else if ( edt_ContraChave.Text = keyPermanente ) then
   begin

        //SE DIGITAR A CHAVE PERMANENTE ABRE ACESSO PERMANENTE DE ( + DE 300000 DIAS DE USO ) AO SISTEMA
        Application.MessageBox('Sistema Desbloqueado com Sucesso!', 'Seja Bem Vindo', MB_OK);

        with dm_DadosSegundo.cds_Expiracao do
        begin

          Open;
          Edit;
          FieldByName('DT_ATUAL').AsDateTime     := Date;
          FieldByName('DT_EXPIRACAO').AsDateTime := (DT_Sistema + QdeDiasParaExpirar) + 300000;
          FieldByName('ACESSO').AsInteger        := 1;
          Post;
          ApplyUpdates(0);

          _frmLogin := T_frmLogin.Create(Self);
            _frmLogin.ShowModal;
              FreeAndNil(_frmLogin);
              _frmDesbloqueio.Close;
                _frmDesbloqueio.Release;

        end;

   end else begin

         Application.MessageBox('Número da Contra-Chave Incorreto, Contacte o Administrador!', 'Licença Inválida', MB_OK);
         edt_ContraChave.SetFocus;

   end;

end;


procedure T_frmDesbloqueio.AtualizarDataAtual;
begin

    //GRAVA A DATA ATUAL NO BANCO DE DADOS
    with dm_DadosSegundo.cds_Expiracao do
    begin

      Open;
      Edit;
      FieldByName('DT_ATUAL').AsDateTime := Date;
      Post;
      ApplyUpdates(0);

    end;

end;

function T_frmDesbloqueio.DifDias(DataVenc, DataAtual: TDateTime): Extended;
Var Data: TDateTime;
        dia, mes, ano: Word;
begin

		Data := (DataVenc - DataAtual);
		DecodeDate(Data, ano, mes, dia); //DECOMPONDO A DATA
		Result := (Data);

end;

procedure T_frmDesbloqueio.GerarCodigo;
begin

        with DM_Pesq.Qry_Geral do
        begin

          Close;
          sql.Clear;
          sql.add('select DT_EXPIRACAO as data from EXPIRACAO');
          open;

        end;

        dataExpira := DM_Pesq.Qry_Geral.fieldbyname('data').Value;
        Dia        := DayOf(DM_Pesq.Qry_Geral.fieldbyname('data').Value);

        if dia > 28 then
                dia := dia - 3;
        Mes := MonthOf(DM_Pesq.Qry_Geral.fieldbyname('data').Value);
        Ano := YearOf(DM_Pesq.Qry_Geral.fieldbyname('data').Value);

        //GERA A CHAVE
        cod1 := intToStr((dia * 12) + 135);
        cod2 := intToStr((dia * 9) + 147);
        cod3 := intToStr((dia + 11) * 13);
        cod4 := intToStr((mes + 17) * 11);
        cod5 := intToStr((mes + 9) * 13);
        cod6 := intToStr((mes * 11) + 135);
        cod7 := intToStr(((ano - 2000) * 7) + 112);
        edt_chave.Text := cod1 + cod2 + cod3 + cod4 + cod5 + cod6 + cod7;

        //GERA A CONTRA-CHAVE QUE NAO FICARA VISIVEL, SERVIRA PARA COMPARAÇAO
        cod1 := intToStr((dia * 7) + 135);
        cod2 := intToStr((dia * 11) + 147);
        cod3 := intToStr((dia + 9) * 13);
        cod4 := intToStr((mes + 17) * 11);
        cod5 := intToStr((mes + 11) * 13);
        cod6 := intToStr((mes * 9) + 135);
        cod7 := intToStr(((ano - 2000) * 12) + 112);
        edt_ChaveComparacao.Text := cod1 + cod2 + cod3 + cod4 + cod5 + cod6 + cod7;

end;


procedure T_frmDesbloqueio.edt_ContraChaveChange(Sender: TObject);
begin

    btn_Testar.Enabled         := False;
    btn_ConfirmarContraChave.Enabled := True;

end;

procedure T_frmDesbloqueio.btnSairClick(Sender: TObject);
begin

    LimparExpiracao;
    Application.Terminate;

end;   

end.
