unit UnitDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, System.IOUtils,
  FMX.Dialogs, FireDAC.UI.Intf, FireDAC.FMXUI.Wait;

type
  TdmPKV = class(TDataModule)
    FDConnection: TFDConnection;
    SQLiteDriver: TFDPhysSQLiteDriverLink;
    qryUsers: TFDQuery;
    qryProducts: TFDQuery;
    qryOrders: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CurrentUserID: Integer;
    CurrentUserRole: string;
  end;

var
  dmPKV: TdmPKV;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TdmPKV.DataModuleCreate(Sender: TObject);
var
  DBPath: string;
begin
  DBPath := TPath.Combine(TPath.GetDocumentsPath, 'PKV.db');
  FDConnection.Params.Values['Database'] := DBPath;
  try
    FDConnection.Connected := True;

    FDConnection.ExecSQL(
      'CREATE TABLE IF NOT EXISTS Users (' +
      'ID INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      'Username TEXT UNIQUE NOT NULL, Password TEXT NOT NULL, ' +
      'Role TEXT DEFAULT "Kupac")');

    FDConnection.ExecSQL(
      'CREATE TABLE IF NOT EXISTS Products (' +
      'ID INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      'Naziv TEXT NOT NULL, ' +
      'Vrsta TEXT, ' +
      'Cena REAL NOT NULL, ' +
      'Opis TEXT, ' +
      'SlikaPath TEXT)');

    FDConnection.ExecSQL(
      'CREATE TABLE IF NOT EXISTS Orders (' +
      'ID INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      'UserID INTEGER NOT NULL, ' +
      'Datum DATE NOT NULL, ' +
      'Status TEXT DEFAULT "Nova", ' +
      'UkupnaCena REAL NOT NULL, ' +
      'Napomena TEXT)');
  except
    on E: Exception do
      ShowMessage('Greška baze: ' + E.Message);
  end;
end;

end.
