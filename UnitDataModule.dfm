object dmPKV: TdmPKV
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Left = 480
    Top = 360
  end
  object fdPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 576
    Top = 200
  end
  object qryUsers: TFDQuery
    Connection = FDConnection
    Left = 392
    Top = 496
  end
  object qryProizvodi: TFDQuery
    Connection = FDConnection
    Left = 288
    Top = 360
  end
  object qryPorudzbine: TFDQuery
    Connection = FDConnection
    Left = 712
    Top = 368
  end
end
