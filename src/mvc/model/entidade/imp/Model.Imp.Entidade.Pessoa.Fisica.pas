{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            Início do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.Imp.Entidade.Pessoa.Fisica;

interface

uses
  Model.Entidade.Pessoa.Fisica.Interfaces;

type
  TEntidadePessoaFisica<T : iInterface>= class(TInterfacedObject, iEntidadePessoaFisica<T>)
    private
      [Weak]
      FParent   : T;
      FId       : Integer;
      FIdPessoa : Integer;
      FCPF      : String;
      FRG       : String;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iEntidadePessoaFisica<T>;

      function Id(Value : Integer)      : iEntidadePessoaFisica<T>; overload;
      function Id                       : Integer;                  overload;
      function IdPessoa(Value : Integer): iEntidadePessoaFisica<T>; overload;
      function IdPessoa                 : Integer;                  overload;
      function CPF(Value : String)      : iEntidadePessoaFisica<T>; overload;
      function CPF                      : String;                   overload;
      function RG(Value : String)       : iEntidadePessoaFisica<T>; overload;
      function RG                       : String;                   overload;

      function &End : T;
  end;

implementation

uses
  Model.Imp.Entidade.Endereco;

{ TPessoaFisica }

constructor TEntidadePessoaFisica<T>.Create(Parent : T);
begin
  FParent := Parent;
end;

class function TEntidadePessoaFisica<T>.New(Parent : T) : iEntidadePessoaFisica<T>;
begin
  Result := Self.Create(Parent);
end;

function TEntidadePessoaFisica<T>.&End: T;
begin
  Result := FParent;
end;

destructor TEntidadePessoaFisica<T>.Destroy;
begin
  inherited;
end;

function TEntidadePessoaFisica<T>.Id(Value: Integer): iEntidadePessoaFisica<T>;
begin
  Result := Self;
  FId    := Value;
end;

function TEntidadePessoaFisica<T>.Id: Integer;
begin
  Result := FId;
end;

function TEntidadePessoaFisica<T>.IdPessoa(Value: Integer): iEntidadePessoaFisica<T>;
begin
  Result := Self;
  FIdPessoa := Value;
end;

function TEntidadePessoaFisica<T>.IdPessoa: Integer;
begin
  Result := FIdPessoa;
end;

function TEntidadePessoaFisica<T>.CPF(Value: String): iEntidadePessoaFisica<T>;
begin
  Result := Self;
  FCPF := Value;
end;

function TEntidadePessoaFisica<T>.CPF: String;
begin
  Result := FCPF;
end;

function TEntidadePessoaFisica<T>.RG(Value: String): iEntidadePessoaFisica<T>;
begin
  Result := Self;
  FRG := Value;
end;

function TEntidadePessoaFisica<T>.RG: String;
begin
  Result := FRG;
end;

end.
