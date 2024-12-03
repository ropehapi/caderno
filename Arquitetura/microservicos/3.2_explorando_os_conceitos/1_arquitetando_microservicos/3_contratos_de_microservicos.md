# Aula: Contratos de Microsserviços
![Alt text](/src/img/microsrevicos-sao-independentes.png)

## Introdução
- Microsserviços são partes de uma aplicação maior, requerendo comunicação entre si.
- A comunicação envolve contratos, definindo a forma como os microsserviços interagem.

## Contratos em Microsserviços
- Ao expor uma API, um microsserviço assume um contrato com o cliente.
- A responsabilidade é manter o contrato, mesmo durante atualizações tecnológicas.

## Manutenção de Contratos
- Técnicas para manter contratos:
  - **Modificações Aditivas:** Apenas adicionar funcionalidades, não modificar ou remover.
  - **Campos Opcionais:** Adição de novos campos de forma opcional.
  - **Versionamento de APIs:** Utilizar versões (/v1, /v2) para permitir mudanças sem quebrar contratos.

## Desafios do Versionamento de APIs
- Versionar APIs pode ser trabalhoso, mas é transparente para o cliente.
- Permite que os clientes escolham quando atualizar, evitando quebras inesperadas.

## Equipes Específicas
- Em empresas maiores, equipes específicas são designadas para microsserviços individuais.
- Evita riscos de modificações em um microsserviço sem a devida atualização nos clientes.

## Tornando Microsserviços Independentes
- Microsserviços precisam ser independentes para atualizações e mudanças de tecnologia.
- A independência requer a manutenção rigorosa de contratos durante as evoluções.

## Identificação de Barreiras entre Microsserviços
- Como identificar onde um microsserviço termina e outro começa?
- Barreiras podem ser discutidas em detalhes para garantir uma clara separação entre microsserviços.
- Próxima aula: Explorar técnicas e considerações para definir barreiras entre microsserviços.
