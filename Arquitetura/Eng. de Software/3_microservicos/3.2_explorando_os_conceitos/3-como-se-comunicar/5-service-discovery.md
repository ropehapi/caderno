# Aula: Service Discovery

## Introdução
- Importância de ter um sistema para que os microsserviços possam encontrar uns aos outros.
- Dificuldades de lidar diretamente com IPs e portas na comunicação.

## Service Discovery
1. **DNS (Domain Name System) Interno**
   - Utilização de DNS interno para nomes de domínio em redes privadas.
   - Configuração em roteadores ou arquivos de host.

2. **Kubernetes e Docker Compose**
   - Ambientes de container como Kubernetes e Docker Compose facilitam o uso de DNS interno.
   - Referência a outros containers pelo nome.

3. **Cloud Computing (Amazon, Google Cloud, Azure)**
   - Serviços de armazenamento em nuvem possuem DNS internos configuráveis.
   - Facilita a comunicação entre serviços em ambientes de nuvem.

4. **Service Registry**
   - Softwares específicos para registro de serviços.
   - Monitoramento do estado dos serviços (verificando se estão ativos).
   - Possibilidade de utilizar load balancing para distribuir requisições.

5. **Nginx como Load Balancer**
   - Configuração de DNS para um load balancer do Nginx.
   - Distribuição de requisições entre diferentes servidores de um microsserviço.

## Considerações Finais
- Importância do Service Discovery para facilitar a comunicação entre microsserviços.
- Utilização de ferramentas e serviços prontos, como DNS interno, Kubernetes, Docker Compose e Service Registry.
- Próxima aula: Aspectos de Segurança em Microsserviços.

## Próxima Aula: Segurança em Microsserviços
- Exploração dos principais aspectos de segurança a serem considerados ao trabalhar com arquitetura de microsserviços.
- Discussão sobre práticas recomendadas e desafios comuns em segurança.
