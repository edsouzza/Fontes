unit U_ConsPedidosPorPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ToolEdit;

type
  T_frmConsPedidosPeriodo = class(TForm)
    pan_titulo: TPanel;
    pangrid_atendimentos: TPanel;
    pan_botoes: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    lblStatusLogoff: TLabel;
    lbl45: TLabel;
    lbl52: TLabel;
    edt_DataInicio: TDateEdit;
    lbl53: TLabel;
    edt_DataFim: TDateEdit;
    GroupBox1: TGroupBox;
    btnFechar: TSpeedButton;
    btnPesquisar: TSpeedButton;
    btnImprimirPeriodoDosPedidos: TSpeedButton;
    grid_ListaPedidos: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure PesquisarPeriodoPedidos;
    procedure btnImprimirPeriodoDosPedidosClick(Sender: TObject);
    procedure grid_ListaPedidosCellClick(Column: TColumn);
    procedure edt_DataInicioChange(Sender: TObject);
    procedure Limpar;
    procedure grid_ListaPedidosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);



  private
    { Private declarations }
  public
    { Public declarations }
       NumPedidoSelecionado, NomeDoFornecedor : string;
  end;

var
  _frmConsPedidosPeriodo: T_frmConsPedidosPeriodo;


implementation

uses U_dmDados,  U_dmPesquisas, U_dmDadosSegundo, U_BiblioSysSalao,  U_principal, DBClient, U_QRelPedidoPeriodo, U_FecharPedido, DB;

{$R *.dfm}


procedure T_frmConsPedidosPeriodo.FormCreate(Sender: TObject);
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

procedure T_frmConsPedidosPeriodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    DM_Pesq.cdsPesqListaPedidos.Active := false;
    Release;

end;

procedure T_frmConsPedidosPeriodo.btnFecharClick(Sender: TObject);
begin

     Limpar;

end;

procedure T_frmConsPedidosPeriodo.PesquisarPeriodoPedidos;
var
  DataInicio, DataFim : TDate;
begin

             DataInicio     := StrToDate(edt_DataInicio.text);
             DataFim        := StrToDate(edt_DataFim.text);


             with  Q_RelPedidoPeriodo.cds_RelPedidoPeriodo do
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
                    grid_ListaPedidos.DataSource :=  Q_RelPedidoPeriodo.ds_RelPedidoPeriodo;

                end;

        end;

end;

procedure T_frmConsPedidosPeriodo.FormShow(Sender: TObject);
begin

    DM_Pesq.cdsPesqListaPedidos.Active := true;
    edt_datainicio.SetFocus;

end;

procedure T_frmConsPedidosPeriodo.btnPesquisarClick(Sender: TObject);
begin

        if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
        begin
                  Application.MessageBox('É necessário uma data inicial e uma data final para efetuar a pesquisa !', 'Período Inválido!', MB_OK);
                  edt_datainicio.text          := '  /  /    ';
                  edt_DataFim.Date             := date;
                  edt_DataInicio.SetFocus;
                  btnImprimirPeriodoDosPedidos.Enabled := false;
        end
        else if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                 PesquisarPeriodoPedidos;

                 btnImprimirPeriodoDosPedidos.Enabled := true;
                 btnPesquisar.Enabled                 := false;
                 btnFechar.Caption                    := 'Limpar';

        end else begin

          Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
          edt_DataInicio.SetFocus;
          btnImprimirPeriodoDosPedidos.Enabled := false;

       end;

end;

procedure T_frmConsPedidosPeriodo.btnImprimirPeriodoDosPedidosClick(
  Sender: TObject);
begin

      Q_RelPedidoPeriodo.cds_RelPedidoPeriodo.Active := True;
      Q_RelPedidoPeriodo.Preview;

        //COLOCAR NO FINAL DAS OPÇÕES
       edt_datainicio.text                  := '  /  /    ';
       edt_DataFim.Date                     := date;
       btnImprimirPeriodoDosPedidos.Enabled := false;
       btnPesquisar.Enabled                 := true;
       btnFechar.Caption                    := 'Limpar';

end;

procedure T_frmConsPedidosPeriodo.grid_ListaPedidosCellClick(
  Column: TColumn);
begin

        NumPedidoSelecionado   := Q_RelPedidoPeriodo.cds_RelPedidoPeriodo.FieldByName('numpedido').AsString;
        NomeDoFornecedor       := Q_RelPedidoPeriodo.cds_RelPedidoPeriodo.FieldByName('forne_nome').AsString;

        Application.CreateForm(T_frmFecharPedido, _frmFecharPedido);
        _frmFecharPedido.ShowModal;
        FreeAndNil(_frmFecharPedido);

        Limpar;

end;

procedure T_frmConsPedidosPeriodo.edt_DataInicioChange(Sender: TObject);
begin

    btnPesquisar.Enabled := true;
    
end;

procedure T_frmConsPedidosPeriodo.Limpar;
begin

      if btnFechar.Caption = 'Limpar' then begin

          Q_RelPedidoPeriodo.cds_RelPedidoPeriodo.Close;
          edt_DataInicio.Text := '  /  /    ';
          edt_DataInicio.SetFocus;
          btnFechar.Caption := 'Sair';
          btnImprimirPeriodoDosPedidos.Enabled := false;

      end else begin

         Close;

      end;

end;

procedure T_frmConsPedidosPeriodo.grid_ListaPedidosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

        with grid_ListaPedidos do
            begin

              if DataSource.DataSet.FieldByName('status').AsString = 'A' then
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

