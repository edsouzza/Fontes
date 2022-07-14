unit U_Segmentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit;

type
  T_frmSegmentos = class(TForm)
    pnl_cabecalho: TPanel;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    panGridCadCategorias: TPanel;
    gr_CadCategorias: TGroupBox;
    GroupBox14: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    gr_EditarNovo: TGroupBox;
    btnAlterar: TSpeedButton;
    btnNovo: TSpeedButton;
    btnGravar: TSpeedButton;
    btnSair: TSpeedButton;
    btnCancelar: TSpeedButton;
    gridCredores: TDBGrid;
    btnExcluir: TSpeedButton;
    procedure btn_SairClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure GravarNovoSegmento;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DesabilitarBotoesCredores;
    procedure gridCredoresCellClick(Column: TColumn);
    procedure btnSairClick(Sender: TObject);
    procedure FecharAbrirTabelas;
    procedure RetornaEstadoInicialDosBotoes;
    procedure FormShow(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure ExcluirSegmento;


  private
    { Private declarations }


  public
    { Public declarations }


  end;

var
  _frmSegmentos : T_frmSegmentos;
  proxNumCaixa : Integer;

implementation

uses U_BiblioSysSalao, U_dmDadosSegundo, U_principal, U_dmDados,
  U_dmPesquisas, SqlExpr, DBClient, DB;

{$R *.dfm}


procedure T_frmSegmentos.FormCreate(Sender: TObject);
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

   AbrirTabelas;

end;

procedure T_frmSegmentos.FormShow(Sender: TObject);
begin

    RetornaEstadoInicialDosBotoes;

end;


procedure T_frmSegmentos.AbrirTabelas;
begin

    dm_DadosSegundo.cds_Segmentos.Active      := True;

end;


procedure T_frmSegmentos.FecharTabelas;
begin

    dm_DadosSegundo.cds_Segmentos.Active       := False;

end;


procedure T_frmSegmentos.FecharAbrirTabelas;
begin

    dm_DadosSegundo.cds_Segmentos.Active       := False;
    dm_DadosSegundo.cds_Segmentos.Active       := True;

end;


procedure T_frmSegmentos.btn_SairClick(Sender: TObject);
begin

     close;

end;


procedure T_frmSegmentos.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmSegmentos.edt_nomeKeyPress(Sender: TObject;
  var Key: Char);
begin

    // PARA DBEDIT ACEITAR APENAS NUMEROS
    If NOT (Key in['0'..'9',',',#8,#13]) then begin Key:=#0;end;

end;

procedure T_frmSegmentos.btnGravarClick(Sender: TObject);
begin

    if (DBEdit2.Text = '') then
    begin

       Application.MessageBox('Preencha os campos corretamente para continuar o cadastro!',
                                    'Informação do Sistema', MB_OK + MB_ICONINFORMATION);

    end else begin

        With DM_Pesq.Qry_Geral do
        begin

            Close;
            SQL.Clear;
            SQL.Add('select seg_nome from segmentos WHERE seg_nome = :pSegmento');
            ParamByName('pSegmento').AsString := DBEdit2.Text;
            Open;

            if not IsEmpty then begin

                  Application.MessageBox('Esse contato já esta cadastrado!',
                                          'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
                  btnCancelarClick(Self);
                  exit;

              end else begin

                  dm_DadosSegundo.cds_segmentos.Next;
                  dm_DadosSegundo.cds_segmentos.ApplyUpdates(0);

                  //GravarNovoSegmento;

                  Application.MessageBox('Segmento cadastrado com sucesso!','Informação do Sistema', MB_OK + MB_ICONINFORMATION);

                  LogOperacoes(NomeDoUsuarioLogado, 'cadastro ou alteração de contato');
                  FecharAbrirTabelas;
                  RetornaEstadoInicialDosBotoes;
                  DBEdit2.ReadOnly  := true;
                  DBEdit1.SetFocus;
                  {
                  if(gravouNovoSegmentoPelosContatos)then
                  begin
                     gravouNovoSegmentoPelosContatos  := false;
                     close;
                     release;
                  end;
                       }
              end;
          end;
    end;

end;

procedure T_frmSegmentos.GravarNovoSegmento;
begin

  _Sql:= 'insert into segmentos (seg_id, seg_nome) VALUES (:pId, :pNome)';

  With DM_Pesq.Qry_Geral do
  begin

      Close;
      SQL.Clear;
      SQL.Add(_Sql);
      Params.ParamByName('pId').AsInteger   := StrToInt(DBEdit1.Text);
      Params.ParamByName('pNome').AsString  := DBEdit2.Text;
      ExecSQL();

  end;


 

end;

procedure T_frmSegmentos.btnNovoClick(Sender: TObject);
begin

      DBEdit2.ReadOnly := false;

      proxNum := GerarProximoID('seg_id','segmentos');

      with dm_DadosSegundo.cds_Segmentos do
      begin

          append;
          DBEdit1.Text := InttoStr(proxNum);
          DBEdit2.Text := '';
          DBEdit2.SetFocus;

      end;

end;

procedure T_frmSegmentos.btnAlterarClick(Sender: TObject);
begin

     dm_DadosSegundo.cds_Segmentos.Edit;
     DBEdit2.ReadOnly     := false;
     DBEdit2.SetFocus;
     btnCancelar.Enabled  := true;
     btnGravar.Enabled    := true;

end;

procedure T_frmSegmentos.btnCancelarClick(Sender: TObject);
begin

    dm_DadosSegundo.cds_Segmentos.CancelUpdates;
    dm_DadosSegundo.cds_Segmentos.Prior;

    FecharAbrirTabelas;
    RetornaEstadoInicialDosBotoes;
    DBEdit2.ReadOnly  := true;
    DBEdit1.SetFocus;

end;

procedure T_frmSegmentos.DesabilitarBotoesCredores;
begin

     btnGravar.Enabled    := false;
     btnNovo.Enabled      := false;
     btnAlterar.Enabled   := false;
     btnSair.Enabled      := false;
     btnCancelar.Enabled  := true;

end;

procedure T_frmSegmentos.RetornaEstadoInicialDosBotoes;
begin

     btnGravar.Enabled    := false;
     btnNovo.Enabled      := true;
     btnCancelar.Enabled  := false;
     btnSair.Enabled      := true;
     btnExcluir.Enabled   := false;

     if ( dm_DadosSegundo.cds_Segmentos.Eof ) then
     begin

         btnAlterar.Enabled   := false;

     end else begin

          btnAlterar.Enabled   := true;

     end;

end;


procedure T_frmSegmentos.gridCredoresCellClick(Column: TColumn);
begin

    RetornaEstadoInicialDosBotoes;
    btnNovo.Enabled     := false;
    btnCancelar.Enabled := true;
    btnExcluir.Enabled  := true;
    
end;

procedure T_frmSegmentos.btnSairClick(Sender: TObject);
begin

    close;
    release;

end;

procedure T_frmSegmentos.DBEdit1Enter(Sender: TObject);
begin

     btnGravar.Enabled := false;

end;

procedure T_frmSegmentos.DBEdit2Enter(Sender: TObject);
begin

    DesabilitarBotoesCredores;

end;

procedure T_frmSegmentos.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin

    btnGravar.Enabled    := true;

end;

procedure T_frmSegmentos.btnExcluirClick(Sender: TObject);
begin

  ExcluirSegmento;    

end;

procedure T_frmSegmentos.ExcluirSegmento;
begin

      texto:= 'Confirma a exclusão do ítem selecionado?';

       if Application.MessageBox(PChar(texto),'Excluíndo ítem',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

           _Sql:= 'Delete FROM segmentos WHERE seg_id = :pID';

            with DM_Pesq.Qry_Geral do begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              ParamByName('pID').AsInteger := StrToInt(DBEdit1.Text);
              ExecSQL();

           end;

           Application.MessageBox('Contato excluído com sucesso!',
           'Exclusão', MB_OK + MB_ICONINFORMATION);
           LogOperacoes(NomeDoUsuarioLogado, 'exclusão de contato');

           FecharAbrirTabelas;
           RetornaEstadoInicialDosBotoes;

      end else begin

          RetornaEstadoInicialDosBotoes;
          exit;

      end;

end;



end.
