unit UnitRegister;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FMX.Forms,
  FMX.StdCtrls, FMX.Edit, FMX.Layouts, FMX.Dialogs,
  UnitDataModule, FMX.Controls.Presentation;

type
  TForm3 = class(TForm)
    layContent: TLayout;
    lblTitle: TLabel;
    lblUsername: TLabel;
    edtUsername: TEdit;
    lblPassword: TLabel;
    edtPassword: TEdit;
    btnRegister: TButton;
    procedure btnRegisterClick(Sender: TObject);
  private
  public
  end;

var
  frmRegister: TForm3;

implementation

{$R *.fmx}

procedure TForm3.btnRegisterClick(Sender: TObject);
begin
  if Trim(edtUsername.Text) = '' then
  begin
    ShowMessage('Unesite korisničko ime!');
    Exit;
  end;

  if Trim(edtPassword.Text) = '' then
  begin
    ShowMessage('Unesite lozinku!');
    Exit;
  end;

  try
    dmPKV.qryUsers.Close;
    dmPKV.qryUsers.SQL.Text := 'INSERT INTO Users (Username, Password) VALUES (:U, :P)';
    dmPKV.qryUsers.ParamByName('U').AsString := edtUsername.Text;
    dmPKV.qryUsers.ParamByName('P').AsString := edtPassword.Text;
    dmPKV.qryUsers.ExecSQL;

    ShowMessage('Nalog uspešno kreiran! Sada se možete ulogovati.');
    Close;
  except
    on E: Exception do
      ShowMessage('Greška prilikom registracije: ' + E.Message + #13#10 +
                  '(Korisničko ime je možda zauzeto)');
  end;
end;

end.
