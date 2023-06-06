unit Model.DAO.Pessoa.Juridica.Interfaces;

interface

uses
  Data.DB,

  Model.Entidade.Pessoa.Juridica.Interfaces;

type
  iDAOPessoaJuridica = interface
    ['{A4A9A5B6-632B-4833-AD75-165403747196}']
    function DataSet(DataSource : TDataSource) : iDAOPessoaJuridica; overload;
    function DataSet                           : TDataSet;     overload;
    function GetAll                            : iDAOPessoaJuridica;
    function GetbyId(Id : Variant)             : iDAOPessoaJuridica;
    function GetbyParams                       : iDAOPessoaJuridica;
    function Post                              : iDAOPessoaJuridica;
    function Put                               : iDAOPessoaJuridica;
    function Delete                            : iDAOPessoaJuridica;

    function This : iEntidadePessoaJuridica<iDAOPessoaJuridica>;
  end;

implementation

end.
