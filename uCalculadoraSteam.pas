unit uCalculadoraSteam;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFCalculadoraSteam = class(TForm)
    EdSeuLvL: TEdit;
    EdLvLDesejado: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtLimpar: TBitBtn;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    LBFUNDOS: TLabel;
    LBEMOTICONS: TLabel;
    LBMOSTRUARIO: TLabel;
    LBCUPONSDEJOGOS: TLabel;
    LBINSIGNIAS: TLabel;
    LBXPNECESSARIO: TLabel;
    LBBOOSTERPACK: TLabel;
    LBPRECOMEDIO: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    LBSTEAMGEMAS: TLabel;
    Label14: TLabel;
    LBLISTAAMIGOS: TLabel;
    LBTOTALLISTAAMIGOS: TLabel;
    Label15: TLabel;
    BtInfo: TBitBtn;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    procedure BtLimparClick(Sender: TObject);
    procedure EdLvLDesejadoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdLvLDesejadoKeyPress(Sender: TObject; var Key: Char);
    procedure EdSeuLvLKeyPress(Sender: TObject; var Key: Char);
    procedure EdSeuLvLKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    function CalculaSeuNivel(var SeuNivel: Integer): Integer;
    function CalculaNivelDesejado(var SeuNivel: Integer): Integer;
    function TotalMostruario(var SeuNivel: Integer): Integer;
    function TotalBooster(var SeuNivel: Integer): Integer;
    function TotalListaAmigos(var nivel: Integer): Integer;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtInfoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

    { Private declarations }
  public
    Buffer, SeuNivel, cont, xp, Left11, Left22,xplvl, GEMAS, i, Left1, Left2, XPLVLDESEJADO, XPNECESSARIO, FUNDOS, booster, cont1, Mostruario, TotalAmigos: Integer;
    Preco: Real;
    { Public declarations }
  end;

   {Autor: Clayton Machado}
var
  FCalculadoraSteam: TFCalculadoraSteam;

implementation

{$R *.dfm}

uses uInformacoes;

function TFCalculadoraSteam.TotalListaAmigos(var nivel: Integer): Integer;
var
  i,ListaAmigo: Integer;
begin
  ListaAmigo := 250;
  for i := 1 to nivel do
  begin
    if (ListaAmigo < 2000) then
    begin
      ListaAmigo := ListaAmigo + 5;
    end;
  end;
  result := ListaAmigo;
end;

function TFCalculadoraSteam.TotalBooster(var SeuNivel: Integer): Integer;
var
 i: Integer;
begin
  booster := 0;
  cont1 := 0;
  for i := 0 to SeuNivel do
  begin
    cont1 := cont1 + 1;
    if (cont1 = 10) then
    begin
      cont1 := 0;
      booster := booster + 20;
    end;
  end;
  result := booster;
end;

function TFCalculadoraSteam.TotalMostruario(var SeuNivel: Integer): Integer;
var
i: Integer;
begin
  Mostruario := 0;
  cont1 := 0;
  for i := 0 to SeuNivel do
  begin
    cont1 := cont1 + 1;
    if (cont1 = 10) then
    begin
      cont1 := 0;
      if (Mostruario < 16) then
      begin
        Mostruario := Mostruario + 1;
      end;
    end;
  end;
  result := Mostruario;
end;

function TFCalculadoraSteam.CalculaNivelDesejado(var SeuNivel: Integer)
  : Integer;
  var
    i: Integer;
begin
  xplvl := 100;
  xp := 0;
  cont := 0;
  for i := 1 to SeuNivel do
  begin
    if (cont = 10) then
    begin
      cont := 0;
      xplvl := xplvl + 100;
    end;
    xp := xp + xplvl;
    cont := cont + 1;
  end;
  result := xp;
end;

function TFCalculadoraSteam.CalculaSeuNivel(var SeuNivel: Integer): Integer;
var
  xplvl, xp, cont, i: Integer;
begin
  xplvl := 100;
  xp := 0;
  cont := 0;
  for i := 1 to SeuNivel do
  begin
    if (cont = 10) then
    begin
      cont := 0;
      xplvl := xplvl + 100;
    end;
    xp := xp + xplvl;
    cont := cont + 1;
  end;
  result := xp;
