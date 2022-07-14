unit U_ConsCotacoesPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ToolEdit;

type
  T_frmConsCotacoesPeriodo = class(TForm)
    pan_titulo: TPanel;
    pangrid_atendimentos: TPanel;
    pan_botoes: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    lblStatusLogoff: TLabel;
    lbl45: TLabel;
    grid_ListaCotacoes: TDBGrid;
    lbl52: TLabel;
    edt_DataInicio: TDateEdit;
    lbl53: TLabel;
    edt_DataFim: TDateEdit;
    GroupBox1: TGroupBox;
    btnFechar: TSpeedButton;
    btnPesquisar: TSpeedButton;
    btnImprimirPeriodoCotacao: TSpeedButton;
    btnNovaCotacao: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure PesquisarPeriodoCotacoes;
    procedure btnImprimirPeriodoCotacaoClick(Sender: TObject);
    procedure grid_ListaCotacoesCellClick(Column: TColumn);
    procedure edt_DataInicioChange(Sender: TObject);
    procedure btnNovaCotacaoClick(Sender: TObject);
    procedure grid_ListaCotacoesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);



  private
    { Private declarations }
  public
    { Public declarations }
     NumCotacaoSelecionada,IDCliente : integer;
  end;

var
  _frmConsCotacoesPeriodo: T_frmConsCotacoesPeriodo;


implementation

uses U_dmDados,  U_dmPesquisas, U_dmDadosSegundo,
  U_BiblioSysSalao,  U_principal, DBClient, U_QRelCotacaoPeriodo,
  U_FecharCotacao, U_Cotacao;

{$R *.dfm}


procedure T_frmConsCotacoesPeriodo.FormCreate(Sender: TObject);
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
    lblStatusLogoff.Caption :=  IdentificarUsuarioLogado;
    edt_DataFim.Date        :=  date;

end;

procedure T_frmConsCotacoesPeriodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    DM_Pesq.cdsPesqListaCotacoes.Active := false;
    Release;

end;

procedure T_frmConsCotacoesPeriodo.btnFecharClick(Sender: TObject);
begin

      if btnFechar.Caption = 'Limpar' then
      begin

          edt_DataInicio.Text               := '  /  /    ';
          edt_DataInicio.SetFocus;
          btnFechar.Caption                 := 'Sair';
          btnImprimirPeriodoCotacao.Enabled := false;

      end else begin

         Close;

      end;

      Q_RelCotacaoPeriodo.cds_RelCotacaoPeriodo.Close;

end;

procedure T_frmConsCotacoesPeriodo.PesquisarPeriodoCotacoes;
var
  DataInicio, DataFim : TDate;
begin

             DataInicio     := StrToDate(edt_DataInicio.text);
             DataFim        := StrToDate(edt_DataFim.text);


             with  Q_RelCotacaoPeriodo.cds_RelCotacaoPeriodo do
             begin

                Close;
                Params.ParamByName('datainicial').AsDate := DataInicio;
                Params.ParamByName('datafinal').AsDate   := DataFim;
                Open;

                if IsEmpty then
                  begin

                         Application.MessageBox('Não foram encontrados registros no período selecionado!',
                         'Atenção...', MB_OK + MB_ICONWARNING);
                         exit;

                  end else begin

                    //preenche o grid com a consulta
                    grid_ListaCotacoes.DataSource :=  Q_RelCotacaoPeriodo.ds_RelCotacaoPeriodo;

                end;

        end;

end;

procedure T_frmConsCotacoesPeriodo.FormShow(Sender: TObject);
begin

    DM_Pesq.cdsPesqListaCotacoes.Active := true;

end;

procedure T_frmConsCotacoesPeriodo.btnPesquisarClick(Sender: TObject);
begin

        if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
        begin
                  Application.MessageBox('É necessário uma data inicial e uma data final para efetuar a pesquisa !', 'Período Inválido!', MB_OK);
                  edt_datainicio.text          := '  /  /    ';
                  edt_DataFim.Date             := date;
                  edt_DataInicio.SetFocus;
                  btnImprimirPeriodoCotacao.Enabled := false;
        end
        else if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                 PesquisarPeriodoCotacoes;

                 btnImprimirPeriodoCotacao.Enabled := true;
                 btnPesquisar.Enabled              := false;
                 btnFechar.Caption                 := 'Limpar';

        end else begin

          Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
          edt_DataInicio.SetFocus;
          btnImprimirPeriodoCotacao.Enabled := false;

       end;

end;

procedure T_frmConsCotacoesPeriodo.btnImprimirPeriodoCotacaoClick(
  Sender: TObject);
begin

       Q_RelCotacaoPeriodo.cds_RelCotacaoPeriodo.Active := True;
       Q_RelCotacaoPeriodo.Preview;

       //COLOCAR NO FINAL DAS OPÇÕES
       edt_datainicio.text                  := '  /  /    ';
       edt_DataFim.Date                     := date;
       btnImprimirPeriodoCotacao.Enabled    := false;
       btnPesquisar.Enabled                 := true;
       btnFechar.Caption                    := 'Limpar';

end;

procedure T_frmConsCotacoesPeriodo.grid_ListaCotacoesCellClick(
  Column: TColumn);
begin

       NumCotacaoSelecionada   := Q_RelCotacaoPeriodo.cds_RelCotacaoPeriodo.Fields[0].Value;
       IDCliente               := Q_RelCotacaoPeriodo.cds_RelCotacaoPeriodo.Fields[1].Value;

       Application.CreateForm(T_frmFecharCotacao,  _frmFecharCotacao);
       _frmFecharCotacao.ShowModal;
       FreeAndNil(_frmFecharCotacao);

end;

procedure T_frmConsCotacoesPeriodo.edt_DataInicioChange(Sender: TObject);
begin
   btnPesquisar.Enabled := true;
end;

procedure T_frmConsCotacoesPeriodo.btnNovaCotacaoClick(Sender: TObject);
begin

      Application.CreateForm(T_frmCotacao,  _frmCotacao);
      _frmCotacao.ShowModal;
      FreeAndNil(_frmCotacao);
      close;

end;

procedure T_frmConsCotacoesPeriodo.grid_ListaCotacoesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

      with grid_ListaCotacoes do
      begin

        if DataSource.DataSet.FieldByName('status').AsString = 'AB' then
        begin

            if (gdSelected in State) then

              Canvas.Brush.Color := clMaroon   // cor do fundo da linha que estiver selecionada

            else
            begin

              // configuração das linhas que atendem o primeiro if, ou seja com STATUS A
              Canvas.Font.Style  := [fsBold];
              Canvas.Font.Color  := clBlue;

              // cor do fundo de todas as linhas
              Canvas.Brush.Color := clInfoBk;

            end
            end else begin

              // configuração das linhas que não atendem o primeiro if, ou seja com STATUS F ou C
              Canvas.Font.Color  := clRed;
              Canvas.Brush.Color := clInfoBk;

            end;

            DefaultDrawColumnCell(Rect,DataCol,Column,State);

      end;

end;

end.

