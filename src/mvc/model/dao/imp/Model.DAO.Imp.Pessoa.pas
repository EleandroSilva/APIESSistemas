{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            Início do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.DAO.Imp.Pessoa;

interface

uses
  System.SysUtils,

  Data.DB,

  Uteis.Tratar.Mensagens,
  Uteis,

  Model.Conexao.Firedac.Interfaces,
  Model.Imp.Conexao.Firedac.MySQL,
  Model.Query,
  Model.Imp.Query,

  Model.Imp.Entidade.Pessoa,
  Model.Entidade.Pessoa.Interfaces,
  Model.DAO.Pessoa.Interfaces;
type
  TDAOPessoa = class(TInterfacedObject, iDAOPessoa)
  private
    FPessoa  : iEntidadePessoa<iDAOPessoa>;
    FConexao : iConexao;
    FDataSet : TDataSet;
    FQuery   : iQuery;
    FMSG     : TMensagens;
   const
      FSQL=('select * from pessoa');
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iDAOPessoa;

    function DataSet(DataSource : TDataSource) : iDAOPessoa; overload;
    function DataSet                           : TDataSet;   overload;
    function GetAll                            : iDAOPessoa;
    function GetbyId(Id : Variant)             : iDAOPessoa;
    function GetbyParams                       : iDAOPessoa;
    function Post                              : iDAOPessoa;
    function Put                               : iDAOPessoa;
    function Delete                            : iDAOPessoa;

    function This : iEntidadePessoa<iDAOPessoa>;
  end;

implementation

{ TDAOPessoa }

constructor TDAOPessoa.Create;
begin
  FPessoa  := TEntidadePessoa<iDAOPessoa>.New(Self);
  FConexao := TModelConexaoFiredacMySQL.New;
  FQuery   := TQuery.New;
end;

class function TDAOPessoa.New: iDAOPessoa;
begin
  Result := Self.Create;
end;

function TDAOPessoa.This: iEntidadePessoa<iDAOPessoa>;
begin
  Result := FPessoa;
end;

destructor TDAOPessoa.Destroy;
begin
  inherited;
end;

function TDAOPessoa.DataSet(DataSource: TDataSource): iDAOPessoa;
begin
  Result := Self;
  if not Assigned(FDataset) then
    DataSource.DataSet := FQuery.DataSet
  else
    DataSource.DataSet := FDataSet;
end;

function TDAOPessoa.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

function TDAOPessoa.GetAll: iDAOPessoa;
begin
  Result := Self;
  try
    try
      FDataSet := FQuery
                    .SQL(FSQL)
                    .Open
                  .DataSet;
    except
     raise Exception.Create(FMSG.MSGerroGet);
    end;
  finally
    //Criar MSG
  end;
end;

function TDAOPessoa.GetbyId(Id: Variant): iDAOPessoa;
begin
  Result := Self;
  try
    try
      FDataSet := FQuery
                    .SQL(FSQL+' where Id=:Id')
                    .Params('Id', Id)
                    .Open
                  .DataSet;
    except
      raise Exception.Create(FMSG.MSGerroGet);
    end;
  finally
    //Criar MSG
  end;
end;

function TDAOPessoa.GetbyParams: iDAOPessoa;
begin
  Result := Self;
  try
    try
      FDataSet := FQuery
                    .SQL(FSQL)
                    .Open
                  .DataSet;
    except
      raise Exception.Create(FMSG.MSGerroGet);
    end;
  finally
   //Criar MSG
  end;
end;

function TDAOPessoa.Post: iDAOPessoa;
const
  LSQL=('insert into pessoa('+
                             'nome, '+
                             'sobrenome, '+
                             'tipo, '+
                             'ativo '+
                           ')'+
                             ' values '+
                           '('+
                             ':nome, '+
                             ':sobrenome, '+
                             ':tipo, '+
                             ':ativo '+
                            ')'
       );
begin
  Result := Self;
  FConexao.StartTransaction;
  try
    try
      FQuery
        .SQL(LSQL)
          .Params('nome'            , FPessoa.Nome)
          .Params('sobrenome'       , FPessoa.SobreNome)
          .Params('tipo'            , FPessoa.Tipo)
          .Params('ativo'           , FPessoa.Ativo)
        .ExecSQL;
    except
      FConexao.Rollback;
      raise Exception.Create(FMSG.MSGerroPost);
    end;
  finally
    FConexao.Commit;
    FDataSet := FQuery
                    .SQL('select LAST_INSERT_ID () as id')
                    .Open
                    .DataSet;
    FPessoa.Id(FDataSet.FieldByName('id').AsInteger);
   end;
end;

function TDAOPessoa.Put: iDAOPessoa;
const
  LSQL=('update pessoa set '+
        'nome=:nome, '+
        'sobrenome=:sobrenome, '+
        'tipo=:tipo, '+
        'ativo=:ativo '+
        'where id=:id '
       );
begin
  Result := Self;

  FConexao.StartTransaction;
  try
    try
      FQuery
        .SQL(LSQL)
          .Params('id'              , FPessoa.Id)
          .Params('nome'            , FPessoa.Nome)
          .Params('sobrenome'       , FPessoa.SobreNome)
          .Params('tipo'            , FPessoa.Tipo)
          .Params('ativo'           , FPessoa.Ativo)
        .ExecSQL;
    except
      FConexao.Rollback;
      raise Exception.Create(FMSG.MSGerroPut);
    end;
  finally
    FConexao.Commit;
  end;
end;

function TDAOPessoa.Delete: iDAOPessoa;
const
  LSQL=('delete from pessoa where id=:id ');
begin
  Result := self;
  FConexao.StartTransaction;
 try
  try
    FQuery.SQL(LSQL)
            .Params('id', FPessoa.Id)
          .ExecSQL;
  except
    FConexao.Rollback;
    raise Exception.Create(FMSG.MSGerroDelete);
  end;
 finally
   FConexao.Commit;
 end;

end;


end.
