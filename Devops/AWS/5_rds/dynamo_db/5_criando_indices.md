<div class="formattedText" data-external-links="">
                                <p>Aprendemos muitas coisas sobre bancos de dados na AWS e DynamoDB, como propósito, conceitos e como utilizá-lo na prática. </p>
<p>Agora vamos descobrir como buscar os usuários que possuem a <code>funcionalidade_1</code> habilitada. </p>
<p>Nesse momento, só conseguiríamos fazer essa busca se se fizéssemos um <code>scan</code>. Porém, sabemos que ele deve ser evitado, já que demora muito tempo para buscar, verificar e comparar os atributos com o filtro. </p>
<blockquote>
<p>No nosso caso, como temos 5 itens na nossa tabela, não teria problema, porém em uma tabela extensa é preciso criar algo mais otimizado.</p>
</blockquote>
<p>Vamos retomar de onde paramos na última aula. Na página do DynamoDB, mais especificamente na tela de busca de dados, clicamos no botão "Visualizar detalhes da tabela", localizado no canto superior direito da tela.</p>
<p>Feito isso, no centro da tela encontramos uma barra de menu. O segundo item se chama "<strong>Índices</strong>", clicamos nele. </p>
<blockquote>
<p>Um <strong>índice</strong> permite diferentes tipos de consultas na nossa tabela. </p>
</blockquote>
<p>No <strong>SQL</strong>, quando criamos um índice em uma coluna da tabela, o gerenciador de dados cria outra estrutura que guarda cada um dos itens do índice e mapeia para a linha da tabela, assim a busca é mais otimizada.</p>
<p>Quando criamos um índice no <strong>DynamoDB</strong> atendemos objetivos semelhantes. Nesse caso, existem dois tipos que podem ser utilizados: </p>
<ul><li><strong>índices secundários locais</strong> - a chave de partição do índice deve ser a mesma que a chave de partição da tabela.</li></ul>
<ul><li><strong>índices secundários globais</strong> - a chave primária do índice pode ser qualquer dos atributos de sua tabela.</li></ul>
<p>Para entender melhor sobre as diferenças de cada um, você pode acessar a atividade Para Saber Mais, localizada no canto esquerdo da plataforma. </p>
<h1>Criando índices</h1>
<p>Nesse caso, utilizaremos os índices secundários globais. Para isso, no centro da tela, clicamos no botão "Criar índice". Somos encaminhados para uma página com campos de preenchimento.</p>
<p>Nos dois primeiros campos precisamos definir a <strong>Chave de partição do índice</strong> e opcionalmente a <strong>Chave de classificação</strong>. Assim, tudo o que for inserido na tabela será duplicado para o índice e poderemos utilizá-lo para realizar as buscas. </p>
<p><strong>Preenchemos da seguinte forma:</strong></p>
<blockquote>
<p><strong>Chave de partição do índice:</strong> setting</p>
<p><strong>Tipos de dados:</strong> String</p>
<p><strong>Chave de classificação - opcional:</strong> enabled</p>
<p><strong>Tipos de dados:</strong> Número</p>
</blockquote>
<p>O ideal é que a chave de partição seja a mais única possível. Utilizaremos <code>setting</code> para ter mais partições dos dados, já que o <code>enabled</code> possui apenas duas, de verdadeiro ou falso.</p>
<p>Sabemos que a chave de classificação é do tipo booleano, porém, como não há essa opção no campo de preenchimento, selecionamos "Número".</p>
<p>Descendo a tela encontramos campos referentes a capacidade da tabela, nesse caso, utilizaremos os mesmos da tabela base.</p>
<p>Em <strong>Projeções de atributos</strong> definimos o que queremos recuperar no índice, podendo ser:</p>
<ul><li>Todos os atributos da tabela;</li><li>Somente o índice e as chaves primárias;</li><li>Todos os atributos descritos em "Only keys" e outros que não são a chave, especificados por nós.</li></ul>
<p>Selecionamos a primeira opção e depois, no canto inferior direito, clicamos no botão "Criar". </p>
<blockquote>
<p>Lembrando que criamos um índice segundário global pois precisamos de uma <strong>chave de partição diferente</strong>. </p>
</blockquote>
<p>Agora, vamos tentar utilizar esse índice. Clicamos no botão laranja "Explorar itens da tabela", localizado no canto superior direito. Nessa nova tela, faremos uma consulta, ou seja, uma <code>query</code>.</p>
<p>Clicamos no campo "Selecionar uma tabela ou índice" e selecionamos o índice que acabamos de criar. Em seguida, clicamos em "Consulta" e no campo <strong>setting (Chave de partição)</strong> escrevemos <code>funcionalidade_1</code>. </p>
<p>Abaixo temos o campo <strong>enabled (Chave de classificação)</strong> que traz valores verdadeiros ou falso. Porém, a única opção que temos para selecionar é "Igual a", seguido de um número, se fizermos isso ele não irá funcionar. Porém, testaremos utilizando o número "1" como valor da chave.</p>
<p>Ao clicar no botão "Executar", localizado logo abaixo, a consulta é feita de forma rápida, porém nada é retornado, pois não temos nenhum item com <code>enabled</code> igual a 1. </p>
<p>As chaves só podem possuir os tipos: Número, String ou Binário. Já os atributos podem possuir qualquer valor, então em <code>enabled</code> ele poderia ser booleano, pois é um atributo. </p>
<p>Mas, como essa não é uma possibilidade, podemos modificar cada um dos itens da tabela de <code>enabled</code> para <code>número</code> ou <code>string</code> ao invés de <code>booleano</code>.</p>
<p>Faremos isso. No topo da tela, clicamos no botão "Explorar itens da tabela". Selecionamos a opção "Verificar" e abaixo selecionamos a tabela. Feito isso, clicamos no botão "Executar".</p>
<p>Feito isso, aparece na tela os <strong>Itens retornados</strong>. Selecionamos o primeiro item e clicamos no botão "Remove", no canto direito da tela, para remover o <code>enabled</code>. </p>
<p>Em seguida, no canto superior direito, clicamos em "Adicionar outro atributo" e escolhemos a opção "Número". No novo campo escrevemos "enabled" e ao lado definimos o número "0" e salvamos.</p>
<p>Repetiremos esse procedimento para <strong>todos os itens retornados</strong>, mudando apenas o número de cada <code>enabled</code>. Dessa forma: </p>
<blockquote>
<p>Primeiro item: enabled 0</p>
<p>Segundo item: enabled 1</p>
<p>Terceiro item: enabled 1</p>
<p>Quarto item: enabled 0</p>
</blockquote>
<p>Agora. Subimos a tela e clicamos em "Consulta" e no campo de baixo selecionamos o índice que criamos. </p>
<p>No campo <strong>setting</strong> escrevemos "funcionalidade_1" e no campo <strong>enabled</strong> manteremos a opção selecionada "igual a 1". Ao Clicarmos em "Executar" temos como retorno um item com o <code>user_id</code> 1.</p>
<p>Se mudarmos o número para 0, que é igual a <code>false</code>, e clicarmos em "Executar" temos como retorno o <code>user_id</code> 2.</p>
<p><strong>Dessa forma conseguimos criar um índice secundário global.</strong></p>
<h1>Recapitulando:</h1>
<p>Quando inserimos ou atualizarmos um item na tabela é como se fosse <strong>duplicado para o índice</strong>. Isso significa que consumimos mais armazenamento e recursos. </p>
<p>Além disso, o <strong>índice secundário global</strong> pode ter a chave de partição e chave de classificação que quisermos, podemos definir qualquer atributo.</p>
<p>Já o <strong>índice secundário local</strong> precisa ter a mesma chave de partição da tabela. É como se ele buscasse na tabela e ordenasse de forma diferente.</p>
<p>Nós ja conhecemos todos os principais conceitos do DynamoDB. Fizemos as configurações básicas, criamos uma tabela, entendemos os conceitos de tabela, atributo e item, entendemos sobre as chaves e sobre os índices. Isso é basicamente o que precisamos para começar a utilizar o DynamoDB, então, a partir de agora vamos avançando no conteúdo.  </p>
<p>Na próxima aula aprenderemos sobre a <strong>precificação do DynamoDB</strong>, afinal, tudo o que fazemos nele é cobrado de alguma forma.</p>
<p><strong>Até lá!</strong></p>
                        </div>