{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            In�cio do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.Imp.Entidade.Usuario;

interface

uses
  System.SysUtils,
  System.Classes,

  Model.Entidade.Usuario.Interfaces,
  Model.Entidade.Pessoa.Interfaces,
  Model.Entidade.Contato.Interfaces,

  Model.Imp.Entidade.Pessoa,
  Model.Imp.Entidade.Contato;

type
  TEntidadeUsuario<T : iInterface> = class(TInterfacedObject, iEntidadeUsuario<T>)
    private
      [weak]
      FParent    : T;
      FPessoa    : iEntidadePessoa<iEntidadeUsuario<T>>;//inje��o de depend�ncia iEntidadePessoa
      FContato   : iEntidadeContato<iEntidadeUsuario<T>>;//inje��o de depend�ncia iEntidadeContato
      FId        : Integer;
      FIdEmpresa : Integer;
      FSenha     : String;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T): iEntidadeUsuario<T>;

      function Id(Value : Integer)        : iEntidadeUsuario<T>; overload;
      function Id                         : Integer;             overload;
      function IdEmpresa(Value : Integer) : iEntidadeUsuario<T>; overload;
      function IdEmpresa                  : Integer;             overload;
      function Senha(Value : String)      : iEntidadeUsuario<T>; overload;
      function Senha                      : String;              overload;

      //Inje��o de depend�ncia
      function Pessoa         : iEntidadePessoa<iEntidadeUsuario<T>>;
      function Contato        : iEntidadeContato<iEntidadeUsuario<T>>;

      function &End : T;
  end;


implementation

{ TEntidadeUsuario }

constructor TEntidadeUsuario<T>.Create(Parent : T);
begin
  FParent  := Parent;
  FPessoa  := TEntidadePessoa<iEntidadeUsuario<T>>.New(Self);
  FContato := TEntidadeContato<iEntidadeUsuario<T>>.New(Self);
end;

class function TEntidadeUsuario<T>.New(Parent : T): iEntidadeUsuario<T>;
begin
  Result := Self.Create(Parent);
end;

function TEntidadeUsuario<T>.&End: T;
begin
  Result := FParent;
end;

destructor TEntidadeUsuario<T>.Destroy;
begin
  inherited;
end;

function TEntidadeUsuario<T>.Id(Value: Integer): iEntidadeUsuario<T>;
begin
  Result := Self;
  FId := Value;
end;

function TEntidadeUsuario<T>.Id: Integer;
begin
  Result := FId;
end;

function TEntidadeUsuario<T>.IdEmpresa(Value: Integer): iEntidadeUsuario<T>;
begin
  Result := Self;
  FIdEmpresa := Value;
end;

function TEntidadeUsuario<T>.IdEmpresa: Integer;
begin
  Result := FIdEmpresa;
end;

function TEntidadeUsuario<T>.Senha(Value: String): iEntidadeUsuario<T>;
begin
  Result := Self;
  FSenha := Value;
end;

function TEntidadeUsuario<T>.Senha: String;
begin
  Result := FSenha;
end;

function TEntidadeUsuario<T>.Pessoa: iEntidadePessoa<iEntidadeUsuario<T>>;
begin
  Result := FPessoa;
end;

function TEntidadeUsuario<T>.Contato: iEntidadeContato<iEntidadeUsuario<T>>;
begin
  Result := FContato;
end;

end.
