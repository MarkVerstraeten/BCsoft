unit BCscore.AskForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TAskForm = class(TForm)
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
    procedure SetMessage(const Value: string);
    { Private declarations }
  public
    property &Message: string write SetMessage;
  end;

var
  AskForm: TAskForm;

implementation

uses BCscore.Consts;
{$R *.dfm}

procedure TAskForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TAskForm.FormShow(Sender: TObject);
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
end;

procedure TAskForm.SetMessage(const Value: string);
begin
  lblMessageText.Caption := Value;
end;

end.
