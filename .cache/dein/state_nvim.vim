if g:dein#_cache_version !=# 150 || g:dein#_init_runtimepath !=# '/Users/stenver/.config/nvim,/etc/xdg/nvim,/Users/stenver/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/local/Cellar/neovim/0.4.4/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/stenver/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/stenver/.config/nvim/after,/Users/stenver/.cache/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/stenver/.config/nvim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/stenver/.cache/dein'
let g:dein#_runtime_path = '/Users/stenver/.cache/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/stenver/.cache/dein/.cache/init.vim'
let &runtimepath = '/Users/stenver/.config/nvim,/etc/xdg/nvim,/Users/stenver/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/stenver/.cache/dein/repos/github.com/neoclide/coc.nvim_release,/Users/stenver/.cache/dein/repos/github.com/Shougo/dein.vim,/Users/stenver/.cache/dein/.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.4.4/share/nvim/runtime,/Users/stenver/.cache/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/stenver/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/stenver/.config/nvim/after'
filetype off
