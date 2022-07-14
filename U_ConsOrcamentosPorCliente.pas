unit U_ConsOrcamentosPorCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ToolEdit;

type
  T_frmConsOrcamentosPorCliente = class(TForm)
    pan_titulo: TPanel;
    pangrid_atendimentos: TPanel;
    pan_botoes: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    grid_Lista: TDBGrid;
    lbl52: TLabel;
    edt_DataInicio: TDateEdit;
    lbl53: TLabel;
    edt_DataFim: TDateEdit;
    db_CLIENTE_ID: TDBEdit;
    btnFechar: TSpeedButton;
    GroupBox9: TGroupBox;
    edtNome: TEdit;
    lblStatusLogoff: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grid_ListaCellClick(Column: TColumn);
    procedure btnPesquisarClick(Sender: TObject);
    procedure PesquisarPeriodoOrcamentosIndividuais;
    procedure PesquisarPorNome;
    procedure PreencherGrid;
    procedure edtNomeChange(Sender: TObject);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_DataInicioClick(Sender: TObject);
    procedure edt_DataFimClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  _frmConsOrcamentosPorCliente: T_frmConsOrcamentosPorCliente;


implementation

uses U_dmDados,  U_dmPesquisas, U_dmDadosSegundo,
  U_BiblioSysSalao,  U_principal, U_QRelListaCotacoes,
  DBClient, U_QRelListaOrcamentos, DB, U_OrcamentosParaImpressaoDeRecibos;

{$R *.dfm}


procedure T_frmConsOrcamentosPorCliente.FormCreate(Sender: TObject);
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


    //Recebe a data atual por padrão

    lblDataDoDia.Caption    :=  DateToStr(date);
    lblHoraAtual.Caption    :=  timetoStr(time);
    lblStatusLogoff.Caption :=  NomeDoUsuarioLogado;
    edt_DataInicio.Date     :=  date;
    edt_DataFim.Date        :=  date;
    DM_Pesq.cdsPesqListaOrcamentos.Active:=false;
    DM_Pesq.cdsPesqListaOrcamentos.Active:=true;
    PreencherGrid;

end;

procedure T_frmConsOrcamentosPorCliente.PesquisarPorNome;
var
  nome : string;
begin

      nome := edtNome.Text;

      _Sql  :=  'select DISTINCT o.id_cliente, cli.cli_id, cli.cli_nome FROM orcamento o, clientes cli '+
                'WHERE o.id_cliente = cli.cli_id AND cli_nome LIKE (''%'+nome+'%'') ORDER BY cli.cli_nome';

      with DM_Pesq.cdsPesqListaOrcamentos do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;    

end;


procedure T_frmConsOrcamentosPorCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    DM_Pesq.cdsPesqListaOrcamentos.Active := false;

end;

procedure T_frmConsOrcamentosPorCliente.btnFecharClick(Sender: TObject);
begin

    ImprimindoRelatorio := false;
    Close;

end;

procedure T_frmConsOrcamentosPorCliente.FormShow(Sender: TObject);
begin

    DM_Pesq.cdsPesqListaOrcamentos.Active := true;
    Caption := 'LOGADO POR '+NomeDoUsuarioLogado;
    edtNome.SetFocus;

end;

procedure T_frmConsOrcamentosPorCliente.grid_ListaCellClick(Column: TColumn);
begin

     btnPesquisarClick(Self);

end;

procedure T_frmConsOrcamentosPorCliente.btnPesquisarClick(Sender: TObject);
begin

       periodo := edt_DataInicio.Text+' a '+edt_DataFim.Text;

       if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
        begin
                  Application.MessageBox('É necessário uma data inicial e uma data final para efetuar a pesquisa !', 'Período Inválido!', MB_OK);
                  edt_datainicio.text          := '  /  /    ';
                  edt_DataFim.Date             := date;
                  edt_DataInicio.Date          :=  date;
                  edt_DataInicio.SetFocus;

        end
        else if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                 PesquisarPeriodoOrcamentosIndividuais;

        end else begin

          Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
          edt_DataInicio.SetFocus;

       end;

       //COLOCAR NO FINAL DAS OPÇÕES
       //edt_datainicio.text   := '  /  /    ';
       edt_DataFim.Date      := date;
       edt_DataInicio.Date   :=  date;

end;

