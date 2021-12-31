" .vimrc
"
" xterm256 color names
" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim?file=Xterm-color-table.png
" vim colorscheme
" /usr/share/vim/vim82/colors

" Base
filetype plugin indent off
set tabstop=4
set shiftwidth=4
"set expandtab
set showmode
syntax on
set showmatch
set number

" Search
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set incsearch
set nowrapscan
highlight Search ctermfg=Black ctermbg=3

" Spell checking
"set spell spelllang=en_us
" Set spell checking color style.
" https://stackoverflow.com/questions/6008921
highlight SpellBad cterm=underline ctermfg=Yellow ctermbg=NONE
highlight SpellCap cterm=underline ctermfg=Cyan ctermbg=NONE
highlight SpellLocal cterm=underline ctermfg=Cyan ctermbg=NONE
highlight SpellRare cterm=underline ctermfg=Cyan ctermbg=NONE

" Completion
"set wildmenu
set wildmode=list:longest
"set wildmode=longest:full

" Japanese
set termencoding=utf-8
set encoding=japan
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
set fenc=utf-8
set enc=utf-8

" Status line
set laststatus=2
set statusline=[%L]\ %t\ %y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%r%m%=%c:%l/%L

" Comment out the colors settings to prioritize the colors by the terminal.
" colorscheme evening

" Visible multibyte space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" Tailing space
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" Display special sign
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

" To make Mouse work on Alacritty.
" https://wiki.archlinux.org/title/Alacritty#Mouse_not_working_properly_in_Vim
set ttymouse=sgr

" Text
autocmd FileType text set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2
autocmd FileType yaml set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2

" Sh
autocmd FileType sh set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
autocmd FileType sh :nnoremap <Space>1 <Esc>:!sh -n % && echo "Syntax OK"<CR>
autocmd FileType sh :nnoremap <Space>2 <Esc>:!bashate % && echo "Bashate OK"<CR>
autocmd FileType sh :nnoremap <Space>3 <Esc>:!shellcheck % && echo "Shellcheck OK"<CR>

" Perl
autocmd FileType perl set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
autocmd FileType perl :nnoremap <Space>1 <Esc>:!perl -cw %<CR>
autocmd FileType perl :nnoremap <Space>2 <Esc>:!perlcritic %<CR>
autocmd FileType perl :nnoremap <Space>3 <Esc>:!perl %<CR>

" Ruby
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2
autocmd FileType ruby :nnoremap <Space>1 <Esc>:!ruby -cW %<CR>
autocmd FileType ruby :nnoremap <Space>2 <Esc>:!rubocop %<CR>
autocmd FileType ruby :nnoremap <Space>3 <Esc>:!ruby %<CR>

" Python
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
autocmd FileType python :nnoremap <Space>1 <Esc>:!python3  -m py_compile % && echo "Python Syntax OK"<CR>
autocmd FileType python :nnoremap <Space>2 <Esc>:!flake8 % && echo "Flake8 OK"<CR>
autocmd FileType python :nnoremap <Space>3 <Esc>:!python3 %<CR>

" Scala
autocmd FileType scala set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2

" C
" CRuby
" https://bugs.ruby-lang.org/projects/ruby/wiki/DeveloperHowto
autocmd FileType c set tabstop=8|set shiftwidth=4|set noexpandtab
" autocmd FileType yacc set tabstop=8|set shiftwidth=4|set noexpandtab
" autocmd FileType c set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
autocmd FileType yacc set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4

" vimdiff color customize
if &diff
  " colorscheme evening
  " 22: Deep dark green
  highlight DiffAdd cterm=bold ctermfg=NONE ctermbg=22
  highlight DiffDelete cterm=bold ctermfg=NONE ctermbg=22
  highlight DiffChange cterm=bold ctermfg=NONE ctermbg=22
  highlight DiffText cterm=bold ctermfg=NONE ctermbg=DarkMagenta
endif

" Key map
nnoremap <Space>H <Esc>:help quickref<CR>

imap <C-j> <Esc>
imap <F1> <C-v><Tab>
cnoremap %% <C-r>=expand('%:p:h').'/'<CR>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <Space>w <Esc>:w ~/
nnoremap <Space>e <Esc>:e ~/
nnoremap <Space>f <Esc>:find ~/
nnoremap <Space>s <C-w>s
nnoremap <Space>v <C-w>v
nnoremap <Space>j <C-w>j
nnoremap <Space>k <C-w>k
nnoremap <Space>h <C-w>h
nnoremap <Space>l <C-w>l
nnoremap <Space>r <C-w>r
nnoremap = <C-w>=
nnoremap + <C-w>+
nnoremap - <C-w>-
nnoremap <C-]> g<C-]>
nnoremap <Space>n :bn<CR>
nnoremap <Space>p :bN<CR>
nnoremap <Space>L :ls<CR>
nnoremap <Space>N <Esc>:bu 
nnoremap <Space>t :tabnew<CR>
" nnoremap <C-l> gt<CR>
nnoremap <Space><Tab> gt<CR>
" nnoremap <C-h> gT<CR>
nnoremap <Space><S-Tab> gT<CR>
nnoremap <Space>Q :bd<CR>
nnoremap <Space>< :set nonu<CR>
nnoremap <Space>> :set nu<CR>
" Spell checking
nnoremap <Space>i :set spell spelllang=en_us<CR>
nnoremap <Space>o :set nospell<CR>
" ANSI escape
" https://stackoverflow.com/a/10592852/11926905
" https://www.vim.org/scripts/script.php?script_id=302
nnoremap <Space>p :AnsiEsc<CR>
" Reload (source) .vimrc
nnoremap <Space>S :so $MYVIMRC<CR>
nnoremap W <Esc>:w<CR>
" Disable save & quit
nnoremap ZZ <Nop>
" Disable no save & quit
nnoremap ZQ <Nop>
" Disable ex mode
nnoremap Q <Nop>
nnoremap Q <Esc>:q<CR>

" TODO
" Word Completion: Ctrl-P, Ctrl-N

" Function

function SetUU()
  set ff=unix
  set fenc=utf8
endfunction
command -nargs=0 SetUU call SetUU()
