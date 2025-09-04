# Neovim Configuration - Agent Guidelines

## Build/Test/Lint Commands
This is a LazyVim-based Neovim configuration. No build commands needed - configuration loads via Lazy plugin manager.
- Test config: Launch `nvim` and check for errors/warnings
- Lint Lua: Use `stylua` for formatting, `selene`/`luacheck` for linting (installed via Mason)
- Package management: Plugins managed by Lazy.nvim, LSP tools by Mason

## Code Style & Conventions
- **Language**: Lua only
- **Indentation**: 2 spaces (no tabs), set in options.lua:24-25
- **Naming**: snake_case for functions/variables, PascalCase for modules
- **Module pattern**: Return table with functions, use `local M = {}` pattern
- **Comments**: Use `--` for single-line, avoid block comments unless necessary
- **Function docs**: Use `---@param` and `---@return` annotations for type hints

## File Structure
- `init.lua`: Entry point, loads config.lazy
- `lua/config/`: Core configuration (options, keymaps, lazy setup)
- `lua/plugins/`: Plugin configurations (return plugin spec tables)
- `lua/mpanasiewicz/`: Custom utilities and functions
- `lua/util/`: Shared utility modules

## Plugin Configuration
- Use lazy loading with `keys`, `cmd`, `event` triggers
- Follow LazyVim plugin spec format: `{ "author/plugin", opts = {}, keys = {} }`
- Import LazyVim extras via `{ import = "lazyvim.plugins.extras.lang.typescript" }`
- Override plugin defaults in `opts` function or table

## Development Notes
- Global debug function `dd()` available for debugging (util/debug.lua)
- LSP configured via lspconfig with Mason for tool management
- Inlay hints disabled by default, can be toggled