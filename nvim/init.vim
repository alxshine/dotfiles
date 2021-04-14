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

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'

"Visuals
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/rainbow_parentheses.vim'

" Distraction free
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Deoplete completions
" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Git
Plug 'tpope/vim-fugitive'
" Plug 'mhinz/vim-signify'

" Tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" Whitespaces
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

" ####### General config #######
" set leader to something usable
let mapleader =  ","

" ####### Plugin config #######
" FZF
:nnoremap <silent> <Leader>f :Files<CR>
:nnoremap <silent> <Leader>b :Buffers<CR>
:nnoremap <silent> <Leader>r :Rg<CR>

" Nerdcommenter
let g:NERDSpaceDelims = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" rainbow_parentheses
autocmd VimEnter * RainbowParentheses

" ####### Search stuff #######
set hlsearch
set smartcase
:nnoremap <silent> <Leader><space> :nohlsearch<CR>:redraw<Bar>:echo<CR>

" ####### Usability for programming #######
set tabstop=4 shiftwidth=4 expandtab
set mouse=a
set number
nmap <silent> <Leader>g :Git<CR>

" special case for yaml files
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 expandtab

" make and quickfix
nmap <F7> :make<CR>
nmap <silent> ]q :cnext<CR>
nmap <silent> [q :cprevious<CR>
nmap <silent> ]Q :cfirst<CR>
nmap <silent> ]Q :clast<CR>

" ####### Visuals #######
" let's be honest, this should be done by the terminal
let g:airline_theme='monochrome'
" colorscheme base16-horizon-dark
let g:limelight_conceal_ctermfg='darkgray'

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
:nnoremap <silent> <Leader>n :bn<CR>
:nnoremap <silent> <Leader>p :bp<CR>

" Conceal markers.
if has('conceal')
  set conceallevel=2
  " set concealcursor=nv
endif

