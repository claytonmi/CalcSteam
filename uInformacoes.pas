unit uInformacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,Shellapi ;

type
  TFInformacoes = class(TForm)
    LBAutor: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LinkLabel1: TLinkLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure LinkLabel1LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInformacoes: TFInformacoes;

implementation

{$R *.dfm}

procedure TFInformacoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
  VK_ESCAPE: close;
end;
end;

procedure TFInformacoes.LinkLabel1LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  ShellExecute(0, nil, PChar(Link), nil, nil, 1);
end;

end.
