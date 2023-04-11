# **O que é teste de automatizado?**
*Antes de mais nada: Aqui vai o link para um [artigo](https://www.atlassian.com/br/continuous-delivery/software-testing/automated-testing) muito bom da Atlassian acerca de testes de software.*

O teste automatizado é a aplicação de ferramentas de software para automatizar um processo manual conduzido por humanos de revisão e validação de um produto de software. A maioria dos projetos de software ágeis e de DevOps modernos agora inclui testes automatizados desde o início. Para apreciar de verdade o valor dos testes automatizados, no entanto, é bom entender como era a vida antes da adoção ampla do método.

Quando o teste manual era a norma, era comum as empresas de software empregarem uma equipe de garantia de qualidade em tempo integral. Essa equipe desenvolvia uma coleção de “planos de teste” ou checklists passo a passo para confirmar que uma característica de um projeto de software se comportava como esperado. A equipe de garantia de qualidade executava manualmente essas checklists sempre que uma nova atualização ou alteração era enviada para o projeto de software e, em seguida, retornava os resultados dos planos de teste para a equipe de engenharia para revisão e qualquer desenvolvimento adicional para resolver problemas.

Esse processo era lento, caro e propenso a erros. O teste automatizado traz enormes ganhos para a eficiência da equipe e o ROI das equipes de garantia de qualidade.

O teste automatizado coloca as responsabilidades de propriedade nas mãos da equipe de engenharia. Os planos de teste são desenvolvidos junto com o desenvolvimento regular de recursos de roteiro e, em seguida, executados automaticamente por ferramentas de integração contínua de software. O teste automatizado promove o tamanho enxuto da equipe de garantia de qualidade e permite que ela se concentre em recursos mais sensíveis.

## **Por que a automação de testes é importante para a entrega contínua?**
O foco da entrega contínua (CD) é entregar novos lançamentos de código o mais rápido possível para os clientes. O teste automatizado é fundamental para esse objetivo. Não há como automatizar a entrega aos usuários se houver uma etapa manual e demorada no processo de entrega.

A CD faz parte de um pipeline de implementação maior. A CD é sucessora e também dependente da integração contínua (CI). A CI é totalmente responsável por executar testes automatizados para quaisquer novas alterações de código e verificar se essas alterações não quebram recursos estabelecidos ou introduzem novos bugs. A CD é acionada quando a etapa de integração contínua passa no plano de teste automatizado.

Essa relação entre testes automatizados, CI e CD produz muitos benefícios para uma equipe de software de alta velocidade. Os testes automatizados garantem a qualidade em todas as fases do desenvolvimento, garantindo que os novos commits não introduzam nenhum bug, para que o software permaneça pronto para implementação a qualquer momento.

## **Que tipos de testes de software devem ser automatizados primeiro?**
### **1. Testes de ponta a ponta**
É possível afirmar que os testes com implementação mais valiosa são testes de ponta a ponta (E2E). Os testes E2E simulam uma experiência de nível de usuário em toda a pilha de um produto de software. Planos de testes E2E em geral abrangem histórias de nível de usuário como: “o usuário pode entrar”, “o usuário pode fazer um depósito” ou “o usuário pode alterar as configurações de e-mail”. A implementação desses testes é muito valiosa, pois eles oferecem garantia de que os usuários reais estão tendo uma experiência sem bugs, mesmo quando novos commits são enviados.

As ferramentas de teste E2E capturam e reproduzem ações do usuário, de modo que os planos de teste E2E passam a ser gravações dos principais fluxos de experiência do usuário. Se em um produto de software estiver faltando qualquer tipo de abrangência de testes automatizados, ele vai obter o máximo valor implementando testes E2E dos fluxos de negócios mais críticos. Os testes E2E podem ser caros no início para capturar e gravar a sequência de fluxo do usuário. Se o produto de software não estiver fazendo lançamentos diários rápidos, pode ser mais econômico ter uma equipe humana para fazer a execução manual dos planos de teste E2E.

### **2. Testes de unidade**
Como o nome indica, os testes de unidade abrangem unidades individuais de código. Unidades de código são melhor medidas em definições de função. Um teste de unidade abrange uma função individual. Os testes de unidade confirmam que a entrada esperada para uma função corresponde à saída esperada. No caso de código com cálculos sensíveis (como pode ser o caso de finanças, cuidados de saúde, ou aeroespacial) os testes de unidade são melhores. Os testes de unidade são baratos e rápidos de implementar e proporcionam um alto retorno sobre o investimento.

### **3. Testes de integração**
Muitas vezes, uma unidade de código vai fazer uma chamada externa para um serviço de terceiros. A base de código principal que está sendo testada não vai ter acesso ao código deste utilitário de terceiros. Os testes de integração envolvem simular essas dependências de terceiros e confirmar que o código que tem interface com elas se comporta como esperado.

Os testes de integração são semelhantes aos testes de unidade na forma como são escritos e em relação às ferramentas. Os testes de integração podem ser uma alternativa barata aos testes E2E, mas o retorno sobre o investimento é discutível quando a combinação de testes de unidade e E2E já é utilizada.

### **4. Testes de desempenho**
Quando usado no contexto do desenvolvimento de software, o "desempenho" é usado para descrever a velocidade e a capacidade de resposta com que um projeto de software reage. Alguns exemplos de métricas de desempenho são: "tempo para carregamento da página", "tempo para a primeira renderização", "tempo de resposta dos resultados da pesquisa". Testes de desempenho criam medições e asserções para esses casos de exemplo. Testes de desempenho automatizados executam casos de teste em todas essas métricas e, em seguida, alertam a equipe para quaisquer regressões ou perda de velocidade.