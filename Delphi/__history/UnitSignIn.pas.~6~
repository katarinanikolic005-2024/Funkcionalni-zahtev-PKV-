unit UnitSignIn;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  UnitLogin;

type
  TfrmSignIn = class(TForm)
    recOverlay: TRectangle;
    btnPrijaviSe: TButton;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure btnPrijaviSeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignIn: TfrmSignIn;

implementation

{$R *.fmx}

procedure TfrmSignIn.btnPrijaviSeClick(Sender: TObject);
begin
  if Assigned(frmLogin) then
  begin
    frmLogin.Show;
    Self.Hide;
  end
  else
  begin
    ShowMessage('Forma za prijavu (frmLogin) nije kreirana!');
  end;
end;

procedure TfrmSignIn.Button1Click(Sender: TObject);
begin

  ShowMessage('Nastavak putem Google naloga... (još nije implementirano)');
end;

procedure TfrmSignIn.Button2Click(Sender: TObject);
begin

  ShowMessage('Nastavak putem Facebook naloga... (još nije implementirano)');
end;

end.
