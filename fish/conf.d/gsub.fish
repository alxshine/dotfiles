function gsub --wraps='git submodule update --init --recursive' --description 'alias gsub git submodule update --init --recursive'
  git submodule update --init --recursive $argv
        
end
