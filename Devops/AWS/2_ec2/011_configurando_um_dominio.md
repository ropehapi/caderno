<div class="formattedText" data-external-links="">
                                <p>Agora nosso <em>load balancer</em> já está funcional.</p>
<p>Vamos aprender a configurar domínios que já existem e a fazê-los apontar para esse <em>load balancer</em>. Vamos copiar o "Nome do <em>DNS</em>". Podemos adicionar um <em>CNAME</em>, ou seja, um apelido, importado de outro domínio para este.</p>
<p>Para exemplificar, o instrutor acessa um domínio já existente, que lhe é pessoal. Para fazer isso, clicamos em "Gerenciar registros personalizados", para dar início à criação de um novo domínio.</p>
<p>Vamos clicar em "Criar novo domínio" e, na nova caixa de texto que surgirá, vamos digitar "aws". Agora, selecionaremos o tipo "<em>CNAME</em>". Na coluna de dados, vamos inserir o endereço do <em>load balancer</em>.</p>
<p>Como a propagação de <em>DNS</em> não é instantânea, isso poderá levar algum tempo. Podemos perceber, porém, que não precisaremos configurar nada na <em>AWS</em>. Basta aponta para o domínio do load balancer.</p>
<blockquote>
<p>Também é possível registrar e configurar domínios dentro da <em>AWS</em>. Para aprender, faça o treinamento de <em>Amazon Route 53</em>. </p>
</blockquote>
<p>Vamos acessar o terminal para executar testes. Vamos executar o comando <code>dig</code> e inserir o domínio. No caso do instrutor, o domínio é "aws.dias.dev":</p>
<pre class="prettyprint"><code class="hljs language-undefined">dig aws.dias.dev</code><button type="button" class="clipit">Copiar código</button></pre><p>Com o comando, descobriremos para onde o <em>DNS</em> aponta. Por enquanto, ele aponta apenas para o <em>Google Domains</em>. Ainda precisamos mandá-lo para a <em>AWS</em>.</p>
<p>Depois de algum tempo, poderá, uma nova sessão surgirá para direcioná-lo também ao <em>load balancer</em>. Ao acessar "aws.dias.dev", conseguiremos acessar o balanceador de carga.</p>
<p>O assunto do próximo vídeo é <em>auto scaling</em>.</p>
                        </div>