" We don't want vi compatibility
set nocompatible

" Vundle ********************************************************************
filetype off " required by Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Vundles

" Help for commenting in/out code
Bundle 'scrooloose/nerdcommenter'
" File tree view
Bundle 'scrooloose/nerdtree'
" Markdown syntax highlighting
Bundle 'tpope/vim-markdown'
" Match if/elses
Bundle 'vim-scripts/matchit.zip'
" Gives you easy fuzzy matching file finding
Bundle 'kien/ctrlp.vim'
" Puts git diff in gutter
Bundle 'airblade/vim-gitgutter'
" Lightweight status line
Bundle 'bling/vim-airline'
set lazyredraw "Required by vim-airline
set laststatus=2 " force airline to show
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" Solarized Color scheme
Bundle 'altercation/vim-colors-solarized'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-bufferline'
Bundle 'kien/rainbow_parentheses.vim'

filetype plugin indent on

" Tabs ***********************************************************************
set tabstop=4
set softtabstop=4
set shiftwidth=4

set showmode
set showcmd
set hidden " allow modified buffers to go into the background instead of needing to write out them immediately
set visualbell " no beeps! only a flash
set backspace=indent,eol,start " make backspace work more intuitively
syntax on

" bash-like file name completion - shows you completion options **************
set wildmenu
set wildmode=list:longest

" Tab Navigation *************************************************************
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-t> :tabnew<CR>

nmap <tab> :tabn<CR>
nmap <s-tab> :tabp<CR>

" Customize Colors ***********************************************************
set background=dark
colorscheme solarized

" Searching ******************************************************************
set hlsearch " Highlight all search matches
set incsearch " jump to first match while you type
set ignorecase " ignore case while searching
set smartcase " only search case sensitive if if uppercase is used in search terms

" Window Options *************************************************************
set title " set the title of the terminal to the filename you're editing
set ruler " show the current line,char-num you're at
set showmatch " highlight matching tag when over it

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" File types ****************************************************************
au BufNewFile,BufRead *.pp set syn=ruby
au BufNewFile,BufRead *.gemspec set syn=ruby

" Ruby options **************************************************************
augroup myfiletypes
    autocmd!
    autocmd FileType ruby set ai et sta sw=2 sts=2
augroup END

" GUI options *****************************************************************
if has('gui_running')
    set encoding=utf-8
    if has('gui_gtk2')
        set guifont=Droid\ Sans\ Mono\ 12
    elseif has('mac')
        set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
    else
        set guifont=Droid\ Sans\ Mono\ 12
    endif
    " turn off toolbar and menu
    set guioptions-=T
    set guioptions-=menu
    " colorscheme ir_black
    set background=dark
    colorscheme solarized
end

" rainbow_parentheses.vim
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]
let g:rbpt_max = 15



