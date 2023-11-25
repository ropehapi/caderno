<div class="formattedText" data-external-links="">
                                <p>Vamos continuar nosso aprofundamento do <em>AWS EC2</em>.</p>
<p>É hora de aprender mais um pouco sobre as regiões da <em>AWS</em>. Vamos acessar "EC2 &gt; Instâncias &gt; Instâncias &gt; Zona de disponibilidade". Nossa zona de disponibilidade é nossa região, "us-east-1" com um d ao final, ficando "us-east-1d".</p>
<p>Em uma nova aba, acessaremos <a href="https://aws.amazon.com" rel="nofollow noopener" target="_blank">https://aws.amazon.com</a>. Vamos descer até que encontremos o mapa abaixo de "Rede global de regiões da AWS". No mapa, há vários pontos pelo mundo, que representam as regiões da <em>AWS</em>.</p>
<p>Vamos clicar no ponto de São Paulo. Quando passamos o cursos sobre esse ponto, descobrimos que dentro dessa região há três zonas de disponibilidade. Essas diferentes zonas podem estar em andares, ou até mesmo prédios, diferentes.</p>
<p>Quando os servidores de uma zona caem, não necessariamente os das outras zonas cairão. Essa é uma forma a mais de termos redundância. </p>
<p>Poderíamos criar uma instância em uma zona de disponibilidade, outra em outra zona e ter um <em>load balancer</em> à frente, dividindo a carga entre as duas. Dessa forma, se uma zona sair do ar, a instância continua a funcionar através da outra.</p>
<p>Assim, garantimos serviços mais tolerantes a falhas.</p>
<blockquote>
<p>Obs:
As zonas de disponibilidade são independentes. Elas não estão diretamente ligadas, mas podemos viabilizar sua comunicação manipulando as configurações de rede, como vimos no treinamento de <em>VPC</em>.</p>
</blockquote>
<p>No mapa, os pontos verdes representam regiões existentes e os em laranja regiões que serão criadas. </p>
<p>No próximo vídeo, vamos bater um papo sobre instâncias pré-configuradas.</p>
                        </div>