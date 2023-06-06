{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            In�cio do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}

program APICadastros;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.BasicAuthentication,
  Horse.Jhonson,
  Horse.Compression,
  Horse.Paginate,
  Horse.Cors,
  Horse.HandleException,
  Horse.OctetStream,
  Horse.GBSwagger,
  Controller.Interfaces in 'src\mvc\controller\interfaces\Controller.Interfaces.pas',
  Imp.Controller.Empresa in 'src\mvc\controller\imp\Imp.Controller.Empresa.pas',
  Imp.Controller.Usuario in 'src\mvc\controller\imp\Imp.Controller.Usuario.pas',
  Imp.Controller in 'src\mvc\controller\imp\Imp.Controller.pas',
  Model.Conexao.Configuracao.MySQL.Interfaces in 'src\mvc\model\conexao\interfaces\Model.Conexao.Configuracao.MySQL.Interfaces.pas',
  Model.Conexao.Firedac.Interfaces in 'src\mvc\model\conexao\interfaces\Model.Conexao.Firedac.Interfaces.pas',
  Model.Query in 'src\mvc\model\conexao\interfaces\Model.Query.pas',
  Model.Imp.Conexao.Firedac.MySQL in 'src\mvc\model\conexao\imp\Model.Imp.Conexao.Firedac.MySQL.pas',
  Model.Imp.Configuracao.MySQL in 'src\mvc\model\conexao\imp\Model.Imp.Configuracao.MySQL.pas',
  Model.Imp.Query in 'src\mvc\model\conexao\imp\Model.Imp.Query.pas',
  Model.DAO.Usuario.Interfaces in 'src\mvc\model\dao\interfaces\Model.DAO.Usuario.Interfaces.pas',
  Model.DAO.Imp.Empresa in 'src\mvc\model\dao\imp\Model.DAO.Imp.Empresa.pas',
  Model.DAO.Imp.Usuario in 'src\mvc\model\dao\imp\Model.DAO.Imp.Usuario.pas',
  Model.Factory.Entidade.Interfaces in 'src\mvc\model\entidade\factory\interfaces\Model.Factory.Entidade.Interfaces.pas',
  Model.Imp.Factory.Entidade in 'src\mvc\model\entidade\factory\imp\Model.Imp.Factory.Entidade.pas',
  Model.Entidade.Empresa.Interfaces in 'src\mvc\model\entidade\interfaces\Model.Entidade.Empresa.Interfaces.pas',
  Model.Entidade.Usuario.Interfaces in 'src\mvc\model\entidade\interfaces\Model.Entidade.Usuario.Interfaces.pas',
  Model.Imp.Entidade.Empresa in 'src\mvc\model\entidade\imp\Model.Imp.Entidade.Empresa.pas',
  Model.Imp.Entidade.Usuario in 'src\mvc\model\entidade\imp\Model.Imp.Entidade.Usuario.pas',
  Uteis.Tratar.Mensagens in 'src\mvc\uteis\Uteis.Tratar.Mensagens.pas',
  Model.imp.Swagger.Empresa in 'src\mvc\model\Swagger\Model.imp.Swagger.Empresa.pas',
  Model.imp.Swagger.Usuario in 'src\mvc\model\Swagger\Model.imp.Swagger.Usuario.pas',
  Model.Swagger.Tabela.Empresa in 'src\mvc\model\Swagger\tabelas\Model.Swagger.Tabela.Empresa.pas',
  Model.Swagger.Tabela.Usuario in 'src\mvc\model\Swagger\tabelas\Model.Swagger.Tabela.Usuario.pas',
  Uteis in 'src\mvc\uteis\Uteis.pas',
  Model.Entidade.Pessoa.Interfaces in 'src\mvc\model\entidade\interfaces\Model.Entidade.Pessoa.Interfaces.pas',
  Model.Imp.Entidade.Pessoa in 'src\mvc\model\entidade\imp\Model.Imp.Entidade.Pessoa.pas',
  Model.DAO.Imp.Pessoa in 'src\mvc\model\dao\imp\Model.DAO.Imp.Pessoa.pas',
  Model.Entidade.Contato.Interfaces in 'src\mvc\model\entidade\interfaces\Model.Entidade.Contato.Interfaces.pas',
  Model.Imp.Entidade.Contato in 'src\mvc\model\entidade\imp\Model.Imp.Entidade.Contato.pas',
  Model.DAO.Imp.Contato in 'src\mvc\model\dao\imp\Model.DAO.Imp.Contato.pas',
  Model.Entidade.Endereco.Interfaces in 'src\mvc\model\entidade\interfaces\Model.Entidade.Endereco.Interfaces.pas',
  Model.Entidade.Pessoa.Fisica.Interfaces in 'src\mvc\model\entidade\interfaces\Model.Entidade.Pessoa.Fisica.Interfaces.pas',
  Model.Imp.Entidade.Pessoa.Fisica in 'src\mvc\model\entidade\imp\Model.Imp.Entidade.Pessoa.Fisica.pas',
  Model.Imp.Entidade.Endereco in 'src\mvc\model\entidade\imp\Model.Imp.Entidade.Endereco.pas',
  Model.Entidade.Pessoa.Juridica.Interfaces in 'src\mvc\model\entidade\interfaces\Model.Entidade.Pessoa.Juridica.Interfaces.pas',
  Model.Imp.Entidade.Pessoa.Juridica in 'src\mvc\model\entidade\imp\Model.Imp.Entidade.Pessoa.Juridica.pas',
  Model.DAO.Endereco.Interfaces in 'src\mvc\model\dao\interfaces\Model.DAO.Endereco.Interfaces.pas',
  Model.DAO.Imp.Endereco in 'src\mvc\model\dao\imp\Model.DAO.Imp.Endereco.pas',
  Model.DAO.Pessoa.Juridica.Interfaces in 'src\mvc\model\dao\interfaces\Model.DAO.Pessoa.Juridica.Interfaces.pas',
  Model.DAO.Imp.Pessoa.Juridica in 'src\mvc\model\dao\imp\Model.DAO.Imp.Pessoa.Juridica.pas',
  Model.DAO.Pessoa.Fisica.Interfaces in 'src\mvc\model\dao\interfaces\Model.DAO.Pessoa.Fisica.Interfaces.pas',
  Model.DAO.Imp.Pessoa.Fisica in 'src\mvc\model\dao\imp\Model.DAO.Imp.Pessoa.Fisica.pas',
  Model.DAO.Contato.Interfaces in 'src\mvc\model\dao\interfaces\Model.DAO.Contato.Interfaces.pas',
  Model.DAO.Pessoa.Interfaces in 'src\mvc\model\dao\interfaces\Model.DAO.Pessoa.Interfaces.pas',
  Model.DAO.Empresa.Interfaces in 'src\mvc\model\dao\interfaces\Model.DAO.Empresa.Interfaces.pas';

begin
  ReportMemoryLeaksOnShutdown := True;

   THorse
       .Use(Compression())
       .Use(Jhonson)
       .Use(Paginate)
       .Use(Cors)
       .Use(OctetStream)
       .Use(HorseSwagger)
       .Use(HandleException);

  {
  THorse.Use(HorseBasicAuthentication(
  function(const AUsername, APassword: string): Boolean
  begin
    // Here inside you can access your database and validate if username and password are valid
    Result := AUsername.Equals('eleandro') and APassword.Equals('silva');
  end));
  }
  TControllerUsuario.Registry;
  TControllerEmpresa.Registry;

  //Documenta��es
  TSwaggerUsuario.SwaggerUsuario;
  TSwaggerEmpresa.SwaggerEmpresa;



  THorse.Listen(9000,
  procedure
  begin
    WriteLn(Format('Servidor rodando na porta %d',[THorse.Port]));
    WriteLn('Recebendo requests');
  end);
end.
