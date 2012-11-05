unit Billiards.GameType;

interface

type
  TBilliardGameType = class
  private
    fNotifyLast: integer;
    fMaxTurns: integer;
    fID: integer;
  public
    constructor Create; overload;
    constructor Create(ADate: TDate); overload;

    function ToString: string; override;

    property ID: integer read fID write fID;
    property MaxTurns: integer read fMaxTurns write fMaxTurns;
    property NotifyLast: integer read fNotifyLast write fNotifyLast;
  end;

implementation

uses
  SysUtils,
  Classes,
  IBDatabase,
  IBQuery,
  IBCustomDataSet,
  Billiards.DataModule;

{ TGameType }

constructor TBilliardGameType.Create;
begin
  Create(Now);
end;

constructor TBilliardGameType.Create(ADate: TDate);
var
  SL: TStringList;
begin
  inherited Create;
  if not BilliardDataModule.BilliardDB.Connected then
    BilliardDataModule.BilliardDB.Open;
  SL := TStringList.Create;
  try
    SL.Add('SELECT ID, MAX_TURNS, NOTIFY_LAST');
    SL.Add(' FROM GAMETYPES');
    SL.Add(' WHERE CODE = :code');
    BilliardDataModule.sqlQuery.SQL.Assign(SL);
  finally
    SL.Free;
  end;
  case DayOfWeek(Now) of
    3, 4:
      BilliardDataModule.sqlQuery.ParamByName('code').AsString := 'OB';
    5, 6:
      BilliardDataModule.sqlQuery.ParamByName('code').AsString := 'VS';
    7:
      BilliardDataModule.sqlQuery.ParamByName('code').AsString := '3B';
  end;
  BilliardDataModule.sqlQuery.Open;
  if BilliardDataModule.sqlQuery.RecordCount = 1 then
  begin
    BilliardDataModule.sqlQuery.First;
    fID := BilliardDataModule.sqlQuery.FieldByName('id').AsInteger;
    fMaxTurns := BilliardDataModule.sqlQuery.FieldByName('max_turns').AsInteger;
    fNotifyLast := BilliardDataModule.sqlQuery.FieldByName('notify_last').AsInteger;
  end;
  BilliardDataModule.sqlQuery.Close;
end;

function TBilliardGameType.ToString: string;
begin
  Result := '"GameType": { ';
  Result := Result + Format(#13#10'"ID": "%d", ', [fID]);
  Result := Result + Format(#13#10'"MaxTurns": "%d", ', [fMaxTurns]);
  Result := Result + Format(#13#10'"NotifyLast": "%d"', [fNotifyLast]);
  Result := Result + #13#10'}';
end;

end.
