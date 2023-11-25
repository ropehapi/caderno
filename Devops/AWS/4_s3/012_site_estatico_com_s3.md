<div class="formattedText" data-external-links="">
                                <p>Em breve, vamos trabalhar com o <em>CloudFront</em>, nosso serviço de <em>CDN</em>. Antes disso, porém, vamos limpar nossos <em>buckets</em>, para evitar a possibilidade de que ultrapassemos os limites do <em>free tier</em> e sejamos cobrados pelo uso.</p>
<p>Vamos criar um site estático, sem preocupações com servidor. É possível fazer isso a partir da criação de um <em>bucket</em>, que fará as vezes de servidor, desde que o conteúdo da página seja estático.</p>
<p>Acessaremos "Amazon S3 &gt; Buckets &gt; Create bucket". Em <em>"Bucket name"</em>, vamos digitar "site.rmerceslabs.com". Caso nosso interesse, no futuro, seja vincular nosso domínio, precisaremos nomear o <em>bucket</em> com o <em>host</em> e com o domínio nos quais faremos o apontamento.</p>
<p>Não faremos isso neste treinamento. Por isso, poderemos dar o nome que quisermos ao repositório. A <em>"AWS Region"</em> será, novamente, "US East (N. Virginia) us-east-1". Depois, criaremos o <em>bucket</em> sem outras alterações na configuração.</p>
<p>Vamos acessar "site.rmerceslabs.com &gt; Properties &gt; Static website hosting &gt; Edit". Nesta página, vamos informar nossa página principal, que é "index.html", na seção <em>"Index document"</em>. Depois que salvarmos, o <em>bucket</em> será capaz de hospedar um site após mais alguns passos.</p>
<p>Depois de copiar o código, vamos acessar "site.rmerceslabs.com &gt; Block public access (bucket settings) &gt; Edit". Agora, vamos retirar a seleção de <em>"Block all public access"</em> e avançar para a próxima página, após confirmar a alteração.</p>
<p>Depois disso, vamos rolar a página para baixo, até a seção <em>Bucket policy</em>. Nela, clicaremos em "Edit &gt; Policy examples". Em <em>"Policy"</em>, adicionaremos a política que pode ser encontrada em <a href="https://docs.aws.amazon.com/pt_br/AmazonS3/latest/userguide/HostingWebsiteOnS3Setup.html#step3-edit-block-public-access" rel="nofollow noopener" target="_blank">https://docs.aws.amazon.com/pt_br/AmazonS3/latest/userguide/HostingWebsiteOnS3Setup.html#step3-edit-block-public-access</a>, mas substituindo "Bucket-Name" pelo nome do nosso repositório:</p>
<pre class="prettyprint"><code class="hljs language-bash">{
    <span class="hljs-string">"Version"</span>: <span class="hljs-string">"2012-10-17"</span>,
    <span class="hljs-string">"Statement"</span>: [
        {
            <span class="hljs-string">"Sid"</span>: <span class="hljs-string">"PublicReadGetObject"</span>,
            <span class="hljs-string">"Effect"</span>: <span class="hljs-string">"Allow"</span>,
            <span class="hljs-string">"Principal"</span>: <span class="hljs-string">"*"</span>,
            <span class="hljs-string">"Action"</span>: [
                <span class="hljs-string">"s3:GetObject"</span>
            ],
            <span class="hljs-string">"Resource"</span>: [
                <span class="hljs-string">"arn:aws:s3:::site
                                    rmerceslabs.com/*"</span>
            ]
        }
    ]
}</code><button type="button" class="clipit">Copiar código</button></pre><p>Basta salvar para aplicar as alterações. Agora o <em>bucket</em> está público. Chegou a hora de abrirmos a <em>CLI</em> para adicionar objetos ao nosso repositório. Vamos executar o comando <code>mkdir site.rmerceslabs.com</code> para criar um diretório com esse nome.</p>
<p>Depois, vamos abri-lo com <code>cd site.rmerceslabs.com/</code> e inserir um <em>index HTML</em>, com o comando <code>vi index.html</code>. O <em>template</em> que usaremos, após a execução, também pode ser encontrado em <a href="https://docs.aws.amazon.com/pt_br/AmazonS3/latest/userguide/HostingWebsiteOnS3Setup.html#step3-edit-block-public-access" rel="nofollow noopener" target="_blank">https://docs.aws.amazon.com/pt_br/AmazonS3/latest/userguide/HostingWebsiteOnS3Setup.html#step3-edit-block-public-access</a>:</p>
<pre class="prettyprint"><code class="hljs language-xml"><span class="hljs-tag">&lt;<span class="hljs-name">html</span> <span class="hljs-attr">xmlns</span>=<span class="hljs-string">"http://www.w3.org/1999/xhtml"</span> &gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">head</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">title</span>&gt;</span>My Website Home Page<span class="hljs-tag">&lt;/<span class="hljs-name">title</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">head</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">body</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">h1</span>&gt;</span>Welcome to RMERCESLABS.COM<span class="hljs-tag">&lt;/<span class="hljs-name">h1</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-name">p</span>&gt;</span>Now hosted on Amazon S3!<span class="hljs-tag">&lt;/<span class="hljs-name">p</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">body</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">html</span>&gt;</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Agora vamos salvar o conteúdo com o comando <code>x</code>. Depois, precisaremos enviar isso tudo para o <em>bucket</em>, ainda através da <em>CLI</em>, com <code>aws s3 cp index.html s3://site.rmerceslabs.com</code>. </p>
<p>Vamos verificar se o processo funcionou. De volta ao nosso bucket, vamos acessar a aba <em>"Properties"</em> para identificar a <em>URL</em>. No fim da última seção da página, <em>"Static website hosting"</em>, encontraremos o endereço do site.</p>
<p>Se o abrirmos, conseguiremos acessar a página web. Portanto, tivemos sucesso na hospedagem do nosso estático via <em>bucket</em>.</p>
<p>No próximo vídeo, vamos usar o <em>CloudFront</em> vinculado a um projeto de <em>streaming</em> de vídeos e criar uma <em>URL https</em>.</p>
                        </div>