unit UnitRegister;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Objects,
  FMX.Layouts;

type
  TfrmRegister = class(TForm)
    S: TRectangle;
    lblTitle: TLabel;
    lblSubtitle: TLabel;
    edtFullName: TEdit;
    edtEmail: TEdit;
    edtPassword: TEdit;
    btnShowPassword: TSpeedButton;
    btnRegister: TButton;
    btnBack: TButton;

    procedure FormCreate(Sender: TObject);
    procedure btnShowPasswordClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
  private
    function IsValidEmail(const Email: string): Boolean;
  public
    { Public declarations }
  end;

var
  frmRegister: TfrmRegister;

implementation

{$R *.fmx}

uses
  UnitLogin;

procedure TfrmRegister.FormCreate(Sender: TObject);
begin
  edtFullName.Text := '';
  edtEmail.Text    := '';
  edtPassword.Text := '';
  btnShowPassword.Text := '👁';
  edtFullName.SetFocus;
end;

procedure TfrmRegister.btnShowPasswordClick(Sender: TObject);
begin
  edtPassword.Password := not edtPassword.Password;

  if edtPassword.Password then
    btnShowPassword.Text := '👁'
  else
    btnShowPassword.Text := '🙈';
end;

function TfrmRegister.IsValidEmail(const Email: string): Boolean;
begin
  Result := (Pos('@', Email) > 1) and (Pos('.', Email, Pos('@', Email)) > Pos('@', Email) + 1);
end;

procedure TfrmRegister.btnRegisterClick(Sender: TObject);
begin

  if edtFullName.Text.Trim.IsEmpty then
  begin
    ShowMessage('Unesite ime i prezime!');
    edtFullName.SetFocus;
    Exit;
  end;

  if edtEmail.Text.Trim.IsEmpty then
  begin
    ShowMessage('Unesite email adresu!');
    edtEmail.SetFocus;
    Exit;
  end;

  if not IsValidEmail(edtEmail.Text) then
  begin
    ShowMessage('Email nije validan (mora sadržati @ i .)!');
    edtEmail.SetFocus;
    Exit;
  end;

  if edtPassword.Text.Trim.IsEmpty then
  begin
    ShowMessage('Unesite lozinku!');
    edtPassword.SetFocus;
    Exit;
  end;

  if Length(edtPassword.Text) < 6 then
  begin
    ShowMessage('Lozinka mora imati najmanje 6 karaktera!');
    edtPassword.SetFocus;
    Exit;
  end;


  ShowMessage('Nalog je uspešno kreiran!');

  edtFullName.Text  := '';
  edtEmail.Text     := '';
  edtPassword.Text  := '';

  if Assigned(frmLogin) then
  begin
    frmLogin.Show;
    Self.Hide;
  end
  else
    ShowMessage('Greška: forma za prijavu (frmLogin) nije kreirana!');
end;

procedure TfrmRegister.btnBackClick(Sender: TObject);
begin

  if Assigned(frmLogin) then
  begin
    frmLogin.Show;
    Self.Hide;
  end
  else
    ShowMessage('Greška: forma za prijavu (frmLogin) nije kreirana!');
end;

end.
