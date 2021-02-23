" enable tabline
let g:airline#extensions#tabline#enabled = 1

" enable powerline fonts
let g:airline_powerline_fonts = 1

" Switch to your current theme
let g:airline_theme = 'onedark'

" Show only the file name
let g:airline#extensions#tabline#fnamemod = ':t'


" let g:airline_extensions = ['branch', 'coc']
let g:webdevicons_enable_airline = 1

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
let g:airline_section_c = airline#section#create([''])
let g:airline_section_y = ''
