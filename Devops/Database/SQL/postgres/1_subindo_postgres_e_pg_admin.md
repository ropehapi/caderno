# Subindo BD Postgres e PG Admin 4
Com o docker instalado, rode `docker compose up -d` no docker-compose abaixo:

```
version: '3'
services:
  postgres:
    image: "postgres"
    environment:
      - POSTGRES_USER=root
      - POSTGRES_PASSWORD=root
      - POSTGRES_DB=root      
    ports:
      - "5432:5432"
    volumes:
      - ./migration/docker-database-initial.sql:/docker-entrypoint-initdb.d/docker-database-initial.sql   

  pgadmin-compose:
    image: dpage/pgadmin4
    environment:
      PGADMIN_DEFAULT_EMAIL: "gui@alura.com"
      PGADMIN_DEFAULT_PASSWORD: "123456"
    ports:
      - "54321:80"
    depends_on:
      - postgres
```

Para acessar o pgadmin: http://127.0.0.1:54321

Para configurar o host no pgadmin: 

- Fazer acesso com as credenciais do docker-compose
- Pegar o ip do container do postgres com `sudo docker inspect <nome_container> | grep IPAddress
- Passar as credenciais do banco na tela de adicionar servidor