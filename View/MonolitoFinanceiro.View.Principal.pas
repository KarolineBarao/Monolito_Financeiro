unit MonolitoFinanceiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  MonolitoFinanceiro.View.Usuarios, MonolitoFinanceiro.View.Splash;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuCadastro: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuAjuda: TMenuItem;
    mnuUsuarios: TMenuItem;
    procedure mnuUsuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  frmSplash := TfrmSplash.Create(nil); // criando o objeto frmSplash
  try
    frmSplash.ShowModal;    // exibir o form
  finally
    FreeAndNil(frmSplash);   // destrindo o objeto criado

  end;
end;

procedure TfrmPrincipal.mnuUsuariosClick(Sender: TObject);
begin
  frmUsuarios.Show;
end;

end.
