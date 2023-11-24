# Aula: Comunicação Síncrona

## Introdução
- Exploração da comunicação síncrona entre microsserviços.
- Comparação com a comunicação assíncrona.

## Características da Comunicação Síncrona
1. **Padrão HTTP (RESTful)**
   - Comunicação via requisições HTTP.
   - APIs expostas para inserção e consulta de recursos.

2. **gRPC**
   - Protocolo de Remote Procedure Call (RPC).
   - Baseado no HTTP2, oferece performance e segurança.
   - Utilizado para chamadas de função remota.

3. **Alternativas Personalizadas**
   - Possibilidade de criar protocolos personalizados.
   - Menos comum, mas viável em alguns casos.

## Desafios da Comunicação Síncrona
1. **Dependência Direta**
   - Problemas em um serviço afetam diretamente outros serviços.
   - Lenta resposta se um serviço estiver lento.

2. **Problemas de Performance**
   - Impacto na eficiência da aplicação.
   - Erros em um serviço refletem nos serviços consumidores.

3. **Não Ideal para Operações Demoradas ou Críticas**
   - Operações extensas podem tornar a abordagem ineficaz.
   - Não é adequada para situações críticas ou onde a recuperação de erros é vital.

## Próxima Aula: Comunicação Assíncrona
- Exploração da comunicação assíncrona entre microsserviços.
- Discussão sobre quando optar por comunicação síncrona ou assíncrona.
