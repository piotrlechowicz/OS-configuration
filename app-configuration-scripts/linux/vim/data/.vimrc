"--- auto indent and size of the tabulator
set autoindent
set tabstop=4

"--- allow to use pastetoggle mode with F2
set pastetoggle=<f2>

"--- show different language syntax
syntax enable

"--- sets line numbering (to remove use "set nonubmer")
set number 

"--- set nice color scheme
colorscheme elflord
"colorscheme proton

"--- additional key bindings
"go to the end and begin of line
imap <silent> <C-e> <End>
imap <C-a> <Home>

"--- grep under the cursor
nnoremap <F3> :grep <C-R><C-W> *<CR>

"--- enter command mode by pressing two times j or ctrl+j
inoremap jj <ESC>
imap <C-j> <ESC>

"--- exit without saving with qw
cmap qw q!

"--- enable mouse
set mouse=a

"--- different color schem for using diff command
if &diff
	colorscheme ron
endif