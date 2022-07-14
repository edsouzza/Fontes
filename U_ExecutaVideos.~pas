unit U_ExecutaVideos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, WMPLib_TLB, ExtCtrls, ComCtrls, StdCtrls, MPlayer,
  SHDocVw;

type
  T_frmVideos = class(TForm)
    BROWSER: TWebBrowser;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmVideos: T_frmVideos;

implementation

uses U_ESCOLHAPARAVIDEO;     


{$R *.dfm}

procedure T_frmVideos.FormCreate(Sender: TObject);
begin

      BROWSER.Navigate(pathVideo);
      self.Caption:= nomeTela;     

end;

end.