end;

procedure TFCalculadoraSteam.BtInfoClick(Sender: TObject);
begin
   FInformacoes := TFInformacoes.Create(Self);
   FInformacoes.ShowModal;
end;

procedure TFCalculadoraSteam.BtLimparClick(Sender: TObject);
begin
  EdSeuLvL.Clear;
  EdLvLDesejado.Clear;
  LBXPNECESSARIO.Caption := '0';
  LBFUNDOS.Caption := '0';
  LBEMOTICONS.Caption := '0';
  LBCUPONSDEJOGOS.Caption := '0';
  LBBOOSTERPACK.Caption := '+' + '0' + '%';
  LBINSIGNIAS.Caption := '0';
  LBMOSTRUARIO.Caption := '0';
  LBSTEAMGEMAS.Caption := '0';
  LBPRECOMEDIO.Caption := 'R$ 0.00';
  LBLISTAAMIGOS.Caption := '250';
  EdSeuLvL.Text := '0';
  EdLvLDesejado.Text := '0';
  EdSeuLvL.SetFocus;
end;

procedure TFCalculadoraSteam.EdLvLDesejadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0' .. '9', #8:
      ;
  else
    Key := #0;
    LBXPNECESSARIO.Caption := '0';
    LBFUNDOS.Caption := '0';
    LBEMOTICONS.Caption := '0';
    LBCUPONSDEJOGOS.Caption := '0';
    LBBOOSTERPACK.Caption := '+' + '0' + '%';
    LBINSIGNIAS.Caption := '0';
    LBMOSTRUARIO.Caption := '0';
    LBSTEAMGEMAS.Caption := '0';
    LBPRECOMEDIO.Caption := 'R$ 0.00';
    LBLISTAAMIGOS.Caption := '250';
  end
end;

