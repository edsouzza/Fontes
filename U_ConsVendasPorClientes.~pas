unit U_ConsVendasPorClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ToolEdit;

type
  T_frmVendasPorClientes = class(TForm)
    pan_titulo: TPanel;
    pangrid_atendimentos: TPanel;
    pan_botoes: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    lblStatusLogoff: TLabel;
    lbl45: TLabel;
    lbl52: TLabel;
    lbl53: TLabel;
    edt_DataInicio: TDateEdit;
    edt_DataFim: TDateEdit;
    GroupBox1: TGroupBox;
    btnFechar: TSpeedButton;
    db_IDCLIENTE: TDBEdit;
    edtConsCliente: TEdit;
    grid_Clientes: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure PesquisarPeriodoVendas;
    procedure FormShow(Sender: TObject);
    procedure grid_ClientesCellClick(Column: TColumn);
    procedure FiltrarPorCliente;
    procedure edtConsClienteChange(Sender: TObject);
    procedure edtConsClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConsClienteClick(Sender: TObject);
    procedure PopularGrid;


  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  _frmVendasPorClientes: T_frmVendasPorClientes;


implementation

uses U_dmDados, U_dmPesquisas, U_dmDadosSegundo,
  U_BiblioSysSalao, U_principal, U_QRelAtendimentos,
  U_RelVendasPorClientes, U_Financeiro;

{$R *.dfm}


procedure T_frmVendasPorClientes.FormCreate(Sender: TObject);
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

procedure T_frmVendasPorClientes.FiltrarPorCliente;
var
  nome : string;
begin

       nome := edtConsCliente.Text;

      _Sql  := 'SELECT * FROM clientes WHERE cli_status = '+QuotedStr('A')+' AND cli_nome LIKE (''%'+nome+'%'') ORDER BY cli_nome';

      with DM_Pesq.cdsPesqCliente do
      begin

            Close;
            CommandText:= (_Sql);
            Open;

      end;

end;

procedure T_frmVendasPorClientes.FormShow(Sender: TObject);
begin

   dm_Conexao.cds_DadosClientes.Active := true;
   edt_DataInicio.Date                 := DataInicio;
   edt_DataFim.Date                    := DataFim;
   PopularGrid;
   edtConsCliente.SetFocus;

end;

procedure T_frmVendasPorClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    dm_Conexao.cds_DadosClientes.Active := false;
    Release;

end;

procedure T_frmVendasPorClientes.btnFecharClick(Sender: TObject);
begin

    Close;

end;     

procedure T_frmVendasPorClientes.PesquisarPeriodoVendas;
var
  DataInicio, DataFim : TDate;
  Id_Cliente      : Integer;
begin

        if db_IDCLIENTE.Text = '' then
        begin

            Application.MessageBox('No momento não há clientes cadastrados!','Informação do Sistema',Mb_IconInformation);
            exit;

        end
        else begin

             DataInicio     := StrToDate(edt_DataInicio.text);
             DataFim        := StrToDate(edt_DataFim.text);
             Id_Cliente     := StrToInt(db_IDCLIENTE.text);


             with Q_RelVendasPorClientes.cds_RelVendasPorClientes do
             begin

                Close;
                Params.ParamByName('pIDCliente').AsInteger  := Id_Cliente;
                Params.ParamByName('datainicio').AsDate     := DataInicio;
                Params.ParamByName('datafim').AsDate        := DataFim;
                Open;

                if IsEmpty then
                 begin

                         Application.MessageBox('Não foram encontrados registros no período selecionado!',
                         'Atenção...', MB_OK + MB_ICONWARNING);
                         exit;

                end else begin

                     Q_RelVendasPorClientes.cds_RelVendasPorClientes.Active:= True;
                     Q_RelVendasPorClientes.Preview;

                end;

              end;
        end;
end;

procedure T_frmVendasPorClientes.grid_ClientesCellClick(Column: TColumn);
begin

        if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
        begin
                  Application.MessageBox('É necessário uma data inicial e uma data final para efetuar a pesquisa !', 'Período Inválido!', MB_OK);
                  edt_datainicio.text          := '  /  /    ';
                  edt_DataFim.Date             := date;
                  edt_DataInicio.SetFocus;

        end
        else if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                PesquisarPeriodoVendas;

             end else begin

                Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
                edt_DataInicio.SetFocus;

            end;


      //COLOCAR NO FINAL DAS OPÇÕES
       edt_DataFim.Date      := date;
end;

procedure T_frmVendasPorClientes.edtConsClienteChange(Sender: TObject);
begin

    FiltrarPorCliente;

end;

procedure T_frmVendasPorClientes.edtConsClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

     if KEY = VK_RETURN then
     begin

          edtConsCliente.Clear;

      end;

end;

procedure T_frmVendasPorClientes.edtConsClienteClick(Sender: TObject);
begin
    edtConsCliente.Clear;
end;

procedure T_frmVendasPorClientes.PopularGrid;
begin

            //MOSTRA TODOS OS CLIENTES COM EXCEÇÃO DOS  INATIVOS

            with DM_Pesq.cdsPesqCliente do
            begin

                Close;
                CommandText:= ('SELECT * FROM clientes WHERE cli_status = :pStatus ORDER BY cli_nome');
                Params.ParamByName('pStatus').AsString  := 'A';
                Open;

            end;

            db_IDCLIENTE.DataSource          :=  DM_Pesq.dsPesqCliente;
            db_IDCLIENTE.DataField           := 'CLI_ID';


            with Grid_Clientes do
            begin

              DataSource:=  DM_Pesq.dsPesqCliente;
              Columns.Clear;

              Columns.Add;
              Columns[0].FieldName         := 'CLI_NOME';
              Columns[0].Width             := 830;
              Columns[0].Alignment         := taLeftJustify;
              Columns[0].Title.caption     := 'CLIENTES';
              Columns[0].Title.Font.Style  := [fsBold];
              Columns[0].Title.Alignment   := taCenter;

            end;

end;

end.

