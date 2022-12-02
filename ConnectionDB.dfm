object DmConnection: TDmConnection
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Connection: TFDConnection
    Params.Strings = (
      'Database=CHECKOUT'
      'User_Name=admin'
      'Password=masterkey'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Transaction = FDTransaction1
    Left = 88
    Top = 88
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'lib\libmysql.dll'
    Left = 96
    Top = 32
  end
  object FDTransaction1: TFDTransaction
    Connection = Connection
    Left = 144
    Top = 96
  end
end
