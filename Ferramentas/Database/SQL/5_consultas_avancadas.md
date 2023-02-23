# **DQL**
Linguagem de consulta de dados, composta por um único comando, o select, que deve ser complementado pelos mais diversos tipos de filtragem que existem no SQL.

- SELECT: Seleciona os registros a exibir

        SELECT * FROM nome_tabela

## **Filtros de seleção**
- Registros selecionados: WHERE
- Operadores relacionais: 
     - =, !=, \>, <, \>=, <=, IS NULL, IS NOT NULL, BETWEEN, LIKE
- Operadores lógicos:
    - AND, OR, NOT

## **Relacionamentos e visões**
A partir de Informações relacionadas entre si, que geralmente possuem campos em comum, podemos manipular nossas consultas de forma a nos retornar os mais variados tipos de visões.

### **Join**
Usado quando queremos trazer em uma consulta os dados de registros de duas tabelas distintas, podemos usar o `JOIN` quando as tabelas possuírem um campo em comum, da seguinte maneira:

    SELECT c.nome_carro,
           m.nome_motorista 
    FROM carro c 
    JOIN motorista m ON c.motorista_id = m.id;

### **Tipos de Join**
Há varios tipos de join, como explicados na imagem abaixo.
![Tipos de join](/src/img/tipos_de_join.png)

## **Funções**
- Funções de agregração
    - COUNT, SUM, AVG, MAX, MIN
- Funções de paginação
    - DISTINCT, ORDER BY, LIMIT, OFFSET
- Funções de agrupamento
    - GROUP BY, HAVING

## **Subqueries**
Subqueries são consultas dentro do resultado de outra consulta armazenada em memória.

- IN/NOT IN

        SELECT nome FROM funcionarios
        WHERE departamento in(
            SELECT departamento FROM funcionarios
            GROUP BY departamento HAVING AVG(salario) > 1500 
        );

