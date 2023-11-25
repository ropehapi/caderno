<div class="formattedText" data-external-links="">
                                <p>Considerando um cenário real no qual você vai realmente implantar essas soluções em uma empresa, o ideal é utilizar a <strong>calculadora de custos</strong>. Assim é possível repassar para a equipe financeira ou de contratação de serviços uma <strong>estimativa do preço</strong>.</p>
<p>Vamos entender como funcionam os <strong>preços do DynamoDB</strong>.</p>
<h1>Precificação do DynamoDB</h1>
<p>Acessando o <a href="https://aws.amazon.com/pt/dynamodb/pricing/?refid=e27ab896-a1e8-4e50-93c5-d7ce76fe04ed" target="_blank" rel="nofollow noopener noreferrer">site da AWS </a>, na página <strong>Preço do Amazon DynamoDB</strong>, notamos que ele cobra pelos seguintes serviços:</p>
<ul><li><p>Cada leitura feita;</p>
</li><li><p>Cada gravação feita, seja a inserção ou atualização de um novo item;</p>
</li><li><p>Conforme o uso do espaço de armazenamento de dados.</p>
</li></ul>
<p>Um item muito grande será mais cobrado no armazenamento de dados. Já muitos itens pequenos terão maior cobrança na gravação de dados.</p>
<p><strong>Os preços são definidos de duas formas:</strong></p>
<blockquote>
<p><strong>Capacidade sob demanda:</strong> O DynamoDB cobra pelas leituras e gravações que o aplicativo executa nas tabelas, ou seja, se consumiu mais dados a AWS automaticamente aumenta a capacidade.</p>
<p><strong>Capacidade provisionada:</strong> Nessa opção é possível especificar o número de leituras e gravações por segundo que você espera que seu aplicativo necessite.</p>
</blockquote>
<p>A capacidade sob demanda é um pouco mais cara, porém é mais prática, pois é automática, portanto não necessita da definição da quantidade de cada recurso utilizado. Já a capacidade provisionada é o oposto, ou seja, é preciso entender o funcionamento e assim definir cada recurso.</p>
<blockquote>
<p>No nosso caso, por padrão, como desenvolvemos uma tabela no modo rápido, ele criou um modo de capacidade provisionada.</p>
</blockquote>
<p>Embora sejam pagas, ambas as capacidades possuem <strong>opções gratuitas</strong>. Vamos analisá-las.</p>
<h1>Definição de preço para o modo de capacidade sob demanda</h1>
<p>Clicando no<a href="https://aws.amazon.com/pt/dynamodb/pricing/on-demand/" rel="nofollow noopener" target="_blank"> link referente a capacidade sob demanda</a>, encontramos mais informações sobre esse plano. </p>
<p><strong>Essa opção gratuita oferece:</strong></p>
<ul><li><p>25 GB de armazenamento de dados para tabelas que usam a classe de tabela DynamoDB Standard;</p>
</li><li><p>2,5 milhões de solicitações de leitura do Streams do DynamoDB ;</p>
</li><li><p>100 GB de transferência de dados para a Internet, agregados em todos os serviços e regiões da AWS (exceto China e GovCloud).</p>
</li></ul>
<blockquote>
<p>Repare que na opção de leitura oferecida não se refere a feita no <strong>banco de dados</strong> e sim a um <strong>serviço chamado Streams</strong>, que funciona da seguinte forma: quando acontece um evento no DynamoDB ele manda ara uma função lambda. </p>
</blockquote>
<h1>Definição de preço para o modo de capacidade provisionada</h1>
<p>Ao acessarmos a <a href="https://aws.amazon.com/pt/dynamodb/pricing/provisioned/" rel="nofollow noopener" target="_blank">página de capacidade provisionada</a>, encontramos os seguintes benefícios oferecidos na opção gratuita:  </p>
<ul><li><p>25 WCUs e 25 RCUs de capacidade provisionada para tabelas que usam a classe de tabela DynamoDB Standard;</p>
</li><li><p>25 GB de armazenamento de dados para tabelas que usam a classe de tabela DynamoDB Standard;</p>
</li><li><p>25 rWCUs para tabelas globais usando a classe de tabela DynamoDB Standard implantada em duas regiões da AWS;</p>
</li><li><p>2,5 milhões de solicitações de leitura do Streams do DynamoDB;</p>
</li><li><p>1 GB de transferência de dados para fora (15 GB nos primeiros 12 meses), agregados em todos os serviços da AWS.</p>
</li></ul>
<p>O primeiro benefício se refere a classe de tabela <strong>DynamoDB Standard</strong>. Vamos nos aprofundar nesse tema em breve, mas considere que esse é o <strong>tipo padrão de uma tabela</strong>, enquanto o outro é uma opção menos acessada e com maior cobrança de armazenamento.</p>
<p>Repare que as unidades de leitura e de escrita são um pouco incompreensíveis. Por exemplo, nessa opção gratuita é oferecido 25 WCUs e 25 RCUs e cada consulta realizada consome um tanto específico dessas unidades. No nosso cenário, cada consulta que fizemos foi de 0.5, ou seja, metade da unidade de uma capacidade de leitura. </p>
<blockquote>
<p>Lembre-se que: cada <strong>benefício</strong> é <strong>calculado mensalmente por região e conta pagante</strong>. Se você possui várias regiões em um nível gratuito e utiliza as 25 WCUs em uma região, você ainda terá esse limite disponível nas outras regiões.</p>
</blockquote>
<p>Feito essa análise podemos perceber que o cálculo do DynamoDB não é tão simples. Por isso é recomendado o uso da calculadora de preços. Se você for implantar essas soluções na produção, é importante ler todo o documento para entender em detalhes como é feito o cálculo.</p>
<p>No próximo vídeo entenderemos um pouco mais sobre alguns termos que apareceram nessa aula, como <strong>sob demanda</strong> e <strong>tabelas do tipo Standard</strong>.</p>
<p><strong>Até lá!</strong></p>
                        </div>