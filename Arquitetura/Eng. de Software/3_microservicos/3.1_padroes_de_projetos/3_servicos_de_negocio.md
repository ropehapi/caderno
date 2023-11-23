# Serviços de negócio
No último vídeo, vimos como separar um data service usando um conceito padrão de serviços de domínio. Então pegamos um pequeno domínio da nossa aplicação e separamos em um serviço que vai fornecer o acesso aos dados desse domínio.

Obviamente o acesso a esses dados possui lógica, possui alguma regra para que esse domínio seja consistente, mas às vezes precisamos de operações que demandam mais de um domínio. Então para esse caso nós temos o que é chamado de “serviço de negócio”.

Então no serviço de negócio ou business service, que foi o que vimos naqueles tipos de microsserviços, é basicamente a junção de diversos data services ou serviços de domínio. Usando o padrão, se tivermos pensando realmente em uma boa modelagem.

Então vamos entender de forma bem tranquila. Às vezes alguma alteração, por exemplo, matricular um aluno, precisa de mais de um modela, precisa de mais de uma parte do nosso domínio para que isso seja realmente representado de forma correta por um serviço.

Então, mais uma vez, se formos pensar na matrícula de um aluno, isso não envolve apenas inserir um aluno no serviço de alunos. Talvez precisemos ter um registro dele no serviço financeiro, talvez esse registro na gamificação precisamos de um registro também sendo inserido.

Então às vezes temos detalhes muito mais complexos do que somente lidar com um domínio. Então o serviço de negócios serve para esses casos.

Precisamos pensar muito bem sobre um processo do domínio do negócio. Existe um processo que vai ser executado. Quando pensamos com a visão de negócio, sem pensar em código, sem pensar em implementação, existe um processo. Por exemplo, de novo, matricular aluno.

E esse processo vai ser representado através desse serviço específico. Eles vão prover uma funcionalidade de negócio de mais alto nível. Então não é inserir um aluno, inserir uma matrícula financeira, inserir um jogador, ele vai ser um processo de alto nível: matricular. E a partir disso as operações mais granulares vão ser orquestradas.

E dessa forma conseguimos encapsular domínios relacionados. Então um aluno no nosso modelo acadêmico e uma matrícula financeira do nosso domínio financeiro, estão relacionados de alguma forma.

E através de um processo de matricular aluno, usando um serviço de domínio, conseguimos encapsular isso sem que o cliente, por exemplo, que a nossa API precise expor que o cliente precise chamar um inserir aluno e depois inserir uma matrícula financeira, inserir jogador, uma gamificação, então conseguimos encapsular isso tudo e simplificar o processo, o tornando mais real, mais próximo do que falamos no domínio.

Então essa é a ideia por trás desse tipo de serviço. E para criarmos, obviamente temos algumas etapas que começa com identificar o processo que pretendemos expor, se não existe processo, não existe um serviço de domínio. Então, por exemplo, inserir um aluno, isso não é um processo do negócio.

Agora receber matrícula, realizar matrícula, isso é um processo que acontece no nosso negócio. E a partir disso vamos identificar quais os domínios necessários. Precisamos do aluno, da matrícula financeira e do jogador. São os domínios que estão em serviços diferentes, que estão em data services diferentes.

Então com isso determinamos, identificamos os domínios e a partir disso vamos definir a API que vamos utilizar. Focando de novo no domínio e não nos dados em si. Eu não preciso ter detalhes de como o banco de dados está organizado. Não. É um aluno? Então eu não vou passar um UUID desse aluno, um ID desse aluno, eu vou ter uma matrícula ou um CPF, alguma coisa do tipo, focando sempre no domínio.

E a partir disso recebemos a requisição nesse serviço de domínio e ele vai consumir, consultar, vai realizar requisições para os serviços de dados, para os serviços de domínio e não de negócio.

Então no slide nós temos um erro, é "criando um serviço de negócio", um business service e ele vai consumir os data services, que são os nossos domínios, que são os nossos alunos, matrícula financeira, jogador. Então dessa forma conseguimos separar os nossos domínios.

Agora que já entendemos esses tipos, grandes tipos diferentes, que são na minha opinião os principais, existem outros como falamos, mas esses são os mais importantes, são os pelos quais começamos.

Vamos falar sobre alguns padrões realmente para atingirmos isso. Então, por exemplo, eu já falei sobre começar com monolito, vamos ver como fazemos isso. Algumas técnicas super simples para compartilharmos código sem precisar ter serviço demais. Enfim, vamos conversar um pouco sobre padrões no próximo vídeo.