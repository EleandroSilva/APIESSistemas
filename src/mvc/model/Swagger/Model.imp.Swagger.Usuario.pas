{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            In�cio do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.imp.Swagger.Usuario;

interface

uses
  Horse.GBSwagger,
  Model.Swagger.Tabela.Usuario;

type
  TSwaggerUsuario = class
   class procedure SwaggerUsuario;

  end;

implementation

{ TSwaggerUsuario }

class procedure TSwaggerUsuario.SwaggerUsuario;
begin
  //http://localhost:9000/swagger/doc/html   URL
  Swagger
    .Info
      .Title('API ESS cadastros')
      .Description('Documenta��o da API ESS cadastro usu�rios')
      .Contact
        .Name('Eleandro Silva')
        .Email('eleandrosilva3107@gmail.com')
        .URL('https://www.bemoreweb.com.br')
      .&End
    .&End
    .BasePath('ess')
    .Path('usuarios')
      .Tag('Usu�rios')
      .GET('Validar usu�rios (enviar para API(email e senha))')
        .AddParamQuery('email', 'email').&End
        .AddParamQuery('senha', 'senha').&End
        .AddResponse(200, 'Lista de usu�rios').Schema(TUsuario).IsArray(True).&End
      .&End
      .POST('Criar um novo usu�rio')
        .AddParamBody('Dados do usu�rio').Required(True).Schema(TUsuario).&End
        .AddResponse(201).Schema(TUsuario).&End
        .AddResponse(400).&End
      .&End
    .&End
    .Path('usuarios/{id}')
      .Tag('Usu�rios')
      .GET('Obter os dados de um usu�rio espec�fico')
        .AddParamPath('id', 'Id').&End
        .AddResponse(200, 'Dados do usu�rio').Schema(TUsuario).&End
        .AddResponse(404).&End
      .&End
      .PUT('Alterar os dados de um usu�rio espec�fico')
        .AddParamPath('id', 'Id').&End
        .AddParamBody('Dados do usu�rio').Required(True).Schema(TUsuario).&End
        .AddResponse(204).&End
        .AddResponse(400).&End
        .AddResponse(404).&End
      .&End
      .DELETE('Excluir usu�rio')
        .AddParamPath('id', 'Id').&End
        .AddResponse(204).&End
        .AddResponse(400).&End
        .AddResponse(404).&End
      .&End
    .&End
  .&End;


end;

end.
