# Phoenix
O Phoenix é um framework de desenvolvimento web com elixir semelhante a frameworks como rails, laravel e buffalo.

## Instalando o Phoenix
> mix archive.install hex phx_new

## Criando um projeto phoenix
> mix phx.new <nome_projeto> --no-assets --no-html --no-mailer --no-gettext

## Configurando um bd para a aplicação
> mix ecto.setup //Após configurar o arquivo de configuração para dev

## Servindo um projeto phoenix
> mix phx.server