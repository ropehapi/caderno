<div class="formattedText" data-external-links="">
                                <p>Agora que dominamos o console do <em>S3</em>, vamos começar a utilizar sua <em>CLI</em>. Depois disso, vamos aumentar bastante nossa capacidade de interação com o serviço.</p>
<p>Vamos acessar a documentação em <a href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/setup-aws-cli.html" rel="nofollow noopener" target="_blank">https://docs.aws.amazon.com/AmazonS3/latest/userguide/setup-aws-cli.html</a>. Neste link, vamos instalar a <em>CLI</em> da <em>AWS</em> com todas as suas subferramentas para linha de comando. Essa ferramenta não serve apenas para o <em>S3</em>, ela é aplicável, por exemplo, para criação de máquinas virtuais, bancos de dados e outros serviços.</p>
<p>Dentro da <em>AWS CLI</em>, há alguns grupos de comando. No treinamento, vamos utilizar os comandos dos grupos "s3" e "s3api". O primeiro serve para criar, apagar e copiar <em>buckets</em>, e o segundo, para lidar com versionamento, entre outras funções. </p>
<p>Vamos rolar a página para baixo, até que encontremos a seção <em>"To set up the AWS CLI"</em>. Agora, clicaremos em <em>"Getting Set Up with the AWS Command Line Interface"</em>. Cada sistema operacional terá seus próprios detalhes de instalação. No vídeo, o instrutor usa <em>Linux</em>. Por isso, ele copia o código destinado a esse sistema:</p>
<pre class="prettyprint"><code class="hljs language-bash">$ curl <span class="hljs-string">"https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"</span>
unzip awscliv2.zip
sudo ./aws/install</code><button type="button" class="clipit">Copiar código</button></pre><p>Vamos colar o código no terminal do nosso computador e executar o comando <code>aws</code>, para iniciar o processo de configuração, ao qual daremos continuidade com a inserção de <code>aws configure</code>. Mas precisamos, ainda, de uma chave e uma <em>secret</em> para completar o processo.</p>
<p>Para isso, vamos criar um usuário administrador para o <em>S3</em>. Se criássemos um administrador com acesso geral, também teríamos sucesso, mas vamos criar um com acesso apenas a esse serviço.</p>
<p>Para isso, vamos clicar em <em>"Create group"</em> para criar o grupo "s3-admin" e selecionar a <em>policy</em> "AmazonS3FullAccess" para ele. Essa opção dará acesso total ao usuário. Agora, voltaremos à página <em>"User groups"</em>. Ao fazer isso, veremos o ícone que indica a ausência de usuários no grupo que acabamos de criar.</p>
<p>Para resolver o problema, vamos acessar "IAM &gt; Users &gt; Add Users". Na caixa de texto ao lado de <em>"User name"</em>, vamos inserir "s3-admin". Na seção de baixo, <em>"Select AWS access type"</em>, vamos selecionar a primeira opção, <em>"Access key - Programatic access"</em>. Depois disso, podemos avançar para as próximas páginas, sem fazer alterações, e criar o usuário.</p>
<p>Agora, precisamos fazer o download do arquivo <em>.csv</em> e salvar tanto a <em>Access key ID *como a *Secret access key</em> que foram geradas. Precisaremos delas para configurar a <em>AWS CLI</em>. </p>
<blockquote>
<p>Obs:
Você não poderá acessar esses dados no futuro. Se perdê-los, precisará criar outro usuário.</p>
</blockquote>
<p>Agora, de volta ao <em>console</em>, vamos inserir o comando <code>aws configure</code>. O console nos solicitará primeiro a <em>Access key ID</em> e, depois, a <em>Secret Access key</em>. Vamos digitar essas informações. Depois, precisaremos determinar a <em>Default region</em>. No vídeo, o instrutor seleciona a região <code>us-east-1</code>, utilizada no início do treinamento.</p>
<p>Depois disso, vamos definir <code>json</code> como nosso <em>output</em>. Na sequência, a configuração estará pronta. Agora é hora de testar se tudo deu certo. Como já temos as credenciais, podemos fazer isso inserindo o comando <code>aws s3 ls</code>. Como resposta, o console apresentará os três <em>buckets</em> que criamos durante o treinamento.</p>
<p>Isso significa que já podemos acessá-los pela linha de comando. Para acessar os <em>buckets</em>, utilizaremos o comando <code>aws s3 ls s3://rmerces-labs1</code>. Fazendo o acesso, conseguiremos visualizar os objetos do repositório pelo console. </p>
<p>Na próxima aula, continuaremos a interagir com a <em>AWS CLI</em>.</p>
                        </div>