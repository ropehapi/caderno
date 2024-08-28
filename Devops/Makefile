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