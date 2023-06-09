{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            In�cio do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.Imp.Entidade.Pessoa.Juridica;

interface

uses
  Model.Entidade.Pessoa.Juridica.Interfaces;

type
 TEntidadePessoaJuridica<T : iInterface> = class(TInterfacedObject, iEntidadePessoaJuridica<T>)
   private
     [Weak]
     FParent   : T;
     FId       : Integer;
     FIdPessoa : Integer;
     FCNPJ     : String;
     FInscEst  : String;
   public
     constructor Create(Parent : T);
     destructor Destroy; override;
     class function New(Parent : T) : iEntidadePessoaJuridica<T>;

     function Id(Value : Integer)      : iEntidadePessoaJuridica<T>; overload;
     function Id                       : Integer;                    overload;
     function IdPessoa(Value : Integer): iEntidadePessoaJuridica<T>; overload;
     function IdPessoa                 : Integer;                    overload;
     function CNPJ(Value : String)     : iEntidadePessoaJuridica<T>; overload;
     function CNPJ                     : String;                     overload;
     function InscEst(Value : String)  : iEntidadePessoaJuridica<T>; overload;
     function InscEst                  : String;                     overload;

     function &End : T;
 end;

implementation

{ TEntidadePessoaJuridica }
constructor TEntidadePessoaJuridica<T>.Create(Parent : T);
begin
  FParent := Parent;
end;

class function TEntidadePessoaJuridica<T>.New(Parent : T) : iEntidadePessoaJuridica<T>;
begin
  Result := Self.Create(Parent);
end;

function TEntidadePessoaJuridica<T>.&End: T;
begin
  Result := FParent;
end;

destructor TEntidadePessoaJuridica<T>.Destroy;
begin
  inherited;
end;

function TEntidadePessoaJuridica<T>.Id(Value: Integer): iEntidadePessoaJuridica<T>;
begin
  Result := Self;
  FId    := Value;
end;

function TEntidadePessoaJuridica<T>.Id: Integer;
begin
  Result := FId;
end;

function TEntidadePessoaJuridica<T>.IdPessoa(Value: Integer): iEntidadePessoaJuridica<T>;
begin
  Result := Self;
  FIdPessoa := Value;
end;

function TEntidadePessoaJuridica<T>.IdPessoa : Integer;
begin
  Result := FIdPessoa;
end;

function TEntidadePessoaJuridica<T>.CNPJ(Value: String): iEntidadePessoaJuridica<T>;
begin
  Result := Self;
  FCNPJ := Value;
end;

function TEntidadePessoaJuridica<T>.CNPJ: String;
begin
  Result := FCNPJ;
end;

function TEntidadePessoaJuridica<T>.InscEst(Value: String): iEntidadePessoaJuridica<T>;
begin
  Result := Self;
  FInscEst := Value;
end;

function TEntidadePessoaJuridica<T>.InscEst: String;
begin
  Result := FInscEst;
end;

end.
