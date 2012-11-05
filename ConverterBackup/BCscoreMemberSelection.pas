unit BCscoreMemberSelection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Generics.Collections, BilliardsMember;

type
  TMemberSelectionForm = class(TForm)
    lblDescription: TLabel;
    lvMembers: TListView;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    fMember1: TBilliardMember;
    fMember2: TBilliardMember;
    fMemberIDs: TList<Integer>;

    procedure BuildListOfMembers;
  public
    function Execute(AMember1, AMember2: TBilliardMember): Integer;

    property Member1: TBilliardMember read fMember1 write fMember1;
    property Member2: TBilliardMember read fMember2 write fMember2;
  end;

var
  MemberSelectionForm: TMemberSelectionForm;

implementation

uses BilliardsDataModule, BilliardsGameDay, BCscoreConsts;
{$R *.dfm}

procedure TMemberSelectionForm.BuildListOfMembers;
var
  SL: TStringList;
  Text: string;
  Item: TListItem;
begin
  fMemberIDs.Clear;
  lvMembers.Clear;
  SL := TStringList.Create;
  try
    SL.Add(' select MEMBERS.ID,');
    SL.Add('  MEMBERS.NICKNAME,');
    SL.Add('  MEMBERS.LASTNAME,');
    SL.Add('  MEMBERS.FIRSTNAME');
    SL.Add(' from HANDICAPS, MEMBERS');
    SL.Add(' where GAMETYPE_ID = :gametype');
    SL.Add('   and PERIOD_ID = :period');
    SL.Add('   and HANDICAPS.MEMBER_ID = MEMBERS.ID');
    BilliardDataModule.sqlQuery.SQL.Assign(SL);
  finally
    SL.Free;
  end;
  BilliardDataModule.sqlQuery.ParamByName('gametype').AsInteger := BilliardGameDay.GameType.ID;
  BilliardDataModule.sqlQuery.ParamByName('period').AsInteger := BilliardGameDay.Period.ID;
  BilliardDataModule.sqlQuery.Open;
  BilliardDataModule.sqlQuery.First;
  while not BilliardDataModule.sqlQuery.EOF do
  begin
    Text := BilliardDataModule.sqlQuery.FieldByName('NICKNAME').AsString;
    if Text = '' then
    begin
      Text := BilliardDataModule.sqlQuery.FieldByName('LASTNAME').AsString;
      Text := Text + ', ';
      Text := Text + BilliardDataModule.sqlQuery.FieldByName('FIRSTNAME').AsString;
    end;
    Item := lvMembers.Items.Add;
    Item.Caption := Text;
    fMemberIDs.Add(BilliardDataModule.sqlQuery.FieldByName('ID').AsInteger);
    BilliardDataModule.sqlQuery.Next;
  end;
  BilliardDataModule.sqlQuery.Close;
  if lvMembers.Items.Count > 0 then
    lvMembers.ItemIndex := 0
  else
    lvMembers.ItemIndex := -1;
  lvMembers.SetFocus;
end;

function TMemberSelectionForm.Execute(AMember1, AMember2: TBilliardMember): Integer;
begin
  fMember1 := AMember1;
  fMember2 := fMember2;
  BuildListOfMembers;
  Result := ShowModal;
end;

procedure TMemberSelectionForm.FormCreate(Sender: TObject);
begin
  fMemberIDs := TList<Integer>.Create;
end;

procedure TMemberSelectionForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fMemberIDs);
end;

procedure TMemberSelectionForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of
    104: Key := VK_UP;
    98: Key := VK_DOWN;
    else
      inherited;
  end;
end;

procedure TMemberSelectionForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    ckEscape:
      begin
        if Member1.ID <> 0 then
        begin
          lblDescription.Caption := 'Selecteer de eerste speler en druk op ENTER om te bevestigen of op 0 op te annuleren.';
          Member1.Clear;
          BuildListOfMembers;
        end
        else
        begin
          ModalResult := mrCancel;
        end;
      end;
    ckSelect:
      begin
        if Member1.ID = 0 then
        begin
          lblDescription.Caption := 'Selecteer de tweede speler en druk op ENTER om te bevestigen of op 0 op te annuleren.';
          Member1.Retrieve(fMemberIDs[lvMembers.ItemIndex]);
          fMemberIDs.Delete(lvMembers.ItemIndex);
          lvMembers.Items.Delete(lvMembers.ItemIndex);
          lvMembers.ItemIndex := 0;
          lvMembers.SetFocus;
        end
        else
        begin
          Member2.Retrieve(fMemberIDs[lvMembers.ItemIndex]);
          ModalResult := mrOk;
        end;
      end;
  else
    inherited;
  end;
end;

procedure TMemberSelectionForm.FormShow(Sender: TObject);
begin
  ClientHeight := 1024;
  ClientWidth := 1280;
  Color := clBackPanel;
  lvMembers.Color := clBackPanel;
  BuildListOfMembers;
end;

end.
