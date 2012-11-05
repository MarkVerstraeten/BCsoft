unit Billiards.GameDay;

interface

uses
  Billiards.GameType,
  Billiards.Period,
  Billiards.Member;

type
  TBilliardGameDay = class
  private
    fGameType: TBilliardGameType;
    fPeriod: TBilliardPeriod;
  public
    constructor Create; overload;
    constructor Create(ADate: TDate); overload;

    function ToString: string; override;

    property GameType: TBilliardGameType read fGameType write fGameType;
    property Period: TBilliardPeriod read fPeriod write fPeriod;
  end;

var
  BilliardGameDay: TBilliardGameDay;

implementation

uses
  SysUtils;

{ TBilliardGameDay }

constructor TBilliardGameDay.Create;
begin
  Create(Now);
end;

constructor TBilliardGameDay.Create(ADate: TDate);
begin
  inherited Create;
  fGameType := TBilliardGameType.Create(ADate);
  fPeriod := TBilliardPeriod.Create(ADate);
end;

function TBilliardGameDay.ToString: string;
begin
  Result := '"GameDay": { ';
  Result := Result + #13#10 + fGameType.ToString;
  Result := Result + #13#10 + fPeriod.ToString;
  Result := Result + #13#10'}';
end;

initialization

finalization

if Assigned(BilliardGameDay) then
  FreeAndNil(BilliardGameDay);

end.
