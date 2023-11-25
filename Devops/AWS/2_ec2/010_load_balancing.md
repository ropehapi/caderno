<div class="formattedText" data-external-links="">
                                <p>Nesse vídeo, vamos falar sobre escalabilidade.</p>
<p>Para que nosso sistema não saia do ar em caso de queda de uma instância, podemos criar outra, para dividir a carga do nosso sistema entre as duas.</p>
<p>Assim, conseguiremos lidar com o dobro de requisições.</p>
<p><em>Load balancing</em>, balanceamento de carga em português, não é algo específico da <em>AWS</em>. Vamos configurar o <em>load balancer</em> na <em>AWS</em>.</p>
<p>No console da <em>AWS,</em> vamos selecionar a instância e seguir o caminho "Ações &gt; Imagem e modelos &gt; Executar mais como esta". Com isso, criaremos outra instância idêntica. Mudaremos o nome para "nginx-2". O par de chaves será o "ec2", para viabilizar o acesso via <em>SSH</em>.</p>
<p>Vamos selecionar, porém, uma sub-rede diferente: será a finalizada em "1a". Agora temos duas instâncias, cada uma em um local diferente. Vamos habilitar a atribuição automática de <em>IP</em> público e não configuraremos mais nada. Vamos só clicar em "Executar instância".</p>
<p>É possível filtrar as instâncias pela barra de busca. Vamos selecionar apenas as instâncias "Executando" e "Pendente", para observarmos as nossas duas. Quando a nova não estiver mais pendente, vamos deixar apenas o filtro "Executando".</p>
<p>Vamos criar, agora, o balanceador de carga entre as duas instâncias. No menu da esquerda, vamos selecionar "Balanceamento de carga &gt; Load balancers &gt; Criar Load Balancer". Vamos selecionar o "Application Load Balancer".</p>
<p>Em "Basic configuration", vamos definir o nome do balanceador como "lb-teste". Em "Scheme", manteremos a opção "Internet-facing", o que significa que ele ficará aberto para o mundo. Em "IP address type" vamos manter "IPv4".</p>
<p>O <em>load balancer</em> só distribuirá carga para as nossas instâncias, que são "us-east-1a" e "us-east-1d", se as marcarmos em "Mappings". Vamos marcá-las.</p>
<p>Em "Security groups", precisamos habilitar o "default", porque o <em>load balancer</em> precisa localizar nossas instâncias. Também adicionaremos "acesso-web", para que o mundo externo consiga acessá-lo também.</p>
<p>Em "Listeners and routing", vamos adicionar roteamento. Vamos clicar em "Create target group", para criar nosso primeiro grupo de alvos. Vamos mantê-lo na opção "Instances", porque vamos manipular apenas instâncias.</p>
<p>O nome do target group será "tg-principal". Vamos utilizar o protocolo HTTP. Em "Health checks", ou verificações de segurança, vamos definir os critérios da avaliação de saúde das requisições. Em "Sucess codes", vamos escrever "200-299". No resto, manteremos o padrão.</p>
<p>Agora vamos adicionar nossas duas instâncias ao grupo de alvos. Depois, clicaremos em "Include as pending below". Por fim, criaremos o target group.</p>
<p>Vamos voltar à aba do <em>load balancer</em> e selecionar o <em>target group</em> que acabamos de criar e, na sequência, criar o <em>load balancer</em>. </p>
<p>Vamos clicar em "View load balancer", para analisar nossa lista de <em>load balancers</em>. Ele estará no estado "Provisionando" e, em breve, estará "Ativo". Depois disso, podemos copiar a <em>URL</em> ao lado de "Nome do DNS" para executar um teste.</p>
<p>Vamos abrir uma nova aba e colar a <em>URL</em>. Teremos sucesso: conseguimos acessar.</p>
<p>Se voltarmos às instâncias e nos conectarmos como cliente <em>SSH</em>, podemos inserir o endereço no terminal, com o comando <code>ssh -i ec2.pem bitnami</code>. Agora vamos acessar através de <code>vim /opt/bitnami/nginx/index.html</code>. É nessa pasta que está a maior parte da configuração.</p>
<p>No arquivo <em>HTML</em>, adicionaremos, logo depois de <code>&lt;body&gt;</code>, um <code>&lt;h1&gt;</code> com "Serviço 1". Vamos salvar com "ESC + : + X" e fechar o arquivo.</p>
<p>Vamos sair e voltar ao console da <em>AWS</em>. Vamos nos conectar ao "nginx-2", copiar o endereço em "Cliente SSH" e nos conectaremos a ele repetindo os comandos anteriores. Também acessar o arquivo "index.html".</p>
<p>Porém, dessa vez vamos adicionar uma tag <code>&lt;h1&gt;</code> com "Serviço 2". Portanto, cada instância exibirá um título diferente. Caso atualizemos a página constantemente, poderemos notar a alteração no navegador.</p>
<p>Vamos desligar o serviço 1, acessando "Estado da instância &gt; Interromper instâncias &gt; Interromper". Isso desligará a máquina. Depois disso, só conseguiremos acessar a outra instâncias. Podemos religar serviço 1 a qualquer momento.</p>
<p>No próximo vídeo, vamos configurar um domínio.</p>
                        </div>