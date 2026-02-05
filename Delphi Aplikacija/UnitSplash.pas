unit UnitSplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation;

type
  TfrmSplash = class(TForm)
    lblDobrodosli: TLabel;
    btnDalje: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnDaljeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.fmx}

uses
  UnitSignIn;  // ← dodato za frmSignIn

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  // Centriranje labele "Dobrodošli" horizontalno
  lblDobrodosli.Position.X := (Self.Width - lblDobrodosli.Width) / 2;
end;

procedure TfrmSplash.btnDaljeClick(Sender: TObject);
begin
  if Assigned(frmSignIn) then
  begin
    frmSignIn.Show;
    Self.Hide;
  end
  else
    ShowMessage('Greška: SignIn forma nije kreirana!');
end;

end.
