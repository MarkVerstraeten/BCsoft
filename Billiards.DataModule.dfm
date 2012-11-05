object BilliardDataModule: TBilliardDataModule
  OldCreateOrder = False
  Height = 455
  Width = 795
  object BilliardDB: TIBDatabase
    Connected = True
    DatabaseName = 'C:\BILJARTCLUB.IB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    Left = 88
    Top = 56
  end
  object BilliardDBTransaction: TIBTransaction
    DefaultDatabase = BilliardDB
    Left = 88
    Top = 112
  end
  object sqlCommand: TIBSQL
    Database = BilliardDB
    Transaction = BilliardDBTransaction
    Left = 200
    Top = 112
  end
  object sqlQuery: TIBQuery
    Database = BilliardDB
    Transaction = BilliardDBTransaction
    SQL.Strings = (
      '')
    Left = 200
    Top = 56
  end
end
