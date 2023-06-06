{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            In�cio do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.DAO.Usuario.Interfaces;

interface

uses
  Data.DB,

  Model.Entidade.Usuario.Interfaces;

type
  iDAOUsuario = interface
    ['{98F33D04-9A99-4C56-8CE4-5C6988F5E35D}']
    function DataSet(DataSource : TDataSource) : iDAOUsuario; overload;
    function DataSet                           : TDataSet;    overload;
    function GetAll                            : iDAOUsuario;
    function GetbyId(Id : Variant)             : iDAOUsuario;
    function GetbyParams                       : iDAOUsuario;
    function Post                              : iDAOUsuario;
    function Put                               : iDAOUsuario;
    function Delete                            : iDAOUsuario;

    function This : iEntidadeUsuario<iDAOUsuario>;
  end;

implementation

end.
