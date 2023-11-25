<div class="formattedText" data-external-links="">
                                <p>Agora que já entendemos como o AWS-nuke funciona, vamos executá-lo e apagar todos os recursos da conta.</p>
<blockquote>
<p>Lembre-se de jamais executar o AWS-nuke em uma conta que não pode perder os recursos vinculados a ela.</p>
</blockquote>
<p>Abriremos o Console do AWS no navegador. Na barra de busca, escreveremos "IAM" e selecionaremos a primeira opção que aparece como resultado da busca.</p>
<p>No Painel do IAM, logo abaixo do título "Conta da AWS", na lateral direita, teremos o ID da conta e o Alias da conta. No começo, você não terá um Alias criado. Além disso, o ID de cada conta é único.</p>
<h3>Criando um Alias</h3>
<p>Logo abaixo do título "Alias da conta", temos um número associado à nossa conta, ao lado do qual está um botão escrito "Criar". Ao clicar nesse botão, uma janela abrirá com um campo de texto a ser preenchido sob o título "Alias preferenciais". Escreveremos "contatesteleo" nesse campo e clicaremos no botão "Salvar alterações".</p>
<p>O Alias criado precisa ser exclusivo para a sua conta, então não podemos repeti-lo. Com isso, o nome do Alias criado aparecerá no painel à direita da página, com as informações da Conta AWS.</p>
<h3>Criando usuário IAM</h3>
<p>Além disso, precisaremos criar um usuário IAM para acessar a conta via console. Abaixo do título "Recursos do IAM", temos o subtítulo "Grupos de usuários", com o número zero em azul, logo abaixo. Clicaremos nesse número e seremos redirecionados(as) para uma nova página, a de Grupos de Usuários. Nela, clicaremos no botão "Criar grupo", à direita da interface.</p>
<p>O site solicitará que criemos um nome para o grupo, o qual chamaremos de "root". Logo abaixo, temos um campo opcional para adicionar usuários ao grupo. Por enquanto, deixaremos esse campo vazio porque ainda não temos nenhum perfil de usuário.</p>
<p>No campo "Associar políticas de permissões", podemos definir quem poderá ter modificações no AWS. No nosso caso, queremos permitir acesso total às pessoas usuárias que fazem parte desse grupo. A melhor maneira de fazer isso é dar um duplo clique na coluna "Tipo" da tabela disposta nesse campo. Assim, ele apresentará as categorias de tipo organizadas por ordem alfabética.</p>
<p>A tabela mostrará todas as políticas da categoria "Gerenciadas pela AWS - função de trabalho" primeiro. A partir daqui, marcaremos a caixa de seleção à esquerda dos seguintes nomes de política:</p>
<ul><li>AdministratorAccess</li><li>PowerUserAccess</li><li>SecurityAudit</li><li>SupportUser</li><li>SystemADministrator</li><li>DatabaseAdministrator</li><li>DataScientist</li><li>NetworkAdministrator</li><li>Billing</li></ul>
<p>Com isso, selecionamos nove funções. Podemos agora clicar no botão "Criar grupo", no fim da página. Com isso surgirá uma mensagem no topo da página "Grupo de usuários root criado".</p>
<h3>Criando usuário</h3>
<p>Voltaremos no Painel do IAM para criar um usuário. Podemos fazer isso clicando em "IAM", no topo da página. Clicaremos no número zero logo abaixo da palavra "Usuários" em "Recursos do IAM".</p>
<p>Na página seguinte, clicaremos no botão "Adicionar usuários", no topo direito da interface. No campo "Nome de usuário", escreveremos "acesso CLI". Esse é só um exemplo, você pode escolher o nome que preferir. Após definir o nome de usuário, clique no botão "Próximo", na parte inferior direita da página.</p>
<p>Na página "Definir permissões", desceremos até "Grupos de usuários" e marcaremos a caixa de seleção ao lado do grupo "root", que acabamos de criar. Em seguida, clicaremos no botão  "Próximo".</p>
<p>Na página "Revisar e criar", não precisamos fazer nenhuma alteração. Clicaremos no botão "Criar usuário", no canto inferior direito. Isso nos levará à página que exibe a lista de usuários. Lá, encontraremos o recém-criado "acessoCLI".</p>
<h3>Criando uma chave de acesso</h3>
<p>O usuário serve para podermos criar uma chave de acesso. Clicaremos no nome do usuário e, na página com as informações detalhadas dele, clicaremos na aba "Credenciais de segurança". Desceremos a página até o título "Chaves de acesso". Clicaremos no botão "Criar chave de acesso".</p>
<p>Na próxima página, marcaremos a opção "Command Line Interface (CLI)", que fornecerá permissão de acesso somente por meio do Terminal. Desceremos a página toda, marcaremos a caixa "Compreendo a recomendação acima e quero prosseguir para criar uma chave de acesso" e clicaremos no botão "Próximo". Não adicionaremos nenhuma etiqueta na chave, então clicaremos no botão "Criar chave de acesso".</p>
<p>A próxima página nos dá a chave de acesso e uma chave de acesso secreta.</p>
<blockquote>
<p><strong>Atenção</strong>: Jamais guarde a sua chave de acesso secreta dentro de códigos ou em repositórios de código.</p>
</blockquote>
<p>Uma opção para salvar essas chaves é baixar um arquivo .csv. Clicaremos no botão "Baixar arquivo .csv" no fim da página. Assim, ele fica salvo no nosso computador. Depois disso, podemos clicar no botão "Concluído".</p>
<h3>Editando o arquivo de configuração</h3>
<p>Agora, abriremos o GitHub do AWS-nuke e usaremos o arquivo de configuração que vimos anteriormente, copiando o exemplo que há nele.</p>
<p>Abriremos o Terminal e criaremos o arquivo de configuração. O Leo gosta de usar o nano para criar esses arquivos, mas você pode usar um editor de texto gráfico de sua preferência. Escreveremos "nano config.yaml". É nesse arquivo que colaremos o código copiado no GitHub.</p>
<pre class="prettyprint"><code class="hljs language-makefile"><span class="hljs-section">regions:</span>
- eu-west-1

