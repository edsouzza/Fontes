unit U_PERMISSOES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids;

type
  TF_PERMISSOES = class(TForm)
    Panel1: TPanel;
    Grid_Menus: TDBGrid;
    Panel2: TPanel;
    rdLIBERADO: TRadioButton;
    rdBLOQUEADO: TRadioButton;
    btnGravar: TSpeedButton;
    btnSair: TSpeedButton;
    lstLISTAFUNCOES: TListBox;
    btnCancelar: TSpeedButton;

    //PROCEDIMENTOS E FUNCOES PERSO
    procedure PopularGridMenu;
    procedure ConfigsIniciais;
    procedure VerificarEstadoDoMenu(id:integer);

    procedure eventoTimerReiniciar(Sender: TObject);
    procedure ReiniciarComMensagemTemporizada;

    function GravouAlteracoes:boolean;

    //PROCEDIMENTOS PADRAO
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure Grid_MenusCellClick(Column: TColumn);
    procedure rdLIBERADOClick(Sender: TObject);
    procedure rdBLOQUEADOClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
             

  private
    { Private declarations }
     

  public
    { Public declarations }


  end;

var
  F_PERMISSOES: TF_PERMISSOES;

implementation

uses U_BiblioSysSalao, U_dmPesqDados, DBClient, SqlExpr, U_dmPesquisas;

{$R *.dfm}

{ TForm1 }



{ TF_PERMISSOES }

procedure TF_PERMISSOES.FormCreate(Sender: TObject);
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

  cdsTable := DM_PESQDADOS.cds_MENUS;
  AbrirTabela(cdsTable);
  CriarTimerReiniciar;
  TimerReiniciar.OnTimer:= eventoTimerReiniciar;
  TimerReiniciar.Enabled := true;     //caso não seja ativado na criação

end;


procedure TF_PERMISSOES.FormShow(Sender: TObject);
begin

    PopularGridMenu;

end;

procedure TF_PERMISSOES.PopularGridMenu;
begin
      lstLISTAFUNCOES.Selected [0] := true;
      
      //POPULANDO GRID MENUS
      with cdsTable do
      begin

          Close;
          CommandText:= ('SELECT * FROM menus WHERE nivelid=3');
          Open;

            if not IsEmpty then
            begin

                with Grid_Menus do
                begin

                  DataSource:=  DM_PESQDADOS.ds_MENUS;
                  Columns.Clear;

                  Columns.Add;
                  Columns[0].FieldName         := 'MENU';
                  Columns[0].Width             := 410;
                  Columns[0].Alignment         := taLeftJustify;

                end;

            end;

      end;

      ConfigsIniciais;

end;

procedure TF_PERMISSOES.Grid_MenusCellClick(Column: TColumn);
begin  

     idSelecionado       := DM_PESQDADOS.cds_MENUS.fieldbyname('codigo').AsInteger;
     VerificarEstadoDoMenu(idSelecionado);

end;

procedure TF_PERMISSOES.btnSairClick(Sender: TObject);
begin  
  close;
end;

function TF_PERMISSOES.GravouAlteracoes:boolean;
begin

  {ShowMessage('ID DO MENU  SELECIONADO : '+IntToStr(idSelecionado));
  ShowMessage('ID DO NIVEL SELECIONADO : '+IntToStr(UserLevel));}    

  //LIBERANDO ACESSOS
  if(rdLIBERADO.Checked)then
  begin

     with DM_PESQ.Qry_Geral do
      begin

          Close;
          SQL.Clear;
          sql.Add('UPDATE menus SET status='+QuotedStr('L')+' WHERE codigo = :pCod AND nivelid = :pIdNivel');
          Params.ParamByName('pCod').AsInteger     := idSelecionado;
          Params.ParamByName('pIdNivel').AsInteger := UserLevel;
          ExecSQL;

      end;
      Result := true;

  end else if(rdBLOQUEADO.Checked)then
  begin

      with DM_PESQ.Qry_Geral do
      begin

          Close;
          SQL.Clear;
          sql.Add('UPDATE menus SET status='+QuotedStr('B')+' WHERE codigo = :pCod AND nivelid = :pIdNivel');
          Params.ParamByName('pCod').AsInteger     := idSelecionado;
          Params.ParamByName('pIdNivel').AsInteger := UserLevel;
          ExecSQL;

      end;
       Result := true;
       
  end else begin
       Result := false;
  end;

end;

procedure TF_PERMISSOES.btnGravarClick(Sender: TObject);
begin

    if (GravouAlteracoes)then
    begin
        //ShowMessage('ALTERAÇÕES GRAVADAS COM SUCESSO!');
        ReiniciarComMensagemTemporizada;
    end else begin
        ShowMessage('ERRO! NÃO FOI POSSÍVEL GRAVAR AS ALTERAÇÕES NO BANCO!');
    end;

    ConfigsIniciais;

end;  

procedure TF_PERMISSOES.ConfigsIniciais;
begin

    btnGravar.Enabled            := false;
    btnCancelar.Enabled          := false;
    rdLIBERADO.Checked           := false;
    rdBLOQUEADO.Checked          := false;
    rdLIBERADO.Enabled           := false;
    rdBLOQUEADO.Enabled          := false;
    UserLevel                    := 3;

end;

procedure TF_PERMISSOES.rdLIBERADOClick(Sender: TObject);
begin
btnGravar.Enabled    := true;
btnCancelar.Enabled  := true;
end;

procedure TF_PERMISSOES.rdBLOQUEADOClick(Sender: TObject);
begin
btnGravar.Enabled    := true;
btnCancelar.Enabled  := true;
end;

procedure TF_PERMISSOES.btnCancelarClick(Sender: TObject);
begin
ConfigsIniciais;
end;

procedure TF_PERMISSOES.VerificarEstadoDoMenu(id: integer);
begin

    with DM_PESQ.Qry_Geral do
    begin

        Close;
        sql.Clear;
        sql.Add('SELECT * FROM menus WHERE nivelid=3 AND codigo = :pId');
        Params.ParamByName('pId').AsInteger  := idSelecionado;
        Open;

          if not IsEmpty then
          begin

             if(DM_PESQ.Qry_Geral.FieldByName('status').AsString = 'L') then
             begin

                  rdBLOQUEADO.Enabled := true;
                  rdLIBERADO.Enabled  := false;

             end else
             begin

                  rdBLOQUEADO.Enabled := false;
                  rdLIBERADO.Enabled  := true;

             end;

          end;

     end;
end;

procedure TF_PERMISSOES.eventoTimerReiniciar(Sender: TObject);
begin

  keybd_event(VK_RETURN,0,0,0);
  TimerReiniciar.Enabled := False;

end;

procedure TF_PERMISSOES.ReiniciarComMensagemTemporizada;
begin

     texto := 'As permissões foram alteradas com sucesso o sistema será reiniciado automaticamente, acesse novamente!';
     ReiniciarComMensagemETemporizador(TimerReiniciar,texto,'Reiniciando...',5000);

end;

end.
