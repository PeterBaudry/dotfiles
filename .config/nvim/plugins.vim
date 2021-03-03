" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Repeat stuff
    Plug 'tpope/vim-repeat'
    " Text Navigation
    Plug 'unblevable/quick-scope'
    " Better Comments
    Plug 'tpope/vim-commentary'

    if exists('g:vscode')

      " Highlight selected text
      Plug 'machakann/vim-highlightedyank'

    else

      " Text helpers

      " Write files with sudo
      Plug 'lambdalisue/suda.vim'     
      " Better Syntax Support
      Plug 'sheerun/vim-polyglot'
      " Auto pairs for '(' '[' '{' ...
      Plug 'jiangmiao/auto-pairs'
      " Surround
      Plug 'tpope/vim-surround'
      " Auto set indent settings
      Plug 'tpope/vim-sleuth'
      " Auto closing tags automatically
      Plug 'alvan/vim-closetag'
      " Snippets support
      Plug 'honza/vim-snippets'
      " Emmet support
      Plug 'mattn/emmet-vim'
      " Find and replace
      Plug 'brooth/far.vim'
      " COC
      Plug 'neoclide/coc.nvim', {'branch': 'release'}

      " Navigation
      
      " Easymotion
      Plug 'easymotion/vim-easymotion'
      " FZF tools for navigating files
      Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
      Plug 'junegunn/fzf.vim'
      Plug 'airblade/vim-rooter'
      " Ranger
      Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
      " Which key
      Plug 'liuchengxu/vim-which-key'  
      " Terminal
      Plug 'voldikss/vim-floaterm'
      " Intuitive buffer closing
      Plug 'moll/vim-bbye'
      
      " Project management
      
      " Git
      Plug 'airblade/vim-gitgutter'
      Plug 'rhysd/git-messenger.vim'
      " Start Screen
      Plug 'mhinz/vim-startify'

      " Display options
      
      " Themes  
      Plug 'joshdick/onedark.vim'
      " Status bar
      Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'
      " Colorizer
      Plug 'norcalli/nvim-colorizer.lua'
      " Maximize current window
      Plug 'szw/vim-maximizer'
      " Swap windows
      Plug 'wesQ3/vim-windowswap'
      " Rainbow brackets
      Plug 'luochen1990/rainbow'
      " Smooth scroll
      Plug 'psliwka/vim-smoothie'
      " Dev icons
      Plug 'ryanoasis/vim-devicons'

    endif
      
call plug#end()

