<div class="formattedText" data-external-links="">
                                <p>Agora, vamos analisar a <em>policy</em> que acabamos de colar. Primeiro, daremos atenção à chave <code>"Principal": "*",</code>. Essa chave está amarrada à origem. Nela, <code>*</code> representa a liberação de acesso público aos arquivos</p>
<p>Depois, vamos olhar para a chave <code>"Action"</code>, executora, ainda que de maneira granular, conforme vimos na documentação do <em>S3</em>, das ações <code>GetObject</code> e <code>GetObjectVersion</code>. Vamos remover a segunda ação, porque não estamos trabalhando com versionamento nesse <em>bucket</em>. Portanto, a linha <code>"s3:GetObjectVersion"</code> não fará diferença no nosso código.</p>
<p>Também temos a chave <code>"Resource"</code>, que representa o recurso. Na <em>AWS</em>, todo recurso tem um <code>arn</code>, que funciona como identificação. O <code>arn</code> do código que copiamos é genérico. Portanto, precisamos inserir o do nosso <em>bucket</em>, <code>arn:aws:s3:::rmerces-labs2</code>, que está localizado acima de <em>"Policy"</em>. A chave <code>"Resource"</code> ficará assim:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-string">"Resource"</span>: [
    <span class="hljs-string">"arn:aws:s3:::rmerces-labs2
    /*"</span>
]</code><button type="button" class="clipit">Copiar código</button></pre><p>Com essa alteração, disponibilizamos o acesso de todos os objetos do <em>bucket</em> de agora em diante. Poderíamos criar outras pastas, como <code>/videos</code> ou <code>/imagens</code>, e inserir essas informações. Assim, apenas elas estariam disponíveis para acesso público.</p>
<p>Depois de criarmos essas definições, vamos salvar. E, na sequência, vamos voltar à página inicial dos <em>buckets</em> e ver que a informação de acesso do "rmerces-labs2" foi alterada para <em>"Public"</em>, o que representa o sucesso das nossas alterações.</p>
<p>Agora, vamos fazer um teste. Abrindo o <em>bucket</em>, vamos selecionar um de seus objetos. No vídeo, o instrutor selecionou "img1.png". Vamos copiar sua <em>URL</em> e tentar acessar o arquivo em outra aba. A partir de agora, isso funcionará.</p>
<p>É possível alterar a <em>policy</em> de acordo com nossas vontades. Poderíamos, por exemplo, criar um diretório. Vamos voltar à página da <em>policy</em> e clicar em <em>"Edit"</em>, para editá-la. Vamos adicionar <code>png</code> à chave <code>"Resource"</code>:</p>
<pre class="prettyprint"><code class="hljs language-bash"><span class="hljs-string">"Resource"</span>: [
    <span class="hljs-string">"arn:aws:s3:::rmerces-labs2
    /*png"</span>
]</code><button type="button" class="clipit">Copiar código</button></pre><p>Depois disso, aplicaremos a <em>policy</em>. Acessando nosso <em>bucket</em>, vamos fazer o <em>upload</em> de um arquivo de outro formato. No vídeo, o instrutor adiciona o objeto "arq.txt". Se tentarmos acessar o novo objeto a partir de sua <em>URL</em> pública, não vamos conseguir. Isso acontece porque, com a alteração feita na nossa <em>policy</em>, liberamos o acesso público apenas para arquivos* png*.</p>
<p>Em outras palavras, o <em>bucket</em> está público, mas nós criamos uma restrição que só libera acesso público a arquivos neste formato. É possível, então, fazer várias alterações na <em>policy</em> para reorganizar os objetos do repositório.</p>
<p>Na próxima aula, vamos criar um usuário e dá-lo acesso, por <em>console</em>, para interagir com o <em>bucket</em>.</p>
                        </div>