unit BCscoreMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TMainForm = class(TForm)
    gpnlMenu: TGridPanel;
    pnlNewGame: TPanel;
    pnlExtra: TPanel;
    pnlOverview: TPanel;
    pnlExit: TPanel;
    lblNewGameShortCut: TLabel;
    lblOverviewShortCut: TLabel;
    lblExtraShortCut: TLabel;
    lblExitShortCut: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure StartNewGame;
    procedure NewMember;
    procedure ShowOverview;
    procedure ExitApp;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  BilliardsGameDay,
  BilliardsGame,
  BCscoreScore, BilliardsMember, BCscoreMemberSelection, BCscoreConsts,
  BCscoreAskForm, BCscoreReadMember;
{$R *.dfm}

procedure TMainForm.ExitApp;
begin
  AskForm := TAskForm.Create(Self);
  try
  AskForm.Message := 'Wenst U af te sluiten ?';
  AskForm.ShowModal;
  if AskForm.ModalResult = mrOk then
    Close;
  finally
    FreeAndNil(AskForm);
  end;
end;

procedure TMainForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    ckNewGame:
      StartNewGame;
    ckNewMember:
      NewMember;
    ckOverview:
      ShowOverview;
    ckExitApp:
      ExitApp;
  else
    inherited;
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  ClientHeight := 1024;
  ClientWidth := 1280;
  Color := clBackPanel;
  pnlNewGame.Color := clNewGamePanel;
  lblNewGameShortCut.Color := clShortcutText;
  lblNewGameShortCut.Font.Color := clNewGamePanel;
  pnlExtra.Color := clExtraPanel;
  lblExtraShortCut.Color := clShortcutText;
  lblExtraShortCut.Font.Color := clExtraPanel;
  pnlOverview.Color := clOverviewPanel;
  lblOverviewShortCut.Color := clShortcutText;
  lblOverviewShortCut.Font.Color := clOverviewPanel;
  pnlExit.Color := clExitPanel;
  lblExitShortCut.Color := clShortcutText;
  lblExitShortCut.Font.Color := clExitPanel;
end;

procedure TMainForm.NewMember;
begin
  ReadMemberForm := TReadMemberForm.Create(Self);
  try
    ReadMemberForm.ShowModal;
  finally
    FreeAndNil(ReadMemberForm);
  end;
end;

procedure TMainForm.ShowOverview;
begin
  // TODO
end;

procedure TMainForm.StartNewGame;
var
  Member1, Member2: TBilliardMember;
begin
  if not Assigned(BilliardGameDay) then
    BilliardGameDay := TBilliardGameDay.Create;
  MemberSelectionForm := TMemberSelectionForm.Create(Self);
  try
    Member1 := TBilliardMember.Create;
    Member2 := TBilliardMember.Create;
    MemberSelectionForm.Member1 := Member1;
    MemberSelectionForm.Member2 := Member2;
    if MemberSelectionForm.ShowModal = mrOk then
    begin
      // start a new game
      BilliardGame := TBilliardGame.Create(BilliardGameDay, Member1, Member2);
      try
        ScoreForm := TScoreForm.Create(Self);
        try
          ScoreForm.ShowModal;
        finally
          FreeAndNil(ScoreForm);
        end;
        // BilliardGame.Store;
      finally
        FreeAndNil(BilliardGame);
      end;
    end;
  finally
    FreeAndNil(MemberSelectionForm);
  end;
end;

end.
