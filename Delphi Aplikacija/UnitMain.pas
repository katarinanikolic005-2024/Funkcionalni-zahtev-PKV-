unit UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.Objects;

type
  TfrmMain = class(TForm)
    vsMain: TVertScrollBox;
    layHeader: TLayout;
    lblLokacija: TLabel;
    edtSearch: TEdit;
    imgBanner: TImage;
    lblEkskluzivna: TLabel;
    hsEkskluzivna: THorzScrollBox;
    lblPopularno: TLabel;
    layBottom: TLayout;
    sbtnPocetna: TSpeedButton;
    sbtnProizvodi: TSpeedButton;
    sbtnKorpa: TSpeedButton;
    sbtnOmiljeno: TSpeedButton;
    sbtnProfil: TSpeedButton;
    procedure FormCreate(Sender: TObject);
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
  lblLokacija.Text := 'Kragujevac, Srbija';
  lblEkskluzivna.Text := 'Ekskluzivna ponuda';
  lblPopularno.Text := 'Popularno';
end;

end.
