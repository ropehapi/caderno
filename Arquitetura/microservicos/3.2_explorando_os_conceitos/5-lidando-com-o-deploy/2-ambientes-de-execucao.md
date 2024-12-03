# Aula: Ambientes de Execução

## Introdução
- Discussão sobre a importância dos ambientes de execução em microsserviços.
- Identificação de diferentes ambientes, como desenvolvimento, teste, homologação e produção.

## Ambientes de Execução
1. **Ambiente de Desenvolvimento**
   - Utilização na máquina do desenvolvedor para criar novas funcionalidades e depurar o código.
   - Integração com containers para facilitar o ambiente de desenvolvimento.

2. **Ambiente de Teste e Staging**
   - Realização de testes automatizados e manuais.
   - Inclusão de testes de usabilidade, performance e smoke tests.
   - Utilização por equipes de quality assurance (QA).

3. **Ambiente de Homologação**
   - Utilização por stakeholders, clientes ou PO para validar a aplicação.
   - Garantia de que o sistema atende às expectativas.

4. **Ambiente de Produção**
   - Acesso pelos clientes finais.
   - Possibilidade de separação por cliente ou região geográfica.

## Parametrização de Configurações por Ambiente
1. **Configurações de Ambiente**
   - Definição de configurações como número de CPUs, localização do ambiente na nuvem, instâncias, etc.
   - Variação dessas configurações por ambiente (desenvolvimento, produção, etc.).

2. **Configuração da Aplicação**
   - Utilização de templates na criação de microsserviços.
   - Parametrização de configurações específicas, como logs, dependências, dados de acesso a serviços externos.

3. **Ferramentas de Configuração**
   - Estudo de ferramentas específicas para configurar ambientes (Google Cloud Engine, Azure, AWS).
   - Utilização de variáveis de ambiente em linguagens de programação.

## Estratégias de Deploy
- Próxima discussão sobre estratégias de deploy.
- Destaque para a necessidade de automação e parametrização na entrega para diferentes ambientes.

## Próxima Aula: Estratégias de Deploy
- Exploração detalhada de estratégias de deploy para microsserviços.
- Introdução a conceitos como blue-green deployment, canary deployment, etc.

## Aula Anterior: Entregas Automatizadas
- Ênfase na importância da entrega automatizada em microsserviços.
- Reconhecimento da impossibilidade de processos manuais devido à natureza distribuída e frequente das atualizações.
