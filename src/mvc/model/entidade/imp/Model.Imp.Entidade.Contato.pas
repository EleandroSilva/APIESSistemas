{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            In�cio do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.Imp.Entidade.Contato;

interface

uses
  Model.Entidade.Contato.Interfaces;

type
  TEntidadeContato<T : iInterface> = class(TInterfacedObject, iEntidadeContato<T>)
    private
      [weak]
      FParent   : T;
      FId       : Integer;
      FIdPessoa : Integer;
      FEmail    : String;
      FDD       : String;
      FTelefone : String;
      FTipo     : String;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T): iEntidadeContato<T>;

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

{ TEntidadeContato }

constructor TEntidadeContato<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

class function TEntidadeContato<T>.New(Parent: T): iEntidadeContato<T>;
begin
  Result := Self.Create(Parent);
end;

function TEntidadeContato<T>.&End: T;
begin
  Result := FParent;
end;

destructor TEntidadeContato<T>.Destroy;
begin
  //
  inherited;
end;

function TEntidadeContato<T>.Id(Value: Integer): iEntidadeContato<T>;
begin
  Result := Self;
  FId    := Value;
end;

function TEntidadeContato<T>.Id: Integer;
begin
  Result := FId;
end;

function TEntidadeContato<T>.IdPessoa(Value: Integer): iEntidadeContato<T>;
begin
  Result := Self;
  FIdPessoa := Value;
end;

function TEntidadeContato<T>.IdPessoa: Integer;
begin
  Result := FIdPessoa;
end;

function TEntidadeContato<T>.Email(Value: String): iEntidadeContato<T>;
begin
  Result := Self;
  FEmail := Value;
end;

function TEntidadeContato<T>.Email: String;
begin
  Result := FEMail;
end;

function TEntidadeContato<T>.DD(Value: String): iEntidadeContato<T>;
begin
  Result := Self;
  FDD    := Value;
end;

function TEntidadeContato<T>.DD: String;
begin
  Result := FDD;
end;

function TEntidadeContato<T>.Telefone(Value: String): iEntidadeContato<T>;
begin
  Result := Self;
  FTelefone := Value;
end;

function TEntidadeContato<T>.Telefone: String;
begin
  Result := FTelefone;
end;

function TEntidadeContato<T>.Tipo(Value: String): iEntidadeContato<T>;
begin
  Result := Self;
  FTipo  := Value;
end;

function TEntidadeContato<T>.Tipo: String;
begin
  Result := FTipo;
end;

end.
