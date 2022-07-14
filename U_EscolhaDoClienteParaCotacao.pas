unit U_EscolhaDoClienteParaCotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaClienteParaCotacao = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    pnl1: TPanel;
    grid_clientesCotacao: TDBGrid;
    GroupBox1: TGroupBox;
    edt_NomeCliente: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure PopulandoGridClientes;
    procedure pnl_rodapeClick(Sender: TObject);
    procedure grid_clientesCotacaoCellClick(Column: TColumn);
    procedure PesquisaPeloNomeCliente;
    procedure edt_NomeClienteChange(Sender: TObject);
    procedure edt_NomeClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    

  end;

var
  _frmEscolhaClienteParaCotacao: T_frmEscolhaClienteParaCotacao;

implementation

uses U_dmDados, U_BiblioSysSalao, U_dmPesquisas,
  DB, U_Cotacao, U_dmDadosSegundo,U_Clientes;

{$R *.dfm}

procedure T_frmEscolhaClienteParaCotacao.FormCreate(Sender: TObject);
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

  PopulandoGridClientes;

end;

procedure T_frmEscolhaClienteParaCotacao.PopulandoGridClientes;
begin

        _Sql := 'SELECT cli_id, cli_nome, cli_status FROM clientes WHERE cli_status = '+QuotedStr('A')+' '+
        'AND cli_nome <> '+QuotedStr('VENDA BALCAO')+' ORDER BY cli_nome';


            with DM_Pesq.cdsPesqClientesCotacao do begin

                Close;
                CommandText:= (_Sql);
                Open;

                if IsEmpty then begin

                   grid_clientesCotacao.Enabled := false;
                   edt_NomeCliente.Enabled      := false;

                end else
                begin

                        with grid_clientesCotacao do
                        begin

                          DataSource:=  DM_Pesq.dsPesqClientesCotacao;
                          Columns.Clear;

                          Columns.Add;
                          Columns[0].FieldName       := 'CLI_NOME';
                          Columns[0].Width           := 540;
                          Columns[0].Alignment       := taLeftJustify;

                        end;

                end;

          end;

end;

procedure T_frmEscolhaClienteParaCotacao.pnl_rodapeClick(Sender: TObject);
begin

   close;

end;

procedure T_frmEscolhaClienteParaCotacao.grid_clientesCotacaoCellClick(
  Column: TColumn);
begin


      _frmCotacao.txt_NomeClienteCotacao.Caption  :=  DM_Pesq.cdsPesqClientesCotacao.fieldbyname('CLI_NOME').AsString;
      _frmCotacao.txt_IDCLIENTE.Text              :=  IntToStr(DM_Pesq.cdsPesqClientesCotacao.fieldbyname('CLI_ID').AsInteger);
      _frmCotacao.txt_NomeProdutoCotacao.Enabled  := true;

      close;


end;

procedure T_frmEscolhaClienteParaCotacao.PesquisaPeloNomeCliente;
var
  nome : string;
begin

      nome := edt_NomeCliente.Text;

       _Sql := 'SELECT cli_nome, cli_id, cli_status FROM clientes WHERE cli_status = :pStatusCliente '+
                'AND cli_nome <> '+QuotedStr('VENDA BALCAO')+' AND cli_nome LIKE (''%'+nome+'%'')';

        with DM_Pesq.cdsPesqClientesCotacao do begin

                Close;
                CommandText:=(_Sql);
                Params.ParamByName('pStatusCliente').AsString :=  'A';
                Open;

                if IsEmpty then begin

                   grid_clientesCotacao.Enabled := false;
                   edt_NomeCliente.Enabled      := false;

                end else begin

                    with grid_clientesCotacao do
                    begin

                      DataSource:=  DM_Pesq.dsPesqClientesCotacao;
                      Columns.Clear;

                      Columns.Add;
                      Columns[0].FieldName       := 'CLI_NOME';
                      Columns[0].Width           := 543;
                      Columns[0].Alignment       := taLeftJustify;

                    end;

                end;

            end;

end;


procedure T_frmEscolhaClienteParaCotacao.edt_NomeClienteChange(
  Sender: TObject);
begin

    PesquisaPeloNomeCliente;

end;

procedure T_frmEscolhaClienteParaCotacao.edt_NomeClienteKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin


         if key=13 then begin

                _frmCotacao.txt_NomeClienteCotacao.Caption  :=  DM_Pesq.cdsPesqClientesCotacao.fieldbyname('CLI_NOME').AsString;
                _frmCotacao.txt_IDCLIENTE.Text              :=  IntToStr(DM_Pesq.cdsPesqClientesCotacao.fieldbyname('CLI_ID').AsInteger);
                _frmCotacao.txt_NomeProdutoCotacao.Enabled  := true;

                close;

         end;

         case Key of

           VK_UP  : DM_Pesq.cdsPesqClientesCotacao.Prior;
           VK_DOWN: DM_Pesq.cdsPesqClientesCotacao.Next;

         end;


end;

procedure T_frmEscolhaClienteParaCotacao.FormShow(Sender: TObject);
begin

  edt_NomeCliente.SetFocus;
  
end;

end.
