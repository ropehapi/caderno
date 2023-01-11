# Postgres SQL
As anotações a seguir se tratam de funcionalidades e ferramentas específicas do Postgres

    CREATE TABLE treinamento.funcionario(
        id bigserial,
        nome character varying(60),
        departamento character varying(60),
        salario numeric(11,2),
        constraint pk_funcionario primary key (id)
    );

    INSERT INTO treinamento.funcionario (nome, departamento, salario) VALUES('Pedro', 'Desenvolvedor', 7000);

Toda tabela tem uma sequence, que é uma estrutura separada da tabela que serve como um contador. Como a propriedade de auto increment do MySQL por exemplo.

    select id,
           nome,
           coalesce(departamento, 'A definir') departamento,
           cast(salario as text),
           salario::text,
           salario::bigint
    from treinamento.funcionario

    select departamento,
           sum(salario) total_custo,
           avg(salario)::numeric(11,2) media_salarial,
    from treinamento.funcionario
    --group by 1
    group by departamento
    having avg(salario) >= 1000

    select  id,
            nome,
            departamento,
            salario,
            avg(salario) over(partition by departamento)::numeric(11,2) media_salarial_setor,
            sum(salario) over(partition by departamento)::numeric(11,2) total_custo_setor,
            abg(salario) filter(where salario < 1000) over(partition by 1)::numeric(11,2) media_salarial_salario_menor_10k
    from treinamento.funcionario

    select 'ID Brasil',
           id,
           nome,
           departamento,
           salario,
           rank() over(partition by departamento order by desc, id) rank
    from treinamento.funcionario

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

Pesquisar sobre recursividade

    insert into treinamento.funcionario(nome, departamento, salario)
    select nome, origem, 1000
    from movimentacao.pessoa
    limit 10


    insert into treinamento.funcionario(nome, departamento, salario)
    values('Pedro Y', 'Dev', 400)
    on conflict (departamento, nome)
    do nothing

    ou

    do update set salario = 800
    where treinamento.funcionario.salario <= 600

Dar um exemplo de sum