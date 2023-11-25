<div class="formattedText" data-external-links="">
                                <p>Agora vamos aprender sobre versionamento. Nessa atividade, continuaremos a usar a <em>CLI</em> para operar o <em>S3</em>. </p>
<p>O versionamento no <em>S3</em> serve para manter várias versões de um mesmo objeto. <a href="https://docs.aws.amazon.com/pt_br/AmazonS3/latest/userguide/versioning-workflows.html" rel="nofollow noopener" target="_blank">Vamos acessar a documentação</a> para saber um pouco mais sobre isso.</p>
<p>Rolando a página para baixo, encontraremos a seção "IDs de versão". Nela, há uma ilustração que explica a aplicabilidade do versionamento: conforme as alterações vão acontecendo, várias versões do mesmo arquivo são criadas. Toda alteração feita é considerada como um novo objeto, com um <em>ID</em> próprio. </p>
<p>Para que isso aconteça, precisaremos habilitar a função de versionamento. Se estivermos no <em>console</em>, faremos isso acessando "S3 &gt; rmerces-labs4 &gt; Properties". Depois, rolaremos a página para baixo até a seção <em>"Bucket Versioning"</em>. Nela, clicaremos em <em>"Edit"</em>, selecionaremos <em>"Enable"</em> e salvaremos. </p>
<p>Porém, vamos fazer isso via <em>CLI</em>. Primeiro, vamos verificar os <em>buckets</em> disponíveis com <code>aws s3 ls</code>. Criaremos um novo <em>bucket</em>, para manter o padrão de um repositório por atividade, com <code>aws s3 mb s3://rmerces-labs5</code>. Com o <em>bucket</em> criado, vamos autorizar o versionamento com um comando longo que pode ser encontrado na parte de "s3api" do <em>AWS CLI Command Reference</em>.</p>
<p>Para finalizar, vamos executar um comando igualmente longo, para verificar se tudo certo:</p>
<pre class="prettyprint"><code class="hljs language-sql">aws s3 ls
aws s3 mb s3:<span class="hljs-operator">/</span><span class="hljs-operator">/</span>rmerces<span class="hljs-operator">-</span>labs5
aws s3api put<span class="hljs-operator">-</span>bucket<span class="hljs-operator">-</span><span class="hljs-keyword">versioning</span> <span class="hljs-comment">--bucket rmerces-labs5 --versioning-configuration Status=Enabled</span>
aws s3api <span class="hljs-keyword">get</span><span class="hljs-operator">-</span>bucket<span class="hljs-operator">-</span><span class="hljs-keyword">versioning</span> <span class="hljs-comment">--bucket rmerces-labs5</span></code><button type="button" class="clipit">Copiar código</button></pre><blockquote>
<p>Obs:
No início, essas linhas grandes podem parecer confusas. Mas, no futuro, você poderá automatizar esse processo com <em>scripts</em>.</p>
</blockquote>
<p>Faremos um exercício para colocar o versionamento em prática, subindo arquivos e gerando novas versões.</p>
<p>Na próxima aula, vamos dar continuidade à nossa rota de aprendizado em <em>S3</em>!</p>
                        </div>