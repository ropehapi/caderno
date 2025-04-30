# Ultimate Go: Advanced Engineering
A ideia desse artigo é documentar a linha de raciocinio desenvolvida durante o treinamento "Ultimate Go: Advanced Engineering" da Ardan labs que pode ser encontrado [aqui](https://www.youtube.com/playlist?list=PLADD_vxzPcZC0TWwc1ZNV8KALyeNVC3cA).

## De onde surge a necessidade que leva à blockchain?
Queremos manter um banco de dados descentralizado, transparente, append only, publicamente disponível, que seja auditável criptograficamente e que possa ter quantas cópias (nós) de si mesmo possiveis e qualquer um que quiser possa escrever um registro nesse banco que deve ser replicado para suas demais cópias de forma a manter a atomicidade, o que implica em alguns problemas:
- Concorrência de escrita dos nós
- Controlar a entrada de novos nós
- Garantir um throughput alto

Para solucionar esses problemas, usamos uma ferramenta chamada de algoritmos de consenso, onde cada tipo de algoritmo de consenso resolve uma parte desses problemas; gerando, porém, problemas novos e que devem ser neutralizados. Esses algoritmos serão abordados adiante.

## Algoritmos de consenso
Primariamente, há três tipos principais de algoritmos de consenso.
- Proof of work
- Proof of staking
- Proof of authority

Vamos explicar como cada um deles funciona

### Proof of work (PoW)
Nesse modelo de algoritmo de consenso, o "work" do nome é levado a sério. Esse algoritmo submete os nós de sua rede a uma espécie de "corrida" pela solução de um desafio matemático, que na maioria das vezes é como um quebra-cabeça criptográfico que requer um grande poder de processamento para ser resolvido, onde aquele nó que resolver o quebra-cabeça primeiro ganha o direito de dar a entrada do próximo bloco na rede (o que no caso da blockchain do bitcoin, recompensa o nó com o token nativo de sua rede, o bitcoin).

#### Prós
- Seu alto custo computacional torna contra-producente a entrada de bad workers na rede, tornando-a incrivelmente segura.
- Esse algoritmo permite que a rede trabalhe de forma 100% descentralizada, impedindo que qualquer nó tenha controle sobre a rede.
#### Contras
- Seu alto custo computacional gera gastos gigantescos de energia elétrica, que é o tradeoff de se ter tamanha descentralização.
- Baixo throughput (Ex: Bitcoin leva ~10min/bloco)
- Dependendo da recompensa da inserção de dados na rede, pode aumentar demais a concorrência.

### Proof of staking (PoS)

Diferente do modelo do PoW, onde o poder de computação dita quem insere o próximo bloco na rede, no PoS o critério é a "aposta" (stake) que um nó faz com os tokens da própria rede. Os nós participantes bloqueiam uma certa quantia de tokens como forma de garantia e, com base em fatores como a quantidade apostada, tempo de stake e sorteio pseudorrandômico, são escolhidos para inserir o próximo bloco. Quanto maior o stake, maior a chance de ser escolhido. A lógica aqui é que quem tem mais a perder tem mais incentivo em agir corretamente.
#### Prós

- Dispensa o alto custo computacional do PoW, o que torna o algoritmo extremamente mais eficiente em consumo de energia.

- Permite um throughput mais alto, já que a seleção de quem escreve o próximo bloco é mais rápida.

- Incentiva o bom comportamento dos validadores, pois agir mal pode significar perder seus próprios tokens (mecanismo conhecido como slashing).

#### Contras

- Existe um risco de concentração de poder, pois quem tem mais tokens tende a ser escolhido mais vezes e consequentemente acumular ainda mais poder.

- Reduz um pouco o grau de descentralização, já que a participação depende da posse dos tokens.

- Precisa de mecanismos adicionais para lidar com ataques de longo alcance ou com o problema do “nada em jogo”.

### Proof of authority (PoA)

O PoA leva uma abordagem ainda mais diferente: ao invés de usar trabalho computacional (PoW) ou riqueza apostada (PoS), ele baseia a validação dos blocos na identidade e reputação de entidades confiáveis previamente autorizadas. Ou seja, somente um conjunto restrito de nós — chamados de autoridades — podem propor blocos. Essas autoridades são geralmente organizações ou indivíduos públicos, cujas identidades são verificáveis.
#### Prós

- Altíssimo throughput, já que a coordenação entre autoridades é simples e rápida.

- Custo operacional extremamente baixo, o que torna esse algoritmo muito eficiente.

- Ideal para redes permissionadas, onde a transparência e controle são desejados.

#### Contras

- Centralização explícita: é necessário confiar nas autoridades que controlam a rede.

- Menor resistência a censura ou manipulação, já que poucas entidades detêm o controle da escrita.

- Requer governança externa para definir, atualizar ou remover autoridades confiáveis.

### Aumentando o throughput
Notemos que independente do modelo acima, nossa entrada de dados na rede é baixa se feita apenas uma entrada por vez. Por isso, usamos da estratégia de registrar entradas em blocos na rede, de forma que mais registros sejam adicionados de cada vez. Isso porém gera um problema de starving para os nós que não ganham as corridas (no caso do PoW) ou que não são escolhidos pelo algoritmo (no caso do PoS). Afim de solucionar esse problema, surge o Mempool.

#### Mempool
A mempool (abreviação de memory pool) é como uma fila de espera onde ficam as transações que ainda não foram incluídas em um bloco da rede. Sempre que um nó recebe uma nova transação, ela é validada e, se for considerada válida, é colocada nessa fila. Essa estrutura é essencial para todos os algoritmos de consenso citados, já que o bloco seguinte da rede será formado a partir das transações contidas nessa mempool.

No PoW, por exemplo, os mineradores observam essa fila e escolhem as transações que mais pagam taxa para compor o bloco que estão tentando minerar. Já no PoS ou PoA, o nó validador ou autoridade selecionada também usa a mempool como base para montar o próximo bloco, priorizando geralmente aquelas transações que dão maior retorno econômico ou obedecem alguma política de ordenação.