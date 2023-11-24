# Aula: Autenticação e Autorização

## Introdução
- Importância da autenticação e autorização em microsserviços.
- Desafios de segurança ao lidar com vários microsserviços.

## Autenticação
1. **Conceito de Autenticação**
   - Identificação do cliente realizando uma requisição.
   - Não confiar cegamente nos clientes, sejam maliciosos ou inadvertidos.

2. **Técnicas de Autenticação**
   - Basic Authorization in HTTP: Envio de usuário e senha no cabeçalho.
   - API Key: Chave única fornecida ao cliente para autenticação.
   - Tokens (JWT): Geração de token após autenticação para uso contínuo.

3. **Técnicas Mais Avançadas**
   - OAuth: Integração com serviços externos para autenticação.
   - Open ID Connect: Padrão semelhante ao OAuth com foco em identificação.

## Autorização
1. **Conceito de Autorização**
   - Determina se um usuário autenticado pode realizar determinadas ações.
   - Diferença entre autenticação e autorização.

2. **Técnicas de Autorização**
   - ACL (Access Control List): Lista de controle de acesso.
   - RBAC (Role-Based Access Control): Controle de acesso baseado em papéis.

3. **On Behalf Of**
   - Conceito de "on behalf of" para autorização entre microsserviços.
   - Requisições de um microsserviço para outro em nome de um cliente original.

## Próxima Aula: Segurança na Infraestrutura de Redes para Microsserviços
- Exploração da segurança na infraestrutura de redes para microsserviços.
- Discussão sobre a importância da segurança nesse nível.

## Aula Anterior: Segurança Geral
- Visão geral sobre segurança, abordando HTTPS, criptografia e anonimização.
- Contextualização da importância da segurança no transporte e em repouso.
