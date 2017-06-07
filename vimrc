" Stay improved!
set nocompatible

" Setup Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-commentary'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/Colour-Sampler-Pack'

" All the plugins must be added before this line
call vundle#end()

" Enable syntax and plugins
syntax on
filetype plugin indent on

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Indentation
" Automatically indent braces
set cindent
" Indent two spaces
set shiftwidth=2
" Keep vim from converting eight spaces to tabs
set expandtab

" Look and feel
set background=dark
set nu
set relativenumber
set wildmenu
set wildmode=list:longest,full
set whichwrap=b,s,h,l,<,>,[,]
set autoread
set ruler
set hlsearch
set incsearch
set mouse=a
set mousehide
set colorcolumn=80
highlight clear SignColumn
highlight clear LineNr
colorscheme molokai
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ Regular\ 16
set encoding=utf-8
set termencoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1

" Status line settings
if has('statusline')
  set laststatus=2

  " Broken down into easily includeable segments
  set statusline=%<%f\                     " Filename
  set statusline+=%w%h%m%r                 " Options
  set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " Filetype
  set statusline+=\ [%{getcwd()}]          " Current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
endif

" Vim Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Commands
" Create the `tags` file
command! MakeTags !ctags -R .

" Mappings
" Change mapleader to ,
let mapleader=","

" Toggle NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Syntastic mappings
nnoremap <C-s> :SyntasticCheck<CR>
nnoremap <C-y> :SyntasticToggleMode<CR>

" RSpec.vim mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>
"nnoremap <Leader>au :call RunAllEveryPaySpecs()<CR>
let g:rspec_command = "Dispatch !rbenv exec bundle exec rspec --format documentation {spec}"

" Use custom symbols with nerdtree git plugin
" Copied from https://github.com/Xuyuanp/nerdtree-git-plugin

let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
      \ }

" Editing shortcuts
" Remove trailing whitespaces
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
" Fix mixed indentation
nnoremap <Leader>fmi gg=G
