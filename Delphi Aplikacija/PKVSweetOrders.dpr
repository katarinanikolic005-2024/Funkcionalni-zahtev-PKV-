program PKVSweetOrders;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitSplash in 'UnitSplash.pas' {frmSplash},
  UnitSignIn in 'UnitSignIn.pas' {frmSignIn},
  UnitLogin in 'UnitLogin.pas' {frmLogin},
  UnitMain in 'UnitMain.pas' {frmMain},
  UnitDataModule in 'UnitDataModule.pas' {dmPKV: TDataModule},
  UnitRegister in 'UnitRegister.pas' {frmRegister};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.CreateForm(TfrmSignIn, frmSignIn);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmPKV, dmPKV);
  Application.CreateForm(TfrmRegister, frmRegister);
  Application.Run;
end.
