#! /bin/bash

dirPath=$HOME
completePath=$HOME/.custom

function create_dir () {
  echo -e "Creating dir at $dirPath\n"
  mkdir $dirPath/.custom
}

function link_files () {
  ln -s $HOME/.vim/.vimrc ~/$HOME/.vimrc
}

function copy_files () {
  local path=$completePath
 
  copy_to_dir $HOME ".vim"

  copy_to_dir $HOME/.config "sxhkd"

  copy_to_dir $HOME/.config "bspwm"

  copy_to_dir $HOME/.config "polybar"

  cp ./picom.conf $HOME/.config
}

function copy_to_dir () {
  local path=$1
  
  if [[ -d $path ]]
  then
    cp -R ./$2 $path
  else
    mkdir $path
    cp -R ./$2 $path
  fi
}

create_dir

if [[ $? == 1 ]]
then
  rm -rf $completePath
  create_dir
else
  echo -e "An error has ocurred while creation dir"
  exit
fi

copy_files
link_files