<span class="hljs-section">account-blocklist:</span>
- <span class="hljs-string">"999999999999"</span> <span class="hljs-comment"># production</span>

<span class="hljs-section">accounts:</span>
    <span class="hljs-string">"000000000000"</span>: aws-nuke-example
        filters:
            IAMUser:
            - <span class="hljs-string">"my-user"</span>
            - IAMUserPolicyAttachment:
            - <span class="hljs-string">"my-user -&gt; AdministratorAccess"</span>
            IAMUserAccessKey:
            - <span class="hljs-string">"my-user -&gt; ABCDEFGHIJKLMNOPQRST"</span>
</code><button type="button" class="clipit">Copiar código</button></pre>
<p>Editaremos esses dados para que eles funcionem na nossa conta. Manteremos os campos <code>regions</code> e <code>account-blocklist</code> como estão. Em <code>accounts</code>, excluiremos todos os zeros e preencheremos as aspas com o nosso número de conta.</p>
<p>Para resgatar esse número, abriremos o Painel do IAM novamente e, à direita, clicaremos no ícone ao lado do número que corresponde ao ID da conta. Observaremos uma mensagem que surge logo acima dizendo "ID da conta copiado". De volta ao terminal, colaremos o número dentro das aspas logo abaixo de <code>account-blocklist</code>.</p>
<p>Trocaremos o usuário do IAM (<code>IAMUser</code>), as políticas de usuário (<code>IAMUserPolicyAttachment</code>) e a chave de acesso (<code>IAMUserAccessKey</code>) para <code>acessoCLI</code>, escrevendo esse nome nos dois campos onde antes estava escrito <code>"my-user"</code>.</p>
<p>Onde estão as letras do alfabeto, inseriremos a chave de acesso da nossa conta.</p>
<blockquote>
<p><strong>Atenção</strong>: aqui colaremos a chave de acesso, <strong>não a chave secreta</strong>.</p>
</blockquote>
<p>Vamos copiá-la do arquivo "acessoCLI_accessKey.csv", que baixamos anteriormente. O código atualizado seguirá os seguintes padrões:</p>
<pre class="prettyprint"><code class="hljs language-makefile"><span class="hljs-section">regions:</span>
- eu-west-1

<span class="hljs-section">account-blocklist:</span>
- <span class="hljs-string">"999999999999"</span> <span class="hljs-comment"># production</span>

<span class="hljs-section">accounts:</span>
    <span class="hljs-string">"316529025296"</span>: aws-nuke-example
        filters:
            IAMUser:
            - <span class="hljs-string">"acessoCLI"</span>
            - IAMUserPolicyAttachment:
            - <span class="hljs-string">"acessoCLI -&gt; AdministratorAccess"</span>
            IAMUserAccessKey:
            - <span class="hljs-string">"acessoCLI -&gt; AKIAUTMUZUBEBA3BB5US"</span>
