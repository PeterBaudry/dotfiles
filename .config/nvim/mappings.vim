" Leader key
let mapleader=" "
nnoremap <Space> <Nop>
  
if exists('g:vscode')

  " Simulate same TAB behavior in VSCode
  nmap <Tab> :Tabnext<CR>
  nmap <S-Tab> :Tabprev<CR>

else

  " Splits

  " Better navigation
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Resize splits
  nnoremap <silent> <C-Up>    :resize -3<CR>
  nnoremap <silent> <C-Down>  :resize +3<CR>
  nnoremap <silent> <C-Left>  :vertical resize -3<CR>
  nnoremap <silent> <C-Right> :vertical resize +3<CR>

  " Buffers

  " TAB in general mode will move to text buffer
  nnoremap <silent> <TAB> :bnext<CR>
  " SHIFT-TAB will go back
  nnoremap <silent> <S-TAB> :bprevious<CR>

  " Allows for quick closing of buffers or quitting
  nnoremap <silent> <C-Q> :q<CR>

  " Editing

  " Better indenting
  vnoremap < <gv
  vnoremap > >gv

  " Easy escape from input
  inoremap jk <Esc>
  inoremap kj <Esc>

  " Clear highlighing
  nnoremap <silent> <CR> :noh<CR>

  " Move lines up and down
  nnoremap <silent> <A-j> :m .+1<CR>==
  nnoremap <silent> <A-k> :m .-2<CR>==
  inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
  inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
  vnoremap <silent> <A-k> :m '<-2<CR>gv=gv

  " Alternate way to save
  nnoremap <silent> <C-s> :w<CR>
  " Return to normal mode on save
  inoremap <silent> <C-s> <Esc>:w<CR>

  " Alternate way to save
  nnoremap <silent> <S-s> :wa<CR>

  " Use control-c instead of escape
  nnoremap <silent> <C-c> <Esc>
  " <TAB>: completion.
  inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

  " Terminal


endif

