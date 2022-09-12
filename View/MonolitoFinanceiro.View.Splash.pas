unit MonolitoFinanceiro.View.Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
  TfrmSplash = class(TForm)
    pnlPrincipal: TPanel;
    imgLogo: TImage;
    ProgressBar1: TProgressBar;
    lblNomeAplicacao: TLabel;
    Timer1: TTimer;
    Panel1: TPanel;
    lblStatus: TLabel;
    imgDll: TImage;
    imgBancoDados: TImage;
    imgConfiguracoes: TImage;
    imgIniciando: TImage;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizarStatus(Mensagem : String; aImage : TImage);

  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.AtualizarStatus(Mensagem: String; aImage: TImage);
begin
     lblStatus.Caption := Mensagem;
     aImage.Visible := True;
end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
  if ProgressBar1.Position <= 100 then
  begin
    ProgressBar1.StepIt;
    case ProgressBar1.Position of
      10 : AtualizarStatus('Carregando dependências...', imgDll);
      25 : AtualizarStatus('Conectando ao banco de dados..', imgBancoDados);
      45 : AtualizarStatus('Carregando as configurações...', imgConfiguracoes);
      75 : AtualizarStatus('Iniciando o sistema...', imgIniciando);
    end;
  end;
  if ProgressBar1.Position = 100 then
    Close;
end;

end.
