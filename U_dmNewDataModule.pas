unit U_dmNewDataModule;

interface

uses
   SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr;

type
  TDM_NEW = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_NEW: TDM_NEW;

implementation

uses U_dmDados;

{$R *.dfm}

end.
