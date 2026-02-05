unit UnitLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Objects,
  FMX.Layouts, UnitMain, UnitRegister;

type
  TfrmLogin = class(TForm)
    lblTitle: TLabel;
    edtEmail: TEdit;
    edtPassword: TEdit;
    btnShowPassword: TSpeedButton;
    btnLogin: TButton;
    btnCreateAccount: TButton;
    procedure btnShowPasswordClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnCreateAccountClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  edtPassword.Password := True;
  edtPassword.MaxLength := 8;
end;

procedure TfrmLogin.btnShowPasswordClick(Sender: TObject);
begin
  edtPassword.Password := not edtPassword.Password;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  if Trim(edtEmail.Text) = '' then
  begin
    ShowMessage('Trebate da ukucate email!');
    edtEmail.SetFocus;
    Exit;
  end;

  if Trim(edtPassword.Text) = '' then
  begin
    ShowMessage('Trebate da unesete lozinku!');
    edtPassword.SetFocus;
    Exit;
  end;

  ShowMessage('Uspešno prijavljeni!');

  edtEmail.Text := '';
  edtPassword.Text := '';

  if Assigned(frmMain) then
  begin
    frmMain.Show;
    Self.Hide;
  end
  else
    ShowMessage('Greška: glavna forma (frmMain) nije kreirana!');
end;

procedure TfrmLogin.btnCreateAccountClick(Sender: TObject);
begin
  if Assigned(frmRegister) then
  begin
    frmRegister.Show;
    Self.Hide;
  end
  else
    ShowMessage('Greška: forma za registraciju nije kreirana!');
end;

end.
