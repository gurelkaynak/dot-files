syntax on
set bg=light
map <c-T> :tabnew<CR>

map <TAB><TAB> :tabnext<CR>
map <s-TAB><s-TAB> :tabprev<CR>

set visualbell				" Silence the bell, use a flash instead
set cinoptions=:.5s,>1s,p0,t0,(0,g2	
					":.5s = indent case statements 1/2 shiftwidth
					" >1s = indent 1 shiftwidth
					" p0  = indent function definitions 0 spaces
					" t0  = indent function return type 0 spaces
					" (0  = indent from unclosed parantheses
					" g2  = indent C++ scope resolution 2 spaces

set cinwords=if,else,while,do,for,switch,case	" Which keywords should indent 
set formatoptions=tcqor	" t=text, c=comments, q=format with "gq", o,r=autoinsert comment leader
set cindent		" indent on cinwords
set background=light 	" set background to dark
set showcmd			" Show (partial) command in status line.
set autowrite		" Automatically save before commands like :next and :make
set textwidth=120	" My terminal is 120 characters wide

set number			" Line numbers
set numberwidth=5	" Line numbers width

"set paste			" Copy-Paste from GUI
set nopaste			"For supertab

set tags=~/.vim/mytags/activtyfm

"php folding

"map <F5> <Esc>:EnableFastPHPFolds<Cr>
"map <F6> <Esc>:EnablePHPFolds<Cr>
"map <F7> <Esc>:DisablePHPFolds<Cr> 


set title
set history=5000

set shiftwidth=4	" set shiftwidth to 4 spaces
set tabstop=4		" set tab to 4 spaces
set backspace=start,indent,eol
set softtabstop=4
set smarttab
set expandtab 

set smartindent

set showmatch		" Show matching brackets/braces/parantheses.
set hlsearch
set incsearch
set ignorecase
set smartcase 

set mouse=r
"set mousehide

" display date-time in ruler
set ruler
"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

set laststatus=2
set statusline =%<buf:[%n]\ %f\ %h%m%r " buffer, filename, flags
set statusline+=\ \ [
set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=,%{&encoding} " encoding
set statusline+=,%{&fileformat} " file format
set statusline+=]\ "
set statusline+=%=
set statusline+=asc:[%3.(%b%)\ %4.(0x%B%)] " current char
set statusline+=%(tag:[%{Tlist_Get_Tagname_By_Line()}]%)
set statusline+=\ col/lin:[%3.(%c%)\ %-7.(%l/%L%)]\ %P
"set statusline+=\ [%3.(%c%)\ %-7.(%l/%L%)]\ %P
if filereadable(expand("~/.vim/plugin/vimbuddy.vim"))
    set statusline+=\ %{VimBuddy()} " vim buddy
endif

" hilight matching parentesis
set sm

" colors
"hi Normal	guibg=White guifg=Black
"hi Comment	term=bold ctermfg=DarkBlue gui=NONE guibg=White guifg=DarkBlue
"hi Constant	term=bold ctermfg=Blue gui=bold guibg=White guifg=Blue
"hi Statement	term=bold ctermfg=DarkRed gui=bold guibg=White guifg=DarkRed
"hi Type		term=bold ctermfg=DarkRed gui=bold guibg=White guifg=DarkRed
"hi PreProc	term=NONE ctermfg=Magenta gui=bold guibg=White guifg=Magenta
"hi Error	term=reverse ctermbg=DarkRed gui=italic guibg=Red guifg=White
"hi String	term=bold ctermfg=DarkGreen gui=bold guibg=White guifg=DarkGreen
"hi Visual	term=reverse ctermfg=DarkBlue gui=bold guibg=Blue guifg=White
"hi Cursor	term=NONE gui=NONE guibg=Green guifg=Black

" folding
set fen
set fdm=marker

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#CompleteRuby

" NerdTree
map <leader>d :NERDTreeToggle <CR> " Dir tree
let NERDTreeCaseSensitiveSort = 1
let NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.[ao]$','\.swp$','\.DS_Store','\.svn','\.CVS','\.git']
let NERDTreeMouseMode = 2
let NERDTreeShowLineNumbers = 0
let NERDTreeWinSize = 25
noremap <F9> :NERDTree<CR>
noremap <s-F9> :NERDTreeClose<CR>

"Mini Buf Explorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
"let MiniBufExplorer

" taglist
" TagList configuration
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 25
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
nnoremap <silent><F8> :Tlist<CR>
nnoremap <silent><F7> :w<CR>:TlistUpdate<CR>

"let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
"let Tlist_File_Fold_Auto_Close = 1
"let Tlist_Show_Menu = 1
"map <leader>t :TlistToggle <CR>
"map <leader>ts :TlistSessionSave ~/.tlistsession.vim.tag <CR>
"map <leader>tl :TlistSessionLoad ~/.tlistsession.vim.tag <CR>

"PHPDocumantory
"source ~/.vim/php-doc.vim
map <F2> :call PhpDocClass()<CR>
map <F3> :call PhpDocFunc()<CR>
map <F4> :call PhpDocType()<CR>

" run file with PHP CLI (CTRL-M)
"autocmd FileType php noremap <C-T> :w!<CR>:!/usr/bin/phpcs %<CR>

" run file with PHP CLI (CTRL-M)
"autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>

" PHP parser check (CTRL-L)
"autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>

"map <F2> :execute Clean_up()<CR> :source $HOME/.vimrc<CR>
"map <F3> gg:execute License_notice("c_gpl_notice")<CR>dd18jO<ESC>
"map <F4> ofor($i;; $i++) {<ESC>o}<ESC>kI<ESC>f;a<SPACE>
"map! <F4> for($i;; $i++) {<ESC>o}<ESC>kI<ESC>f;a<SPACE>
"map <F5> oforeach($array as $index=>$value) {<ESC>o}<ESC>kI<ESC>f$l
"map! <F5> foreach($array as $index=>$value) {<ESC>o}<ESC>kI<ESC>f$l
"map <F6> owhile() {<ESC>o}<ESC>kI<ESC>f(a
"map! <F6> while() {<ESC>o}<ESC>kI<ESC>f(a
"map <F7> oif() {<ESC>o}<ESC>kf(a
"map! <F7> if() {<ESC>o}<ESC>kf(a
"map <F8> oswitch() {<ESC>ocase:<CR>break;<CR>case:<CR>break;<CR>default:<CR>}<ESC>6kf(a
"map! <F8> switch() {<ESC>ocase:<CR>break;<CR>case:<CR>break;<CR>default:<CR>}<ESC>6kf(a


:function! License_notice(file_name)
: let path_file_name = g:VIM_CUSTOM . a:file_name
:	:execute 'r ' . path_file_name
:endfunction

" Cleanup
":function! Clean_up()
":	set visualbell&
":	set cinoptions&
":	set cinwords&
":	set formatoptions&
":	set cindent&	
":	set shiftwidth&
":	set tabstop&
":	set showmatch&
":	set background&
":	set showcmd&
":	set autowrite&
":	set textwidth&
":	unmap <F3>
":	unmap! <F3>
":	unmap <F4>
":	unmap! <F4>
":	unmap <F5>
":	unmap! <F5>
":	unmap <F6>
":	unmap! <F6>
":	unmap <F7>
":	unmap! <F7>
":	unmap <F8>
":	unmap! <F8>
":endfunction

" Some cscope specific settings
if has("cscope")
    " Some scsope specific settings
    set cscopequickfix=s-,c-,d-,i-,t-,e-
 
    " always use cscope instead of tags
    set cst
 
    " path to cscope
    set csprg=/usr/bin/cscope
 
    " search databased before searching tag files
    set cscopetagorder=0
 
    " don\'t display cscope messages when adding database
    set nocsverb
 
    " add any database in current directory
    if filereadable(".cscope.out")
        cs add .cscope.out
        " else search up a few directories
    elseif filereadable("../.cscope.out")
        cs add ../.cscope.out
    elseif filereadable("../../.cscope.out")
        cs add ../../.cscope.out
    elseif filereadable("../../../.cscope.out")
        cs add ../../../.cscope.out
    elseif filereadable("../../../../.cscope.out")
        cs add ../../../../.cscope.out
    elseif filereadable("../../../../../.cscope.out")
        cs add ../../../../../.cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
 "       cs add \$CSCOPE_DB
    endif
 
    " reset cscope verbosity
    set csverb
 
    " easily reload cscope database
    nmap <F11> :cs reset<cr>
endif

