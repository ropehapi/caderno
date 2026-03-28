# Claude
Here's a step by step guide of installation, configration and usage of my claude code setup.

1. Claude code installation
```sh
curl -fsSL https://claude.ai/install.sh | bash
```
2. First usage and login
```sh
claude # Opens claude code CLI  
/login 
```
3. [Uv](https://docs.astral.sh/uv/getting-started/installation/#standalone-installer) installation (useful python package manager to handle some MCP servers)
```
curl -LsSf https://astral.sh/uv/install.sh | sh
```
4. Install [Plannotator](https://github.com/backnotprop/plannotator) (plugin)
```sh
curl -fsSL https://plannotator.ai/install.sh | bash

# Then in claude:
/plugin marketplace add backnotprop/plannotator
/plugin install plannotator-copilot@plannotator
```
Restart Copilot CLI after plugin install. Plan review activates automatically when you use plan mode (Shift+Tab to enter plan mode).

5. Install [superporwers](https://github.com/obra/superpowers) (plugin)
```sh
/plugin install superpowers@claude-plugins-official
```
6. Add MCP servers needed
```sh
# This step can be deeply explained in this repository at /IA/mcp.md
```

