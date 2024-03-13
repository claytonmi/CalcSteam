program CalculadoraDeNivelSteam;

uses
  Vcl.Forms,
  uCalculadoraSteam in 'uCalculadoraSteam.pas' {FCalculadoraSteam},
  uInformacoes in 'uInformacoes.pas' {FInformacoes},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFCalculadoraSteam, FCalculadoraSteam);
  Application.Run;
end.
