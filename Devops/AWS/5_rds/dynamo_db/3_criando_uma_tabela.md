<div class="formattedText" data-external-links="">
                                <p>Anteriormente, citamos conceitos que ainda não colocamos em prática.</p>
<p>Vamos aplicar um cenário bastante comum: eu trabalho em uma empresa onde fornecemos um sistema de marketing que possui milhões de pessoas usuárias, já que os clientes são empresas, cada um pode ter vários logins.</p>
<p>Dentro destes logins, podemos ter inúmeras configurações. A própria pessoa usuária pode entrar no sistema e criá-las.</p>
<p>Quando uma configuração está habilitada ou possui determinado valor, uma parte do sistema funcionará de uma forma. Com outro valor, ela funcionará de outra forma.</p>
<p>Dentro deste cenário, se usássemos um banco de dados relacional, precisaríamos ter três elementos:</p>
<ul><li>Uma tabela chamada "Configurações"</li><li>Uma coluna chamada "Funcionalidade" que terá o nome da configuração criada pela pessoa usuária</li><li>Um valor</li></ul>
<p>Considerando que cada pessoa usuária pode ter várias configurações, teríamos um volume de dados enorme.</p>
<p>Este é um cenário bastante comum para utilizar o DynamoDB. Ele é simples — podemos utilizar este banco em cenários bem mais complexos —, mas é um ótimo exemplo inicial, pois é fácil de entender e compõe somente uma chave (configuração) e seu valor.</p>
<p>Este caso gerará um volume gigantesco de dados, e para habilitar ou desabilitar uma funcionalidade, precisamos que isso seja buscado rapidamente — portanto, se trata de um cenário perfeito para o DynamoDB.</p>
<p>Voltando à página "Tabelas" aberta no navegador, selecionaremos o botão "Criar tabela", localizado à direita na barra de tarefas da seção. Seremos direcionados para a página "Criar tabela".</p>
<p>Nela, criaremos uma tabela  chamada "Config", digitando este nome no campo "Nome da tabela", dentro da seção "Detalhes da tabela". Lembrando que, em um cenário real, a tabela deverá ter um nome mais descritivo.</p>
<blockquote>
<p><strong>Dica:</strong> Na criação da tabela, o ideal é não utilizar nenhum acento ou caractere especial.</p>
</blockquote>
<p>Eu, Vinicius, prefiro manter tudo em caixa baixa, mas é bastante comum no DynamoDB a criação 'e tabelas com a primeira letra em caixa alta, portanto, faremos isso aqui. Contudo, é interessante <strong><em>combinar com a equipe o padrão de criação a ser seguido</em></strong>.</p>
<p>Abaixo deste campo, temos o campo denominado "Chave de partição". Este é um conceito muito importante.</p>
<p>Conforme vimos anteriormente, o DynamoDB é um banco de chave/valor, e essa chave pode ser composta. A <strong><em>chave de partição</em></strong> (<strong><em>partition key</em></strong>, em inglês) faz parte da nossa chave primária que identificará um item. </p>
<p>Precisamos ter sempre uma identificação para o item. Assim como no banco de dados relacional, temos uma chave primária no DynamoDB. No caso deste banco, ela pode ser somente de partição, ou a junção de uma chave de partição com uma <strong><em>chave de classificação</em></strong> (<strong><em>sort key</em></strong>). Esta escolha é opcional.</p>
<p>No nosso cenário, teremos uma chave primária composta de chave de partição e de classificação, pois armazenaremos a pessoa usuária que possui a configuração, junto ao nome da configuração. Precisamos das duas informações.</p>
<p>No campo "Chave de partição", digitaremos o nome da nossa chave que será criada: "user_id", que representará a identificação da pessoa usuária.</p>
<p>Abaixo deste, temos o campo "Chave de classificação - opcional", no qual digitaremos o nome da chave a ser criada: "setting". Esta representa a configuração criada pela pessoa usuária.</p>
<p>À direita de ambos os campos de chave, temos um botão de lista suspensa com a opção "String" selecionada. Se clicarmos nele, veremos que também é possível criar as chaves com os tipos "Binário" ou "Número". Neste caso, manteremos como Strings.</p>
<p>Estamos criando uma tabela chamada "Config" que terá como chave primária — ou seja, o valor que identifica cada item — o Id de uma pessoa usuária e o nome da configuração que será criada.</p>
<p>Podemos ter várias pessoas usuárias com a mesma configuração, assim como podemos ter uma pessoa usuária com várias configurações diferentes. Por isso, nossa chave será composta.</p>
<p><strong><em>A chave de partição sempre precisa ser informada em nossas consultas.</em></strong> Já a chave de classificação pode ser utilizada para filtrar a pesquisa mais profundamente.</p>
<p>Ou seja, podemos buscar todas as funcionalidades de uma pessoa usuária utilizando a chave de partição, ou buscar uma configuração específica dele, utilizando "user_id" junto ao "setting".</p>
<p>Entretanto, com as configurações que temos, não é possível buscar todas as pessoas usuárias que possuem determinada configuração, pois a chave de partição é obrigatória. Posteriormente, veremos funcionalidades que permitirão realizar essa busca.</p>
<p>Resumindo, a <strong><em>chave primária consiste na partition key e na sort key</em></strong>. Isso é muito importante, e não será alterado no futuro. Nossa tabela sempre terá estes elementos, e por isso <strong><em>precisamos pensar bem em quais serão esses valores.</em></strong></p>
<p>Como dito anteriormente, no sistema em que trabalho, listamos somente as funcionalidades de uma pessoa usuária ou uma única funcionalidade de uma única pessoa. É isso que precisamos.</p>
<p>Se precisássemos de outras pesquisas, trocaríamos os nomes das chaves. Por exemplo, se o objetivo fosse buscar todas as pessoas usuárias que possuem determinada funcionalidade, inverteríamos os nomes e chamaríamos a <em>partition key</em> de "setting", enquanto a <em>sort key</em> seria denominada "user_id", tendo "setting" como o valor obrigatório de busca.</p>
<p>Abaixo da seção atual, "Detalhes da tabela", temos a seção "Configurações da tabela", com a opção "Configurações padrão" selecionada.</p>
<p>Enquanto no RDS configuramos muitos detalhes, aqui será mais simples. Manteremos habilitadas as opções padrão, entre elas o "Modo de capacidade", a "Capacidade de leitura" e o "Auto Scaling". Entenderemos alguns destes conceitos posteriormente neste curso.</p>
<p>Aqui temos menos configurações em relação ao RDS, pois a ideia do DynamoDB é centralizar ainda mais o gerenciamento na AWS, permitindo que nos preocupemos menos com a infraestrutura.</p>
<p>Já temos o necessário para criar nossa primeira tabela. Na última seção da página, denominada "Tags", podemos definir <em>tags</em> para organização, assim como no SE2, no RDS e nas VPCs.</p>
<p>Vamos imaginar que temos uma <em>tag</em> para determinado serviço. Tudo o que tiver essa <em>tag</em> estará relacionado a ele.</p>
<p>Já que estamos em um curso de DynamoDB, não precisamos definir nenhuma <em>tag</em>.</p>
<p>Por fim, selecionaremos o botão "Criar tabela", alinhado à esquerda e abaixo desta seção. Com isso, nossa tabela começará a ser criada e seremos direcionados para a página "Tabelas", onde veremos a coluna "Nome" com um link que denominado "Config".</p>
<p>À sua direita, temos a coluna "Status", onde vemos a informação "Criando". O processo de criação demorará alguns minutos, pois tem bastante coisa acontecendo.</p>
<p>À direita de "Status", temos as seções "Chave de partição"
 e "Chave de Classificação". Elas possuem as informações "user_id (S)" e "setting (S)", respectivamente.</p>
<p>O "S" entre parênteses representa o <strong><em>tipo da coluna</em></strong> (neste caso, "String"). Se criarmos a tabela pelo terminal precisamos informar o tipo desta forma, com sua primeira letra.</p>
<p>Para o tipo "String", usamos o "S"; para "Número", o "N"; para "Binário", o "B", e assim em diante. É importante nos familiarizarmos com estes detalhes, pois podemos precisar deles caso utilizarmos a linha de comando.</p>
<p>No que tange o código, cada linguagem possuirá uma biblioteca adaptada para o seu cenário. Pode ser que seja necessário utilizar uma <code>enum</code> para definir o tipo, uma string com a primeira letra do tipo, ou outra técnica. Não abordaremos profundamente este assunto.</p>
<p>Temos configurados o <em>Auto Scaling</em>, a capacidade de leitura, entre outros detalhes. Já o tamanho da tabela está zerado.</p>
<p>Queremos ler os dados dessa tabela. Para isso, adicionaremos dados.</p>
<p>No próximo vídeo, criaremos e adicionaremos configurações à tabela e aprenderemos como buscá-las. Nos vemos lá.</p>
                        </div>