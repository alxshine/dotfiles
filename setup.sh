#!/bin/bash

config_dir="${HOME}/.config"
current_dir=$(pwd)

dialog(){
    read -p "configure ${1}? [Y/n]" response
    if [[ $response == "n" ]]; then
        echo "Not configuring ${1}"
        return 1
    else
        echo "configuring ${1}"
        return 0
    fi
}

configure(){
    read -p "configure ${1}? [Y/n]" response
    if [[ $response == "n" ]]; then
        echo -e "Not configuring ${1}"
        return 1
    fi
    echo "Configuring ${1}"
    link_file ${1} ${2}
}

link_file(){
    if [ -z "${2+x}" ]; then
        echo "No base directory provided, assuming ${config_dir}"
        base_dir="$config_dir"
    else
        base_dir="$2"
    fi

    target_file="${base_dir}/${1}"
    target_dir=$(dirname "${base_dir}/${1}")

  # create target_dir if necessary
  if [ ! -d $target_dir ]; then
      echo "${target_dir} does not exist, creating"
      mkdir -p $target_dir
  fi

  # save old init file if necessary
  if [ -f $target_file ]; then
      echo "File ${target_file} already exists, aborting"
      return
  fi

  echo "Creating softlink"
  ln -fs "${current_dir}/${1}" "${target_file}"

  echo -e "Done"
}

link_dir(){
    if [ -z "${2+x}" ]; then
        echo "No base directory provided, assuming ${config_dir}"
        base_dir="$config_dir"
    else
        base_dir="$2"
    fi

    target_dir="${base_dir}/${1}"
    if [ -d $target_dir ]; then
        backup_dir="${target_dir}.old"
        echo "Directory ${target_dir} already exists, aborting"
        return
    fi

    echo "Creating softlink"
    ln -s "${current_dir}/${1}" "${target_dir}"
    echo -e "Done"
}

dialog bash
if [[ $? -eq 0 ]]; then
    link_dir bash
    echo -e 'export XDG_CONFIG_HOME=$HOME/.config\nsource $XDG_CONFIG_HOME/bash/bashrc' >> $HOME/.bashrc
fi

dialog neovim
if [[ $? -eq 0 ]]; then
    link_file "nvim/init.vim"
fi

dialog doom
if [[ $? -eq 0 ]]; then
    link_dir doom
fi

dialog gdb
if [[ $? -eq 0 ]]; then
    link_dir gdb
fi

dialog vim
if [[ $? -eq 0 ]]; then
    ln -s ${current_dir}/vim/vimrc ~/.vimrc
fi

dialog tmux
if [[ $? -eq 0 ]]; then
    ln -s ${current_dir}/tmux/tmux.conf ~/.tmux.conf
fi

dialog fzf
if [[ $? -eq 0 ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

dialog gnome
if [[ $? -eq 0 ]]; then
    . gnome/settings.sh
fi

exit 0 # the rest isn't ever used

# dialog docker
# if [[ $? -eq 0 ]]; then
    # curl -fsSL https://get.docker.com/rootless | sh
# fi

# dialog rofi
# if [[ $? -eq 0 ]]; then
    # link_dir rofi
# fi

# dialog i3-gaps
# if [[ $? -eq 0 ]]; then
    # link_dir i3
# fi

