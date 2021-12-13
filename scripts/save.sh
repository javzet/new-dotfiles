#! /bin/bash


if [[ $1 ]]
then
  language=$1
else
  echo "You must provide a languaje (es or en)"
  exit
fi

function create_dir () {
  local path=$1

  if [[ -d $path ]]
  then
    return
  else
    mkdir $path
  fi
}

function create_main_dir () {
  if [[ $language == "es" ]]
  then
    main_dir=$HOME/Documentos/dotfiles
    create_dir "$main_dir"
  elif [[ $language == "en" ]]
  then
    main_dir=$HOME/Documents/dotfiles
    create_dir "$main_dir"

    if [[ $? == 1 ]]
    then
      echo "Probably you provided an incorrect language";
      exit
    fi
  else
    echo -e "Language $language is not valid (valid languages: en - es)"
    exit
  fi
}

create_main_dir

# cp -R $HOME/.vim $main_dir

mkdir $main_dir/.vim
cp $HOME/.vim/init.vim $main_dir/.vim
cp $HOME/.vim/.vimrc $main_dir/.vim

cp -R $HOME/.config/bspwm $main_dir
cp -R $HOME/.config/sxhkd $main_dir
cp -R $HOME/.config/polybar $main_dir
cp $HOME/.config/picom.conf $main_dir

function create_git_backup () {
  cd $main_dir
  git init
  git add .
  git commit -m "Saved dotfiles"
  git branch -M main

  echo -e "Now you can run this command:\ngit remote add origin {your_repository_url}\nand then run this:\ngit push -u origin main"
}

ended=0

while : ; do
  echo -e "Do you want to create a git backup? [Y/N] "
  read asw

  if [[ $asw == "y" || $asw == "Y" ]]
  then
    create_git_backup
    ended=1
    break
  elif [[ $asw == "n" || $asw == "N" ]]
  then
    echo "Script ended successfully"
    ended=1
    break
  else
    echo "Invalid option"
  fi

  [[ $ended == "1" ]] || break
done

if [[ $ended == 1 ]]
then
  exit
fi
  
