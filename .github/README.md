<p align="center">
    <a href="https://github.com/TokyoVim/TokyoVim/releases">
    <img
        alt="Release"
        src="https://img.shields.io/github/v/release/TokyoVim/TokyoVim.svg?style=for-the-badge&logo=github&color=F2CDCD&logoColor=D9E0EE&labelColor=363A4F">
        </a>
    <a href="https://github.com/TokyoVim/TokyoVim/stargazers">
    <img
        alt="Stars"
        src="https://img.shields.io/github/stars/TokyoVim/TokyoVim?colorA=363A4F&colorB=B7BDF8&logo=adafruit&logoColor=D9E0EE&style=for-the-badge">
    </a>
    <a href="https://github.com/TokyoVim/TokyoVim/issues">
    <img
        alt="Issues"
        src="https://img.shields.io/github/issues-raw/TokyoVim/TokyoVim?colorA=363A4f&colorB=F5A97F&logo=github&logoColor=D9E0EE&style=for-the-badge">
    </a>
    <a href="https://github.com/TokyoVim/TokyoVim/contributors">
    <img
        alt="Contributors"
        src="https://img.shields.io/github/contributors/TokyoVim/TokyoVim?colorA=363A4F&colorB=B5E8E0&logo=git&logoColor=D9E0EE&style=for-the-badge">
    </a>
    <img
        alt="Code Size"
        src="https://img.shields.io/github/languages/code-size/TokyoVim/TokyoVim?colorA=363A4F&colorB=DDB6F2&logo=gitlfs&logoColor=D9E0EE&style=for-the-badge">
</p>

</b><br>Welcome to official **Tokyo 🌊** Repository! Carefully designed with usability and functionality in mind , keep the lightness on resources! All-in-one for back-end and front-end developers.</p>

## 🚀 Showcase

<img src="https://i.ibb.co/pWXmYGN/preview-in-code-1.png">

## ✨ Features

- Fast startup times
- Easily customize
- Autocompletion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Terminal with [Toggleterm](https://github.com/akinsho/toggleterm.nvim)
- Automatic [LSP](https://neovim.io/doc/user/lsp.html) with [Mason](https://github.com/williamboman/mason.nvim) and [LSPConfig](https://github.com/neovim/nvim-lspconfig)
- Syntax highlighting with [Tree-sitter](https://github.com/tree-sitter/tree-sitter)
- [Statusline](https://github.com/nvim-lualine/lualine.nvim) and [Bufferline](https://github.com/akinsho/bufferline.nvim)
- Debug with [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- Git integration with [DiffView](https://github.com/sindrets/diffview.nvim) and [GitSings](https://github.com/lewis6991/gitsigns.nvim)

## 🎯 Requirements

- [Neovim](https://neovim.io/) 0.9.5+
- [Nerd Fonts](https://www.nerdfonts.com/) (optional)

## 🛠 Installation

Access [Wiki](https://github.com/TokyoVim/TokyoVim/wiki/Get-started) to read the more detailed installation guide.

### Linux/macOS

Backup of your current nvim

```bash
mv ~/.config/nvim ~/.config/nvim.old
```

Clear cache and data (recommend)

```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

Clone the TokyoVim and start Neovim

```bash
git clone https://github.com/TokyoVim/starter.git --depth 1 ~/.config/nvim
nvim
```

### Windows - Powershell

Backup of your current nvim

```powershell
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.old
```

Clear data (recommend)

```powershell
Remove-Item -Path $env:LOCALAPPDATA\nvim-data -Recurse -Force
```

Clone the TokyoVim and start Neovim

```powershell
git clone https://github.com/TokyoVim/starter.git --depth 1 $env:LOCALAPPDATA\nvim
nvim
```

## 🔠 Languages

Nvim supports Language Server Protocol (LSP), which means that it acts as a client for LSP servers. Thus, all language support is done through [Mason (LSP Installer)](https://github.com/williamboman/mason.nvim) and automatically configured by [LSPConfig](https://github.com/neovim/nvim-lspconfig). Use the Mason command to manage your language servers.
[nvim-cmp](https://github.com/hrsh7th/nvim-cmp) is responsible for giving suggestions for completing your code, including snippets.
Syntax highlighting is installed automatically through the
[Tree-sitter](https://github.com/tree-sitter/tree-sitter)

In short: Open HydarVim and start coding.

Read more about lsp [here](https://neovim.io/doc/user/lsp.html).

## 📚 Wiki

All documentation for customization (themes, plugins, autocmds, etc), debugging, and potential errors can be found in the [Wiki](https://github.com/TokyoVim/TokyoVim/wiki/).

## 💫 Thanks to

We are grateful to the repositories, plugin authors and the Neovim community for making TokyoVim possible. They offer special thanks to AstroVim, NvChad, LunarVim and CosmicVim for their inspiration and resources, as well as to all the plugin developers who have created useful tools for Neovim.
