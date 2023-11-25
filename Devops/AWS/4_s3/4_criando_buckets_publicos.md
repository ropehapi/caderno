<div class="formattedText" data-external-links="">
                                <p>Agora que conseguimos criar o <em>bucket</em> e adicionar objetos a ele, vamos aprender sobre a parte de permissionamento.</p>
<p>Vamos criar um novo <em>bucket</em> e inserir "rmerces-labs2" em "Bucket name" e manter as outras opções como o padrão. Depois disso, vamos subir alguns arquivos nele. No vídeo, o instrutor fez o <em>upload</em> de dois arquivos <em>png</em>. </p>
<p>Assim como na aula anterior, se abrirmos algum dos arquivos e tentarmos acessar sua "Object URL", teremos nosso acesso negado. Para resolver esse problema, precisaremos tornar o <em>bucket</em> público. Vamos voltar à página inicial do <em>bucket</em> e acessar a aba "Permissions", para gerenciar as permissões.</p>
<p>Vamos rolar a página até encontrarmos a seção "Block public access (bucket settings)". Quando a encontrarmos, clicaremos na opção "Edit" e vamos desmarcar a opção "Block all public access". Depois, vamos salvar as alterações. Para fazer isso, precisaremos confirmar a decisão digitando "confirm" na barra de texto ao centro da tela.</p>
<p>Agora vamos voltar à tela inicial, onde encontramos a lista dos <em>buckets</em> que criamos. Lá, vamos prestar atenção às definições de acesso, descritas abaixo de "Access". No primeiro, as informações não são públicas. Mas, no que criamos agora há pouco, a descrição diz que as informações <strong>podem ser públicas</strong>.</p>
<p>Isso significa que o processo para tornar os objetos do <em>bucket</em> acessíveis por suas <em>URLs</em> públicas ainda não está completo. Em outras palavras, quando tentamos abrir os arquivos do <em>bucket</em> "rmerces-labs2", ainda temos nosso acesso negado.</p>
<p>O próximo passo para a liberação é criar uma <em>policy</em> de autorização. Para fazer isso, vamos abrir novamente o *bucket *"rmerces-labs2" e acessar a aba "Permission". Precisamos rolar a página até encontrar a seção "Bucket policy", na qual faremos o gerenciamento. Vamos clicar em "Edit" e dar sequência ao processo.</p>
<p>Temos a opção de escrever a <em>policy</em> manualmente, mas vamos copiá-la clicando na opção "Policy examples". Depois de acessar essa página, vamos rolar a página para baixo até encontrarmos as opções de compartilhamento na seção "Topics".</p>
<p>Vamos trabalhar com a segunda opção, "Granting read-only permission to an anonymous user", para conceder direito de leitura a qualquer usuário que tenha acesso à URL. Clicaremos nessa opção e, sem seguida, copiaremos o código que nos é apresentado na tela:</p>
<pre class="prettyprint"><code class="hljs language-bash">{
    <span class="hljs-string">"Version"</span>: <span class="hljs-string">"2012-10-17"</span>,
    <span class="hljs-string">"Statement"</span>: [
        {
            <span class="hljs-string">"Sid"</span>: <span class="hljs-string">"PublicRead"</span>,
            <span class="hljs-string">"Effect"</span>: <span class="hljs-string">"Allow"</span>,
            <span class="hljs-string">"Principal"</span>: <span class="hljs-string">"*"</span>,
            <span class="hljs-string">"Action"</span>: [
                <span class="hljs-string">"s3:GetObject"</span>,
                <span class="hljs-string">"s3:GetObjectVersion"</span>
            ],
            <span class="hljs-string">"Resource"</span>: [
                <span class="hljs-string">"arn:aws:s3:::DOC
                    -EXAMPLE-BUCKET/*"</span>
            ]
        }
    ]
}</code><button type="button" class="clipit">Copiar código</button></pre><p>Agora, basta voltar ao <em>bucket</em> e colar o código copiado na caixa de texto abaixo de "Policy". No próximo vídeo, vamos editar essa estrutura.</p>
                        </div>