set nocompatible

" Color scheme customizations {{{
" One color scheme to rule them all!
filetype plugin on
syntax on
colorscheme brogrammer
set colorcolumn=100
" vim tab color settings to make tabs better (and to fit in with tmux colors)
:hi TabLineFill ctermfg=234 ctermbg=234
:hi TabLine ctermfg=7 ctermbg=234
:hi TabLineSel ctermfg=7 ctermbg=32
" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }}}

" Key Remappings{{{
" So that I can move between the extremely long SQL (and other) strings that I write
nnoremap j gj
nnoremap k gk
" Use space for folding
nnoremap <space> za
" Remap jk to escape
inoremap jk <Esc>
" So I can tell why a word is highlighted a particular color
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
" Use tn to create a new tab
ca tn tabnew
" Use sudo to be able to save when I didn't open something as root
ca w!! w !sudo tee %
" Surround anything selected with the given matching quotes, brackets, etc.
map () xi(<Esc>pa)<Esc>
map '' xi'<Esc>pa'<Esc>
map "" xi"<Esc>pa"<Esc>
map [] xi[<Esc>pa]<Esc>
map {} xi{<Esc>pa}<Esc>
" }}}

" Searching {{{
" Incremental search is nice
set incsearch
set hlsearch
set ignorecase
set smartcase
" }}}

" Utilities {{{
" Make switching between files easy!
set wildmenu
" Always show the tab menu (and yes I really do want tabs)
:set showtabline=-1
" }}}

" Line and spacing options {{{
set nu
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
" Highlight the entire line my cursor is on
:set cursorline
" Highlight 80 character line limit
:set colorcolumn=80
" }}}

" Enable Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
" }}}

" Folding for this file {{{
set modelines=1
" }}}

" Custom functions {{{

" Custom tab line (modified from Steven Lu's stackoverflow post
" http://stackoverflow.com/questions/5927952/whats-the-implementation-of-vims-default-tabline-function)
set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
    let s = '' " complete tabline goes here
    " loop through each tab page
    for t in range(tabpagenr('$'))
        " set highlight
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " set the tab page number (for mouse clicks)
        let s .= '%' . (t + 1) . 'T'
        let s .= ' '
        " set page number string
        let s .= t + 1 . ' '
        " get buffer names and statuses
        let n = ''      "temp string for buffer names while we loop and check buftype
        let m = 0       " &modified counter
        let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
        " loop through each buffer in a tab
        for b in tabpagebuflist(t + 1)
            " buffer types: quickfix gets a [Q], help gets [H]{base fname}
            " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
            if getbufvar( b, "&buftype" ) == 'help'
                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
            elseif getbufvar( b, "&buftype" ) == 'quickfix'
                let n .= '[Q]'
            else
                let n .= fnamemodify(bufname(b), ':t')
            endif
            " check and ++ tab's &modified count
            if getbufvar( b, "&modified" )
                let m += 1
            endif
            " no final ' ' added...formatting looks better done later
            if bc > 1
                let n .= ' '
            endif
            let bc -= 1
    endfor
        " add modified label [n+] where n pages in tab are modified
        if m > 0
            let s .= '[' . m . '+]'
        endif
        " select the highlighting for the buffer names
        " my default highlighting only underlines the active tab
        " buffer names.
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " add buffer names
        if n == ''
            let s.= '[New]'
        else
            let s .= n
        endif
        " switch to no underlining and add final space to buffer list
        let s .= ' '
    endfor
    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'
    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLineFill#%999Xclose'
    endif
    return s
endfunction

" }}}

" vim:foldmethod=marker:foldlevel=0
