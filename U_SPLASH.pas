unit U_SPLASH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, RxGIF, jpeg, ComCtrls;

type
  TF_SPLASH = class(TForm)
    Imagem: TImage;
    ProgressBar: TProgressBar;
    Timer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  F_SPLASH: TF_SPLASH;

implementation

uses U_Login, U_BiblioSysSalao;

{$R *.dfm}

{ TF_SPLASH }



procedure TF_SPLASH.FormCreate(Sender: TObject);
begin
  Timer.Enabled        := true;
  ProgressBar.Position := 0;
end;

procedure TF_SPLASH.TimerTimer(Sender: TObject);
begin
   if not (logado)then
   begin
       ProgressBar.Position  := ProgressBar.Position + 35;

       if(ProgressBar.Position >= 100)then
       begin

           self.Release;

           Application.CreateForm(T_frmLogin,  _frmLogin);
           _frmLogin.ShowModal;
           FreeAndNil(_frmLogin);

       end;
   end else begin

       ProgressBar.Position  := ProgressBar.Position + 35;
       
       if(ProgressBar.Position >= 100)then
       begin

            Application.Terminate;

       end;
   end;
   
end;

end.
