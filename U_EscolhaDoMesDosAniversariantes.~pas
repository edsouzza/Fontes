unit U_EscolhaDoMesDosAniversariantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  T_frmEscolhaMesParaImprimirAniversariantes = class(TForm)
    pnl_cabecalho: TPanel;
    pnl1: TPanel;
    pnl_rodape: TPanel;
    lstMesesDoAno: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure lstMesesDoAnoClick(Sender: TObject);
    procedure PesquisarPeriodosDeAniversariantes;
    procedure pnl_rodapeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MesEscolhido, nomeDoMes : string;
  end;

var
  _frmEscolhaMesParaImprimirAniversariantes: T_frmEscolhaMesParaImprimirAniversariantes;

implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelAniversariantes;

{$R *.dfm}

procedure T_frmEscolhaMesParaImprimirAniversariantes.FormCreate(Sender: TObject);
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

procedure T_frmEscolhaMesParaImprimirAniversariantes.lstMesesDoAnoClick(
  Sender: TObject);
begin

     case lstMesesDoAno.ItemIndex of

            0: MesEscolhido := '1';  //JANEIRO
            1: MesEscolhido := '2';  //FEVEREIRO
            2: MesEscolhido := '3';  //MARÇO
            3: MesEscolhido := '4';  //ABRIL
            4: MesEscolhido := '5';  //MAIO
            5: MesEscolhido := '6';  //JUNHO
            6: MesEscolhido := '7';  //JULHO
            7: MesEscolhido := '8';  //AGOSTO
            8: MesEscolhido := '9';  //SETEMBRO
            9: MesEscolhido := '10'; //OUTUBRO
           10: MesEscolhido := '11'; //NOVEMBRO
           11: MesEscolhido := '12'; //DEZEMBRO

        end;

        case lstMesesDoAno.ItemIndex of

            0: nomeDoMes := 'JANEIRO';
            1: nomeDoMes := 'FEVEREIRO';
            2: nomeDoMes := 'MARÇO';
            3: nomeDoMes := 'ABRIL';
            4: nomeDoMes := 'MAIO';
            5: nomeDoMes := 'JUNHO';
            6: nomeDoMes := 'JULHO';
            7: nomeDoMes := 'AGOSTO';
            8: nomeDoMes := 'SETEMBRO';
            9: nomeDoMes := 'OUTUBRO';
           10: nomeDoMes := 'NOVEMBRO';
           11: nomeDoMes := 'DEZEMBRO';

        end;

        PesquisarPeriodosDeAniversariantes;
        
end;

procedure T_frmEscolhaMesParaImprimirAniversariantes.PesquisarPeriodosDeAniversariantes;
begin

       //SELECIONA TODOS OS ANIVERSARIANTES DO MES ESCOLHIDO E COLOCA EM ORDEM DECRESCENTE DO DIA
       
       _Sql := 'SELECT cli_id, cli_nome, cli_apelido, cli_endereco, cli_datanascto, cli_complemento, '+
         'cli_cep, cli_fone, cli_email, cli_datacad, cli_status, cli_historico, '+
         'EXTRACT(DAY FROM cli_datanascto) as vDia, '+
         'EXTRACT(MONTH FROM cli_datanascto) as vMes FROM clientes '+
         'WHERE EXTRACT(MONTH FROM cli_datanascto) = :pMes ORDER BY EXTRACT(DAY FROM cli_datanascto), '+
         'EXTRACT(MONTH FROM cli_datanascto)';

         with Q_RelAniversariantes.cds_RelAniversariantes do begin

            Close;
            CommandText:= (_Sql);
            Params.ParamByName('pMes').AsString := MesEscolhido;
            Open;


              if not Q_RelAniversariantes.cds_RelAniversariantes.IsEmpty then begin

                   Q_RelAniversariantes.cds_RelAniversariantes.Active := true;
                   Q_RelAniversariantes.lblnomeDoMes.Caption          := nomeDoMes;
                   Q_RelAniversariantes.Preview;

              end
              else begin

                  Application.MessageBox('No momento não existem clientes cadastrados com aniversário neste mês!',
            'Atenção', MB_OK + MB_ICONWARNING);

              end;

         end;

end;

procedure T_frmEscolhaMesParaImprimirAniversariantes.pnl_rodapeClick(
  Sender: TObject);
begin

     close;
     Release;

end;

end.