procedure TFCalculadoraSteam.EdLvLDesejadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Mostruario := 0;
  xplvl := 100;
  xp := 0;
  cont := 0;
  booster := 0;
  cont1 := 0;
  Left1 := 129;
  Left2 := 122;
  Left11 := 168;
  Left22 := 162;
  if (EdSeuLvL.Text = '') or (EdLvLDesejado.Text = '') Then
  begin
    LBXPNECESSARIO.Caption := '0';
    LBFUNDOS.Caption := '0';
    LBEMOTICONS.Caption := '0';
    LBCUPONSDEJOGOS.Caption := '0';
    LBBOOSTERPACK.Caption := '+' + '0' + '%';
    LBINSIGNIAS.Caption := '0';
    LBMOSTRUARIO.Caption := '0';
    LBSTEAMGEMAS.Caption := '0';
    LBPRECOMEDIO.Caption := 'R$ 0.00';
    LBLISTAAMIGOS.Caption := '250';
  end
  Else
  begin
    if (StrToInt(EdSeuLvL.Text) < StrToInt(EdLvLDesejado.Text)) Then
    begin
      if TryStrToInt(EdLvLDesejado.Text, Buffer) then
      begin
        if (EdSeuLvL.Text >= '0') then
        begin
          SeuNivel := StrToInt(EdLvLDesejado.Text);
          xp := CalculaNivelDesejado(SeuNivel);
          SeuNivel := StrToInt(EdLvLDesejado.Text);
          Mostruario := TotalMostruario(SeuNivel);
          TotalAmigos := TotalListaAmigos(SeuNivel);
          booster := TotalBooster(SeuNivel);
          XPLVLDESEJADO := xp;
          SeuNivel := StrToInt(EdSeuLvL.Text);
          xp := CalculaSeuNivel(SeuNivel);
          XPNECESSARIO := XPLVLDESEJADO - xp;
          FUNDOS := XPNECESSARIO div 100;

          if (Mostruario >= 10) then
          begin
            Label12.Left := Left1;
          end
          else
          begin
            Label12.Left := Left2;
          end;
          if (TotalAmigos >= 1000) then
          begin
            LBTOTALLISTAAMIGOS.Left := Left11;
          end
          else
          begin
            LBTOTALLISTAAMIGOS.Left := Left22;
          end;
          if (StrToInt(EdLvLDesejado.Text) <= 5000) then
          begin
            GEMAS := FUNDOS * 1200;
          end
          else
          begin
            GEMAS := 1252500 * 1200;
          end;
          // Label de informações
          LBXPNECESSARIO.Caption := IntToStr(XPNECESSARIO);
          LBFUNDOS.Caption := IntToStr(FUNDOS);
          LBEMOTICONS.Caption := IntToStr(FUNDOS);
          LBCUPONSDEJOGOS.Caption := IntToStr(FUNDOS);
          LBBOOSTERPACK.Caption := '+' + IntToStr(booster) + '%';
          LBINSIGNIAS.Caption := IntToStr(FUNDOS);
          LBMOSTRUARIO.Caption := IntToStr(Mostruario);
          LBSTEAMGEMAS.Caption := IntToStr(GEMAS);
          Preco := FUNDOS * 0.83;
          LBPRECOMEDIO.Caption := 'R$ ' + floatToStr(Preco);
          LBLISTAAMIGOS.Caption := IntToStr(TotalAmigos);

        end
        else if (EdSeuLvL.Text = '') then
        begin
          EdSeuLvL.Text := '0';
          SeuNivel := StrToInt(EdLvLDesejado.Text);
          xp := CalculaNivelDesejado(SeuNivel);
          SeuNivel := StrToInt(EdLvLDesejado.Text);
          Mostruario := TotalMostruario(SeuNivel);
          TotalAmigos := TotalListaAmigos(SeuNivel);
          booster := TotalBooster(SeuNivel);
          XPLVLDESEJADO := xp;
          SeuNivel := StrToInt(EdSeuLvL.Text);
          xp := CalculaSeuNivel(SeuNivel);
          XPNECESSARIO := XPLVLDESEJADO - xp;
          FUNDOS := XPNECESSARIO div 100;

          if (Mostruario >= 10) then
          begin
            Label12.Left := Left1;
          end
          else
          begin
            Label12.Left := Left2;
          end;
          if (TotalAmigos >= 1000) then
          begin
            LBTOTALLISTAAMIGOS.Left := Left11;
          end
          else
          begin
            LBTOTALLISTAAMIGOS.Left := Left22;
          end;
          if (StrToInt(EdLvLDesejado.Text) <= 5000) then
          begin
            GEMAS := FUNDOS * 1200;
          end
          else
          begin
            GEMAS := 1252500 * 1200;
          end;
          // Label de informações
          LBXPNECESSARIO.Caption := IntToStr(XPNECESSARIO);
          LBFUNDOS.Caption := IntToStr(FUNDOS);
          LBEMOTICONS.Caption := IntToStr(FUNDOS);
          LBCUPONSDEJOGOS.Caption := IntToStr(FUNDOS);
          LBBOOSTERPACK.Caption := '+' + IntToStr(booster) + '%';
          LBINSIGNIAS.Caption := IntToStr(FUNDOS);
          LBMOSTRUARIO.Caption := IntToStr(Mostruario);
          LBSTEAMGEMAS.Caption := IntToStr(GEMAS);
          Preco := FUNDOS * 0.83;
          LBPRECOMEDIO.Caption := 'R$ ' + floatToStr(Preco);
          LBLISTAAMIGOS.Caption := IntToStr(TotalAmigos);
        end;
      end;
    end
    else
    begin
      LBXPNECESSARIO.Caption := '0';
      LBFUNDOS.Caption := '0';
      LBEMOTICONS.Caption := '0';
      LBCUPONSDEJOGOS.Caption := '0';
      LBBOOSTERPACK.Caption := '+' + '0' + '%';
      LBINSIGNIAS.Caption := '0';
      LBMOSTRUARIO.Caption := '0';
      LBSTEAMGEMAS.Caption := '0';
      LBPRECOMEDIO.Caption := 'R$ 0.00';
      LBLISTAAMIGOS.Caption := '250';
    end;
  end;
end;

