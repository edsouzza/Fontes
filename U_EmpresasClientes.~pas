unit U_EmpresasClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit,DB;

type
  T_frmEmpresasClientes = class(TForm)
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
    gridEmpresas: TDBGrid;
    btnExcluir: TSpeedButton;
    btnDefinirDefault: TSpeedButton;
    procedure btn_SairClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FecharAbrirTabelas;
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure ExcluirEmpresa;
    procedure VerificarTabelaVazia;
    procedure DBListaStatusEnter(Sender: TObject);
    procedure leitura;
    procedure editar;
    procedure PopularGridEmpresas;
    procedure AlterarEmpresaDefault;
    procedure gridEmpresasCellClick(Column: TColumn);
    procedure btnDefinirDefaultClick(Sender: TObject);


  private
    { Private declarations }


  public
    { Public declarations }


  end;

var
  _frmEmpresasClientes : T_frmEmpresasClientes;

implementation

uses U_dmDados, U_dmPesquisas, U_BiblioSysSalao, U_dmDadosSegundo, U_principal,
  SqlExpr, DBClient;

{$R *.dfm}


procedure T_frmEmpresasClientes.FormCreate(Sender: TObject);
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
   PopularGridEmpresas;

end;

procedure T_frmEmpresasClientes.FormShow(Sender: TObject);
begin

  leitura;

end;

procedure T_frmEmpresasClientes.AbrirTabelas;
begin

   dm_Conexao.cds_ListaEmpresas.Active := true;

end;


procedure T_frmEmpresasClientes.FecharTabelas;
begin

   dm_Conexao.cds_ListaEmpresas.Active := false;

end;


procedure T_frmEmpresasClientes.FecharAbrirTabelas;
begin

    dm_Conexao.cds_ListaEmpresas.Active := false;
    dm_Conexao.cds_ListaEmpresas.Active := true;

end;


procedure T_frmEmpresasClientes.btn_SairClick(Sender: TObject);
begin

     close;

end;


procedure T_frmEmpresasClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Release;

end;

