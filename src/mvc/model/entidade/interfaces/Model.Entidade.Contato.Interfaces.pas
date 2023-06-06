{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            Início do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.Entidade.Contato.Interfaces;

interface

type
  iEntidadeContato<T> = interface
    ['{192E7E0C-030F-41A8-9D49-63A8D4682736}']
    function Id(Value : Integer)       : iEntidadeContato<T>; overload;
    function Id                        : Integer;          overload;
    function IdPessoa(Value : Integer) : iEntidadeContato<T>; overload;
    function IdPessoa                  : Integer;          overload;
    function Email(Value : String)     : iEntidadeContato<T>; overload;
    function Email                     : String;           overload;
    function DD(Value : String)        : iEntidadeContato<T>; overload;
    function DD                        : String;           overload;
    function Telefone(Value : String)  : iEntidadeContato<T>; overload;
    function Telefone                  : String;           overload;
    function Tipo(Value : String)      : iEntidadeContato<T>; overload;
    function Tipo                      : String;           overload;

    function &End : T;
  end;


implementation

end.
