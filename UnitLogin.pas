unit UnitLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.Math, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Layouts,
  UnitDataModule, UnitMain, UnitRegister;

type
  TForm2 = class(TForm)
    ScrollBox1: TScrollBox;
    layContent: TLayout;
    lblTitle: TLabel;
    lblUsername: TLabel;
    edtUsername: TEdit;
    lblPassword: TLabel;
    edtPassword: TEdit;
    btnLogin: TButton;
    btnRegister: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
  private
    procedure AdjustLayout;
  public
  end;

var
  frmLogin: TForm2;

implementation

{$R *.fmx}

procedure TForm2.FormCreate(Sender: TObject);
begin
  edtPassword.Password := True;
  AdjustLayout;
end;

procedure TForm2.FormResize(Sender: TObject);
begin
  AdjustLayout;
end;

procedure TForm2.AdjustLayout;
begin
  layContent.Width := Min(420, ClientWidth * 0.9);
  layContent.Position.X := (ClientWidth - layContent.Width) / 2;
  layContent.Position.Y := (ClientHeight - layContent.Height) / 2 - 50;
end;

procedure TForm2.btnRegisterClick(Sender: TObject);
begin
  Application.CreateForm(TForm3, frmRegister);
  frmRegister.ShowModal;
end;

procedure TForm2.btnLoginClick(Sender: TObject);
begin
  if Trim(edtUsername.Text) = '' then
  begin
    ShowMessage('Unesite korisničko ime!');
    edtUsername.SetFocus;
    Exit;
  end;

  if Trim(edtPassword.Text) = '' then
  begin
    ShowMessage('Unesite lozinku!');
    edtPassword.SetFocus;
    Exit;
  end;

  dmPKV.qryUsers.Close;
  dmPKV.qryUsers.SQL.Text := 'SELECT ID, Role FROM Users WHERE Username = :U AND Password = :P';
  dmPKV.qryUsers.ParamByName('U').AsString := edtUsername.Text;
  dmPKV.qryUsers.ParamByName('P').AsString := edtPassword.Text;
  dmPKV.qryUsers.Open;

  if not dmPKV.qryUsers.Eof then
  begin
    dmPKV.CurrentUserID := dmPKV.qryUsers.FieldByName('ID').AsInteger;
    dmPKV.CurrentUserRole := dmPKV.qryUsers.FieldByName('Role').AsString;

    ShowMessage('Dobrodošli, ' + edtUsername.Text + '!');
    Hide;
    Application.CreateForm(TfrmMain, frmMain);
    frmMain.Show;
  end
  else
    ShowMessage('Pogrešno korisničko ime ili lozinka.' + #13#10 +
                'Ako nemate nalog, registrujte se.');
end;

end.
