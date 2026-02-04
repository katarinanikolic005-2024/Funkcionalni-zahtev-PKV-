unit UnitSplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, UnitSignIn;

type
  TfrmSplash = class(TForm)
    lblDobrodosli: TLabel;
    btnDalje: TButton;
    recOverlay: TRectangle;
    procedure btnDaljeClick(Sender: TObject);
  private
  public
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.fmx}

procedure TfrmSplash.btnDaljeClick(Sender: TObject);
begin
  Hide;
  Application.CreateForm(TfrmSignIn, frmSignIn);
  frmSignIn.Show;
end;

end.
