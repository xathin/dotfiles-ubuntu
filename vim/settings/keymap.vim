" =======================================
" General vim sanity improvements
" =======================================
"
"
" alias yw to yank the entire work 'yank inner word'
" even if the cursor is half way inside the word
" FIXME: will not properly repeat when you use a dot (tie to repeat.vim)
nnoremap <leader>yw yiww

" ,ow = 'overwrite word', replace a word with what's in the yank buffer
" FIXME: will not properly repeat when you use a dot (tie to repeat.vim)
nnoremap <Leader>ow "_diwhp

" make Y consistent with C and D
nnoremap Y y$
function! YRRunAfterMaps()
  nnoremap Y :<C-U>YRYankCount 'y$'<CR>
endfunction

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" ,# Surround a word with #{ruby interpolation}
map <leader># ysiw#
vmap <leader># c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map <leader>" ysiw"
vmap <leader>" c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map <leader>' ysiw'
vmap <leader>' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map <leader>( ysiw(
map <leader>) ysiw)
vmap <leader>( c( <C-R>" )<ESC>
vmap <leader>) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map <leader>] ysiw]
map <leader>[ ysiw[
vmap <leader>[ c[ <C-R>" ]<ESC>
vmap <leader>] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map <leader>} ysiw}
map <leader>{ ysiw{
vmap <leader>} c{ <C-R>" }<ESC>
vmap <leader>{ c{<C-R>"}<ESC>

map <leader>` ysiw`

" gary bernhardt's hashrocket
imap <c-l> <space>=><space>

" Change inside various enclosures with Alt-" and Alt-'
" The f makes it find the enclosure so you don't have
" to be standing inside it
nnoremap <A-'> f'ci'
nnoremap <A-"> f"ci"
nnoremap <A-(> f(ci(
nnoremap <A-)> f)ci)
nnoremap <A-[> f[ci[
nnoremap <A-]> f]ci]

" Go to last edit location with ,.
nnoremap <leader>. '.

" When typing a string, your quotes auto complete. Move past the quote
" while still in insert mode by hitting Ctrl-a. Example:
"
" type 'foo<c-a>
"
" the first quote will autoclose so you'll get 'foo' and hitting <c-a> will
" put the cursor right after the quote
imap <C-a> <esc>wa

" ==== NERD tree
" F2 for nerd tree
nmap <F2> :NERDTreeToggle<CR>
" Open the project tree and expose current file in the nerdtree with Ctrl-\
nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical res 30<CR>

" ,q to toggle quickfix window (where you have stuff like Ag)
" ,oq to open it back up (rare)
nmap <silent> <leader>qc :cclose<CR>
nmap <silent> <leader>qo :copen<CR>

" move up/down quickly by using Ctrl-Up, Ctrl-Down
" which will move us around by functions
nnoremap <silent> <K> }
nnoremap <silent> <J> {
autocmd FileType ruby map <buffer> <K> ]m
autocmd FileType ruby map <buffer> <J> [m
autocmd FileType rspec map <buffer> <K> }
autocmd FileType rspec map <buffer> <J> {
autocmd FileType javascript map <buffer> <J> }
autocmd FileType javascript map <buffer> <K> {

" Ctrl-/ to toggle comments
map <C-/> :TComment<CR>
imap <C-/> <Esc>:TComment<CR>i

" Move back and forth through previous and next buffers
" with ,z and ,x
nnoremap <silent> <leader>z :bp<CR>
nnoremap <silent> <leader>x :bn<CR>

" ==============================
" Window/Tab/Split Manipulation
" ==============================
" Move between split windows by using the four directions H, L, I, N
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j

" Make gf (go to file) create the file, if not existent
nnoremap gf :e<cfile><CR>
nnoremap <C-w>f :sp +e<cfile><CR>
nnoremap <C-w>gf :tabe<cfile><CR>

" Zoom in and out of current window with ,gz
map <silent> <leader>gz <C-w>o

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Resize windows with arrow keys
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>

" create <%= foo %> erb tags using Ctrl-k in edit mode
imap <silent> <C-K> <%=  %><Esc>3hi

" create <% foo %> erb tags using Ctrl-j in edit mode
imap <silent> <C-J> <% %><Esc>2hi

" ============================
" Shortcuts for everyday tasks
" ============================
"
" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> <leader>cf :let @* = expand("%:~")<CR>
nnoremap <silent> <leader>cn :let @* = expand("%:t")<CR>

" Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" (v)im (c)ommand - execute current line as a vim command
nmap <silent> <leader>vc yy:<C-f>p<C-c><CR>

" (v)im (r)eload
nmap <silent> <leader>vr :so %<CR>

" Type ,hl to toggle highlighting on/off, and show current value.
noremap <leader>hl :set hlsearch! hlsearch?<CR>

" =========================
" Tabularize - alignment
" =========================
" Hit Ctrl-Shift-A then type a character you want to align by
nmap <C-A> :Tabularize /
vmap <C-A> :Tabularize /

" =========================
" SplitJoin plugin
" =========================
nmap sj :SplitjoinSplit<cr>
nmap sk :splitjoinJoin<cr>

" Get the current highlight group. Useful for then remapping the color
map <leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."), 1), "name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line"."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" ,hp = html preview
map <silent> <leader>hp :!open -a chromium-browser %<CR><CR>
