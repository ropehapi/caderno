commit:
	@if [ -z "$(message)" ]; then \
		echo "Erro: é necessário fornecer uma mensagem de commit."; \
		exit 1; \
	fi
	@git add . && git commit -m "$(message)" && git push