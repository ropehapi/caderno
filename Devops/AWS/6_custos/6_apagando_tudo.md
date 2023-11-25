<div class="formattedText" data-external-links="">
                                <p>Caso você esteja recebendo uma cobrança ou tenha terminado algum curso da Alura e tenha medo de ter esquecido algum recursos que pode gerar custos ligado à AWS, tem uma ferramenta que pode te ajudar. Essa ferramenta apaga <strong>todas as informações que estiverem na conta</strong>, então só use se tiver <strong>certeza</strong> que não terá problema apagar todos os dados.</p>
<p>A ferramenta se chama <em><strong>aws nuke</strong></em>. Começaremos lendo a documentação dela para descobrirmos como utilizá-la e algumas questões de segurança. Para encontrar a documentação, acessaremos o Google e buscaremos por "aws nuke". </p>
<p>Nessa busca, abriremos em uma nova guia o resultado "rebuy-de/aws-nuke", que nos direciona para a <a href="https://github.com/rebuy-de/aws-nuke" rel="nofollow noopener" target="_blank">documentação do aws-nuke no GitHub</a>. Outro resultado que abriremos também é uma <a href="https://docs.aws.amazon.com/pt_br/prescriptive-guidance/latest/patterns/automate-deletion-of-aws-resources-by-using-aws-nuke.html" rel="nofollow noopener" target="_blank">página da AWS com informações sobre o aws-nuke</a>.</p>
<h2>Página da AWS</h2>
<p><em>Por que a AWS tem uma página sobre uma ferramenta que, apesar de funcionar na AWS, não foi feita por ela?</em> Essa ferramenta ficou muito popular e muitas pessoas usam, então a AWS decidiu adotá-la, porque ela soluciona um problema real da AWS. Por esse motivo, ela decidiu adicionar uma página de explicação.</p>
<p>A parte mais importante na explicação da página da Amazon é um aviso que encontramos logo no início:</p>
<blockquote>
<p>Aviso: o aws-nuke é uma ferramenta de código aberto que exclui quase todos os recursos na conta alvo da Amazon Web Services (AWS) e nas regiões da AWS. Certifique-se de compreender totalmente o impacto que a ferramenta terá no ambiente de destino antes de usá-la para excluir recursos. Essa solução não é destinada ao uso em um ambiente de produção. Recomendamos implementar essa solução somente em ambientes de <em>sandbox</em> ou de desenvolvimento. Execute uma operação a seco para confirmar que a solução não exclui nenhum recurso que ainda seja necessário. Para obter mais informações, consulte a <a href="https://github.com/rebuy-de/aws-nuke#caution" rel="nofollow noopener" target="_blank">seção Cuidado do aws-nuke README (GitHub)</a>.</p>
</blockquote>
<p>Então <strong>não devemos utilizá-la no ambiente de produção</strong>, porque ela apaga muitas informações da nossa conta, incluindo o serviço que está em produção, servindo nossos clientes. A única circunstância em que podemos usar essa ferramenta no ambiente de produção é se quisermos <strong>apagar a produção inteira</strong>: banco de dados, APIs, serviços, backups e assim por diante.</p>
<p>O recomendado é usar a aws-nuke apenas em ambientes de <em>sandbox</em> ("caixa de areia") ou desenvolvimento, seja de aplicação ou individual. Portanto, usamos somente em ambientes em que podemos destruir tudo que ele contém.</p>
<h2>Documentação do aws-nuke</h2>
<p>Agora podemos <a href="https://github.com/rebuy-de/aws-nuke" rel="nofollow noopener" target="_blank">acessar a documentação da ferramenta</a>, que está no README do GitHub. A documentação está em inglês, então leremos com calma para entendermos todos os pontos que ele avisa para tomarmos cuidado (<em>caution</em>) e o que precisaremos para executar o aws-nuke.</p>
<p>Logo no começo ele nos avisa que o <strong><em>aws-nuke</em> é uma ferramenta muito destrutiva</strong>, e nos pede cuidado ao usá-la, ou acabaremos deletando dados de produção. Eu vou repetir muito essa parte de dados de produção, porque caso executemos o aws-nuke no ambiente de produção, perderemos a linha de produção, como os bancos de dados e todos os dados que ele continha.</p>
<h3>Dicas de segurança</h3>
<p>A documentação mais uma vez nos avisa para ter cuidado ao usar a ferramenta em uma conta da AWS, principalmente quando não podemos perder todos os recursos. Além disso, ela passa algumas medidas de segurança, que analisaremos para fazer algumas configurações na nossa conta.</p>
<blockquote>
<p>Dicas de segurança</p>
<ol><li><p>Por padrão, o aws-nuke lista apenas todos os recursos com armas nucleares. Você precisa adicionar <code>--no-dry-run</code> para realmente excluir recursos.</p>
</li><li><p>aws-nuke pede duas vezes para você confirmar a exclusão inserindo o alias da conta. A primeira vez é logo após o início e a segunda vez após listar todos os recursos com armas nucleares.</p>
</li><li><p>Para evitar apenas exibir um ID de conta, que pode ser facilmente ignorado por humanos, é necessário definir um <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/console_account-alias.html" rel="nofollow noopener" target="_blank">Alias de conta</a> para sua conta. Caso contrário, o aws-nuke será abortado.</p>
</li><li><p>O Alias da conta não deve conter a string <code>prod</code>. Essa string é codificada e é recomendável adicioná-la a cada conta de produção real (por exemplo, <code>mycompany-production-ecr</code>).</p>
</li><li><p>O arquivo de configuração contém um campo de lista de bloqueio. Se o ID da conta que você deseja destruir fizer parte dessa lista de bloqueio, o aws-nuke será interrompido. É recomendável adicionar todas as contas de produção a esta lista de bloqueio.</p>
</li><li><p>Para garantir que você não ignore o recurso de lista de bloqueio, a lista de bloqueio deve conter pelo menos um ID de conta.</p>
</li><li><p>O arquivo de configuração contém configurações específicas da conta (por exemplo, filtros). A conta que você deseja destruir deve estar explicitamente listada lá.</p>
</li><li><p>Para garantir que uma conta aleatória não seja excluída acidentalmente, é necessário especificar um arquivo de configuração. Recomenda-se ter apenas um único arquivo de configuração e adicioná-lo a um repositório central. Dessa forma, a lista de bloqueio de contas é muito mais fácil de gerenciar e manter atualizada.</p>
</li></ol>
</blockquote>
<p>Primeiramente, por padrão o aws-nuke lista apenas os recursos a serem destruídos. Para realmente executá-lo e fazer com que ele apague tudo, precisamos adicionar o comando <code>--no-dry-run</code> depois do nome dele.</p>
<p>Outro ponto é que aws-nuke pede duas vezes a confirmação antes de deletar tudo, entrando com o alias da conta, ou seja, o nome da conta. Nós daremos esse nome para nossa conta e passaremos por essa etapa, não se preocupem. </p>
<p>Esse nome será pedido logo após a inicialização da ferramenta e, em uma segunda vez, após listar todos os recursos apagáveis. Portanto, precisamos nos atentar a isso para inserirmos o alias duas vezes e termos certeza da conta que estamos executando.</p>
<p>Para evitar de colocarmos apenas o ID da conta, que é um número enorme comumente ignorado, que veremos logo mais, é necessário configurar um alias para a conta. Caso não tenha um alias, o aws-nuke vai cancelar toda operação.</p>
<p>Esse alias não pode ter em nenhuma parte escrito "prod", que vem de "produção". Qualquer string com "prod" está travada dentro do código do aws-nuke para evitarmos apagar uma conta de produção.</p>
<p>Sendo assim, é recomendado que adicionemos um alias às nossas contas de produção em um modelo como "nomedaempresa-producao-ecr". Pode ser outro nome, mas o alias precisa ter "prod" em alguma parte do nome.</p>
<p>Outra dica é que o arquivo de configuração precisa ter uma <em>blocklist</em> (lista de bloqueio), ou seja, um espaço para adicionarmos um ID de conta que não será apagada. Além dessa etapa ser <strong>necessária</strong>, é recomendado que adicionemos a ela todos os IDs de conta de produção nessa <em>blocklist</em> para garantirmos que não apagaremos uma conta de produção por engano. É enfatizado que precisa de ao menos um ID na <em>blocklist</em>.</p>
<p>O arquivo de configuração precisa ter algumas configurações específicas sobre a conta, como alguns filtros. Inclusive, a conta que queremos apagar precisa ser <strong>explicitamente listada</strong> nesse arquivo de configuração, e descobriremos como fazer isso também.</p>
<p>Para ter certeza de que não deletemos por acidente uma conta aleatória logada no nosso computador, <strong>é necessário especificarmos o arquivo de configuração</strong>, porque nele estará a conta que queremos deletar. Por isso é recomendado termos apenas um arquivo de configuração no repositório central, deixando mais fácil o manejo da lista de bloqueio.</p>
<h3>Casos de uso</h3>
<p>Na <a href="https://github.com/rebuy-de/aws-nuke#use-cases" rel="nofollow noopener" target="_blank">seção <strong><em>Use cases</em> (Casos de uso)</strong></a>, o segundo caso listado é bem parecido com o nosso caso. Nesse exemplo ele fala sobre pessoas desenvolvedoras usando contas na AWS para criar um cluster Kurbenetes para serviços de testes. Com o aws-nuke é muito fácil limpar essas contas no final do dia, mantendo os custos baixos.</p>
<p>O outro caso de uso é, ao terminar um curso da Alura, não ter certeza que apagou tudo. Rodando o aws-nuke teremos certeza de que tudo foi apagado.</p>
<h3>Lançamentos</h3>
<p>Encontramos o aws-nuke na <a href="https://github.com/rebuy-de/aws-nuke#releases" rel="nofollow noopener" target="_blank">seção <strong><em>Releases</em> (Lançamentos)</strong></a>, onde tem um <a href="https://github.com/rebuy-de/aws-nuke/releases" rel="nofollow noopener" target="_blank">link para página de lançamentos do aws-nuke</a>. Acessaremos essa página depois para fazermos o download e executar essa ferramenta, mas antes vamos ler a seção sobre o uso.</p>
<h3>Uso</h3>
<p>Na <a href="https://github.com/rebuy-de/aws-nuke#usage" rel="nofollow noopener" target="_blank">seção <em>Usage</em> (Uso)</a>, encontramos mais informações sobre o arquivo de configuração. Logo no começo temos um exemplo de código para o arquivo de configuração mínimo</p>
<pre class="prettyprint"><code class="hljs language-makefile"><span class="hljs-section">regions:</span>
- eu-west-1
- global

