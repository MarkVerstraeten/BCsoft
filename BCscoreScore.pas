unit BCscoreScore;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, {Generics.Collections,} BilliardsMember, ExtCtrls{, GIFImg};

type
  TScoreForm = class(TForm)
    pnlTop: TPanel;
    pnlMiddle: TPanel;
    pnlBottom: TPanel;
    imgTopLeft: TImage;
    lblLastName1: TLabel;
    lblLastName2: TLabel;
    imgTopRight: TImage;
    lblTurns: TLabel;
    lblScore1: TLabel;
    lblCurrentScore1: TLabel;
    lblHandicap1: TLabel;
    lblHandicap2: TLabel;
    lblScore2: TLabel;
    lblCurrentScore2: TLabel;
    lblGem: TLabel;
    lblHR: TLabel;
    lblGem1: TLabel;
    lblGem2: TLabel;
    lblHR1: TLabel;
    lblHR2: TLabel;
    ballWhite: TShape;
    ballYellow: TShape;
    lblFirstName1: TLabel;
    lblFirstName2: TLabel;
    lblNickName1: TLabel;
    lblNickName2: TLabel;
    gpnlAdvertisements: TPanel;
    Image14: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    fCurrentPlayer: TBilliardMember;
    fScores1: TList<integer>;
    fScores2: TList<integer>;
    fCurrentScore: integer;
    fEndlessGame: boolean;

    UnknownImg: TJPEGImage;

    procedure LoadUnknownImage(aImage: TImage);
    procedure LoadPicture(aImage: TImage; aMember: TBilliardMember);
    procedure UpdateStats(FirstTime: boolean = FALSE);
  public
    property CurrentPlayer: TBilliardMember read fCurrentPlayer write fCurrentPlayer;
    property CurrentScore: integer read fCurrentScore write fCurrentScore;
    property Scores1: TList<integer>read fScores1;
    property Scores2: TList<integer>read fScores2;
    property EndlessGame: boolean read fEndlessGame write fEndlessGame;
  end;

var
  ScoreForm: TScoreForm;

implementation

uses BilliardsGame, BCscoreConsts;
{$R *.lfm}

procedure TScoreForm.FormCreate(Sender: TObject);
begin
  fScores1 := TList<integer>.Create;
  fScores2 := TList<integer>.Create;
  fCurrentScore := 0;
  fEndlessGame := FALSE;
end;

procedure TScoreForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fScores1);
  FreeAndNil(fScores2);
end;

procedure TScoreForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    ckEscape: // EXIT
      begin
        ModalResult := mrCancel;
      end;
    ckSubtractScore: // SUBTRACT SCORE
      begin
        if fCurrentScore > 0 then
          Dec(fCurrentScore);
      end;
    ckAddScore: // ADD SCORE
      begin
        Inc(fCurrentScore);
      end;
    ckUndoTurn: // UNDO TURN
      begin
        if not Assigned(fCurrentPlayer) then
        begin
          fCurrentPlayer := BilliardGame.Member1;
          fScores1.Clear;
          fScores2.Clear;
        end
        else
        begin
          if fCurrentPlayer = BilliardGame.Member1 then
          begin
            if fScores2.Count > 0 then
            begin
              fCurrentScore := fScores2[fScores2.Count - 1];
              BilliardGame.Score2 := BilliardGame.Score2 - fCurrentScore;
              fScores2.Delete(fScores2.Count - 1);
              fCurrentPlayer := BilliardGame.Member2;
              BilliardGame.Turns := BilliardGame.Turns - 1;
            end
            else
              fCurrentScore := 0;
          end
          else
          begin
            if fScores1.Count > 0 then
            begin
              fCurrentScore := fScores1[fScores1.Count - 1];
              BilliardGame.Score1 := BilliardGame.Score1 - fCurrentScore;
              fScores1.Delete(fScores1.Count - 1);
            end
            else
              fCurrentScore := 0;
            fCurrentPlayer := BilliardGame.Member1;
          end;
        end;
      end;
    ckEndTurn: // NEXT TURN FOR NEXT PLAYER
      begin
        if not Assigned(fCurrentPlayer) then
        begin
          if not fEndlessGame then
          begin
            // maximum number of turns reached
            // show e message and ask if this is an endless game
            // if so, continue play en never check turns again
          end;
        end
        else
        begin
          if fCurrentPlayer = BilliardGame.Member1 then
          begin
            fScores1.Add(fCurrentScore);
            BilliardGame.Score1 := BilliardGame.Score1 + fCurrentScore;
            if fCurrentScore > BilliardGame.HighScore1 then
              BilliardGame.HighScore1 := fCurrentScore;
            fCurrentScore := 0;
            fCurrentPlayer := BilliardGame.Member2;
          end
          else
          begin
            fScores2.Add(fCurrentScore);
            BilliardGame.Score2 := BilliardGame.Score2 + fCurrentScore;
            if fCurrentScore > BilliardGame.HighScore2 then
              BilliardGame.HighScore2 := fCurrentScore;
            fCurrentScore := 0;
            if (not fEndlessGame) and (fScores1.Count < BilliardGame.GameDay.GameType.MaxTurns) then
              fCurrentPlayer := BilliardGame.Member1
            else
              fCurrentPlayer := nil;
            BilliardGame.Turns := BilliardGame.Turns + 1;
          end;
        end;
      end
    else
      inherited;
  end;
  UpdateStats;
