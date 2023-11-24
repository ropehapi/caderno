# Aula: Definindo um Padrão na Criação de Microsserviços
![Alt text](/src/img/microservicos-padronizando-a-criacao.png)

## Introdução
- Importância de definir um padrão na criação de microsserviços.
- Facilitação do processo e garantia de consistência nas equipes.

## Áreas de Padronização
1. **Logs**
   - Formato semelhante ou idêntico de log em toda a aplicação.
   - Padronização do destino dos logs para centralização e agregação.

2. **Infraestrutura**
   - Padronização de verificações de status (health checks).
   - Definição de como os monitoramentos de métrica serão realizados.
   - Configuração de acesso a configurações e senhas.

3. **Flexibilidade vs. Padronização**
   - Equilíbrio entre flexibilidade na escolha de tecnologias e padronização para facilitar o processo.
   - Tomada de decisão com base nas necessidades específicas de cada microsserviço.

## Estratégias para Padronização
1. **Projetos de Exemplo (Esqueletos)**
   - Utilização de projetos de exemplo como base.
   - Clone do projeto, modificação de variáveis e execução de comando para configurar o framework.

2. **Scripts de Build**
   - Desenvolvimento de scripts para automação da configuração.
   - Garantia de instalação e configuração padronizadas.

3. **Containers**
   - Utilização de imagens de Docker como templates.
   - Imagens prontas com linguagem, framework e serviços necessários.
   - Configuração do orquestrador de container para definir as imagens para cada componente.

## Benefícios da Padronização
- Facilitação do processo de criação.
- Redução de erros humanos.
- Consistência entre microsserviços.
- Possibilidade de balancear flexibilidade e agilidade.

## Conclusão
- Importância de seguir um padrão para evitar erros e garantir eficiência.
- Próxima aula: Comunicação entre microsserviços.
