{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            In�cio do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.Entidade.Empresa.Interfaces;

interface

uses
  Model.Entidade.Contato.Interfaces,
  Model.Entidade.Pessoa.Interfaces,
  Model.Entidade.Pessoa.Fisica.Interfaces,
  Model.Entidade.Pessoa.Juridica.Interfaces,
  Model.Entidade.Endereco.Interfaces;
type
  iEntidadeEmpresa<T> = interface
    ['{CB016380-5E48-4779-A5AF-20F4077991ED}']
    function Id(Value : Integer)             : iEntidadeEmpresa<T>; overload;
    function Id                              : Integer;             overload;
    function IdPessoa(Value : Integer)       : iEntidadeEmpresa<T>; overload;
    function IdPessoa                        : Integer;             overload;

    //Inje��o de depend�ncia
    function Pessoa         : iEntidadePessoa<iEntidadeEmpresa<T>>;
    function Contato        : iEntidadeContato<iEntidadeEmpresa<T>>;
    function PessoaFisica   : iEntidadePessoaFisica<iEntidadeEmpresa<T>>;
    function PessoaJuridica : iEntidadePessoaJuridica<iEntidadeEmpresa<T>>;
    function Endereco       : iEntidadeEndereco<iEntidadeEmpresa<T>>;

    function &End : T;
  end;

implementation

end.
