unit BCscore.ReadMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, eidlib35, Billiards.Member, BCscore.AskForm, BCscore.AskHandicaps;

type
  TReadMemberForm = class(TForm)
    pnlCancel: TPanel;
    lblCancelShortcut: TLabel;
    lblCancelText: TLabel;
    pnlConfirm: TPanel;
    lblConfirmShortcut: TLabel;
    lblConfirmText: TLabel;
    pnlMessage: TPanel;
    lblMessageText: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    fMember: TBilliardMember;

    procedure SetConfirmEnabled(aValue: boolean);
    procedure ReadData;
  public
    property Member: TBilliardMember read fMember;
  end;

var
  ReadMemberForm: TReadMemberForm;

implementation

uses
  BCscore.Consts, JPEG;
{$R *.dfm}

procedure TReadMemberForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    ckCancel:
      ModalResult := mrCancel;
    ckConfirm:
      ReadData;
    // ModalResult := mrOk;
  else
    inherited;
  end;
end;

procedure TReadMemberForm.FormShow(Sender: TObject);
begin
  Color := clAskBackPanel;
  pnlMessage.Color := clMessagePanel;
  lblMessageText.Font.Color := clNormalText;
  pnlCancel.Color := clCancelPanel;
  lblCancelText.Font.Color := clNormalText;
  lblCancelShortcut.Color := clShortcutText;
  lblCancelShortcut.Font.Color := clCancelPanel;
  pnlConfirm.Color := clConfirmPanel;
  lblConfirmShortcut.Color := clShortcutText;
  lblConfirmShortcut.Font.Color := clConfirmPanel;
  lblConfirmText.Font.Color := clNormalText;
  SetConfirmEnabled(TRUE);
end;

procedure TReadMemberForm.ReadData;
var
  readerCount: integer;
  readerContext: TBEID_ReaderContext;
  readerIdx: cardinal;
  card: TBEID_EIDCard;
  pic: TBEID_Picture;
  picData: TBEID_ByteArray;
  picBytes: TBytes;
  stream: TMemoryStream;
  Completed: boolean;
  SL: TStringList;
  bExist: boolean;
begin
  Completed := FALSE;
  lblMessageText.Caption := 'Inlezen eID gegevens ...';
  SetConfirmEnabled(FALSE);
  TBEID_ReaderSet.initSDK;
  try
    readerCount := TBEID_ReaderSet.instance.readerCount(TRUE);
    for readerIdx := 0 to readerCount - 1 do
    begin
      readerContext := TBEID_ReaderSet.instance.getReaderByNum(readerIdx);
      if readerContext.isCardPresent then
      begin
        if readerContext.getCardType = BEID_CARDTYPE_EID then
        begin
          card := readerContext.getEIDCard;
          if not Assigned(fMember) then
            fMember := TBilliardMember.Create;
          fMember.Clear;

          fMember.LastName := string(card.getID.getSurname);
          SL := TStringList.Create;
          try
            SL.DelimitedText := string(card.getID.getFirstName1);
            if SL.Count > 0 then
              fMember.FirstName := SL[0];
          finally
            FreeAndNil(SL);
          end;
          fMember.BirthDate := string(card.getID.getDateOfBirth);
          fMember.BirthPlace := string(card.getID.getLocationOfBirth);
          fMember.NationalNumber := string(card.getID.getNationalNumber);
          fMember.Gender := string(card.getID.getGender);
          fMember.Nationality := string(card.getID.getNationality);
          fMember.Municipality := string(card.getID.getMunicipality);

          fMember.CardNumber := string(card.getID.getLogicalNumber);
          fMember.ValidFrom := string(card.getID.getValidityBeginDate);
          fMember.ValidUntil := string(card.getID.getValidityEndDate);
          fMember.DocumentType := string(card.getID.getDocumentType);
          fMember.ChipNumber := string(card.getID.getChipNumber);
          fMember.Street := string(card.getID.getStreet);
          fMember.ZipCode := string(card.getID.getZipCode);
          fMember.Country := string(card.getID.getMunicipality);

          pic := card.getPicture;
          picData := pic.getData;
          SetLength(picBytes, picData.Size);
          Move(picData.GetBytes^, Pointer(picBytes)^, picData.Size);
          stream := TMemoryStream.Create;
          try
            stream.Position := 0;
            stream.Write(Pointer(picBytes)^, picData.Size);
            stream.Position := 0;
            fMember.LoadPictureFromStream(stream);
          finally
            FreeAndNil(stream);
          end;
          AskForm := TAskForm.Create(Self);
          try
            // does member already exist ?
            bExist := fMember.Exist;
            if bExist then
            begin
              AskForm.Message := '"' + fMember.LastName + ', ' + fMember.FirstName + '" bestaat al. Wenst U de gegevens te vernieuwen?';
            end
            else
            begin
              AskForm.Message := '"' + fMember.LastName + ', ' + fMember.FirstName + '" bestaat niet. Wenst U de gegevens toe te voegen?';
            end;
            if AskForm.ShowModal = mrOK then
            begin
              fMember.Store;
              if not bExist then
                AskHandicapsForm := TAskHandicapsForm.Create(Self);
                try
                  AskHandicapsForm.ShowModal;
                finally
                  FreeAndNil(AskHandicapsForm);
                end;
            end;
          finally
            FreeAndNil(AskForm);
          end;
        end;
        Completed := TRUE;
      end;
    end;
  finally
    TBEID_ReaderSet.releaseSDK;
    if Completed then
      lblMessageText.Caption := 'Voer een eID kaart in ...'
    else
      lblMessageText.Caption := 'eId kaart niet gevonden.'#13#10'Voer een eID kaart in ...';
    SetConfirmEnabled(TRUE);
  end;
end;

procedure TReadMemberForm.SetConfirmEnabled(aValue: boolean);
begin
  pnlConfirm.Enabled := aValue;
  if not aValue then
  begin
    pnlConfirm.Color := clConfirmPanelDisabled;
    lblConfirmShortcut.Font.Color := clConfirmPanelDisabled;
  end
  else
  begin
    pnlConfirm.Color := clConfirmPanel;
    lblConfirmShortcut.Font.Color := clConfirmPanel;
  end;
  Update;
end;

end.
