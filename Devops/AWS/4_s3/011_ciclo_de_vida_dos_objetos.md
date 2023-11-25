<div class="formattedText" data-external-links="">
                                <p>Agora vamos entender o que são classes de armazenamento e <em>lifecycle</em> no <em>S3</em>.</p>
<p>Vamos acessar a página inicial da <em>AWS S3</em> no navegador e, nela, selecionar a aba "Classes de armazenamento". Há muitas classes, mas <em>S3 Standard</em> é o padrão do <em>S3</em>. Essa é a opção que nos permite recuperar arquivos mais rapidamente e, por isso, ela é a primeira da lista. Quanto mais descemos para os outros padrões, o tempo de recuperação aumenta.</p>
<p>Em contrapartida, o preço de cada classe reduz na mesma proporção em que o tempo de recuperação aumenta. Em outras palavras, quanto mais caro pagarmos, mais rápido poderemos acessar os objetos. </p>
<p>Isso é importante porque na hora de montar nosso projeto, precisaremos considerar esses fatores. Para arquivos que precisam ser armazenados por mais tempo, podemos usar o <em>S3 Glacier Deep Archive</em>, a opção mais barata. Quando o projeto precisa de acesso mais rápido, porém, precisaremos de classes mais próximas do <em>S3 Standard</em>.</p>
<p>Agora vamos acessar a aba "Definição de preço". </p>
<blockquote>
<p>Obs:
É importante lembrar que o valor varia de acordo com a região selecionada. No vídeo, o instrutor seleciona a opção mais barata, "Leste dos EUA (Norte da Virgínia)".</p>
</blockquote>
<p>A escolha deve sempre levar em conta a frequência de acesso dos arquivos que estamos manipulando. Vamos voltar ao console e selecionar o "rmerces-labs5 &gt; Management &gt; Create lifecycle". Vamos trabalhar com três cenários.</p>
<p>No primeiro, mudaremos a classe de armazenamento depois de 30 dias. Em <em>"Lifecycle rule name"</em>, vamos dar o nome de "move30" à regra. Em <em>"Choose a role scope"</em>, vamos selecionar a segunda opção, que aplica a regra a todos os objetos do repositório, <em>"Apply to all objects in the bucket"</em>. </p>
<p>Agora, em <em>"Lifecycle rule actions"</em> vamos selecionar as ações dessa regra. Selecionaremos <em>"Move current versions of objects between storage classes"</em> e <em>"Move noncurrent versions of objects between storage classes"</em>. Podemos escolher entre transicionar entre classes de armazenamento ou excluir o arquivo. </p>
<p>Em <em>"Transition current versions of objects between storage classes"</em>, vamos manipular as versões atuais, selecionando a opção "<em>Standard-IA"</em> e, à direita, definiremos o número de dias. No vídeo, o instrutor determinou 30 dias. Faremos o mesmo com as versões obsoletas, na seção debaixo. Depois disso, podemos clicar em <em>"Create rule"</em>. </p>
<p>Como resultado, temos a regra "move30". Ela define que, no trigésimo dia, todas as versões, sejam elas atuais ou antigas, serão movidas para <em>"Standard-IA"</em>. </p>
<p>Vamos voltar para "Lifecycle configuration &gt; Create lifecycle rule", para criar outra regra. <em>"Lifecycle rule name"</em>, dessa vez, será "move30-90".Assim como na regra anterior, nesta também selecionaremos a opção <em>"Apply to all objects in the bucket"</em> em <em>"Choose a role scope"</em>.</p>
<p>As <em>"Lifecycle rule actions"</em> selecionadas serão, novamente, <em>"Move current versions of objects between storage classes"</em> e <em>"Move noncurrent versions of objects between storage classes"</em>. Assim como na regra anterior, vamos determinar que em 30 dias os objetos serão transferidos para <em>"Standard-IA"</em>. </p>
<p>Porém, antes de continuar, vamos clicar em <em>"Add transition"</em> e determinar que, após 90 dias, os arquivos serão movidos para <em>"Glacier Deep Archive"</em>. </p>
<p>Também poderíamos adicionar outra transição, determinando que, depois de algum tempo, as versões anteriores fossem excluídas.</p>
<blockquote>
<p>Obs:
Quando formos trabalhar com classes, precisaremos verificar o tamanho dos objetos e checar a documentação do <em>S3</em>, para que saibamos quais conjuntos de regras se adequam a ele.</p>
</blockquote>
<p>Agora vamos criar a última regra em "Lifecycle configuration &gt; Create lifecycle rule". O <em>"Lifecycle rule name"</em> será "exclui30" e, em <em>"Choose a rule scope"</em>, selecionaremos, novamente, <em>"Apply to all objects in the bucket"</em>. Essa regra excluirá os objetos após 30 dias.</p>
<p>As <em>"Lifecycle rule actions"</em> serão as duas últimas, <em>"Permanently delete noncurrent versions of objects"</em> e <em>"Delete exprired object delete markers or incomplete multipart uploads"</em>.</p>
<p>Na seção debaixo, vamos inserir "30" em <em>"Days after objects become noncurrent"</em>. Abaixo, selecionaremos as duas opções, <em>"Delete expired object delete markers"</em> e <em>"Delete incomplete multipart uploads"</em> e determinar o número de 30 dias, em <em>"Number of days"</em>. Depois disso, basta clicar em <em>"Create rule"</em>.</p>
<p>No próximo vídeo, vamos conhecer o <em>CloudFront</em>, associado diretamente ao <em>S3</em>.</p>
                        </div>