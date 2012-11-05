unit BilliardsPeriod;

{$MODE Delphi}

interface

type
  TBilliardPeriod = class
  private
    fID: integer;
    fPeriodUntil: string;
    fPeriodFrom: string;
  public
    constructor Create; overload;
    constructor Create(ADate: TDate); overload;

    function ToString: string; override;

    property ID: integer read fID write fID;
    property PeriodFrom: string read fPeriodFrom write fPeriodFrom;
    property PeriodUntil: string read fPeriodUntil write fPeriodUntil;
  end;

implementation

uses
  SysUtils,
  Classes,
  DB,
  {IBDatabase,
  IBQuery,
  IBCustomDataSet,}
  BilliardsDataModule;

{ TBilliardPeriod }

constructor TBilliardPeriod.Create;
begin
  Create(Now);
end;

constructor TBilliardPeriod.Create(ADate: TDate);
var
  SL: TStringList;
begin
  inherited Create;
  if not BilliardDataModule.BilliardDB.Connected then
    BilliardDataModule.BilliardDB.Open;
  SL := TStringList.Create;
  try
    SL.Add('select ID,');
    SL.Add(' PERIODFROM,');
    SL.Add(' PERIODUNTIL');
    SL.Add(' from PERIODS');
    SL.Add(' where CURRENT_DATE between PERIODFROM and PERIODUNTIL');
    BilliardDataModule.sqlQuery.SQL.Assign(SL);
  finally
    SL.Free;
  end;
  BilliardDataModule.sqlQuery.Open;
  if BilliardDataModule.sqlQuery.RecordCount = 1 then
  begin
    BilliardDataModule.sqlQuery.First;
    fID := BilliardDataModule.sqlQuery.FieldByName('id').AsInteger;
    fPeriodFrom := BilliardDataModule.sqlQuery.FieldByName('periodfrom').AsString;
    fPeriodUntil := BilliardDataModule.sqlQuery.FieldByName('perioduntil').AsString;
  end;
  BilliardDataModule.sqlQuery.Close;
end;

function TBilliardPeriod.ToString: string;
begin
  Result := '"Period": { ';
  Result := Result + Format(#13#10'"ID": "%d", ', [fID]);
  Result := Result + Format(#13#10'"From": "%s", ', [fPeriodFrom]);
  Result := Result + Format(#13#10'"Until": "%s" }', [fPeriodUntil]);
  Result := Result + #13#10'}';
end;

end.
