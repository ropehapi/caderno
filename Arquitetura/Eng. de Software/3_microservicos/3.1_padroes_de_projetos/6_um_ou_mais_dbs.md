# Um ou mais DBs ? 
Boas-vindas a mais um capítulo desse treinamento, onde estamos falando sobre microsserviços. Como pensar na hora de arquitetar esse tipo de projeto? Então agora vamos falar sobre como lidar com os dados de microsserviços.

Então, por exemplo, eu vou ter um banco de dados só ou um banco de dados para cada serviço? Algum serviço vai compartilhar banco de dados? Então como fazemos isso?

Como você já viu no início, a ideia, o objetivo é o que conhecemos como single service database ou single database ou single service, você vai achar vários nomes, mas a ideia é que um serviço tenha um banco de dados, um banco de dados é para apenas um serviço.

Então imagina um cenário que no microsserviço no processo de matrícula de aluno nós recebemos 10 requisições por dia. Já no microsserviço da parte acadêmica de exibir um vídeo, nós recebemos 100 requisições no dia.

Claro que eu estou dando números muito baixos para entendermos, para conseguirmos visualizar, mas a ideia é que esse microsserviço de matrícula de alunos vai acessar um banco de dados e como ele recebe menos requisições, eu posso ter esse banco de dados em um servidor menos robusto.

Já na parte acadêmica, que vai enviar os vídeos, até processar os vídeos, eu preciso além de ter uma máquina do microsserviço em si mais robusta, mais potente, o banco de dados que ele acessa precisa ser maior, precisa ser uma máquina mais robusta também para não termos gargalo.

A escalabilidade de um serviço está diretamente relacionada com o banco de dados que ele acessa. Por isso um serviço precisa se conectar a somente um banco de dados e esse banco de dados precisa ser acessado somente por um microsserviço.

Essa é a ideia por trás de single service, single database ou qualquer outro nome que você leia nessas linhas.

Mas existem cenários onde temos o shared service database. Por quê? Às vezes até por motivos contratuais, determinados dados precisam estar centralizados.

Por exemplo, o e-mail do aluno e o detalhe de quanto ele paga por ano precisam estar no mesmo banco de dados por algum contrato que a Alura tem com um serviço de pagamento, estou criando uma situação hipotética aqui.

Nesse cenário vamos acabar tendo que utilizar o mesmo banco de dados no módulo de aluno e no módulo de financeiro. Isso é um problema porque esse nosso banco vai precisar escalar conforme a necessidade do maior microsserviço, do microsserviço que precise de mais recursos e acabamos desperdiçando um pouco de recurso. Então isso pode ser um problema.

Só que para garantirmos que nossos microsserviços sejam independentes vamos tratar esse banco em cada serviço como se fossem bancos diferentes.

A conexão vai ser independente, a forma como o acessamos é independente, nós não temos, por exemplo, um sidecar que se conecta a esse banco, não vamos fazer dessa forma, nós vamos ignorar o fato de que fisicamente é o mesmo banco, vamos fingir que são bancos separados.

Dessa forma, se conseguirmos, por exemplo, alterar esse contrato, se conseguirmos evoluir o nosso sistema para terem bancos separados, o impacto vai ser bem menor em código, vamos precisar modificar muito menos coisa.

A ideia quando acessamos dados é de que vamos buscar sempre single service, single database ou single service database. Se existe um serviço que acessa dados, só esse serviço vai acessar esse banco de dados.

Às vezes nos encontramos nesse padrão de shared service, então a solução, a proposta desse padrão é tratar o banco compartilhado como se fossem bancos separados.

Agora vamos falar um pouco sobre alguns padrões que podem nos ajudar na construção de microsserviços muito complexos, mas padrão realmente de codificação. Só que vamos falar isso no próximo vídeo.