unit Billiards.DataModule;

interface

uses
  SysUtils, Classes, IBDatabase, IBCustomDataSet, IBQuery, DB, IBSQL;

type
  TBilliardDataModule = class(TDataModule)
    BilliardDB: TIBDatabase;
    BilliardDBTransaction: TIBTransaction;
    sqlCommand: TIBSQL;
    sqlQuery: TIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BilliardDataModule: TBilliardDataModule;

implementation

{ %CLASSGROUP 'System.Classes.TPersistent' }

{$R *.dfm}

end.
