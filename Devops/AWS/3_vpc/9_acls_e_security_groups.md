<div class="formattedText" data-external-links="">
                                <p>Neste vídeo, vamos falar sobre a parte da <a href="https://docs.aws.amazon.com/pt_br/vpc/latest/userguide/VPC_Security.html" target="_blank" rel="nofollow noopener noreferrer">documentação da AWS</a> que trata sobre <strong>segurança de uma VPC</strong> e <strong>controle de tráfego dentro de uma sub-rede</strong>.</p>
<p><img src="https://cdn1.gnarususercontent.com.br/1/563692/47bab97d-c6b2-43d0-aadd-40b48b0165c5.png" alt="Diagrama representando camadas de segurança fornecidas pelos grupos de segurança e ACLs de rede.  O tráfego proveniente de um gateway da internet é roteado para a sub-rede apropriada usando as rotas apresentadas na tabela de rotas. As regras da ACL de rede associadas à sub-rede controlam qual tráfego é permitido à sub-rede. As regras do grupo de segurança associadas à instância controlam qual tráfego é permitido à instância. ">  </p>
<p>Vamos focar na parte de acesso da internet a uma instância EC2.</p>
<p>Nessa imagem temos algumas etapas intermediárias sobre as quais falaremos mais adiante nesse curso, como <em>internet gateway</em>, tabela de roteamento, etc. Mas agora focaremos na parte de ACL e grupos de segurança.</p>
<p>As <strong>ACLs (<em>Action Control Lists</em>)</strong> ficam na cama de redes, ou seja, atribuímos uma ACL a uma sub-rede. Nessa sub-rede, essas regras serão aplicadas independentemente de termos instâncias EC2, RDS, etc. Independente de qualquer coisa, se está nessa rede, a regra será aplicada.</p>
<p>Já o <strong>grupo de segurança (<em>security group</em>)</strong> não é aplicado à rede inteira, ele é aplicado a um serviço específico, a uma instância específica.</p>
<p>Por exemplo, se queremos permitir acesso SSH a uma instância específica, usaremos o grupo de segurança. Se quisermos impedir o tráfego para qualquer serviço da sub-rede, usaremos a ACL.
Essa é a principal diferença entre os dois.</p>
<p>Na documentação da AWS, temos ainda uma tabela que descreve algumas diferenças entre grupos de segurança e ACLs:</p>
<h3>Grupo de segurança:</h3>
<ul><li>Opera em nível de instância;</li><li>Aplica-se a uma instância somente se ela estiver associada à instância;</li><li>Comporta apenas regras de permissão;</li><li>Avaliamos todas as regras antes de decidir se permitimos ou não o tráfego;</li><li><strong><em>Stateful</em></strong> (com estado): o tráfego de retorno é permitido, seja qual for a regra.</li></ul>
<h3>Conexão ACL:</h3>
<ul><li>Opera em nível de sub-rede;</li><li>Aplica-se a todas as instâncias implantadas na sub-rede associada (fornecendo uma camada adicional de defesa, caso as regras do grupo de segurança sejam permissivas demais);</li><li>Comporta regras de permissão e negação;</li><li>As regras são avaliadas na ordem, a partir da regra de número mais baixo, ao decidir se o tráfego será permitido ou não;</li><li><strong><em>Stateless</em></strong> (sem estado): o tráfego de deve ser permitido explicitamente pelas regras.</li></ul>
<p>Neste capítulo falamos bastante sobre segurança, como se conectar de uma sub-rede para outra, vimos como filtrar e permitir, limitamos o nosso acesso, entre outras coisas.</p>
<p>Agora, vamos limitar ainda mais. O que queremos ter agora é uma sub-rede que será pública, ou seja, terá acesso pela internet, para, por exemplo, ter um servidor web.</p>
<p>Então, a partir do computador conseguiremos acessar o servidor web, que vai ter todos os detalhes para receber conexões HTTP. Mas, em outro lugar, em uma sub-rede privada, vamos ter o banco de dados. Porque só quem acessa o banco de dados é a infraestrutura, não teremos nenhum acesso externo para o banco de dados. Então, o banco de dados estará em uma rede privada que não tem acesso pela internet.</p>
<p>Veremos como criar sub-redes públicas e/ou privadas e fazer com que elas se comuniquem. Na próxima aula teremos uma infra um pouco diferente, uma nova VPC que criaremos do zero, contendo uma sub-rede pública e uma privada.</p>
<p>Nos encontraremos na próxima aula para começar a desenvolver essa estrutura um pouco mais complexa.</p>
                        </div>