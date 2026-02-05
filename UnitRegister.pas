unit UnitRegister;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Objects,
  FMX.Layouts;

type
  TfrmRegister = class(TForm)
    recOverlay: TRectangle;
    lblTitle: TLabel;
    lblSubtitle: TLabel;
    edtFullName: TEdit;
    edtEmail: TEdit;
    edtPassword: TEdit;
    btnShowPassword: TSpeedButton;
    btnRegister: TButton;
    btnNazad: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnShowPasswordClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnNazadClick(Sender: TObject);
  private
    { Private declarations }
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
  edtPassword.Password := True;
end;

procedure TfrmRegister.btnShowPasswordClick(Sender: TObject);
begin
  edtPassword.Password := not edtPassword.Password;
end;

procedure TfrmRegister.btnRegisterClick(Sender: TObject);
begin
  if Trim(edtFullName.Text) = '' then
  begin
    ShowMessage('Unesite ime i prezime!');
    edtFullName.SetFocus;
    Exit;
  end;
  if Trim(edtEmail.Text) = '' then
  begin
    ShowMessage('Unesite email!');
    edtEmail.SetFocus;
    Exit;
  end;
  if Trim(edtPassword.Text) = '' then
  begin
    ShowMessage('Unesite lozinku!');
    edtPassword.SetFocus;
    Exit;
  end;
  if Length(edtPassword.Text) > 8 then
  begin
    ShowMessage('Lozinka može imati najviše 8 znakova!');
    edtPassword.SetFocus;
    Exit;
  end;
  ShowMessage('Uspešno ste kreirali nalog! Sada se prijavite.');
  edtFullName.Text := '';
  edtEmail.Text := '';
  edtPassword.Text := '';
  if Assigned(frmLogin) then
  begin
    frmLogin.Show;
    Self.Hide;
  end
  else
    ShowMessage('Greška: Login forma nije kreirana!');
end;

procedure TfrmRegister.btnNazadClick(Sender: TObject);
begin
  if Assigned(frmLogin) then
  begin
    frmLogin.Show;
    Self.Hide;
  end
  else
    ShowMessage('Greška: Login forma nije kreirana!');
end;

end.
