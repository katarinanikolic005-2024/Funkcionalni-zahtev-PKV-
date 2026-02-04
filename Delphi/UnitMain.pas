unit UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.Objects;

type
  TfrmMain = class(TForm)
    Rectangle1: TRectangle;
    vsMain: TVertScrollBox;
    layHeader: TLayout;
    imgLogo: TImage;
    lblLocation: TLabel;
    edtSearch: TEdit;
    imgBanner: TImage;
    recBanner: TRectangle;
    lblEkskluzivna: TLabel;
    hsEkskluzivna: THorzScrollBox;
    recCokoTorta: TRectangle;
    recMakaronsi: TRectangle;
    recTiramisu: TRectangle;
    imgCokoTorta: TImage;
    lblCokoTorta: TLabel;
    lblGrCokoTorta: TLabel;
    lblCenaCokoTorta: TLabel;
    imgMakaronsi: TImage;
    lblMakaronsi: TLabel;
    lblKomMakaronsi: TLabel;
    lblCenaMakaronsi: TLabel;
    imgTiramisu: TImage;
    lblTiramisu: TLabel;
    lblGrTiramisu: TLabel;
    lblCenaTiramisu: TLabel;
    lblPopularno: TLabel;
    hsPopularno: THorzScrollBox;
    recVanilice: TRectangle;
    imgVanilice: TImage;
    lblVanilice: TLabel;
    lblKomVanalice: TLabel;
    lblCenaVanilice: TLabel;
    recBajadera: TRectangle;
    imgBajadera: TImage;
    lblBajadera: TLabel;
    lblKomBajadera: TLabel;
    lblCenaBajadera: TLabel;
    recBaklave: TRectangle;
    imgBaklave: TImage;
    lblBaklave: TLabel;
    lblKomBaklave: TLabel;
    lblCenaBaklave: TLabel;
    layBottom: TLayout;
    sbtnProizvodi: TSpeedButton;
    sbtnKorpa: TSpeedButton;
    sbtnOmiljeno: TSpeedButton;
    sbtnProfil: TSpeedButton;
    sbtnPocetna: TSpeedButton;

    procedure FormCreate(Sender: TObject);
    procedure sbtnPocetnaClick(Sender: TObject);
    procedure sbtnProizvodiClick(Sender: TObject);
    procedure sbtnKorpaClick(Sender: TObject);
    procedure sbtnOmiljenoClick(Sender: TObject);
    procedure sbtnProfilClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.FormCreate(Sender: TObject);
begin

  lblLocation.Text := 'Kragujevac, Srbija';
  lblEkskluzivna.Text := 'Ekskluzivna ponuda';
  lblPopularno.Text := 'Popularno';


  recBanner.Fill.Color := $00FFE4EC;
  recBanner.XRadius := 16;
  recBanner.YRadius := 16;
end;

procedure TfrmMain.sbtnPocetnaClick(Sender: TObject);
begin

  ShowMessage('Već ste na početnoj stranici');
end;

procedure TfrmMain.sbtnProizvodiClick(Sender: TObject);
begin
  ShowMessage('Otvara se lista svih proizvoda');

end;

procedure TfrmMain.sbtnKorpaClick(Sender: TObject);
begin
  ShowMessage('Otvara se korpa');

end;

procedure TfrmMain.sbtnOmiljenoClick(Sender: TObject);
begin
  ShowMessage('Otvara se lista omiljenih proizvoda');

end;

procedure TfrmMain.sbtnProfilClick(Sender: TObject);
begin
  ShowMessage('Otvara se profil korisnika');

end;

end.
