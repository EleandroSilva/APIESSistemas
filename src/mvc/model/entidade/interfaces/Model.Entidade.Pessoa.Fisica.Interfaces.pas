{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            Início do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.Entidade.Pessoa.Fisica.Interfaces;

interface

type
  iEntidadePessoaFisica<T> = interface
    ['{130278CD-70E3-4971-87BD-3A7890949EEE}']
    function Id(Value : Integer)      : iEntidadePessoaFisica<T>; overload;
    function Id                       : Integer;                  overload;
    function IdPessoa(Value : Integer): iEntidadePessoaFisica<T>; overload;
    function IdPessoa                 : Integer;                  overload;
    function CPF(Value : String)      : iEntidadePessoaFisica<T>; overload;
    function CPF                      : String;                   overload;
    function RG(Value : String)       : iEntidadePessoaFisica<T>; overload;
    function RG                       : String;                   overload;

    function &End : T;
  end;

implementation

end.
