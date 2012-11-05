unit BCscore.AskHandicaps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, BCscore.Consts;

type
  TAskHandicapsForm = class(TForm)
    pnlCancel: TPanel;
    lblCancelShortcut: TLabel;
    lblCancelText: TLabel;
    pnlConfirm: TPanel;
    lblConfirmShortcut: TLabel;
    lblConfirmText: TLabel;
    pnlMessage: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AskHandicapsForm: TAskHandicapsForm;

implementation

{$R *.dfm}

procedure TAskHandicapsForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    ckCancel:
      ModalResult := mrCancel;
    ckConfirm:
      ModalResult := mrOk;
  else
    inherited;
  end;
end;

end.
