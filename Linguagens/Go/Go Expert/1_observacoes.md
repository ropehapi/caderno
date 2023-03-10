# Observações
Neste artigo tem o intuito de conter pequenos fragmentos de anotações sobre o curso, tendo em vista que já é um assunto que eu conheço, e pode não ser pertinente explicar todo um contexto.

- Todo arquivo .go com exceção do main DEVE pertencer a um package com o nome do diretório em que o arquivo se encontra.

- No go, somos habilitados a criar nossos próprios tipos. Para isso, basta declara-lo da seguinte maneira: `type ID int`.

- Existem duas maneiras alternativas de se inicializar um map vazio: 
        
        mapa := make(map[string]int)
        ou
        mapa := map[string]int{}

- Podemos criar um erro para retornar na nossa função da seguinte maneira:

        return x, errors.New("Meu erro aqui")

