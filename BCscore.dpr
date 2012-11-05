program BCscore;

uses
  Forms,
  BCscore.Main in 'BCscore.Main.pas' {MainForm},
  Billiards.DataModule in 'Billiards.DataModule.pas' {BilliardDataModule: TDataModule},
  Billiards.Game in 'Billiards.Game.pas',
  Billiards.GameDay in 'Billiards.GameDay.pas',
  Billiards.GameType in 'Billiards.GameType.pas',
  Billiards.Member in 'Billiards.Member.pas',
  Billiards.Period in 'Billiards.Period.pas',
  BCscore.Score in 'BCscore.Score.pas' {ScoreForm},
  BCscore.MemberSelection in 'BCscore.MemberSelection.pas' {MemberSelectionForm},
  BCscore.Consts in 'BCscore.Consts.pas',
  BCscore.AskForm in 'BCscore.AskForm.pas' {AskForm},
  BCscore.ReadMember in 'BCscore.ReadMember.pas' {ReadMemberForm},
  eidlib35 in 'eidlib35.pas',
  BCscore.AskHandicaps in 'BCscore.AskHandicaps.pas' {AskHandicapsForm},
  BCscore.RunningText in 'BCscore.RunningText.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'BCscore';
  Application.CreateForm(TBilliardDataModule, BilliardDataModule);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAskHandicapsForm, AskHandicapsForm);
  Application.Run;
end.
