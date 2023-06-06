{*******************************************************}
{                    API PDV - JSON                     }
{                      ES Sistemas                      }
{            In�cio do projeto 27/05/2023               }
{                 www.bemoreweb.com.br                  }
{                     (17)98169-5336                    }
{                        2003/2023                      }
{         Analista desenvolvedor (Eleandro Silva)       }
{*******************************************************}
unit Model.Imp.Entidade.Empresa;

interface

uses
  Model.Entidade.Empresa.Interfaces,
  Model.Entidade.Pessoa.Interfaces,
  Model.Entidade.Contato.Interfaces,
  Model.Entidade.Pessoa.Fisica.Interfaces,
  Model.Entidade.Pessoa.Juridica.Interfaces,
  Model.Entidade.Endereco.Interfaces,

  Model.Imp.Entidade.Pessoa,
  Model.Imp.Entidade.Contato,
  Model.Imp.Entidade.Pessoa.Fisica,
  Model.Imp.Entidade.Pessoa.Juridica,
  Model.Imp.Entidade.Endereco;
type
  TEntidadeEmpresa<T : iInterface> = class(TInterfacedObject, iEntidadeEmpresa<T>)
    private
      [weak]
      FParent         : T;
      FPessoa         : iEntidadePessoa<iEntidadeEmpresa<T>>;//inje��o de depend�ncia iEntidadePessoa
      FContato        : iEntidadeContato<iEntidadeEmpresa<T>>;//inje��o de depend�ncia iEntidadeContato
      FPessoaFisica   : iEntidadePessoaFisica<iEntidadeEmpresa<T>>;//inje��o de depend�ncia iEntidadePessoaFisica
      FPessoaJuridica : iEntidadePessoaJuridica<iEntidadeEmpresa<T>>;//inje��o de depend�ncia iEntidadePessoaJuridica
      FEndereco       : iEntidadeEndereco<iEntidadeEmpresa<T>>;//inje��o de depend�ncia iEntidadeEndereco

      FId             : Integer;
      FIdPessoa       : Integer;
    public
      constructor Create(Parent :T);
      destructor Destroy; override;
      class function New(Parent : T): iEntidadeEmpresa<T>;

      function Id(Value : Integer)            : iEntidadeEmpresa<T>; overload;
      function Id                             : Integer;          overload;
      function IdPessoa(Value : Integer)      : iEntidadeEmpresa<T>; overload;
      function IdPessoa                       : Integer;          overload;

      function Pessoa         : iEntidadePessoa<iEntidadeEmpresa<T>>;
      function Contato        : iEntidadeContato<iEntidadeEmpresa<T>>;
      function PessoaFisica   : iEntidadePessoaFisica<iEntidadeEmpresa<T>>;
      function PessoaJuridica : iEntidadePessoaJuridica<iEntidadeEmpresa<T>>;
      function Endereco       : iEntidadeEndereco<iEntidadeEmpresa<T>>;
      function &End           : T;
  end;


implementation

{ TEntidadeEmpresa }

constructor TEntidadeEmpresa<T>.Create(Parent: T);
begin
  FParent         := Parent;
  FPessoa         := TEntidadePessoa<iEntidadeEmpresa<T>>.New(Self);
  FContato        := TEntidadeContato<iEntidadeEmpresa<T>>.New(Self);
  FEndereco       := TEntidadeEndereco<iEntidadeEmpresa<T>>.New(Self);
  FPessoaJuridica := TEntidadePessoaJuridica<iEntidadeEmpresa<T>>.New(Self);
  FPessoaFisica   := TEntidadePessoaFisica<iEntidadeEmpresa<T>>.New(Self);
end;

class function TEntidadeEmpresa<T>.New(Parent : T): iEntidadeEmpresa<T>;
begin
  Result := Self.Create(Parent);
end;

function TEntidadeEmpresa<T>.&End: T;
begin
  Result := FParent;
end;

destructor TEntidadeEmpresa<T>.Destroy;
begin
  inherited;
end;

function TEntidadeEmpresa<T>.Id(Value: Integer): iEntidadeEmpresa<T>;
begin
  Result := Self;
  FID    := Value;
end;

function TEntidadeEmpresa<T>.Id: Integer;
begin
  Result := FId;
end;

function TEntidadeEmpresa<T>.IdPessoa(Value: Integer): iEntidadeEmpresa<T>;
begin
  Result := Self;
  FIdPessoa := Value;
end;

function TEntidadeEmpresa<T>.IdPessoa: Integer;
begin
  Result := FIdPessoa;
end;

function TEntidadeEmpresa<T>.Contato: iEntidadeContato<iEntidadeEmpresa<T>>;
begin
  Result := FContato;
end;

function TEntidadeEmpresa<T>.Endereco: iEntidadeEndereco<iEntidadeEmpresa<T>>;
begin
  Result := FEndereco;
end;

function TEntidadeEmpresa<T>.Pessoa: iEntidadePessoa<iEntidadeEmpresa<T>>;
begin
  Result := FPessoa;
end;

function TEntidadeEmpresa<T>.PessoaFisica: iEntidadePessoaFisica<iEntidadeEmpresa<T>>;
begin
  Result := FPessoaFisica;
end;

function TEntidadeEmpresa<T>.PessoaJuridica: iEntidadePessoaJuridica<iEntidadeEmpresa<T>>;
begin
  Result := FPessoaJuridica;
end;

end.
