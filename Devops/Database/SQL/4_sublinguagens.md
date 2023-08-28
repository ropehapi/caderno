# **Sublinguagens**
## **DDL**
Linguagem de definição de dados, responsável por manipular a estrutura do banco, através dos comandos abaixo.

- CREATE: Cria uma estrutura
- ALTER: Altera uma estrutura
- DROP: Excluir uma estrutura

        CREATE DATABASE nome_banco;
        ALTER DATABASE nome_propriedade;
        DROP DATABASE nome_banco;

        CREATE TABLE nome_tabela (nome tipo_dado atributos, nome_1 tipo_dado atributos);
        ALTER TABLE nome_tabela .....;
        DROP TABLE nome_tabela;

        CREATE INDEX nome ON tabela_e_coluna;
        ALTER INDEX nome_propriedade;
        DROP INDEX nome;

## **DML**
Linguagem de manipulação de dados, responsável por manipular os registros em nosso banco, composta pelos comandos abaixo:

- INSERT: Insere um registro
- UPDATE: Atualiza um registro
- DELETE: Exclui um registro

        INSERT INTO nome_tabela (nome_coluna_1, nome_coluna_2) values (valor_coluna_1, valor_coluna_2);
        UPDATE nome_tabela set nome_coluna = valor_coluna WHERE id = 1;
        DELETE FROM nome_tabela WHERE id = 10;

## **DCL**
Linguagem de controle de acesso, forma de garantir que somente pessoas autorizadas possam realizar ações com os dados.

- Níveis de acceso:
    - Banco de dados, tabelas, colunas, registros
- Niveis de ação:
    - Gerenciar estruturas, gerenciar dados, ler dados

A DCL é composta pelos seguintes comandos:

- CREATE: Cria um usuário
- DROP: Deleta um usuário
- GRANT: Habilita acessos
- REVOKE: Revoga acessos

## **DTL**
Data transaction language é o nome que se dá à linguagem responsável pelas transações, método utilizado para manter a consistência de um banco de dados.

### **Transações ACID**
ACID, um acrônimo para atomicidade, consistência, isolamento e durabilidade, é um padrão transacional, que permite maior confiabilidade dos registros em nosso banco. Explicando letra por letra:

- Atomicidade: Ou tudo dá certo ou nada
- Consistência: Garante as regras do banco
- Isolamento: Fecha o acesso aos dados durante a operação
- Durabilidade: Confirma todas as ações

A DTL é composta pelos seguintes comandos:

- START TRANSACTION: Inicia a transação
- COMMIT: Concretiza a transação
- ROLLBACK: Anula a transação