{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            Início do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.Entidade.Pessoa.Juridica.Interfaces;

interface

type
  iEntidadePessoaJuridica<T> = interface
    ['{99E4B8FC-09FF-446A-AA15-D43B1B3C80E1}']
    function Id(Value : Integer)      : iEntidadePessoaJuridica<T>; overload;
    function Id                       : Integer;                    overload;
    function IdPessoa(Value : Integer): iEntidadePessoaJuridica<T>; overload;
    function IdPessoa                 : Integer;                    overload;
    function CNPJ(Value : String)     : iEntidadePessoaJuridica<T>; overload;
    function CNPJ                     : String;                     overload;
    function InscEst(Value : String)  : iEntidadePessoaJuridica<T>; overload;
    function InscEst                  : String;                     overload;

    function &End : T;
  end;

implementation

end.
