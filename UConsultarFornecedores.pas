unit UConsultarFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  T_frmConsultarFornecedores = class(TForm)
    grp1: TGroupBox;
    grp2: TGroupBox;
    edt_Nome: TEdit;
    grp3: TGroupBox;
    btnLimpar: TSpeedButton;
    grid_consulta_Fornecedores: TDBGrid;
    btnSair: TSpeedButton;
    lbl1: TLabel;
    lbl9: TLabel;
    lbl2: TLabel;
    lbl28: TLabel;
    lbl5: TLabel;
    lbl4: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl20: TLabel;
    dbedtFORNE_NOME: TDBEdit;
    dbedtFORNE_APELIDO: TDBEdit;
    dbedtFORNE_ENDERECO: TDBEdit;
    dbedtFORNE_ID: TDBEdit;
    dbedtFORNE_COMPLEMENTO: TDBEdit;
    dbedtFORNE_EMAIL: TDBEdit;
    dbedtFORNE_CEP: TDBEdit;
    dbedtFORNE_DATACAD: TDBEdit;
    dbedtFORNE_FONE: TDBEdit;
    procedure PesquisaPorNome;
    procedure btnSairClick(Sender: TObject);
    procedure edt_NomeChange(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmConsultarFornecedores: T_frmConsultarFornecedores;

implementation

uses U_dmDados, U_Fornecedores;

{$R *.dfm}

{ T_frmConsultar }

procedure T_frmConsultarFornecedores.PesquisaPorNome;
var
  nome : string;
begin

      nome := edt_Nome.Text;

      with dm_Conexao.cds_Fornecedor do begin

            Close;
            CommandText:= 'SELECT * FROM fornecedores WHERE forne_nome LIKE (''%'+nome+'%'') ';
            Open;

      end;

end;

procedure T_frmConsultarFornecedores.btnSairClick(Sender: TObject);
begin

    edt_Nome.Text:= '';
    edt_Nome.SetFocus;
    close;

end;

procedure T_frmConsultarFornecedores.edt_NomeChange(Sender: TObject);
begin

  PesquisaPorNome;

end;

procedure T_frmConsultarFornecedores.btnLimparClick(Sender: TObject);
begin

    edt_Nome.Text:= '';
    edt_Nome.SetFocus;
    
end;


end.

