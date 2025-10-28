# CI/CD
CI CD nada mais é que o processo de integrar modificações do codebase de forma contínua e automatizada, de forma a evitar erros humanos de verificação, garantindo mais agilidade e segurança no processo de desenvolvimento de um software.

Alguns dos principais processos agregados ao CI são:
- Execução de testes
- Linter
- Verificações de qualidade de código
- Verificações de segurança
- Geração de artefatos prontos para o processo de deploy
- Identificação da próxima versão a ser gerada no software
- Geração de tags e releases

Com isso, nós podemos configurar o famoso status check, que é a garantia de que um PR não poderá ser mergeado ao repositório sem antes ter passado pelo processo de CI ou mesmo no processo de code review.

## Ferramentas populares
- Jenkins
- Github actions
- Circle CI
- AWS Code build
- Azure DevOps
- Google Cloud Build

## Github actions
Para aprofundarmos em nossos estudos, utilizaremos o GitHub Actions, um automatizador de workflow de desenvolvimento de software. Ele utiliza os principais eventos gerados pelo github para que possamos executar tarefas dos mais variados tipos, incluindo processos de CI.

O GH Actions funciona de acordo com a seguinte dinâmica: 
![alt text](/src/img/dinamica_gh_actions.png)

### Actions
Uma action é a ação que de fato será executada em um dos steps de um job em um workflow. Ela pode ser criada do zero ou ser reutilizada de actions pre-existentes.