end;

procedure TScoreForm.FormShow(Sender: TObject);
begin
  ClientHeight := 1024;
  ClientWidth := 1280;
  Color := clBackPanel;
  pnlMiddle.Color := clScorePanel;
  // left
  lblLastName1.Font.Color := clNormalText;
  lblFirstName1.Font.Color := clNormalText;
  lblHandicap1.Font.Color := clHandicapText;
  lblNickName1.Font.Color := clNormalText;
  lblScore1.Font.Color := clNormalText;
  lblCurrentScore1.Font.Color := clCurrentScoreText;
  // middle
  lblTurns.Color := clNormalText;
  lblTurns.Font.Color := clScorePanel;
  lblGem1.Font.Color := clAverageText;
  lblHR1.Font.Color := clAverageText;
  lblGem.Font.Color := clAverageText;
  lblHR.Font.Color := clAverageText;
  lblGem2.Font.Color := clAverageText;
  lblHR2.Font.Color := clAverageText;
  // right
  lblLastName2.Font.Color := clNormalText;
  lblFirstName2.Font.Color := clNormalText;
  lblHandicap2.Font.Color := clHandicapText;
  lblNickName2.Font.Color := clNormalText;
  lblScore2.Font.Color := clNormalText;
  lblCurrentScore2.Font.Color := clCurrentScoreText;

  gpnlAdvertisements.Color := clBackPanel;

  fCurrentPlayer := BilliardGame.Member1;
  fScores1.Clear;
  fScores2.Clear;
  UpdateStats(TRUE);
  //Timer1.Enabled := TRUE;
end;

procedure TScoreForm.LoadPicture(aImage: TImage; aMember: TBilliardMember);
begin
  if Assigned(aMember.Picture) then
  begin
    // aImage.Stretch := FALSE;
    // aMember.Picture.SaveToFile(aMember.LastName+'.jpeg');
    aImage.Picture.Bitmap.Assign(aMember.Picture);
  end
  else
    LoadUnknownImage(aImage);
end;

procedure TScoreForm.LoadUnknownImage(aImage: TImage);
var
  Stream: TFileStream;
begin
  if not Assigned(UnknownImg) then
  begin
    Stream := TFileStream.Create('unknown.jpg', fmOpenRead);
    try
      Stream.Position := 0;
      UnknownImg := TJPEGImage.Create;
      UnknownImg.LoadFromStream(Stream);
    finally
      FreeAndNil(Stream);
    end;
  end;
  aImage.Stretch := TRUE;
  aImage.Picture.Bitmap.Assign(UnknownImg);
end;

procedure TScoreForm.UpdateStats(FirstTime: boolean);
begin
  if FirstTime then
  begin
    LoadPicture(imgTopLeft, BilliardGame.Member1);
    lblLastName1.Caption := BilliardGame.Member1.LastName;
    lblFirstName1.Caption := BilliardGame.Member1.FirstName;
    lblHandicap1.Caption := IntToStr(BilliardGame.GetHandicapForMember(BilliardGame.Member1.ID));
    LoadPicture(imgTopRight, BilliardGame.Member2);
    lblLastName2.Caption := BilliardGame.Member2.LastName;
    lblFirstName2.Caption := BilliardGame.Member2.FirstName;
    lblHandicap2.Caption := IntToStr(BilliardGame.GetHandicapForMember(BilliardGame.Member2.ID));
    lblNickName1.Caption := BilliardGame.Member1.NickName;
    lblNickName2.Caption := BilliardGame.Member2.NickName;
    lblTurns.Caption := '0';
    lblScore1.Caption := '0';
    lblCurrentScore1.Caption := '0';
    lblGem1.Caption := '0,0';
    lblHR1.Caption := '0';
    lblScore2.Caption := '0';
    lblCurrentScore2.Caption := '0';
    lblGem2.Caption := '0,0';
    lblHR2.Caption := '0';
  end;
  ballWhite.Visible := (fCurrentPlayer = BilliardGame.Member1);
  ballYellow.Visible := (fCurrentPlayer = BilliardGame.Member2);
  lblCurrentScore1.Visible := (fCurrentPlayer = BilliardGame.Member1);
  lblCurrentScore2.Visible := (fCurrentPlayer = BilliardGame.Member2);
  lblTurns.Caption := IntToStr(BilliardGame.Turns);
  lblScore1.Caption := IntToStr(BilliardGame.Score1);
  lblCurrentScore1.Caption := '+' + IntToStr(fCurrentScore);
  if fScores1.Count > 0 then
    lblGem1.Caption := Format('%2.3f', [BilliardGame.Score1 / fScores1.Count])
  else
    lblGem1.Caption := '0,0';
  lblHR1.Caption := IntToStr(BilliardGame.HighScore1);
  lblScore2.Caption := IntToStr(BilliardGame.Score2);
  lblCurrentScore2.Caption := '+' + IntToStr(fCurrentScore);
  if fScores2.Count > 0 then
    lblGem2.Caption := Format('%2.3f', [BilliardGame.Score2 / fScores2.Count])
  else
    lblGem2.Caption := '0,0';
  lblHR2.Caption := IntToStr(BilliardGame.HighScore2);
  Update;
end;

end.
