""" This is a reduced vim config, without many of the plugins
if !filereadable(expand("$HOME/.vim/autoload/plug.vim"))
	echo "vim-plug is not installed, installing"
	!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	source $HOME/.vimrc
	echo "Making plugin directory"
	silent !mkdir -p $HOME/.vim/plugged
	echo "Success"
endif

" ####### Plugin setup #######
call plug#begin("~/.vim/plugged")

Plug 'scrooloose/nerdcommenter'

"Visuals
Plug 'itchyny/lightline.vim'

call plug#end()

" ####### General config #######
" set leader to something usable
let mapleader =  ","

" ####### Plugin config #######
" Nerdcommenter
let g:NERDSpaceDelims = 1

" ####### Search stuff #######
set hlsearch
set smartcase
:nnoremap <silent> <C-l> :nohlsearch<CR>:redraw<Bar>:echo<CR>

" ####### Usability for programming #######
set tabstop=2 shiftwidth=2 expandtab
set number

" make and quickfix
nmap <F7> :make<CR>
nmap <silent> ]q :cnext<CR>
nmap <silent> [q :cprevious<CR>
nmap <silent> ]Q :cfirst<CR>
nmap <silent> ]Q :clast<CR>

" ####### Visuals #######
" set termguicolors
let g:lightline = {'colorscheme' : 'ayu_mirage'}

" ####### Special filetypes ######
autocmd BufNewFile,BufRead *.cls set syntax=tex
