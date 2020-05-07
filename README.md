vim_setup
=========

My `NeoVim` setup for Scala development using [coc.nvim](https://github.com/neoclide/coc.nvim) as my LSP client.

Note: I have mapped my Windows Key to Meta as opposed to Right Alt.

### [Scala Metals LSP](https://scalameta.org/metals/docs/editors/vim.html) on NeoVim

Find all the instructions in their website: https://scalameta.org/metals/docs/editors/vim.html
After you have coc.nvim and all plugins (under the init.vim) installed, launch vim as nvim and then Command :CocInstall coc-metals.  This will ensure that whenever metals gets updated you will automatically download the latest

Also, don't forget to add `~/.local/bin` to your `PATH` if the script doesn't do it automatically.

