unit Conexao;

interface

uses FireDAC.Comp.Client, FireDAC.Stan.Def, System.Classes, Types.Conexao;

type
  ConexaoBanco = class( TFDConnection )
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
    constructor Create( AInformacoesConexao: RInformacoesConexao ); reintroduce;
  private
    { **
      TODO -oAPG: Escrever rotina para retornar o objeto FireDAC conectado ao banco
      ** }
    { **
      TODO -oAPG: Escrever rotina para criar o objeto FireDAC com as informa��es do Create
      ** }
    { **
      TODO -oAPG: Escrever rotina para gerar SQL dos dados (CRUD completo)
      ** }
      
    { **
      TODO -oAPG: Escrever rotina para finalizar a conexao com o objeto durante o Destroy
      ** }

    { TODO -oAPG: Incluir documenta��o dos m�todos j� desenvolvidos }
    procedure prRetornarExcecao( AMessage: string );
    procedure prVerificaParametrosVazios( AInformacoesConexao
      : RInformacoesConexao );
  end;

implementation

uses System.SysUtils;

{ ConexaoBanco }

constructor ConexaoBanco.Create( AInformacoesConexao: RInformacoesConexao );
begin
  prVerificaParametrosVazios( AInformacoesConexao );
end;

procedure ConexaoBanco.prRetornarExcecao( AMessage: string );
begin
  raise EArgumentNilException.Create( AMessage );
end;

procedure ConexaoBanco.prVerificaParametrosVazios( AInformacoesConexao
  : RInformacoesConexao );
begin
  if AInformacoesConexao.Usuario.IsEmpty then
  begin
    prRetornarExcecao( 'Nenhum usu�rio para conex�o foi informado' );
  end;
  if AInformacoesConexao.Senha.IsEmpty then
  begin
    prRetornarExcecao( 'Nenhuma senha para conex�o foi informado' );
  end;
  if AInformacoesConexao.NomeBancoDados.IsEmpty then
  begin
    prRetornarExcecao( 'Nenhum banco de dados para conex�o foi informado' );
  end;
  if AInformacoesConexao.IPServidor.IsEmpty then
  begin
    prRetornarExcecao
      ( 'Nenhum endere�o de servidor para conex�o foi informado' );
  end;
end;

initialization

end.
