<div class="formattedText" data-external-links="">
                                <p>Boas-vindas de volta a mais um curso desse treinamento sobre <strong>VPC</strong> no qual estamos configurando redes na AWS.</p>
<p>Agora, estamos no painel da VPC, no console da AWS. Vamos para a seção de "Segurança" no meu lateral onde temos:</p>
<ul><li>ACLs da rede</li><li>Grupos de segurança</li></ul>
<p>Essa parte de grupos de segurança (<em>security groups</em>) permite o controle de acesso a algumas instâncias. Isso é uma configuração de segurança da rede, por isso faz parte da VPC também.</p>
<p>Isso fica também no painel da EC2 e de alguns outros serviços que precisam desse controle, mas é um serviço de rede. Vamos relembrar como fazer a configuração de um grupo de segurança.</p>
<p>Clicaremos em "Grupos de segurança". Já temos o grupo de segurança padrão, que permite todo o acesso, agora criaremos um novo grupo de segurança.</p>
<p>Clique em "Criar grupo de segurança" e preencheremos os campos da seguinte forma.</p>
<p>O nome do grupo de segurança será <code>ssh</code> e a descrição será <code>ssh</code> também. Um detalhe interessante e chato é que essas descrições não podem ter espaço nem caracteres especiais. Por algum motivo, essa "descrição" não é, na verdade, uma descrição.</p>
<p>Continuando, em Regras de entrada vamos informar quais fluxos permitimos que entrem em uma instância que for parte desse grupo de segurança.</p>
<p>Vamos clicar em "Adicionar regra" e no campo Tipo vamos inserir a regra <code>SSH</code>. Ao selecionar "SSH" no tipo da regra de entrada, ele automaticamente preenche os campos "Protocolo" e "Intervalo de portas"</p>
<blockquote>
<p>Tipo: SSH</p>
<p>Protocolo: TCP</p>
<p>Intervalo de portas: 22</p>
</blockquote>
<p>No campo "Tipo de origem" vamos selecionar a opção "Meu IP". Essa opção pega o meu IP público e o insere no campo "Origem".</p>
<p>Ou seja, partindo do meu IP para qualquer instância que tenha esse grupo de segurança, o acesso SSH estará liberado. Em "Descrição" colocaremos "acesso-ssh".</p>
<blockquote>
<p>Tipo de origem: Meu IP</p>
<p>Origem: 168.205.101.49/32</p>
<p>Descrição - opcional: acesso-ssh</p>
</blockquote>
<p>Em "Regras de saída", vamos manter a opção "Todo o tráfego" para que consigamos, por exemplo, acessar a internet a partir de uma instância que possui esse grupo de segurança.</p>
<p>Um detalhe interessante é que grupos de segurança só possuem regras de permitir alguma coisa. Não podemos, por exemplo, permitir todo o tráfego de saída para a internet e bloquear algum IP específico. Isso não é possível. </p>
<p>Se quisermos adicionar uma regra de proibir algo podemos usar uma outra ferramenta sobre a qual falaremos mais adiante.</p>
<p>No caso, embora isso não faça sentido, vou deixar a minha regra de saída nesse grupo de segurança, para que todas as máquinas que eu consiga acessar via SSH possam acessar a internet também.</p>
<blockquote>
<p><strong>Regra de saída 1</strong></p>
<p>Tipo: todo o tráfego</p>
<p>Protocolo: Tudo</p>
<p>Intervalo de portas: Tudo</p>
<p>Tipo de destino: Personalizado</p>
<p>Destino: 0.0.0.0/0</p>
</blockquote>
<p>Em seguida, podemos clicar em "Criar grupo de segurança". </p>
<p>Recapitulando, os grupos de segurança só permitem a adição de regras de permissão. Se quisermos bloquear algum IP, por exemplo, não conseguiremos fazer somente com grupos de segurança. E, outro detalhe, imagine que todo o tráfego de entrada para minha rede está bloqueado e todo o tráfego de saída para minha rede está bloqueado.</p>
<p>Mas eu libero a entrada pela porta 80, quando libero no grupo de segurança, libero também a resposta para essa porta.</p>
<p>Ou o contrário, se está tudo bloqueado, nenhuma entrada na minha máquina é permitida, mas permito a saída para acessarmos a internet. Então, também permito que esses pacotes voltem.</p>
<p>Basicamente, um <em>security group</em> é o que chamamos de <strong><em>stateful</em></strong>, ele permite que sua conexão seja completada, que ela vá até o final.</p>
<p>Então, se enviamos um pacote que foi permitido pelo <em>security group</em>, ele permite a resposta dele também. Se recebo um pacote que foi permitido pelo <em>security group</em>, ele também permite a resposta dele.</p>
<p>Agora que já criamos um grupo de segurança, vamos criar duas instâncias e fazer elas se comunicarem. Já trabalhamos com isso, mas é sempre bom relembrar para analisar esses detalhes de rede. Vou criar uma instância em uma sub-rede, outra instância em outra sub-rede, e quero que elas se comuniquem sem nenhum problema.</p>
<p>Vamos fazer isso no próximo vídeo!</p>
                        </div>