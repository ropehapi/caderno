# Aula: Cuidando do Host - Criando Microsserviços

## Introdução
- Revisão de conceitos anteriores: componentes, contratos e barreiras entre microsserviços.
- Foco na criação de microsserviços: cuidando do host, escolhendo infraestrutura.

## Cuidando do Host
- Significa lidar com servidores e a infraestrutura física ou virtual.
- Desafios: armazenamento, comunicação e facilidade de desenvolvimento e deploy.

## Opções para Cuidar do Host
1. **Máquinas Virtuais**
   - Comum em ambientes monolíticos.
   - Uso de scripts para provisionamento (ex: Vagrant com Puppet).
   - Alto custo computacional e oneração de máquinas locais.

2. **Serviços de Cloud (AWS, Azure, Google Cloud)**
   - Ambientes robustos e customizáveis.
   - Custos elevados para ambientes locais de desenvolvimento.
   - Soluções específicas para produção, mas desafiador para desenvolvimento local.

3. **Containers**
   - Solução intermediária, amplamente adotada.
   - Facilita desenvolvimento e deploy.
   - Mais leve que máquinas virtuais.
   - Orquestradores populares: Kubernetes, Docker Swarm.

## Vantagens dos Containers
- Facilitam o provisionamento de ambientes de desenvolvimento.
- Leves e eficientes, adequados para máquinas locais.
- Orquestradores simplificam o gerenciamento em produção.

## Cenário Efetivo de Criação de Microsserviços
- Utilização de containers como padrão.
- Desenvolvimento e deploy facilitados com orquestradores.
- Próxima aula: Considerações ao iniciar a codificação de um microsserviço.
