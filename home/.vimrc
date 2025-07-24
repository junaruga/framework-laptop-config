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
" Comment out as it shows an error.
" set fenc=utf-8
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
" Ignore the indent check E003 to use the 2 spaces indent.
autocmd FileType sh :nnoremap <Space>2 <Esc>:!bashate --ignore E003 % && echo "Bashate OK"<CR>
autocmd FileType sh :nnoremap <Space>3 <Esc>:!shellcheck % && echo "Shellcheck OK"<CR>

" C
" Followin the Ruby project's style.
" https://bugs.ruby-lang.org/projects/ruby/wiki/DeveloperHowto
autocmd FileType c set tabstop=8 shiftwidth=4 expandtab cinoptions=:2,=2,l1
autocmd FileType yacc set tabstop=8 shiftwidth=4 expandtab

" Ruby
" https://bugs.ruby-lang.org/projects/ruby/wiki/DeveloperHowto
autocmd FileType ruby set nowrap tabstop=8 textwidth=0 shiftwidth=2 expandtab
autocmd FileType ruby :nnoremap <Space>1 <Esc>:!ruby -cW %<CR>
autocmd FileType ruby :nnoremap <Space>2 <Esc>:!rubocop %<CR>
autocmd FileType ruby :nnoremap <Space>3 <Esc>:!ruby %<CR>

" Python
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
autocmd FileType python :nnoremap <Space>1 <Esc>:!python3  -m py_compile % && echo "Python Syntax OK"<CR>
autocmd FileType python :nnoremap <Space>2 <Esc>:!flake8 % && echo "Flake8 OK"<CR>
autocmd FileType python :nnoremap <Space>3 <Esc>:!python3 %<CR>

" Perl
autocmd FileType perl set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
autocmd FileType perl :nnoremap <Space>1 <Esc>:!perl -cw %<CR>
autocmd FileType perl :nnoremap <Space>2 <Esc>:!perlcritic %<CR>
autocmd FileType perl :nnoremap <Space>3 <Esc>:!perl %<CR>

" Scala
autocmd FileType scala set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2

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
" Help
nnoremap <Space>H <Esc>:help quickref<CR>

" Basic
" Another Esc key in the use of the external keyboard.
inoremap <C-a> <Esc>
vnoremap <C-a> <Esc>
" Bash like return key.
inoremap <C-j> <CR>
" Another Tab key
inoremap <C-z> <Tab>
" Expand to the current absolute path.
cnoremap %% <C-r>=expand('%:p:h').'/'<CR>
" Move considering wrapped lines.
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" Move the first character of the line.
nnoremap <Space>^ <Home>
" Scroll
" https://stackoverflow.com/questions/3458689
" Moves cursor & screen down.
nnoremap <C-j> 5j
nnoremap <C-u> 10j
" Moves cursor & screen up.
nnoremap <C-k> 5k
nnoremap <C-i> 10k

" Open file to edit.
nnoremap <Space>e <Esc>:e ~/
" ctags: step in.
nnoremap <C-]> g<C-]>

" Windows
" Horizontal split.
nnoremap <Space>s <C-w>s
" Virtical split.
nnoremap <Space>v <C-w>v
" Move windows.
nnoremap <Space>j <C-w>j
nnoremap <Space>k <C-w>k
nnoremap <Space>h <C-w>h
nnoremap <Space>l <C-w>l
" Rotate window.
nnoremap <Space>r <C-w>r
" Resize window.
nnoremap <Space>= <C-w>=
nnoremap <Space>+ <C-w>+
nnoremap <Space>- <C-w>-

" Tab
" Create new tab.
nnoremap <Space>t :tabnew<CR>
" Move to the left tab.
nnoremap <Space><S-Tab> gT<CR>
nnoremap <Space>n gT<CR>
" Move to the right tab.
nnoremap <Space><Tab> gt<CR>
nnoremap <Space>m gt<CR>
" Move the tab position to the left.
nnoremap <Space>N :tabm -1<CR>
" Move the tab position to the right.
nnoremap <Space>M :tabm +1<CR>

" Buffer
" List buffers.
nnoremap <Space>L :ls<CR>
" Move to buffer <N>.
nnoremap <Space>G :bu 
" Move to previous buffer.
nnoremap <Space>K :bN<CR>
" Move to next buffer.
nnoremap <Space>J :bn<CR>
" Delete the current buffer<CR>
nnoremap <Space>D :bd<CR>

" Others
" Turn on/off the line numbers.
nnoremap <Space>< :set nonu<CR>
nnoremap <Space>> :set nu<CR>
" Spell checking
nnoremap <Space>o :set spell spelllang=en_us<CR>
nnoremap <Space>O :set nospell<CR>
nnoremap <Space>p :set nospell<CR>
" View ANSI color code.
" https://stackoverflow.com/a/10592852/11926905
" https://www.vim.org/scripts/script.php?script_id=302
nnoremap <Space>c :AnsiEsc<CR>
" Reload (source) .vimrc
nnoremap <Space>C :so $MYVIMRC<CR>
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
