# Neovim Configuration - Agent Guidelines

## Build/Test/Lint Commands
This is a LazyVim-based Neovim configuration. No build commands needed - configuration loads via Lazy plugin manager.
- **Test config**: `nvim --headless -c "lua vim.defer_fn(function() vim.cmd('qa!') end, 1000)"` or launch `nvim` and check for errors/warnings
- **Lint Lua**: Use `stylua .` for formatting, `luacheck .` for linting (Mason-installed tools)
- **Single file test**: `nvim --headless -u NONE -c "source <file>" -c "qa!"` to test individual Lua files
- **Package management**: Plugins managed by Lazy.nvim, LSP tools by Mason

## Code Style & Conventions
- **Language**: Lua only, **Indentation**: 2 spaces (no tabs), **Encoding**: UTF-8
- **Naming**: snake_case for functions/variables, PascalCase for modules
- **Module pattern**: `local M = {}` return pattern, avoid global variables
- **Comments**: Use `--` for single-line, `---@param` and `---@return` for type annotations
- **Error handling**: Use `pcall()` for error-prone operations, explicit error messages
- **Imports**: Use relative requires for local modules, avoid circular dependencies

## File Structure
- `init.lua`: Entry point, loads config.lazy
- `lua/config/`: Core configuration (options, keymaps, autocmds, lazy setup)
- `lua/plugins/`: Plugin configurations (return plugin spec tables with lazy loading)
- `lua/mpanasiewicz/`: Custom utilities and functions
- `lua/util/`: Shared utility modules (debug.lua provides global `dd()` function)

## Plugin Configuration
- Use lazy loading: `keys`, `cmd`, `event`, `ft` triggers for performance
- LazyVim spec format: `{ "author/plugin", opts = {}, keys = {}, dependencies = {} }`
- Import LazyVim extras: `{ import = "lazyvim.plugins.extras.lang.typescript" }`
- Override defaults in `opts` function or table, extend with `vim.list_extend()`