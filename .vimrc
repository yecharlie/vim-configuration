set guifont=Consolas:h18:cANSI:qDRAFT

set number

set enc=utf8

" len tab -> 4 spaces
set ts=4

" tab is represented by spaces
set expandtab

set autoindent

" len indention
set shiftwidth=4

set backspace=indent,eol,start

" len backspace
set softtabstop=4

" ctags setting
" Alt+] - Open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" Ctrl+\ - Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Automatically search tags file upwards
set tags=./tags;/

" input method configuration, conveniently typing non-lation in inert mode
set noimdisable
autocmd InsertLeave * set imdisable|set iminsert=0
autocmd InsertEnter * set noimdisable|set iminsert=2

" tab shortcuts: With the following mappings (which require gvim), you can press Ctrl-Left or Ctrl-Right to go to the previous or next tabs, and can press Alt-Left or Alt-Right to move the current tab to the left or right. 
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" vundle configuration
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
"
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
"
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
"
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
Plugin 'AutoClose'
Plugin 'Solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'lervag/vimtex'
Plugin 'VimCompletesMe'
Plugin 'nine2/vim-copyright'
 

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

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic takes mannual mode
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }


" Solarized theme settings
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

" SumatraPDF is a pdf viewer on windows, it must be installed and could be
" accessed directly before it could preview outputs of the latexmk. 
let g:vimtex_view_general_viewer = "SumatraPDF.exe"
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" disable conceal mode in Tex
let g:tex_conceal=""

" vintex interprets .tex as latex"
let g:tex_flavor = 'latex'

" map shift-tab to tab in insert mode as tab is occupied for auto-complete
let g:vcm_s_tab_behavior = 0

" vim-copyright
let g:file_copyright_name = "叶天奇"
let g:file_copyright_email = $MAIL
let g:file_copyright_auto_update = 1 " update when save file
