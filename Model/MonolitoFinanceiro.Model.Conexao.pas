unit MonolitoFinanceiro.Model.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmConexao = class(TDataModule)
    SQLConexao: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
    const ARQUIVOCONFIGURACAO = 'MonolitoFinanceiro.cfg';
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregarConfiguracoes;
    procedure Conectar;
    procedure Desconectar;
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TdmConexao.CarregarConfiguracoes;
var
  ParametroNome : String;
  ParametroValor : String;
  Contador : Integer;
  ListaParamentros : TStringList;
begin
  SQLConexao.Params.Clear;  //limpar parametros da conex�o
  if not FileExists(ARQUIVOCONFIGURACAO) then
    raise Exception.Create('Arquivo de Configura��o n�o encontrado');

  ListaParamentros := TStringList.Create;
  try
    ListaParamentros.LoadFromFile(ARQUIVOCONFIGURACAO);
    for contador := 0 to Pred(ListaParamentros.Count) do
    begin
      if ListaParamentros[Contador].IndexOf('=') > 0 then
      begin
        ParametroNome := ListaParamentros[Contador].Split(['='])[0].Trim;   //trim serve para retirar o espa�o
        ParametroValor := ListaParamentros[Contador].Split(['='])[1].Trim;
        SQLConexao.Params.Add(ParametroNome + '=' + ParametroValor);
      end;
    end;

  finally
    ListaParamentros.Free;
  end;



end;

procedure TdmConexao.Conectar;
begin
       SQLConexao.Connected;
end;

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
  CarregarConfiguracoes;
  Conectar;
end;

procedure TdmConexao.Desconectar;
begin
       SQLConexao.Connected := False;
end;

end.
