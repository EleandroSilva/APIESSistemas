{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            In�cio do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.Imp.Conexao.Firedac.MySQL;

interface

uses
  Data.DB,
  System.IniFiles,
  System.SysUtils,
  System.JSON,

  FireDAC.UI.Intf,
  FireDAC.FMXUI.Wait,
  FireDAC.Stan.Intf,
  FireDAC.Comp.UI,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,

  Model.Conexao.Firedac.Interfaces,
  Model.Conexao.Configuracao.MySQL.Interfaces,
  Model.Imp.Configuracao.MySQL;

type
  TModelConexaoFiredacMySQL = class(TInterfacedObject, iConexao)
    private
      FConfiguracaoMySQL : iConfiguracaoMySQL;
      FConexao           : TFDConnection;
      FDriverMySQL       : TFDPhysMySQLDriverLink;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iConexao;

      function Conexao(Value : TFDConnection) : iConexao;      overload;
      function Conexao                        : TFDConnection; overload;
      function StartTransaction               : iConexao;
      function Commit                         : iConexao;
      function Rollback                       : iConexao;


      procedure ConfigurarMySQL;
  end;

implementation

{ TModelConexaoFiredacMySQL }

constructor TModelConexaoFiredacMySQL.Create;
begin
  FConfiguracaoMySQL := TConfiguracaoBasedados.New;
  ConfigurarMySQL;
end;

destructor TModelConexaoFiredacMySQL.Destroy;
begin
  FreeAndNil(FConexao);
  FreeAndNil(FDriverMySQL);
  inherited;
end;

class function TModelConexaoFiredacMySQL.New: iConexao;
begin
  Result := Self.Create;
end;

function TModelConexaoFiredacMySQL.StartTransaction: iConexao;
begin
  Result := Self;
  FConexao.StartTransaction;
end;

function TModelConexaoFiredacMySQL.Commit: iConexao;
begin
  Result := Self;
  FConexao.Commit;
end;

function TModelConexaoFiredacMySQL.Rollback: iConexao;
begin
  Result := Self;
  FConexao.Rollback;
end;

function TModelConexaoFiredacMySQL.Conexao(Value: TFDConnection): iConexao;
begin
  Result := Self;
  FConexao := Value;
end;

function TModelConexaoFiredacMySQL.Conexao: TFDConnection;
begin
  Result := FConexao;
end;

procedure TModelConexaoFiredacMySQL.ConfigurarMySQL;
begin
  FConexao := TFDConnection.Create(nil);
  FDriverMySQL := TFDPhysMySQLDriverLink.Create(nil);
  try
    FConexao.Params.Add('Server='+ FConfiguracaoMySQL.ServerHost);
    FConexao.Params.Add('Port=  '+ FConfiguracaoMySQL.Port);
    FConexao.Params.Database    := FConfiguracaoMySQL.Database;
    FConexao.Params.UserName    := FConfiguracaoMySQL.UserName;
    FConexao.Params.Password    := FConfiguracaoMySQL.Password;
    FConexao.Params.DriverID    := FConfiguracaoMySQL.DriverName;
    FConexao.Params.Add('utf8mb4');

    FDriverMySQL.VendorLib      := FConfiguracaoMySQL.VendorLib;
    FConexao.LoginPrompt        := False;
    FConexao.Connected;

  except
    on e: Exception do
    raise Exception.Create('Erro ao tentar se conectar com a base de dados: ' +e.Message);
  end;
end;

end.
