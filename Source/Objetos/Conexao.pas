unit Conexao;

interface

type
  TMecanismoConexao = ( mcSQLServer, mcPostgreSQL, mcMySQL, mcSQLite );

type
  RInformacoesConexao = record
    Usuario: string;
    Senha: string;
    NomeBancoDados: string;
    MecanismoBanco: TMecanismoConexao;
  end;

type
  ConexaoBanco = class( TObject )
    /// <summary>
    /// Cria o objeto com as informa��es de conex�o estabelecidas
    /// </summary>
    /// <param name="AInformacoesConexao">
    /// Um record do tipo <c>RInformacoesConexao</c> alimentado
    /// com todas as vari�veis necess�rias
    /// </param>
    /// <remarks>
    /// Se o par�metro for nulo a fun��o retorna uma <c>EArgumentNilException</c>
    /// Se algum field do AInformacoesConexao for inv�lido deve retornar
    /// uma <c>EArgumentException</c> com mensagem do par�metro vazio
    /// </remarks>
    constructor Create( AInformacoesConexao: RInformacoesConexao );
  private
    /// <summary>
    /// Retorna o driver utilizado para conectar no banco
    /// </summary>
    /// <param name="AMecanismo">
    /// Um mecanismo do tipo TMecanismoConexao para identificar o SGDB
    /// </param>
    /// <remarks>
    /// Se o par�metro <c>AMecanismo</c> for inv�lido a fun��o
    /// vai retornar um <c>EArgumentException</c>
    /// </remarks>
    /// <returns>
    /// Uma string com o nome da biblioteca de conex�o ao banco
    /// </returns>
    function fnGetDriverConexao( AMecanismo: TMecanismoConexao ): string;
  end;

implementation

uses System.SysUtils;

{ ConexaoBanco }

constructor ConexaoBanco.Create( AInformacoesConexao: RInformacoesConexao );
begin
  // Atribuir as informa��es de conex�o

end;

function ConexaoBanco.fnGetDriverConexao( AMecanismo
  : TMecanismoConexao ): string;
var
  sNomeDriver: string;
begin
  case AMecanismo of
    mcSQLServer:
      sNomeDriver := '';
    mcPostgreSQL:
      sNomeDriver := '';
    mcMySQL:
      sNomeDriver := '';
    mcSQLite:
      sNomeDriver := '';
  end;

  Result := sNomeDriver;
end;

initialization

end.
