<div class="formattedText" data-external-links="">
                                <p>Nossa tabela "Config" foi criada corretamente. Na página atual, selecionaremos o link com o seu nome e seremos direcionados para a página cujo título será o nome da tabela ("Config").</p>
<p>Nela, podemos ver seções com todas as suas informações, onde podemos obter a contagem de itens, métricas, etc. Não precisamos abordar cada seção, pois a sua leitura é muito intuitiva.</p>
<p>Para acessar os itens desta tabela, selecionaremos o botão "Explorar itens da tabela". Com isso, uma nova seção denominada "Verificar ou consultar itens" será exibida nesta página. Nela, podemos realizar várias tarefas.</p>
<p>A primeira coisa que podemos fazer nesta tela é consultar um item. Contudo, não temos nenhum e por isso acessaremos a seção "Itens retornados", clicando no botão "Criar item" para criá-lo.</p>
<h2>Criando um item</h2>
<p>Com isso, seremos direcionados para a tela de criação de item, que possui a seção "Atributos". Nesta, temos três colunas, da esquerda para a direita:</p>
<ul><li>"Nome do atributo", que possui os atributos "user_id" e "setting"</li><li>"Valor", que possui um campo editável em branco</li><li>"Tipo", que possui o valor "String"</li></ul>
<p>Para criar um item, precisamos informar o valor dos seus atributos. Além disso, é possível adicionar um atributo selecionando o botão "Adicionar novo atributo", localizado à esquerda do nome da seção.</p>
<p>Clicando neste botão, podemos escolher o tipo do atributo. Entre as várias opções, escolheremos o tipo "Booliano" (ou booleano).</p>
<p>Na coluna "Nome do atributo", surgirá um campo editável abaixo dos atributos existentes, junto de dois botões de rádio "Verdadeiro" e "Falso", com a primeira opção selecionada. No campo editável, digitaremos "enabled" para criar um atributo que verificará se a configuração está habilitada ou não.</p>
<p>Acessando a coluna "Valor", preencheremos o campo editável correspondente ao atributo "user_id" com o valor "1". Faremos o mesmo para o campo de "setting", que terá o valor "funcionalidade_1".</p>
<p>Por fim, selecionaremos o botão "Criar item" para criá-lo de fato.</p>
<p>Como podemos ver, é bastante simples criar um item. Nele, poderíamos adicionar quantos atributos quiséssemos.</p>
<p>Com a criação do item, seremos redirecionados para a página da tabela "Config". Nela, acessaremos a seção "Itens retornados", e veremos à direita deste título o botão "Criar item". Abaixo, veremos o item recém criado.</p>
<p>Clicaremos em "Criar item". Na tela de criação, geraremos mais três itens com as características abaixo:</p>
<p><strong>Item 1:</strong></p>
<ul><li>O "user_id" terá o valor 1;</li><li>O "setting" receberá o valor "funcionalidade_2";</li><li>Adicionaremos um novo atributo do tipo "Booliano" chamado "enabled" e com a opção "Verdadeiro" marcada.</li></ul>
<p><strong>Item 2:</strong></p>
<ul><li>O "user_id" terá o valor 1;</li><li>O "setting" receberá o valor "funcionalidade_3";</li><li>Adicionaremos o atributo "enabled" do tipo "Booliano", com a opção "Falso" marcada.</li></ul>
<p><strong>Item 3:</strong></p>
<ul><li>O "user_id" terá o valor 2;</li><li>O "setting" receberá o valor "funcionalidade_1";</li><li>Adicionaremos o atributo "enabled" do tipo "Booliano", com a opção "Falso" marcada.</li></ul>
<p>Após a criação, teremos uma tabela com quatro itens, o que não faz jus ao DynamoDB. Contudo, estamos apenas começando.</p>
<p>Como buscaremos todas as funcionalidades (habilitadas ou não) configuradas na pessoa usuária 1?</p>
<blockquote>
<p><strong>Observação:</strong> Não podemos filtrar as funcionalidades entre "habilitadas" ou não, pois o "enabled" se trata de um atributo, e não é possivel realizar consultas baseadas em atributos.</p>
</blockquote>
<h2>Buscando itens</h2>
<p>Temos duas formas de buscar itens: utilizando o <strong><em>Modo Query</em></strong> ou o <strong><em>Modo Scan</em></strong>.</p>
<p><strong><em>O Modo Scan deve ser evitado a todo custo</em></strong>, pois, apesar de funcionar, ele verificará, linha a linha, se o filtro corresponde</p>
<p>Para quem conhece SQL, este processo corresponde a um <em>Full Table Scan</em>, ou seja, um SELECT na tabela inteira. Em um cenário com alto volume de dados, isto é impraticável.</p>
<p>Portanto, o melhor a se fazer é utilizar o Modo Query.</p>
<p>Vamos demonstrar como os dois tipos de busca funcionam. Na página da tabela "Config", veremos a seção "Verificar ou consultar itens", onde a opção "Verificar" está marcada. Ela corresponde em português ao Modo Scan. Já a opção "Consulta" corresponde ao Modo Query.</p>
<h2>Modo Scan</h2>
<p>Verificaremos na tabela "Config" os atributos da pessoa usuária com <em>Id</em> 1.</p>
<p>Para isso, com a opção "Verificar" selecionada, acessaremos a seção "Filtros", onde digitaremos "user_id" no campo "Nome do atributo" e adicionaremos o valor 1 no campo "valor".</p>
<p>Abaixo destes campos, selecionaremos o botão "Adicionar filtro", o que clonará os campos do primeiro filtro. Em "Nome do atributo" digitaremos "setting", enquanto no campo "Valor" digitaremos "funcionalidade_1".</p>
<p>Abaixo dos filtros, selecionaremos o botão "Executar". Abaixo deste, por sua vez, veremos na seção "Itens retornados" o resultado, que retornará a pessoa usuária 1 e a configuração "funcionalidade_1".</p>
<p>A consulta funciona, mas conforme dito anteriormente, é uma consulta pesada e demorada e não serve para casos com volumes grandes de dados.</p>
<h2>Modo Query</h2>
<p>Queremos encontrar determinada funcionalidade que pertence à pessoa usuária 1.</p>
<p>Neste modo, é necessário <strong><em>informar a chave de partição</em></strong>.</p>
<p>Selecionaremos a opção "Consulta", o que exibirá os campos editáveis "user_id (Chave de partição)" e "setting (Chave de classificação)".</p>
<p>No primeiro, digitaremos o valor 1. No segundo, à esquerda do campo de texto, temos um botão de lista suspensa que possui diversas opções de filtro, como "igual a", "maior que", "começa com", entre outros.</p>
<p>Dentre elas, escolheremos "igual a". Já no campo de texto, digitaremos "funcionalidade_1".</p>
<blockquote>
<p>No caso da chave de partição, só podemos efetuar comparações por igualdade, pois o valor precisa corresponder ao pesquisado.</p>
</blockquote>
<p>Em seguida, removeremos os dois filtros que utilizamos no Modo Scan, clicando nos dois botões denominados "Remover", no canto inferior direito de cada filtro.</p>
<p>Poderíamos configurar mais filtros, mas estes não seriam tão "livres" como antes. Abordaremos este assunto posteriormente.</p>
<p>Selecionaremos o botão "Executar", o que retornará, na seção "Itens retornados", o resultado correto: a "funcionalidade_1" da pessoa usuária 1.</p>
<h2>Qual a diferença?</h2>
<p>O "Verificar", ou Modo Scan, trará todos os dados disponíveis, e a partir deles, aplicará os filtros linha a linha.</p>
<p>Já em "Consulta", ou Modo Query, limitamos os dados a serem trazidos. A partir deles, podemos aplicar filtros em um de cada vez. </p>
<p>Com este modo, criamos uma consulta com todos os detalhes que queremos buscar, assim como é feito no SQL, quando realizamos comandos como WHEREs ou GROUP BYs.</p>
<p>Em segundo plano, o<strong>* DynamoDB gera um hash do valor da chave de partição*</strong>, e todos os itens com este <em>hash</em> serão armazenados na mesma partição, ou seja,no mesmo lugar.</p>
<p>Vamos imaginar que o DynamoDB divide a tabela em vários baldes ou grupos. Todos os itens que possuem o "user_id" igual a 1 serão agrupados no mesmo balde.</p>
<p>Quando buscamos por "user_id" igual a 1, recolhemos este balde sem a necessidade de filtrar cada caso e verificar se "user_id" possui o valor desejado.</p>
<p>A chave de classificação também possui uma espécie de índice, semelhante a um banco de dados relacional. Já temos estas informações pré-ordenadas dentro do balde, o que nos permite realizar filtros. É como se dentro do balde tudo estivesse enfileirado e ordenado pela <em>sort key</em>.</p>
<p>Resumindo, a <em>partition key</em> identifica o balde no qual realizaremos a busca, enquanto o <em>sort key</em> ordena os itens dentro deste balde. Este é o motivo pelo qual utilizamos as duas chaves.</p>
<p>Sendo a chave de partição obrigatória e a outra opcional, podemos decidir se ordenamos o balde ou não.</p>
<p>Aprendemos muito sobre um banco de dados completamente novo. Já temos uma tabela que eu utilizo no dia-a-dia, que é bem próxima da realidade, onde adicionamos valores e realizamos consultas complexas, utilizando filtros.</p>
<h2>Buscas diferentes</h2>
<p>Se quiséssemos buscar todas as pessoas usuárias que possuem a "funcionalidade_1" habilitada — ou seja, igual a <code>true</code>. Com faríamos isso?</p>
<p>Conforme dito anteriormente, com o cenário atual, isso não é possível.</p>
<p>A seguir, vamos entender como podemos realizar consultas de outro modo, mas ainda usufruindo da otimização do Modo Query para não perder a performance.</p>
                        </div>