</code><button type="button" class="clipit">Copiar código</button></pre>
<p>Assim, não precisaremos nos preocupar em criar uma nova chave toda vez que quisermos executar o AWS-nuke. Do contrário, ele apaga até a chave de acesso usada pelo próprio AWS-nuke. Com o arquivo de configurações pronto, vamos salvá-lo.</p>
<h3>Formas de autenticar o AWS-nuke</h3>
<p>Para passar o arquivo, observaremos que precisamos escrever no Terminal "aws-nuke -c", seguido do arquivo de configuração.</p>
<p>Para autenticar o AWS-nuke, podemos usar as credenciais ou os perfis. Um perfil é quando instalamos o AWS CLI, fazemos o config, criando um arquivo de credencial e salva tudo.</p>
<p>O jeito mais prático agora é usar o comando "--access-key-id" e "--secret-access-key".</p>
<h3>Instalando o programa</h3>
<p>Se você usar o <strong>macOS</strong>, pode instalar o programa com o comando "brew install aws-nuke". Se você usar o Windows, pode acessar os <em>released binaries</em> no GitHub.</p>
<p>O arquivo "README.md" tem um tópico chamado "Install", onde você encontrará o link para baixar a última versão do GitHub.</p>
<p>Na página de releases do GitHub, a última versão aparecerá primeiro. Opte sempre pela versão mais recente. Desceremos até a lista sob o título "Assets".</p>
<p>No nosso caso, clicaremos com o botão direito do mouse em "aws-nuke-v2.23.0-linux-amd64.tar.gz" e clicaremos na opção "Copiar endereço do link".</p>
<p>Voltaremos ao Terminal e escreveremos "wget", colando o link recém copiado em seguida e pressionando a tecla "Enter".</p>
<p>Assim que o download for finalizado, vamos descompactar o arquivo. Voltaremos à página do GitHub e encontraremos o comando "tar -xz -C $HOME/bin" para fazer a extração. Copiaremos esse comando e colaremos no Terminal, editando-a para "tar -xzf aws-nuke-v2.23.0-linux-amd64.tar.gz". Em seguida, usaremos o comando "ls".</p>
<p>Com isso, o Terminal exibirá um executável:</p>
<blockquote>
<p>aws-nuke-v2.23.0-linux-amd64 config.yaml</p>
</blockquote>
<h3>Executando o programa</h3>
<p>Para executar o programa, inseriremos os seguintes comandos de uma só vez:</p>
<blockquote>
<p>"./aws-nuke-v2.23.0-linux-amd64 -c config.yaml --access-key-id AKIAUTMUZUBEBA3BB5US --secret-access-key 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"</p>
</blockquote>
<p>Em seguida, pressionaremos a tecla "Enter". O Terminal exibirá a seguinte pergunta:</p>
<blockquote>
<p>Do you really want to nuke the account with the ID 316529025296 and the alias 'contatesteleo'? Do you want to continue? Enter account alias to continue.</p>
</blockquote>
<p>Ou seja, ele está nos perguntando "Você quer mesmo apagar tudo o que estiver na conta com o ID 316529025296 e o Alias 'contatesteleo'?".</p>
<p>Para prosseguir, digitaremos "contatesteleo" e pressionaremos a tecla "Enter". O Terminal carregará tudo o que o AWS-nuke julga que pode ser removido da conta. Em seguida, exibe o texto:</p>
<blockquote>
<p><em>The above resources would be deleted with the supplied configuration. Provide --no-dry-run to actually destroy resources.</em></p>
</blockquote>
<p>Com isso, escreveremos "./aws-nuke-v2.23.0-linux-amd64 -c config.yaml --access-key-id AKIAUTMUZUBEBA3BB5US --secret-access-key 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 --no-dry-run" no Terminal e pressionaremos a tecla "Enter" para confirmar que desejamos excluir os arquivos identificados.</p>
<p>Em seguida, ele exibirá novamente a mensagem perguntando se desejamos prosseguir. Para continuar, escreveremos o Alias da nossa conta ('contatesteleo') e pressionaremos "Enter".</p>
<p>Os itens passíveis de remoção aparecem com um "<em>would remove</em>" escrito em azul no Terminal. Tudo o que estiver com anotações amarelas não pode ser excluído.</p>
<p>Com isso, o AWS-nuke começa a tentar apagar os itens passíveis de remoção. Os itens apagados com sucesso aparecerão com o texto "<em>triggered remove</em>" em azul, aqueles que falharem terão o texto "<em>failed</em>" em vermelho.</p>
<p>Com o fim da primeira rodada, o Terminal exibirá uma mensagem como essa:</p>
<blockquote>
<p>Removal requested: 6 waiting, 4 failed, 58 skipped, 0 finished.</p>
</blockquote>
<p>Isso indica que quatro remoções falharam. Ele continuará tentando até terminar todas. No fim desse processo, você poderá observar uma mensagem semelhante a esta:</p>
<blockquote>
<p>Nuke complete: 0 failed, 58 skipped, 10 finished.</p>
</blockquote>
<p>Os 58 itens que foram pulados são padrão da AWS, ou seja, não há motivo para eles serem removidos. Assim, tivemos um total de 10 recursos que poderiam ser removidos.</p>
<p>A prática adotada pelo Leo quando ele termina de fazer um curso para a Alura é rodar o AWS-nuke, apagar todos os recursos e, assim, evitar custos indesejados.</p>
<p>Esperamos que esse programa seja útil para você. Nos vemos no vídeo de conclusão!</p>
                        </div>