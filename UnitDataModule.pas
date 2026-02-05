unit UnitDataModule;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils,
  FMX.Forms, FMX.Dialogs,
  Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.SQLiteWrapper.Stat;

type
  TdmPKV = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    qryUsers: TFDQuery;
    qryProizvodi: TFDQuery;
    qryPorudzbine: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure KreirajBazuAkoNePostoji;
    procedure KreirajTabele;
  public
    CurrentUserID: Integer;
    CurrentUserRole: string;
    function PrijavaKorisnika(const Email, Lozinka: string): Boolean;
    procedure Odjava;
  end;

var
  dmPKV: TdmPKV;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

const
  BAZA_IME = 'PKV.db';

procedure TdmPKV.DataModuleCreate(Sender: TObject);
var
  DBPath: string;
begin
  DBPath := TPath.Combine(TPath.GetDocumentsPath, BAZA_IME);

  FDConnection.Params.Clear;
  FDConnection.Params.DriverID := 'SQLite';
  FDConnection.Params.Values['Database'] := DBPath;
  FDConnection.Params.Values['LockingMode'] := 'Normal';
  FDConnection.Params.Values['OpenMode'] := 'ReadWrite';
  FDConnection.Params.Values['Create'] := 'True';

  try
    FDConnection.Connected := True;
    KreirajBazuAkoNePostoji;
    KreirajTabele;
  except
    on E: Exception do
    begin
      ShowMessage('Greška pri konekciji na bazu:'#13#10 + E.Message);
      Application.Terminate;
    end;
  end;
end;

procedure TdmPKV.KreirajBazuAkoNePostoji;
begin
end;

procedure TdmPKV.KreirajTabele;
begin

  FDConnection.ExecSQL(
    'CREATE TABLE IF NOT EXISTS Korisnici (' +
    '  ID        INTEGER PRIMARY KEY AUTOINCREMENT,' +
    '  ImePrezime TEXT NOT NULL,' +
    '  Email     TEXT UNIQUE NOT NULL,' +
    '  Lozinka   TEXT NOT NULL,' +
    '  Uloga     TEXT DEFAULT "Kupac"' +
    ');');

  FDConnection.ExecSQL(
    'CREATE TABLE IF NOT EXISTS Proizvodi (' +
    '  ID          INTEGER PRIMARY KEY AUTOINCREMENT,' +
    '  Naziv       TEXT NOT NULL,' +
    '  Cena        REAL NOT NULL,' +
    '  Kolicina    INTEGER DEFAULT 0,' +
    '  Kategorija  TEXT,' +
    '  SlikaPath   TEXT' +
    ');');

  FDConnection.ExecSQL(
    'CREATE TABLE IF NOT EXISTS Porudzbine (' +
    '  ID          INTEGER PRIMARY KEY AUTOINCREMENT,' +
    '  KorisnikID  INTEGER NOT NULL,' +
    '  Datum       DATETIME DEFAULT CURRENT_TIMESTAMP,' +
    '  Status      TEXT DEFAULT "Nova",' +
    '  Ukupno      REAL NOT NULL,' +
    '  FOREIGN KEY(KorisnikID) REFERENCES Korisnici(ID)' +
    ');');
end;

function TdmPKV.PrijavaKorisnika(const Email, Lozinka: string): Boolean;
begin
  Result := False;

  qryUsers.Close;
  qryUsers.SQL.Text := 'SELECT ID, Uloga FROM Korisnici ' +
                       'WHERE Email = :Email AND Lozinka = :Lozinka';
  qryUsers.ParamByName('Email').AsString := Email;
  qryUsers.ParamByName('Lozinka').AsString := Lozinka;
  qryUsers.Open;

  if not qryUsers.IsEmpty then
  begin
    CurrentUserID := qryUsers.FieldByName('ID').AsInteger;
    CurrentUserRole := qryUsers.FieldByName('Uloga').AsString;
    Result := True;
  end;
end;

procedure TdmPKV.Odjava;
begin
  CurrentUserID := 0;
  CurrentUserRole := '';
end;

end.
