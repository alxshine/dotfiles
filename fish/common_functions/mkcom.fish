function mkcom --wraps='funcsave -d ~/.config/fish/common_functions' --description 'alias mkcom funcsave -d ~/.config/fish/common_functions'
  funcsave -d ~/.config/fish/common_functions $argv; 
end
