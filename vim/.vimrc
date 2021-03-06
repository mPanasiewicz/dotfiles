" Need to call on initially to support git

filetype on
filetype off
set nocompatible

" Vundle initialization
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()


" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-speeddating'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'benmills/vimux.git'
Bundle 'editorconfig/editorconfig-vim'
" git: git://github.com/garbas/vim-snipmate.git
" vim-addon-mw-utils: #needed for snipmate
" git: git://github.com/MarcWeber/vim-addon-mw-utils.git
" tlib: #needed for snipmate
" git: git://github.com/tomtom/tlib_vim.git
" git: git://github.com/nelstrom/gundo.vim.git
" git: https://github.com/lukaszkorecki/CoffeeTags.git

Bundle 'wincent/terminus'
" Bundle 'git://git.wincent.com/command-t.git'
" Bundle 'elixir-lang/vim-elixir'

Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'kchmck/vim-coffee-script'

" Nerdtree plugin
Bundle 'scrooloose/nerdTree'
Bundle 'Xuyuanp/nerdtree-git-plugin'

Bundle 'junegunn/vim-easy-align'
Bundle 'corntrace/bufexplorer'
Bundle 'Raimondi/delimitMate'
" Bundle 'powerline/powerline'
Bundle 'bling/vim-airline'
" Bundle 'itchyny/lightline.vim'
Bundle 'airblade/vim-rooter'
Bundle 'scrooloose/syntastic'
Bundle 'yaifa.vim'
Bundle 'matchit.zip'
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rking/ag.vim'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'techlivezheng/vim-plugin-minibufexpl'
Bundle 'taglist.vim'

" Syntax plugins
Bundle 'elzr/vim-json'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'slim-template/vim-slim.git'

Bundle 'hail2u/vim-css3-syntax'
Bundle 'othree/html5-syntax.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'jiangmiao/simple-javascript-indenter'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'jQuery'
Bundle 'groenewege/vim-less'
Bundle 'fatih/vim-go'

call vundle#end()

" Enable syntax
syntax enable
" syntax on

filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
" map . in visual mode
vnoremap . :norm.<cr>

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>

map - ddp
map _ ddkP
" vmap - dp
" vmap - dkP

" Ensure vim uses bash
set shell=/bin/bash

" Some kind of security thing
set modelines=0

" Set the default font
set guifont=Meslo\ LG\ S\ for\ Powerline:h12
let g:airline_powerline_fonts = 1
" set guifont=Monaco:h12

" Automatically reload on file changes
set autoread
set autowrite

" Automatically attempt to handle indentation
set autoindent
set si

" Set our mapleader key
let mapleader = ','
let g:mapleader = ","
noremap \ ,

" Automatically attempt to set the working directory to the current
" file. This value will be superceeded by rooter if it is installed
set autochdir

" Display the current mode at the bottom of the window
set showmode

" Extra information about the command you're running in the status bar
set showcmd
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
set ttimeoutlen=50        " Make Esc work faster"

" Auto complete filenames when in :Ex mode, etc
set wildmenu
" set wildmenu=full
set wildmode=list:longest

set visualbell
set cursorline " highlight current line
set ttyfast

" For regular expressions turn magic on
set magic

" Height of the command bar
set cmdheight=2

let g:html_use_css = "1"
let xml_use_xhtml = 1

set background=dark
set history=700
set hlsearch
" ignore case - ignorowanie wielkosci znakow przy
" przeszukiwaniu tekstu
set ic
set scs
" Smart case searching. Case insensitive if all lowercase, but if you
" provide uppercase it will force matching case
set smartcase
set incsearch

" Visually display matching braces
set showmatch " show bracket matches
" How many tenths of a second to blink when matching brackets
set mat=2

set ruler

" set backspace=2
set backspace=indent,eol,start

" Always show the status line
set laststatus=2
set scrolloff=3

set cindent

" Line number rules
set number
set relativenumber " show relative line numbers

