set mouse=a         "souris dans le terminal"

set nocompatible    "mode compatibilité vi"

set autochdir 	    "change le rep. courant de vim pour celui du fichier en cours d'édition"
set backup 	        "effacer l'ancien back-up par le courant et active le backup :]"

set linebreak 	    "coupe les lignes trop longues (au mot près)"

syntax enable       "syntaxe"
:syntax on          "let syntax on"

set ignorecase      "ignore la casse pour la recherche"
set incsearch 	    "affiche les résultats de la recherche au fur et à mesure de la frappe"
set hlsearch 	      "higlight search"

filetype indent plugin on 	    "à tester"
autocmd FileType c set cindent  "indentation c quand filetype c :)"

set autoindent 			"indentation lors du passage à la ligne"
set smartindent 		"modifie l'indentation si on est en fin de bloc (entre autre)"
set shiftwidth =2 	"nombre d'espaces utilisés pour l'INDENTATION (après un if, l'appui sur enter insère une nouvelle indentation de deux espaces)"
set tabstop    =2	  "le caractère TAB est interprété à l'écran comme deux espaces"
set softtabstop=2 	"la touche TAB insère deux espaces"
set expandtab 			"la touche TAB insère de vrais esapces"

set foldmethod=indent 						
autocmd FileType c      set foldmethod=syntax   "auto fold syntaxique uniquement pour c"
autocmd Filetype tex    set foldmethod=syntax
autocmd Filetype python set foldmethod=syntax

set makeprg=gcc\ -Wall\ -o\ %<\ %

set encoding    =utf8
set fileencoding=utf8

set history        =50 	  "commandes"
let MRU_Max_Entries=140

set title 		      "affiche le titre du fichier dans le titlebar"
set titlestring=%F\ %r\ %m
"set cursorline		  "souligne ligne courante""
set novisualbell    "set vb t_vb="""
set showcmd 		    "affiche la commande dans la ligne de statut"
set showmode 		    "affiche le mode dans la ligne de statut"
set showmatch 		  "met en évidence les parenthèses"
"set number 		    "pas beau""

set backupdir=/$HOME/.Back-up/vim
set directory=/$HOME/.Back-up/vim/tmp
set undodir=/$HOME/.Back-up/vim/tmp
set undofile                          "undo même après avoir fermé le fichier"

""""""""""""""""""""""""""""""""
" Mapping                      "
""""""""""""""""""""""""""""""""
map  <F2>  :s/^\(.*\)$/#\1/g<CR>  "Uncomment selected Block thats commented with #'s"
map  <F3>  :s/^#//g<CR>
map  <F4>  :make 

map  <F6>  :noh<CR>
nmap <F7> <ESC>:call LoadSession()<CR>
map  <F8>  :mksession!<CR>
map  <F10> :MRU

map ; qb                          " ; pour enregistrer une macro dans 'a'"
map , @b                          " , pour répéter la macro stockée dans 'a'"
inoremap <Tab> <C-R>=MyTabOrComplete()<CR>
"imap <Tab> <C-P>

cmap w!! %!sudo tee > /dev/null %
imap jj <ESC>

autocmd BufRead   *.*         set nohlsearch
autocmd BufRead   *.c,*.h     set ft=c 	        "filetype c quand fichier c"
autocmd BufRead   *.lua       set ft=lua
autocmd BufRead   *.txt       set ft=markdown
autocmd BufRead   *.markdown  set ft=markdown
"autocmd BufEnter  *.txt       set background=light"
"autocmd BufEnter  *.markdown  set background=light"
autocmd BufEnter  *.rc        set background=dark
autocmd BufEnter  *.c,*.h     set background=dark
"autocmd VimEnter :MRU<CR> "

""""""""""""""""""""""""""""""""
" fonction complétion          "
""""""""""""""""""""""""""""""""
function MyTabOrComplete()
	let col = col('.')-1
	if !col || getline('.')[col-1] !~ '\k'
		return "\<tab>"
	else
		return "\<C-N>"
	endif
endfunction

""""""""""""""""""""""""""""""""
" fonctions gestion de session "
"                              "
" à utiliser avec :mksession   "
" attention, utiliser :qa pour "
" que ça marche bien           "
""""""""""""""""""""""""""""""""
let s:sessionloaded = 0
function LoadSession()
	  source Session.vim
		let s:sessionloaded = 1
endfunction
function SaveSession()
  if s:sessionloaded == 1
    mksession!
  end
endfunction

" *********************************************"
" positionne le curseur au dernier emplacement "
" connu à l'ouverture d'un fichier             "
" *********************************************"
autocmd BufReadPost * 
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif

let &showbreak='└─> '
"let &showbreak=' ↳ '

"colorscheme anotherdark
"colorscheme solarized
"colorscheme zenburn
colorscheme oceandeep
set background=dark

map <F5> :!%<
