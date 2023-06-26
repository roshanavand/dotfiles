call plug#begin()
" VIMPlug itself
Plug 'junegunn/vim-plug'

" LSP and Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-git'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-copilot'
Plug 'github/copilot.vim'

" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

" Some good tpope stuff
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-dispatch'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'junegunn/vim-github-dashboard'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-test/vim-test'
Plug 'mbbill/undotree'
Plug 'folke/which-key.nvim'
Plug 'voldikss/vim-floaterm'

Plug 'preservim/nerdtree' |
  \ Plug 'Xuyuanp/nerdtree-git-plugin' |
  \ Plug 'ryanoasis/vim-devicons'

" Themes
Plug 'jnurmine/Zenburn'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

lua require('nvim_cmp')
lua require('supertab_like_mapping')
lua require('which-key').setup {}

let g:github_dashboard = { 'username': $GITHUB_USER, 'password': $GITHUB_TOKEN }

" Appearance
colorscheme zenburn

" Mappings
let g:mapleader = "\<Space>"

nmap <Leader>sv :source $MYVIMRC<CR>
nmap <Leader>u :UndotreeToggle<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nmap <Leader>ft :NERDTreeToggle<CR>
nmap <Leader>ff :NERDTreeFind<CR>

"" Remove trailing whitespaces
nnoremap <silent> <Leader>rtw :%s/\s\+$//e<CR>
"" Delete till next line, join the line with the one below
nnoremap <Leader>dtnl <End>a<Del><Esc><Right>dw

"" Vim test configuration
let test#strategy = "dispatch"
let test#ruby#use_spring_binstub = 1

nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>tl :TestLast<CR>
nnoremap <Leader>tn :TestNearest<CR>
nnoremap <Leader>ts :TestSuite<CR>
nnoremap <Leader>tv :TestVisit<CR>

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1
let g:Powerline_symbols='fancy'

" FZF configuration
nmap <leader>fs :FZF<CR>
"" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

"" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

"" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

"" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

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
  set statusline+=%*
endif

" Clipboard Copypasta
vmap <Leader>y :!xclip -f -sel clip<CR>
map <Leader>p :r!xclip -o -sel clip<CR>

" Floaterm
let g:floaterm_keymap_toggle = '<Leader>ter'
let g:floaterm_keymap_kill = '<Leader>terq'
let g:floaterm_wintype = 'split'
let g:floaterm_height = 12

sign define LspDiagnosticsSignError text=🔴
sign define LspDiagnosticsSignWarning text=🟠
sign define LspDiagnosticsSignInformation text=🔵
sign define LspDiagnosticsSignHint text=🟢

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ 'Modified'  :'✹',
  \ 'Staged'    :'✚',
  \ 'Untracked' :'✭',
  \ 'Renamed'   :'➜',
  \ 'Unmerged'  :'═',
  \ 'Deleted'   :'✖',
  \ 'Dirty'     :'✗',
  \ 'Ignored'   :'☒',
  \ 'Clean'     :'✔︎',
  \ 'Unknown'   :'?',
  \ }