<span class="hljs-section">account-blocklist:</span>
- <span class="hljs-string">"999999999999"</span> <span class="hljs-comment"># production</span>

<span class="hljs-section">accounts:</span>
  <span class="hljs-string">"000000000000"</span>: {} <span class="hljs-comment"># aws-nuke-example</span>
</code><button type="button" class="clipit">Copiar código</button></pre>
<p>A primeira informação que especificamos é as regiões (<code>regions</code>) onde queremos apagar dados, ou deixamos a configuração como <code>global</code>, para apagarmos tudo em todas as regiões. Em seguida temos o <code>account-blocklist</code>, onde adicionamos o ID de uma conta que não será apagada. Por fim, temos o <code>accounts</code>, onde passamos o ID da conta que queremos apagar.</p>
<p>Nessa seção também tem um exemplo do retorno da execução, onde vemos que ele tenta apagar também o nome de usuário IAM que está sendo usado para acessar essa conta. É melhor não remover esse usuário, ou não conseguiremos logar com ele, apenas com o nome de usuário principal.</p>
<p>Para evitar a exclusão de usuário IAM, usamos alguns filtro (<code>filters</code>), como a documentação mostra no segundo exemplo de código.</p>
<pre class="prettyprint"><code class="hljs language-makefile"><span class="hljs-section">regions:</span>
- eu-west-1

<span class="hljs-section">account-blocklist:</span>
- <span class="hljs-string">"999999999999"</span> <span class="hljs-comment"># production</span>

<span class="hljs-section">accounts:</span>
  <span class="hljs-string">"000000000000"</span>: <span class="hljs-comment"># aws-nuke-example</span>
    filters:
      IAMUser:
      - <span class="hljs-string">"my-user"</span>
      IAMUserPolicyAttachment:
      - <span class="hljs-string">"my-user -&gt; AdministratorAccess"</span>
      IAMUserAccessKey:
      - <span class="hljs-string">"my-user -&gt; ABCDEFGHIJKLMNOPQRST"</span>
</code><button type="button" class="clipit">Copiar código</button></pre>
<p>Nesses filtro passamos o <code>IAMUser</code> com o nome de usuário. Esse usuário precisa ter uma política específica e uma chave de acesso. Usaremos um arquivo de configuração parecido com esse.</p>
<h2>Conclusão</h2>
<p>Após acessarmos todas essas informações, no próximo vídeo executaremos o aws-nuke.</p>
                        </div>