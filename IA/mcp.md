# MCP servers
MCP servers nada mais são do que uma forma de garantir aos seus agentes autônomos acesso às aplicações em seu nome através de tokens.
Por exemplo: você quer que o claude tenha acesso às actions de um repositório do GitHub para saber qual ação tomar, ou até mesmo que ele leia um requisito no Confluence para se contextualizar para uma tarefa.

Abaixo, segue alguns guias de configuração de servidores MCP úteis.

## Atlassian - JIRA - Confluence
Antes de fazer a "instalação" do servidor MCP da atlassian, é necessário instalar o [uv](https://docs.astral.sh/uv/getting-started/installation/), gerenciador de pacotes pyton (visto que o MCP da atlassian é um MCP local e não na nuvem).

Após isso, basta seguir o passo a passo definido [nesse repositório](https://github.com/sooperset/mcp-atlassian):
- Criar uma [chave de API](https://id.atlassian.com/manage-profile/security/api-tokens) para o seu agente.
- Adicionar a seguinte configuração do MCP ao seu ~/.claude.json:
```json
{
  "mcpServers": {
    "mcp-atlassian": {
      "command": "uvx",
      "args": ["mcp-atlassian"],
      "env": {
        "JIRA_URL": "https://your-company.atlassian.net",
        "JIRA_USERNAME": "your.email@company.com",
        "JIRA_API_TOKEN": "your_api_token",
        "CONFLUENCE_URL": "https://your-company.atlassian.net/wiki",
        "CONFLUENCE_USERNAME": "your.email@company.com",
        "CONFLUENCE_API_TOKEN": "your_api_token"
      }
    }
  }
}
```
- Reiniciar o claude, e começar a usar.

#### Exemplos de uso
No seu prompt:
- "Find issues assigned to me in PROJ project"
- "Search Confluence for onboarding docs"
- "Create a bug ticket for the login issue"
- "Update the status of PROJ-123 to Done"
