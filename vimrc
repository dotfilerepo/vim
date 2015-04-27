" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" appearance
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" # tell vim it's in a terminal
set t_Co=256

" # default colorscheme
colorscheme molokai
let g:rehash256 = 1

" # set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" encoding
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Set utf8 as standard encoding
set encoding=utf8

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" general behaviour
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" # shows the leaderkey in the right corner when awaiting a command
set showcmd

" # disables startmessage
set shortmess+=I

" # turn backup off, (most stuff is in svn, git, ...)
set nobackup
set nowb
set noswapfile

" # searching behaviour
" ## incremental search
set incsearch
set splitright
set ignorecase
set smartcase

" # allow hidden buffers
set hidden

" # always keep statusline
set laststatus=2

" # status line height
" set cmdheight=2

" # set to auto read when a file is changed from the outside
set autoread

" # automatically change working directory
" set autochdir

" # root always in home
set path=$HOME/**

" # show line numbers
set number

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" mappings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" # set leader key
let mapleader="\<Space>"
let maplocalleader="\<Space>"

" in general:
" mappings can be thought of like a tree of namespaces
" -> only the most important ones should be at toplevel
" -> others should be accessible through subtrees
"       	that group certain families of commands
"       -> subtree access:
"       	<leader> normal and visual mode
"       	<c>     insert mode
" -> refinement keys
"       (to work down the subtrees and should be the same in all modes)
"       -> movement: hjkl,HJKL
" 	-> switching between two alternatives: u,i
" 	-> toggeling an option: n
" + ex command access:
"	+ run commnd:
"	  (nmode, vmode)
nnoremap <leader>r :
vnoremap <leader>r :
" + normal mode access;
"	+ from insert mode:
inoremap jk <esc>
" 	+ from all other modes: <esc>
" + visual mode access;
"	+ normal visual mode
"	  v
"	+ block visual mode
nnoremap <leader>vk <c-V>
"	+ line visual mode
nnoremap <leader>vl V

" + movement:
"	+ (nmode):
"         one-step moves: hjkl
noremap H 0
noremap L $

" + text movement (bubbling):
"	+ normal mode:
"	  (line up -> NEEDS REWORKING)
nnoremap <leader>k ddkP
"	  (line down -> NEEDS REWORKING)
nnoremap <leader>j ddp
"	  (indent line)
nnoremap <leader>l >>_
"	  (unindent line)
nnoremap <leader>h <<_
"	+ visual mode:
"	  (selected block up)
vnoremap <leader>k xkP`[V`]
"	  (selected block down)
vnoremap <leader>j xp`[V`]
"	  (selected block indent)
vnoremap <leader>l >gv
"	  (selected block unindent)
vnoremap <leader>h <gv

" + buffer/file commands:<leader>f
" 	+reload the current file
nnoremap <leader>ff :o<CR>
"	+ create a new buffer
nnoremap <leader>fu :enew<CR>
"	+ show buffers/files (think of file group)
nnoremap <leader>fs :buffers<CR>
"	+ open every loaded buffer in a window
nnoremap <leader>fG :unhide<CR>
" 	+ deleting buffer from list
nnoremap <leader>fo :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap - :bp<bar>sp<bar>bn<bar>bd<CR>
" :bdelete<CR>
" 	+ forcefully deleting buffer from list
nnoremap <leader>fO :bdelete!<CR>
" 	+ save buffer/file
nnoremap <leader>fw :w<CR>
"	+ save buffer/file as
nnoremap <leader>fW :browse confirm saveas<CR>
"	+ ...

" + explorer commands
"	+ open explorer
"	  (think of: enter explorer)
nnoremap <leader>ee :Explore<CR>
"	+ open explorer in a split window
nnoremap <leader>es :Sexplore<CR>
"	+ open explorer in a new tab
nnoremap <leader>et :Texplore<CR>
"	+ close explorer
nnoremap <leader>eo :bdelete<CR>

" + window commands: <leader>w
"	+ create vertical windows:
"	  (normal mode)
nnoremap <leader>wu <c-w>s
"	+ create vertical windows:
"	  (normal mode)
nnoremap <leader>wi <c-w><c-v>
"	+ close window:
"		+ close current window
nnoremap <leader>wo <c-w><c-q>
"		+ close all other windows
nnoremap <leader>wO <c-w>o
"	"	+ move windows:
"		+ to left
nnoremap <leader>wH <c-w>H
"		+ to right
nnoremap <leader>wL <c-w>L
"		+ up
nnoremap <leader>wK <c-w>K
"		+ down
nnoremap <leader>wJ <c-w>J
"		+ cycle
nnoremap <leader>wN <c-w>r
" 		+ to new tab page
nnoremap <leader>wt <c-w>T
" 	+ maximize current window
nnoremap <leader>w+ <c-w>w |
" 	+ resize windows
nnoremap <leader>w# <c-w> =

" + tab commands: <leader>t
"	+ create tabs:
"	  (normal mode)
nnoremap <leader>u :tabnew<CR>
"	+ close tabs:
"		+ close current tab
"	  	  (normal mode)
nnoremap <leader>to :tabclose<CR>
"	 	+ close all tabs
"		  (normal mode)
nnoremap <leader>tO :tabclose<CR>
"	+ move tabs:
"		+ tabpage to left
nnoremap <leader>tH :tabmove +1<CR>
"		+ tabpage to right
nnoremap <leader>tL :tabmove -1<CR>
"	+ switch tabs:
nnoremap <leader>tl :tabnext<CR>
nnoremap * :tabnext<CR>
nnoremap <leader>th :tabprevious<CR>
nnoremap ' :tabprevious<CR>
"	+ show tabs;
"	  (normalmode)
nnoremap <leader>ts :tabs<CR>

" + environment commands: <leader>a
"	shortcut 'a' is not that intuitiv,
"	but e is needed for buffers ...
"	mnemonic: "_a_utomat configuration"
"	+ vimrc
"		+ split & edit:
nnoremap <leader>ae :tabnew $MYVIMRC<cr>
"		+ resource
nnoremap <leader>as :so $MYVIMRC<cr>
"	+ help (by default opens help in a new buffer)
cnoremap help vert help
" shortcut to opening the help
"	(mnemonic: think of manual)
nnoremap <leader>m :vert help

" # leave vim
" noremap <leader>qq :q<cr>
" # forcefully leave vim
" noremap <leader>qf :q!<cr>

" alternative movement mappings
nnoremap <c-l> <c-w>w
nnoremap <c-h> <c-w>W
nnoremap <c-k> :bprevious<cr>
nnoremap <c-j> :bnext<cr>
nnoremap <c-u> :tabprevious<cr>
nnoremap <c-i> :tabnext<cr>

" searching
nnoremap s /
nnoremap S ?

" compatibility mappings
" make vim shortcuts compatible with usual workflow
" ## saving: <c-s> to save the file
" 	(NEEDSFIX: if the file is new the browser should file up and ask for a
" 	name, otherwise just silently store the file...)
nnoremap <c-n> :enew<cr>
nnoremap <silent> <c-s> :update<cr>
inoremap <silent> <c-s> <esc>:update<cr>a
vnoremap <silent> <c-s> <esc>:update<cr>v
nnoremap <c-z> u
inoremap <c-z> <esc>ui
vnoremap <c-z> <esc>uv
" ## communicating with the external world: copying and pasting to the clipboard register
" ### copying to the clipboard register
" 	(+ is the cut buffer, * is the selection buffer)
vnoremap <c-c> "+y
" cutting: deleting selected text and storing it in the clipboard register *
vnoremap <c-c>c "+d
" pasting to the clipboard register
nnoremap <c-v> "+p
inoremap <c-v> <esc>"+pa

" ## helpers
" autocomment and decomment blocks of code
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
" normal mode: double current line
nnoremap <c-d> Yp
" insert mode: double current line
inoremap <c-d> <esc>
" visual mode: double current selection
" MISSING!

" some switches for the environment:<leader>g
"	as a mnemonic think of "gear"...
nnoremap <leader>gr :set relativenumber!<CR>
nnoremap <leader>gn :set number!<CR>
" ## folding
" ### toggle folding
nnoremap <leader>gf za

" # BDSM: discipline to forget old habits
" ## no more arrow keys to navigate
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" ## diable <c-z>: default - forces vim to shut down which is horrible
noremap <c-z> <nop>
noremap : <esc>:echo "WRONGWRONGWORNG"<cr>
noremap / <nop>
" ## disable recording shit...
noremap q <nop>
" ## disable runmode
noremap Q <nop>
" ## inoremap <BS> <nop>
" nnoremap n <nop>
" nnoremap N <nop>

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" abbreviations
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ## general useful abbreviations
iabbrev  @@ jul.mue@hotmail.de

" ## correcting typos
" ### german spelling mistakes
iabbrev udn und

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" code folding
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set foldmethod=indent   "fold based on indent
set foldnestmax=0     "deepest fold is 10 levels
set foldenable        "dont fold by default
set foldlevel=0         "this is just what i use


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" language extensions
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

filetype on
if has("autocmd")
augroup vimrcFiletype
	autocmd!
   	autocmd BufNewFile,BufRead *.md 	setfiletype markdown
    	autocmd BufNewFile,BufRead *.pl 	setfiletype prolog
    	autocmd BufNewFile,BufRead *.plt 	setfiletype prolog
    	autocmd BufNewFile,BufRead *.prolog 	setfiletype prolog
	autocmd BufNewFile,BufRead *.hs 	setfiletype haskell
	autocmd BufNewFile,BufRead *.cabal	setfiletype cabal
	autocmd BufNewFile,BufRead *.vimrc 	setfiletype vim
	autocmd BufNewFile,BufRead *.vim	setfiletype vim
	autocmd BufNewFile,BufRead *.tex	setfiletype tex
	autocmd BufNewFile,BufRead *.html	setfiletype html
	" Haskell Syntax Highlighting
	autocmd FileType haskell 		setlocal ts=8 sts=4 sw=4 expandtab
	autocmd FileType haskell 		nnoremap <buffer> <leader>gc I-- <esc>
	autocmd FileType cabal 			setlocal ts=8 sts=4 sw=4 expandtab
	autocmd FileType tex			setlocal ts=8 sts=4 sw=4
	autocmd FileType html			setlocal ts=8 sts=4 sw=4
	" Commenting blocks of code.
	autocmd FileType c,cpp,java,scala 	let b:comment_leader = '// '
	autocmd FileType sh,ruby,python   	let b:comment_leader = '# '
	autocmd FileType conf,fstab      	let b:comment_leader = '# '
	autocmd FileType tex              	let b:comment_leader = '% '
	autocmd FileType vim              	let b:comment_leader = '" '
	autocmd FileType haskell		let b:comment_leader = '-- '
augroup end
endif

if has("autocmd")
augroup deleteTrailingWs
	autocmd!
	autocmd BufWritePre *.hs :call <SID>DeleteTrailingWS()
	autocmd BufWritePre *.cabal :call <SID>DeleteTrailingWS()
	autocmd BufWritePre vimrc :call <SID>DeleteTrailingWS()
augroup end
endif

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" utf8 support
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ### math stuff
inoremap <c-c>+a α
inoremap <c-c>#a Α
inoremap <c-c>+b β
inoremap <c-c>#b Β
inoremap <c-c>+c γ
inoremap <c-c>#c Γ
inoremap <c-c>+d δ
inoremap <c-c>#d Δ
inoremap <c-c>+e ε
inoremap <c-c>#e Ε
inoremap <c-c>+f ζ
inoremap <c-c>#f Ζ
inoremap <c-c>+h η
inoremap <c-c>#h Η
inoremap <c-c>+i θ
inoremap <c-c>#i Θ
inoremap <c-c>+j ι
inoremap <c-c>#j I
inoremap <c-c>+k κ
inoremap <c-c>#k Κ
inoremap <c-c>+l λ
inoremap <c-c>#l Λ
inoremap <c-c>+m μ
inoremap <c-c>#m Μ
inoremap <c-c>+n ν
inoremap <c-c>#n Ν
inoremap <c-c>+x ξ
inoremap <c-c>#x Ξ
inoremap <c-c>+o ο
inoremap <c-c>#o Ο
inoremap <c-c>+p π
inoremap <c-c>#p Π
inoremap <c-c>+r ρ
inoremap <c-c>#r Ρ
inoremap <c-c>+s σ
inoremap <c-c>#s Σ
inoremap <c-c>+t τ
inoremap <c-c>#t Τ
inoremap <c-c>+y υ
inoremap <c-c>#y Υ
inoremap <c-c>+v φ
inoremap <c-c>#v Φ
inoremap <c-c>+x χ
inoremap <c-c>#x Χ
inoremap <c-c>+z ω
inoremap <c-c>#z Ω

" |o|bject |to/2|
inoremap <c-c>o2 →
" |v|ariant |to/2|
inoremap <c-c>v2 ⊃
" |c|onditional |to/2|
inoremap <c-c>c2 ↦
inoremap <c-c>m2 ⇒
inoremap <c-c>oe ↔
inoremap <c-c>ve ≡
inoremap <c-c>me ⇔
inoremap <c-c>oa ∧
inoremap <c-c>va &
inoremap <c-c>ma ⩓
inoremap <c-c>oo ∨
inoremap <c-c>mo ⩔
inoremap <c-c>on ¬
inoremap <c-c>vn ˜
inoremap <c-c>fa ∀
inoremap <c-c>ex ∃
inoremap <c-c>mn ◻
inoremap <c-c>mp ⋄
inoremap <c-c>to ⊤
inoremap <c-c>bo ⊥
inoremap <c-c>ot ⊢
inoremap <c-c>mt ⊨
inoremap <c-c>ne ≠
inoremap <c-c>in ∈
inoremap <c-c>ou ∉
" em|pty
inoremap <c-c>em ∅
inoremap <c-c>le ≤
inoremap <c-c>ge ≥
" su|bs|et
inoremap <c-c>bs ⊂
" su|p|per|s|et
inoremap <c-c>ps ⊃
" su|b|set of |e|qual
inoremap <c-c>be ⊆
" su|p|erset of |e|qual
inoremap <c-c>se ⊇
" |i|nter|s|ection
inoremap <c-c>is ∩
" |un|ion
inoremap <c-c>un ∪
" |i|nter|S|ection
inoremap <c-c>iS ⊓
" |uN|ion
inoremap <c-c>uN ⊔
inoremap <c-c>sr ⊏
inoremap <c-c>br ⊐
inoremap <c-c>sm ⊑
inoremap <c-c>vi ⊒
inoremap <c-c>Mu ⋃
inoremap <c-c>Mi ⋂
inoremap <c-c>Ma ⋁
inoremap <c-c>Mo ⋀
inoremap <c-c>cr ×
inoremap <c-c>ti ⨂
inoremap <c-c>pl ⨁
" math capital bold font
inoremap <c-c>bN ℕ
inoremap <c-c>bZ ℤ
inoremap <c-c>bQ ℚ
inoremap <c-c>bR ℝ
inoremap <c-c>bC ℂ

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" testing area - they have to prove themselves...
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ## quoting
" normal mode: puts double quotes around the current word: "<word>"
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" normal mode: puts single quotes around the current word: '<word>'
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" visual mode: puts double quotes around the currently selected block
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>

nnoremap z <c-R>
nnoremap c zz

" close buffer without closing window
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" functions
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Delete trailing white space on save
function! <SID>DeleteTrailingWS()
    "Save last search and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    "Do the business:
    %s/\s\+$//e
    "Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l,c)
endfunction

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" plugin configuration
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" # easymotion
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
nmap J <Plug>(easymotion-s2)
nmap K <Plug>(easymotion-s)
" map h <Plug>(easymotion-F)
" map l <Plug>(easymotion-f)

" bufferline
let g:bufferline_rotate = 1
let g:bufferline_active_buffer_left = '>>> '
let g:bufferline_active_buffer_right = ' <<<'
let g:bufferline_fixed_index = 0 "always first
let g:bufferline_inactive_highlight = 'StatusLineNC'
let g:bufferline_active_highlight = 'Keyword'

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" plugin configuration
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" TODO and IDEAS
" vertiaclly align selection in visual block
" move visually selected block
" working with multiplity:
" invent good mappings for creating vertical and horizontal windows
" new tabs and close tabs,
" cycling through buffers and allthe like
" resizing windows, fullscreen
"
" shortcut to cycle between different colorschemes ...
" 	would be good if the colorschems could be selected...
" for complentary mappiings always use +# combination
" ...
