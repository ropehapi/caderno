# Como usar Handoff Documents no Claude Code
Se você está trabalhando no Claude Code e ainda não faz isso, você precisa começar a criar handoff documents.

## O que é um Handoff Document?
É um arquivo markdown que registra cada passo feito durante a sessão e prepara a próxima sessão do Claude Code para continuar de onde parou.

## Por que isso importa?
Quando você estoura o contexto e fica compactando continuamente, acontece o context rot — a qualidade do seu agente vai caindo a cada compactação.

O Claude Code é mais inteligente no início de cada sessão. Usando handoff documents ao invés de ficar compactando, você evita o context rot e ainda especifica exatamente o que quer que o projeto lembre.

## Como usar
No final de cada sessão, antes de estourar o contexto, cole esse prompt no Claude:

```
Preciso encerrar essa sessão, mas quero continuar esse trabalho em outra
conversa sem perder contexto. Gere um handoff document completo em formato
Markdown (.md) que outro Claude (ou você mesmo numa nova sessão) possa ler
e retomar exatamente de onde paramos.

O documento deve seguir esta estrutura:

# Handoff: [título curto e descritivo]

**Data:** [data atual]
**Status:** [em andamento / bloqueado / aguardando decisão]

## 1. Objetivo
O que está sendo feito e por quê, em 2-4 frases.

## 2. Contexto essencial
Stack técnica, restrições, decisões já tomadas e seus motivos.

## 3. O que já foi feito
Lista cronológica do que foi produzido, tentado ou descartado.
Se algo foi descartado, explique por quê.

## 4. Estado atual
Onde exatamente paramos. O que funciona, o que está quebrado.

## 5. Próximos passos
Lista ordenada e acionável do que fazer a seguir. Seja específico.

## 6. Perguntas em aberto
Coisas que ainda precisam de decisão ou investigação.

## 7. Artefatos relevantes
Arquivos, snippets, links ou comandos que a próxima sessão vai precisar.

## 8. Instruções pra próxima sessão
Tom esperado, nível de detalhe, armadilhas a evitar.
```

## Levando pro próximo nível
Depois que ajustar o handoff na qualidade que quer, transforme ele numa skill. Assim, antes de estourar o contexto, você chama a skill e prepara a próxima sessão em segundos.

## Regras importantes
- Seja exaustivo em contexto, mas conciso em prosa — bullets e listas sempre
- Não invente nada que não aconteceu na sessão
- Inclua código real, não pseudocódigo
- O documento precisa ser autossuficiente: alguém lendo só ele deve conseguir continuar o trabalho

## Dica extra
Se você adotar essa técnica, vai ter sessões mais longas e com mais qualidade no Claude Code antes de sentir qualquer queda. Compact é útil, mas handoff documents são superiores pra projetos longos.