procedure TFCalculadoraSteam.EdSeuLvLKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0' .. '9', #8:
      ;
  else
    Key := #0;
    LBXPNECESSARIO.Caption := '0';
    LBFUNDOS.Caption := '0';
    LBEMOTICONS.Caption := '0';
    LBCUPONSDEJOGOS.Caption := '0';
    LBBOOSTERPACK.Caption := '+' + '0' + '%';
    LBINSIGNIAS.Caption := '0';
    LBMOSTRUARIO.Caption := '0';
    LBSTEAMGEMAS.Caption := '0';
    LBPRECOMEDIO.Caption := 'R$ 0.00';
    LBLISTAAMIGOS.Caption := '250';
  end
end;

procedure TFCalculadoraSteam.EdSeuLvLKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Mostruario := 0;
  xplvl := 100;
  xp := 0;
  cont := 0;
  booster := 0;
  cont1 := 0;
  Left1 := 129;
  Left2 := 122;
  Left11 := 168;
  Left22 := 162;
  if (EdSeuLvL.Text = '') or (EdLvLDesejado.Text = '') Then
  begin
    LBXPNECESSARIO.Caption := '0';
    LBFUNDOS.Caption := '0';
    LBEMOTICONS.Caption := '0';
    LBCUPONSDEJOGOS.Caption := '0';
    LBBOOSTERPACK.Caption := '+' + '0' + '%';
    LBINSIGNIAS.Caption := '0';
    LBMOSTRUARIO.Caption := '0';
    LBSTEAMGEMAS.Caption := '0';
    LBPRECOMEDIO.Caption := 'R$ 0.00';
    LBLISTAAMIGOS.Caption := '250';
    EdSeuLvL.Text := '0';
    EdLvLDesejado.Text := '0';
  end
  Else
  begin
    if (StrToInt(EdSeuLvL.Text) < StrToInt(EdLvLDesejado.Text)) Then
    begin
      if TryStrToInt(EdLvLDesejado.Text, Buffer) then
      begin
        if (EdSeuLvL.Text >= '0') then
        begin
          SeuNivel := StrToInt(EdLvLDesejado.Text);
          xp := CalculaNivelDesejado(SeuNivel);
          SeuNivel := StrToInt(EdLvLDesejado.Text);
          Mostruario := TotalMostruario(SeuNivel);
          booster := TotalBooster(SeuNivel);
          XPLVLDESEJADO := xp;
          SeuNivel := StrToInt(EdSeuLvL.Text);
          xp := CalculaSeuNivel(SeuNivel);
          TotalAmigos := TotalListaAmigos(SeuNivel);
          XPNECESSARIO := XPLVLDESEJADO - xp;
          FUNDOS := XPNECESSARIO div 100;

          if (Mostruario >= 10) then
          begin
            Label12.Left := Left1;
          end
          else
          begin
            Label12.Left := Left2;
          end;
          if (TotalAmigos >= 1000) then
          begin
            LBTOTALLISTAAMIGOS.Left := Left11;
          end
          else
          begin
            LBTOTALLISTAAMIGOS.Left := Left22;
          end;
          if (StrToInt(EdSeuLvL.Text) <= 5000) then
          begin
            GEMAS := FUNDOS * 1200;
          end
          else
          begin
            GEMAS := 1252500 * 1200;
          end;
          LBXPNECESSARIO.Caption := IntToStr(XPNECESSARIO);
          LBFUNDOS.Caption := IntToStr(FUNDOS);
          LBEMOTICONS.Caption := IntToStr(FUNDOS);
          LBCUPONSDEJOGOS.Caption := IntToStr(FUNDOS);
          LBBOOSTERPACK.Caption := '+' + IntToStr(booster) + '%';
          LBINSIGNIAS.Caption := IntToStr(FUNDOS);
          LBMOSTRUARIO.Caption := IntToStr(Mostruario);
          LBSTEAMGEMAS.Caption := IntToStr(GEMAS);
          Preco := FUNDOS * 0.83;
          LBPRECOMEDIO.Caption := 'R$ ' + floatToStr(Preco);
          LBLISTAAMIGOS.Caption := IntToStr(TotalAmigos);

        end
        else if (EdSeuLvL.Text = '') then
        begin
          EdSeuLvL.Text := '0';
          SeuNivel := StrToInt(EdLvLDesejado.Text);
          xp := CalculaNivelDesejado(SeuNivel);
          SeuNivel := StrToInt(EdLvLDesejado.Text);
          Mostruario := TotalMostruario(SeuNivel);
          booster := TotalBooster(SeuNivel);
          XPLVLDESEJADO := xp;
          SeuNivel := StrToInt(EdSeuLvL.Text);
          xp := CalculaSeuNivel(SeuNivel);
          TotalAmigos := TotalListaAmigos(SeuNivel);
          XPNECESSARIO := XPLVLDESEJADO - xp;
          FUNDOS := XPNECESSARIO div 100;

          if (Mostruario >= 10) then
          begin
            Label12.Left := Left1;
          end
          else
          begin
            Label12.Left := Left2;
          end;
          if (TotalAmigos >= 1000) then
          begin
            LBTOTALLISTAAMIGOS.Left := Left11;
          end
          else
          begin
            LBTOTALLISTAAMIGOS.Left := Left22;
          end;
          if (StrToInt(EdSeuLvL.Text) <= 5000) then
          begin
            GEMAS := FUNDOS * 1200;
          end
          else
          begin
            GEMAS := 1252500 * 1200;
          end;
          LBXPNECESSARIO.Caption := IntToStr(XPNECESSARIO);
          LBFUNDOS.Caption := IntToStr(FUNDOS);
          LBEMOTICONS.Caption := IntToStr(FUNDOS);
          LBCUPONSDEJOGOS.Caption := IntToStr(FUNDOS);
          LBBOOSTERPACK.Caption := '+' + IntToStr(booster) + '%';
          LBINSIGNIAS.Caption := IntToStr(FUNDOS);
          LBMOSTRUARIO.Caption := IntToStr(Mostruario);
          LBSTEAMGEMAS.Caption := IntToStr(GEMAS);
          Preco := FUNDOS * 0.83;
          LBPRECOMEDIO.Caption := 'R$ ' + floatToStr(Preco);
          LBLISTAAMIGOS.Caption := IntToStr(TotalAmigos);
        end;
      end;
    end
    else
    begin
      SeuNivel := StrToInt(EdSeuLvL.Text);
      Mostruario := TotalMostruario(SeuNivel);
      booster := TotalBooster(SeuNivel);
      TotalAmigos := TotalListaAmigos(SeuNivel);
      if (Mostruario >= 10) then
      begin
        Label12.Left := Left1;
      end
      else
      begin
        Label12.Left := Left2;
      end;
      if (TotalAmigos >= 1000) then
      begin
        LBTOTALLISTAAMIGOS.Left := Left11;
      end
      else
      begin
        LBTOTALLISTAAMIGOS.Left := Left22;
      end;
      LBXPNECESSARIO.Caption := '0';
      LBFUNDOS.Caption := '0';
      LBEMOTICONS.Caption := '0';
      LBCUPONSDEJOGOS.Caption := '0';
      LBBOOSTERPACK.Caption := '+' + IntToStr(booster) + '%';
      LBINSIGNIAS.Caption := '0';
      LBMOSTRUARIO.Caption := IntToStr(Mostruario);
      LBSTEAMGEMAS.Caption := '0';
      LBPRECOMEDIO.Caption := 'R$ 0.00';
      LBLISTAAMIGOS.Caption := IntToStr(TotalAmigos);

    end;
  end;
end;

procedure TFCalculadoraSteam.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of

  VK_DELETE: BtLimparClick(Sender);
  VK_ESCAPE: close;
end;
end;

procedure TFCalculadoraSteam.FormShow(Sender: TObject);
begin
    LBXPNECESSARIO.Caption := '0';
    LBFUNDOS.Caption := '0';
    LBEMOTICONS.Caption := '0';
    LBCUPONSDEJOGOS.Caption := '0';
    LBBOOSTERPACK.Caption := '+' + '0' + '%';
    LBINSIGNIAS.Caption := '0';
    LBMOSTRUARIO.Caption := '0';
    LBSTEAMGEMAS.Caption := '0';
    LBPRECOMEDIO.Caption := 'R$ 0.00';
    LBLISTAAMIGOS.Caption := '250';
    EdSeuLvL.Text := '0';
    EdLvLDesejado.Text := '0';
end;

end.
