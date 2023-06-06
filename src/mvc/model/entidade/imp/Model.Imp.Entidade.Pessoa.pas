{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            Início do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.Imp.Entidade.Pessoa;

interface

uses
  Model.Entidade.Pessoa.Interfaces;
type
  TEntidadePessoa<T : iInterface> = class(TInterfacedObject, iEntidadePessoa<T>)
    private
      [weak]
      FParent    : T;
      FId        : Integer;
      FNome      : String;
      FSobreNome : String;
      FTipo      : String;
      FAtivo     : Integer;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T): iEntidadePessoa<T>;

      function Id(Value : Integer)       : iEntidadePessoa<T>; overload;
      function Id                        : Integer;            overload;
      function Nome(Value : String)      : iEntidadePessoa<T>; overload;
      function Nome                      : String;             overload;
      function SobreNome(Value : String) : iEntidadePessoa<T>; overload;
      function SobreNome                 : String;             overload;
      function Tipo(Value : String)      : iEntidadePessoa<T>; overload;
      function Tipo                      : String;             overload;
      function Ativo(Value : Integer)    : iEntidadePessoa<T>; overload;
      function Ativo                     : Integer;            overload;

      function &End : T;
  end;

implementation

constructor TEntidadePessoa<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

class function TEntidadePessoa<T>.New(Parent: T): iEntidadePessoa<T>;
begin
  Result := Self.Create(Parent);
end;

function TEntidadePessoa<T>.&End: T;
begin
  Result := FParent;
end;

destructor TEntidadePessoa<T>.Destroy;
begin
  inherited;
end;

function TEntidadePessoa<T>.Id(Value: Integer): iEntidadePessoa<T>;
begin
  Result := Self;
  FId    := Value;
end;

function TEntidadePessoa<T>.Id: Integer;
begin
  Result := FId;
end;

function TEntidadePessoa<T>.Nome(Value: String): iEntidadePessoa<T>;
begin
  Result := Self;
  FNome  := Value;
end;

function TEntidadePessoa<T>.Nome: String;
begin
  Result := FNome;
end;

function TEntidadePessoa<T>.SobreNome(Value: String): iEntidadePessoa<T>;
begin
  Result := Self;
  FSobreNome := Value;
end;

function TEntidadePessoa<T>.SobreNome: String;
begin
  Result := FSobreNome;
end;

function TEntidadePessoa<T>.Tipo(Value: String): iEntidadePessoa<T>;
begin
  Result := Self;
  FTipo  := Value;
end;

function TEntidadePessoa<T>.Tipo: String;
begin
  Result := FTipo;
end;

function TEntidadePessoa<T>.Ativo(Value: Integer): iEntidadePessoa<T>;
begin
  Result := Self;
  FAtivo := Value;
end;

function TEntidadePessoa<T>.Ativo: Integer;
begin
  Result := FAtivo;
end;

end.
