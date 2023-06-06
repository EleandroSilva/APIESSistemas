{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            Início do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.Entidade.Usuario.Interfaces;

interface

uses
  Model.Entidade.Pessoa.Interfaces, Model.Entidade.Contato.Interfaces;

type
  iEntidadeUsuario<T> = interface
    ['{BB7F9D43-61C1-4D10-87AD-33127DCBDAA9}']
    function Id(Value : Integer)        : iEntidadeUsuario<T>; overload;
    function Id                         : Integer;             overload;
    function IdEmpresa(Value : Integer) : iEntidadeUsuario<T>; overload;
    function IdEmpresa                  : Integer;             overload;
    function Senha(Value : String)      : iEntidadeUsuario<T>; overload;
    function Senha                      : String;              overload;


    //Injeção de dependência
    function Pessoa         : iEntidadePessoa<iEntidadeUsuario<T>>;
    function Contato        : iEntidadeContato<iEntidadeUsuario<T>>;

    function &End : T;
  end;

implementation

end.
