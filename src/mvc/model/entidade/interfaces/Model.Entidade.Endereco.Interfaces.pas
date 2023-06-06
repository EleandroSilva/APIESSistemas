{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            In�cio do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.Entidade.Endereco.Interfaces;

interface

type
  iEntidadeEndereco<T> =  interface
    ['{47CC0B6E-D387-45D8-B4D9-389C7867FF68}']
    function Id(Value : Integer)        : iEntidadeEndereco<T>; overload;
    function Id                         : Integer;              overload;
    function IdPessoa(Value : Integer)  : iEntidadeEndereco<T>; overload;
    function IdPessoa                   : Integer;              overload;
    function Cep(Value : String)        : iEntidadeEndereco<T>; overload;
    function Cep                        : String;               overload;
    function Tipo(Value : String)       : iEntidadeEndereco<T>; overload;
    function Tipo                       : String;               overload;
    function Logradouro(Value : String) : iEntidadeEndereco<T>; overload;
    function Logradouro                 : String;               overload;
    function Numero(Value : String)     : iEntidadeEndereco<T>; overload;
    function Numero                     : String;               overload;
    function Bairro(Value : String)     : iEntidadeEndereco<T>; overload;
    function Bairro                     : String;               overload;
    function Municipio(Value : String)  : iEntidadeEndereco<T>; overload;
    function Municipio                  : String;               overload;
    function Estado(Value : String)     : iEntidadeEndereco<T>; overload;
    function Estado                     : String;               overload;
    function Complemento(Value : String): iEntidadeEndereco<T>; overload;
    function Complemento                : String;               overload;

    function &End : T;
  end;


implementation

end.
