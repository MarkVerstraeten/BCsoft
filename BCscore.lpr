program BCscore;

{$MODE Delphi}

uses
  Forms, Interfaces,
  BCscoreMain in 'BCscoreMain.pas' {MainForm},
  BilliardsDataModule in 'BilliardsDataModule.pas' {BilliardDataModule: TDataModule},
  BilliardsGame in 'BilliardsGame.pas',
  BilliardsGameDay in 'BilliardsGameDay.pas',
  BilliardsGameType in 'BilliardsGameType.pas',
  BilliardsMember in 'BilliardsMember.pas',
  BilliardsPeriod in 'BilliardsPeriod.pas',
  BCscoreScore in 'BCscoreScore.pas' {ScoreForm},
  BCscoreMemberSelection in 'BCscoreMemberSelection.pas' {MemberSelectionForm},
  BCscoreConsts in 'BCscoreConsts.pas',
  BCscoreAskForm in 'BCscoreAskForm.pas' {AskForm},
  BCscoreReadMember in 'BCscoreReadMember.pas' {ReadMemberForm},
  eidlib35 in 'eidlib35.pas',
  BCscoreAskHandicaps in 'BCscoreAskHandicaps.pas' {AskHandicapsForm},
  BCscoreRunningText in 'BCscoreRunningText.pas';

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
