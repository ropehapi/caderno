# **Postgres SQL**
*Antes de mais nada: Esse caderno dispõe de um tópico sobre SQL [aqui](https://github.com/ropehapi/caderno/Database/SQL).*

As anotações a seguir se tratam de funcionalidades e ferramentas específicas do Postgres.

## **Criando uma tabela**
    CREATE TABLE treinamento.funcionario(
        id bigserial,
        nome character varying(60),
        departamento character varying(60),
        salario numeric(11,2),
        constraint pk_funcionario primary key (id)
    );

*Ao passar o parametro `bigserial` no DDL, o Postgres entende que se trata de uma coluna `bigint` com `auto_increment`.

### **Sequences**
Toda tabela tem uma sequence, que é uma estrutura separada da tabela que serve como um contador. Como a propriedade de auto increment do MySQL por exemplo.

## **Consultando registros**
*O `coalesce` nada mais é que um ternário onde se a coluna for null, ele atribuirá um valor default.

*Afim de que possamos converter nossos dados de saída, o Postgres oferece duas maneiras de fazermos isso, através do `cast`, passando a coluna e o tipo desejado, ou através do operador coluna`::tipo`.

    select id,
           nome,
           coalesce(departamento, 'A definir') departamento,
           cast(salario as text),
           salario::text,
           salario::bigint
    from treinamento.funcionario

TODO:: Comentar o having e as funções.

    select departamento,
           sum(salario) total_custo,
           avg(salario)::numeric(11,2) media_salarial,
    from treinamento.funcionario
    --group by 1
    group by departamento
    having avg(salario) >= 1000

TODO:: Comentar o partition by

    select  id,
            nome,
            departamento,
            salario,
            avg(salario) over(partition by departamento)::numeric(11,2) media_salarial_setor,
            sum(salario) over(partition by departamento)::numeric(11,2) total_custo_setor,
            abg(salario) filter(where salario < 1000) over(partition by 1)::numeric(11,2) media_salarial_salario_menor_10k
    from treinamento.funcionario

TODO:: Comentar o rank

    select 'ID Brasil',
           id,
           nome,
           departamento,
           salario,
           rank() over(partition by departamento order by desc, id) rank
    from treinamento.funcionario

TODO:: Comentar o with

    with t_tag(
        id, tipo_tag_id, valor, tipo_tag_descricao
    ) as (
        select tag.id,
               tag.tipo_tag_id,
               tag.valor,
               tag.descricao
        from movimentacao.tag_item_personalizacao tag
        join tipo_tag tp on tp.id = tag.tipo_tag_id
        where tag.empresa_id = any(etl.obter_empresas_por_dominio(4,'TagItemPersonalizacao))
        limit 50
    )

    select id,
           tipo_tag_id,
           valor,
           tipo_tag_descricao
    from t_tag



TODO::Pesquisar sobre recursividade

## **Manipulando dados**

TODO:: Comentar inserção de dados com base em outra consulta

    insert into treinamento.funcionario(nome, departamento, salario)
    select nome, origem, 1000
    from movimentacao.pessoa
    limit 10

TODO:: Comentar o on conflict, e o do

    insert into treinamento.funcionario(nome, departamento, salario)
    values('Pedro Y', 'Dev', 400)
    on conflict (departamento, nome)
    do nothing

    ou

    do update set salario = 800
    where treinamento.funcionario.salario <= 600

TODO:: Dar um exemplo de sum