procedure T_frmConsOrcamentosPorCliente.PesquisarPeriodoOrcamentosIndividuais;
begin

           DataInicio             := StrToDate(edt_DataInicio.text);
           DataFim                := StrToDate(edt_DataFim.text);
           DataInicioImprimir     := StrToDate(edt_DataInicio.text);
           DataFimImprimir        := StrToDate(edt_DataFim.text);
           IdCliente              := StrToInt(db_CLIENTE_ID.Text);

           Application.CreateForm(TQ_RelListaOrcamentos,  Q_RelListaOrcamentos);
           Q_RelListaOrcamentos.cds_RelListaOrcamentos.Active    := True;

           with Q_RelListaOrcamentos.cds_RelListaOrcamentos do
           begin

               close;
               Params.ParamByName('pIDCliente').AsInteger    := IdCliente;
               Params.ParamByName('datainicial').AsDate      := DataInicio;
               Params.ParamByName('datafinal').AsDate        := DataFim;
               Open;

                if IsEmpty then
                  begin

                         Application.MessageBox('Não foram encontrados registros no período selecionado!',
                         'Atenção...', MB_OK + MB_ICONWARNING);
                         FreeAndNil(Q_RelListaOrcamentos);
                         exit;

                 end else begin


                   if (ImprimindoRelatorio) then
                   begin

                        if(TemOrcamentosFinalizados(IdCliente))then
                        begin

                            //lista todos os orçamentos finalizados deste cliente para impressão do recibo
                            Application.CreateForm(T_frmOrcamentosParaImpressaoDeRecibos,  _frmOrcamentosParaImpressaoDeRecibos);
                            _frmOrcamentosParaImpressaoDeRecibos.ShowModal;
                            FreeAndNil(_frmOrcamentosParaImpressaoDeRecibos);
                            FreeAndNil(Q_RelListaOrcamentos);

                            //COLOCAR NO FINAL DAS OPÇÕES
                            edt_datainicio.text   := '  /  /    ';
                            edt_DataFim.Date      := date;

                        end else begin

                              Application.MessageBox('Nenhum orçamento finalizado para este cliente no momento!',
                             'Atenção...', MB_OK + MB_ICONWARNING);

                             FreeAndNil(Q_RelListaOrcamentos);

                            //COLOCAR NO FINAL DAS OPÇÕES
                            edt_datainicio.text   := '  /  /    ';
                            edt_DataFim.Date      := date;

                        end;


                   end else begin

                     //lista todos os orçamentos do cliente selecionado
                     //Q_RelListaOrcamentos.Q_lblNomeUsuarioLogado.Caption   := NomeDoUsuarioLogado;
                     Q_RelListaOrcamentos.Q_lblNomeUsuarioLogado.Caption      := sUsuarioLogado;
                     Q_RelListaOrcamentos.ReportTitle:='Consultando orçamentos do cliente selecionado dentro do período '+periodo;
                     Q_RelListaOrcamentos.Preview;
                     FreeAndNil(Q_RelListaOrcamentos);

                     //COLOCAR NO FINAL DAS OPÇÕES
                     edt_datainicio.text   := '  /  /    ';
                     edt_DataFim.Date      := date;
                     
                   end;

                 end;

           end;

           edtNome.Clear;
           edtNome.SetFocus;


end;

procedure T_frmConsOrcamentosPorCliente.edtNomeChange(Sender: TObject);
begin

    PesquisarPorNome;

end;

procedure T_frmConsOrcamentosPorCliente.edtNomeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if key=13 then
     begin

         edtNome.Clear;
         
     end;

end;

procedure T_frmConsOrcamentosPorCliente.PreencherGrid;
begin

      //MOSTRA TODOS OS CLIENTES COM ORCAMENTOS PENDENTES

      with DM_Pesq.cdsPesqListaOrcamentos do
      begin

          Close;
          CommandText:= ('select distinct c.cli_id, c.cli_nome from clientes c, orcamento o where o.id_cliente=c.cli_id');
          Open;

      end;

      db_CLIENTE_ID.DataSource          :=  DM_Pesq.dsPesqListaOrcamentos;
      db_CLIENTE_ID.DataField           := 'CLI_ID';

      with grid_Lista do
      begin

        DataSource:=  DM_Pesq.dsPesqListaOrcamentos;
        Columns.Clear;

        Columns.Add;
        Columns[0].FieldName         := 'CLI_NOME';
        Columns[0].Width             := 820;
        Columns[0].Alignment         := taLeftJustify;
        Columns[0].Title.caption     := 'CLIENTES';
        Columns[0].Title.Font.Style  := [fsBold];
        Columns[0].Title.Alignment   := taCenter;

      end;

end;

procedure T_frmConsOrcamentosPorCliente.edt_DataInicioClick(
  Sender: TObject);
begin
     edt_DataInicio.SelectAll;
end;

procedure T_frmConsOrcamentosPorCliente.edt_DataFimClick(Sender: TObject);
begin
   edt_DataFim.SelectAll;
end;

end.
