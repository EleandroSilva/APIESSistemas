unit Model.DAO.Pessoa.Interfaces;

interface

uses
  Data.DB,

  Model.Entidade.Pessoa.Interfaces;
type
  iDAOPessoa = interface
    ['{050174A2-AB18-46D2-B2BB-161C15179CCD}']
    function DataSet(DataSource : TDataSource) : iDAOPessoa; overload;
    function DataSet                           : TDataSet;    overload;
    function GetAll                            : iDAOPessoa;
    function GetbyId(Id : Variant)             : iDAOPessoa;
    function GetbyParams                       : iDAOPessoa;
    function Post                              : iDAOPessoa;
    function Put                               : iDAOPessoa;
    function Delete                            : iDAOPessoa;

    function This : iEntidadePessoa<iDAOPessoa>;
  end;

implementation

end.
