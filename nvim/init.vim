" Bootstrap vim-plug
if !filereadable(expand("$HOME/.local/share/nvim/site/autoload/plug.vim"))
  echo "vim-plug is not installed, installing"
  !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  source $HOME/.local/share/nvim/site/autoload/plug.vim
  echo "creating plugin directory"
  silent !mkdir -p $HOME/.local/share/nvim/plugins
  echo "Success"
endif

" ####### Plugin setup #######
call plug#begin("~/.local/share/nvim/plugins")

Plug 'junegunn/fzf'
Plug 'scrooloose/nerdcommenter'

"Visuals
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Distraction free
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Use deoplete.
let g:deoplete#enable_at_startup = 0

" Deoplete completions

" Snippets
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'

" Git
Plug 'tpope/vim-fugitive'

call plug#end()

" ####### General config #######
" set leader to something usable
let mapleader =  "," 

" ####### Plugin config #######
" FZF
:nnoremap <silent> <Leader>f :FZF<CR>

" Nerdcommenter
let g:NERDSpaceDelims = 1

" ####### Search stuff #######
set hlsearch
set smartcase
:nnoremap <silent> <C-l> :nohlsearch<CR>:redraw<Bar>:echo<CR>

" ####### Usability for programming #######
set tabstop=2 shiftwidth=2 expandtab
set mouse=a
set number
nmap <silent> <Leader>g :Git<CR>

" make and quickfix
nmap <F7> :make<CR>
nmap <silent> ]q :cnext<CR>
nmap <silent> [q :cprevious<CR>
nmap <silent> ]Q :cfirst<CR>
nmap <silent> ]Q :clast<CR>

" ####### Visuals #######
" let's be honest, this should be done by the terminal
let g:airline_theme='monochrome'

" ####### Distraction Free #######
:nnoremap <silent> <Leader>z :Goyo 100x90%<CR>
" autocmd VimEnter * Goyo 100x90%"
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" ####### Snippets #######
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" ####### Special filetypes ######
autocmd BufNewFile,BufRead *.cls set syntax=tex

" ####### Various neat little things ######
" spawn terminal
:nnoremap <silent> <Leader>t :!termite -d `pwd` 2>/dev/null &<CR><CR>

" Conceal markers.
if has('conceal')
  set conceallevel=2
  " set concealcursor=nv
endif
