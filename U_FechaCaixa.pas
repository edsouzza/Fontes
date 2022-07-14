unit U_FechaCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, Encryp, DBCtrls,
  Menus, IniFiles, ToolEdit, CurrEdit;

type
  T_frmFechaCaixa = class(TForm)
    pnl_cabecalho: TPanel;
    pnl_rodape: TPanel;
    btn_Sair: TSpeedButton;
    pnl_DadosUsuario: TPanel;
    btn_Gravar: TSpeedButton;
    lblHoraAtual: TLabel;
    lblDataDoDia: TLabel;
    pnl1: TPanel;
    lbl2: TLabel;
    txt_ValorDeFechamento: TStaticText;
    stTotalFechamento: TStaticText;
    procedure btn_SairClick(Sender: TObject);
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure AbrirFecharTabelas;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure AtualizaCaixa;
    procedure GravaFechamentoDoCaixa;
    procedure MostraValorDeFechamento;
    procedure edt_valordeaberturaKeyPress(Sender: TObject; var Key: Char);
    procedure btn_GravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);


  private
    { Private declarations }
    ValorFechamento : double;

  public
    { Public declarations }


  end;

var
  _frmFechaCaixa : T_frmFechaCaixa;
  proxNumCaixa : Integer;

implementation

uses U_BiblioSysSalao, U_dmDadosSegundo, U_principal, U_dmDados,
  U_dmPesquisas, DB, SqlExpr;

{$R *.dfm}


procedure T_frmFechaCaixa.FormCreate(Sender: TObject);
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


procedure T_frmFechaCaixa.AbrirTabelas;
begin

    dm_Conexao.cds_Caixa.Active      := True;
    dm_Conexao.cds_AbreCaixa.Active  := True;

end;


procedure T_frmFechaCaixa.FecharTabelas;
begin

    dm_Conexao.cds_Caixa.Active       := False;
    dm_Conexao.cds_AbreCaixa.Active   := False;

end;


procedure T_frmFechaCaixa.AbrirFecharTabelas;
begin

    dm_Conexao.cds_Caixa.Active   := False;
    dm_Conexao.cds_Caixa.Active   := True;

    dm_Conexao.cds_AbreCaixa.Active   := False;
    dm_Conexao.cds_AbreCaixa.Active  := True;

end;


procedure T_frmFechaCaixa.btn_SairClick(Sender: TObject);
begin

    texto:= 'Confirma o desejo de sair sem fechar o caixa?';

     if Application.MessageBox(PChar(texto),'Sair!',MB_YESNO + MB_ICONQUESTION) = IdYes then
     begin

         close;

     end
     else Exit;

end;


procedure T_frmFechaCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    Release;

end;

procedure T_frmFechaCaixa.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure T_frmFechaCaixa.edt_valordeaberturaKeyPress(Sender: TObject;
  var Key: Char);
begin

    btn_Gravar.Enabled    := True;
    

end;


procedure T_frmFechaCaixa.btn_GravarClick(Sender: TObject);
var
   texto : string;
begin

     texto:= 'Confirma o fechamento do caixa do dia? Se positivo, a transações estarão disponíveis somente no próximo dia!';

     if Application.MessageBox(PChar(texto),'Fechamento do Caixa do Dia!',MB_YESNO + MB_SYSTEMMODAL) = IdYes then
     begin

        GravaFechamentoDoCaixa;
        AbrirFecharTabelas;
        btn_Gravar.Enabled   := False;
        CaixaAberto := false;
        
     end;

end;

procedure T_frmFechaCaixa.AtualizaCaixa;
var
   proxNumIdCaixa : integer;
begin
  
       proxNumIdCaixa     :=0;

       //ATUALIZANDO O HISTORICO DO ULTIMO REGISTRO PARA 'FECHAMENTO DO CAIXA'

        With DM_Pesq.qry_Cod do begin

            Close;
            SQL.Clear;
            SQL.Add('select max(id_caixa) from caixa');
            Open;

            if not IsEmpty then
            begin

                proxNumIdCaixa := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

            end;

                 //ABRINDO UMA NOVA LINHA PARA O FECHAMENTO
                 with dm_Conexao.cds_Caixa do begin

                    Append;
                    FieldByName('id_caixa').AsInteger        := proxNumIdCaixa;
                    FieldByName('saldo_anterior').AsFloat    := ValorFechamento;
                    FieldByName('saldo_atual').AsFloat       := ValorFechamento;
                    FieldByName('data').AsDateTime           := date;
                    FieldByName('historico').AsString        := 'FECHAMENTO DO CAIXA';
                    FieldByName('status').AsString           := 'F';

                    ApplyUpdates(0);

                 end;


            end;


             // ATUALIZANDO O STATUS DO CAIXA APOS O FECHAMENTO

            with DM_Pesq.Qry_Geral do
            begin

                  close;
                  sql.Clear;
                  sql.Add('UPDATE caixa SET status = :pStatus WHERE status = '+QuotedStr('A')+'');
                  Params.ParamByName('pStatus').AsString    := 'F';
                  ExecSQL();

             end;


             Application.MessageBox('Ok, o caixa do dia foi fechado com Sucesso!',
             'Fechamento do Caixa do Dia', MB_OK + MB_ICONWARNING);
             AbrirFecharTabelas;

             close;


end;


procedure T_frmFechaCaixa.GravaFechamentoDoCaixa;
begin


          dm_Conexao.cds_FechaCaixa.Active := true;

          // GRAVANDO O FECHAMENTO DO CAIXA

           With DM_Pesq.qry_Cod do begin

              Close;
              SQL.Clear;
              SQL.Add('select max(id_fechacaixa) from fechacaixa');
              Open;

              if not IsEmpty then begin

                 proxNumCaixa := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;


            with  dm_Conexao.cds_FechaCaixa do begin

                Append;

                FieldByName('id_fechacaixa').AsInteger    := proxNumCaixa;
                FieldByName('saldo_fechamento').AsFloat   := ValorFechamento;
                FieldByName('data_fechamento').AsDateTime := date;
                FieldByName('hora_fechamento').AsString   := TimeToStr(time);
                FieldByName('id_funcionario').AsInteger   := 1;

                ApplyUpdates(0);

            end;

            AtualizaCaixa;
            AbrirFecharTabelas;

end;

procedure T_frmFechaCaixa.MostraValorDeFechamento;
begin

       _Sql := 'select id_caixa, saldo_atual as ValorDoFechamento from caixa WHERE '+
               'id_caixa = (select max(id_caixa) from caixa)';


       With DM_Pesq.Qry_Geral do
       begin

          Close;
          SQL.Clear;
          SQL.Add(_Sql);
          Open;

              if not IsEmpty then begin

                   ValorFechamento               := DM_Pesq.Qry_Geral.Fields[1].Value;
                   txt_ValorDeFechamento.Caption := FloatToStr( ValorFechamento );
                   stTotalFechamento.Caption     := FormatFloat('##,##0.00',ValorFechamento);

              end;

       end;

end;

procedure T_frmFechaCaixa.FormShow(Sender: TObject);
begin

    MostraValorDeFechamento;

end;


end.
