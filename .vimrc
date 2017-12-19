"Windows setup
"============================================================================================
if has("win32")
    let s:editor_root=expand("~/vimfiles")
else
    let s:editor_root=expand("~/.vim")
endif



"Vundle setup
"============================================================================================
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'gmarik/Vundle.vim'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Plug setup
"============================================================================================
if empty(glob(s:editor_root . '/autoload/plug.vim'))
    autocmd VimEnter * echom "Downloading and installing vim-plug..."
    silent execute "!curl -fLo " . s:editor_root . "/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall
endif

call plug#begin(s:editor_root . '/plugged')
Plug 'scrooloose/syntastic'           , { 'on': [] }
Plug 'kien/ctrlp.vim'                 , { 'on': [] }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'klen/python-mode'          , { 'for': 'python' }
Plug 'valloric/youcompleteme'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
"  sudo apt-get install build-essential cmake
"  cd ~/.vim/plugged/youcompleteme
"  ./install.py
"
Plug 'ervandew/supertab'
"Plug 'python_match.vim'          , { 'for': 'python' }
"Plug 'vim-airline/vim-airline'        , { 'on': [] }
"Plug 'vim-airline/vim-airline-themes' , { 'on': [] }
"Plug 'tpope/vim-git'                  , { 'on': [] }
"Plug 'airblade/vim-gitgutter'         , { 'on': [] }
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-commentary'
"Plug 'tomtom/tcomment_vim'
"Plug 'Raimondi/delimitMate'
"Plug 'edkolev/promptline.vim'
"Plug 'sjl/gundo.vim'
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'edkolev/tmuxline.vim'
"Plug 'easymotion/vim-easymotion'
" Python modules
"Plug 'fisadev/vim-isort'         , { 'for': 'python' }
"Plug 'jmcantrell/vim-virtualenv' , { 'for': 'python' }
"Plug 'davidhalter/jedi-vim'      , { 'for': 'python' }
"Plug 'ekalinin/Dockerfile.vim'
" Nodejs plugins
"Plug 'moll/vim-node'                , { 'for': 'javascript'}
"Plug 'jelera/vim-javascript-syntax' , { 'for': 'javascript'}
"Plug 'myhere/vim-nodejs-complete'   , { 'for': 'javascript'}
"Plug 'jamescarr/snipmate-nodejs'    , { 'for': 'javascript'}
" Powershell syntax
"Plug 'https://github.com/PProvost/vim-ps1', { 'for': ['ps1', 'powershell', 'psm1']}
" Haskell plugins
" http://www.stephendiehl.com/posts/vim_2016.html
"Plug 'Shougo/neocomplete.vim'
"Plug 'Shougo/vimproc.vim'
"Plug 'eagletmt/ghcmod-vim'      , { 'for': 'haskell'}
"Plug 'eagletmt/neco-ghc'        , { 'for': 'haskell'}
"Plug 'begriffs/haskell-vim-now' , { 'for': 'haskell'}
"Plug 'arcticicestudio/nord-vim'
" Note taking plugins
"Plug 'vimwiki/vimwiki'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'tpope/vim-markdown'
" Plug 'gabrielelana/vim-markdown'
" Plug 'plasticboy/vim-markdown'
call plug#end()

" Load plugins
call plug#load('syntastic','ctrlp.vim')
"
" Load plugins on insert
"============================================================================================
augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('syntastic','ctrlp.vim') | autocmd! load_us_ycm
augroup END


" add other config
"============================================================================================
exec "source " . s:editor_root . "/functions.vim"
exec "source " . s:editor_root . "/config.vim"
exec "source " . s:editor_root . "/mappings.vim"
exec "source " . s:editor_root . "/autocmds.vim"