" Tab rules
set expandtab
set smarttab " Be smart when using tabs ;)

set tabstop=2
set shiftwidth=2
set softtabstop=2

set cm=blowfish
set textwidth=90
set formatoptions=qrn1

set colorcolumn=90
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

set foldmethod=marker
set foldlevelstart=0
colo railscasts

" Set the default encoding to the always trusty UTF-8
set encoding=utf-8

" Switching between buffers using Ctrl+Tab
nnoremap <c-Tab> :bnext<CR>
nnoremap <c-S-Tab> :bprevious<CR>
" Switching between tabs using Shift+Tab
nnoremap <Tab> :tabn<CR>
nnoremap <S-Tab> :tabp<CR>
nnoremap Y y$

" Searching using Ctrl+P
map <leader>o :CtrlPMixed<CR>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <leader>b :TagbarToggle<CR>
map <leader>e :MBEOpen<cr>
map <leader>c :MBEClose<cr>
map <leader>t :MBEToggle<cr>
map <leader>f :MBEFocus<cr>
noremap <C-TAB>   :MBEbf<CR>
noremap <C-S-TAB> :MBEbb<CR>
" nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" nnoremap <leader>sv :source $MYVIMRC<cr>

" Disable highlight when <leader>, is pressed
map <silent> <leader>, :noh<cr>
" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Turn ON/OFF NERDTree
map <leader>n :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


" Do syntax check when the buffer is first loaded
let g:syntastic_check_on_open=0
let g:syntastic_disabled_filetypes=['m.html']
let g:syntastic_html_checkers=['']
" let g:syntastic_html_tidy_ignore_errors = [
"     \  'plain text isn''t allowed in <head> elements',
"     \  '<base> escaping malformed URI reference',
"     \  'discarding unexpected <body>',
"     \  '<script> escaping malformed URI reference',
"     \  'content occurs after end of body',
"     \  '</head> isn''t allowed in <body> elements'
"     \ ]

" Don't overindent javascript
let g:SimpleJsIndenter_BriefMode=1

" Hide .DS_Store and .git directories from Vim
let g:netrw_list_hide='.DS_Store,^\.git/$'

" Start neocompletecache automatically
let g:neocomplcache_enable_at_startup = 1

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" rabl files
au BufRead,BufNewFile *.rabl setf ruby

" Every time the user issues a :w command, Vim will automatically remove all trailing whitespace before saving.
autocmd BufWritePre * :%s/\s\+$//e

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
" map <leader>cc :botright cope<cr>
" map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The Silver Searcher
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if executable('ag')
  " Searching using Ag
  map <leader>a :Ag!<space>
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  set wildignore=*.so,*.swp,*.zip
  set wildignore+=*.o,*.obj,*~ "stuff to ignore when tab completing
  set wildignore+=*vim/backups*
  set wildignore+=*sass-cache*
  set wildignore+=*DS_Store*
  set wildignore+=vendor/rails/**
  set wildignore+=vendor/cache/**
  set wildignore+=*.gem
  set wildignore+=log/**
  set wildignore+=tmp/**
  set wildignore+=*.png,*.jpg,*.gif

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  let g:ctrlp_max_height = 30
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_match_window_reversed = 0
  let g:ag_working_path_mode = "r"
  " search for word under the cursor
  nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>
endif

" SOme symbols for git status in NERD tree
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('rake', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('rb', 'Red', 'none', '#e31132', '#151515')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coffeescript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
"autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
let coffee = '/usr/local/bin/coffee'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


" rename current file, via Gary Bernhardt
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""
"My inserts Maciej
""""""""""""""""""""""""""""""""""""""""""""
ab mail_ maciej.panasiewicz@mfind.pl
ab bp§ binding.pry # FIXME
map - ddp
map _ ddkP
let g:airline_powerline_fonts = 1
set completeopt-=preview
map <leader>n :call RenameFile()<cr>
" let g:exvim_custom_path='~/exvim/'
" source ~/exvim/.vimrc
