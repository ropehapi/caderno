# Workshop TLC Desenvolvimento assistido por IA avançado
### CRONOGRAMA DIA 1
#### **🕙 10:00 – 12:00 · Fundamentos e Dev Flow**
- Boas-vindas, cronograma e informações importantes
- O novo fluxo de desenvolvimento
- Context Engineering
    - Contexto, Skills, MCPs e Integrações

#### **🕜 13:30 – 17:00 · Workflows e Carreira**
- Spec Driven Development
- Harness Engineering
- O Novo Dev: Como estar à frente na era da IA - **@adamoli**
- Desenvolvimento com IA — Rodrigo Branas

----

# Dia 1

### Bullet points
#### Waldemar Neto
- Boas práticas gerais
    - Usar modelos mais caros para planejar (Ex: Opus 4.6)
    - Usar modelos mais baratos para executar (Ex: Sonnet 4.6)
    - Planejar e executar em janelas de contexto diferentes
    - Utilizar o padrão Research Plan Implement
        - Skill TLC spec driven é um workflow que implementa esse framework
    - Design docs e Spec driven não são a mesma coisa
    - O tooling de MCP, skills e plugins pesam a nossa janela de contexto. É necessário avaliar o que vale ou não ser colocado no tooling.
    - Utilizar gate check commands. Um gate nada mais é que um check para validar que algo está funcionando ou não, como lints, testes etc.
    - TDD = Technical design docs, não test driven development
- Harness
    - É o arreio com o qual você usa a IA
    - Da mesma forma que um motor está para um carro, a LLM está para o harness (claude, cursor)
    - Dois tipos de harness:
        - Guides -> 
        - Sensors -> 
    - 5 tipos primitivos de harness
        - Filesystem
        - context mgnt
        - code execution
        - sandbox
        - memory
- [Skills da tlc](https://agent-skills.techleads.club/)

#### Rodrigo Branas
- Criar PRDs que viram tech spec que viram tasks
- Documentações podem ou não ficar no projeto, a depender da necessidade do time
- Boas práticas gerais
    - Sempre ao pegar um projeto, definir rules e skills
    - Usar [compozy](https://github.com/compozy/compozy) para implementar tarefas
- Layers de usuário de IA
    - L0 Hater
    - L1 Copia código do chat GPT para a IDE
    - L2 AI Baby sitter (maioria dos devs) 
    - L3 Usuário avançado

### Uso de IA no dia dia na prática (Branas)
- Parametrizar o projeto com o tooling necessário (skills, rules, mcps etc)
- Uso do compozy para planejamento da tarefa
- Primeiro a escrita dos PRDs
- Depois, a escrita das tech specs
- Depois, a escrita das tasks
- Depois, a implementação, task a task

### Palavras do sorteio:
- Vibe
- Momento
- Boneco

# Dia 02
### Bullet points
- Como adotar IA em uma codebase
    - A primeira coisa é montar o AGENTS.md, de preferência na mão  
    - Pedir para a IA identificar implementações fora do padrão e anomalias
    - Melhorar esses detalhes para melhorar a codebase. Codebase é harness

### Palvaras sorteio
- Plano
- Teste
- Capacete

# Resumo
### Passo a passo adoção em uma codebase
- Definir as rules e agent do projeto
- Identificar implementações fora do padrão e anomalias e corrigi-las
- Passar a utilizar o padrão RPI
- Usar de ferramentas como compozy para fazer o funil da atividade (TDD, Tech spec e Tasks)
- Implementar usando modelos mais baratos
- Criar pipelines de code review bem definidas. As vezes usando até a própria IA
- Criar skills necessárias para a codebase conforme o necessário

### Skills citadas
- [Compozy](https://github.com/compozy/compozy)
- Spektor
- tlc-spec-driven
- Modular decomposition

### TODOs
- [ ] Avaliar usar uma IDE como cursor, padrão de mercado atual
- [ ] Pesquisar sobre uso do compozy
- [ ] Pesquisar sobre como usar linear como MCP
- [ ] Pesquisar sobre ADR, architecture decision record. PRDs e TDD
- [ ] Pesquisar TLC DIY
- [ ] Anexar excalidraw aqui

