{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            Início do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.Entidade.Pessoa.Interfaces;

interface

type
  iEntidadePessoa<T> = interface
    ['{F458FA3F-20AC-40A1-9689-EB97CA88357E}']
    function Id(Value : Integer)             : iEntidadePessoa<T>; overload;
    function Id                              : Integer;            overload;
    function Nome(Value : String)            : iEntidadePessoa<T>; overload;
    function Nome                            : String;             overload;
    function SobreNome(Value : String)       : iEntidadePessoa<T>; overload;
    function SobreNome                       : String;             overload;
    function Tipo(Value : String)            : iEntidadePessoa<T>; overload;
    function Tipo                            : String;             overload;
    function Ativo(Value : Integer)          : iEntidadePessoa<T>; overload;
    function Ativo                           : Integer;            overload;

    function &End : T;
  end;

implementation

end.
