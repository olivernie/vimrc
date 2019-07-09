" Switch between window splits using big J or K and expand the split to its 
" full size. 
" 
" Move vertically to the window through the horizontal splits... 
map <C-j> <C-w>j<C-w>_ 
map <C-k> <C-w>k<C-w>_ 

" Move horizontally to the window through the vertical splits... 
map <C-h> <C-w>h<C-w>\| 
map <C-l> <C-w>l<C-w>\| 

" Make all windows equal size
map <C-=> <c-w>=

" Mover current window up/down
noremap <C-Up>   <C-w>k<C-w>x<C-W>_
noremap <C-Down> <C-w>x<C-w>j<C-w>_

set hlsearch
set nu
set autoindent
set cin
set shiftwidth=4
set tabstop=4
set expandtab
set tw=124

" nocompatible to old vi
set nocp

" show the full path in the status line
set statusline+=%F
set laststatus=2

" search parent directories until finding a tags file
set tags=tags;/

filetype plugin on
filetype indent on

colorscheme torte

set sc

" load cscope database
" cs add /home/onie/development/exe/cscope.out

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Monospace\ 8
    endif
endif

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    let isfirst = 1
    let words = []
    for word in split(a:cmdline)
        if isfirst
            let isfirst = 0  " don't change first word (shell command)
        else
            if word[0] =~ '\v[%#<]'
                let word = expand(word)
            endif
            let word = shellescape(word, 1)
        endif
        call add(words, word)
    endfor
    let expanded_cmdline = join(words)
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1, 'You entered:  ' . a:cmdline)
    call setline(2, 'Expanded to:  ' . expanded_cmdline)
    call append(line('$'), substitute(getline(2), '.', '=', 'g'))
    silent execute '$read !'. expanded_cmdline
    1
endfunction

" command G to search current window buffer and output to a new window
command! -nargs=? G let @a='g/<args>/' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

" command Cgrep to search current dir to look for regexp in C/C++ files.
command! -nargs=? Cgrep call s:cgrep(<q-args>)
function! s:cgrep(...)
    if empty(a:1)
        " get text from search register
        " remove leading '\<' and ending '\>'
        let a:cmdline = substitute(getreg('/'), '\\<\(.*\)\\>', '\1', 'g')
    else
        let a:cmdline = a:1
    endif
    " echom a:cmdline
    " echom '$read !find -regex .+\.[cChH][chHpP]*|xargs grep -n ' . a:cmdline
    new
    silent execute 'read !find -regex .+\\.[cChH][chHpP]*|xargs grep -n ' . a:cmdline
    1d
endfunction

" command P4grep to search current dir to look for regexp in P4 files.
command! -nargs=? P4grep call s:p4grep(<q-args>)
function! s:p4grep(...)
    if empty(a:1)
        " get text from search register
        " remove leading '\<' and ending '\>'
        let a:arg = substitute(getreg('/'), '\\<\(.*\)\\>', '\1', 'g')
    else
        let a:arg = a:1
    endif
    " echom a:arg
    " echom '$read !find -regex .+\.[cChH][chHpP]*|xargs grep -n ' . a:arg
    new
    silent execute 'read !find -regex .+\\.[pP]4|xargs grep -n ' . a:arg
    1d
endfunction

" command Grep to search current dir to look for regexp in text files.
command! -nargs=? Grep call s:lgrep(<q-args>)
function! s:lgrep(...)
    if empty(a:1)
        " get text from search register
        " remove leading '\<' and ending '\>'
        let a:cmdline = substitute(getreg('/'), '\\<\(.*\)\\>', '\1', 'g')
    else
        let a:cmdline = a:1
    endif
    " echom a:cmdline
    echom '$read !find \( -type f ! -path "*/.svn/*" \)|xargs grep -nI ' . a:cmdline
    new
    silent execute 'read !find \( -type f \! -path "*/.svn/*" \)|xargs grep -nI ' . a:cmdline
    1d
endfunction

" command to search current dir for files
command! -nargs=? Find call s:lfind(<q-args>)
function! s:lfind(...)
    if empty(a:1)
        let a:cmdline = substitute(getreg('/'), '\\<\(.*\)\\>', '\1', 'g')
    else
        let a:cmdline = a:1
    endif
    echom 'read !find \( -type f \! -path "*/.svn/*" \) |grep ' . a:cmdline
    new
    silent execute 'read !find \( -type f \! -path "*/.svn/*" \) |grep ' . a:cmdline
    1d
endfunction

command! -nargs=? Test echom <q-args>

autocmd BufRead svn-commit.tmp,svn-commit.[0-9].tmp set nobackup
autocmd BufRead */merge.extra/*,*/merge.script/* set nobackup|set noswapfile

"toggle paste indent
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"show buffers list and switch to the buffer by given number.
nnoremap <F5> :buffers<CR>:buffer<Space>

"map S to replace the current word with yanked one
"nnoremap S diw"0P


set diffopt+=iwhite
set diffexpr=""


augroup DontExpandTabs
    autocmd!
    autocmd FileType make setlocal noet
augroup END

autocmd BufRead,BufNewFile *.[pP]4 set filetype=p4