procedure T_frmEmpresasClientes.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmEmpresasClientes.btnGravarClick(Sender: TObject);
begin 

   if not( editando ) then   //se nao estiver editando ou seja esta gravando novo registro
   begin

        if (DBEdit2.Text = '')then
        begin

           Application.MessageBox('Preencha os campos corretamente para continuar o cadastro!',
                                        'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
           exit;

        end else begin

            With dm_pesq.Qry_Geral do
            begin

                Close;
                SQL.Clear;
                SQL.Add('SELECT empresa FROM listaempresas WHERE empresa = :pEmpresa');
                ParamByName('pEmpresa').AsString := DBEdit2.Text;
                Open;

                if not IsEmpty then begin

                      Application.MessageBox('Atenção essa empresa já esta cadastrada, verifique!',
                                              'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
                      DBEdit2.SetFocus;
                      exit;

                  end else begin

                      dm_Conexao.cds_ListaEmpresas.Next;
                      dm_Conexao.cds_ListaEmpresas.ApplyUpdates(0);
                      LogOperacoes(NomeDoUsuarioLogado, 'inclusao de uma nova empresa');

                      DBEdit1.SetFocus;

                  end;
              end;
        end;
   end else begin

      // se estiver editando
      dm_Conexao.cds_ListaEmpresas.Next;
      dm_Conexao.cds_ListaEmpresas.ApplyUpdates(0);
      Application.MessageBox('Os dados foram alterados com sucesso!',
                      'Alteração', MB_OK + MB_ICONINFORMATION);
      LogOperacoes(NomeDoUsuarioLogado, 'alteracao de dados de uma empresa');
      DBEdit1.SetFocus;

   end;

    FecharAbrirTabelas;
    btnDefinirDefault.Enabled := false;
    editando := false;
    leitura;

end;

procedure T_frmEmpresasClientes.btnNovoClick(Sender: TObject);
begin

        DBEdit2.SetFocus;

        With DM_Pesq.Qry_Cod do
        begin

            Close;
            SQL.Clear;
            SQL.Add('select max(id_empresa) from listaempresas');
            Open;

            if not IsEmpty then begin

               proxNum := DM_Pesq.Qry_Cod.Fields[0].AsInteger + 1;

            end;

      end;


      with dm_Conexao.cds_ListaEmpresas do
      begin

          append;
          DBEdit1.Text := InttoStr(proxNum);

      end;

      editar;

end;

procedure T_frmEmpresasClientes.btnAlterarClick(Sender: TObject);
begin   

     editando  := true;
     dm_Conexao.cds_ListaEmpresas.Edit;
     DBEdit2.SetFocus;   
     editar;

end;

procedure T_frmEmpresasClientes.btnCancelarClick(Sender: TObject);
begin

    dm_Conexao.cds_ListaEmpresas.CancelUpdates;
    dm_Conexao.cds_ListaEmpresas.Prior;
    FecharAbrirTabelas;
    btnDefinirDefault.Enabled := false;
    DBEdit1.SetFocus;
    leitura;

end;

procedure T_frmEmpresasClientes.btnSairClick(Sender: TObject);
begin

    close;

end;

procedure T_frmEmpresasClientes.btnExcluirClick(Sender: TObject);
begin

       ExcluirEmpresa;
       leitura;

end;

procedure T_frmEmpresasClientes.ExcluirEmpresa;
begin

       texto:= 'Confirma a exclusão do ítem selecionado?';

       if Application.MessageBox(PChar(texto),'Excluíndo ítem',MB_YESNO + MB_ICONQUESTION) = IdYes then
       begin

           _Sql:= 'Delete FROM listaempresas WHERE id_empresa = :pID';

            with dm_pesq.Qry_Geral do
            begin

              Close;
              SQL.Clear;
              SQL.Add(_Sql);
              ParamByName('pID').AsInteger := StrToInt(DBEdit1.Text);
              ExecSQL();

           end;

           Application.MessageBox('Empresa excluída com sucesso!',
           'Exclusão', MB_OK + MB_ICONINFORMATION);

           FecharAbrirTabelas;

      end else begin

           btnDefinirDefault.Enabled := false;
          exit;
          leitura;                            

      end;

      btnDefinirDefault.Enabled := false;

end;

procedure T_frmEmpresasClientes.leitura;
begin

    btnNovo.enabled     := true;
    btnGravar.enabled   := false;
    btnAlterar.enabled  := true;
    btnCancelar.enabled := false;
    btnExcluir.enabled  := true;
    btnSair.enabled     := true;
    DBEdit2.ReadOnly    := true;
    VerificarTabelaVazia;

end;

procedure T_frmEmpresasClientes.editar;
begin

    btnNovo.enabled     := false;
    btnGravar.enabled   := true;
    btnAlterar.enabled  := false;
    btnCancelar.enabled := true;
    btnExcluir.enabled  := false;
    btnSair.enabled     := false;
    DBEdit2.ReadOnly    := false;

end;


procedure T_frmEmpresasClientes.VerificarTabelaVazia;
begin

    VerificarSeTabelaVazia(dm_Conexao.cds_ListaEmpresas, btnalterar, btnexcluir);

end;

procedure T_frmEmpresasClientes.DBListaStatusEnter(Sender: TObject);
begin

   keybd_event(VK_DOWN, 0, 0, 0);
   keybd_event(VK_UP, 0, 0, 0);

end;

procedure T_frmEmpresasClientes.PopularGridEmpresas;
begin

        if ( IdDoUsuarioLogado = 1 ) or ( idEmpresaLogada = 1 )then
             _Sql := 'SELECT * FROM listaempresas ORDER BY id_empresa'
        else
             _Sql := 'SELECT * FROM listaempresas WHERE id_empresa > 1 ORDER BY id_empresa';


         with dm_Conexao.cds_ListaEmpresas do
         begin

               close;
               CommandText:= _Sql;
               open;

          end;

          DBEdit1.DataSource  := dm_Conexao.ds_ListaEmpresas;
          DBEdit1.DataField   := 'ID_EMPRESA';

          DBEdit2.DataSource  := dm_Conexao.ds_ListaEmpresas;
          DBEdit2.DataField   := 'EMPRESA';

          with gridEmpresas do
          begin

              DataSource:=  dm_Conexao.ds_ListaEmpresas;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName         := 'ID_EMPRESA';
              Columns[0].Title.caption     := 'CÓDIGO';
              Columns[0].Width             := 120;
              Columns[0].Alignment         := taLeftJustify;
              Columns[0].Title.Font.Style  := [fsBold];
              Columns[0].Title.Alignment   := taLeftJustify;

              Columns.Add;
              Columns[1].FieldName         := 'EMPRESA';
              Columns[1].Title.caption     := 'EMPRESA';
              Columns[1].Width             := 540;
              Columns[1].Alignment         := taLeftJustify;
              Columns[1].Title.Font.Style  := [fsBold];
              Columns[1].Title.Alignment   := taLeftJustify;

         end;


end;

procedure T_frmEmpresasClientes.AlterarEmpresaDefault;
begin

      with DM_Pesq.Qry_Geral do
      begin

           close;
           sql.Clear;
           sql.Add('UPDATE permissoes SET empresaid = :pIDEmpresa');
           Params.ParamByName('pIDEmpresa').AsInteger := StrToInt(DBEdit1.Text);
           ExecSQL();

      end;

      texto:= 'Empresa definida como usuária do sistema, alteração terá efeito após reinicialização do mesmo, deseja sair agora?';

      if Application.MessageBox(PChar(texto),'Alteração de Empresa',MB_YESNO + MB_ICONEXCLAMATION) = IdYes then
      begin

           _frmPrincipal.btnSairDoSistemaClick(self);

      end else begin

          btnDefinirDefault.Enabled := false;
          exit;

      end;

      btnDefinirDefault.Enabled := false;

end;

procedure T_frmEmpresasClientes.gridEmpresasCellClick(Column: TColumn);
begin

    btnDefinirDefault.Enabled := true;

end;

procedure T_frmEmpresasClientes.btnDefinirDefaultClick(Sender: TObject);
begin

     //DEFINE COMO SENDO A EMPRESA USUARIA DO SISTEMA NO MOMENTO
     AlterarEmpresaDefault;

end;

end.
