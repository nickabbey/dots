" make sure we are in 256 color mode
set t_Co=256
highlight Normal guibg=black guifg=white
if has("unix")
    let s:uname = system("uname")
        if s:uname == "Darwin\n"
            python import sys; sys.path.append("/Users/nickabbey/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim"); sys.path.append("~/Library/Python/2.7/bin")
        else
            python import sys; sys.path.append("/usr/local/lib/python2.7/dist-packages"); sys.path.append("/usr/lib/python2.7/dist-packages")
        endif
endif
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/CycleColor'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/hgrev'
Plugin 'majutsushi/tagbar'
Plugin 'nvie/vim-flake8'
Plugin 'jmcantrell/vim-virtualenv'
" Get the solarized plugin
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
colorscheme elflord
set background=dark

"map undo to ctrl-u in all modes (use ctrl-r for redo)
noremap <C-u> <ESC>:u<CR>
vnoremap <C-u> <ESC>:u<CR>
inoremap <C-u> <ESC>:u<CR>

" for powerline
set guifont=Inconsolata\ for\ Powerline:h14
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=Inconsolata\ for\ Powerline:h14
    endif
endif

"Make NERDTree jump to the path of the file in the current buffer
vnoremap <Leader>. :NERDTreeFind<CR>


"From: https://github.com/mbrochh/vim-as-a-python-ide/blob/master/.vimrc

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" " When you want to paste large blocks of code into vim, press F2 before you
" " paste. At the bottom you should see ``-- INSERT (paste) --``.

" "" set pastetoggle=<F2>
"set clipboard=unnamed

set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" " Rebind <Leader> key
" " I like to have it here becuase it is easier to reach than the default and
" " it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Bind nohl
" " Removes highlight of your last search
" " ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Quick quit command
noremap <C-q> :q<CR>
noremap <C-q>a :qa!<CR>


" bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
" " Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" MYNOTE - I like my elflord scheme I'll stick with it and leave this commented
" Color scheme
"mkdir -p ~/.vim/colors && cd ~/.vim/colors
"wget -O wombat256mod.vim
"http://www.vim.org/scripts/download_script.php?src_id=13400
"set t_Co=256
"color wombat256mod

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

"easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=1000
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
" set nobackup
" set nowritebackup
" set noswapfile

" ============================================================================
" Python IDE Setup
"
" ============================================================================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
" set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
" let g:ctrlp_max_height = 30
" set wildignore+=*.pyc
" set wildignore+=*_build/*
" set wildignore+=*/coverage/*

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#use_tabs_not_buffers = 1
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
     if pumvisible()
         if a:action == 'j'
             return "\<C-N>"
         elseif a:action == 'k'
             return "\<C-P>"
         endif
     endif
     return a:action
 endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim
" http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" easier breakpoints for ipdb
python << EOF
import vim
import re

ipdb_breakpoint = 'import ipdb; ipdb.set_trace()'

def set_breakpoint():
    breakpoint_line = int(vim.eval('line(".")')) - 1

    current_line = vim.current.line
    white_spaces = re.search('^(\s*)', current_line).group(1)

    vim.current.buffer.append(white_spaces + ipdb_breakpoint, breakpoint_line)

vim.command('map <f5> :py set_breakpoint()<cr>')

def remove_breakpoints():
    op = 'g/^.*%s.*/d' % ipdb_breakpoint
    vim.command(op)

vim.command('map <f6> :py remove_breakpoints()<cr>')
EOF
map<F12> :!python %<cr>
