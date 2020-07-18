unit TesteObjetoConexao;

interface

uses
  DUnitX.TestFramework,
  System.SysUtils,
  Conexao;

type

  [ TestFixture ]
  TTestObjetoConexao = class( TObject )
  public
    [ SetUp ]
    procedure SetUp;

    [ TearDown ]
    procedure TearDown;

    [ Test ]
    procedure TestaObjetoCriado;
    [ Test ]
    procedure TestaExcecaoUsuarioVazio;
    [ Test ]
    procedure TestaExcecaoNomeBancoVazio;
    [ Test ]
    procedure TestaExcecaoSenhaVazia;
    [ Test ]
    procedure TestaExcecaoIpVazio;

    // procedure TestaGetConexaoMySql;

    // procedure TestaGetConexaoMySql;
  end;

implementation

{ TTestObjetoConexao }

var
  rInformacoesBanco: RInformacoesConexao;
  objConexao: ConexaoBanco;

const
  USUARIO   = 'Usu�rioBancoDados';
  SENHA     = 'SenhaBancoDados';
  BANCO     = 'Database';
  IP        = '127.0.0.1';
  MECANISMO = mcMySQL;

procedure TTestObjetoConexao.SetUp;
begin
  rInformacoesBanco.Usuario := USUARIO;
  rInformacoesBanco.NomeBancoDados := BANCO;
  rInformacoesBanco.Senha := SENHA;
  rInformacoesBanco.IPServidor := IP;
end;

procedure TTestObjetoConexao.TearDown;
begin
  objConexao := nil;
end;

procedure TTestObjetoConexao.TestaExcecaoIpVazio;
begin
  rInformacoesBanco.IPServidor := '';
  rInformacoesBanco.MecanismoBanco := MECANISMO;
  Assert.WillRaiseWithMessage(
    procedure
    begin
      objConexao := ConexaoBanco.Create( rInformacoesBanco );
    end
    ,
    EArgumentNilException,
    'Nenhum endere�o de servidor para conex�o foi informado',
    'Quando n�o houver endere�o de servidor informado � esperada uma exce��o EArgumentNilException' );
end;

procedure TTestObjetoConexao.TestaExcecaoNomeBancoVazio;
begin
  rInformacoesBanco.NomeBancoDados := '';
  rInformacoesBanco.MecanismoBanco := MECANISMO;
  Assert.WillRaiseWithMessage(
    procedure
    begin
      objConexao := ConexaoBanco.Create( rInformacoesBanco );
    end
    ,
    EArgumentNilException,
    'Nenhum banco de dados para conex�o foi informado',
    'Quando n�o houver nome do banco informado � esperada uma exce��o EArgumentNilException' );
end;

procedure TTestObjetoConexao.TestaExcecaoSenhaVazia;
begin
  rInformacoesBanco.Senha := '';
  rInformacoesBanco.MecanismoBanco := MECANISMO;
  Assert.WillRaiseWithMessage(
    procedure
    begin
      objConexao := ConexaoBanco.Create( rInformacoesBanco );
    end
    ,
    EArgumentNilException,
    'Nenhuma senha para conex�o foi informado',
    'Quando n�o houver senha informada � esperada uma exce��o EArgumentNilException' );
end;

procedure TTestObjetoConexao.TestaExcecaoUsuarioVazio;
begin
  rInformacoesBanco.Usuario := '';
  rInformacoesBanco.MecanismoBanco := MECANISMO;
  Assert.WillRaiseWithMessage(
    procedure
    begin
      objConexao := ConexaoBanco.Create( rInformacoesBanco );
    end
    ,
    EArgumentNilException,
    'Nenhum usu�rio para conex�o foi informado',
    'Quando n�o houver usu�rio informado � esperada uma exce��o EArgumentNilException' );
end;

procedure TTestObjetoConexao.TestaObjetoCriado;
begin
  rInformacoesBanco.MecanismoBanco := MECANISMO;

  Assert.WillNotRaise(
    procedure
    begin
      objConexao := ConexaoBanco.Create( rInformacoesBanco );
    end
    ,
    Exception,
    '� esperado que a cria��o de um objeto n�o retorne exce��es' );

  Assert.InheritsFrom(
    objConexao.ClassType,
    ConexaoBanco );
end;

initialization

TDUnitX.RegisterTestFixture( TTestObjetoConexao );

end.
