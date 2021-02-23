"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


" General Settings
if !exists('g:vscode')
  source $HOME/.config/nvim/plug-conf/polyglot.vim
endif

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/mappings.vim

if exists('g:vscode')

  " VSCode only config
  source $HOME/.config/nvim/plug-conf/vscode.vim
  
else

  " Plugin congifs
  source $HOME/.config/nvim/plug-conf/airline.vim
  source $HOME/.config/nvim/plug-conf/closetags.vim
  source $HOME/.config/nvim/plug-conf/coc.vim
  luafile $HOME/.config/nvim/plug-conf/colorizer.lua
  source $HOME/.config/nvim/plug-conf/far.vim
  source $HOME/.config/nvim/plug-conf/floaterm.vim
  source $HOME/.config/nvim/plug-conf/fzf.vim
  source $HOME/.config/nvim/plug-conf/git-messenger.vim
  source $HOME/.config/nvim/plug-conf/gitgutter.vim
  source $HOME/.config/nvim/plug-conf/highlightyank.vim
  source $HOME/.config/nvim/plug-conf/markdown-preview.vim
  source $HOME/.config/nvim/plug-conf/polyglot.vim
  source $HOME/.config/nvim/plug-conf/rainbow.vim
  source $HOME/.config/nvim/plug-conf/rnvimr.vim
  source $HOME/.config/nvim/plug-conf/start-screen.vim
  source $HOME/.config/nvim/plug-conf/vim-commentary.vim
  source $HOME/.config/nvim/plug-conf/vim-easymotion.vim
  source $HOME/.config/nvim/plug-conf/vim-router.vim
  source $HOME/.config/nvim/plug-conf/vim-windowsnap.vim
  source $HOME/.config/nvim/plug-conf/which-key.vim

endif
  
source $HOME/.config/nvim/plug-conf/vim-easymotion.vim
source $HOME/.config/nvim/plug-conf/highlightyank.vim
source $HOME/.config/nvim/plug-conf/quickscope.vim
