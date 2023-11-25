<div class="formattedText" data-external-links="">
                                <p>Nesta aula, vamos criar um <em>load balancer</em> (balanceador de carga). Para organizar nossa área de trabalho, podemos fechar todas as guias do navegador, exceto a da interface da Lightsail.</p>
<p>Recapitulando, na tela inicial da Lightsail, temos um menu com as seguintes abas:</p>
<ul><li><em>Instances</em></li><li><em>Containers</em></li><li><em>Databases</em></li><li><em>Networking</em></li><li><em>Storage</em></li><li><em>Snapshots</em></li></ul>
<p>Na aba "<em>Instances</em>", constam nossas duas máquinas: Ubuntu-2 e Ubuntu-1. Ao clicar na aba "<em>Networking</em>", teremos uma seção com quatro botões. Vamos pressionar "<em>Create load balancer</em>".</p>
<h2>Criando um <em>load balancer</em></h2>
<p>No tópico "<em>Initial configuration</em>", temos as opções HTTP e HTTPS. Atualmente, somente a primeira está habilitada. Para habilitar o HTTPS, precisaríamos gerar um certificado. Como nosso foco é apenas entender o contexto, vamos manter o <strong>HTTP</strong>.</p>
<p>No tópico "<em>Identify your load balancer</em>", podemos manter o nome "LoadBalancer-1".</p>
<p>Ao final da página, logo acima do botão "<em>Create load balancer</em>", há um aviso de que esse <em>load balancer</em> custa $18 por mês, caso optemos por manter esse ambiente. Ou seja, <strong><em>esse recurso não é contemplado no nível gratuito (free tier)!</em></strong></p>
<p>Como demonstração, criaremos o <em>load balancer</em> e, em breve, vamos desmobilizar esse ambiente para não ter esse custo mensal. Vale lembrar que <strong><em>tudo que for provisionado será cobrado, exceto os recursos a que temos direito no free tier</em></strong>.</p>
<blockquote>
<p>Se preferir, você pode acompanhar o processo de criação do <em>load balancer</em> apenas pelo vídeo ou pela transcrição. Isso não afetará o avanço do restante do curso.</p>
</blockquote>
<p>Por fim, vamos clicar no botão "<em>Create load balancer</em>" e seremos direcionados a uma nova página.</p>
<p>Considerando diversas experiências de uso da <em>cloud</em> com provedores diferentes, a console do Lightsail é muito prática e amigável, principalmente para iniciantes no assunto. No topo da tela, temos informações do balanceador de carga, como nome, região e DNS.</p>
<p>No tópico "<em>Target instances</em>", vamos escolher as instâncias que estarão abaixo dessa camada do <em>load balancer</em>. De início, vamos selecionar Ubuntu-1 e clicar em "<em>Attach</em>", no canto direito inferior da instância. Depois, clicaremos em "<em>Attach another</em>" e selecionaremos Ubuntu-2. Após alguns instantes, as máquinas estarão anexadas.</p>
<h2><em>Health check</em></h2>
<p>O <em>load balancer</em> é a camada que recebe as requisições dos usuários e as distribui entre as máquinas disponíveis na <em>farm</em> de servidores.</p>
<p>Para realizar essa distribuição, o <em>load balancer</em> precisa checar o status das instâncias. Por exemplo, se ele verificar que a primeira máquina está devidamente funcionando, porém a segunda não está respondendo, o balanceador de carga enviará requisições apenas para a primeira instância. Esse processo de checagem chama-se <strong><em>health check</em></strong> (teste de saúde ou verificação de integridade).</p>
<p>Logo abaixo das instâncias, temos a informação que as instâncias receberão as requisições na porta 80.</p>
<p>No momento, o balanceador de carga apenas checa se a porta 80 está respondendo, contudo, podemos <strong>customizar outros mecanismos de testes</strong>. Para isso, vamos clicar em "<em>Customize health checking</em>" e preencher o campo com o nome do seguinte arquivo:</p>
<blockquote>
<p>server.txt</p>
</blockquote>
<p>Em seguida, clicaremos em "<em>Save</em>", no canto inferior esquerdo. Desse modo, o <em>load balancer</em> fará um GET e verificará se cada máquina tem o arquivo <code>server.txt</code>, que criamos anteriormente. Caso tenha, a instância está funcionando. Do contrário, ela será desconsiderada para a distribuição de tráfego.</p>
<h2>Testando o balanceador de cargas</h2>
<p>No topo da página, temos o <em>DNS name</em> com um endereço de entrada. Supondo que temos um domínio, poderíamos criar um CNAME (nome canônico) e apontá-lo para esse endereço. Explicamos esse processo em aulas anteriores, usando o namecheap.</p>
<p>Vamos clicar no endereço disponibilizado em <em>DNS name</em> para abri-lo em outra guia do navegador. Para testar o servidor, basta adicionar <code>/server.txt</code> ao final do endereço.</p>
<p>O resultado será o texto "SERVIDOR UBUNTU - 1" ou "SERVIDOR UBUNTU - 2". Ao atualizar a página múltiplas vezes, haverá uma alternância entre esses dois textos, provando que o balanceador de carga está distribuindo as requisições entre as duas máquinas. Assim, temos um ambiente de alta disponibilidade.</p>
<p>Pra simular um defeito, vamos parar a execução de uma das máquinas. Na tela inicial da Lightsail, vamos clicar nos três pontos no canto superior da instância Ubuntu-2 e selecionar "<em>Stop</em>". Do ponto de vista de conectividade, a porta 80 deixará de existir e o <em>load balancer</em> passará a direcionar todo o tráfego apenas para Ubuntu-1.</p>
<p>Voltando à aba anterior em que acessamos <code>server.txt</code>, vamos atualizar a página múltiplas vezes. Agora, o resultado será sempre "SERVIDOR UBUNTU - 1". Se reiniciássemos a máquina Ubuntu-2, o ambiente voltaria a funcionar como antes. Por ora, vamos mantê-la parada.</p>
<h2>Alarmes</h2>
<p>Na tela inicial da Lightsail, vamos clicar na aba "<em>Networking</em>" e acessar o LoadBalancer-1 para voltar à página de detalhes desse balanceador de carga.</p>
<p>Nas abas "<em>Target instances</em>" e "<em>Inboud traffic</em>", temos as informações que configuramos anteriormente.</p>
<p>Na aba "<em>Metrics</em>", temos os tópicos "<em>Metrics graphs</em>" e "<em>Alarms</em>". No primeiro, há um gráfico relativo ao tráfego que chega ao <em>load balancer</em> e, no segundo, podemos configurar algumas notificações.</p>
<p>Ao clicar em "<em>Add alarm</em>", é possível definir as situações em que desejamos ser alertados de falhas nos servidores. Por exemplo, um cenário em que temos menos de 2 instâncias funcionando por um período de 5 minutos. Temos a opção de notificação por e-mail ou SMS, basta associar seus dados de contato. No caso de um ambiente de produção, direcionamos esses alarmes para o time encarregado de resolver esses problemas.</p>
<p>Este é um caso interessante para estudo. Configure um alarme e simule falhas nos seus servidores para checar se as notificações chegam ao seu e-mail.</p>
<h2>Removendo recursos</h2>
<p>Na sequência, vamos fazer uma "limpeza" para excluir todos os recursos que não utilizaremos na próxima aula.</p>
<p>Começaremos excluindo o <em>load balancer</em>. No topo da página de detalhes do balanceador, abaixo do endereço em <em>DNS name</em>, clicaremos nos três pontos e selecionaremos "<em>Delete</em>". Para confirmar a ação, pressionaremos o botão "<em>Delte load balancer</em>" e, depois, "<em>Yes, delete</em>".</p>
<p>Na tela inicial da Lightsail, vamos remover a instância Ubuntu-1. Basta clicar nos três pontos no canto superior da instância e selecionar "<em>Delete</em>". Para confirmar a ação, clicaremos em "<em>Yes, delete</em>". Assim, ficaremos apenas com a máquina Ubuntu-2 — atualmente parada.</p>
<p>Além disso, acessaremos a aba "<em>Snapshots</em>" e apagaremos nosso <em>snapshot</em> "nginx-snapshot". Basta clicar nos três pontos à direita, selecionar "<em>Delete snapshot</em>" e confirmar, pressionando "<em>Yes</em>".</p>
<p>Na aba "<em>Networking</em>", temos dois IPs estáticos. Como removemos a instância Ubuntu-1, não há nenhuma máquina associada a Staticip-ubuntu-1, o que gerará custos. Para removê-lo, clicaremos nos três pontos no canto superior direito e selecionaremos "<em>Delete</em>". Para confirmar, clicaremos em "<em>Yes, delete</em>".</p>
<p>Na próxima aula, vamos estudar como anexar um disco a uma instância.</p>
                        </div>