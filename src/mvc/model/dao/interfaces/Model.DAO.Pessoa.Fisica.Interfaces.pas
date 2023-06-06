unit Model.DAO.Pessoa.Fisica.Interfaces;

interface

uses
  Data.DB,

  Model.Entidade.Pessoa.Fisica.Interfaces;

type
  iDAOPessoaFisica = interface
    ['{A4A9A5B6-632B-4833-AD75-165403747196}']
    function DataSet(DataSource : TDataSource) : iDAOPessoaFisica; overload;
    function DataSet                           : TDataSet;         overload;
    function GetAll                            : iDAOPessoaFisica;
    function GetbyId(Id : Variant)             : iDAOPessoaFisica;
    function GetbyParams                       : iDAOPessoaFisica;
    function Post                              : iDAOPessoaFisica;
    function Put                               : iDAOPessoaFisica;
    function Delete                            : iDAOPessoaFisica;

    function This : iEntidadePessoaFisica<iDAOPessoaFisica>;
  end;

implementation

end.
