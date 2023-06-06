unit Model.DAO.Contato.Interfaces;

interface

uses
  Data.DB,

  Model.Entidade.Contato.Interfaces;

type
  iDAOContato = interface
    ['{7BCC90F3-CCBC-49BA-A9B2-97B0CC478D67}']
    function DataSet(DataSource : TDataSource) : iDAOContato; overload;
    function DataSet                           : TDataSet;    overload;
    function GetAll                            : iDAOContato;
    function GetbyId(Id : Variant)             : iDAOContato;
    function GetbyParams                       : iDAOContato;
    function Post                              : iDAOContato;
    function Put                               : iDAOContato;
    function Delete                            : iDAOContato;

    function This : iEntidadeContato<iDAOContato>;
  end;

implementation

end.
