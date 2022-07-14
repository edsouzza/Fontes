unit U_Etiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, DB, DBTables, ExtCtrls, StdCtrls, Grids,
  DBGrids, CJVQRBarCode, DBClient, CJVQrDbBarCode, Provider, FMTBcd,
  DBXpress, SqlExpr, Buttons;

type
  T_frmGerarCodBarras = class(TForm)
    GroupBox3: TGroupBox;
    GroupBox2: TGroupBox;
    btnGerarEtiquetas: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    txtQde: TEdit;
    txtCodBarras: TEdit;
    procedure InserirRegistrosNaTabela;
    procedure LimparTabela;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnGerarEtiquetasClick(Sender: TObject);
    procedure txtQdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);


  private
    { Private declarations }
    qde, proxNum : integer;

  public
    { Public declarations }
  end;

var
  _frmGerarCodBarras: T_frmGerarCodBarras;

implementation

uses Q_RelImprimeEtiquetas, U_dmDadosSegundo, U_dmPesquisas,
  U_RelEtiquetas, U_dmDados, U_BiblioSysSalao;

{$R *.dfm}


procedure T_frmGerarCodBarras.FormCreate(Sender: TObject);
//DESABILITA O BOTAO FECHAR DO FORMULÁRIO
var
  hwndHandle  : THANDLE;
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

    proxNum  := 0;

end;


procedure T_frmGerarCodBarras.LimparTabela;
begin

        With DM_Pesq.qry_Cod do begin

           close;
           sql.Clear;
           sql.Add('DELETE FROM codbarras');
           ExecSQL();

        end;

        dm_DadosSegundo.cds_CodBarra.Active := false;
        dm_DadosSegundo.cds_CodBarra.Active := true;

end;

procedure T_frmGerarCodBarras.FormShow(Sender: TObject);
begin

    txtCodBarras.SetFocus;
    
end;



procedure T_frmGerarCodBarras.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure T_frmGerarCodBarras.btnGerarEtiquetasClick(Sender: TObject);
begin

      if (txtCodBarras.Text = '') then
      begin

        Application.MessageBox('Digite o código para gerar a etiqueta!', 'Valor Inválido!', MB_OK);
        txtCodBarras.SetFocus;

      end
      else begin

              if (txtQde.Text = '') then
              begin

                Application.MessageBox('Digite a quantidade desejada de etiquetas!', 'Valor Inválido!', MB_OK);
                txtQde.SetFocus;

              end
              else begin

                    InserirRegistrosNaTabela;

              end;

      end;               

end;


procedure T_frmGerarCodBarras.InserirRegistrosNaTabela;
var
   codigo : string;
   i      : integer;
begin

      LimparTabela;

      dm_DadosSegundo.cds_CodBarra.Active := true;

      //INSERIR A QUANTIDADE DE REGISTROS DESEJADA NA TABELA COM 9 ZEROS ANTES DO NUMERO   
      txtCodBarras.text := StringOfChar('0',12-Length(txtCodBarras.text)) + txtCodBarras.text;
      codigo            := txtCodBarras.Text;
      qde               := StrToInt(txtQde.text);


      //COM A QDE DE ETIQUETAS A SEREM IMPRESSAS GRAVAR O CODIGO DIGITADO NO BANCO DE DADOS
      for i := 1 to qde do
      begin

          With DM_Pesq.qry_Cod do
          begin

              Close;
              SQL.Clear;
              SQL.Add('select max(idcodbarra) from codbarras');
              Open;

              if not IsEmpty then begin

                 proxNum := DM_Pesq.qry_Cod.Fields[0].AsInteger + 1;

              end;

           end;


          with dm_DadosSegundo.cds_CodBarra do
          begin

             Append;

             FieldByName('idcodbarra').AsInteger           := proxNum;
             FieldByname('codbarra').AsString              := codigo;

            ApplyUpdates(0);

           end;

     end;

       LogOperacoes(NomeDoUsuarioLogado, 'geração de etiquetas');
       Q_ImprimeEtiquetas.Preview;

       txtCodBarras.Clear;
       txtQde.Clear;
       txtCodBarras.SetFocus;
       LimparTabela;

end;


procedure T_frmGerarCodBarras.txtQdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = 13 then
  begin

    btnGerarEtiquetasClick(Self);

  end;

end;

procedure T_frmGerarCodBarras.btnSairClick(Sender: TObject);
begin

  close;
  
end;        

end.

