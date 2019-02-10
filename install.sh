#!/bin/bash

. ./centos7-source-install-vim/install.sh

yum install -y cmake3


git clone https://github.com/gmarik/Vundle.vim.git  ~/.vim/bundle/Vundle.vim 
yum  install -y clang-devel clang  clang-analyzer

mkdir -p ~/.vim/bundle && \
  git clone https://github.com/Valloric/YouCompleteMe.git \
  ~/.vim/bundle/YouCompleteMe


cd ~/.vim/bundle/YouCompleteMe


git submodule update --init --recursive

./install.sh  --clang-completer

cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py  ~



cat > ~/.vimrc <<EOF
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()

filetype plugin indent on

let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_confirm_extra_conf=0
let g:ycm_key_invoke_completion = '<C-a>'
set completeopt=longest,menu
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
EOF



sed -i  '/^flags/i--FLAGS--' ~/.ycm_extra_conf.py
sed -i '/^flags/,/^]/d' ~/.ycm_extra_conf.py


sed -i $'/FLAGS/s/--FLAGS--/flags = [\'std=c99\',\\n\'-Wall\',\\n\'-Wextra\',\\n\'-Werror\',\\n\'-fexceptions\',\\n\'-DNDEBUG\',\\n\'-x\',\\n\'c\',\\n\'-isystem\',\\n\'\/usr\/include\',]/' ~/.ycm_extra_conf.py

sed -i '/^if platform/d' ~/.ycm_extra_conf.py
sed -i $'/append( \'-std=c++/d' ~/.ycm_extra_conf.py
