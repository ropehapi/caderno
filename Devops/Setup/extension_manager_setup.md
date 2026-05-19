# Ubuntu Dev Setup - Monitoramento na Barra Superior

## 🔧 Instalar suporte a extensões

``` bash
sudo apt install gnome-shell-extensions gnome-shell-extension-manager chrome-gnome-shell
```

------------------------------------------------------------------------

## 📊 Instalar extensão Vitals

1.  Abra:

``` bash
extension-manager
```

2.  Vá em **Browse**
3.  Procure por **Vitals**
4.  Instale e ative

------------------------------------------------------------------------

## ⚙️ Configuração

1.  Clique no ícone da extensão
2.  Vá em **Preferences**
3.  Ative:
    -   CPU
    -   Memory
    -   Temperature
4.  Em **Position in panel**, escolha Left ou Right

------------------------------------------------------------------------

## 🌡️ Corrigir sensores de temperatura

``` bash
sudo apt install lm-sensors
sudo sensors-detect
sensors
```

Reinicie a sessão depois.

------------------------------------------------------------------------

## 💡 Alternativas leves

-   System Monitor (gráficos simples)
-   Freon (temperatura apenas)

------------------------------------------------------------------------

## 🎨 Dicas extras

-   Fonte: Fira Code
-   Terminal: Tilix
-   Tema: Adwaita-dark ou Nordic
-   Ícones: Papirus

------------------------------------------------------------------------

## 🚀 Resultado esperado

CPU: 12% \| RAM: 3.2GB \| 🌡️ 58°C \| ↑↓ Net
