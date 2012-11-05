unit BilliardsGame;

interface

uses
  BilliardsGameDay,
  BilliardsGameType,
  BilliardsPeriod,
  BilliardsMember;

type
  TBilliardGame = class
  private
    fGameDay: TBilliardGameDay;
    fMember1: TBilliardMember;
    fMember2: TBilliardMember;
    fTurns: integer;
    fScore2: integer;
    fScore1: integer;
    fHighScore2: integer;
    fHighScore1: integer;
  public
    constructor Create(aGameDay: TBilliardGameDay; aMember1, aMember2: TBilliardMember);
    destructor Destroy; override;

    function ToString: string; override;

    function GetHandicapForMember(aID: integer): integer;
    procedure Store;

    property GameDay: TBilliardGameDay read fGameDay;
    property Member1: TBilliardMember read fMember1 write fMember1;
    property Member2: TBilliardMember read fMember2 write fMember2;
    property Turns: integer read fTurns write fTurns;
    property Score1: integer read fScore1 write fScore1;
    property Score2: integer read fScore2 write fScore2;
    property HighScore1: integer read fHighScore1 write fHighScore1;
    property HighScore2: integer read fHighScore2 write fHighScore2;
  end;

var
  BilliardGame: TBilliardGame;

implementation

uses
  SysUtils,
  Classes,
  DB,
  IBDatabase,
  IBQuery,
  IBCustomDataSet, 
  BilliardsDataModule;

{ TBilliardGame }

constructor TBilliardGame.Create(aGameDay: TBilliardGameDay; aMember1, aMember2: TBilliardMember);
begin
  inherited Create;
  fGameDay := aGameDay;
  fMember1 := aMember1;
  fMember2 := aMember2;
  fTurns := 0;
end;

destructor TBilliardGame.Destroy;
begin
  fMember2 := nil;
  fMember1 := nil;
  fGameDay := nil;
  inherited Destroy;
end;

function TBilliardGame.GetHandicapForMember(aID: integer): integer;
var
  SL: TStringList;
begin
  Result := 0;
  SL := TStringList.Create;
  try
    SL.Add('select HANDICAP');
    SL.Add(' from HANDICAPS');
    SL.Add(' where GAMETYPE_ID = :gametype');
    SL.Add(' and PERIOD_ID = :period');
    SL.Add(' and MEMBER_ID = :member');
    BilliardDataModule.sqlQuery.SQL.Assign(SL);
  finally
    SL.Free;
  end;
  BilliardDataModule.sqlQuery.ParamByName('gametype').AsInteger := BilliardGame.GameDay.GameType.ID;
  BilliardDataModule.sqlQuery.ParamByName('period').AsInteger := BilliardGame.GameDay.Period.ID;
  BilliardDataModule.sqlQuery.ParamByName('member').AsInteger := aID;
  BilliardDataModule.sqlQuery.Open;
  try
    if BilliardDataModule.sqlQuery.RecordCount = 1 then
    begin
      BilliardDataModule.sqlQuery.First;
      Result := BilliardDataModule.sqlQuery.FieldByName('handicap').AsInteger;
    end;
  finally
    BilliardDataModule.sqlQuery.Close;
  end;
end;

procedure TBilliardGame.Store;
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  try


  SL.Add('INSERT into GAMES');
  SL.Add(' (GAMETYPE_ID,');
  SL.Add(' PERIOD_ID,');
  SL.Add(' MEMBER_1_ID,');
  SL.Add(' MEMBER_2_ID,');
  SL.Add(' SCORE_1,');
  SL.Add(' SCORE_2,');
  SL.Add(' TURNS)');
  SL.Add(' values (:gametype,');
  SL.Add(' :period,');
  SL.Add(' :member1,');
  SL.Add(' :member2,');
  SL.Add(': score1,');
  SL.Add(' :score2,');
  SL.Add(' :turns)');
    BilliardDataModule.sqlCommand.SQL.Assign(SL);
  finally
    SL.Free;
  end;
  BilliardDataModule.sqlCommand.ParamByName('gametype').AsInteger := BilliardGame.GameDay.GameType.ID;
  BilliardDataModule.sqlCommand.ParamByName('period').AsInteger := BilliardGame.GameDay.Period.ID;
  BilliardDataModule.sqlCommand.ParamByName('member1').AsInteger := BilliardGame.Member1.ID;
  BilliardDataModule.sqlCommand.ParamByName('member2').AsInteger := BilliardGame.Member2.ID;
  BilliardDataModule.sqlCommand.ParamByName('score1').AsInteger := BilliardGame.Score1;
  BilliardDataModule.sqlCommand.ParamByName('score2').AsInteger := BilliardGame.Score2;
  BilliardDataModule.sqlCommand.ParamByName('turns').AsInteger := BilliardGame.Turns;
  BilliardDataModule.sqlCommand.ExecQuery;
end;

function TBilliardGame.ToString: string;
begin
  Result := '"Game" : { ';
  Result := Result + #13#10 + fGameDay.ToString;
  if Assigned(fMember1) then
    Result := Result + #13#10 + ', ' + fMember1.ToString;
  if Assigned(fMember2) then
    Result := Result + #13#10 + ', ' + fMember2.ToString;
  Result := Result + #13#10'}';
end;

end.
