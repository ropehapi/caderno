<div class="formattedText" data-external-links="">
                                <p>Boas-vindas a mais uma aula deste curso, onde estamos falando sobre bancos de dados na AWS.</p>
<p>Já setamos a lista de bancos de dados e entramos fundo no RDS. Agora conheceremos o <strong><em>DynamoDB</em></strong>.</p>
<p>Acessaremos o console da AWS, e no campo de busca superior buscaremos por "dynamodb". Na lista de retornos, veremos a opção "DynamoDB" com a descrição "Managed NoSQL Database", que significa "banco de dados gerenciado (assim como o RDS) não SQL".</p>
<blockquote>
<p><strong>Observação:</strong> Na comunidade dev, existem várias formas de pronunciar SQL. O instrutor Vini Dias pronuncia "sequel", mas outros pronunciam "ésse-quê-éle".</p>
</blockquote>
<p>Vamos selecionar esta opção, o que nos levará para a página dela. No centro, veremos o título "Amazon DynamoDB" em negrito e o subtítulo "Um serviço de banco de dados NoSQL rápido e flexível para qualquer escala".</p>
<p>Vamos entender com calma a ideia do DynamoDB e para que ele serve.</p>
<h1>Dynamo DB</h1>
<p>A Amazon criou o DynamoDB para o seu serviço de e-commerce. A ideia da empresa era ter um banco de dados que suportasse a imensa carga da Amazon, mantendo uma boa performance.</p>
<p>Assim como vemos no console do DynamoDB, a ideia é que este banco seja "um serviço de banco de dados rápido e flexível para qualquer escala". Portanto, nele não existe limite de itens que possam ser adicionados.</p>
<p>Abaixo do subtítulo, eles prometem uma "performance abaixo de 10 milissegundos em qualquer escala". Com isso, <strong><em>gerenciaremos uma enorme quantidade de dados com alta velocidade e baixa latência</em></strong>. Este é o cenário ideal para usar o DynamoDB.</p>
<p>Imaginaremos um exemplo em que precisamos gerar um relatório onde precisamos agrupar dados de três serviços diferentes e várias tabelas com regras bem definidas. <strong><em>O DynamoDB não é para este cenário</em></strong>.</p>
<p>Em outro exemplo, se tivermos uma tabela com milhões de registros onde precisaremos consultar itens específicos de forma veloz, <strong><em>O DynamoDB é o banco ideal</em></strong>.</p>
<p>É importante lembrar que ele foi criado como um <strong><em>banco de dados NoSQL</em></strong>, ou seja, ele é <strong><em>não relacional</em></strong> e não possui colunas, chaves estrangeiras ou relacionamento entre tabelas.</p>
<p>Neste banco, teremos um conjunto de dados que chamaremos de tabela na qual podemos ter um item "pessoa" — que possui nome, data de nascimento e profissão — e um item "carro" — com placa, marca e cor.</p>
<p>O DynamoDB não possui regras definidas como os bancos relacionais e não nos possibilita relacionar múltiplas tabelas. Apesar disso, ele nos permite atingir algo semelhante.</p>
<p>É interessante utilizá-lo em cenários de microsserviços, onde temos um domínio com um volume grande de dados e precisamos de uma boa performance.</p>
<p>Se trabalhássemos, por exemplo, em uma empresa de e-commerce, não precisaríamos necessariamente inserir todos os dados no DynamoDB. Neste caso, seria interessante adicionar somente os pedidos e os seus respectivos itens. Os outros dados poderiam ser armazenados em um banco de dados relacional.</p>
<p>Se no seu cenário a lista de produtos tiver mais volume de dados do que a lista de pedidos, seria interessante armazenar a primeira no DynamoDB e a segunda no banco relacional. E assim por diante.</p>
<p>Portanto, dependendo do cenário, podemos ter parte dos dados em um banco relacional gerenciado pela RDS e delegar outra parte mais volumosa que precisa de performance para o DynamoDB.</p>
<p>Voltando à página do DynamoDB que abrimos, no mesmo texto ele nos diz que se trata de um banco de dados "de documentos de chave/valor". Isso significa que teremos uma chave (que pode ser composta) junto a um ou mais valores que mapearão para um documento.</p>
<p>Com isso, podemos ter vários atributos e informações. Por exemplo, teremos uma chave que será o cpf e os valores que serão os atributos de uma pessoa — por exemplo, o nome, a data de nascimento, entre outros.</p>
<p>Resumindo, temos uma chave e um documento como valor, ou seja, nele podem existir vários dados. Com isso, em alguns casos podemos chegar em algo próximo ao banco de dados relacional, onde teríamos vários atributos de um documento equivalendo ao que chamamos de "colunas" no modelo relacional.</p>
<p>É interessante perceber que, se precisamos de muita performance em um volume grande de dados, podemos utilizar o DynamoDB e atingir alguns conceitos que existem por padrão no banco de dados relacional. <strong><em>Contudo, é importante entender claramente que ele é um banco não relacional de documentos chave/valor.</em></strong></p>
<blockquote>
<p>Existem cursos aqui na plataforma sobre <strong><em>Modelagem NoSQL</em></strong> para entender quando é interessante utilizar um banco de dados deste tipo.</p>
</blockquote>
<p>Entendemos que o propósito do DynamoDB é gerenciar um volume muito grande de dados com alta performance e baixa latência. A seguir, começaremos a entender os conceitos deste banco antes de iniciar a prática.</p>
                        </div>