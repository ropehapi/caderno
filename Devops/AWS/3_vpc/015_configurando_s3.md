<div class="formattedText" data-external-links="">
                                <p>Entendemos todas as opções que nos foram exibidas na hora de criar uma VPC. Já falamos de:</p>
<ul><li><em>Internet Gateway</em>;</li><li><em>NAT Gateway</em>;</li><li>tabela de rotas e inclusive</li><li>criamos rotas.</li></ul>
<p>Estamos avançados neste quesito. Só nos falta um ponto: logo abaixo do <em>NAT Gateway</em>, onde há um aviso sobre o custo, nos é oferecida a criação de um <strong><em>Endpoint</em></strong>. Ele permite que acessemos algum serviço da AWS sem precisar passar pela internet.</p>
<p>Antes de configurá-lo, vamos criar um cenário onde ele possa ser acessado.</p>
<p>Voltando ao navegador, a partir da seção "Painel da VPC", criaremos um <em>bucket</em> S3. No campo de busca superior, digitaremos "s3".</p>
<blockquote>
<p><strong>Observação</strong> Não estamos em um curso de S3, mas esse serviço foi citado nos cursos de <em>onboarding</em> em Cloud. Se trata de um serviço para armazenamento de qualquer tipo de arquivo.</p>
</blockquote>
<p>Um <em>bucket</em> é semelhante a uma pasta. Após a busca, clicaremos na opção "S3" para acessar o serviço. Na tela do S3, clicaremos no botão "Criar bucket", alinhado à direita da página.</p>
<p>Na seção "Criar bucket", acessaremos o campo editável "Nome", onde digitaremos o nome do <em>bucket</em>: <code>vinicius-dias</code>. No campo "Região da AWS", manteremos selecionada a região que estamos utilizando: "Leste dos EUA (Ohio) us-east-2".</p>
<p>Na seção "Copiar configurações do bucket existente", é possível copiar de um outro <em>bucket</em>. Não faremos isso. </p>
<p>Na seção "Propriedade de objeto" manteremos a opção "ACLs desabilitadas" que vem selecionada por padrão.</p>
<p>Já na seção "Configurações de bloqueio do acesso público deste bucket", desabilitaremos a opção "Bloquear todo o acesso público", desmarcando o seu <em>checkbox</em>. Abaixo dele, marcaremos a opção para reconhecermos que isso pode tornar nossos objetos públicos. Desta forma, poderemos visualizar os arquivos.</p>
<p>Manteremos a opção "Desativar" nas seções "Versionamento de bucket" e "Criptografia padrão". Por fim, clicaremos no botão "Criar bucket".</p>
<p>Dentro da seção "Objetos", com o <em>bucket</em> criado, clicaremos em seu nome e entraremos nessa pasta. Em seu interior, clicaremos no botão de "Carregar" para enviar arquivos para ela.</p>
<p>Na janela do explorador que será aberta, selecionaremos um arquivo qualquer. Clicaremos em "Carregar" e o arquivo será enviado. Após o envio, clicaremos neste arquivo, o que abrirá a página de configuração.</p>
<p>No topo da página, abaixo do nome do arquivo, clicaremos no botão "Abrir". Por meio dele, conseguiremos visualizar o arquivo enviado, provando que a nossa conexão com o S3 funcionou.</p>
<p>Fecharemos todas as abas do navegador, menos uma, por meio da qual voltaremos à página do EC2. Clicaremos em "Instâncias",</p>
<p>Temos as nossas instâncias, certo? Todas elas podem ter uma <strong><em>função</em></strong>, que ditam quais permissões cada instância terá. Já falamos sobre isso em outros cursos da Alura.</p>
<p>Queremos que nossas instâncias tenham acesso completo ao S3, pois lá dentro executaremos alguns comandos que entenderemos posteriormente.</p>
<p>O foco deste curso não é abordar permissões, portanto faremos rapidamente essa etapa. No campo de busca superior, digitaremos "iam" e entre os resultados selecionaremos "IAM", por meio do qual gerenciaremos os acessos. Neste momento, o Painel do IAM será aberto no corpo da página.</p>
<p>No explorador lateral, selecionaremos o submenu "Funções" ("<em>Roles</em>", em inglês). No corpo da página, essa seção será aberta, onde criaremos uma nova função.</p>
<p>Para isso, clicaremos em "Criar função". Seremos direcionados para a página "Selecionar entidade confiável", onde selecionaremos a opção "Serviço da AWS" para criar uma função que será atribuída a um serviço da própria AWS.</p>
<p>Vamos atribuir a função à mais de uma instância, portanto iremos até a seção "Casos de uso" e selecionaremos "EC2". Clicaremos em "Próximo" e iremos para a página "Adicionar permissões".</p>
<p>Nela, informaremos quais permissões daremos à essa função. No campo de busca, pesquisaremos por "S3" e pressionaremos "Enter". Abaixo do campo, aparecerão os resultados, dentre os quais selecionaremos "AmazonS3FullAccess". Isso concederá permissão completa ao S3.</p>
<p>Clicaremos em "Próximo" e iremos para a página "Nomear, revisar e criar". No campo "Nome da função", digitaremos o nome <code>S3FullAccess</code>. Não alteraremos o campo "Descrição". </p>
<p>Abaixo dela, temos a "Etapa 1: Selecionar entidades confiáveis" a qual possui um trecho de código. Ele nos informa que, com essa configuração, quem tiver a função terá permissão de utilizar tudo o que existe nela. Vamos deixá-la como está.</p>
<pre class="prettyprint"><code class="hljs language-json"><span class="hljs-punctuation">{</span>
    <span class="hljs-attr">"version"</span><span class="hljs-punctuation">:</span> <span class="hljs-string">"2012-10-17"</span><span class="hljs-punctuation">,</span>
    <span class="hljs-attr">"Statement"</span><span class="hljs-punctuation">:</span> <span class="hljs-punctuation">[</span>
        <span class="hljs-punctuation">{</span>
            <span class="hljs-attr">"Effect"</span><span class="hljs-punctuation">:</span> <span class="hljs-string">"Allow"</span><span class="hljs-punctuation">,</span>
            <span class="hljs-attr">"Action"</span><span class="hljs-punctuation">:</span> <span class="hljs-punctuation">[</span>
                <span class="hljs-string">"sts:AssumeRole"</span>
            <span class="hljs-punctuation">]</span><span class="hljs-punctuation">,</span>
            <span class="hljs-attr">"Principal"</span><span class="hljs-punctuation">:</span> <span class="hljs-punctuation">{</span>
                <span class="hljs-attr">"Service"</span><span class="hljs-punctuation">:</span> <span class="hljs-punctuation">[</span>
                    <span class="hljs-string">"ec2.amazonaws.com"</span>
                <span class="hljs-punctuation">]</span>
            <span class="hljs-punctuation">}</span>
        <span class="hljs-punctuation">}</span>
    <span class="hljs-punctuation">]</span>
<span class="hljs-punctuation">}</span></code><button type="button" class="clipit">Copiar código</button></pre><p>Poderíamos adicionar <em>tags</em> na seção "Tags", mas não faremos isso. Clicaremos no botão para criar a função. No final desse processo, seremos redirecionados para a tela do IAM e surgirá uma caixa de mensagem na cor verde informando que a função <code>S3FullAccess</code> foi criada. Ela será exibida na lista da seção "Funções".</p>
<p>Voltaremos ao painel do EC2 por meio do campo de busca superior. Voltaremos a clicar em "Instâncias" e adicionaremos a nova função às nossas duas instâncias: <code>maquina-bd</code> e <code>maquina-web</code>, uma por vez. Para ambas, repetiremos os passos abaixo.</p>
<ul><li>clicaremos no <em>checkbox</em> da instância;</li><li>clicaremos em "Ações &gt; Segurança &gt; Modificar função do IAM";</li><li>na seção "Função do IAM", iremos até o campo com lista suspensa e selecionaremos a função "S3FullAccess";</li><li>abaixo deste campo, clicaremos no botão "Atualizar função do IAM".</li></ul>
<p>Após as duas adições, selecionaremos o ID da instância <code>maquina-web</code> — a única que temos acesso liberado — para nos conectarmos a ela. Para isso, após a seleção, clicaremos em "Conectar" e copiaremos o código de conexão.</p>
<pre class="prettyprint"><code class="hljs language-sql">ssh <span class="hljs-operator">-</span>i "aws-ohio-pem." ec2<span class="hljs-operator">-</span><span class="hljs-keyword">user</span><span class="hljs-variable">@ec2</span><span class="hljs-number">-18</span><span class="hljs-number">-224</span><span class="hljs-number">-179</span><span class="hljs-number">-96.</span>us<span class="hljs-operator">-</span>east<span class="hljs-number">-2.</span>compute.amazonaws.com</code><button type="button" class="clipit">Copiar código</button></pre><p>Voltando ao terminal, colaremos o comando e pressionaremos "Enter", nos conectando assim àquela máquina. Dentro dela, rodaremos o comando <code>aws s3 ls</code>, o qual retornará o <em>bucket</em> <code>vinicius-dias</code>.</p>
<blockquote>
<p>vinicius-dias</p>
</blockquote>
<p>Como nós configuramos em nossa instância o acesso àquela função, e este por sua vez possui a permissão de acessar o S3, conseguimos visualizar o nosso <em>bucket</em> aqui.</p>
<p>Conseguimos rodar, por exemplo, o comando <code>aws s3 ls vinicius-dias</code> e visualizar o arquivo que enviamos para aquele <em>bucket</em>.</p>
<p>Configuramos o S3 e nossas instâncias para poderem acessá-lo. Mas o que isso tem a ver com VPC e configuração de rede? Por enquanto, nada.</p>
<p>No próximo vídeo, veremos a parte específica de VPC.</p>
                        </div>