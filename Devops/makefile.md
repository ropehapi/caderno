# Makefile
O makefile é uma ferramenta nativa instalada em quase todo sistema UNIX que tem como intuito facilitar nossa vida através de automações por comandos.

Abaixo, deixarei um exemplo de um arquivo makefile completo, que realiza todas as operações mais triviais, e as comentarei caso necessário.

```
PATH ?= /cmd/

include othermakefiletobeextended

#Pode aninhar infinitamente
migrations:
	@php artisan migrate

#Pode ter mais de uma dependencia
up: migrations
	@php artisan serve --port 80

.PHONY: quando-for-alias-senao-cria-arquivo-tipo.env

start-%:
	@echo $*.txt
	@echo $@

start-pedro start-yoshimura: start-%
	@echo "Meu nome é $*"

entrar-diretorio:
	@cd $(PATH)

#make PATH=novo-path substitui uma variavel de ambiente
#Todas as variaveis são executadas pra ter no ambiente (ex do sleep)

.PHONY: api-%
api-%:
	@make -C src/api $*
#Vai manipular o makefile de dentro da pasta api

.PHONY: front-%
front-%:
	@make -C src/front $*
#Vai manipular o makefile de dentro da pasta front
```