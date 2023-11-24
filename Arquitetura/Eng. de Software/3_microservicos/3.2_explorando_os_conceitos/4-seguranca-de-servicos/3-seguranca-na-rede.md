# Aula: Segurança na Rede
![Alt text](/src/img/sistemas-firewall.png)
## Introdução
- Enfoque na importância da segurança de rede para microsserviços.
- Reconhecimento de que programação é apenas uma parte da arquitetura de microsserviços.

## Blindagem de Microsserviços
1. **Isolamento por Rede Virtual**
   - Colocação de microsserviços em uma rede virtual.
   - Restrição de conexões apenas à mesma rede, impedindo acessos externos não autorizados.

2. **Utilização de Firewall no API Gateway**
   - Implementação de firewall no API Gateway para controlar e monitorar o tráfego.
   - Prevenção de ataques, como SQL injection e negação de serviço (DoS/DDoS).

## Restrição de Acessos por IP
1. **Lista de IPs Permitidos**
   - Configuração para permitir acessos apenas de IPs específicos.
   - Exemplo de restrição de acesso a microsserviços com base nos IPs permitidos.

2. **Aplicações Públicas e Restritas**
   - Diferenciação entre microsserviços acessíveis publicamente e aqueles com restrições.
   - Uso de IPs conhecidos para limitar o acesso a áreas sensíveis.

## Próxima Aula: Defense in Depth
- Discussão sobre a abordagem "Defense in Depth" na segurança de microsserviços.
- Exploração de técnicas complementares para fortalecer a segurança em vários níveis.

## Aula Anterior: Autenticação e Autorização
- Revisão dos conceitos de autenticação e autorização em microsserviços.
- Ênfase na importância desses conceitos na construção de sistemas seguros.
