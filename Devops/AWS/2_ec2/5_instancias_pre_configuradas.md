<div class="formattedText" data-external-links="">
                                <p>Nesse vídeo, vamos entender como criar instâncias pré-configuradas.</p>
<p>Antes de tudo, vamos nos livrar da instância "ec2-first", que criamos. Faremos isso selecionando e clicando em "Estado da instância &gt; Encerrar a instância". Em seguida, clicaremos em "Encerrar". Isso vai desligar a máquina e removê-la.</p>
<p>Agora, enquanto esperamos a instância ser removida, clicaremos em "Executar instâncias". Nessa nova página, ao invés de selecionarmos uma imagem de início rápido, vamos entender um pouco mais sobre cada uma delas. Faremos isso clicando em "Procurar mais <em>AMIs</em>.</p>
<p>Existem <em>AMIs</em> de início rápido, que são imagens com apenas o <em>Linux, Windows, Amazon</em> e outras distribuições simples. Também existem as <em>AMIs</em> do <em>AWS Marketplace</em>, disponibilizada para <em>marketplace</em>. Nela, podemos baixar imagens gratuitas ou pagas.</p>
<p>Também há <em>AMIs</em> da comunidade. Ao contrário dessas, que são disponibilizadas pelo usuário, todas as outras são disponibilizadas pela <em>AWS</em> ou empresas autorizadas.</p>
<p>Vamos selecionar <em>AMIs</em> do <em>AWS Marketplace</em> e, na barra de pesquisa, buscaremos por <em>NGINX</em>. Quando buscarmos, encontraremos alguns resultados. Vamos procurar a opção gratuita, que é o "NGINX Open Source packaged by Bitnami". Há muitas possibilidades, portanto, de instâncias pré-configuradas.</p>
<p>Clicaremos em "Selecionar &gt; Definição de preço &gt; NGINX Open Source packaged by Bitnami". Depois, veremos que não existe cobrança pelo software. Nas abas dessa página, podemos encontrar várias informações e descrições da imagem. Vamos clicar em "Continuar", para seguir à etapa de criação.</p>
<p>Em "Tipo de instância", vamos selecionar "t2.micro", qualificada para o nível gratuito. "Par de chaves" será "ec2". Vamos selecionar a opção "Selecionar grupo de segurança existente" em "Firewall (grupos de segurança)". Vamos selecionar "launch-wizard-1".</p>
<p>Selecionaremos também "acesso-web", que liberará as portas 80 e 443. Selecionamos os grupos de segurança. Eles já estão anexados à nossa nova instância.</p>
<p>Vamos manter o padrão nas outras informações. Agora podemos clicar em "Executar instância". Quando fizermos isso pela primeira vez, o processo levará bastante tempo, porque nossa conta está sendo inscrita no serviço de imagens da <em>AWS</em>.</p>
<p>Agora vamos voltar à página "Instâncias" e atualizá-la. Veremos que "er2-first" foi descartada, enquanto a instância que acabamos de criar, ainda sem nome, está sendo executada. Vamos editar o nome para "nginx".</p>
<p>Ela está em processo de inicialização. No próximo vídeo, revisaremos a instância.</p>
                        </div>