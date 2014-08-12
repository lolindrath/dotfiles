" We don't want vi compatibility
set nocompatible

" Vundle ********************************************************************
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

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

" Backup *********************************************************************
set nobackup
set nowritebackup
set noswapfile

" Tab Navigation *************************************************************
map <C-l> :bn<CR>
map <C-h> :bp<CR>

nmap <tab> :bn<CR>
nmap <s-tab> :bp<CR>

" File Navigation  ***********************************************************
" set %% to whatever the current directory is
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>e :edit %%
map <leader>v :view %%

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

" Python Options
autocmd filetype python set expandtab

" GUI options *****************************************************************
if has('gui_running')
    set encoding=utf-8
    if has('gui_gtk2')
        "set guifont=Droid\ Sans\ Mono\ 12
        set guifont=Source\ Code\ Pro\ for\ Powerline\ 12
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

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

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

" ctrlp.vim
set wildignore+=*/tmp/*,*/public/assets/*,*/vendor/bundle/*,*/node_modules/*

" jump to last position used in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

