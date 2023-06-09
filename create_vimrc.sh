#!/bin/bash
#
#COLORES (SE NE AGGIUNGERANNO MAN MANO)
rojo='\033[1;31m'
verde='\033[1;32m'
azul='\033[1;34m'
reset='\033[0m'

echo -e "${verde}Welcome${reset}${azul} $USER${reset}"

#Crea el archivo .vimrc
vimrc_file=~/.vimrc

#Verificar si el archivo .vimrc existe
if [ -f "$vimrc_file" ]; then
	echo ".vimrc exist already. No changes will be made."
else
	#Crea el .vimrc
	echo 'source ~/.vim/settings.vim' > "$vimrc_file"
fi

#CREATING DIR .VIM IN CASE DOESN'T EXIST
cartella="$HOME/.vim"

if [ ! -d "$cartella" ]; then
	echo "dir doesn't exist. Creating..."
	mkdir -p "$cartella"
	echo "Directory successsfully created"
else
	echo "Dir already exist, no change made"
fi

# Crea el archivo settings.vim dentro de vim
echo 'filetype plugin indent on
set backspace=indent,eol,start
syntax on
set history=300
set nocompatible
set wildmenu
set wildmode=full
set mouse=a

set path+=**
set relativenumber
set number
set autoindent

set cursorline
set noswapfile

set splitbelow
set splitright
set complete-=i
set foldlevelstart=2
set ttyfast
set showcmd ruler laststatus=2
set scrolloff=5
let c_comment_strings=1

set hlsearch

if 1
	nohlsearch
endif

set nobackup
set encoding=utf8
set noexpandtab shiftwidth=4 tabstop=4
set include=
let g:netrw_winsize=15
nnoremap ] :call TheNext()<CR>
nnoremap [ :call ThePrev()<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-z> :wqa<CR>
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap L <end>
nnoremap H <home>
nnoremap <space> :Lexplore<CR>
nnoremap <leader>t :terminal<CR>

"commenter
nnoremap cc :normal Hi//jkj<CR>

"uncommenter
nnoremap ,c :normal Hxxj<CR>
function! TheNext()
	if exists ( "'"*tabpagenr"'" ) && tabpagenr("'"$"'") != 1
		normal gt
	else
		execute ":bnext"
	endif
endfunction

function! ThePrev()
	if exists ( "'"*tabpagenr"'" ) && tabpagenr("'"$"'") != 1
		normal gT
	else
		execute ":bprev"
	endif
endfunction
vnoremap <S-j> :m "'">+1<CR>gv=gv
vnoremap <S-k> :m "'"<-2<CR>gv=gv' > ~/.vim/settings.vim

echo -e "${verde}Progress\n${reset}"

for ((percent=0; percent<=100; percent++)); do
	sleep 0.01

# Borra el prograso anterior y muestra el nuevo
	echo -ne "\r$percent% "

#Aggiunge una barra di progresso
	for ((i=0; i<percent/10; i++)); do
		echo -n '🟩'
	done
done
echo -e "\n"

echo 'source ~/.vim/settings.vim' > "$vimrc_file"
echo -e "${azul}The .vimrc and the settings are correctly created. Well done!!${reset}"
echo  -e "Waiting for the end of the evaluation. Write ${rojo}"FINISH"${reset} to close the program"
read respuesta
flag=0

while [ "$flag" -eq 0 ]
do
	if [ "$respuesta" = "FINISH" ]; then
		echo "" > ~/.vimrc
		rm -rf ~/.vim/settings.vim
		echo -e "${rojo}Erasing\n"
		
		for ((percent=0; percent<=100; percent++)); do
			sleep 0.01
		
		# Borra el prograso anterior y muestra el nuevo
			echo -ne "\r$percent% "
		
		#Aggiunge una barra di progresso
			for ((i=0; i<percent/10; i++)); do
				echo -n '🟥'
			done
		done
		echo -e "\n"
		echo -e "${verde}vimrc correctly cleaned${reset}"
		flag=1
	else
		echo -e "Word sentence is not correct. Please insert ${rojo}FINISH${reset}"
		flag=0
		read respuesta
	fi	
done
